-- Tests for some math-style stuff in "dunlib".
-- Run this with lua*.exe (whatever version you've got), e.g.: lua5.1.exe dunlib-dcs-unscripted-library-tests.lua
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
        print("PROVIDE TESTED and EXPECTED VALUE for almostEqual!\nTESTED: " .. tostring(a) .. "\nEXPECTED: " .. tostring(b))
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
        {x = 0, z = 0}, {x = 10, y = 0, z = 10},
        {x = 0, y = 0, z = 10}, {x = 10, y = 0, z = 0})
assert(almostEqual(rv.x, 5))
assert(almostEqual(rv.z, 5))
assert(rv.y == nil) -- y components were not provided for both p1 and p2
assert(almostEqual(rv.dir, 1)) -- 0,10 was on the left side of the second vector (CCW)
-- No intersection (parallel lines)
assert(not dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 10, y = 0, z = 0},
        {x = 0, y = 0, z = 5}, {x = 10, y = 0, z = 5}))
-- Touch at endpoint
rv = dunlib.intersectSegments(
        {x = 0, y = 1, z = 0}, {x = 5, y = 2, z = 5},
        {x = 5, y = 0, z = 5}, {x = 0, y = 0, z = 10})
assert(almostEqual(rv.x, 5))
assert(almostEqual(rv.z, 5))
assert(almostEqual(rv.y, 2)) -- altitude at the endpoint
assert(almostEqual(rv.dir, -1)) -- 5,5 was on the right (CW)
-- Overlapping but collinear segments (should return nil)
assert(not dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 10, y = 0, z = 0},
        {x = 5, y = 0, z = 0}, {x = 15, y = 0, z = 0}))
-- Segments that would intersect if extended, but don't within segment range
assert(not dunlib.intersectSegments(
        {x = 0, y = 0, z = 0}, {x = 2, y = 0, z = 0},
        {x = 3, y = 0, z = -1}, {x = 3, y = 0, z = 1}))

-- time approximation test
rv = dunlib.intersectSegmentZone({x = 5, z = 6}, {x = 5, z = 10}, zoneCircle)
assert(almostEqual(rv.x, 5))
assert(not rv.y) -- y not specified for both entry points
assert(almostEqual(rv.z, 8))
assert(almostEqual(rv.t, 0.5)) -- this can mean "the same time out and in"

rv = dunlib.intersectSegmentZone({x = 5, y = 10, z = 8}, {x = 5, y = 16, z = 10}, zoneCircle)
assert(almostEqual(rv.x, 5))
assert(almostEqual(rv.y, 10))
assert(almostEqual(rv.z, 8))
assert(almostEqual(rv.t, 0)) -- this correlates with the start of the segment

rv = dunlib.intersectSegmentZone({x = 5, z = 0}, {x = 5, z = 8}, zoneCircle)
assert(almostEqual(rv.x, 5))
assert(almostEqual(rv.z, 8))
assert(almostEqual(rv.t, 1)) -- end of interval/segment

assert(not dunlib.intersectSegmentZone({x = 5, z = 6}, {x = 5, z = 7}, zoneCircle)) -- no intersection

rv = dunlib.intersectSegmentZone({x = -4, z = 5}, {x = 0, y = 0, z = 1}, zonePoly)
assert(almostEqual(rv.x, -1))
assert(not rv.y) -- y not specified for both entry points
assert(almostEqual(rv.z, 2))
assert(almostEqual(rv.t, 0.75))

rv = dunlib.intersectSegmentZone({x = -3, y = 1, z = -2}, {x = 0, y = 4, z = 1}, zonePoly)
assert(almostEqual(rv.x, -2))
assert(almostEqual(rv.y, 2))
assert(almostEqual(rv.z, -1))
assert(almostEqual(rv.t, 0.3333333))

-- checking if poly-zone intersection works also for the edge between the first and last vertex
rv = dunlib.intersectSegmentZone({x = -4, y = 1, z = 0}, {x = -1, y = 4, z = 0}, zonePoly)
assert(almostEqual(rv.x, -2))
assert(almostEqual(rv.y, 3))
assert(almostEqual(rv.z, 0))
