-- DO NOT LOAD THIS as a new profile, just copy the parts you want
local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
			["changed"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = 0.15,
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
							[1] = 0.15,
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
--[[ With TPR pedals no need for this, it actually can mess up with things when fixed with a screw on the joystick:
		["a2003cdnil"] = {
			["changed"] = {
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
					["key"] = "JOY_RZ",
				},
			},
			["name"] = "Rudder",
		},
]]
		["a2003cdnil"] = {
			["name"] = "Rudder",
			["removed"] = {
				[1] = {
					["key"] = "JOY_RZ",
				},
			},
		},
		["a2004cdnil"] = {
			["name"] = "Thrust",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
		},

		-- Absolute camera shift view
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

		-- Self-centering zoom view axis on left Sw1
		["a2012cdnil"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = -0.02,
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
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Zoom View",
		},
	},

	["keyDiffs"] = {
		-- View center have normal and CapsLock bindings
		["d177pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
				[3] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Zoom normal",
		},

		["dnilp36unilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN127",
				},
				[2] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "View Center",
		},

		-- Look around slow
		["dnilp210u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_DR",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_DR",
					["reformers"] = {
						[1] = "CapsLock",
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
						[1] = "CapsLock",
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
						[1] = "CapsLock",
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
						[1] = "CapsLock",
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
		["dnilp32u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_L",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_L",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "View Left slow",
		},
		["dnilp33u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_R",
					["reformers"] = {
						[1] = "CapsLock",
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
						[1] = "CapsLock",
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
						[1] = "CapsLock",
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

		-- Snap views
		["d396pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_D",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Custom Snap View  0",
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
			["name"] = "Custom Snap View  1",
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
			["name"] = "Custom Snap View  3",
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
			["name"] = "Custom Snap View  4",
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
			["name"] = "Custom Snap View  6",
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
			["name"] = "Custom Snap View  7",
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
			["name"] = "Custom Snap View  8",
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
			["name"] = "Custom Snap View  9",
		},

		-- Common CapsLock-switch camera controls
		["d491pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN20",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
				[2] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Cockpit Camera Move Center",
		},
		["dnilp484u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
					["reformers"] = {
						[1] = "CapsLock",
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
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Cockpit Camera Move Down",
		},
		["dnilp486u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN9",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
				[2] = {
					["key"] = "JOY_BTN19",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Cockpit Camera Move Left",
		},
		["dnilp487u490cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN7",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
				[2] = {
					["key"] = "JOY_BTN17",
					["reformers"] = {
						[1] = "CapsLock",
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
						[1] = "CapsLock",
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
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Cockpit Camera Move Back",
		},

		-- Zoom actions
		["dnilp37u291cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN_POV1_R",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_R",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
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
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_L",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
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
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_U",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
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
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN_POV1_D",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Zoom out slow",
		},
		["d338pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Zoom external normal",
		},
		["dnilp334u335cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN6",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Zoom external in",
		},
		["dnilp336u337cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN8",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN8",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Zoom external out",
		},

		-- Keyboard/Mouse rate
		["d331pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Keyboard Rate Fast",
		},
		["d332pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Keyboard Rate Slow",
		},
		["d333pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Keyboard Rate Normal",
		},
		["d321pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Mouse Rate Fast",
		},
		["d322pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN28",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Mouse Rate Slow",
		},
		["d323pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN27",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Mouse Rate Normal",
		},

		-- Padlock, F2/F11 views, other camera control
		["d19pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN1",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Lock View (cycle padlock)",
		},
		["d20pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN1",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN1",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Unlock view (stop padlock)",
		},
		["d185pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN9",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN9",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
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
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
				[3] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "F2 Toggle local camera control",
		},
		["d21pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN18",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN18",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "F2 View own aircraft",
		},
		["d8pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN16",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN16",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "F2 Aircraft view",
		},
		["d180pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN19",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN19",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Objects switching direction reverse ",
		},
		["d181pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN17",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN17",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Objects switching direction forward ",
		},
		["d158pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN20",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "Tmod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN20",
					["reformers"] = {
						[1] = "CapsLock",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "F11 Jump to free camera",
		},

		-- Other common stuff (not in UI Layer, mostly with LShift)
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
		["d851pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "LShift",
					},
				},
			},
			["name"] = "Show controls indicator",
		},
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
	},
}
return diff