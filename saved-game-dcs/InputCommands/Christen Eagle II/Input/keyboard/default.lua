return {
    keyCommands = {

        {down = iCommandPlaneEject, name = 'Eject (3 times)', category = {_('General'), _('Custom')}},

        -- Instruments

        {pressed = device_commands.Barometric_pressure_keyboard_plus, cockpit_device_id = devices.PITOT, value_pressed = 0.0025, name = _('Barometric pressure + (Slow)'), category = {_('Instruments'), _('Custom')}},
        {pressed = device_commands.Barometric_pressure_keyboard_minus, cockpit_device_id = devices.PITOT, value_pressed = -0.0025, name = _('Barometric pressure - (Slow)'), category = {_('Instruments'), _('Custom')}},
        {pressed = device_commands.Barometric_pressure_keyboard_plus, cockpit_device_id = devices.PITOT, value_pressed = 0.01, name = _('Barometric pressure + (Fast)'), category = {_('Instruments'), _('Custom')}},
        {pressed = device_commands.Barometric_pressure_keyboard_minus, cockpit_device_id = devices.PITOT, value_pressed = -0.01, name = _('Barometric pressure - (Fast)'), category = {_('Instruments'), _('Custom')}},

        {pressed = device_commands.Barometric_pressure_keyboard_plus_REAR, cockpit_device_id = devices.PITOT, value_pressed = 0.0025, name = _('Barometric pressure + (Rear cockpit, Slow)'), category = {_('Instruments'), _('Custom')}},
        {pressed = device_commands.Barometric_pressure_keyboard_minus_REAR, cockpit_device_id = devices.PITOT, value_pressed = -0.0025, name = _('Barometric pressure - (Rear cockpit, Slow)'), category = {_('Instruments'), _('Custom')}},
        {pressed = device_commands.Barometric_pressure_keyboard_plus_REAR, cockpit_device_id = devices.PITOT, value_pressed = 0.01, name = _('Barometric pressure + (Rear cockpit, Fast)'), category = {_('Instruments'), _('Custom')}},
        {pressed = device_commands.Barometric_pressure_keyboard_minus_REAR, cockpit_device_id = devices.PITOT, value_pressed = -0.01, name = _('Barometric pressure - (Rear cockpit, Fast)'), category = {_('Instruments'), _('Custom')}},

        -- Lights

        {pressed = device_commands.Cockpit_Lights_kb, cockpit_device_id = devices.LIGHTS, value_pressed = 0.001, name = _('Cockpit Lights + (Slow)'), category = {_('Lights'), _('Custom')}},
        {pressed = device_commands.Cockpit_Lights_kb, cockpit_device_id = devices.LIGHTS, value_pressed = -0.001, name = _('Cockpit Lights - (Slow)'), category = {_('Lights'), _('Custom')}},
        {pressed = device_commands.Cockpit_Lights_kb, cockpit_device_id = devices.LIGHTS, value_pressed = 0.004, name = _('Cockpit Lights + (Fast)'), category = {_('Lights'), _('Custom')}},
        {pressed = device_commands.Cockpit_Lights_kb, cockpit_device_id = devices.LIGHTS, value_pressed = -0.004, name = _('Cockpit Lights - (Fast)'), category = {_('Lights'), _('Custom')}},

        -- Engine

        {down = device_commands.Magnets_multy, cockpit_device_id = devices.ENGINE, value_down = 0, name = _('Magnetos Off'), category = {_('Engine'), _('Custom')}},
        {down = device_commands.Magnets_multy, cockpit_device_id = devices.ENGINE, value_down = 0.25, name = _('Magnetos Right'), category = {_('Engine'), _('Custom')}},
        {down = device_commands.Magnets_multy, cockpit_device_id = devices.ENGINE, value_down = 0.5, name = _('Magnetos Left'), category = {_('Engine'), _('Custom')}},
        {down = device_commands.Magnets_multy, cockpit_device_id = devices.ENGINE, value_down = 0.75, name = _('Magnetos Both'), category = {_('Engine'), _('Custom')}},
        {down = device_commands.Magnets_multy, up = device_commands.Magnets_multy, cockpit_device_id = devices.ENGINE, value_down = 1, value_up = 0.75, name = _('Magnetos Start'), category = {_('Engine'), _('Custom')}},

        {pressed = device_commands.Propeller_press_up, cockpit_device_id = devices.ENGINE, value_pressed = 0.25, name = _('Propeller pitch + (Slow)'), category = {_('Engine'), _('Custom')}},
        {pressed = device_commands.Propeller_press_down, cockpit_device_id = devices.ENGINE, value_pressed = 0.25, name = _('Propeller pitch - (Slow)'), category = {_('Engine'), _('Custom')}},
        {pressed = device_commands.Propeller_press_up, cockpit_device_id = devices.ENGINE, value_pressed = 1, name = _('Propeller pitch + (Fast)'), category = {_('Engine'), _('Custom')}},
        {pressed = device_commands.Propeller_press_down, cockpit_device_id = devices.ENGINE, value_pressed = 1, name = _('Propeller pitch - (Fast)'), category = {_('Engine'), _('Custom')}},

        {pressed = device_commands.Mixture_press_lean, cockpit_device_id = devices.ENGINE, value_pressed = 0.25, name = _('Mixture lean (Slow)'), category = {_('Engine'), _('Custom')}},
        {pressed = device_commands.Mixture_press_rich, cockpit_device_id = devices.ENGINE, value_pressed = 0.25, name = _('Mixture rich - (Slow)'), category = {_('Engine'), _('Custom')}},
        {pressed = device_commands.Mixture_press_lean, cockpit_device_id = devices.ENGINE, value_pressed = 1, name = _('Mixture lean (Fast)'), category = {_('Engine'), _('Custom')}},
        {pressed = device_commands.Mixture_press_rich, cockpit_device_id = devices.ENGINE, value_pressed = 1, name = _('Mixture rich - (Fast)'), category = {_('Engine'), _('Custom')}},

        {down = device_commands.FuelIndicator_Button, up = device_commands.FuelIndicator_Button, cockpit_device_id = devices.FUELGAUGE, value_down = 1, value_up = 0, name = _('Fuel Indicator Mode (F / U)'), category = {_('Engine'), _('Custom')}},
        {down = device_commands.FuelIndicator_Button_Rear, up = device_commands.FuelIndicator_Button_Rear, cockpit_device_id = devices.FUELGAUGE, value_down = 1, value_up = 0, name = _('Fuel Indicator Mode Rear Cockpit (F / U)'), category = {_('Engine'), _('Custom')}},

        -- Electric
        {down = device_commands.Fuse, cockpit_device_id = devices.ELECTRIC, value_down = 1, name = _('Fuse ON'), category = {_('Electric'), _('Custom')}},
        {down = device_commands.Fuse, cockpit_device_id = devices.ELECTRIC, value_down = 0, name = _('Fuse OFF'), category = {_('Electric'), _('Custom')}},
        {down = device_commands.VAmeter, up = device_commands.VAmeter, cockpit_device_id = devices.ELECTRIC, value_down = 1, value_up = 0, name = _('Volt/Ampere Meter mode (Voltage / Amperage)'), category = {_('Electric'), _('Custom')}},

        -- Canopy
        {down = device_commands.Canopy_Jettison, up = device_commands.Canopy_Jettison, cockpit_device_id = devices.CANOPY, value_down = 1, value_up = 0, name = _('Canopy Jettison (Rear)'), category = {_('Canopy'), _('Custom')}},
    },
}