-- (CONFIG) Script by 'Virgo' / Member of the Black Angels
--
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
--
-- CONFIGURATION - load this BEFORE the main "air-race-moose.lua" script!
-- This separates the parts related to the mission (this config) from the script itself.

-- config table
local c = {
    debugLog = true, -- debug info to log file
    debugMessages = false, -- debug messages to all players
    debugMenu = true, -- Race Debug F10 menu items
    logFinishResults = true, -- Logs every finished race to dcs.log in a format for further processing
    raceIdentifier = "BA_HeloLochini_v4_9a", -- used in logged structure to identify the race (can be a mission name or shortcut)
    logTailSize = 30, -- number of last log messages that can be shown via F10 debug item

    racingZoneName = "racetrack",
    racerGroupPrefix = "AirRace-",
    -- Following prefixes are used in MOOSE set FilterPrefixes() and use Lua pattern matching, which means:
    -- Use % (escape character) before any of the following chars: -.%^$()[]*+?
    -- Because FilterPrefixes actually filters any substring, use ^ at the start of the prefix.
    racingCheckZonePrefix = "^race%-check%-",
    killZonePrefix = "^Kill%-",

    -- Kill zone behavior: 1 = kill, 2 = disqualify, any other value = no behavior
    killZoneBehavior = 2,
    warningAboveAGL = 21,
    killAboveAGL = 31, -- kill or disqualify, this follows killZoneBehavior setting

    -- Keep the sound files in some unused trigger, e.g. "resource-files-holder" so they are note removed from the mission!
    -- To make the trigger unused, add condition FLAG IS TRUE with some "NEVER" flag. Add SOUND TO ALL with all the files.
    -- If any of this is nil, or the file is not found, the sound will not be played.
    enterRaceSound = "A10_AutopilotEngage.ogg",
    finishRaceSound = "520200__latranz__industrial-alarm-EINZELN.ogg",
    checkZoneSound = "Passed-checkpoi.ogg",
    killSound = "ThiesZonk.ogg",
    aglWarningSound = "altitude-warn.ogg",

    -- Reference points 1000m from the start/end line - OPTIONAL, comment out if not desired.
    -- Easiest way how to find it is to use the ruler in ME and read out CCS coordinates when 1000m away.
    -- Don't forget the right signs!
    startRefPoint = {x = -314063, z = 895054},
    endRefPoint = {x = -313904, z = 895206},
    refDistance = 1000, -- use the same value for both points

    -- Restart support requires a trigger in the ME and a restart zone:
    restartZoneName = "restart-zone", -- leave nil if not supported
    restartTimeoutSeconds = 10,
    -- add ONCE trigger with FLAG IS TRUE for this flag name with action END MISSION, winner NEUTRAL
    restartTriggerFlag = "restart",
}

-- Following values depend on previously used values, so they must be defined after the table.
-- You can redefine them, if you don't like the defaults.

c.spectatorsWarningAgl = c.killAboveAGL * 2 -- in meters
-- Reported warning altitude is rounded to tens ft up (conversion factor is divided by 10 already):
c.spectatorsWarningReportedAglRoundedFeet = math.ceil(c.spectatorsWarningAgl * 0.328084) * 10
c.spectatorsWarningMessage = "Spectators should stay at least " .. c.spectatorsWarningReportedAglRoundedFeet
        .. " feet above the course to avoid disturbing the participants."

-- "Time preciser" will be true only if all three above are set:
c.timePreciser = (c.startRefPoint and c.endRefPoint and c.refDistance) ~= nil

-- Longer name is used for the global variable used to communicate this to the main script:
dunlibRacingConfig = c
