-- RACE Script by 'Virgo' / Member of the Black Angels (Public Domain, see https://unlicense.org)
--
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
--
-- This is the self-contained script, it only requires the config script to be loaded before.
-- DO NOT FORGET to load that config script with dunlibRacingConfig table first!

local cfg = dunlibRacingConfig -- just abbreviation
if cfg.debugLog then
    env.info("RACE Script start")
end

-- Functions required in the configuration and data structures initialization:
local function zoneByName(zoneName)
    local zones = env.mission and env.mission.triggers and env.mission.triggers.zones
    if not zones then
        env.error('env.mission.triggers.zones is not defined! (at this moment?)')
        return nil
    end

    for _, zone in pairs(zones) do
        if zone.name == zoneName then
            return zone
        end
    end
end

local function forEachZoneMatching(namePattern, callback)
    for _, zone in pairs(env.mission.triggers.zones) do
        if string.match(zone.name, namePattern) then
            callback(zone)
        end
    end
end

-- DATA STRUCTURES, INITIALIZATION

-- Table storing only live racers, inside or out of the zone. Map clientId -> racer table.
-- Structure of the racer table:
-- * playerName (string)
-- * groupName (string)
-- * unit (DCS unit)
-- * startTs (number, based on timer.getAbsTime())
-- * disqualified (boolean, used when killZoneBehavior is set to 2)
-- * zoneCheck (table of DCS zone->boolean, registering the entered check zones)
-- * lastTs ("now" from previous racing loop, based on timer.getAbsTime())
-- * lastPos (x = East/West, y = Altitude ASL, z = North/South - all in meters)
local currentRacers = {}

local ladder = {}
local spectators = {}
local groupsWithRadioMenu = {} -- tracks group IDs for which the radio menus were added

local racingZone = zoneByName(cfg.racingZoneName)

local racingCheckZones = {}
-- Lua pattern matching requires % escape character before -.
-- Using ^ assures prefix behavior, otherwise any substring is matched.
forEachZoneMatching(cfg.racingCheckZonePrefix, function(zone)
    table.insert(racingCheckZones, zone)
    if cfg.debugLog then
        env.info("Adding check zone: " .. zone.name)
    end
end)
local killZones = {}
forEachZoneMatching(cfg.killZonePrefix, function(zone)
    table.insert(killZones, zone)
    if cfg.debugLog then
        env.info("Adding kill zone: " .. zone.name)
    end
end)

local lastRaceLoopTs -- updated on every main race loop function for debug purposes

local restartZone = cfg.restartZoneName and zoneByName(cfg.restartZoneName) -- optional
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

local function messageUnit(unit, text, duration, clearView)
    local unitId = unit.className_ == "Unit" and unit:getID() or unit
    trigger.action.outTextForUnit(unitId, text or "Undefined message!", duration or 10, clearView or false)
end

local function messageGroup(group, text, duration, clearView)
    local groupId = group.className_ == "Group" and group:getID() or group
    trigger.action.outTextForGroup(groupId, text or "Undefined message!", duration or 10, clearView or false)
end

local function messageAll(text, duration, clearView)
    trigger.action.outText(text or "Undefined message!", duration or 10, clearView or false)
end

local function soundUnit(unit, soundFileName)
    local unitId = unit.className_ == "Unit" and unit:getID() or unit
    trigger.action.outSoundForUnit(unitId, soundFileName)
end

local function displayLogTail(group)
    local resultText = ""
    for i = 1, #logTail do
        resultText = resultText .. logTail[i] .. "\n"
    end
    messageGroup(group, resultText, 30)
end

-- Prints debug message to log or as a message to all, depending on the debug flags above.
local function raceDebug(message)
    message = "RACE " .. tostring(message)
    if cfg.debugLog then
        env.info(message)
    end
    if cfg.debugMessages then
        messageAll(message, 5)
    end
    addLogTail(message)
end

local function leaderboardText()
    local resultText = "RACE RESULTS"
    for unitType, results in pairs(ladder) do
        resultText = resultText .. "\n\nCategory " .. unitType .. ":\n----------------------------------------------------------\n"
        for i, result in ipairs(results) do
            resultText = resultText .. "  " .. tostring(i) .. ". " .. result.player .. " ... " .. string.format("%.2f", result.time) .. " s\n"
        end
    end
    return resultText
end

local function showRaceLeaderboard(group)
    if next(ladder) == nil then
        messageGroup(group, "No race results yet...", 10)
    else
        messageGroup(group, leaderboardText(), 30)
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
        messageGroup(group, "DEBUG:\n\nERROR - no racing zone! Fix the name in config.", 10, true)
        return
    end

    local resultText = "DEBUG:\n\nkillZoneBehavior = " .. tostring(cfg.killZoneBehavior)
            .. "\nracerGroupPrefix = " .. tostring(cfg.racerGroupPrefix)
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
    messageGroup(group, resultText .. "\n", 20, true)
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

local function _pointInPolygon(px, pz, vertices)
    local inside = false
    local j = #vertices
    for i = 1, #vertices do
        local xi, zi = vertices[i].x, vertices[i].y
        local xj, zj = vertices[j].x, vertices[j].y
        if ((zi > pz) ~= (zj > pz)) and
                -- Here, zj and zi are on the other side of the unit, no risk of division by 0.
                (px < (xj - xi) * (pz - zi) / (zj - zi) + xi) then
            inside = not inside
        end
        j = i
    end
    return inside
end

local function inZone(unit, ...)
    if not unit or not unit:isExist() then
        return nil
    end

    local pos = unit:getPoint()
    local px, pz = pos.x, pos.z

    -- Loop through all the zones passed as arguments
    for _, zone in ipairs({...}) do
        if not zone then
            return nil -- unlikely, just to be sure
        end

        -- Check the zone type
        if zone.type == 0 then
            -- Circular zone
            local dx = px - zone.x
            local dz = pz - zone.y
            if (dx * dx + dz * dz) <= (zone.radius * zone.radius) then
                return zone
            end
        elseif zone.type == 2 and zone.verticies then
            -- Polygonal zone
            if _pointInPolygon(px, pz, zone.verticies) then
                return zone
            end
        else
            -- Unsupported or malformed zone
            return nil
        end
    end

    return nil
end

local function getAltitude(unit, agl)
    local point = unit:getPoint()
    local altitude = point.y
    if agl then
        -- NOTE: land module uses z as height, while DCS units use y as altitude
        local land = land.getHeight({x = point.x, y = point.z}) or 0
        altitude = altitude - land
    end
    return altitude
end

local function intersectSegments(p1, p2, q1, q2)
    local function subtract(a, b)
        return {x = a.x - b.x, z = a.z - b.z}
    end
    local function cross(a, b)
        return a.x * b.z - a.z * b.x
    end

    local r = subtract(p2, p1)
    local s = subtract(q2, q1)
    local rxs = cross(r, s)
    local qp = subtract(q1, p1)

    if rxs == 0 then
        return nil -- parallel or collinear
    end

    local t = cross(qp, s) / rxs
    local u = cross(qp, r) / rxs

    if t >= 0 and t <= 1 and u >= 0 and u <= 1 then
        return {
            x = p1.x + t * r.x,
            y = (p1.y and p2.y) and (p1.y + t * (p2.y - p1.y)) or nil, -- optional altitude at the intersection point
            z = p1.z + t * r.z,
            t = t, -- fractional distance at the intersection point [0;1]
            dir = (rxs < 0 and 1) or -1, -- 0 here is not an option
        }
    end

    return nil
end

local function intersectSegmentCircle(p1, p2, cx, cz, r)
    local dx = p2.x - p1.x
    local dz = p2.z - p1.z
    local fx = p1.x - cx
    local fz = p1.z - cz

    local a = dx * dx + dz * dz
    local b = 2 * (fx * dx + fz * dz)
    local c = (fx * fx + fz * fz) - r * r

    local discriminant = b * b - 4 * a * c
    if discriminant < 0 then
        return nil
    end

    local sqrtD = math.sqrt(discriminant)
    local t1 = (-b - sqrtD) / (2 * a)
    local t2 = (-b + sqrtD) / (2 * a)

    local t = (t1 >= 0 and t1 <= 1) and t1 or ((t2 >= 0 and t2 <= 1) and t2 or nil)
    if not t then
        return nil
    end

    return {
        x = p1.x + t * dx,
        y = (p1.y and p2.y) and (p1.y + t * (p2.y - p1.y)) or nil, -- optional altitude at the intersection point
        z = p1.z + t * dz,
        t = t -- fractional distance at the intersection point [0;1]
    }
end

local function intersectSegmentZone(p1, p2, zone)
    if zone.type == 0 then
        local cx, cz = zone.x, zone.y
        local r = zone.radius

        return intersectSegmentCircle(p1, p2, cx, cz, r)
    elseif zone.type == 2 then
        local verts = zone.verticies
        for i = 1, #verts do
            local a = verts[i]
            local b = verts[i % #verts + 1]
            -- vertices in zones use x,y for the map plane, but we need "DCS world" x,z for intersectSegments
            local intersection = intersectSegments(p1, p2, {x = a.x, z = a.y}, {x = b.x, z = b.y})
            if intersection then
                return intersection
            end
        end
    end
    return nil
end

-- EVENT SETUP

-- Event handler for racer/spectator unit registration/un-registration.
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

    local group = initiatorUnit:getGroup()
    local groupName = group:getName()

    if event.id == world.event.S_EVENT_BIRTH or event.id == world.event.S_EVENT_PLAYER_ENTER_UNIT then
        raceDebug("Player enter: " .. tostring(playerName) .. ", group " .. groupName .. ", UCID " .. tostring(ucid) .. " (event.id: " .. event.id .. ")")

        -- Check if the group name starts with the desired prefix
        if groupName and string.sub(groupName, 1, #cfg.racerGroupPrefix) == cfg.racerGroupPrefix then
            -- Initialize data structure for the client/unit - this is used in mainRaceLoop function.
            currentRacers[clientId] = {
                playerName = playerName,
                groupName = groupName,
                unit = initiatorUnit,
            }
        else
            spectators[clientId] = {
                playerName = playerName,
                groupName = groupName,
                unit = initiatorUnit,
            }
        end

        -- Menu for checking leaderboard is added to any group when the client joins.
        -- There seems to be no similar functionality on the unit level, so it's best to have 1 unit in each group.
        -- The menu then stays on the group (server-side), so we must do this only once, hence the check.
        local groupId = group:getID()
        if not groupsWithRadioMenu[groupId] then
            missionCommands.addCommandForGroup(groupId, "Race Leaderboard", nil, showRaceLeaderboard, group)
            if cfg.debugMenuForAll or debugMenuAvailableFor(ucid, playerName) then
                missionCommands.addCommandForGroup(groupId, "Race Debug", nil, showDebugMessage, group)
                missionCommands.addCommandForGroup(groupId, "Kill zones: disable", nil, changeKillZoneBehavior, nil, group)
                missionCommands.addCommandForGroup(groupId, "Kill zones: set to kill", nil, changeKillZoneBehavior, 1, group)
                missionCommands.addCommandForGroup(groupId, "Kill zones: set to disqualify", nil, changeKillZoneBehavior, 2, group)
                missionCommands.addCommandForGroup(groupId, "Race debug log tail", nil, displayLogTail, group)
            end
            groupsWithRadioMenu[groupId] = true
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

        if spectators[clientId] then
            spectators[clientId] = nil
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
        soundUnit(racerData.unit, cfg.killSound)
    end
    if racerData.killZoneBehavior == 1 then
        trigger.action.explosion(racerData.unit:getPoint(), 10)
    end
end

-- This is called via DCS scheduler, which provides current time as the 2nd parameter.
local function mainRaceLoop(_, now)
    lastRaceLoopTs = now

    for _, racerData in pairs(currentRacers) do
        -- If startTs is initialized we compute the approximate time inside the zone.
        local timeInsideSeconds = racerData.startTs and math.floor(now - racerData.startTs + 0.5)
        local unit = racerData.unit
        local unitPos = unit:getPoint()
        local formattedTime = tostring(timeInsideSeconds)
        local importantEventSoundPlayed = false -- this var ensures that the important sounds (start, check zone...) are played even in warning altitudes

        local insideRacingZone = inZone(unit, racingZone) -- returns the zone if the unit is in
        if insideRacingZone then
            racerData.lastRacingZone = insideRacingZone -- may be ambiguous, but any zone the racer is in will work
            if racerData.disqualified then
                messageUnit(unit, "You're disqualified, leave the race track area!", 2, true)
            else
                if timeInsideSeconds then
                    messageUnit(unit, "Time inside: " .. formattedTime .. " seconds", 2, true)

                    -- Check the intermediate zones
                    for _, checkZone in ipairs(racingCheckZones) do
                        if inZone(unit, checkZone) and not racerData.zoneCheck[checkZone]
                                and (not cfg.ignoreCheckZoneAboveWarningAltitude or getAltitude(unit, true) < cfg.warningAboveAGL)
                        then
                            raceDebug("Player " .. racerData.playerName .. " entered the check zone " .. checkZone.name)
                            racerData.zoneCheck[checkZone] = true
                            if cfg.checkZoneSound then
                                soundUnit(unit, cfg.checkZoneSound)
                                importantEventSoundPlayed = true
                            end
                        end
                    end
                else
                    messageAll(racerData.playerName .. " (of " .. racerData.groupName .. ") entered the race!", 10)
                    local intersection = intersectSegmentZone(racerData.lastPos, unitPos, insideRacingZone)
                    racerData.startTs = intersection and racerData.lastTs + (now - racerData.lastTs) * intersection.t or now
                    if cfg.enterRaceSound then
                        soundUnit(unit, cfg.enterRaceSound)
                    end
                    importantEventSoundPlayed = true
                    racerData.zoneCheck = {}
                    -- We will save current behavior for this race, it will be used even if the config changes (via debug menu).
                    racerData.killZoneBehavior = cfg.killZoneBehavior
                end

                -- Altitude warning and disqualification
                if racerData.killZoneBehavior == 1 or racerData.killZoneBehavior == 2 then
                    if cfg.killAboveAGL and getAltitude(unit, true) > cfg.killAboveAGL then
                        messageAll(racerData.playerName .. " (of " .. racerData.groupName .. ") flew too high and was disqualified!", 15)
                        disqualify(racerData)
                    elseif cfg.warningAboveAGL and getAltitude(unit, true) > cfg.warningAboveAGL then
                        messageUnit(unit, "WARNING: Reduce your altitude immediately!", 2, true)
                        if cfg.aglWarningSound and not importantEventSoundPlayed then
                            soundUnit(unit, cfg.aglWarningSound)
                        end
                    end
                end
            end
        else
            -- not insideRacingZone
            if racerData.startTs and unit:isExist() then
                -- the unit is NOT in zone, but has startTs - this means it's just left the zone
                local passed, total = checkZones(racerData.zoneCheck)
                if passed == total then
                    local intersection = intersectSegmentZone(racerData.lastPos, unitPos, racerData.lastRacingZone)
                    local correctedNow = intersection and racerData.lastTs + (now - racerData.lastTs) * intersection.t or now
                    timeInsideSeconds = correctedNow - racerData.startTs
                    formattedTime = string.format("%.2f", timeInsideSeconds)
                    --end
                    local finishMessage = racerData.playerName .. " (of " .. racerData.groupName .. ") finished in: " .. formattedTime .. " seconds"
                    messageAll(finishMessage, 20)
                    if cfg.finishRaceSound then
                        soundUnit(unit, cfg.finishRaceSound)
                    end

                    -- We only update log/leaderboard if the kill zone behavior is one of the competitive ones:
                    if racerData.killZoneBehavior == 1 or racerData.killZoneBehavior == 2 then
                        if cfg.logFinishResults then
                            env.info("RACE FINISH|'" .. escapeString(cfg.raceIdentifier) .. "'|'" .. (ucid or "")
                                    .. "'|'" .. escapeString(racerData.playerName) .. "'|'" .. escapeString(unit:getTypeName())
                                    .. "'|'" .. escapeString(racerData.groupName) .. "'|" .. formattedTime)
                        end
                        addResultToLadder(unit:getTypeName(), {
                            player = racerData.playerName,
                            time = timeInsideSeconds,
                        })
                    end
                else
                    messageUnit(unit, "You didn't go through the whole course (" .. passed .. " of " .. total .. "), this attempt does not count.", 6, true)
                    if cfg.unfinishedRaceSound then
                        soundUnit(unit, cfg.unfinishedRaceSound)
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
                    if inZone(unit, zone) then
                        --raceDebug("Player " .. racerData.playerName .. " in kill zone " .. zone:GetName()) -- pollutes the log
                        if not insideRacingZone and racerData.killZoneBehavior == 2 then
                            messageUnit(unit, "You are inside a kill zone (outside the racing area)...", 2, true)
                        else
                            disqualify(racerData)
                            messageAll(racerData.playerName .. " (of " .. racerData.groupName .. ") has left the course and was disqualified!", 15)
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
            if inZone(unit, racingZone) and getAltitude(unit, true) < cfg.spectatorsWarningAgl then
                messageUnit(unit, cfg.spectatorsWarningMessage, 2, true)
                if cfg.aglWarningSound then
                    soundUnit(unit, cfg.aglWarningSound)
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
            if inZone(unit, restartZone) then
                racersInRestartZone = racersInRestartZone + 1
                messageUnit(unit, "You feel something strange around here...", 2, true)
            end
        end
        -- by default ~3/5 quorum of active racers (not spectators) is needed for restart
        if racersTotal > 0 and racersInRestartZone / racersTotal >= (cfg.restartQuorum or 0.6) then
            if not restartTs then
                restartTs = now + cfg.restartTimeoutSeconds
            elseif now > restartTs then
                env.info("RACE RESTARTING - dumping leaderboard:\n" .. leaderboardText())
                messageAll("Restart imminent!", 10)
                trigger.action.setUserFlag(cfg.restartTriggerFlag, true)
                restartTriggered = true
            else
                messageAll("Restarting in " .. math.ceil(restartTs - now) .. " seconds!", 2)
            end
        elseif not restartTriggered then
            if restartTs then
                messageAll("Restart aborted...", 10)
            end
            restartTs = nil
        end
    end

    return now + 1 -- schedule for the next second (tick)
end

if racingZone then
    timer.scheduleFunction(mainRaceLoop, {}, timer.getTime() + 1)
else
    env.warning("RACE no racing zone, main loop disabled!")
end

if cfg.debugLog then
    env.info("RACE Script end")
end
