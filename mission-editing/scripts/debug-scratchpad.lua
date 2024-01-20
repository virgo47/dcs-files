-- This uses selected dunlib functions occasionally, but otherwise it's a bunch of top-level functions and snippets.


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

-- print will go to log as INFO now
function print(...) env.info(...) end

-- prints global scope (table)
print(dunlib.debug(_G))

-- Showing local variables, mostly not that important in DCS context:
function inspectLocals()
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

    for name, value in pairs(locals) do
        print(name, value)
    end
end
