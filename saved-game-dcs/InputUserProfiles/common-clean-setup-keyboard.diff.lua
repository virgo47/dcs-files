-- DO NOT LOAD THIS as a new profile, just copy the parts you want
local diff = {
	["keyDiffs"] = {
		-- REMOVED stuff
		["d17pnilu18cdnilvdnilvpnilvunil"] = {
			["name"] = "Cockpit panel view in",
			["removed"] = {
				[1] = {
					["key"] = "Num0",
				},
			},
		},
		["d193pnilu194cdnilvdnilvpnilvunil"] = {
			["name"] = "Aircraft Down",
			["removed"] = {
				[1] = {
					["key"] = "Up",
				},
			},
		},
		["d195pnilu196cdnilvdnilvpnilvunil"] = {
			["name"] = "Aircraft Up",
			["removed"] = {
				[1] = {
					["key"] = "Down",
				},
			},
		},
		["d197pnilu198cdnilvdnilvpnilvunil"] = {
			["name"] = "Aircraft Bank Left",
			["removed"] = {
				[1] = {
					["key"] = "Left",
				},
			},
		},
		["d199pnilu200cdnilvdnilvpnilvunil"] = {
			["name"] = "Aircraft Bank Right",
			["removed"] = {
				[1] = {
					["key"] = "Right",
				},
			},
		},

		-- UNSORTED
		["d177pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num-",
				},
			},
			["name"] = "Zoom normal",
			["removed"] = {
				[1] = {
					["key"] = "NumEnter",
				},
			},
		},
		["d237pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "NumEnter",
				},
			},
			["name"] = "Cockpit panel view toggle",
			["removed"] = {
				[1] = {
					["key"] = "Num0",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
		},

		-- Common comms shortcuts
		["d118pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F1",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Attack My Target",
		},
		["d1684pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F2",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Flight - Engage Bandits",
		},
		["d522pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F3",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Flight - Attack air defenses",
		},
		["d523pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F4",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Flight - Attack ground targets",
		},
		["d119pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F5",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Cover Me",
		},
		["d117pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F7",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Join Up Formation",
		},
		["d116pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F8",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Toggle Formation",
		},
		["d269pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F9",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Request AWACS Bogey Dope",
		},
		["d267pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F10",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Request AWACS Home Airbase",
		},
		["d268pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F11",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Request AWACS Available Tanker",
		},
		["d1760pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "F12",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Tanker - Ready for precontact",
		},

		-- View moved from non-mod Num-keys to LCtrl+NumX
		["dnilp210u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num9",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num9",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Up Right slow",
		},
		["dnilp211u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num3",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num3",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Down Right slow",
		},
		["dnilp212u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num1",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num1",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Down Left slow",
		},
		["dnilp213u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num7",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num7",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Up Left slow",
		},
		["dnilp32u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num4",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num4",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Left slow",
		},
		["dnilp33u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num6",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num6",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Right slow",
		},
		["dnilp34u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num8",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num8",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Up slow",
		},
		["dnilp35u214cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num2",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num2",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Down slow",
		},
		["dnilp36unilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num5",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "Num5",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "View Center",
			["removed"] = {
				[1] = {
					["key"] = "Num5",
				},
			},
		},

		-- Snap views (mostly for use with CapsLock "setup mode")
		["d236pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num+",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Save Cockpit Angles",
		},
		["d237pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "NumEnter",
				},
			},
			["name"] = "Cockpit panel view toggle",
			["removed"] = {
				[1] = {
					["key"] = "Num0",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
		},
		["d396pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num0",
				},
				[2] = {
					["key"] = "Num0",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  0",
		},
		["d397pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num1",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  1",
		},
		["d398pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num2",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  2",
		},
		["d399pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num3",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  3",
		},
		["d400pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num4",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  4",
		},
		["d401pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num5",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  5",
		},
		["d402pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num6",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  6",
		},
		["d403pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num7",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  7",
		},
		["d404pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num8",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  8",
		},
		["d405pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Num9",
					["reformers"] = {
						[1] = "CapsLock",
					},
				},
			},
			["name"] = "Custom Snap View  9",
		},

		-- Kneeboard
		["d1587pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Up",
				},
			},
			["name"] = "Kneeboard ON/OFF",
		},
		["d3001pnilunilcd100vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Right",
				},
			},
			["name"] = "Kneeboard Next Page",
		},
		["d3002pnilunilcd100vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Left",
				},
			},
			["name"] = "Kneeboard Previous Page",
		},
		["d3005pnilunilcd100vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "Down",
				},
			},
			["name"] = "Kneeboard Next Shortcut",
		},

		-- Various
	},
}
return diff