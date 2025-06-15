-- RACE CONFIG Script by 'Virgo' / Member of the Black Angels (Public Domain, see https://unlicense.org)
--
-- Race support script, measuring time inside the racing zone, and providing leaderboard in F10 menu.
-- Additional check zones that must be crossed by the racer can be added (any number, including none).
--
-- CONFIGURATION - load this BEFORE the main "air-race-moose.lua" script!
-- This separates the parts related to the mission (this config) from the script itself.

-- This is an alternative version with ignoreCheckZoneAboveWarningAltitude and kill altitude lifted from 150 to 200 meters.

-- config table
local c = {
    debugLog = true, -- debug info to log file
    debugMessages = false, -- debug messages to all players
    debugMenuForAll = false, -- Race Debug F10 menu items, this makes them available for everyone
    debugMenuFor = {
        -- Format of entries is: ["hashed-ucid"] = true OR ["hashed-ucid"] = "player-name"
        -- Leave empty for no admins, or add UCID hashed with simpleHash function from the script.
        -- Try to use https://onecompiler.com/lua/433srfw6x to hash the UCID online (if still available).
        -- NOTE that this does NOT work for single player! Use debugMenuForAll there.
        ["1f2291ae"] = true, -- Virgo
        ["cbe551c0"] = true, -- Sarge
    },
    logFinishResults = true, -- Logs every finished race to dcs.log in a format for further processing
    logTailSize = 30, -- number of last log messages that can be shown via F10 debug item

    -- Race identifier is used in logged structure to identify the race (can be a mission name or shortcut).
    -- It doesn't have to change if only minor changes are made to the mission (e.g. script fixes),
    -- but should be changed if significant changes are made, e.g. track changes, kill zone changes, etc.
    raceIdentifier = "BA_WarbirdBatumi_v2",
    racingZoneName = "racetrack",
    racerGroupPrefix = "AirRace-",
    -- Following prefixes use Lua pattern matching, which means:
    -- Use % (escape character) before any of the following chars: -.%^$()[]*+?
    -- Because FilterPrefixes actually filters any substring, use ^ at the start of the prefix.
    racingCheckZonePrefix = "^race%-check%-",
    killZonePrefix = "^Kill%-",

    -- Kill zone behavior: 1 = kill, 2 = disqualify, any other value = no behavior
    killZoneBehavior = 2,
    warningAboveAGL = 100,
    killAboveAGL = 200, -- kill or disqualify, this follows killZoneBehavior setting
    ignoreCheckZoneAboveWarningAltitude = true, -- if true, player must be below warning altitude at least for one race loop (~1s) in the check zone

    -- Keep the sound files in some unused trigger, e.g. "resource-files-holder" so they are note removed from the mission!
    -- To make the trigger unused, add condition FLAG IS TRUE with some "NEVER" flag. Add SOUND TO ALL with all the files.
    -- If any of this is nil, or the file is not found, the sound will not be played.
    enterRaceSound = "A10_AutopilotEngage.ogg",
    finishRaceSound = "520200__latranz__industrial-alarm-EINZELN.ogg",
    checkZoneSound = "radiobeep.ogg",
    killSound = "ThiesZonk.ogg",
    aglWarningSound = "altitude-warn.ogg",

    -- Reference points 1000m from the start/end line - OPTIONAL, comment out if not desired.
    -- Easiest way how to find it is to use the ruler in ME and read out CCS coordinates when 1000m away.
    -- Don't forget the right signs!
    startRefPoint = {x = -352812, z = 612463},
    endRefPoint = {x = -354948, z = 616105},
    refDistance = 1000, -- use the same value for both points

    -- Restart support requires a trigger in the ME and a restart zone:
    restartZoneName = "restart-zone", -- leave nil if not supported
    restartQuorum = 0.6, -- in 0-1 range 0.6 is 60% or 3/5 of players
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
