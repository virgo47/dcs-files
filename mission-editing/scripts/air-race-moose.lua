-- Uses MOOSE

-- INITIAL SETUP, COMMON STUFF

local racerGroupPrefix = "AirRace-"
local racingZone = ZONE:FindByName("racetrack")
local currentRacers = {} -- table storing only live racers, inside or out of the zone
local ladder = {}

local function showCurrentRacers(unit)
    MESSAGE:New("Hi there!", 10, nil):ToUnit(unit)
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
    --local client = CLIENT:FindByName(unit.UnitName)

    -- Check if the group name starts with the desired prefix
    if groupName and string.sub(groupName, 1, #racerGroupPrefix) == racerGroupPrefix then
        -- Initialize data structure for the client/unit - this is used in mainRaceLoop function.
        currentRacers[clientId] = {
            playerName = playerName,
            groupName = groupName,
            unit = unit,
            --client = client,
        }

        -- Menu for checking leaderboard is added to the group when the client joins, and this client
        -- is passed as a parameter so the message can be sent to them only.
        -- IMPORTANT: This assumes there is just one client per group, please, don't break this convention
        MENU_GROUP_COMMAND:New(group, "Race Leaderboard", nil, showCurrentRacers, unit)
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
    env.info("Player left: " .. tostring(playerName))
end

-- REPEATED CHECKS
local function mainRaceLoop()
    env.info("This function runs every second")

    for _, racerData in pairs(currentRacers) do
        local now = timer.getAbsTime()
        -- If startTs is initialized we compute the approximate time inside the zone.
        local timeInsideSeconds = racerData.startTs and math.floor(now - racerData.startTs + 0.5)

        if racerData.unit:IsInZone(racingZone) then
            if timeInsideSeconds then
                MESSAGE:New("Time inside: " .. tostring(timeInsideSeconds) .. " seconds", 2, nil, true):ToUnit(racerData.unit)
            else
                MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") entered the race!", 10):ToAll()
                racerData.startTs = now -- TODO later do the approximation
            end
        elseif racerData.startTs and racerData.unit:IsAlive() then
            -- the unit is NOT in zone, but has startTs - this means it's just left the zone
            MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. tostring(timeInsideSeconds) .. " seconds", 20):ToAll()
            racerData.startTs = nil
            -- TODO write the result to the leaderboard
        end

        racerData.lastTs = now
        --racerData.lastPosition = TODO for sub-second approximation
    end
end

-- This starts a scheduler that will call the function every second.
SCHEDULER:New(nil, mainRaceLoop, {}, 0, 1)
