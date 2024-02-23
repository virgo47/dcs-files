return {
    keyCommands = {
        -- Clock
        {cockpit_device_id = devices.avAChS, down = device_commands.AChSleftpush, up = device_commands.AChSleftpush, value_down = 1, value_up = 0, name = _('Mech clock left lever - PUSH'), category = {_('Clock'), _('Custom')}},
        {cockpit_device_id = devices.avAChS, down = device_commands.AChSrightpush, up = device_commands.AChSrightpush, value_down = 1, value_up = 0, name = _('Mech clock right lever - PUSH'), category = {_('Clock'), _('Custom')}},

        -- Radio squelch toggle? WIP, don't know how: https://forum.dcs.world/topic/340561-squelch-toggle-command-question
        --{cockpit_device_id = devices.RADIO, down = device_commands.Squelch, value_down = -1, name = _('Squelch On/Off'), category = {_('Radio Communications'), _('Custom')}},
        -- TODO remove if the toggle above works
        -- {cockpit_device_id = devices.RADIO, down = device_commands.Squelch, value_down = 0, name = _('Squelch Off'), category = _('Radio Communications')},
        -- {cockpit_device_id = devices.RADIO, down = device_commands.Squelch, value_down = 1, name = _('Squelch On'), category = _('Radio Communications')},
    }
}