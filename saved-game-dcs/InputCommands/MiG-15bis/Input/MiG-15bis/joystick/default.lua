return {
    keyCommands = {
        -- Normal up/down bindings that don't toggle like the original down = iCommandPlaneGearUp/Down commands
        {cockpit_device_id = devices.GEAR_INTERFACE, down = gear_commands.Mig15_Command_LandingGearHandle, value_down = 0, name = _('Landing Gear Handle - DOWN'), category = {_('Systems'), _('Custom')}},
        {cockpit_device_id = devices.GEAR_INTERFACE, down = gear_commands.Mig15_Command_LandingGearHandle, value_down = 1, name = _('Landing Gear Handle - UP'), category = {_('Systems'), _('Custom')}},
    }
}