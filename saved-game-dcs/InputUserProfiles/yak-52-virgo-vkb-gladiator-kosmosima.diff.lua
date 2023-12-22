local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.25,
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
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Pitch",
		},
		["a2002cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.25,
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
					["key"] = "JOY_X",
				},
			},
			["name"] = "Roll",
		},
		["a2003cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.25,
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
					["key"] = "JOY_RZ",
				},
			},
			["name"] = "Rudder",
		},
		["a2010cdnil"] = {
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
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 0.4,
						["slider"] = false,
					},
					["key"] = "JOY_RX",
				},
			},
			["name"] = "Absolute Camera Horizontal View",
		},
		["a2011cdnil"] = {
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
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 0.5,
						["slider"] = false,
					},
					["key"] = "JOY_RY",
				},
			},
			["name"] = "Absolute Camera Vertical View",
		},
		["a2012cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = -0.14,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_SLIDER1",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
						[3] = "LShift",
					},
				},
			},
			["name"] = "Zoom View",
		},
		["a3004cd27"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "LANDYSh-5 VHF Radio Volume Control Knob, analog",
		},
		["a3024cd28"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
			["name"] = "Radio Volume (analog)",
		},
		["a3053cd3"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Engine Cowl Flaps Control Lever, analog",
		},
		["a3056cd3"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Oil Radiator Flap Lever, analog",
		},
		["a3059cd3"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Radiator Friction Lever, analog",
		},
	},
	["keyDiffs"] = {
		["d152pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
					["reformers"] = {
						[1] = "LShift",
					},
				},
			},
			["name"] = "Info bar view toggle",
		},
		["d1560pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "LShift",
					},
				},
			},
			["name"] = "Rearming and Refueling Window",
		},
		["d158pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "F11 Jump to free camera",
		},
		["d177pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
				[2] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[3] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Zoom normal",
		},
		["d185pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "JOY_BTN5",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "F2 Toggle camera position",
		},
		["d190pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
				[2] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "F2 Toggle local camera control",
		},
		["d19pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Padlock cycle",
		},
		["d20pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Padlock Off (stop padlock)",
		},
		["d21pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN9",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "F2 View own aircraft",
		},
		["d3008pnilunilcd27vd-0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "LANDYSh-5 VHF Radio 25 kHz Frequency Selector Knob, Decrease",
		},
		["d3008pnilunilcd27vd0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "LANDYSh-5 VHF Radio 25 kHz Frequency Selector Knob, Increase",
		},
		["d3011pnilunilcd27vd-0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN24",
				},
			},
			["name"] = "LANDYSh-5 VHF Radio 1 MHz Frequency Selector Knob, decrease",
		},
		["d3011pnilunilcd27vd0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
				},
			},
			["name"] = "LANDYSh-5 VHF Radio 1 MHz Frequency Selector Knob, increase",
		},
		["d3021pnilunilcd27vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
				},
			},
			["name"] = "LANDYSh-5 VHF Radio Squelch (Noise Suppression) Switch, toggle",
		},
		["d3022pnilunilcd27vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "LANDYSh-5 VHF Radio Squelch (Noise Suppression) Switch, OFF",
		},
		["d3030pnilu3030cd2vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Wheel Brake Lock",
		},
		["d3037pnilunilcd6vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
				},
			},
			["name"] = "Fuel Quantity Indicator Dimmer. toggle",
		},
		["d3038pnilunilcd6vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Fuel Quantity Indicator Dimmer, DAY",
		},
		["d3039pnilunilcd6vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
			["name"] = "Smoke Apparatus OFF",
		},
		["d3039pnilunilcd6vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
			["name"] = "Smoke Apparatus ON",
		},
		["d321pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Camera view mouse rate fast",
		},
		["d322pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Camera view mouse rate slow",
		},
		["d323pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Camera view mouse rate normal",
		},
		["d331pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Camera view keyboard rate fast",
		},
		["d332pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Camera view keyboard rate slow",
		},
		["d333pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Camera view keyboard rate normal",
		},
		["d338pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN20",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom external normal",
		},
		["d360pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
					["reformers"] = {
						[1] = "LShift",
					},
				},
			},
			["name"] = "Score window",
		},
		["d396pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 0",
		},
		["d397pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DL",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 1",
		},
		["d399pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DR",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 3",
		},
		["d400pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UL",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 4",
		},
		["d402pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UR",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 6",
		},
		["d403pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_L",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 7",
		},
		["d404pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 8",
		},
		["d405pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Snap View 9",
		},
		["d491pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "JOY_BTN20",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Center",
		},
		["d83pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Bailout",
		},
		["d851pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "LShift",
					},
				},
			},
			["name"] = "Controls indicator",
		},
		["d8pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN7",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "F2 Aircraft view",
		},
		["dnilp210u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DR",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_DR",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Up Right slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UR",
				},
			},
		},
		["dnilp211u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UR",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_UR",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Down Right slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DR",
				},
			},
		},
		["dnilp212u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UL",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_UL",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Down Left slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DL",
				},
			},
		},
		["dnilp213u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DL",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_DL",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Up Left slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_UL",
				},
			},
		},
		["dnilp3038unilcd2vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN13",
				},
			},
			["name"] = "Elevator Trim Tab Control Wheel, NOSE UP",
		},
		["dnilp3038unilcd2vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN11",
				},
			},
			["name"] = "Elevator Trim Tab Control Wheel, NOSE DOWN",
		},
		["dnilp32u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_L",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Left slow",
		},
		["dnilp334u335cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN16",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom external in",
		},
		["dnilp336u337cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN18",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom external out",
		},
		["dnilp33u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Right slow",
		},
		["dnilp34u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_D",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Up slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
				},
			},
		},
		["dnilp35u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_U",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "View Down slow",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
				},
			},
		},
		["dnilp36unilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN127",
				},
			},
			["name"] = "View Center",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
		},
		["dnilp37u291cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom in",
		},
		["dnilp38u292cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_L",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom out",
		},
		["dnilp39u289cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_U",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom in slow",
		},
		["dnilp40u290cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Zoom out slow",
		},
		["dnilp484u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Up",
		},
		["dnilp485u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN8",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Down",
		},
		["dnilp486u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN19",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "JOY_BTN9",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Left",
		},
		["dnilp487u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN17",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "JOY_BTN7",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Right",
		},
		["dnilp488u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN16",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Forward",
		},
		["dnilp489u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN18",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Cockpit Camera Move Back",
		},
	},
}
return diff