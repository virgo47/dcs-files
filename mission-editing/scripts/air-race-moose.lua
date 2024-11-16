-- Script by 'Virgo' / Member of the Black Angels
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
-- Uses MOOSE
-- TODO spectator support: for any non racing print low unit altitude warning for the race zone

-- INITIAL SETUP, this is the stuff you can configure

local debugLog = true -- debug info to log file
local debugMessages = false -- debug messages to all players
local debugMenu = true -- Race Debug F10 menu item
if debugLog then
    env.info("RACE Script start")
end

local racingZone = ZONE:FindByName("racetrack")
local racerGroupPrefix = "AirRace-"
-- Following prefixes are used in MOOSE set FilterPrefixes() and use Lua pattern matching, which means:
-- Use % (escape character) before any of the following chars: -.%^$()[]*+?
-- Because FilterPrefixes actually filters any substring, use ^ at the start of the prefix.
local racingCheckZonePrefix = "^race%-check%-"
local killZonePrefix = "^Kill%-"

-- Kill zone behavior: 1 = kill, 2 = disqualify, any other value = no behavior
local killZoneBehavior = 1
local warningAboveAGL = 21
local killAboveAGL = 31 -- kill or disqualify, this follows killZoneBehavior setting

-- Keep the sound files in some unused trigger, e.g. "resource-files-holder" so they are note removed from the mission!
-- To make the trigger unused, add condition FLAG IS TRUE with some "NEVER" flag. Add SOUND TO ALL with all the files.
-- If any of this is nil, or the file is not found, the sound will not be played.
local enterRaceSound = "A10_AutopilotEngage.ogg"
local finishRaceSound = "520200__latranz__industrial-alarm-EINZELN.ogg"
local checkZoneSound = "Passed-checkpoi.ogg"
local killSound = "ThiesZonk.ogg"
local aglWarningSound = "altitude-warn.ogg"

-- Reference points 1000m from the start/end line - OPTIONAL, comment out if not desired.
-- Easiest way how to find it is to use the ruler in ME and read out CCS coordinates when 1000m away.
-- Don't forget the right signs!
local startRefPoint = {x = -314063, z = 895054}
local endRefPoint = {x = -313904, z = 895206}
local refDistance = 1000 -- use the same value for both points
-- "Time preciser" will be true only if all three above are set:
local timePreciser = (startRefPoint and endRefPoint and refDistance) ~= nil

local spectatorsWarningAgl = killAboveAGL * 3 -- in meters
-- Reported warning altitude is rounded to tens ft up (conversion factor is divided by 10 already):
local spectatorsWarningReportedAglRoundedFeet = math.ceil(spectatorsWarningAgl * 0.328084) * 10
local spectatorsWarningMessage = "Spectators should stay at least " .. spectatorsWarningReportedAglRoundedFeet .. " feet above the course to avoid disturbing the participants."

-- -------------------------------------------------------------------
-- DON'T CHANGE FROM HERE BELOW, UNLESS YOU KNOW WHAT YOU'RE DOING :-)
-- ADDITIONAL SETUP

local currentRacers = {} -- table storing only live racers, inside or out of the zone
local ladder = {}
local spectators = {}

local racingCheckZones = {}
-- Lua pattern matching requires % escape character before -.
-- Using ^ assures prefix behavior, otherwise any substring is matched.
SET_ZONE:New():FilterPrefixes(racingCheckZonePrefix):FilterOnce():ForEachZone(function(zone)
    table.insert(racingCheckZones, zone)
    if debugLog then
        env.info("Adding check zone: " .. zone:GetName())
    end
end)
local killZones = {}
SET_ZONE:New():FilterPrefixes(killZonePrefix):FilterOnce():ForEachZone(function(zone)
    table.insert(killZones, zone)
    if debugLog then
        env.info("Adding kill zone: " .. zone:GetName())
    end
end)

-- COMMON FUNCTIONS

-- Prints debug message to log or as a message to all, depending on the debug flags above.
local function raceDebug(message)
    if debugLog then
        env.info(message)
    end
    if debugMessages then
        MESSAGE:New(message, 5):ToAll()
    end
end

local function showRaceLeaderboard(group)
    if next(ladder) == nil then
        MESSAGE:New("No race results yet...", 10, nil):ToGroup(group)
    else
        local resultText = "RACE RESULTS"
        for unitType, results in pairs(ladder) do
            resultText = resultText .. "\n\nCategory " .. unitType .. ":\n---------------------------------------------------------------------------------------\n"
            for i, result in ipairs(results) do
                local formattedTime = timePreciser and string.format("%.2f", result.time) or tostring(result.time)
                resultText = resultText .. "  " .. tostring(i) .. ". " .. result.player .. " ... " .. formattedTime .. " s\n"
            end
        end
        MESSAGE:New(resultText, 30, nil):ToGroup(group)
    end
end

local function mapSize(map)
    local count = 0
    for _ in pairs(map) do
        count = count + 1
    end
    return count
end

local function showDebugMessage(group)
    if next(currentRacers) == nil then
        MESSAGE:New("No racers... " .. tostring(mapSize(spectators)) .. " spectator(s).", 10, nil):ToGroup(group)
    else
        local resultText = "DEBUG:\n\nkillZoneBehavior = " .. tostring(killZoneBehavior)
                .. "\nracerGroupPrefix = " .. tostring(racerGroupPrefix)
                .. "\ntimePreciser = " .. tostring(timePreciser)
                .. "\n# of racingCheckZones = " .. tostring(racingCheckZones and #racingCheckZones)
                .. "\n# of killZones = " .. tostring(killZones and #killZones)
                .. "\n# of spectators = " .. tostring(mapSize(spectators))
                .. "\n\nPLAYERS:"
        for _, racerData in pairs(currentRacers) do
            resultText = resultText .. "\n\nID: " .. tostring(_)
                    .. "\n  playerName: " .. tostring(racerData.playerName)
                    .. "\n  groupName: " .. tostring(racerData.groupName)
                    .. "\n  startTs: " .. tostring(racerData.startTs)
            if racerData.disqualified then
                resultText = resultText .. "\n  DISQUALIFIED"
            end
        end
        MESSAGE:New(resultText .. "\n", 20, nil, true):ToGroup(group)
    end
end

local function changeKillZoneBehavior(newKillZoneBehavior, group)
    killZoneBehavior = newKillZoneBehavior
    showDebugMessage(group)
end

-- Calculates purely planar distance for x and z coordinates of both structures.
local function pointDistance(point3d, point2d)
    local dx = point3d.x - point2d.x
    local dz = point3d.z - point2d.z
    return math.sqrt(dx * dx + dz * dz)
end

-- EVENT SETUP

local clientSet = SET_CLIENT:New():FilterOnce()

-- Enable handling of the events on the client set
clientSet:HandleEvent(EVENTS.PlayerEnterUnit) -- this one is for single-player (or multi-player host)
clientSet:HandleEvent(EVENTS.Birth) -- this one works for multi-player
clientSet:HandleEvent(EVENTS.PlayerLeaveUnit) -- this one works fine for both environments
clientSet:HandleEvent(EVENTS.Dead) -- to cover dedicated MP
clientSet:HandleEvent(EVENTS.Crash) -- to cover dedicated MP

-- Define what happens when a player enters a unit (or birth in MP)
function clientSet:OnEventBirth(eventData)
    self:OnEventPlayerEnterUnit(eventData)
end

function clientSet:OnEventPlayerEnterUnit(eventData)
    local unit = eventData.IniUnit
    local playerName = eventData.IniPlayerName
    local group = eventData.IniGroup
    local groupName = eventData.IniGroupName
    local clientId = eventData.IniPlayerUCID or eventData.IniPlayerName

    raceDebug("RACE Player enter: " .. tostring(playerName) .. ", group " .. groupName .. " (event.id: " .. eventData.id .. ")")

    -- Check if the group name starts with the desired prefix
    if groupName and string.sub(groupName, 1, #racerGroupPrefix) == racerGroupPrefix then
        -- Initialize data structure for the client/unit - this is used in mainRaceLoop function.
        currentRacers[clientId] = {
            playerName = playerName,
            groupName = groupName,
            unit = unit,
        }
    else
        spectators[clientId] = {
            playerName = playerName,
            groupName = groupName,
            unit = unit,
        }
    end

    -- Menu for checking leaderboard is added to any group when the client joins.
    -- There seems to be no similar functionality on the unit level, so it's best to have 1 unit in each group.
    MENU_GROUP_COMMAND:New(group, "Race Leaderboard", nil, showRaceLeaderboard, group)
    if debugMenu then
        MENU_GROUP_COMMAND:New(group, "Race Debug", nil, showDebugMessage, group)
        MENU_GROUP_COMMAND:New(group, "Kill zones: disable", nil, changeKillZoneBehavior, nil, group)
        MENU_GROUP_COMMAND:New(group, "Kill zones: set to kill", nil, changeKillZoneBehavior, 1, group)
        MENU_GROUP_COMMAND:New(group, "Kill zones: set to disqualify", nil, changeKillZoneBehavior, 2, group)
    end
end

-- 2024-11-16 12:09:33.755 INFO    SCRIPTING (Main): MOOSE error in MENU COMMAND function: [string "l10n/DEFAULT/Moose_dev_2024_06_22.lua"]:17940: attempt to call method 'F' (a nil value)
function clientSet:OnEventDead(eventData)
    self:OnEventPlayerLeaveUnit(eventData)
end

function clientSet:OnEventCrash(eventData)
    self:OnEventPlayerLeaveUnit(eventData)
end

-- Define what happens when a player leaves a unit
function clientSet:OnEventPlayerLeaveUnit(eventData)
    local playerName = eventData.IniPlayerName
    local clientId = eventData.IniPlayerUCID or eventData.IniPlayerName

    raceDebug("RACE Player leave: " .. tostring(playerName) .. " (event.id: " .. eventData.id .. ")")

    -- This can be nil, especially because this leave event is triggered twice for whatever reason.
    racerData = currentRacers[clientId]

    if racerData then
        if racerData.startTs then
            raceDebug("RACE Sadly, player " .. tostring(playerName) .. " left during the race...")
        end
        currentRacers[clientId] = nil
    end
end

-- REPEATED CHECKS and related functions

local function hasEnteredAllZones(enteredZones)
    for _, zone in ipairs(racingCheckZones) do
        if not enteredZones[zone] then
            return false
        end
    end
    return true
end

local function addResultToLadder(unitType, result)
    local unitResults = ladder[unitType]
    if not unitResults then
        unitResults = {}
        ladder[unitType] = unitResults
    end

    local playerExists = false
    -- Check if the player already has a result and update it if the new time is better
    for i, existingResult in ipairs(unitResults) do
        if existingResult.player == result.player then
            playerExists = true
            if result.time < existingResult.time then
                unitResults[i] = result
            end
            break -- we can't just return, we still want to re-sort as necessary
        end
    end

    if not playerExists then
        table.insert(unitResults, result)
    end

    table.sort(unitResults, function(a, b)
        return a.time < b.time
    end)

    -- Trim the list to keep only the top 5 results
    if #unitResults > 5 then
        for i = #unitResults, 6, -1 do
            table.remove(unitResults, i)
        end
    end
end

local function disqualify(racerData)
    racerData.disqualified = true
    racerData.startTs = nil
    if killSound then
        USERSOUND:New(killSound):ToUnit(racerData.unit)
    end
    if killZoneBehavior == 1 then
        racerData.unit:Explode(10)
    end
end

local function approximateTimeBetween(lastTs, lastPosRefDistance, now, currentRefDistance)
    local distanceDiff = math.abs(lastPosRefDistance - currentRefDistance)

    -- distance difference/speed of the unit is too small, we can just use current time
    if distanceDiff < 1 then
        raceDebug("RACE approximateTimeBetween - small distance difference, using NOW")
        return now
    end

    local timeDiff = now - lastTs
    local distFractionAfterLine = math.abs(currentRefDistance - refDistance) / distanceDiff
    raceDebug("RACE approximateTimeBetween: timeDiff=" .. tostring(timeDiff) .. ", lastPosRefDistance=" .. tostring(lastPosRefDistance)
            .. ", currentRefDistance=" .. tostring(currentRefDistance) .. ", distFractionAfterLine=" .. tostring(distFractionAfterLine))

    -- Interpolate to approximate the time when the racer would have crossed the start line
    return now - timeDiff * distFractionAfterLine
end

local function mainRaceLoop()
    for _, racerData in pairs(currentRacers) do
        local now = timer.getAbsTime()
        -- If startTs is initialized we compute the approximate time inside the zone.
        -- The default time without "time preciser" is rounded to seconds - this is also printed to the player every cycle.
        local timeInsideSeconds = racerData.startTs and math.floor(now - racerData.startTs + 0.5)
        local unit = racerData.unit
        local unitPos = unit:GetPointVec3()
        local formattedTime = tostring(timeInsideSeconds)

        local insideRacingZone = unit:IsInZone(racingZone)
        if insideRacingZone then
            if racerData.disqualified then
                MESSAGE:New("You're disqualified, leave the race track area!", 2, nil, true):ToUnit(unit)
            else
                if timeInsideSeconds then
                    MESSAGE:New("Time inside: " .. formattedTime .. " seconds", 2, nil, true):ToUnit(unit)

                    -- Check the intermediate zones
                    for _, checkZone in ipairs(racingCheckZones) do
                        if unit:IsInZone(checkZone) then
                            if not racerData.zoneCheck[checkZone] then
                                raceDebug("Player " .. racerData.playerName .. " entered the check zone " .. checkZone:GetName())
                                racerData.zoneCheck[checkZone] = true
                                if checkZoneSound then
                                    USERSOUND:New(checkZoneSound):ToUnit(unit)
                                end
                            end
                        end
                    end
                else
                    MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") entered the race!", 10):ToAll()
                    if timePreciser then
                        racerData.startTs = approximateTimeBetween(
                                racerData.lastTs, pointDistance(racerData.lastPos, startRefPoint),
                                now, pointDistance(unitPos, startRefPoint))
                    else
                        racerData.startTs = now
                    end
                    USERSOUND:New(enterRaceSound):ToUnit(unit)
                    racerData.zoneCheck = {}
                end

                -- Altitude warning and disqualification
                if killZoneBehavior == 1 or killZoneBehavior == 2 then
                    if killAboveAGL and unit:GetAltitude(true) > killAboveAGL then
                        MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") flew too high and was disqualified!", 15):ToAll()
                        disqualify(racerData)
                    elseif warningAboveAGL and unit:GetAltitude(true) > warningAboveAGL then
                        MESSAGE:New("WARNING: Reduce your altitude immediately!", 2, nil, true):ToUnit(unit)
                        if aglWarningSound then
                            USERSOUND:New(aglWarningSound):ToUnit(unit)
                        end
                    end
                end
            end
        else
            if racerData.startTs and unit:IsAlive() then
                -- the unit is NOT in zone, but has startTs - this means it's just left the zone
                if hasEnteredAllZones(racerData.zoneCheck) then
                    if timePreciser then
                        local correctedNow = approximateTimeBetween(
                                racerData.lastTs, pointDistance(racerData.lastPos, endRefPoint),
                                now, pointDistance(unitPos, endRefPoint))
                        timeInsideSeconds = correctedNow - racerData.startTs
                        formattedTime = string.format("%.2f", timeInsideSeconds)
                    end
                    MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. formattedTime .. " seconds", 20):ToAll()
                    USERSOUND:New(finishRaceSound):ToUnit(unit)

                    addResultToLadder(unit:GetTypeName(), {
                        player = racerData.playerName,
                        time = timeInsideSeconds,
                    })
                else
                    MESSAGE:New("You didn't go through the whole course, this attempt does not count.", 6, nil, true):ToUnit(unit)
                end
            end

            racerData.startTs = nil
            racerData.disqualified = nil
        end

        -- We check kill-zones after the racing zone, so we can rely on the updated value of "startTs" (or lack thereof).
        if not racerData.disqualified then
            if killZoneBehavior == 1 or killZoneBehavior == 2 then
                for _, zone in ipairs(killZones) do
                    if unit:IsInZone(zone) then
                        raceDebug("Player " .. racerData.playerName .. " in kill zone " .. zone:GetName())
                        if not insideRacingZone and killZoneBehavior == 2 then
                            MESSAGE:New("You are inside a kill zone (outside the racing area)...", 2, nil, true):ToUnit(unit)
                        else
                            disqualify(racerData)
                            MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") has left the course and was disqualified!", 15):ToAll()
                        end
                    end
                end
            end
        end

        racerData.lastTs = now
        racerData.lastPos = unitPos
    end

    -- Printing warning to spectators potentially disturbing the racers:
    for _, spectator in pairs(spectators) do
        local unit = spectator.unit
        if unit:IsInZone(racingZone) and unit:GetAltitude(true) > spectatorsWarningAgl then
            MESSAGE:New(spectatorsWarningMessage, 2, nil, true):ToUnit(unit)
        end
    end
end

-- This starts a scheduler that will call the function every second.
SCHEDULER:New(nil, mainRaceLoop, {}, 0, 1)

if debugLog then
    env.info("RACE Script end")
end
