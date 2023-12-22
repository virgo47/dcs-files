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
							[1] = -0.24,
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
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Wheel Brake",
		},
		["a3006cd26"] = {
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
			["name"] = "ASP-3N Gunsight Target Distance",
		},
		["a3007cd26"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_Z",
				},
			},
			["name"] = "ASP-3N Gunsight Target Wingspan Adjustment Dial",
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
		["d145pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN56",
				},
			},
			["name"] = "Wing Flaps Handle, Down",
		},
		["d146pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN54",
				},
			},
			["name"] = "Wing Flaps Handle, Up",
		},
		["d147pnilu147cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
				},
			},
			["name"] = "Airbrake Switch, OPEN",
		},
		["d148pnilu148cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
				},
			},
			["name"] = "Airbrake Switch, CLOSE",
		},
		["d1731pnilu1731cdnilvd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN18",
				},
			},
			["name"] = "Microphone Button (VOIP)",
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
		["d3001pnilunilcd13vd0.5vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN83",
				},
				[2] = {
					["key"] = "JOY_BTN83",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Landing Gear Handle, Neutral",
		},
		["d3003pnilu3003cd2vd1vpnilvu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
				},
			},
			["name"] = "Engine Start Button",
		},
		["d3006pnilunilcd13vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN64",
				},
			},
			["name"] = "Landing Gear Handle Lock",
		},
		["d3007pnilunilcd15vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN58",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Emergency Canopy Jettison Handle",
		},
		["d3014pnilunilcd26vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
			["name"] = "ASP-3N Gunsight Color Filter",
		},
		["d3026pnilunilcd2vd1vpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN10",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Engine Start Button Cover",
		},
		["d350pnilu351cdnilvdnilvpnilvunil"] = {
			["name"] = "Weapon Release Button",
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
		["d430pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN65",
				},
				[2] = {
					["key"] = "JOY_BTN65",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Landing Gear Handle, Up",
		},
		["d431pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN66",
				},
				[2] = {
					["key"] = "JOY_BTN66",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "Landing Gear Handle, Down",
		},
		["d72pnilunilcdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN55",
				},
			},
			["name"] = "Wing Flaps Handle, Up/Down",
		},
		["d74pnilu75cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN42",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Wheel Brake On",
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
			["name"] = "AChS-1 Cockpit Chronograph Left Knob, Push",
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
			["name"] = "AChS-1 Cockpit Chronograph Right Knob, Push",
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
			["name"] = "NR-23 Cannon Fire Button",
			["removed"] = {
				[1] = {
					["key"] = "JOY_BTN1",
				},
			},
		},
		["d963pnilu75cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN41",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Forced Wheel Brake On",
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
		["dnilp3005unilcd26vdnilvp-1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "ASP-3N Gunsight Brightness Knob, Increase",
		},
		["dnilp3005unilcd26vdnilvp1vunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN31",
					["reformers"] = {
						[1] = "Smod",
					},
				},
			},
			["name"] = "ASP-3N Gunsight Brightness Knob, Decrease",
		},
		["dnilp3007u3007cd13vdnilvp1vu0"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN32",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Forced Axis Wheel Brake",
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
				[2] = {
					["key"] = "JOY_BTN39",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Zoom in slow",
		},
		["dnilp40u290cdnilvdnilvpnilvunil"] = {
			["added"] = {
				[1] = {
					["key"] = "JOY_BTN40",
				},
				[2] = {
					["key"] = "JOY_BTN40",
					["reformers"] = {
						[1] = "Tmod",
					},
				},
			},
			["name"] = "Zoom out slow",
		},
	},
}
return diff