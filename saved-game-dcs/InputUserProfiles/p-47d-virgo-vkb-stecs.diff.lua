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
		["a3005cd3"] = {
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
					["key"] = "JOY_X",
				},
			},
			["name"] = "Throttle (analog)",
		},
		["a3008cd3"] = {
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
			["name"] = "Engine (selected) RPM / Propeller Pitch - axis",
		},
		["a3011cd3"] = {
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
					["key"] = "JOY_SLIDER2",
				},
			},
			["name"] = "Boost (analog)",
		},
		["a3012cd6"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
			["name"] = "K-14 Target span",
		},
		["a3021cd6"] = {
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
			["name"] = "K-14 Range to target",
		},
		["a3025cd2"] = {
			["added"] = {
				[1] = {
					["filter"] = {
						["curvature"] = {
							[1] = -0.25,
						},
						["deadzone"] = 0,
						["hardwareDetent"] = false,
						["hardwareDetentAB"] = 0,
						["hardwareDetentMax"] = 0,
						["invert"] = false,
						["saturationX"] = 0.5,
						["saturationY"] = 1,
						["slider"] = true,
					},
					["key"] = "JOY_RX",
				},
			},
			["name"] = "Wheel brake Both (analog)",
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
		["d15pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN38",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "F10 Theater map view",
		},
		["d177pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN23",
				},
			},
			["name"] = "Zoom normal",
		},
		["d3004pnilunilcd14vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN22",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Gun Safety Switch Cover (toggle)",
		},
		["d3006pnilunilcd5vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN55",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Clock Winding/Adjust - adjust",
		},
		["d3007pnilunilcd14vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN35",
				},
			},
			["name"] = "Gun Safety GUNS & CAMERA",
		},
		["d3007pnilunilcd14vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN22",
				},
			},
			["name"] = "Gun Safety OFF",
		},
		["d3007pnilunilcd14vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN36",
				},
			},
			["name"] = "Gun Safety CAMERA ONLY",
		},
		["d3015pnilu3015cd2vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Canopy Electrical Switch OPEN",
		},
		["d3015pnilu3015cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN20",
				},
			},
			["name"] = "Water Injection Button",
		},
		["d3015pnilunilcd8vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
			["name"] = "Wing Position Lights DIM",
		},
		["d3015pnilunilcd8vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN52",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
			["name"] = "Wing Position Lights OFF",
		},
		["d3015pnilunilcd8vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
			["name"] = "Wing Position Lights BRIGHT",
		},
		["d3016pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN17",
				},
			},
			["name"] = "Water Injection Button Lock (toggle)",
		},
		["d3017pnilunilcd3vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
				},
			},
			["name"] = "Mixture (previous selection)",
		},
		["d3017pnilunilcd3vd0.2vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN52",
				},
			},
			["name"] = "Mixture AUTO RICH",
		},
		["d3017pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
				},
			},
			["name"] = "Mixture (next selection)",
		},
		["d3018pnilunilcd8vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN56",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
			["name"] = "Tail Position Light DIM",
		},
		["d3018pnilunilcd8vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN55",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
			["name"] = "Tail Position Light OFF",
		},
		["d3018pnilunilcd8vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN54",
					["reformers"] = {
						[1] = "RCtrl",
					},
				},
			},
			["name"] = "Tail Position Light BRIGHT",
		},
		["d3019pnilunilcd2vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Canopy CLOSE",
		},
		["d3020pnilu3020cd2vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN45",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Jettison Canopy",
		},
		["d3021pnilu3021cd3vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Starter ENERGIZE",
		},
		["d3021pnilu3021cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
			["name"] = "Starter ENGAGE",
		},
		["d3028pnilunilcd3vd0.1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN4",
				},
			},
			["name"] = "Magneto Switch LEFT",
		},
		["d3028pnilunilcd3vd0.2vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN5",
				},
			},
			["name"] = "Magneto Switch RIGHT",
		},
		["d3028pnilunilcd3vd0.3vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN6",
				},
				[2] = {
					["key"] = "JOY_BTN7",
				},
			},
			["name"] = "Magneto Switch BOTH",
		},
		["d3028pnilunilcd3vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN3",
				},
			},
			["name"] = "Magneto Switch OFF",
		},
		["d3029pnilunilcd8vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN47",
				},
			},
			["name"] = "Oil Dilution (toggle)",
		},
		["d3031pnilunilcd2vd0.5vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN55",
				},
			},
			["name"] = "Landing Flaps NEUTRAL",
		},
		["d3031pnilunilcd2vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN54",
				},
			},
			["name"] = "Landing Flaps RETRACT",
		},
		["d3031pnilunilcd2vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN56",
				},
			},
			["name"] = "Landing Flaps EXTEND",
		},
		["d3035pnilunilcd2vd-1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN65",
				},
			},
			["name"] = "Undercarriage UP",
		},
		["d3035pnilunilcd2vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN66",
				},
			},
			["name"] = "Undercarriage DOWN",
		},
		["d3036pnilunilcd2vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN25",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Compressibility Recovery Flaps Switch Cover CLOSE",
		},
		["d3036pnilunilcd2vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN26",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Compressibility Recovery Flaps Switch Cover OPEN",
		},
		["d3038pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN16",
				},
			},
			["name"] = "Interconnect Pitch Lever to Throttle (toggle)",
		},
		["d3039pnilunilcd2vd0vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN25",
				},
			},
			["name"] = "Compressibility Recovery Flaps UP",
		},
		["d3039pnilunilcd2vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN26",
				},
			},
			["name"] = "Compressibility Recovery Flaps DOWN",
		},
		["d3040pnilunilcd3vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN8",
				},
			},
			["name"] = "Interconnect Boost Lever to Throttle (toggle)",
		},
		["d3043pnilu3043cd3vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN53",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Intercooler Shutter CLOSE",
		},
		["d3043pnilu3043cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN51",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Intercooler Shutter OPEN",
		},
		["d3046pnilu3046cd3vd-1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN56",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Oil Cooler Shutter CLOSE",
		},
		["d3046pnilu3046cd3vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN54",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Oil Cooler Shutter OPEN",
		},
		["d350pnilu351cdnilvdnilvpnilvunil"] = {
			["name"] = "Weapon release",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN2",
				},
			},
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
		["d403pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN29",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Custom Snap View  7",
		},
		["d405pnilu406cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN30",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Custom Snap View  9",
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
					["key"] = "JOY_BTN2",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Bailout",
		},
		["d84pnilu85cdnilvdnilvpnilvunil"] = {
			["name"] = "Fire Machineguns",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
		},
		["d8pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN37",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "F2 Aircraft view",
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
		["dnilp3002unilcd8vdnilvp-0.7vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN31",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Gunsight brightness Decrease",
		},
		["dnilp3002unilcd8vdnilvp0.7vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Gunsight brightness Increase",
		},
		["dnilp3008unilcd2vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN59",
					["reformers"] = {
						[1] = "Smod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN59",
				},
			},
			["name"] = "Trim Rudder Left",
		},
		["dnilp3008unilcd2vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN60",
					["reformers"] = {
						[1] = "Smod",
					},
				},
				[2] = {
					["key"] = "JOY_BTN60",
				},
			},
			["name"] = "Trim Rudder Right",
		},
		["dnilp3011unilcd8vdnilvp-0.7vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN46",
				},
			},
			["name"] = "Fuel Booster Pump Rheostat DECREASE",
		},
		["dnilp3011unilcd8vdnilvp0.7vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN46",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Fuel Booster Pump Rheostat INCREASE",
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