-- Insert this into <dcs-install>\Scripts\MissionScripting.lua
-- Just a tech-demo how to declare functions using later sanitized modules.
-- The global variable is available in the mission scripts later.

dunlibLeaderboardIO = (function()
    local lfs = _G['lfs']
    local io = _G['io']

    local function test(env)
        env.info("dunlibLeaderboardIO lfs: " .. tostring(lfs))
        --return nil
    end

    log.info("dunlibLeaderboardIO 2 loaded")
    return {
        test = test
    }
end)()