-- Uses MOOSE
-- Counts how long someone is in the zone.

clientData = clientData or {}
zone = zone or ZONE:FindByName("racetrack")

SET_CLIENT:New():FilterActive(Active):FilterOnce():ForEach(
        function(_client)
            local _inZone = _client:IsInZone(zone)
            local _clientId = _client:GetUCID() or _client:GetPlayer()
            local _group = _client:GetGroup()
            -- TODO filter on unit/group name somehow (e.g. _group.GroupName)

            local _data = clientData[_clientId]
            if _inZone or _data then
                -- Create initial data if not existed
                if not _data then
                    clientData[_clientId] = {
                        startTs = timer.getAbsTime(), -- first time registered
                    }
                end
                _data = clientData[_clientId]

                -- Update the data as needed
                local timeInsideSeconds = timer.getAbsTime() - _data.startTs
                if _inZone then
                    _client:Message("Time inside: " .. tostring(timeInsideSeconds) .. " seconds", 10)
                else
                    _client:Message(_client:GetPlayer() .. " (of " .. _group.GroupName .. ") finished in: " .. tostring(timeInsideSeconds) .. " seconds", 10)

                    -- Removing info from the clientData table (optional)
                    clientData[_clientId] = nil

                    -- Any code to update global table of results goes here...
                end

                -- Only send a message if the status has changed - only for testing, whole IF can be removed.
                --if _inZone ~= _data.lastStatus then
                --    _client:Message("In zone? " .. tostring(_inZone), 5)
                --end
                --_data.lastStatus = _inZone
            end
        end
)
