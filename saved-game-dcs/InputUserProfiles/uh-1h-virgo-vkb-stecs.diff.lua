local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["name"] = "Flight Control Cyclic Pitch",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Y",
				},
			},
		},
		["a2002cdnil"] = {
			["name"] = "Flight Control Cyclic Roll",
			["removed"] = {
				[1] = {
					["key"] = "JOY_X",
				},
			},
		},
		["a2003cdnil"] = {
			["name"] = "Flight Control Yaw (pedals)",
			["removed"] = {
				[1] = {
					["key"] = "JOY_RZ",
				},
			},
		},
		["a2087cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Flight Control Collective",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
		},
		["a3026cd3"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_Z",
				},
			},
			["name"] = "Throttle",
		},
	},
	["keyDiffs"] = {
		["d135pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN21",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "F6 Weapon to target view",
		},
		["d177pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
				},
				[2] = {
					["key"] = "JOY_BTN23",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Zoom normal",
		},
		["d3002pnilu3002cd20vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN63",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Test",
		},
		["d3003pnilunilcd25vd0.8vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN63",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Power OFF",
		},
		["d3003pnilunilcd2vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN45",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Main Fuel Switch",
		},
		["d3004pnilu3004cd41vd1vpnilvu0"] = {
			["name"] = "Pilot Trimmer",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
		},
		["d3005pnilunilcd23vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN63",
					["reformers"] = {
						[1] = "/ FM",
						[2] = "RShift",
					},
				},
			},
			["name"] = "VHF FM Radio Squelch DIS",
		},
		["d3005pnilunilcd25vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Freq. MHz Decrease",
		},
		["d3005pnilunilcd25vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Freq. MHz Increase",
		},
		["d3006pnilu3006cd50vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN16",
				},
			},
			["name"] = "Flare Dispense Button",
		},
		["d3006pnilunilcd20vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Power Switch",
		},
		["d3006pnilunilcd25vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Freq. kHz Decrease",
		},
		["d3006pnilunilcd25vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Freq. kHz Increase",
		},
		["d3007pnilu3007cd7vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
				},
			},
			["name"] = "Landing Light Control Switch Retract else Off (2-way Switch)",
		},
		["d3007pnilu3007cd7vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
				},
			},
			["name"] = "Landing Light Control Switch Extend else Off (2-way Switch)",
		},
		["d3007pnilunilcd23vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN63",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio Mode OFF",
		},
		["d3008pnilunilcd20vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Freq. MHz Decrease",
		},
		["d3008pnilunilcd20vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Freq. MHz Increase",
		},
		["d3008pnilunilcd21vd0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
				},
			},
			["name"] = "Intercom Mode INT",
		},
		["d3008pnilunilcd21vd0.2vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
			["name"] = "Intercom Mode 1",
		},
		["d3008pnilunilcd21vd0.3vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
				},
			},
			["name"] = "Intercom Mode 2",
		},
		["d3008pnilunilcd21vd0.4vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN7",
				},
			},
			["name"] = "Intercom Mode 3",
		},
		["d3008pnilunilcd21vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
			["name"] = "Intercom Mode PVT",
		},
		["d3008pnilunilcd25vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Mode Select (rotary)",
		},
		["d3009pnilu3009cd21vd1vpnilvu0"] = {
			["name"] = "Pilot's radio trigger RADIO (call radio menu)",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
		},
		["d3009pnilunilcd20vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Freq. kHz Decrease",
		},
		["d3009pnilunilcd20vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Freq. kHz Increase",
		},
		["d3009pnilunilcd23vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio 10MHz Decrease",
		},
		["d3009pnilunilcd23vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio 10MHz Increase",
		},
		["d3010pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN52",
					["reformers"] = {
						[1] = "Smod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN64",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio Squelch Switch",
		},
		["d3010pnilunilcd23vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio 1MHz Decrease",
		},
		["d3010pnilunilcd23vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio 1MHz Increase",
		},
		["d3011pnilunilcd22vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
				},
			},
			["name"] = "UHF Preset Channel Decrease",
		},
		["d3011pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
				},
			},
			["name"] = "UHF Preset Channel Increase",
		},
		["d3011pnilunilcd23vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = "/ FM",
						[2] = "RShift",
					},
				},
			},
			["name"] = "VHF FM Radio 100kHz Decrease",
		},
		["d3011pnilunilcd23vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = "/ FM",
						[2] = "RShift",
					},
				},
			},
			["name"] = "VHF FM Radio 100kHz Increase",
		},
		["d3012pnilunilcd22vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
				},
			},
			["name"] = "UHF Radio 10MHz Increase",
		},
		["d3012pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
				},
			},
			["name"] = "UHF Radio 10MHz Decrease",
		},
		["d3012pnilunilcd23vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = "/ FM",
						[2] = "RShift",
					},
				},
			},
			["name"] = "VHF FM Radio 50kHz Decrease",
		},
		["d3012pnilunilcd23vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = "/ FM",
						[2] = "RShift",
					},
				},
			},
			["name"] = "VHF FM Radio 50kHz Increase",
		},
		["d3012pnilunilcd7vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
				},
			},
			["name"] = "Landing Light Switch",
		},
		["d3013pnilunilcd22vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio 1MHz Increase",
		},
		["d3013pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio 1MHz Decrease",
		},
		["d3013pnilunilcd23vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
					["reformers"] = {
						[1] = "/ FM",
						[2] = "RShift",
					},
				},
				[2] = {
					["key"] = "JOY_BTN52",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio Squelch Select (rotary)",
		},
		["d3014pnilunilcd22vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio 50kHz Increase",
		},
		["d3014pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio 50kHz Decrease",
		},
		["d3014pnilunilcd23vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio Mode Select (rotary)",
		},
		["d3015pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
				},
			},
			["name"] = "UHF Radio Freq. Mode Select(rotary)",
		},
		["d3016pnilunilcd22vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN63",
				},
			},
			["name"] = "UHF Radio Mode Select(rotary)",
		},
		["d3016pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Governor Auto/Emer",
		},
		["d3018pnilu3018cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
				},
			},
			["name"] = "Start-up engine",
		},
		["d3019pnilu3019cd3vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Decrease Turbine RPM",
		},
		["d3019pnilu3019cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Increase Turbine RPM",
		},
		["d3023pnilu3023cd9vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN57",
				},
			},
			["name"] = "Jettison Switch",
		},
		["d3025pnilunilcd9vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN57",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Jettison Switch Cover",
		},
		["d3037pnilunilcd7vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN19",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Search light Stow",
		},
		["d3037pnilunilcd7vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN85",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Search light Off",
		},
		["d3037pnilunilcd7vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN88",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Search light On",
		},
		["d396pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN31",
				},
			},
			["name"] = "Snap View 0",
		},
		["d397pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN37",
				},
			},
			["name"] = "Snap View 1",
		},
		["d398pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
				},
			},
			["name"] = "Snap View 2",
		},
		["d399pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN38",
				},
			},
			["name"] = "Snap View 3",
		},
		["d400pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
				},
			},
			["name"] = "Snap View 4",
		},
		["d401pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN21",
				},
			},
			["name"] = "Snap View 5",
		},
		["d402pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN30",
				},
			},
			["name"] = "Snap View 6",
		},
		["d438pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN22",
				},
				[2] = {
					["key"] = "JOY_BTN22",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Night Vision Goggles",
		},
		["d511pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN93",
				},
			},
			["name"] = "Search light Left",
		},
		["d512pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN96",
				},
			},
			["name"] = "Search light Right",
		},
		["d513pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN85",
				},
			},
			["name"] = "Search light Retract",
		},
		["d514pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN88",
				},
			},
			["name"] = "Search light Extend",
		},
		["d7pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "F1 Cockpit view",
		},
		["d83pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Leave Helicopter (3 times)",
		},
		["d84pnilu84cdnilvd1vpnilvu0"] = {
			["name"] = "Pilot weapon release/Machinegun fire",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
		},
		["dnilp3007unilcd20vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Volume Decrease",
		},
		["dnilp3007unilcd20vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = ". VHF",
					},
				},
			},
			["name"] = "VHF AM Radio Volume Increase",
		},
		["dnilp3007unilcd25vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Volume Decrease",
		},
		["dnilp3007unilcd25vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = ", NAV",
					},
				},
			},
			["name"] = "VOR/ILS Volume Increase",
		},
		["dnilp3008unilcd23vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio Volume Decrease",
		},
		["dnilp3008unilcd23vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = "/ FM",
					},
				},
			},
			["name"] = "VHF FM Radio Volume Increase",
		},
		["dnilp3009unilcd22vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio Volume Increase",
		},
		["dnilp3009unilcd22vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "UHF Radio Volume Decrease",
		},
		["dnilp36unilcdnilvdnilvpnilvunil"] = {
			["name"] = "Center View",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
		},
		["dnilp37u291cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN39",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Zoom in",
		},
		["dnilp38u292cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN40",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Zoom out",
		},
		["dnilp39u289cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN39",
				},
			},
			["name"] = "Zoom in slow",
		},
		["dnilp40u290cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN40",
				},
			},
			["name"] = "Zoom out slow",
		},
		["dnilp840unilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN33",
				},
				[2] = {
					["key"] = "JOY_BTN33",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Night Vision Goggles Gain - INC",
		},
		["dnilp841unilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN34",
				},
				[2] = {
					["key"] = "JOY_BTN34",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Night Vision Goggles Gain - DEC",
		},
	},
}
return diff