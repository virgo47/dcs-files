-- requires dunlib.debugFlags
cm = cm or {}

function cm.showFlags(...)
    trigger.action.outText(dunlib.debugFlags(...), 25, false)
end

missionCommands.addCommand('SHOW FLAGS', nil, cm.showFlags,
        {"toggle", "state"})
