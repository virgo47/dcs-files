-- DCS Unscripted Library
-- You may include it with DO SCRIPT FILE command, or simply paste it (or parts of it) to DO SCRIPT.
-- If you paste it selectively, always start with empty "library" creation - the next line:
dunlib = {}

function dunlib.clearMessagesUnit()
    trigger.action.outTextForUnit(unitId, "", 0, true)
end

-- duration in seconds
function dunlib.messageAll(text, duration, clearView)
    trigger.action.outText(text or "Undefined message!", duration or 10, clearView or false)
end

-- delay and duration in seconds
function dunlib.messageAllDelayed(text, delay, duration, clearView)
    timer.scheduleFunction(function() dunlib.messageAll(text, duration, clearView) end, {}, timer.getTime() + (delay or 2))
end

-- duration in seconds
function dunlib.messageUnit(unitId, text, duration, clearView)
    trigger.action.outTextForUnit(unitId, text or "Undefined message!", duration or 10, clearView or false)
end

-- delay and duration in seconds
function dunlib.messageUnitDelayed(unitId, text, delay, duration, clearView)
    timer.scheduleFunction(function() dunlib.messageUnit(unitId, text, duration, clearView) end, {}, timer.getTime() + (delay or 2))
end

-- debug string for any value of any type, including tables
-- Ignore indent parameter here, this is only used internally by debugTable function.
function dunlib.debug(obj, maxLevel, indent)
    maxLevel = maxLevel or 1
    indent = indent or 0
    if type(obj) == "table" then
        if next(obj) == nil then
            return tostring(obj) .. " (empty)"
        elseif maxLevel > 0 then
            return "<table>:\n" .. dunlib.debugTable(obj, maxLevel - 1, indent + 1)
        else
            return tostring(obj)
        end
    elseif type(obj) == "function" then
        return tostring(obj)
    else
        return tostring(obj) .. " (" .. type(obj) .. ")"
    end
end

-- debug string for table only
function dunlib.debugTable(obj, maxLevel, indent)
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
    for _, k in ipairs(sortedKeys) do
        local v = obj[k]
        if #res > 0 then res = res .. "\n" end
        -- debug call doesn't modify maxLevel/intent, it is modified inside for the next debugTable call
        res = res .. string.rep("  ", indent) .. k .. ": " .. dunlib.debug(v, maxLevel, indent)
    end
    return res
end

-- Interpolates string with #{key} replacing keys for their values using the replacements table.
-- Key can appear multiple times in the string.
function dunlib.interpolate(string, replacements)
    -- https://www.ibm.com/docs/en/ias?topic=manipulation-stringgsub-s-pattern-repl-n
    return string:gsub("#{(.-)}", replacements)
end

-- Log functions, including print override hack
function dunlib.i(...) env.info(...) end
function dunlib.w(...) env.warning(...) end
function dunlib.e(...) env.error(...) end
-- Uncomment if you want to override the print method which otherwise doesn't show anything  in DCS.
-- function print(...) env.info(...) end
