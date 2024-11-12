-- Uses MOOSE
-- Counts how long someone is in the zone.
-- This is old version that doesn't handle dying or switching slots during race properly.

local COMPETITOR_GROUP_PREFIX = "AirRace-"

clientData = clientData or {}
zone = zone or ZONE:FindByName("racetrack")

SET_CLIENT:New():FilterActive(false):FilterOnce():ForEach(
--SET_CLIENT:New():FilterOnce():ForEach(
        function(_client)
            local _clientId = _client:GetUCID()
            local _clientUnit = _client:GetClientGroupUnit()
            local _group = _client:GetGroup()
            local _groupName = _client:GetClientGroupName()
            local _unitId = _clientUnit and _clientUnit:GetID()
            local _data = clientData[_clientId]
            --if _data or _client:IsAlive() ~= nil then
                env.info("ID: " .. _clientId .. ", group: " .. tostring(_group) .. ", _groupName: " .. tostring(_groupName) .. ", _clientUnit: " .. tostring(_clientUnit) .. ", player " .. tostring(_client:GetPlayer()) .. ", alive? " .. tostring(_client:IsAlive()) .. ", _data: " .. tostring(_data))
            --end
            if true then return end

            -- TODO why does it enter here with live client?
            if not _client:IsAlive() then
                -- if the dead client has some data, they crashed or were destroyed, just disregard their attempt
                if _data then
                    env.info(_data.playerName .. " DEAD")
                    MESSAGE:New(_data.playerName .. " crashed during the race... bad luck!", 10):ToAll()
                    clientData[_clientId] = nil
                end
                return -- we don't care about not-alive clients otherwise
            end

            local _inZone = _client:IsInZone(zone)
            local _group = _client:GetGroup()
            if string.sub(_group.GroupName, 1, #COMPETITOR_GROUP_PREFIX) ~= COMPETITOR_GROUP_PREFIX then
                return
            end

            -- We need to cover the following scenarios:
            -- A: client is in the zone, but has no data (just entered the zone)
            -- B: client is in the zone, and has data (is racing already)
            -- C: client is not in the zone, but has some data (just left the zone)
            if _inZone or _data then
                if not _data then
                    -- Create initial data if not existed (case A)
                    _data = {
                        startTs = timer.getAbsTime(), -- first time registered
                        playerName = _client:GetPlayer(), -- player name, so it's available also after crash
                    }
                    MESSAGE:New(_data.playerName .. " (of " .. _group.GroupName .. ") entered the race!", 10):ToAll()
                    env.info("Adding data for clientId " .. _clientId)
                    clientData[_clientId] = _data
                else
                    -- Update the data as needed (cases B and C)
                    local timeInsideSeconds = timer.getAbsTime() - _data.startTs
                    if _inZone then
                        -- case B, race in progress
                        MESSAGE:New("Time inside: " .. tostring(timeInsideSeconds) .. " seconds", 2, nil, true):ToClient(_client)
                        --env.info("INSIDE " .. _client:GetPlayer())
                    else
                        -- case C, the racer left the course
                        MESSAGE:New(_data.playerName .. " (of " .. _group.GroupName .. ") finished in: " .. tostring(timeInsideSeconds) .. " seconds", 20):ToAll()

                        -- Removing info from the clientData table, so the next start of the same client can be recognized later.
                        clientData[_clientId] = nil

                        -- Any code to update global table of results goes here...
                    end
                end
            end
        end
)
