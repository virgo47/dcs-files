-- Script by 'Virgo' / Member of the Black Angels
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
-- Uses MOOSE

-- INITIAL SETUP, this is the stuff you can configure

local debugLog = true -- debug info to log file
local debugMessages = false -- debug messages to all players
local debugMenu = true -- Race Debug F10 menu items
local logFinishResults = true -- Logs every finished race to dcs.log
local logTailSize = 30 -- number of last log messages that can be shown via F10 debug item
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
local killZoneBehavior = 2
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

local spectatorsWarningAgl = killAboveAGL * 2 -- in meters
-- Reported warning altitude is rounded to tens ft up (conversion factor is divided by 10 already):
local spectatorsWarningReportedAglRoundedFeet = math.ceil(spectatorsWarningAgl * 0.328084) * 10
local spectatorsWarningMessage = "Spectators should stay at least " .. spectatorsWarningReportedAglRoundedFeet .. " feet above the course to avoid disturbing the participants."

-- Restart support requires a trigger in the ME and a restart zone:
local restartZone = ZONE:FindByName("restart-zone")
local restartTimeoutSeconds = 10
-- add ONCE trigger with FLAG IS TRUE for this flag name with action END MISSION, winner NEUTRAL
local restartTriggerFlag = "restart"
local restartTriggered = false

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

local lastRaceLoopTs -- updated on every main race loop function for debug purposes

local restartTs -- used by "restart voting", see usages lower

-- COMMON FUNCTIONS

-- INTERNAL LOG buffer
local logTail = {}

function addLogTail(log)
    table.insert(logTail, tostring(timer.getAbsTime()) .. ": " .. log)
    if #logTail > logTailSize then
        table.remove(logTail, 1)
    end
end

function displayLogTail(group)
    local resultText = ""
    for i = 1, #logTail do
        resultText = resultText .. logTail[i] .. "\n"
    end
    MESSAGE:New(resultText, 30, nil):ToGroup(group)
end

-- Prints debug message to log or as a message to all, depending on the debug flags above.
local function raceDebug(message)
    message = "RACE " .. tostring(message)
    if debugLog then
        env.info(message)
    end
    if debugMessages then
        MESSAGE:New(message, 5):ToAll()
    end
    addLogTail(message)
end

local function leaderboardText()
    local resultText = "RACE RESULTS"
    for unitType, results in pairs(ladder) do
        resultText = resultText .. "\n\nCategory " .. unitType .. ":\n---------------------------------------------------------------------------------------\n"
        for i, result in ipairs(results) do
            local formattedTime = timePreciser and string.format("%.2f", result.time) or tostring(result.time)
            resultText = resultText .. "  " .. tostring(i) .. ". " .. result.player .. " ... " .. formattedTime .. " s\n"
        end
    end
    return resultText
end

local function showRaceLeaderboard(group)
    if next(ladder) == nil then
        MESSAGE:New("No race results yet...", 10, nil):ToGroup(group)
    else
        MESSAGE:New(leaderboardText(), 30, nil):ToGroup(group)
    end
end

local function mapSize(map)
    if not map then
        return 0
    end

    local count = 0
    for _ in pairs(map) do
        count = count + 1
    end
    return count
end

local function showDebugMessage(group)
    local resultText = "DEBUG:\n\nkillZoneBehavior = " .. tostring(killZoneBehavior)
            .. "\nracerGroupPrefix = " .. tostring(racerGroupPrefix)
            .. "\ntimePreciser = " .. tostring(timePreciser)
            .. "\n# of racingCheckZones = " .. tostring(racingCheckZones and #racingCheckZones)
            .. "\n# of killZones = " .. tostring(killZones and #killZones)
            .. "\n# of spectators = " .. tostring(mapSize(spectators))
            .. "\nspectator warning AGL = " .. tostring(spectatorsWarningAgl) .. " m => ~" .. tostring(spectatorsWarningReportedAglRoundedFeet) .. " ft"
            .. "\nlast race loop check/now = " .. tostring(lastRaceLoopTs) .. "/" .. tostring(timer.getAbsTime()) .. ") s"
            .. "\n\nPLAYERS:"
    for _, racerData in pairs(currentRacers) do
        resultText = resultText .. "\n\nID: " .. tostring(_)
                .. "\n  playerName: " .. tostring(racerData.playerName)
                .. "\n  groupName: " .. tostring(racerData.groupName)
                .. "\n  startTs: " .. tostring(racerData.startTs)
                .. "\n  checkpoints " .. tostring(mapSize(racerData.zoneCheck)) .. " of " .. tostring(#racingCheckZones)
        if racerData.disqualified then
            resultText = resultText .. "\n  DISQUALIFIED"
        end
    end
    MESSAGE:New(resultText .. "\n", 20, nil, true):ToGroup(group)
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

-- On MP servers this seems to include non-client slots as well, we will handle it in event handlers.
local clientSet = SET_CLIENT:New():FilterOnce() -- FilterStart() doesn't seem to make a difference

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
    local playerName = eventData.IniPlayerName
    -- On MP servers this may be called for non-client slots as well, we just ignore it.
    if not playerName then
        return
    end
    local unit = eventData.IniUnit
    local group = eventData.IniGroup
    local groupName = eventData.IniGroupName
    local clientId = eventData.IniPlayerUCID or playerName

    raceDebug("Player enter: " .. tostring(playerName) .. ", group " .. groupName .. " (event.id: " .. eventData.id .. ")")

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
        MENU_GROUP_COMMAND:New(group, "Race debug log tail", nil, displayLogTail, group)
    end
end

function clientSet:OnEventDead(eventData)
    self:OnEventPlayerLeaveUnit(eventData)
end

function clientSet:OnEventCrash(eventData)
    self:OnEventPlayerLeaveUnit(eventData)
end

-- Define what happens when a player leaves a unit
function clientSet:OnEventPlayerLeaveUnit(eventData)
    local playerName = eventData.IniPlayerName
    -- On MP servers this may be called for non-client slots as well, we just ignore it.
    if not playerName then
        return
    end
    local clientId = eventData.IniPlayerUCID or playerName

    raceDebug("Player leave: " .. tostring(playerName) .. " (event.id: " .. eventData.id .. ")")

    -- This can be nil, especially because this leave event is triggered twice for whatever reason.
    racerData = currentRacers[clientId]

    if racerData then
        if racerData.startTs then
            raceDebug("Sadly, player " .. tostring(playerName) .. " left during the race...")
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
        -- Enable only when debugging approximation, otherwise we don't want it in the log:
        --raceDebug("approximateTimeBetween - small distance difference, using NOW")
        return now
    elseif (currentRefDistance > refDistance) == (lastPosRefDistance > refDistance) then
        -- Enable only when debugging approximation, otherwise we don't want it in the log:
        --raceDebug("No reference line crossing detected - unexpected entry position, using NOW")
        return now
    end

    local timeDiff = now - lastTs
    local distFractionAfterLine = math.abs(currentRefDistance - refDistance) / distanceDiff
    -- Enable only when debugging approximation, otherwise we don't want it in the log:
    --raceDebug("approximateTimeBetween: timeDiff=" .. tostring(timeDiff) .. ", lastPosRefDistance=" .. tostring(lastPosRefDistance)
    --        .. ", currentRefDistance=" .. tostring(currentRefDistance) .. ", distFractionAfterLine=" .. tostring(distFractionAfterLine))

    -- Interpolate to approximate the time when the racer would have crossed the start line
    return now - timeDiff * distFractionAfterLine
end

local function mainRaceLoop()
    local now = timer.getAbsTime()
    lastRaceLoopTs = now

    for _, racerData in pairs(currentRacers) do
        -- If startTs is initialized we compute the approximate time inside the zone.
        -- The default time without "time preciser" is rounded to seconds - this is also printed to the player every cycle.
        local timeInsideSeconds = racerData.startTs and math.floor(now - racerData.startTs + 0.5)
        local unit = racerData.unit
        local unitPos = unit:GetPointVec3()
        local formattedTime = tostring(timeInsideSeconds)
        local checkZoneSoundPlayed = false -- this var ensures that the check zone sound plays at least for one cycle

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
                                    checkZoneSoundPlayed = true
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
                        if aglWarningSound and not checkZoneSoundPlayed then
                            USERSOUND:New(aglWarningSound):ToUnit(unit)
                        end
                    end
                end
            end
        else
            -- not insideRacingZone
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
                    local finishMessage = racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. formattedTime .. " seconds"
                    if killZoneBehavior ~= 1 then
                        finishMessage = finishMessage .. ", killZoneBehavior=" .. tostring(killZoneBehavior)
                    end
                    MESSAGE:New(finishMessage, 20):ToAll()
                    USERSOUND:New(finishRaceSound):ToUnit(unit)

                    -- We only update log/leaderboard if the kill zone behavior is one of the competitive ones:
                    if killZoneBehavior == 1 or killZoneBehavior == 2 then
                        if logFinishResults then
                            env.info("RACE FINISH: player " .. racerData.playerName .. ", type " .. unit:GetTypeName() .. " (group " .. racerData.groupName .. "): " .. formattedTime .. " s")
                        end
                        addResultToLadder(unit:GetTypeName(), {
                            player = racerData.playerName,
                            time = timeInsideSeconds,
                        })
                    end
                else
                    MESSAGE:New("You didn't go through the whole course, this attempt does not count.", 6, nil, true):ToUnit(unit)
                end
            end

            racerData.startTs = nil
            racerData.disqualified = nil
        end

        racerData.lastTs = now
        racerData.lastPos = unitPos

        -- We check kill-zones after the racing zone, so we can rely on the updated value of "startTs" (or lack thereof).
        if not racerData.disqualified then
            if killZoneBehavior == 1 or killZoneBehavior == 2 then
                for _, zone in ipairs(killZones) do
                    if unit:IsInZone(zone) then
                        --raceDebug("Player " .. racerData.playerName .. " in kill zone " .. zone:GetName()) -- pollutes the log
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
    end

    -- Printing warning to spectators potentially disturbing the racers:
    if spectatorsWarningAgl and spectatorsWarningMessage then
        for _, spectator in pairs(spectators) do
            local unit = spectator.unit
            if unit:IsInZone(racingZone) and unit:GetAltitude(true) < spectatorsWarningAgl then
                MESSAGE:New(spectatorsWarningMessage, 2, nil, true):ToUnit(unit)
                if aglWarningSound then
                    USERSOUND:New(aglWarningSound):ToUnit(unit)
                end
            end
        end
    end

    -- if restart "voting" is enabled/set-up properly
    if restartTimeoutSeconds and restartZone and restartTriggerFlag then
        local racersTotal = 0
        local racersInRestartZone = 0
        for _, racerData in pairs(currentRacers) do
            racersTotal = racersTotal + 1

            local unit = racerData.unit
            if unit:IsInZone(restartZone) then
                racersInRestartZone = racersInRestartZone + 1
                MESSAGE:New("You feel something strange around here...", 2, nil, true):ToUnit(unit)
            end
        end
        -- ~3/5 quorum of active racers (not spectators) is needed for restart
        if racersTotal > 0 and racersInRestartZone / racersTotal > 0.59 then
            if not restartTs then
                restartTs = now + restartTimeoutSeconds
            elseif now > restartTs then
                env.info("RACE RESTARTING - dumping leaderboard:\n" .. leaderboardText())
                MESSAGE:New("Restart imminent!", 10):ToAll()
                trigger.action.setUserFlag(restartTriggerFlag, true)
                restartTriggered = true
            else
                MESSAGE:New("Restarting in " .. math.ceil(restartTs - now) .. " seconds!", 2):ToAll()
            end
        elseif not restartTriggered then
            if restartTs then
                MESSAGE:New("Restart aborted...", 10):ToAll()
            end
            restartTs = nil
        end
    end
end

-- This starts a scheduler that will call the function every second.
SCHEDULER:New(nil, mainRaceLoop, {}, 0, 1)

if debugLog then
    env.info("RACE Script end")
end

-- TODO remove when not needed
-- Temporary DCS vanilla event handler to compare with the events in MOOSE handlers.
local eventHandler = {}

-- some events are used for single-player, some for multi-player, it's a mess
local allowedEvents = {
    [world.event.S_EVENT_BIRTH] = "Birth",
    [world.event.S_EVENT_PLAYER_ENTER_UNIT] = "Player Enter Unit",
    [world.event.S_EVENT_CRASH] = "Crash",
    [world.event.S_EVENT_DEAD] = "Dead",
    [world.event.S_EVENT_PLAYER_LEAVE_UNIT] = "Player Leave Unit",
}

function eventHandler:onEvent(event)
    if not event or not allowedEvents[event.id] then
        return
    end

    local initiatorUnit = event.initiator
    local playerName = initiatorUnit and initiatorUnit.getPlayerName and initiatorUnit:getPlayerName()
    local playerId

    if playerName then
        local playerList = net.get_player_list()
        for _, id in ipairs(playerList) do
            if net.get_player_info(id, "name") == playerName then
                playerId = id
                break
            end
        end
    end

    local msg = "EVENT " .. tostring(event and event.id) .. "/" .. (allowedEvents[event.id] or "Unknown") .. ": "
    if initiatorUnit then
        local typeInfo = initiatorUnit.getTypeName and tostring(initiatorUnit:getTypeName()) or ("class " .. tostring(initiatorUnit.className_))
        local unitName = initiatorUnit and initiatorUnit.getName and initiatorUnit:getName()
        msg = msg .. "player " .. tostring(playerName)
                .. ", type " .. typeInfo
                .. ", unit " .. tostring(unitName)
                .. ", UCID " .. tostring(playerId and net.get_player_info(playerId, "ucid"))
        if unitName then
            msg = msg .. ", CLIENT: " .. tostring(CLIENT:FindByName(unitName))
        end
    else
        msg = msg .. "initiator nil!"
    end
    raceDebug(msg)
end

world.addEventHandler(eventHandler)
