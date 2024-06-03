return {
    keyCommands = {
        -- Landing light, support for momentary action
        {down = device_commands.Button_7, up = device_commands.Button_7, cockpit_device_id = devices.NAVLIGHT_SYSTEM, value_down = 1, value_up = 0, name = _('Landing Light Control Switch Extend else Off (2-way Switch)'), category = {_('Ins Collective Stick'), _('Custom')}},
        {down = device_commands.Button_7, up = device_commands.Button_7, cockpit_device_id = devices.NAVLIGHT_SYSTEM, value_down = -1, value_up = 0, name = _('Landing Light Control Switch Retract else Off (2-way Switch)'), category = {_('Ins Collective Stick'), _('Custom')}},

        -- Weapon switches, per-position bindings
        {down = device_commands.Button_8, cockpit_device_id = devices.WEAPON_SYS, value_down = 1, name = _('Armament Switch Armed'), category = {_('Armament System'), _('Custom')}},
        {down = device_commands.Button_8, cockpit_device_id = devices.WEAPON_SYS, value_down = 0, name = _('Armament Switch Safe'), category = {_('Armament System'), _('Custom')}},
        {down = device_commands.Button_8, cockpit_device_id = devices.WEAPON_SYS, value_down = -1, name = _('Armament Switch Off'), category = {_('Armament System'), _('Custom')}},

        {down = device_commands.Button_9, cockpit_device_id = devices.WEAPON_SYS, value_down = 1, name = _('Gun Selector Switch Right'), category = {_('Armament System'), _('Custom')}},
        {down = device_commands.Button_9, cockpit_device_id = devices.WEAPON_SYS, value_down = 0, name = _('Gun Selector Switch All'), category = {_('Armament System'), _('Custom')}},
        {down = device_commands.Button_9, cockpit_device_id = devices.WEAPON_SYS, value_down = -1, name = _('Gun Selector Switch Left'), category = {_('Armament System'), _('Custom')}},
    }
}
