return {
	keyCommands = {
		{cockpit_device_id = devices.RS, down = 3205, up = 3205, value_down = 1, value_up = 0.5, name = _('Radar Altimeter - TEST else ON (3-way Switch Up)'), category = {_('HUD'), _('Custom')}},
		{cockpit_device_id = devices.VTH, down = 3201, up = 3201, value_down = 1, value_up = 0.5, name = _('HUD - TEST else ON (3-way Switch Up)'), category = {_('HUD'), _('Custom')}},

		-- Wrong device id in the module
		{cockpit_device_id = devices.ELEC, down = cmds.Button_524, up = cmds.Button_524, value_down = 1, value_up = 0, name = _('Warning Lights TEST FIXED'), category = {_('Interior Lights'), _('Custom')}},
	}
}