-- Uses MOOSE

-- INITIAL SETUP, COMMON STUFF

local racerGroupPrefix = "AirRace-"
local racingZone = ZONE:FindByName("racetrack")
local racingCheckZones = {ZONE:FindByName("race-check-1"), ZONE:FindByName("race-check-2")}
local currentRacers = {} -- table storing only live racers, inside or out of the zone
local ladder = {}

local function showCurrentRacers(group)
    if next(ladder) == nil then
        MESSAGE:New("No race results yet...", 10, nil):ToGroup(group)
    else
        local resultText = "RACE RESULTS"
        for unitType, results in pairs(ladder) do
            resultText = resultText .. "\n\nCategory " .. unitType .. ":\n----------------------"
            for i, result in ipairs(results) do
                resultText = resultText .. "\n  " .. tostring(i) .. ". " .. result.player .. " ... " .. tostring(result.time) .. " s"
            end
        end
        MESSAGE:New(resultText, 30, nil):ToGroup(group)
    end
end

-- EVENT SETUP

local clientSet = SET_CLIENT:New():FilterOnce()

-- Enable handling of the events on the client set
clientSet:HandleEvent(EVENTS.PlayerEnterUnit)
clientSet:HandleEvent(EVENTS.PlayerLeaveUnit)

-- Define what happens when a player enters a unit
function clientSet:OnEventPlayerEnterUnit(eventData)
    local unit = eventData.IniUnit
    local playerName = eventData.IniPlayerName
    local group = eventData.IniGroup
    local groupName = eventData.IniGroupName
    local clientId = eventData.IniPlayerUCID or eventData.IniPlayerName

    -- Check if the group name starts with the desired prefix
    if groupName and string.sub(groupName, 1, #racerGroupPrefix) == racerGroupPrefix then
        -- Initialize data structure for the client/unit - this is used in mainRaceLoop function.
        currentRacers[clientId] = {
            playerName = playerName,
            groupName = groupName,
            unit = unit,
        }

        -- Menu for checking leaderboard is added to the group when the client joins.
        -- There seems to be no similar functionality on the unit level, so it's best to have 1 unit in each racing group.
        MENU_GROUP_COMMAND:New(group, "Race Leaderboard", nil, showCurrentRacers, group)
    else
        env.info("Player " .. playerName .. " entered a non-racer unit in group: " .. groupName)
    end
end

-- Define what happens when a player leaves a unit
function clientSet:OnEventPlayerLeaveUnit(eventData)
    local playerName = eventData.IniPlayerName
    local clientId = eventData.IniPlayerUCID or eventData.IniPlayerName

    -- This can be nil, especially because this leave event is triggered twice for whatever reason.
    racerData = currentRacers[clientId]

    if racerData then
        if racerData.startTs then
            env.info("Sadly, player " .. tostring(playerName) .. " left during the race...")
        end
        currentRacers[clientId] = nil
    end
    --env.info("Player left: " .. tostring(playerName))
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


local function mainRaceLoop()
    --env.info("This function runs every second")

    for _, racerData in pairs(currentRacers) do
        local now = timer.getAbsTime()
        -- If startTs is initialized we compute the approximate time inside the zone.
        local timeInsideSeconds = racerData.startTs and math.floor(now - racerData.startTs + 0.5)

        if racerData.unit:IsInZone(racingZone) then
            if timeInsideSeconds then
                MESSAGE:New("Time inside: " .. tostring(timeInsideSeconds) .. " seconds", 2, nil, true):ToUnit(racerData.unit)

                -- Check the intermediate zones
                for _, zone in ipairs(racingCheckZones) do
                    if racerData.unit:IsInZone(zone) then
                        env.info("In zone " .. zone:GetName())
                        racerData.zoneCheck[zone] = true
                    end
                end
            else
                MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") entered the race!", 10):ToAll()
                racerData.startTs = now -- TODO later do the approximation
                racerData.zoneCheck = {}
            end
        elseif racerData.startTs and racerData.unit:IsAlive() then
            -- the unit is NOT in zone, but has startTs - this means it's just left the zone
            if hasEnteredAllZones(racerData.zoneCheck) then
                MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. tostring(timeInsideSeconds) .. " seconds", 20):ToAll()

                racerData.startTs = nil
                addResultToLadder(racerData.unit:GetTypeName(), {
                    player = racerData.playerName,
                    time = timeInsideSeconds,
                })
            else
                MESSAGE:New("You didn't go through the whole course, this attempt does not count.", 6, nil, true):ToUnit(racerData.unit)
            end
        end

        racerData.lastTs = now
        --racerData.lastPosition = TODO for sub-second approximation
    end
end

-- This starts a scheduler that will call the function every second.
SCHEDULER:New(nil, mainRaceLoop, {}, 0, 1)
