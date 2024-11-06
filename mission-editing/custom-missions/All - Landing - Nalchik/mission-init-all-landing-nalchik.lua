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

-- duration in seconds
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

cm.messageTable = {}
-- ]] on a new line leaves one blank line... but it's not actually that bad.
cm.messageTable["AJS37"] = [[
VFR LANDING:

You're starting 11 nm from the RWY threshold at Nalchik.

PLAN:

1. TODO
]]
cm.messageTable["F-15C"] = [[
VFR LANDING:

You're starting 11 nm from the RWY threshold at Nalchik.
TODO: Mode NAV or ILS, 

OPTIONAL:

Contact ATC, declare approach; ATC will respond with QFE.
Ignore any direction instructions, continue head on.

DCS F-15C doesn't have QFE setting, add aerodrome elevation 1410 ft to all altitude readings!

A visual landing in the Eagle is simple in concept:
1. Decelerate to 250 knots - recommended holding speed.
2. Lower the gear and flaps.
3. When the AOA (angle of attack) reaches about 20, use the stick to hold it between 20-22, \
and use the throttle to control the altitude.
4. When the runway is 3 degrees below the horizon, adjust the throttle to place the velocity \
vector near the beginning of the runway, so that you follow a 3 degree glide path to the runway.
5. When you're seconds from touchdown, flare (pull up on the stick until the velocity vector is \
just below the horizon - about half a degree), and pull the throttle to idle.
6. When you touch down, pull back to a 13 degree pitch attitude for aerobraking.
7. When you slow below 100 knots, lower the nose and apply wheel brakes to come to a stop.

Outer NDB: 2.1 nm, AGL 700 ft, MSL 2110 ft
Inner NDB: 0.7 nm, AGL 230 ft, MSL 1640 ft
]]
cm.messageTable["F-16C_50"] = [[
You're starting 11 nm from the RWY threshold at Nalchik.

VFR LANDING:

A visual landing in the Viper is simple in concept:
1. Decelerate to below 300 kt (max M 0.65) and lower the landing gear. There is no flaps control for normal situations. \
You can land with or without air brakes extended.
2. After the landing gear extends, AOA Bracket appears on the HUD. \
Try to align the Flight Path Marker (FPM) and the upper part of the bracket with the runway threshold. \
At the same time, the FPM should be aligned with the Command Steering Symbol (a small circle with the line pointing up).
3. Fly to position the 2.5° Pitch Ladder Line on the RWY threshold. \
Align it with the FPM while keeping the FPM inside the bracket with the throttle (speed).
4. Before touchdown, position the FPM 300–500 ft forward, keep 11–13° AOA.
5. Idle the throttle and touch down with a maximum AOA of 13°. \
Don't exceed 15° AOA to avoid striking air brakes or the tail (nozzle).
6. Maintain aerobraking with up to 13° AOA until the speed falls under 100 kt, then lower the nosewheel.
7. Apply moderate to heavy braking, fully open the speedbrakes and pull stick fully aft.
8. Engage nosewheel steering (NWS) under 30 kt, unless required earlier. \
Avoid hard turns above 10 kt.

NOTE: MAN RNG/UNCAGE knob can be depressed to declutter the HUD. \
This moves heading tape to the top and removes roll and ILS indicators.
]]
cm.messageTable["L-39C"] = [[
VFR LANDING:

You're starting 17 km from the RWY threshold at Nalchik.

OPTIONAL:

1) Contact ATC (radio channel #2), declare approach; ATC will respond with QFE.
Ignore any direction instructions, continue head on.
2) Set Altimeter based on the QFE (722.79).
3) Set/check RMI to RWY heading (done here).

PLAN:

15 km: 600 m, 330 km/h, extend gear, landing lights
12 km: 600 m, 280 km/h, flaps at 25
6 km: 300 m, 280 km/h, flaps to 44
Outer NDB: 260 m, 260 km/h
Inner NDB: 60-80 m, 230 km/h
RWY threshold: 10 m, 210 km/h
Touchdown speed: 180 km/h
]]
cm.messageTable["L-39ZA"] = cm.messageTable["L-39C"]
cm.messageTable["MiG-21Bis"] = [[
VFR LANDING:

You're starting 21 km from the RWY threshold at Nalchik.

How cool is this!
TODO
]]
cm.messageTable["P-51D"] = [[
Set the course to 229°, which is the magnetic direction of the runway.

Radio A is set to 136 MHz for Nalchik, you can contact them for Inbound.
Set QFE 28.46 to match the aerodrome elevation of 1410 ft (430 m).
Ignore the heading direction.

Don't fly under 15" of manifold pressure (MP) to avoid spark plug foul.

1. Flyover upwind low, then brake away and up to the direction specified for the aerodrome, or away \
from the wind. There is no wind today, so you can choose whatever direction you want.
You can open the canopy during the turn under around 200 mph.
You can use 10-20° flaps to bleed some speed if necessary.
2. Set RPM to 2700.
3. You should end up at 1000' downwind with the wingtip touching the runway.
4. At 170 mph, lower the gear and check for the green light.
5. Keep 20 to 23" MP, slow down and lower flaps incrementally.
Full flaps before turning on final.
6. Rudder trim to 5° for going around, or 0 - at your own discretion.
7. When the wingtip touches the end of the runway start turning on final.
Fly curved approach to see the touchdown point all the time.
8. Maintain 120 mph with the elevator. Trim the elevator.
Stay on the glideslope using the throttle.
9. Over the threshold level the plane just above the runway.
Keep the 3-point attitude and lower the throttle.
You should touch down under 100 mph.
10. After touchdown, keep the stick back to keep the tail down and to enable steering.
Don't brake while fast.
11. Open the canopy if not open already.
12. At taxi speed:
- Raise the flaps
- RPM fully forward
- Turn off the fuel booster pump
- Manually open radiator coolant and oil flaps
13. After parking:
- Lower the flaps fully
- Set trim to take-off
14. Turn off radio, pitot and gun heat.
15. Throttle up to 1500 RPM to clean the spark plugs.
After few secs, mixture to cutoff position.
16. After the propeller fully stops:
- Turn off the mags (ignition)
- Turn off the fuel shut-off
- Release the hydraulic pressure (red lever)
- Lock the controls (stick)
- Cage the gyro horizon

Now you can leave the plane...
]]
cm.messageTable["P-51D-30-NA"] = cm.messageTable["P-51D"]

cm.defaultMessage = [[ 
Sorry, no instructions for #{typeName}.\nGet it down somehow...
]]
function cm:onEvent(event)
    -- it works with PLAYER event, but not with S_BIRTH (yet), why?
    if event.id ~= world.event.S_BIRTH and event.id ~= world.event.S_EVENT_PLAYER_ENTER_UNIT then
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
    local msg = dunlib.interpolate(
            cm.messageTable[typeName] or cm.defaultMessage,
            {
                typeName = typeName,
            }) -- TODO expand table of possible replacements
    -- 3s delay, show for 10 mins, true for clear view
    dunlib.messageUnitDelayed(initiatorUnit, msg, 3, 600, true)
end

world.addEventHandler(cm)

--local li = dunlib.debugLocals()
--print("LOCAL:\n" .. li)
--print("PARAMS...:\n" .. dunlib.debug({ ... }, 2, nil, true))
--print("_G:\n" .. dunlib.debug(_G))

