local diff = {
	["axisDiffs"] = {
		["a2001cdnil"] = {
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
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_Y",
				},
			},
			["name"] = "Flight Control Cyclic Pitch",
		},
		["a2002cdnil"] = {
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
						["invert"] = false,
						["saturationX"] = 1,
						["saturationY"] = 1,
						["slider"] = false,
					},
					["key"] = "JOY_X",
				},
			},
			["name"] = "Flight Control Cyclic Roll",
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
			["name"] = "Flight Control Yaw (pedals)",
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
		["a2087cdnil"] = {
			["name"] = "Flight Control Collective",
			["removed"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
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
			["name"] = "Info Bar - SHOW/HIDE",
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
						[1] = "LCtrl",
					},
				},
				[2] = {
					["key"] = "JOY_BTN127",
					["reformers"] = {
						[1] = "LAlt",
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
			["name"] = "Lock view (cycle padlock)",
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
			["name"] = "Unlock view (stop padlock)",
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
		["d3001pnilu3001cd52vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
			["name"] = "External Cargo Pilot Unhook",
		},
		["d3002pnilu3002cd2vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN22",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Fuel Indicator Test",
		},
		["d3003pnilu3003cd15vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN15",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Caution Panel Test/Reset Switch Test",
		},
		["d3004pnilu3004cd13vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN15",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Radar Altimeter, Test",
		},
		["d3004pnilu3004cd41vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN21",
				},
			},
			["name"] = "Pilot Trimmer",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
		},
		["d3005pnilunilcd32vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Toggle Flexible Sight",
		},
		["d3005pnilunilcd49vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
			["name"] = "Pilot Sight Armed/Docked",
		},
		["d3007pnilunilcd49vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
				},
			},
			["name"] = "Pilot Sight Switch",
		},
		["d3009pnilu3009cd21vd0.5vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Pilot's radio trigger ICS (call radio menu)",
		},
		["d3009pnilu3009cd21vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
				},
			},
			["name"] = "Pilot's radio trigger RADIO (call radio menu)",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
		},
		["d3023pnilu3023cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN15",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Fire Detector Test",
		},
		["d3037pnilunilcd7vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
				},
			},
			["name"] = "Search light Stow",
		},
		["d3037pnilunilcd7vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN27",
				},
			},
			["name"] = "Search light Off",
		},
		["d3037pnilunilcd7vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN28",
				},
			},
			["name"] = "Search light On",
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
		["d350pnilu350cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Copilot weapon release",
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
		["d511pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN14",
				},
			},
			["name"] = "Search light Left",
		},
		["d512pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN12",
				},
			},
			["name"] = "Search light Right",
		},
		["d513pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN13",
				},
			},
			["name"] = "Search light Retract",
		},
		["d514pnilu515cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN11",
				},
			},
			["name"] = "Search light Extend",
		},
		["d83pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Leave Helicopter (3 times)",
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
		["dnilp3002unilcd18vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN13",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Altimeter Pilot, Pressure Decrease",
		},
		["dnilp3002unilcd18vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN11",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "Altimeter Pilot, Pressure Increase",
		},
		["dnilp3004unilcd49vdnilvp-0.5vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
				},
			},
			["name"] = "Pilot Sight Elevation Decrease",
		},
		["dnilp3004unilcd49vdnilvp0.5vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN8",
				},
			},
			["name"] = "Pilot Sight Elevation Increase",
		},
		["dnilp3005unilcd13vdnilvp-0.1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN13",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Radar Altimeter, Low Altitude Decrease",
		},
		["dnilp3005unilcd13vdnilvp0.1vu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN11",
					["reformers"] = {
						[1] = "LAlt",
						[2] = "LCtrl",
					},
				},
			},
			["name"] = "Radar Altimeter, Low Altitude Increase",
		},
		["dnilp3006unilcd13vdnilvp-0.1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN13",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Radar Altimeter, Hight Altitude Decrease",
		},
		["dnilp3006unilcd13vdnilvp0.1vu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN11",
					["reformers"] = {
						[1] = "LAlt",
					},
				},
			},
			["name"] = "Radar Altimeter, Hight Altitude Increase",
		},
		["dnilp3007unilcd10vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN12",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "GMC Manual Heading Increase",
		},
		["dnilp3007unilcd10vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN14",
					["reformers"] = {
						[1] = "LCtrl",
					},
				},
			},
			["name"] = "GMC Manual Heading Decrease",
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