-- DCS Unscripted Library
-- You may include it with DO SCRIPT FILE command, or simply paste it (or parts of it) to DO SCRIPT.
-- Always start with "library" creation if not present - the next line:
dunlib = dunlib or {}

--region MESSAGES
-- For all message related functions, unit can be Unit object or unitId (number).
function dunlib.clearMessagesUnit(unit)
    local unitId = unit.className_ == "Unit" and unit:getID() or unit
    trigger.action.outTextForUnit(unitId, "", 0, true)
end

-- message to all; duration in seconds
function dunlib.messageAll(text, duration, clearView)
    trigger.action.outText(text or "Undefined message!", duration or 10, clearView or false)
end

-- delay and duration in seconds
function dunlib.messageAllDelayed(text, delay, duration, clearView)
    timer.scheduleFunction(function()
        dunlib.messageAll(text, duration, clearView)
    end, {}, timer.getTime() + (delay or 2))
end

-- message for a unit; duration in seconds
function dunlib.messageUnit(unit, text, duration, clearView)
    local unitId = unit.className_ == "Unit" and unit:getID() or unit
    trigger.action.outTextForUnit(unitId, text or "Undefined message!", duration or 10, clearView or false)
end

-- delay and duration in seconds
function dunlib.messageUnitDelayed(unit, text, delay, duration, clearView)
    timer.scheduleFunction(function()
        -- exists check just in case the unit disappeared during the timer delay
        if (unit:isExist()) then
            dunlib.messageUnit(unit, text, duration, clearView)
        end
    end, {}, timer.getTime() + (delay or 2))
end

-- message for a group; duration in seconds
function dunlib.messageGroup(group, text, duration, clearView)
    local groupId = group.className_ == "Group" and group:getID() or group
    trigger.action.outTextForGroup(groupId, text or "Undefined message!", duration or 10, clearView or false)
end
--endregion

--region DEBUG, PRINT, INTERPOLATE
-- debug string for any value of any type, including tables
-- Ignore indent parameter here, this is only used internally by debugTable function.
-- Set includeMetatables to true if you want to report also metatables for tables.
-- Set functionInfo to true if you want to see the source location of the function.
function dunlib.debug(obj, maxLevel, indent, includeMetatables, functionInfo)
    maxLevel = maxLevel or 1
    indent = indent or 0
    if type(obj) == "table" then
        if next(obj) == nil then
            return tostring(obj) .. " (empty)"
        elseif maxLevel > 0 then
            return tostring(obj) .. ":\n" .. dunlib.debugTable(obj, maxLevel - 1, indent + 1, includeMetatables, functionInfo)
        else
            return tostring(obj)
        end
    elseif type(obj) == "function" then
        if functionInfo then
            local info = debug.getinfo(obj)
            if info then
                return string.format("%s defined in %s at line %d", tostring(obj), info.source, info.linedefined)
            end
        end
        return tostring(obj)
    else
        return tostring(obj) .. " (" .. type(obj) .. ")"
    end
end

-- debug string for table CONTENT only, use dunlib.debug for "table ..." header and indented content
function dunlib.debugTable(obj, maxLevel, indent, includeMetatables, functionInfo)
    if type(obj) ~= "table" then
        return "NOT a table: " .. tostring(obj)
    end

    maxLevel = maxLevel or 1
    indent = indent or 0

    -- we will sort keys for better readability
    local sortedKeys = {}
    for k in pairs(obj) do
        table.insert(sortedKeys, k)
    end
    table.sort(sortedKeys, function(a, b)
        if type(a) == type(b) then
            return a < b
        else
            return tostring(a) < tostring(b)
        end
    end)

    local res = ""
    if includeMetatables then
        local mt = getmetatable(obj)
        if mt then
            res = res .. string.rep("  ", indent) .. "<metatable>:\n" ..
                    dunlib.debugTable(mt, maxLevel - 1, indent + 1, includeMetatables, functionInfo)
        end
    end
    for _, k in ipairs(sortedKeys) do
        local v = obj[k]
        if #res > 0 then
            res = res .. "\n"
        end
        res = res .. string.rep("  ", indent) .. k .. ": "
        if v == obj then
            res = res .. tostring(v) .. " (same table)"
        else
            -- debug call doesn't modify maxLevel/intent, it is modified inside for the next debugTable call
            res = res .. dunlib.debug(v, maxLevel, indent, includeMetatables, functionInfo)
        end
    end
    return res
end

-- debug string containing local variables
-- Don't use this in other calls to avoid infecting the result with (temporary) stuff:
-- local li = dunlib.debugLocals() -- li will not appear in the results, it doesn't exist yet
-- print("Locals:\n" .. li) -- now the prefix string will not appear in the locals as (temporary)
function dunlib.debugLocals()
    local frame = 2 -- Adjust the frame based on your script structure
    local locals = {}
    local index = 1

    while true do
        local name, value = debug.getlocal(frame, index)
        if not name then
            break
        end
        locals[name] = value
        index = index + 1
    end

    local res = ""
    for name, value in pairs(locals) do
        if #res > 0 then
            res = res .. "\n"
        end
        res = res .. name .. ": " .. tostring(value) .. " (" .. type(value) .. ")"
    end
    return res
end

-- Interpolates string template with #{key} replacing keys for their values using the replacements table.
-- Key can appear multiple times in the string.
-- Function also removes newlines preceded by \, if you want that, use \\ and two newlines.
function dunlib.interpolate(string, replacements)
    -- https://www.lua.org/manual/5.3/manual.html#6.4
    -- parentheses to return only the first value, not both return values
    return (string:gsub("\\\n", ""):gsub("#{(.-)}", tostring(replacements)))
end

-- Log functions, including print override hack
function dunlib.i(...)
    env.info(...)
end
function dunlib.w(...)
    env.warning(...)
end
function dunlib.e(...)
    env.error(...)
end
function dunlib.debugDummyString(length)
    local str = ""
    local i = 0
    local LINE_LEN = 50
    while i < length do
        if i % LINE_LEN == 0 then
            str = str .. string.format("%05d", i)
            i = i + 4
        elseif i % LINE_LEN == LINE_LEN - 1 then
            str = str .. '\n'
        elseif i % 10 == 0 then
            str = str .. ':'
        else
            str = str .. '.'
        end
        i = i + 1
    end
    return str
end

-- overrides the default print to:
-- 1) if lfs and io is available, it will write the string (first param only!) to <local-dcs>\Logs\dunlib.log
-- 2) otherwise it will write the string (first param only!) to normal log, splitting it to 4000-long chunks
-- to go around the log entry length limit (4096 chars)
function print(str, inGameToAll)
    local MAX_LOG_LEN = 4096
    if inGameToAll then
        local REASONABLE_CPS = 25 -- characters per second reading speed
        if #str > MAX_LOG_LEN then
            dunlib.messageAll("Displaying a very long (" .. #str .. " chars) message... will take ~" .. #str / REASONABLE_CPS .. " seconds.", #str / REASONABLE_CPS)
        end
        dunlib.messageAll(str, #str / REASONABLE_CPS)
    end

    -- TODO if lfs/io stuff
    if #str < MAX_LOG_LEN then
        env.info(str)
    else
        local CHUNK_LEN = 4000
        local chunks = {}
        for i = 1, #str, CHUNK_LEN do
            local chunk = string.sub(str, i, i + CHUNK_LEN - 1)
            if i + CHUNK_LEN < #str then
                chunk = chunk .. "..."
            end
            table.insert(chunks, chunk)
        end
        for _, chunk in ipairs(chunks) do
            env.info(chunk)
        end
    end
end
--endregion

--region FLAGS
-- Toggles flag from 0 to 1 and vice versa, if the flag does not exists, it is set to 1 (true).
function dunlib.toggleFlag(flagName)
    local current = trigger.misc.getUserFlag(flagName) or 0
    trigger.action.setUserFlag(flagName, current == 0 and 1 or 0)
end

-- Returns string with flag values for provided flags.
function dunlib.debugFlags(...)
    local args = {...}
    if type(args[1]) == "table" then
        args = args[1]
    end

    local res = ""
    for _, flagName in ipairs(args) do
        if #res > 0 then
            res = res .. "\n"
        end
        local flagValue = trigger.misc.getUserFlag(flagName)
        res = res .. flagName .. ": " .. flagValue
    end

    return res
end
--endregion

--region ZONES
-- Helper function checking if the point is in the polygon.
-- This uses ray casting algorithm and works fine for any polygon, including concave ones.
function dunlib._pointInPolygon(px, pz, vertices)
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

-- Checks if the unit is in any of the provided zones (vararg, second and following args).
-- Returns the zone the unit is in (truthy) or nil (falsy).
function dunlib.inZone(unit, ...)
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
            if dunlib._pointInPolygon(px, pz, zone.verticies) then
                return zone
            end
        else
            -- Unsupported or malformed zone
            return nil
        end
    end

    return nil
end

-- Executes callback function for all the zones matching the namePattern.
-- See https://www.lua.org/pil/20.2.html for Lua string patterns.
function dunlib.forEachZoneMatching(namePattern, callback)
    for _, zone in pairs(env.mission.triggers.zones) do
        if string.match(zone.name, namePattern) then
            callback(zone)
        end
    end
end

--endregion

--region VARIOUS
----------------------------------------------------------------------------------------------------
-- HIGHER LEVEL HELPER/DEBUG FUNCTIONS, mostly unit related:

--[[
Prints fuel information for the params.unit, the rest of params is optional:
Example params:
{
    unit = world.getPlayer(), -- player unit for single-player mission
    fullFuelAmount = 184 + 85, -- full internal fuel for P-51D
    fuelUnits = "US gal",
    messageRepeatSec = 10, -- if omitted, it will be one time message
    maxRepetitions = 5, -- if present, repeated message stops after this count
    messageDuration = 60, -- all durations in sec
    interMessageEach = 60, -- in message count, not secs
    interMessageDuration = 3600,
    longMessageEach = 360, -- in message count, not secs
    longMessageDuration = 18000
}
]]
function dunlib.fuelInfo(params)
    if not params.unit or not params.unit:isExist() then
        return -- no more printing for this guy
    end

    params.counter = params.counter or 0

    local secsInDay = timer.getAbsTime()
    local hours = math.floor(secsInDay / 3600)
    local minutes = math.floor((secsInDay % 3600) / 60)
    local seconds = secsInDay % 60

    local duration = params.messageDuration or 20 -- default 20s if not provided
    if params.longMessageEach and params.longMessageDuration
            and params.counter % params.longMessageEach == 0 then
        duration = params.longMessageDuration
    elseif params.interMessageEach and params.interMessageDuration
            and params.counter % params.interMessageEach == 0 then
        duration = params.interMessageDuration
    end

    local fuelRatio = params.unit:getFuel()
    local fuelPercent = math.floor(fuelRatio * 100 + 0.5)

    local msg
    if params.fullFuelAmount then
        msg = string.format("%02d:%02d:%02d - FUEL: %.2f %s (%d%%)",
                hours, minutes, seconds, params.fullFuelAmount * fuelRatio, params.fuelUnits or "?", fuelPercent)
    else
        msg = string.format("%02d:%02d:%02d - FUEL: %d%%", hours, minutes, seconds, fuelPercent)
    end
    dunlib.messageUnit(params.unit, msg, duration)

    if params.messageRepeatSec then
        params.counter = params.counter + 1
        if params.maxRepetitions and params.counter >= params.maxRepetitions then
            return -- no more scheduling
        end
        timer.scheduleFunction(dunlib.fuelInfo, params, timer.getTime() + params.messageRepeatSec)
    end
end
--endregion
