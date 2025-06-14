-- Tests for some math-style stuff in "dunlib".
-- Run this with lua*.exe (whatever version you've got), e.g.: lua
-- If it doesn't print anything, all is well! :-)

--region FACTORY/SUPPORT
local function createUnit(name, x, y, z)
    return {
        getName = function()
            return name
        end,

        getPoint = function()
            return {x = x, y = y, z = z}
        end,

        getPosition = function()
            return {
                p = {x = x, y = y, z = z},
                x = {x = 1, y = 0, z = 0},
                y = {x = 0, y = 1, z = 0},
                z = {x = 0, y = 0, z = 1}
            }
        end,

        getVelocity = function()
            return {x = 0, y = 0, z = 0}
        end,

        isExist = function()
            return true
        end
    }
end

local function almostEqual(a, b, epsilon)
    if not a or not b then
        print "PROVIDE TESTED and EXPECTED VALUE for almostEqual!"
    end
    epsilon = epsilon or 1e-7
    local diff = math.abs(a - b)
    if diff <= epsilon then
    return true
    end
    -- relative tolerance:
    return diff <= epsilon * math.max(math.abs(a), math.abs(b))
    end
--endregion

-- We save and restore print, because dunlib redefines it globally for convenience.
local _print = print
dofile("dunlib-dcs-unscripted-library.lua")
print = _print

-- TESTS start here
local zoneCircle = {
    type = dunlib.ZONE_TYPE.CIRCLE,
    x = 5,
    y = 10, -- corresponds with z component of unit:getPoint()
    radius = 2
}
local zonePoly = {
    type = dunlib.ZONE_TYPE.POLYGON,
    -- Kinda "tooth" shape, (0,-1) is out of zone, (0,1) is in.
    -- Remember that second (y) component is checked against z component from the unit!
    verticies = {
        {x = -2, y = -2},
        {x = 0, y = 0},
        {x = 2, y = -2},
        {x = 2, y = 2},
        {x = -2, y = 2},
    }
}

local rv -- return value from tested method

-- testing against one zone
assert(dunlib.inZone(createUnit("unit1", 0, 10, -1), zonePoly) == nil)
assert(dunlib.inZone(createUnit("unit1", 0, 10, 1), zonePoly) == zonePoly)
assert(dunlib.inZone(createUnit("unit1", 0, 10, 0), zoneCircle) == nil)
assert(dunlib.inZone(createUnit("unit1", 6, 100, 11), zoneCircle) == zoneCircle)
-- testing against multiple zones
assert(dunlib.inZone(createUnit("unit1", 6, 100, 11), zonePoly, zoneCircle) == zoneCircle)
assert(dunlib.inZone(createUnit("unit1", 0, 100, 1), zonePoly, zoneCircle) == zonePoly)
assert(dunlib.inZone(createUnit("unit1", 7, 100, 12), zonePoly, zoneCircle) == nil)

-- line intersection
rv = dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 10, y = 0, z = 10},
        {x = 0, y = 0, z = 10}, {x = 10, y = 0, z = 0})
assert(almostEqual(rv.x, 5))
assert(almostEqual(rv.z, 5))
-- No intersection (parallel lines)
assert(not dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 10, y = 0, z = 0},
        {x = 0, y = 0, z = 5}, {x = 10, y = 0, z = 5}))
-- Touch at endpoint
rv = dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 5, y = 0, z = 5},
        {x = 5, y = 0, z = 5}, {x = 10, y = 0, z = 0})
assert(almostEqual(rv.x, 5))
assert(almostEqual(rv.z, 5))
-- Overlapping but colinear segments (should return nil)
assert(not dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 10, y = 0, z = 0},
        {x = 5, y = 0, z = 0}, {x = 15, y = 0, z = 0}))
-- Segments that would intersect if extended, but don't within segment range
assert(not dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 2, y = 0, z = 0},
        {x = 3, y = 0, z = -1}, {x = 3, y = 0, z = 1}))

-- time approximation test
assert(almostEqual(dunlib.interpolateZoneEntryTime(10, {x=5, z=6}, 20, {x=5, z=10}, zoneCircle), 15)) -- the same time out and in
assert(almostEqual(dunlib.interpolateZoneEntryTime(10, {x=5, z=8}, 20, {x=5, z=10}, zoneCircle), 10)) -- on the edge when the time interval started
assert(almostEqual(dunlib.interpolateZoneEntryTime(10, {x=5, z=0}, 20, {x=5, z=8}, zoneCircle), 20)) -- just touched the edge at the end of interval (=> now)
assert(almostEqual(dunlib.interpolateZoneEntryTime(10, {x=5, z=6}, 20, {x=5, z=7}, zoneCircle), 20)) -- for future crossing, it returns "now" as fallback

assert(almostEqual(dunlib.interpolateZoneEntryTime(10, {x=-4, z=5}, 20, {x=0, z=1}, zonePoly), 17.5)) -- 75% of time outside
assert(almostEqual(dunlib.interpolateZoneEntryTime(10, {x=-3, z=-2}, 20, {x=0, z=1}, zonePoly), 13.333333)) -- 66% of time inside
