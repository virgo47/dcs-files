return {
    keyCommands = {
        -- Horizon cage/uncage, see https://forum.dcs.world/topic/270876-cageuncage-horizon-keybind/?do=findComment&comment=4672435
        {down = device_commands.Button_7, cockpit_device_id = devices.AH, value_down = 1.0, name = _('Horizon Uncage'), category = {_('Front Dash'), _('Custom')}},
        -- attempt fix, they have it as Button_8 lower down (doesn't seem to work both ways though)
        -- original binding: {down = device_commands.Button_8, cockpit_device_id = devices.AH, value_down = 1.0, name = _('Horizon Cage'), category = _('Front Dash')},
        {down = device_commands.Button_7, cockpit_device_id = devices.AH, value_down = 0.0, name = _('Horizon Cage FIXED'), category = {_('Front Dash'), _('Custom')}},
        {down = device_commands.Button_7, up = device_commands.Button_7, cockpit_device_id = devices.AH, value_down = 1.0, value_up = 0.0, name = _('Horizon Cage/Uncage toggle'), category = {_('Front Dash'), _('Custom')}},
    }
}
