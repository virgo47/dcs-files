-- Fuel mission script
-- requires dunlib loaded

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

-- cm = current mission
cm = {}

cm.fuelSetupTable = {}
-- provide fullFuelAmount and fuelUnits for each plane, times/repetitions are set in the event handler
--cm.fuelSetupTable["F-15C"] = {
--}

cm.fuelSetupTable["L-39C"] = {
    -- fuel can be specified in litres (used here) or kgs (in cockpit indicators), 1100 l = 825 kg
    -- 5 fuselage tanks + 2*100l in wingtips (~84% without wingtips); 1300 l = 100%.
    -- Note that the default 84% fuel load shows 1092 l instead of 1100 due to round/floor-ing.
    fullFuelAmount = 1100 + 200,
    fuelUnits = "l"
}
cm.fuelSetupTable["L-39ZA"] = cm.fuelSetupTable["L-39C"]

cm.fuelSetupTable["P-51D"] = {
    -- both wings + fuselage, 100% is full internal without drop tanks
    -- with both drop tanks the fuel returned by unit:getFuel() is > 1
    fullFuelAmount = 184 + 85,
    fuelUnits = "US gal"
}
cm.fuelSetupTable["P-51D-30-NA"] = cm.fuelSetupTable["P-51D"]

function cm:onEvent(event)
    -- it works with PLAYER event, but not with S_EVENT_BIRTH (yet), why?
    if event.id ~= world.event.S_EVENT_BIRTH then --and event.id ~= world.event.S_EVENT_PLAYER_ENTER_UNIT then
        return
    end

    --local eventInfo = "event " .. dunlib.debug(event) .. "\ninitiator: " .. tostring(event.initiator)
    --print(eventInfo)

    local initiatorUnit = event.initiator
    if not initiatorUnit then
        return
    end -- not a unit

    local playerName = initiatorUnit:getPlayerName()
    if not playerName then
        return
    end -- not a player/client

    local typeName = event.initiator:getTypeName()
    local fuelSetup = cm.fuelSetupTable[typeName] or {}
    fuelSetup.unit = initiatorUnit

    fuelSetup.messageRepeatSec = 10
    fuelSetup.messageDuration = 60
    fuelSetup.interMessageEach = 60
    fuelSetup.interMessageDuration = 3600
    fuelSetup.longMessageEach = 360 -- in message count, not secs
    fuelSetup.longMessageDuration = 18000

    dunlib.fuelInfo(fuelSetup)
end

world.addEventHandler(cm)

--local li = dunlib.debugLocals()
--print("LOCAL:\n" .. li)
--print("PARAMS...:\n" .. dunlib.debug({ ... }, 2, nil, true))
--print("_G:\n" .. dunlib.debug(_G))
