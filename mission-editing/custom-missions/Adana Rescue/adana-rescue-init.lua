-- cm = current mission
cm = {}

-- mass in kg added at each site
local WOUNDED_MASS = 200
local UNIT_NAME = "Rescue 1-1"

cm.currentLoad = 0 -- in kg

function cm.addWounded()
    cm.currentLoad = cm.currentLoad + WOUNDED_MASS
    -- see docs at https://wiki.hoggitworld.com/view/DCS_func_setUnitInternalCargo
    trigger.action.setUnitInternalCargo(UNIT_NAME, cm.currentLoad)
    trigger.action.outText("Current load: " .. tostring(cm.currentLoad) .. " kg", 10)
end

function cm.unload()
    cm.currentLoad = 0
    trigger.action.setUnitInternalCargo(UNIT_NAME, 0)
end

-- In FueraZx triggers for rescue zones, simply add action DO SCRIPT with: cm.addWounded()
-- In LlegadaZx triggers (hospital unload) and END trigger, add action DO SCRIPT with: cm.unload()
