return {
    keyCommands = {
        -- Clock
        {cockpit_device_id = devices.avAChS, down = device_commands.AChSleftpush, up = device_commands.AChSleftpush, value_down = 1, value_up = 0, name = _('Mech clock left lever - PUSH'), category = {_('Clock'), _('Custom')}},
        {cockpit_device_id = devices.avAChS, down = device_commands.AChSrightpush, up = device_commands.AChSrightpush, value_down = 1, value_up = 0, name = _('Mech clock right lever - PUSH'), category = {_('Clock'), _('Custom')}},

    }
}