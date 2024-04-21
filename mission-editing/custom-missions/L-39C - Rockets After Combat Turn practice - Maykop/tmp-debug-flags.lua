-- REQUIREMENTS (skip if dunlib is included by other means):
dunlib = dunlib or {}

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

--------------------------------------
-- requires dunlib.debugFlags
cm = cm or {}

function cm.showFlags(...)
    trigger.action.outText(dunlib.debugFlags(...), 25, false)
end

missionCommands.addCommand('SHOW FLAGS', nil, cm.showFlags,
        {"show", "hide"})
