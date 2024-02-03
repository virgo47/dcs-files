-- DCS Unscripted Library
-- You may include it with DO SCRIPT FILE command, or simply paste it (or parts of it) to DO SCRIPT.
-- Always start with "library" creation if not present - the next line:
dunlib = dunlib or {}

-- For all message related functions, unit can be Unit object or unitId (number).
function dunlib.clearMessagesUnit(unit)
    local unitId = unit.className_ == "Unit" and unit:getID() or unit
    trigger.action.outTextForUnit(unitId, "", 0, true)
end

-- duration in seconds
function dunlib.messageAll(text, duration, clearView)
    trigger.action.outText(text or "Undefined message!", duration or 10, clearView or false)
end

-- delay and duration in seconds
function dunlib.messageAllDelayed(text, delay, duration, clearView)
    timer.scheduleFunction(function()
        dunlib.messageAll(text, duration, clearView)
    end, {}, timer.getTime() + (delay or 2))
end

-- duration in seconds
function dunlib.messageUnit(unit, text, duration, clearView)
    local unitId = unit.className_ == "Unit" and unit:getID() or unit
    trigger.action.outTextForUnit(unitId, text or "Undefined message!", duration or 10, clearView or false)
end

-- delay and duration in seconds
function dunlib.messageUnitDelayed(unit, text, delay, duration, clearView)
    timer.scheduleFunction(function()
        dunlib.messageUnit(unit, text, duration, clearView)
    end, {}, timer.getTime() + (delay or 2))
end

-- debug string for any value of any type, including tables
-- Ignore indent parameter here, this is only used internally by debugTable function.
-- Set includeMetatables to true if you want to report also metatables for tables.
function dunlib.debug(obj, maxLevel, indent, includeMetatables)
    maxLevel = maxLevel or 1
    indent = indent or 0
    if type(obj) == "table" then
        if next(obj) == nil then
            return tostring(obj) .. " (empty)"
        elseif maxLevel > 0 then
            return tostring(obj) .. ":\n" .. dunlib.debugTable(obj, maxLevel - 1, indent + 1, includeMetatables)
        else
            return tostring(obj)
        end
    elseif type(obj) == "function" then
        return tostring(obj)
    else
        return tostring(obj) .. " (" .. type(obj) .. ")"
    end
end

-- debug string for table CONTENT only, use dunlib.debug for "table ..." header and indented content
function dunlib.debugTable(obj, maxLevel, indent, includeMetatables)
    if type(obj) ~= "table" then
        return "NOT a table: " .. tostring(obj)
    end

    maxLevel = maxLevel or 1
    indent = indent or 0

    -- we will sort keys for better readability, but numeric keys will be sorted alphabetically
    local sortedKeys = {}
    for k in pairs(obj) do
        table.insert(sortedKeys, tostring(k))
    end
    table.sort(sortedKeys)

    res = ""
    if includeMetatables then
        local mt = getmetatable(obj)
        if mt then
            res = res .. string.rep("  ", indent) .. "<metatable>:\n" ..
                    dunlib.debugTable(mt, maxLevel - 1, indent + 1, includeMetatables)
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
            res = res .. dunlib.debug(v, maxLevel, indent, includeMetatables)
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

-- Interpolates string with #{key} replacing keys for their values using the replacements table.
-- Key can appear multiple times in the string.
-- Function also removes newlines preceded by \, if you want that, use \\ and two newlines.
function dunlib.interpolate(string, replacements)
    -- https://www.lua.org/manual/5.3/manual.html#6.4
    -- parentheses to return only the first value, not both return values
    return (string:gsub("\\\n", ""):gsub("#{(.-)}", replacements))
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
            local chunk = string.sub(str, i, i + CHUNK_LEN - 1) .. "..."
            table.insert(chunks, chunk)
        end
        for i, chunk in ipairs(chunks) do
            env.info(chunk)
        end
    end
end
