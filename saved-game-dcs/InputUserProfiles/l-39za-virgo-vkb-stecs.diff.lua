local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["name"] = "Pitch",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Y",
				},
			},
		},
		["a2002cdnil"] = {
			["name"] = "Roll",
			["removed"] = {
				[1] = {
					["key"] = "JOY_X",
				},
			},
		},
		["a2003cdnil"] = {
			["name"] = "Rudder",
			["removed"] = {
				[1] = {
					["key"] = "JOY_RZ",
				},
			},
		},
		["a2004cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0,
						},
						["deadzone"] = 0.02,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Thrust",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
		},
		["a2049cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.2,
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
					["key"] = "JOY_RY",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Absolute Horizontal Shift Camera View",
		},
		["a2051cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.2,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_RX",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Absolute Vertical Shift Camera View",
		},
		["a2101cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = -0.3,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 0.5,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_RX",
				},
			},
			["name"] = "Wheel Brake",
		},
		["a3006cd1"] = {
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
					["key"] = "JOY_SLIDER1",
				},
			},
			["name"] = "ASP-3NMU Gunsight Target Distance",
		},
		["a3007cd1"] = {
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
					["key"] = "JOY_Z",
				},
			},
			["name"] = "ASP-3NMU Gunsight Target Wingspan Adjustment Dial",
		},
		["a3018cd1"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.15,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = true,
						["saturationX"] = 1,
						["saturationY"] = 0.6,
						["slider"] = true,
					},
					["key"] = "JOY_SLIDER2",
				},
			},
			["name"] = "ASP-3 Glass Raise/Lower",
		},
		["a3041cd21"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = ".",
					},
				},
			},
			["name"] = "RKL-41 ADF Outer Beacon Frequency Tune Knob",
		},
		["a3042cd21"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = ",",
					},
				},
			},
			["name"] = "RKL-41 ADF Inner Beacon Frequency Tune Knob",
		},
		["a3078cd3"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Missile Seeker Tone Volume Knob",
		},
	},
	["keyDiffs"] = {
		["d1199pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
				},
			},
			["name"] = "Radio Channel Knob - Next",
		},
		["d1200pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
				},
			},
			["name"] = "Radio Channel Knob - Previous",
		},
		["d1226pnilunilcdnilvd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
				},
			},
			["name"] = "Radio Squelch Switch - ON/OFF",
		},
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
		["d147pnilunilcdnilvd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
				},
			},
			["name"] = "Airbrake Switch - OPEN",
		},
		["d148pnilunilcdnilvd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
				},
			},
			["name"] = "Airbrake Switch - CLOSE",
		},
		["d177pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
				},
			},
			["name"] = "Zoom normal",
		},
		["d3014pnilunilcd1vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
			["name"] = "ASP-3NMU Gunsight Color Filter, ON/OFF",
		},
		["d3015pnilunilcd37vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN83",
				},
			},
			["name"] = "Landing Gear Handle, Neutral",
		},
		["d3020pnilunilcd20vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Emergency Cockpit Light Switch",
		},
		["d3022pnilunilcd3vd1vpnilvunil"] = {
			["name"] = "Weapon Fire Button Safety",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
		},
		["d3025pnilunilcd37vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Parking Brake Off",
		},
		["d3029pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
				},
			},
			["name"] = "CB Missile Firing Control Circuit Power Switch - OFF",
		},
		["d3029pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
				},
			},
			["name"] = "CB Missile Firing Control Circuit Power Switch - ON",
		},
		["d3031pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN47",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Missile Seeker Heating Circuit Power Switch - OFF",
		},
		["d3031pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN47",
				},
			},
			["name"] = "Missile Seeker Heating Circuit Power Switch - ON",
		},
		["d3032pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN46",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Missile Seeker Glowing Circuit Power Switch - OFF",
		},
		["d3032pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN46",
				},
			},
			["name"] = "Missile Seeker Glowing Circuit Power Switch - ON",
		},
		["d3033pnilunilcd21vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = ".",
					},
				},
			},
			["name"] = "RKL-41 ADF Outer Beacon 100 kHz Frequency Knob - DECREASE",
		},
		["d3033pnilunilcd21vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = ".",
					},
				},
			},
			["name"] = "RKL-41 ADF Outer Beacon 100 kHz Frequency Knob - INCREASE",
		},
		["d3034pnilunilcd21vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = ".",
					},
				},
			},
			["name"] = "RKL-41 ADF Outer Beacon 10 kHz Frequency Knob - DECREASE",
		},
		["d3034pnilunilcd21vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = ".",
					},
				},
			},
			["name"] = "RKL-41 ADF Outer Beacon 10 kHz Frequency Knob - INCREASE",
		},
		["d3036pnilunilcd21vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN61",
					["reformers"] = {
						[1] = ",",
					},
				},
			},
			["name"] = "RKL-41 ADF Inner Beacon 100 kHz Frequency Knob - DECREASE",
		},
		["d3036pnilunilcd21vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN62",
					["reformers"] = {
						[1] = ",",
					},
				},
			},
			["name"] = "RKL-41 ADF Inner Beacon 100 kHz Frequency Knob - INCREASE",
		},
		["d3037pnilunilcd21vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = ",",
					},
				},
			},
			["name"] = "RKL-41 ADF Inner Beacon 10 kHz Frequency Knob - DECREASE",
		},
		["d3037pnilunilcd21vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = ",",
					},
				},
			},
			["name"] = "RKL-41 ADF Inner Beacon 10 kHz Frequency Knob - INCREASE",
		},
		["d3039pnilunilcd3vd0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN20",
				},
			},
			["name"] = "Rockets Firing Mode Selector Switch - AUT.",
		},
		["d3039pnilunilcd3vd0.2vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN25",
				},
			},
			["name"] = "Rockets Firing Mode Selector Switch - 2RS",
		},
		["d3039pnilunilcd3vd0.3vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN26",
				},
			},
			["name"] = "Rockets Firing Mode Selector Switch - 4RS",
		},
		["d3048pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN43",
				},
			},
			["name"] = "Outboard Stations Select Button",
		},
		["d3049pnilu3049cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN43",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Outboard Stations Deselect Button",
		},
		["d3050pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN44",
				},
			},
			["name"] = "Inboard Stations Select Button",
		},
		["d3051pnilu3051cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN44",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Inboard Stations Deselect Button",
		},
		["d3060pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN34",
				},
			},
			["name"] = "Arm/Safe Cannon Gsh-23 Switch - SAFE",
		},
		["d3060pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN33",
				},
			},
			["name"] = "Arm/Safe Cannon Gsh-23 Switch - ARM",
		},
		["d3061pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN48",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "CB Arm Bombs Power Switch - OFF",
		},
		["d3061pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN48",
				},
			},
			["name"] = "CB Arm Bombs Power Switch - ON",
		},
		["d3062pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "CB Arm Outer Guns Power Switch - OFF",
		},
		["d3062pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "CB Arm Outer Guns Power Switch - ON",
		},
		["d3063pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN56",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "CB Arm Inner Guns Power Switch - OFF",
		},
		["d3063pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN54",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "CB Arm Inner Guns Power Switch - ON",
		},
		["d3068pnilunilcd3vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN45",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Gun+PK3 Switch Cover - OPEN/CLOSE",
		},
		["d3069pnilunilcd3vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN45",
				},
			},
			["name"] = "Gun+PK3 Switch - ON/OFF",
		},
		["d3070pnilunilcd3vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN52",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Charge Outer Guns Switch - ON/OFF",
		},
		["d3071pnilunilcd3vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN55",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Charge Inner Guns Switch - ON/OFF",
		},
		["d3072pnilu3072cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN22",
				},
			},
			["name"] = "Pyro Charge Apply Button",
		},
		["d3074pnilunilcd3vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN35",
				},
			},
			["name"] = "Pyro Charge Selector Switch - Down",
		},
		["d3074pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN36",
				},
			},
			["name"] = "Pyro Charge Selector Switch - Up",
		},
		["d3116pnilunilcd4vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN50",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "CB Heating DUA-3 Switch - OFF",
		},
		["d3116pnilunilcd4vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN50",
				},
			},
			["name"] = "CB Heating DUA-3 Switch - ON",
		},
		["d311pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN91",
				},
			},
			["name"] = "Throttle - IDLE",
		},
		["d313pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN89",
				},
			},
			["name"] = "THROTTLE - STOP",
		},
		["d396pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN31",
				},
			},
			["name"] = "Custom Snap View  0",
		},
		["d397pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN37",
				},
			},
			["name"] = "Custom Snap View  1",
		},
		["d398pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
				},
			},
			["name"] = "Custom Snap View  2",
		},
		["d399pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN38",
				},
			},
			["name"] = "Custom Snap View  3",
		},
		["d400pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
				},
			},
			["name"] = "Custom Snap View  4",
		},
		["d401pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN21",
				},
			},
			["name"] = "Custom Snap View  5",
		},
		["d402pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN30",
				},
			},
			["name"] = "Custom Snap View  6",
		},
		["d430pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN65",
				},
			},
			["name"] = "Landing Gear Handle, Up",
		},
		["d431pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN66",
				},
			},
			["name"] = "Landing Gear Handle, Down",
		},
		["d517pnilunilcdnilvd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
				},
			},
			["name"] = "Spotlight Switch - TAXI",
		},
		["d517pnilunilcdnilvd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN52",
				},
			},
			["name"] = "Spotlight Switch - OFF",
		},
		["d517pnilunilcdnilvd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
				},
			},
			["name"] = "Spotlight Switch - LANDING",
		},
		["d583pnilunilcdnilvd0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
				},
			},
			["name"] = "RKL-41 ADF Function Switch - ADF(AUTO)",
		},
		["d583pnilunilcdnilvd0.2vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
			["name"] = "RKL-41 ADF Function Switch - ADF(MANUAL)",
		},
		["d583pnilunilcdnilvd0.3vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
				},
			},
			["name"] = "RKL-41 ADF Function Switch - ANTENNA",
		},
		["d583pnilunilcdnilvd0.4vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN7",
				},
			},
			["name"] = "RKL-41 ADF Function Switch - LOOP",
		},
		["d583pnilunilcdnilvd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
			["name"] = "RKL-41 ADF Function Switch - OFF",
		},
		["d72pnilu72cdnilvd1vpnilvu4"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN54",
				},
			},
			["name"] = "Flaps Flight Position",
		},
		["d72pnilu72cdnilvd2vpnilvu5"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN55",
				},
			},
			["name"] = "Flaps TakeOff Position",
		},
		["d72pnilu72cdnilvd3vpnilvu6"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN56",
				},
			},
			["name"] = "Flaps Landing Position",
		},
		["d73pnilu73cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
				},
			},
			["name"] = "Airbrake Button",
		},
		["d752pnilu753cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN9",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "AChS-1 Cockpit Chronograph Left Knob - Push",
		},
		["d757pnilu758cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN17",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "AChS-1 Cockpit Chronograph Right Knob - Push",
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
		["d84pnilu85cdnilvdnilvpnilvunil"] = {
			["name"] = "Weapon Fire Button",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
		},
		["dnilp210u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Up Right slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UR",
				},
			},
		},
		["dnilp211u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Down Right slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DR",
				},
			},
		},
		["dnilp212u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Down Left slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DL",
				},
			},
		},
		["dnilp213u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Up Left slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UL",
				},
			},
		},
		["dnilp3005unilcd1vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN31",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "ASP-3NMU Gunsight Brightness Knob Decrease",
		},
		["dnilp3005unilcd1vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "ASP-3NMU Gunsight Brightness Knob, Increase",
		},
		["dnilp3018unilcd37vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Emergency Wheel Brake - Down",
		},
		["dnilp3018unilcd37vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Emergency Wheel Brake - Up",
		},
		["dnilp32u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Left slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_L",
				},
			},
		},
		["dnilp33u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Right slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
				},
			},
		},
		["dnilp34u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Up slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
				},
			},
		},
		["dnilp35u214cdnilvdnilvpnilvunil"] = {
			["name"] = "View Down slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
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
	},
}
return diff