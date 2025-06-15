-- RACE Script by 'Virgo' / Member of the Black Angels (Public Domain, see https://unlicense.org)
--
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
-- Uses MOOSE for convenience, but not for events as it proved buggy in multi-player server environments.
--
-- Do not forget to load script with dunlibRacingConfig table first!

local cfg = dunlibRacingConfig -- just abbreviation
if cfg.debugLog then
    env.info("RACE Script start")
end

-- DATA STRUCTURES, INITIALIZATION

-- Table storing only live racers, inside or out of the zone. Map clientId -> racer table.
-- Structure of the racer table:
-- * playerName (string)
-- * groupName (string)
-- * unit (MOOSE UNIT wrapper)
-- * startTs (number, based on timer.getAbsTime())
-- * disqualified (boolean, used when killZoneBehavior is set to 2)
-- * zoneCheck (table of ZONE->boolean, registering the entered check zones)
-- * lastTs ("now" from previous racing loop, based on timer.getAbsTime())
-- * lastPos (result of unit:GetPointVec3())
local currentRacers = {}

local ladder = {}
local spectators = {}

local racingZone = ZONE:FindByName(cfg.racingZoneName)

local racingCheckZones = {}
-- Lua pattern matching requires % escape character before -.
-- Using ^ assures prefix behavior, otherwise any substring is matched.
SET_ZONE:New():FilterPrefixes(cfg.racingCheckZonePrefix):FilterOnce():ForEachZone(function(zone)
    table.insert(racingCheckZones, zone)
    if cfg.debugLog then
        env.info("Adding check zone: " .. zone:GetName())
    end
end)
local killZones = {}
SET_ZONE:New():FilterPrefixes(cfg.killZonePrefix):FilterOnce():ForEachZone(function(zone)
    table.insert(killZones, zone)
    if cfg.debugLog then
        env.info("Adding kill zone: " .. zone:GetName())
    end
end)

local lastRaceLoopTs -- updated on every main race loop function for debug purposes

local restartZone = cfg.restartZoneName and ZONE:FindByName(cfg.restartZoneName) -- optional
local restartTs -- used by "restart voting", see usages lower
local restartTriggered = false

-- COMMON FUNCTIONS

-- INTERNAL LOG buffer
local logTail = {}

local function addLogTail(log)
    table.insert(logTail, tostring(timer.getAbsTime()) .. ": " .. log)
    if #logTail > cfg.logTailSize then
        table.remove(logTail, 1)
    end
end

local function displayLogTail(group)
    local resultText = ""
    for i = 1, #logTail do
        resultText = resultText .. logTail[i] .. "\n"
    end
    MESSAGE:New(resultText, 30, nil):ToGroup(group)
end

-- Prints debug message to log or as a message to all, depending on the debug flags above.
local function raceDebug(message)
    message = "RACE " .. tostring(message)
    if cfg.debugLog then
        env.info(message)
    end
    if cfg.debugMessages then
        MESSAGE:New(message, 5):ToAll()
    end
    addLogTail(message)
end

local function leaderboardText()
    local resultText = "RACE RESULTS"
    for unitType, results in pairs(ladder) do
        resultText = resultText .. "\n\nCategory " .. unitType .. ":\n----------------------------------------------------------\n"
        for i, result in ipairs(results) do
            local formattedTime = cfg.timePreciser and string.format("%.2f", result.time) or tostring(result.time)
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
    if not racingZone then
        MESSAGE:New("DEBUG:\n\nERROR - no racing zone! Fix the name in config.", 10, nil, true):ToGroup(group)
        return
    end

    local resultText = "DEBUG:\n\nkillZoneBehavior = " .. tostring(cfg.killZoneBehavior)
            .. "\nracerGroupPrefix = " .. tostring(cfg.racerGroupPrefix)
            .. "\ntimePreciser = " .. tostring(cfg.timePreciser)
            .. "\n# of racingCheckZones = " .. tostring(racingCheckZones and #racingCheckZones)
            .. "\n# of killZones = " .. tostring(killZones and #killZones)
            .. "\n# of spectators = " .. tostring(mapSize(spectators))
            .. "\nwarning AGL/kill AGL = " .. tostring(cfg.warningAboveAGL) .. "/" .. tostring(cfg.killAboveAGL) .. " m"
            .. "\nignoreCheckZoneAboveWarningAltitude  = " .. tostring(cfg.ignoreCheckZoneAboveWarningAltitude)
            .. "\nspectator warning AGL = " .. tostring(cfg.spectatorsWarningAgl) .. " m => ~" .. tostring(cfg.spectatorsWarningReportedAglRoundedFeet) .. " ft"
            .. "\nlast race loop check/now = " .. tostring(lastRaceLoopTs) .. "/" .. tostring(timer.getAbsTime()) .. " s"
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

-- Calculates purely planar distance for x and z coordinates of both structures.
local function pointDistance(point3d, point2d)
    local dx = point3d.x - point2d.x
    local dz = point3d.z - point2d.z
    return math.sqrt(dx * dx + dz * dz)
end

-- Simple hash used for UCIDs in debugMenuFor (config).
local function simpleHash(input)
    local hash = 0
    for i = 1, #input do
        local char = input:byte(i)
        hash = ((hash * 32) - hash) + char -- << not supported by DCS Lua
        hash = hash % 0x100000000 -- & not supported by DCS Lua
    end
    return string.format("%08x", hash)
end

local function debugMenuAvailableFor(ucid, playerName)
    if not ucid or not cfg.debugMenuFor or next(cfg.debugMenuFor) == nil then
        return false
    end

    local entry = cfg.debugMenuFor[simpleHash(ucid)]
    if entry and (entry == true or entry == playerName) then
        return true
    end

    return false
end

local function escapeString(str)
    return str and tostring(str:gsub("([\\'])", "\\%1")) or "" -- always produce a string
end

-- EVENT SETUP

-- DCS vanilla event handler, MOOSE handlers were not reliable.
local eventHandler = {}

-- some events are used for single-player, some for multi-player, it's a mess
local allowedEvents = {
    [world.event.S_EVENT_BIRTH] = "Birth",
    [world.event.S_EVENT_PLAYER_ENTER_UNIT] = "Player Enter Unit",
    [world.event.S_EVENT_CRASH] = "Crash",
    [world.event.S_EVENT_DEAD] = "Dead",
    [world.event.S_EVENT_PLAYER_LEAVE_UNIT] = "Player Leave Unit",
}

local function changeKillZoneBehavior(newKillZoneBehavior, group)
    cfg.killZoneBehavior = newKillZoneBehavior
    showDebugMessage(group)
end

function eventHandler:onEvent(event)
    if not event or not allowedEvents[event.id] then
        return
    end

    local initiatorUnit = event.initiator
    local playerName = initiatorUnit and initiatorUnit.getPlayerName and initiatorUnit:getPlayerName()
    if not playerName then
        raceDebug("EVENT IGNORED " .. tostring(event and event.id) .. "/" .. (allowedEvents[event.id] or "Unknown")
                .. ": initiatorUnit " .. tostring(initiatorUnit) .. ", playerName " .. tostring(playerName))
        return
    end

    local playerId
    local playerList = net.get_player_list()
    for _, id in ipairs(playerList) do
        if net.get_player_info(id, "name") == playerName then
            playerId = id
            break
        end
    end

    local unitName = initiatorUnit and initiatorUnit.getName and initiatorUnit:getName()
    local typeInfo = initiatorUnit.getTypeName and tostring(initiatorUnit:getTypeName()) or ("class " .. tostring(initiatorUnit.className_))
    local ucid = playerId and net.get_player_info(playerId, "ucid")
    local clientId = ucid or playerName
    if not initiatorUnit or not unitName or not clientId then
        raceDebug("EVENT IGNORED " .. tostring(event and event.id) .. "/" .. (allowedEvents[event.id] or "Unknown")
                .. ": playerName " .. tostring(playerName)
                .. ", UCID " .. tostring(ucid)
                .. ", unitName " .. tostring(unitName)
                .. ", typeInfo " .. tostring(typeInfo))
        return
    end

    -- All the ignored cases should be handled by now...
    local client = CLIENT:FindByName(unitName)
    local unit = client:GetClientGroupUnit()
    local group = client:GetGroup()
    local groupName = client:GetClientGroupName()

    if event.id == world.event.S_EVENT_BIRTH or event.id == world.event.S_EVENT_PLAYER_ENTER_UNIT then
        raceDebug("Player enter: " .. tostring(playerName) .. ", group " .. groupName .. ", UCID " .. tostring(ucid) .. " (event.id: " .. event.id .. ")")

        -- Check if the group name starts with the desired prefix
        if groupName and string.sub(groupName, 1, #cfg.racerGroupPrefix) == cfg.racerGroupPrefix then
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
        if cfg.debugMenuForAll or debugMenuAvailableFor(ucid, playerName) then
            MENU_GROUP_COMMAND:New(group, "Race Debug", nil, showDebugMessage, group)
            MENU_GROUP_COMMAND:New(group, "Kill zones: disable", nil, changeKillZoneBehavior, nil, group)
            MENU_GROUP_COMMAND:New(group, "Kill zones: set to kill", nil, changeKillZoneBehavior, 1, group)
            MENU_GROUP_COMMAND:New(group, "Kill zones: set to disqualify", nil, changeKillZoneBehavior, 2, group)
            MENU_GROUP_COMMAND:New(group, "Race debug log tail", nil, displayLogTail, group)
        end
    else
        -- exit events branch
        raceDebug("Player leave: " .. tostring(playerName) .. " (event.id: " .. event.id .. ")")

        -- This can be nil, especially because this leave event is triggered twice for whatever reason.
        racerData = currentRacers[clientId]

        if racerData then
            if racerData.startTs then
                raceDebug("Sadly, player " .. tostring(playerName) .. " left during the race...")
            end
            currentRacers[clientId] = nil
        end
    end
end

world.addEventHandler(eventHandler)

-- REPEATED CHECKS and related functions

local function checkZones(enteredZones)
    local passed = 0

    for _, zone in ipairs(racingCheckZones) do
        if enteredZones[zone] then
            passed = passed + 1
        end
    end

    return passed, #racingCheckZones
end

local function addResultToLadder(unitTypeName, result)
    if cfg.singleLeaderboardForAllTypes then
        unitTypeName = "ALL"
    end
    local unitResults = ladder[unitTypeName]
    if not unitResults then
        unitResults = {}
        ladder[unitTypeName] = unitResults
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
    if cfg.killSound then
        USERSOUND:New(cfg.killSound):ToUnit(racerData.unit)
    end
    if racerData.killZoneBehavior == 1 then
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
    elseif (currentRefDistance > cfg.refDistance) == (lastPosRefDistance > cfg.refDistance) then
        -- Enable only when debugging approximation, otherwise we don't want it in the log:
        --raceDebug("No reference line crossing detected - unexpected entry position, using NOW")
        return now
    end

    local timeDiff = now - lastTs
    local distFractionAfterLine = math.abs(currentRefDistance - cfg.refDistance) / distanceDiff
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
        local importantEventSoundPlayed = false -- this var ensures that the important sounds (start, check zone...) are played even in warning altitudes

        local insideRacingZone = unit:IsInZone(racingZone)
        if insideRacingZone then
            if racerData.disqualified then
                MESSAGE:New("You're disqualified, leave the race track area!", 2, nil, true):ToUnit(unit)
            else
                if timeInsideSeconds then
                    MESSAGE:New("Time inside: " .. formattedTime .. " seconds", 2, nil, true):ToUnit(unit)

                    -- Check the intermediate zones
                    for _, checkZone in ipairs(racingCheckZones) do
                        if unit:IsInZone(checkZone) and not racerData.zoneCheck[checkZone]
                                and (not cfg.ignoreCheckZoneAboveWarningAltitude or unit:GetAltitude(true) < cfg.warningAboveAGL)
                        then
                            raceDebug("Player " .. racerData.playerName .. " entered the check zone " .. checkZone:GetName())
                            racerData.zoneCheck[checkZone] = true
                            if cfg.checkZoneSound then
                                USERSOUND:New(cfg.checkZoneSound):ToUnit(unit)
                                importantEventSoundPlayed = true
                            end
                        end
                    end
                else
                    MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") entered the race!", 10):ToAll()
                    if cfg.timePreciser then
                        racerData.startTs = approximateTimeBetween(
                                racerData.lastTs, pointDistance(racerData.lastPos, cfg.startRefPoint),
                                now, pointDistance(unitPos, cfg.startRefPoint))
                    else
                        racerData.startTs = now
                    end
                    if cfg.enterRaceSound then
                        USERSOUND:New(cfg.enterRaceSound):ToUnit(unit)
                    end
                    importantEventSoundPlayed = true
                    racerData.zoneCheck = {}
                    -- We will save current behavior for this race, it will be used even if the config changes (via debug menu).
                    racerData.killZoneBehavior = cfg.killZoneBehavior
                end

                -- Altitude warning and disqualification
                if racerData.killZoneBehavior == 1 or racerData.killZoneBehavior == 2 then
                    if cfg.killAboveAGL and unit:GetAltitude(true) > cfg.killAboveAGL then
                        MESSAGE:New(racerData.playerName .. " (of " .. racerData.groupName .. ") flew too high and was disqualified!", 15):ToAll()
                        disqualify(racerData)
                    elseif cfg.warningAboveAGL and unit:GetAltitude(true) > cfg.warningAboveAGL then
                        MESSAGE:New("WARNING: Reduce your altitude immediately!", 2, nil, true):ToUnit(unit)
                        if cfg.aglWarningSound and not importantEventSoundPlayed then
                            USERSOUND:New(cfg.aglWarningSound):ToUnit(unit)
                        end
                    end
                end
            end
        else
            -- not insideRacingZone
            if racerData.startTs and unit:IsAlive() then
                -- the unit is NOT in zone, but has startTs - this means it's just left the zone
                local passed, total = checkZones(racerData.zoneCheck)
                if passed == total then
                    if cfg.timePreciser then
                        local correctedNow = approximateTimeBetween(
                                racerData.lastTs, pointDistance(racerData.lastPos, cfg.endRefPoint),
                                now, pointDistance(unitPos, cfg.endRefPoint))
                        timeInsideSeconds = correctedNow - racerData.startTs
                        formattedTime = string.format("%.2f", timeInsideSeconds)
                    end
                    local finishMessage = racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. formattedTime .. " seconds"
                    MESSAGE:New(finishMessage, 20):ToAll()
                    if cfg.finishRaceSound then
                        USERSOUND:New(cfg.finishRaceSound):ToUnit(unit)
                    end

                    -- We only update log/leaderboard if the kill zone behavior is one of the competitive ones:
                    if racerData.killZoneBehavior == 1 or racerData.killZoneBehavior == 2 then
                        if cfg.logFinishResults then
                            env.info("RACE FINISH|'" .. escapeString(cfg.raceIdentifier) .. "'|'" .. (ucid or "")
                                    .. "'|'" .. escapeString(racerData.playerName) .. "'|'" .. escapeString(unit:GetTypeName())
                                    .. "'|'" .. escapeString(racerData.groupName) .. "'|" .. formattedTime)
                        end
                        addResultToLadder(unit:GetTypeName(), {
                            player = racerData.playerName,
                            time = timeInsideSeconds,
                        })
                    end
                else
                    MESSAGE:New("You didn't go through the whole course (" .. passed .. " of " .. total .. "), this attempt does not count.", 6, nil, true):ToUnit(unit)
                    if cfg.unfinishedRaceSound then
                        USERSOUND:New(cfg.unfinishedRaceSound):ToUnit(unit)
                    end
                end
            end

            racerData.startTs = nil
            racerData.disqualified = nil
        end

        racerData.lastTs = now
        racerData.lastPos = unitPos

        -- We check kill-zones after the racing zone, so we can rely on the updated value of "startTs" (or lack thereof).
        if not racerData.disqualified then
            if racerData.killZoneBehavior == 1 or racerData.killZoneBehavior == 2 then
                for _, zone in ipairs(killZones) do
                    if unit:IsInZone(zone) then
                        --raceDebug("Player " .. racerData.playerName .. " in kill zone " .. zone:GetName()) -- pollutes the log
                        if not insideRacingZone and racerData.killZoneBehavior == 2 then
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
    if cfg.spectatorsWarningAgl and cfg.spectatorsWarningMessage then
        for _, spectator in pairs(spectators) do
            local unit = spectator.unit
            if unit:IsInZone(racingZone) and unit:GetAltitude(true) < cfg.spectatorsWarningAgl then
                MESSAGE:New(cfg.spectatorsWarningMessage, 2, nil, true):ToUnit(unit)
                if cfg.aglWarningSound then
                    USERSOUND:New(cfg.aglWarningSound):ToUnit(unit)
                end
            end
        end
    end

    -- if restart "voting" is enabled/set-up properly
    if cfg.restartTimeoutSeconds and restartZone and cfg.restartTriggerFlag then
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
        -- by default ~3/5 quorum of active racers (not spectators) is needed for restart
        if racersTotal > 0 and racersInRestartZone / racersTotal >= (cfg.restartQuorum or 0.6) then
            if not restartTs then
                restartTs = now + cfg.restartTimeoutSeconds
            elseif now > restartTs then
                env.info("RACE RESTARTING - dumping leaderboard:\n" .. leaderboardText())
                MESSAGE:New("Restart imminent!", 10):ToAll()
                trigger.action.setUserFlag(cfg.restartTriggerFlag, true)
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
if racingZone then
    SCHEDULER:New(nil, mainRaceLoop, {}, 0, 1)
else
    env.warning("RACE no racing zone, main loop disabled!")
end

if cfg.debugLog then
    env.info("RACE Script end")
end
