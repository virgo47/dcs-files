-- See https://forum.dcs.world/topic/347161-repeated-toggling-a-message-with-flags-using-space-gets-stuck/?do=findComment&comment=5417450
-- This is generally an overkill for plane specific missions which are better to use single Player slot.
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

cm = cm or {}

cm.messageTable = {}
-- ]] on a new line leaves one blank line... but it's not actually that bad.
cm.messageTable["TF-51D"] = [[
Propeller info
]]
cm.messageTable["Su-25T"] = [[
Su-25T
]]

function cm.defaultMessage(unit)
    return "Sorry, no instructions for " .. unit:getTypeName() .. "."
end

-- Call this in the "show" trigger to show different message for each type.
function cm.showMessage()
    trigger.action.outTextForUnit(cm.currentUnit:getID(),
            cm.messageTable[cm.currentUnit:getTypeName()] or cm.defaultMessage(cm.currentUnit),
            999, true)
end

-- event handler detecting new player/client
function cm:onEvent(event)
    -- it works with PLAYER event, but not with S_BIRTH (yet), why?
    if event.id ~= world.event.S_BIRTH and event.id ~= world.event.S_EVENT_PLAYER_ENTER_UNIT then
        return
    end

    local initiatorUnit = event.initiator
    if not initiatorUnit then
        return
    end -- not a unit

    local playerName = initiatorUnit:getPlayerName()
    if not playerName then
        return
    end -- not a player

    cm.currentUnit = initiatorUnit
    trigger.action.setUserFlag("spawn", 1)
end

world.addEventHandler(cm)

function cm.debug()
    trigger.action.outText("Current unit: " .. tostring(cm.currentUnit) .. "\n" ..
            dunlib.debugFlags("spawn", "toggle", "state"), 25, false)
end

missionCommands.addCommand('DEBUG', nil, cm.debug, nil)
