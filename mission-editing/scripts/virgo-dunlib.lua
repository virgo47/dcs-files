-- DCS Unscripted Library
-- You may include it with DO SCRIPT FILE command, or simply paste it (or parts of it) to DO SCRIPT.
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

-- debug string of an object, based on https://gist.github.com/ripter/4270799
function dunlib.debugString(obj, indent)
    indent = indent or 0
    res = ""
    for k, v in pairs(obj) do
        vType = type(v)
        res = res .. string.rep("  ", indent) .. k .. " (" .. vType .."): "
        if type(v) == "table" then
            res = res .. "\n" .. dunlib.debugString(v, indent + 1)
        else
            res = res .. tostring(v)
        end
        res = res .. "\n"
    end
    return res
end
