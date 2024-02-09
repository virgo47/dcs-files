-- mission + timer
cm = cm or {}

cm.date = env.mission.date
dunlib.messageAll(string.format("DATE: %04d-%02d-%02d", cm.date.Year, cm.date.Month, cm.date.Day), 20)

-- TODO how can I get fullFuelAmount and fuelUnits for unit type?
dunlib.fuelInfo({
    -- getPlayer() works for single-player only, but unit works fine
    unit = world.getPlayer(),
    -- both wings + fuselage, 100% is full internal without drop tanks
    -- with both drop tanks the fuel returned by unit:getFuel() is > 1
    fullFuelAmount = 184 + 85,
    fuelUnits = "US gal",
    messageRepeatSec = 10,
    --maxRepetitions = 5,
    messageDuration = 60, -- all durations in sec
    interMessageEach = 60, -- in message count, not secs
    interMessageDuration = 3600,
    longMessageEach = 360, -- in message count, not secs
    longMessageDuration = 18000
});
