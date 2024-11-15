-- Script by 'Virgo' / Member of the Black Angels
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
-- Uses MOOSE
-- TODO kill zones logic

-- INITIAL SETUP, COMMON STUFF

local racerGroupPrefix = "AirRace-"
local racingZone = ZONE:FindByName("racetrack")
local racingCheckZones = {ZONE:FindByName("race-check-1"), ZONE:FindByName("race-check-2")}

-- reference points 1000m from the start/end line - OPTIONAL, comment out if not desired
-- Don't forget the right sings!
local startRefPoint = {x = -314063, z = 895054}
local endRefPoint = {x = -313904, z = 895206}
local refDistance = 1000 -- use the same value for both points

local currentRacers = {} -- table storing only live racers, inside or out of the zone
local ladder = {}

local function showCurrentRacers(group)
    if next(ladder) == nil then
        MESSAGE:New("No race results yet...", 10, nil):ToGroup(group)
    else
        local resultText = "RACE RESULTS"
        for unitType, results in pairs(ladder) do
            resultText = resultText .. "\n\nCategory " .. unitType .. ":\n---------------------------------------------------------------------------------------\n"
            for i, result in ipairs(results) do
                resultText = resultText .. "  " .. tostring(i) .. ". " .. result.player .. " ... " .. string.format("%.2f", result.time) .. " s\n"
            end
        end
        MESSAGE:New(resultText, 30, nil):ToGroup(group)
    end
end

local function raceDebug(group)
    if next(currentRacers) == nil then
        MESSAGE:New("No racers...", 10, nil):ToGroup(group)
    else
        local resultText = "DEBUG\n"
        for _, racerData in pairs(currentRacers) do
            resultText = resultText .. "\nID: " .. tostring(_)
                    .. "\n  playerName: " .. tostring(racerData.playerName)
                    .. "\n  groupName: " .. tostring(racerData.groupName)
                    .. "\n  startTs: " .. tostring(racerData.startTs)
                    .. "\n"
        end
        MESSAGE:New(resultText, 30, nil):ToGroup(group)
    end
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

    env.info("XXX Player enter: " .. tostring(playerName) .. " (event.id: " .. eventData.id .. ")")

    -- Check if the group name starts with the desired prefix
    if groupName and string.sub(groupName, 1, #racerGroupPrefix) == racerGroupPrefix then
        -- Initialize data structure for the client/unit - this is used in mainRaceLoop function.
        currentRacers[clientId] = {
            playerName = playerName,
            groupName = groupName,
            unit = unit,
        }
    end

    -- Menu for checking leaderboard is added to any group when the client joins.
    -- There seems to be no similar functionality on the unit level, so it's best to have 1 unit in each group.
    MENU_GROUP_COMMAND:New(group, "Race Leaderboard", nil, showCurrentRacers, group)
    MENU_GROUP_COMMAND:New(group, "Race debug", nil, raceDebug, group)
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
    local clientId = eventData.IniPlayerUCID or eventData.IniPlayerName

    env.info("XXX Player leave: " .. tostring(playerName) .. " (event.id: " .. eventData.id .. ")")

    -- This can be nil, especially because this leave event is triggered twice for whatever reason.
    racerData = currentRacers[clientId]

    if racerData then
        if racerData.startTs then
            env.info("XXX Sadly, player " .. tostring(playerName) .. " left during the race...")
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

--2024-11-15 00:32:29.493 INFO    SCRIPTING (Main): Error in timer function: [string "-- Script by 'Virgo' / Member of the Black Angels..."]:175: attempt to call a string value
local function approximateTimeBetween(lastTs, lastPosRefDistance, now, currentRefDistance)
    local distanceDiff = math.abs(lastPosRefDistance - currentRefDistance)

    -- distance difference/speed of the unit is too small, we can just use current time
    if distanceDiff < 1 then
        env.info("XXX approximateTimeBetween - small distance difference, using NOW")
        return now
    end

    local timeDiff = now - lastTs
    local distFractionAfterLine = math.abs(currentRefDistance - refDistance) / distanceDiff
    env.info("XXX approximateTimeBetween: timeDiff=" .. tostring(timeDiff) .. ", lastPosRefDistance=" .. tostring(lastPosRefDistance)
            .. ", currentRefDistance=" .. tostring(currentRefDistance) .. ", distFractionAfterLine=" .. tostring(distFractionAfterLine))

    -- Interpolate to approximate the time when the racer would have crossed the start line
    return now - timeDiff * distFractionAfterLine
end

local function mainRaceLoop()
    for _, racerData in pairs(currentRacers) do
        local now = timer.getAbsTime()
        -- If startTs is initialized we compute the approximate time inside the zone.
        local timeInsideSeconds = racerData.startTs and now - racerData.startTs
        local unitPos = racerData.unit:GetPointVec3()

        if racerData.unit:IsInZone(racingZone) then
            if timeInsideSeconds then
                MESSAGE:New("Time inside: " .. tostring(math.floor(timeInsideSeconds)) .. " seconds", 2, nil, true):ToUnit(racerData.unit)

                -- Check the intermediate zones
                for _, zone in ipairs(racingCheckZones) do
                    if racerData.unit:IsInZone(zone) then
                        racerData.zoneCheck[zone] = true
                    end
                end
            else
                MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") entered the race!", 10):ToAll()
                if startRefPoint then
                    racerData.startTs = approximateTimeBetween(
                            racerData.lastTs, pointDistance(racerData.lastPos, startRefPoint),
                            now, pointDistance(unitPos, startRefPoint))
                else
                    racerData.startTs = now
                end
                racerData.zoneCheck = {}
            end
        elseif racerData.startTs and racerData.unit:IsAlive() then
            -- the unit is NOT in zone, but has startTs - this means it's just left the zone
            if hasEnteredAllZones(racerData.zoneCheck) then
                if endRefPoint then -- approximation
                    local correctedNow = approximateTimeBetween(
                            racerData.lastTs, pointDistance(racerData.lastPos, endRefPoint),
                            now, pointDistance(unitPos, endRefPoint))
                    timeInsideSeconds = correctedNow - racerData.startTs
                end
                MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. string.format("%.2f", timeInsideSeconds) .. " seconds", 20):ToAll()

                addResultToLadder(racerData.unit:GetTypeName(), {
                    player = racerData.playerName,
                    time = timeInsideSeconds,
                })
            else
                MESSAGE:New("You didn't go through the whole course, this attempt does not count.", 6, nil, true):ToUnit(racerData.unit)
            end
            racerData.startTs = nil
        end

        racerData.lastTs = now
        racerData.lastPos = unitPos
    end
end

-- This starts a scheduler that will call the function every second.
SCHEDULER:New(nil, mainRaceLoop, {}, 0, 1)
