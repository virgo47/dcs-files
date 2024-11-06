-- View scripts 
-- Copyright (C) 2004, Eagle Dynamics.
DisableCombatViews				= false -- F5 & Ctrl-F5
ExternalObjectsLockDistance 	= 10000.0
ShowTargetInfo 					= false
CameraTerrainRestriction 		= false
hAngleRearDefault 				=  180
vAngleRearDefault 				= -8.0
vAngleRearMin    				= -90 -- -8.0
vAngleRearMax    				= 90.0

UseGreenieBoardLandingDataHistory = true	-- For Carrier Air Wing Briefing Room
UseKillBoardDataHistory = true

--reformatted per-unit data to be mod system friendly 
--this file is no longer should be edited for adding new flyable aircraft , DCS automatically check core database (i.e. where you define your aircraft in aircraft table just define ViewSettings and SnapViews tables)

function default_fighter_player(t)
	local res = {
		CameraViewAngleLimits  = {20.000000,140.000000},
		CameraAngleRestriction = {false	   ,90.000000,0.500000},
		EyePoint               = {0.05     ,0.000000 ,0.000000},
		limits_6DOF            = {x = {-0.050000,0.4500000},y ={-0.300000,0.100000},z = {-0.220000,0.220000},roll = 90.000000},
		Allow360rotation	   = false,
		CameraAngleLimits      = {200,-80.000000,110.000000},
		ShoulderSize 		   = 0.2,  -- move body when azimuth value more then 90 degrees
	}
	if t then
		for i,o in pairs(t) do
			res[i] = o
		end
	end
	return res
end

function fulcrum()
	return {
		Cockpit = {
			default_fighter_player({CockpitLocalPoint = {4.71,1.28,0.000000}})
		},
		Chase   = {
			LocalPoint      = {1.220000,3.750000,0.000000},
			AnglesDefault   = {180.000000,-8.000000},
		}, -- Chase
		Arcade = {
			LocalPoint      = {-15.080000,6.350000,0.000000},
			AnglesDefault   = {0.000000,-8.000000},
		}, -- Arcade
	}
end

ViewSettings = {}
ViewSettings["A-10A"] = {
	Cockpit = {
	[1] = default_fighter_player({CockpitLocalPoint      =  {4.300000,1.282000,0.000000},
								  EyePoint  			 = {0.000000,0.000000,0.000000},
								  limits_6DOF            = {x 	 = {-0.050000,0.600000},
															y 	 = {-0.300000,0.100000},
															z 	 = {-0.250000,0.250000},
															roll =  90.000000}}),
	}, -- Cockpit
	Chase = {
		LocalPoint      = {0.600000,3.682000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-27.000000,12.000000,0.000000},
		AnglesDefault   = {0.000000,-12.000000},
	}, -- Arcade
}
ViewSettings["F-15C"] = {
	Cockpit = {
	[1] = default_fighter_player({CockpitLocalPoint      = {6.210000,1.204000,0.000000}})-- player slot 1
	}, -- Cockpit
	Chase = {
		LocalPoint      = {2.510000,3.604000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-13.790000,6.204000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

ViewSettings["MiG-29A"] 	= fulcrum()
ViewSettings["MiG-29G"] 	= fulcrum()
ViewSettings["MiG-29S"] 	= fulcrum()
ViewSettings["FULCRUM-LAB"]	= fulcrum()

ViewSettings["Su-25"] = {
	Cockpit = {
	[1] = default_fighter_player({CockpitLocalPoint      = {3.352000,0.506000,0.000000}}),-- player slot 1
	}, -- Cockpit
	Chase = {
		LocalPoint      = {-0.348000,2.906000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-16.648001,5.506000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

ViewSettings["Su-25T"] = {
	Cockpit = {
	[1] = default_fighter_player({CockpitLocalPoint      = {3.406000,0.466000,0.000000}}),-- player slot 1
	}, -- Cockpit
	Chase = {
		LocalPoint      = {-0.294000,2.866000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-16.594000,5.466000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

ViewSettings["Su-27"] = {
	Cockpit = {
	[1] = default_fighter_player({CockpitLocalPoint      = {7.959000,1.419000,0.000000}})-- player slot 1
	}, -- Cockpit
	Chase = {
		LocalPoint      = {4.259000,3.819000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-12.041000,6.419000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

ViewSettings["Su-33"] = ViewSettings["Su-27"]

-----------------------------------------------------------------------------------
-- Custom view settings overriding defaults from other planes
-- Axis mapping minus-to-plus: x - back-to-front, y - down-to-up, z - left-to-right

ViewSettings["UH-1H"] = {
	Cockpit = {
	[1] = {-- player slot 1
		CockpitLocalPoint      = {2.34, 0.37 , 0.0},
		CameraViewAngleLimits  = {20.000000,140.000000},
		CameraAngleRestriction = {false,90.000000,0.400000},
		CameraAngleLimits      = {140.000000,-65.000000,90.000000},
		EyePoint               = {0.090000,0.000000,0.000000},
		limits_6DOF            = {x = {-0.100000,0.500000},
								  y = {-0.200000,0.350000},
								  z = {-0.700000,0.900000},
								  roll = 90.000000},
	},

	[2] = {-- player slot 2
		CockpitLocalPoint      = {2.34, 0.37 , 0.0},
		CameraViewAngleLimits  = {60.000000,140.000000},
		CameraAngleRestriction = {false,90.000000,0.400000},
		CameraAngleLimits      = {140.000000,-65.000000,90.000000},
		EyePoint               = {0.090000,0.000000,0.000000},
		limits_6DOF            = {x = {-0.100000,0.500000},
								  y = {-0.200000,0.350000},
								  z = {-0.750000,0.500000},
								  roll = 90.000000},
	},

	[3] = {-- player slot 3
		CockpitLocalPoint			= {2.34, 0.37 , 0.0},
		CockpitLocalPointAzimuth	= 90,
		CameraViewAngleLimits		= {20.000000,135.000000},
		CameraAngleRestriction		= {false,90.000000,0.400000},
		CameraAngleLimits			= {80.000000,-45.000000,15.000000},
		EyePoint					= {0.090000,0.000000,0.000000},
		limits_6DOF					= {	x 	= {-3.0, 0.35},
										y 	= {-0.6,0.5},
										z 	= {-1.4,0.25},
										roll  = 90.000000},
		 ExternalShapeUsed	   		= true,
		 Allow360rotation			= false,
	},

	[4] = {-- player slot 4
		CockpitLocalPoint			= {2.34, 0.37 , 0.0},
		CockpitLocalPointAzimuth	= -90,
		CameraViewAngleLimits		= {20.000000,135.000000},
		CameraAngleRestriction		= {false,90.000000,0.400000},
		CameraAngleLimits			= {80.000000,-45.000000,15.000000},
		EyePoint					= {0.090000,0.000000,0.000000},
		limits_6DOF					= {	x 	= {-3.0, 0.35} ,
										y 	= {-0.6,0.5},
										z 	= {-0.25,1.4},
										roll  = 90.000000},
		ExternalShapeUsed	   		= true,
		Allow360rotation			= false,
	},

	}, -- Cockpit
	Chase = {
		LocalPoint      = {-3.700000,2.400000,0.000000},
		AnglesDefault   = {180.000000,-8.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-20.000000,5.000000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

ViewSettings["F-5E-3"] = {
	Cockpit = {
	[1] = {-- player slot 1
		CameraViewAngleLimits  = {20.000000,140.000000},
		CockpitLocalPoint      = {3.022,0.860,0.0},
		CameraAngleRestriction = {false,90.000000,0.500000},
		CameraAngleLimits      = {200,-90.000000,90.000000},
		EyePoint               = {0.05000,0.100000,0.000000},
		ShoulderSize		   = 0.25,
		Allow360rotation	   = false,
		limits_6DOF            = {x = {-0.05,0.21},y ={-0.10,0.08},z = {-0.19,0.19},roll = 90.000000},
	},
	}, -- Cockpit
	Chase = {
		LocalPoint      = {-5.0,1.0,3.0},
		AnglesDefault   = {0.000000,0.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-21.500000,5.618000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

-- Axis mapping minus-to-plus: x - back-to-front, y - down-to-up, z - left-to-right
ViewSettings["F-16C_50"] = {
	Cockpit = {
		[1] = {-- player slot 1
			CameraViewAngleLimits  = {20.000000,140.000000},
			CockpitLocalPoint      = {3.259,0.796,0.0},
			CameraAngleRestriction = {false,90.000000,0.500000},
			CameraAngleLimits      = {200,-90.000000,90.000000},
			EyePoint               = {0.05000,0.100000,0.000000},
			ShoulderSize		   = 0.25,
			Allow360rotation	   = false,
			limits_6DOF            = {x = {-0.15,0.35},y ={-0.35,0.20},z = {-0.3,0.3},roll = 90.000000},
		},
	}, -- Cockpit
	Chase = {
		LocalPoint      = {-5.0,1.0,3.0},
		AnglesDefault   = {0.000000,0.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-21.500000,5.618000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

ViewSettings["I-16"] = {
	Cockpit = {
		{
			CockpitLocalPoint      = {-1.532, 0.811, 0},  -- -1.462
			CameraViewAngleLimits  = {20.000000,140.000000},
			CameraAngleRestriction = {false,90.000000,0.500000},
			CameraAngleLimits      = {200,-90.000000,90.000000},
			EyePoint               = {0.05000,0.100000,0.000000},
			ShoulderSize		   = 0.25,
			Allow360rotation	   = false,
			limits_6DOF            = {x = {-0.15,0.45},y ={-0.45,0.10},z = {-0.180,0.180},roll = 90.000000},
		}
	}, -- Cockpit
	Chase = {
		LocalPoint      = {-5.0,1.0,3.0},
		AnglesDefault   = {0.000000,0.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-21.500000,5.618000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}

local viewSettingsMustang = {
	Cockpit = {
	[1] = {-- player slot 1
		CockpitLocalPoint      = {-1.500000,0.618000,0.000000},
		CameraViewAngleLimits  = {20.000000,120.000000},
		CameraAngleRestriction = {false,90.000000,0.500000},
		CameraAngleLimits      = {200,-90.000000,90.000000},
		EyePoint               = {0.025000,0.100000,0.000000},
		ShoulderSize		   = 0.15,
		Allow360rotation	   = false,
		limits_6DOF            = {x = {-0.050000,0.500000},y ={-0.230000,0.230000},z = {-0.250000,0.250000},roll = 90.000000},
	},
	}, -- Cockpit
	Chase = {
		LocalPoint      = {0.200000,-0.652000,-0.650000},
		AnglesDefault   = {0.000000,0.000000},
	}, -- Chase
	Arcade = {
		LocalPoint      = {-21.500000,5.618000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	}, -- Arcade
}
ViewSettings["TF-51D"] = viewSettingsMustang
ViewSettings["P-51D"] = viewSettingsMustang
ViewSettings["P-51D-30-NA"] = viewSettingsMustang

-- Mods\aircraft\C-101\Views.lua is more complicated, the function is renamed to be 101 specific, constants were inlined
local function playerC101(x,y)
	return {
		CockpitLocalPoint      = {x,y,0.0},
		CameraViewAngleLimits  = {20.000000,140.000000},
		CameraAngleRestriction = {false,90.000000,0.500000},
		CameraAngleLimits      = {200,-90.000000,90.000000},
		EyePoint               = {0.05000,0.100000,0.000000},
		ShoulderSize     	   = 0.25,
		Allow360rotation       = false,
		-- y lower limit was changed from -0.1 to -0.3 for better snapviews
		limits_6DOF            = {x = {-0.05, 0.3}, y = {-0.3, 0.1}, z = {-0.23, 0.23}, roll = 90.000000},
	}
end
local viewSettingsC101 = {
	Cockpit = {
		playerC101(3.326,0.526),--front cockpit
		playerC101(1.74,0.841),--rear cockpit
	},
	Chase = {
		LocalPoint      = {-5.0,1.0,3.0},
		AnglesDefault   = {0.000000,0.000000},
	},
	Arcade = {
		LocalPoint      = {-21.500000,5.618000,0.000000},
		AnglesDefault   = {0.000000,-8.000000},
	},
}
ViewSettings["C-101CC"] = viewSettingsC101
ViewSettings["C-101EB"] = viewSettingsC101
