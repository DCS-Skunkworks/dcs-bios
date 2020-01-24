BIOS.protocol.beginModule("F-14B", 0x1200)
BIOS.protocol.setExportModuleAircrafts({"F-14B"})

-- Made by WarLord (aka BlackLibrary), ArturDCS and Bullitt
-- v 1.7a

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local define3PosTumb = BIOS.util.define3PosTumb
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

-- remove Arg# Stick 33

-- Extra Functions
local function defineIndicatorLightMulti1(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) < 0.4 or dev0:get_argument_value(arg_number) > 0.6 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "Multi Led Color 1",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "0 if light is off, 1 if light is on"
			}
		}
	}
end

local function defineIndicatorLightMulti2(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) < 0.8 or dev0:get_argument_value(arg_number) > 0.99 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "Multi Led Color 2",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "0 if light is off, 1 if light is on"
			}
		}
	}
end

local function defineIndicatorLightLANTTop(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) < 0.24 or dev0:get_argument_value(arg_number) > 0.49 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "LANTRIN Led Top",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "0 if light is off, 1 if light is on"
			}
		}
	}
end

local function defineIndicatorLightLANT(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) < 0.49 or dev0:get_argument_value(arg_number) > 0.54 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "LANTRIN Led Booth",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "0 if light is off, 1 if light is on"
			}
		}
	}
end

local function defineIndicatorLightLANTBottom(msg, arg_number, category, description)
	local value = moduleBeingDefined.memoryMap:allocateInt {
		maxValue = 1
	}
	assert(value.shiftBy ~= nil)
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
		if dev0:get_argument_value(arg_number) < 0.55 or dev0:get_argument_value(arg_number) > 0.99 then
			value:setValue(0)
		else
		    value:setValue(1)
		end
	end
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "LANTRIN Led Bottom",
		inputs = {},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = value.address,
			  mask = value.mask,
			  shift_by = value.shiftBy,
			  max_value = 1,
			  description = "0 if light is off, 1 if light is on"
			}
		}
	}
end

----------------------------------------- BIOS-Profile


-- Hydraulics
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_SW", 12, 3001, 629, "Hydraulics", "PILOT Hydraulic Transfer Pump Switch")
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_COVER", 12, 3002, 630, "Hydraulics", "PILOT Hydraulic Transfer Pump Switch Cover")
defineToggleSwitch("PLT_HYD_ISOL_SW", 12, 3005, 631, "Hydraulics", "PILOT Hydraulic Isolation Switch")
define3PosTumb("PLT_HYD_EMERG_FCONTR_SW", 12, 3003, 928, "Hydraulics", "PILOT Hydraulic Emergency Flight Control Switch")
defineToggleSwitch("PLT_HYD_EMERG_FCONTR_COVER", 12, 3004, 615, "Hydraulics", "PILOT Hydraulic Emergency Flight Control Switch Cover")
defineToggleSwitch("PLT_HYD_HAND_PUMP", 12, 3006, 632, "Hydraulics", "PILOT Hydraulic Hand Pump")

-- Master Reset
definePushButton("PLT_MASTER_RESET", 22, 3058, 1071, "Master Reset", "PILOT MASTER RESET")

-- AICS
defineToggleSwitch("PLT_INLET_RAMPS_L", 13, 3007, 2100, "AICS", "PILOT Stow Inlet Ramps Left Switch")
defineToggleSwitch("PLT_INLET_RAMPS_R", 13, 3008, 2101, "AICS", "PILOT Stow Inlet Ramps Right Switch")

-- Wing Sweep
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_COVER", 16, 3029, 317, "Wing Sweep", "PILOT Emergency Wing Sweep Handle Cover")
definePotentiometer("PLT_EMERG_WING_SWEEPLT_LEVER", 16, 3031, 384, {0, 1}, "Wing Sweep", "PILOT Emergency Wing Sweep Handle")
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_POP", 12, 3030, 15096, "Wing Sweep", "PILOT Emergency Wing Sweep Handle Pop out")

--Radar Altimeter
definePushButton("PLT_RADAR_ALT_BIT", 29, 3485, 16020, "Radar Altimeter", "PILOT Radar Altimeter BIT Test Button")
defineRotary("PLT_RADAR_ALT_KNOB", 29, 3484, 308, "Radar Altimeter", "PILOT Radar Altimeter Control Knob")

-- Airspeed Indicator
definePushButton("PLT_AIRSPD_KNOB_PUSH", 27, 3492, 2127, "Airspeed Indicator", "PILOT Airspeed Indicator Bug Push Knob")
defineRotary("PLT_AIRSPD_KNOB", 27, 3491, 310, "Airspeed Indicator", "PILOT Airspeed Indicator Bug Knob")
definePushButton("RIO_AIRSPD_KNOB_PUSH", 27, 3638, 255, "Airspeed Indicator", "RIO Airspeed Indicator Bug Push Knob")
defineRotary("RIO_AIRSPD_KNOB", 27, 3639, 254, "Airspeed Indicator", "RIO Airspeed Indicator Bug Knob")

-- Altimeter
define3PosTumb("PLT_ALTIMETER_MODE", 28, 3487, 307, "Altimeter", "PILOT Altimeter Mode Switch")
defineRotary("PLT_ALTIMETER_KNOB", 28, 3486, 306, "Altimeter", "PILOT Altimeter Pressure Setting")

-- RIO Altimeter
define3PosTumb("RIO_ALTIMETER_MODE", 28, 3490, 20307, "Altimeter", "RIO Altimeter Mode Switch")
defineRotary("RIO_ALTIMETER_KNOB", 28, 3489, 20306, "Altimeter", "RIO Altimeter Pressure Setting")

-- Gear
defineToggleSwitch("PLT_GEAR_LEVER", 17, 3016, 326, "Gear", "PILOT Landing Gear Lever")
defineToggleSwitch("PLT_GEAR_LEVER_EMERG", 17, 3633, 16015, "Gear", "PILOT Landing Gear Lever RB emergency extend")
definePushButton("PLT_LAUNCHBAR_ABORT", 17, 3659, 497, "Gear", "PILOT Launch Bar Abort")
defineToggleSwitch("PLT_LAUNCHBAR_ABORT_COVER", 17, 3660, 496, "Gear", "PILOT Launch Bar Abort Switch Cover")
define3PosTumb("PLT_NOSE_STRUT_SW", 17, 3019, 1075, "Gear", "PILOT Nose Strut Compression Switch")

-- Hook
defineToggleSwitch("PLT_HOOK_LEVER", 17, 3021, 238, "Gear", "PILOT Hook Extension Handle")
defineToggleSwitch("PLT_HOOK_LEVER_EMERG", 17, 3022, 15078, "Gear", "PILOT Hook Extension Handle RB cycle emergency mode")

-- Brakes
define3PosTumb("PLT_ANTI_SKID_SW", 17, 3014, 1072, "Brakes", "Anti-Skid Spoiler BK Switch")
defineToggleSwitch("PLT_PARK_BRAKE", 17, 3013, 237, "Brakes", "PILOT Parking Brake Handle")

-- SAS
defineToggleSwitch("PLT_AFCS_PITCH", 21, 3034, 2106, "SAS", "PILOT AFCS Stability Augmentation - Pitch")
defineToggleSwitch("PLT_AFCS_ROLL", 21, 3035, 2107, "SAS", "PILOT AFCS Stability Augmentation - Roll")
defineToggleSwitch("PLT_AFCS_YAW", 21, 3036, 2108, "SAS", "PILOT AFCS Stability Augmentation - Yaw")

-- Autopilot
define3PosTumb("PLT_AUTOPLT_VECTOR_CARRIER", 21, 3037, 2109, "Autopilot", "PILOT Autopilot - Vector / Automatic Carrier Landing")
defineToggleSwitch("PLT_AUTOPLT_ALT", 21, 3038, 2110, "Autopilot", "PILOT Autopilot - Altitude Hold")
define3PosTumb("PLT_AUTOPLT_HDG", 21, 3039, 2111, "Autopilot", "PILOT Autopilot - Heading / Ground Track")
defineToggleSwitch("PLT_AUTOPLT_ENGAGE", 21, 3040, 2112, "Autopilot", "PILOT Autopilot - Engage")

-- Flaps
definePotentiometer("PLT_FLAPS_LEVER", 18, 3044, 225, {0, 1}, "Flaps", "PILOT Flaps Lever")

-- Engine
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_L", 19, 3128, 12300, "Engine", "PILOT Left Engine Fuel Cutoff")
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_R", 19, 3129, 12301, "Engine", "PILOT Right Engine Fuel Cutoff")
define3PosTumb("PLT_THROTTLE_MODE", 19, 3045, 2104, "Engine", "PILOT Throttle Mode")
define3PosTumb("PLT_THROTTLE_TEMP", 19, 3047, 2103, "Engine", "PILOT Throttle Temp")
define3PosTumb("PLT_ANTI_ICE", 19, 3049, 941, "Engine", "PILOT Engine/Probe Anti-Ice")
defineToggleSwitch("PLT_ENGINE_AIRSTART", 19, 3050, 2105, "Engine", "PILOT Engine Airstart")
define3PosTumb("PLT_ENGINE_CRANK", 19, 3051, 2102, "Engine", "PILOT Engine Crank")
defineToggleSwitch("PLT_ENGINE_MODE_L", 19, 3052, 16007, "Engine", "PILOT Left Engine Mode")
defineToggleSwitch("PLT_ENGINE_MODE_R", 19, 3053, 16008, "Engine", "PILOT Right Engine Mode")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT_COVER", 19, 3055, 16005, "Engine", "PILOT Asymmetric Thrust Limiter Cover")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT", 19, 3054, 16006, "Engine", "PILOT Asymmetric Thrust Limiter")

-- Fire System
--definePushButton("PLT_FIRE_EX_BOTTLE_L", devices.FIRE, 3059, 15083, "Gear", "PILOT Fire Ext Bottle - Left") missing device
--definePushButton("PLT_FIRE_EX_BOTTLE_R", devices.FIRE, 3060, 15082, "Gear", "PILOT Fire Ext Bottle - Right")

-- Fuel System
defineToggleSwitch("PLT_FUEL_SHUTOFF_R", 20, 3061, 1044, "Fuel System", "PILOT Fuel Shutoff - Right")
defineToggleSwitch("PLT_FUEL_SHUTOFF_L", 20, 3062, 15081, "Fuel System", "PILOT Fuel Shutoff - Left")
defineToggleSwitch("PLT_FUEL_FEED_COVER", 20, 3064, 1094, "Fuel System", "PILOT Fuel Feed Cover")
define3PosTumb("PLT_FUEL_FEED", 20, 3065, 1095, "Fuel System", "PILOT Fuel Feed")
define3PosTumb("PLT_FUEL_WING_EXT_TRANS", 20, 3066, 1001, "Fuel System", "PILOT Fuel Wing/Ext Trans")
defineToggleSwitch("PLT_FUEL_DUMP", 20, 3067, 1074, "Fuel System", "PILOT Fuel Dump")
define3PosTumb("PLT_REFUEL_PROBE", 20, 3068, 1073, "Fuel System", "PILOT Refuel Probe")
define3PosTumb("PLT_FUEL_QUANT_SEL", 20, 3063, 1076, "Fuel System", "PILOT Fuel Quantity Selector")
definePotentiometer("PLT_BINGO_FUEL_KNOB", 20, 3069, 1050, {0, 1}, "Flaps", "PILOT BINGO Fuel Level Knob")

-- Electrics
define3PosTumb("PLT_L_GEN_SW", 14, 3009, 937, "Electrics", "PILOT Left Generator Switch")
define3PosTumb("PLT_R_GEN_SW", 14, 3010, 936, "Electrics", "PILOT Right Generator Switch")
defineToggleSwitch("PLT_EMERG_GEN_COVER", 14, 3011, 927, "Electrics", "PILOT Emergency Generator Switch Cover")
defineToggleSwitch("PLT_EMERG_GEN_SW", 14, 3012, 926, "Electrics", "PILOT Emergency Generator Switch")

-- Cockpit Mechanics
defineToggleSwitch("PLT_CANOPY_JETT", 11, 3184, 224, "Cockpit Mechanics", "PILOT Canopy Jettison")
defineToggleSwitch("RIO_CANOPY_JETT", 11, 3184, 2051, "Cockpit Mechanics", "RIO Canopy Jettison")
defineToggleSwitch("RIO_EJECT_CMD", 11, 3185, 2049, "Cockpit Mechanics", "RIO Ejection CMD Lever")
defineToggleSwitch("PLT_EJECT_SEAT_SAFE", 11, 3186, 404, "Cockpit Mechanics", "PILOT Ejection Seat Safety")
defineToggleSwitch("RIO_EJECT_SEAT_SAFE", 11, 3187, 498, "Cockpit Mechanics", "RIO Ejection Seat Safety")
defineToggleSwitch("RIO_STORAGE_BOX", 11, 3599, 122, "Cockpit Mechanics", "RIO Storage Box")

-- Enivornment Control
defineToggleSwitch("PLT_OXY_ON", 11, 3190, 8114, "Enivornment Control", "PILOT Oxygen On")
defineToggleSwitch("RIO_OXY_ON", 11, 3191, 119, "Enivornment Control", "RIO Oxygen On")
defineToggleSwitch("PLT_CABIN_PRESS_DUMP", 11, 3192, 939, "Enivornment Control", "PILOT Cabin Pressure Dump")
definePushButton("PLT_AIR_SOURCE_RAM", 11, 3193, 929, "Enivornment Control", "PILOT Air Source Ram")
definePushButton("PLT_AIR_SOURCE_OFF", 11, 3194, 933, "Enivornment Control", "PILOT Air Source Off")
definePushButton("PLT_AIR_SOURCE_L", 11, 3195, 930, "Enivornment Control", "PILOT Air Left Engine")
definePushButton("PLT_AIR_SOURCE_R", 11, 3196, 931, "Enivornment Control", "PILOT Air Right Engine")
definePushButton("PLT_AIR_SOURCE_BOTH", 11, 3197, 932, "Enivornment Control", "PILOT Air Both Engines")
define3PosTumb("PLT_WINDSHIELD_AIR", 11, 3634, 942, "Enivornment Control", "PILOT Wind Shield Air")
defineMultipositionSwitch("PLT_TEMP", 11, 3635, 950, 9, 0.125,"Enivornment Control" ,"PILOT Cabin Temperature Switch")
defineToggleSwitch("PLT_TEMP_AUTO_MAN", 11, 3636, 940, "Enivornment Control", "PILOT Temperature Auto/Man")
defineToggleSwitch("PLT_RAM_AIR", 11, 3637, 938, "Enivornment Control", "PILOT Ram Air")

-- BIT Panel
defineTumb("PLT_BIT_SWITCH", 10, 3076, 934, 1/11, {0.0, 1.0}, nil, false, "BIT Panel", "PILOT Master Test Selector (LB to rotate)")
defineToggleSwitch("PLT_BIT_SWITCH_PUSH", 10, 3077, 15098, "BIT Panel", "PILOT Master Test Selector (RB to pull/push)")

-- Light Panel
defineToggleSwitch("PLT_HOOK_BYPASS", 25, 3653, 915, "Light Panel", "PILOT Hook Bypass")
defineToggleSwitch("PLT_TAXI_LIGHT", 11, 3171, 918, "Light Panel", "PILOT Taxi Light")
define3PosTumb("PLT_FLOOD_LIGHT_RED", 11, 3172, 924, "Light Panel", "PILOT Red Flood Light")
define3PosTumb("PLT_FLOOD_LIGHT_WH", 11, 3173, 921, "Light Panel", "PILOT White Flood Light")
define3PosTumb("PLT_POS_LIGHT_WING", 11, 3174, 913, "Light Panel", "PILOT Position Lights Wings")
define3PosTumb("PLT_POS_LIGHT_TAIL", 11, 3175, 916, "Light Panel", "PILOT Position Lights Tail")
defineToggleSwitch("PLT_POS_LIGHT_FLASH", 11, 3176, 919, "Light Panel", "PILOT Position Lights Flash")
defineToggleSwitch("PLT_ANTICOL_LIGHT", 11, 3177, 923, "Light Panel", "PILOT Anti-Collision Lights")
defineMultipositionSwitch("PLT_LIGHT_INTENT_ACM", 11, 3178, 15005, 9, 0.125,"Light Panel" ,"PILOT ACM Panel Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_INDEXER", 25, 3212, 15006, 9, 0.125,"Light Panel" ,"PILOT AoA Indexer Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_INSTRUMENT", 11, 3179, 15007, 9, 0.125,"Light Panel" ,"PILOT Instrument Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_CONSOLE", 11, 3180, 15008, 9, 0.125,"Light Panel" ,"PILOT Console Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_FORMATION", 11, 3181, 15009, 9, 0.125,"Light Panel" ,"PILOT Formation Light Intensity")

-- Light panel RIO
define3PosTumb("RIO_FLOOD_LIGHT_RED", 11, 3693, 194, "Light Panel", "RIO Red Flood Light")
define3PosTumb("RIO_FLOOD_LIGHT_WH", 11, 3694, 159, "Light Panel", "RIO White Flood Light")
defineMultipositionSwitch("RIO_LIGHT_INTENT_INSTRUMENT", 11, 3695, 193, 9, 0.125,"Light Panel" ,"RIO Instrument Light Intensity")
defineMultipositionSwitch("RIO_LIGHT_INTENT_CONSOLE", 11, 3696, 192, 9, 0.125,"Light Panel" ,"RIO Console Light Intensity")

-- DISPLAY Panel: Power
defineToggleSwitch("PLT_VDI_PW_SW", 42, 3214, 1010, "Display", "PILOT VDI Power On/Off")
defineToggleSwitch("PLT_HUD_PW_SW", 40, 3213, 1009, "Display", "PILOT HUD Power On/Off")
defineToggleSwitch("PLT_HSD_PW_SW", 41, 3215, 1008, "Display", "PILOT HSD/ECMD Power On/Off")

-- DISPLAY Panel: Steer CMD
definePushButton("PLT_NAV_STEER_TACAN", 46, 3314, 1002, "Display", "PILOT Navigation Steer Commands: TACAN")
definePushButton("PLT_NAV_STEER_DEST", 46, 3315, 1003, "Display", "PILOT Navigation Steer Commands: Destination")
definePushButton("PLT_NAV_STEER_AWL", 46, 3318, 1004, "Display", "PILOT Navigation Steer Commands: AWL PCD")
definePushButton("PLT_NAV_STEER_VECTOR", 46, 3316, 1005, "Display", "PILOT Navigation Steer Commands: Vector")
definePushButton("PLT_NAV_STEER_MAN", 46, 3317, 1006, "Display", "PILOT Navigation Steer Commands: Manual")

-- DISPLAY Panel: HSD
define3PosTumb("PLT_HSD_DIS_MODE", 41, 3235, 1016, "Display", "PILOT HSD Display Mode")
defineToggleSwitch("PLT_HSD_ECM_OVER", 41, 3239, 1017, "Display", "PILOT HSD ECM Override")

-- HSD
defineRotary("PLT_HSD_KNOB_HDG", 41, 3241, 1039, "HSD", "PILOT HSD Selected Heading")
defineRotary("PLT_HSD_KNOB_CRS", 41, 3242, 1040, "HSD", "PILOT HSD Selected Course")
definePotentiometer("PLT_HSD_BRIGHT", 41, 3240, 1043, {0.0, 1.0}, "HSD", "PILOT HSD Brightness")
definePushButton("PLT_HSD_TEST", 41, 3243, 1041, "HSD", "PILOT HSD Test")

-- ECMD
definePotentiometer("RIO_ECMD_BRIGHT", 45, 3245, 2023, {0.0, 1.0}, "ECMD", "RIO ECMD Brightness")
definePushButton("RIO_ECMD_TEST", 45, 3246, 2024, "ECMD", "RIO ECMD Test")
defineToggleSwitch("RIO_ECM_MODE", 45, 3247, 189, "ECMD", "RIO ECM Display Mode")
define3PosTumb("RIO_ECM_OVERRIDE", 45, 3248, 156, "ECMD", "RIO ECM Display Override")
define3PosTumb("RIO_ECM_CORR", 45, 3249, 168, "ECMD", "RIO ECM Display Corr")
define3PosTumb("RIO_ECM_ADF", 45, 3250, 190, "ECMD", "RIO ECM Display Data/ADF")

-- TACAN CMD
defineToggleSwitch("PLT_TACAN_CMD_BUTTON", 47, 3324, 292, "TACAN", "PILOT TACAN CMD Button")
defineToggleSwitch("RIO_TACAN_CMD_BUTTON", 47, 3325, 135, "TACAN", "RIO TACAN CMD Button")

-- TACAN Pilot Panel  (TACAN PANEL)
defineTumb("PLT_TACAN_MODE", 47, 3326, 2041, 0.25, {0.0, 1.25}, nil, false, "TACAN", "PILOT TACAN Mode")
definePotentiometer("PLT_TACAN_VOLUME", 47, 3328, 2036, {0.0, 1.0}, "TACAN", "PILOT TACAN Volume")
defineFixedStepTumb("PLT_TACAN_MODE_NORMAL_INV", 47, 3335, 2042, 2, {0, 1}, {-1, 1}, nil, "TACAN", "PILOT TACAN Mode Normal/Inverse")
defineFixedStepTumb("PLT_TACAN_CHANNEL", 47, 3336, 2043, 2, {0, 1}, {-1, 1}, nil, "TACAN", "PILOT TACAN Channel XY")
definePushButton("PLT_TACAN_BIT", 47, 3334, 2115, "TACAN", "PILOT TACAN Bit")
defineTumb("PLT_TACAN_DIAL_TENS", 47, 3330, 8888, 1/12, {0.0, 1.08333333333}, nil, false, "TACAN", "PILOT TACAN Channel Wheel (Tens)")
defineTumb("PLT_TACAN_DIAL_ONES", 47, 3332, 8889, 1/9, {0.0, 1.11111111111}, nil, false, "TACAN", "PILOT TACAN Channel Lever (Ones)")

-- TACAN RIO Panel
defineTumb("RIO_TACAN_MODE", 47, 3338, 374, 0.25, {0.0, 1.25}, nil, false, "TACAN", "RIO TACAN Mode")
definePotentiometer("RIO_TACAN_VOLUME", 47, 3340, 375, {0.0, 1.0}, "TACAN", "RIO TACAN Volume")
defineToggleSwitch("RIO_TACAN_MODE_NORMAL_INV", 47, 3347, 373, "TACAN", "RIO TACAN Mode Normal/Inverse")
defineToggleSwitch("RIO_TACAN_CHANNEL", 47, 3348, 372, "TACAN", "RIO TACAN Channel XY")
definePushButton("RIO_TACAN_BIT", 47, 3346, 371, "TACAN", "RIO TACAN Bit")
defineTumb("RIO_TACAN_DIAL_TENS", 47, 3342, 8891, 1/12, {0.0, 1.08333333333}, nil, false, "TACAN", "RIO TACAN Channel Wheel (Tens)")
defineTumb("RIO_TACAN_DIAL_ONES", 47, 3344, 8890, 1/9, {0.0, 1.11111111111}, nil, false, "TACAN", "RIO TACAN Channel Lever (Ones)")

-- AN/ARA-63 Panel
defineToggleSwitch("PLT_ARA63_PW", 48, 3319, 910, "ANARA63 Panel", "PILOT AN/ARA-63 Power")
definePushButton("PLT_ARA63_BIT", 48, 3321, 911, "ANARA63 Panel", "PILOT AN/ARA-63 BIT Button")
defineMultipositionSwitch("PLT_ARA63_CHAN", 11, 3322, 912, 20, 1/19,"ANARA63 Panel" ,"PILOT AN/ARA-63 Channel Knob")

-- Pilot TONE VOLUME Panel
definePotentiometer("PLT_ALR67_VOL", 2, 3395, 2040, {0.0, 1.0}, "Volume Panel", "PILOT ALR-67 Volume")
definePotentiometer("PLT_AIM9_VOL", 2, 3397, 2039, {0.0, 1.0}, "Volume Panel", "PILOT Sidewinder Volume")

-- ICS Pilot
definePotentiometer("PLT_ICS_VOL", 2, 3380, 2048, {0.0, 1.0}, "ICS", "PILOT ICS Volume")
defineMultipositionSwitch("PLT_ICS_AMP_SEL", 2, 3382, 2045, 3, 0.5, "ICS" ,"PILOT ICS Amplifier Selector")
define3PosTumb("PLT_ICS_FUNC_SEL", 2, 3383, 2044, "ICS", "PILOT ICS Function Selector")

-- ICS RIO
definePotentiometer("RIO_ICS_VOL", 2, 3387, 400, {0.0, 1.0}, "ICS", "RIO ICS Volume")
defineMultipositionSwitch("RIO_ICS_AMP_SEL", 2, 3389, 401, 3, 0.5, "ICS" ,"RIO ICS Amplifier Selector")
define3PosTumb("RIO_ICS_FUNC_SEL", 2, 3390, 402, "ICS", "RIO ICS Function Selector")
define3PosTumb("RIO_ICS_XMTR_SEL", 2, 3399, 381, "ICS", "RIO XMTR SEL Switch")
define3PosTumb("RIO_ICS_UHF_LWR", 2, 3598, 380, "ICS", "RIO V/UHF 2 ANT Switch")
define3PosTumb("RIO_ICS_KY_MODE", 2, 3597, 382, "ICS", "RIO KY MODE Switch")

-- UHF ARC-159
defineTumb("PLT_UHF1_FREQ_MODE", 3, 3375, 2033, 0.5, {0.0, 1.5}, nil, false, "UHF 1", "PILOT UHF ARC-159 Freq Mode GUARD/MANUAL/PRESET")
defineMultipositionSwitch("PLT_UHF1_FUNCTION", 3, 3371, 2034, 4, 0.333333, "UHF 1", "PILOT UHF ARC-159 Function ADF/BOTH/MAIN/OFF")
defineMultipositionSwitch("PLT_UHF1_PRESETS", 3, 3373, 2032, 20, 0.0833333333, "UHF 1", "PILOT UHF ARC-159 Preset Channel Selector")
defineToggleSwitch("PLT_UHF1_SQUELCH", 3, 3365, 2035, "UHF 1", "PILOT UHF ARC-159 Squelch Switch")
define3PosTumb("PLT_UHF1_110_DIAL", 3, 3367, 2030, "UHF 1", "PILOT UHF ARC-159 100MHz & 10MHz Dial")
define3PosTumb("PLT_UHF1_1_DIAL", 3, 3368, 2029, "UHF 1", "PILOT UHF ARC-159 1MHz Dial")
define3PosTumb("PLT_UHF1_01_DIAL", 3, 3369, 2028, "UHF 1", "PILOT UHF ARC-159 0.1MHz Dial")
define3PosTumb("PLT_UHF1_025_DIAL", 3, 3370, 2026, "UHF 1", "PILOT UHF ARC-159 0.025MHz Dial")
defineToggleSwitch("PLT_UHF1_SHOW_PRESET_FREQ", 3, 3377, 8115, "UHF 1", "PILOT UHF ARC-159 Show Preset Frequency")
definePotentiometer("PLT_UHF1_VOL", 3, 3359, 2031, {0.0, 1.0}, "UHF 1", "PILOT UHF ARC-159 Volume")
definePotentiometer("RIO_UHF1_VOL", 3, 3361, 383, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Volume")
definePotentiometer("PLT_UHF1_BRIGHTNESS", 3, 3363, 2027, {0.0, 1.0}, "UHF 1", "PILOT UHF ARC-159 Display Brightness")
definePushButton("PLT_UHF1_LOAD", 3, 3378, 16009, "UHF 1", "PILOT UHF ARC-159 Load")
definePushButton("PLT_UHF1_TONE", 3, 3379, 16010, "UHF 1", "PILOT UHF ARC-159 Tone")

function getARC159_High_Frequency()
	--Export : 225000192.000000
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	freq = string.sub(freq, 1, 3)
	return tonumber(freq)	
end
function getARC159_Decimal_DIAL3_Frequency()
	--Export : 225975
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	--Get the 9
	freq = string.sub(freq, 4, 4)
	return tonumber(freq)	
end

function getARC159_Decimal_DIAL4_Frequency()
	--Export : 225975192.000000
	--00 25 50 75
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	--Get the 75
	freq = string.sub(freq, 5, 6)
	return tonumber(freq)	
end

function getARC159_String_Frequency()
	--Export : 225000192.000000
	local arc_159 = GetDevice(3)
	local freq = tostring(arc_159:get_frequency())
	return freq:sub(1,3) .. "." .. freq:sub(4,6)	
end
defineString("PLT_UHF_STRING_FREQ", getARC159_String_Frequency, 7, "UHF 1", "PILOT ARC-159 Frequency (string)")
defineIntegerFromGetter("PLT_UHF_DIAL4_FREQ", getARC159_Decimal_DIAL4_Frequency, 100, "UHF 1", "PILOT Dial 4 ARC-159 Frequency")
defineIntegerFromGetter("PLT_UHF_DIAL3_FREQ", getARC159_Decimal_DIAL3_Frequency, 10, "UHF 1", "PILOT Dial 3 ARC-159 Frequency")
defineIntegerFromGetter("PLT_UHF_HIGH_FREQ", getARC159_High_Frequency, 400, "UHF 1", "PILOT High ARC-159 Frequency")

moduleBeingDefined.inputProcessors["SET_UHF_FREQ"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(3):set_frequency(freq*1000)
end

-- VHF/UHF ARC-182 ("V/UHF 2")
defineMultipositionSwitch("RIO_VUHF_FREQ_MODE", 4, 3417, 353, 6, 0.2, "VUHF", "RIO VHF/UHF ARC-182 Frequency Mode 243 MAN G PRESET READ LOAD")
defineMultipositionSwitch("RIO_VUHF_MODE", 4, 3413, 358, 5, 0.25, "VUHF", "RIO VHF/UHF ARC-182 MODE OFF T/R T/R&G DF TEST")
defineMultipositionSwitch("RIO_VUHF_PRESETS", 4, 3415, 352, 30, 0.0833333333, "VUHF", "RIO VHF/UHF ARC-182 Preset Channel Selector")
defineToggleSwitch("RIO_VUHF_FM_AM", 4, 3419, 359, "VUHF", "RIO VHF/UHF ARC-182 FM/AM Switch")
defineToggleSwitch("RIO_VUHF_SQUELCH", 4, 3407, 351, "VUHF", "RIO VHF/UHF ARC-182 Squelch Switch")
define3PosTumb("RIO_VUHF_110_DIAL", 4, 3409, 354, "VUHF", "RIO VUHF ARC-182 100MHz & 10MHz Dial")
define3PosTumb("RIO_VUHF_1_DIAL", 4, 3410, 355, "VUHF", "RIO VUHF ARC-182 1MHz Dial")
define3PosTumb("RIO_VUHF_01_DIAL", 4, 3411, 356, "VUHF", "RIO VUHF ARC-182 0.1MHz Dial")
define3PosTumb("RIO_VUHF_025_DIAL", 4, 3412, 357, "VUHF", "RIO VUHF ARC-182 0.025MHz Dial")
definePotentiometer("RIO_VUHF_VOL", 4, 3401, 350, {0.0, 1.0}, "VUHF", "RIO VUHF ARC-182 Volume")
definePotentiometer("PLT_VUHF_VOL", 4, 3403, 2038, {0.0, 1.0}, "VUHF", "PILOT VUHF ARC-182 Volume")
definePotentiometer("RIO_VUHF_BRIGHTNESS", 4, 3405, 360, {0.0, 1.0}, "VUHF", "RIO VUHF ARC-182 Display Brightness")

function getARC182_High_Frequency()
	--225000288
	-- 65000056	
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())

	if(string.len(freq) == 8) then
		freq = string.sub(freq, 1, 2)
	else
	freq = string.sub(freq, 1, 3)
	end
	return tonumber(freq)	
end
function getARC182_Decimal_DIAL3_Frequency()
	--225975288
	-- 65975056
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	--Get the 9
	if(string.len(freq) == 8) then
		freq = string.sub(freq, 3, 3)
	else
	freq = string.sub(freq, 4, 4)
	end
	return tonumber(freq)	
end

function getARC182_Decimal_DIAL4_Frequency()
	--225975288
	-- 65975056
	--00 25 50 75
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	--Get the 75
	if(string.len(freq) == 8) then
		freq = string.sub(freq, 4, 5)
	else
	freq = string.sub(freq, 5, 6)
	end
	return tonumber(freq)	
end

function getARC182_String_Frequency()
	--225975288
	-- 65975056
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	if(string.len(freq) == 8) then
		--559.9752
		return freq:sub(1,2) .. "." .. freq:sub(3,5)	
	else
		return freq:sub(1,3) .. "." .. freq:sub(4,6)	
	end	
end
defineString("RIO_VUHF_STRING_FREQ", getARC182_String_Frequency, 7, "VUHF", "RIO ARC-182 Frequency (string)")
defineIntegerFromGetter("RIO_VUHF_DIAL4_FREQ", getARC182_Decimal_DIAL4_Frequency, 100, "VUHF", "RIO Dial 4 ARC-182 Frequency")
defineIntegerFromGetter("RIO_VUHF_DIAL3_FREQ", getARC182_Decimal_DIAL3_Frequency, 10, "VUHF", "RIO Dial 3 ARC-182 Frequency")
defineIntegerFromGetter("RIO_VUHF_HIGH_FREQ", getARC182_High_Frequency, 400, "VUHF", "RIO High ARC-182 Frequency")

moduleBeingDefined.inputProcessors["SET_VUHF_FREQ"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	
	if type(freq) == "nil" then return end
	
	GetDevice(4):set_frequency(freq*1000)
end

-- KY-28
defineTumb("RIO_KY28_POWER", 2, 3423, 116, 0.5, {0.0, 1.5}, nil, false, "KY-28", "RIO KY-28 Power Mode")
defineTumb("RIO_KY28_RADIO_SELECTOR", 2, 3425, 115, 0.5, {0.0, 1.5}, nil, false, "KY-28", "RIO KY-28 Radio Selector")
defineToggleSwitch("RIO_KY28_FLIPCOVER", 2, 3595, 150, "KY-28", "RIO KY-28 ZEROIZE Cover")
defineToggleSwitch("RIO_KY28_ZEROIZE", 2, 3427, 361, "KY-28", "RIO KY-28 ZEROIZE")

-- UHF/VHF/UHF Pilot/RIO Remote Display
definePotentiometer("PLT_UHF_REMOTE_BRIGHTNESS", 3, 3350, 1031, {0.0, 1.0}, "UHF 1", "PILOT UHF ARC-159 Remote Display Brightness")
definePotentiometer("RIO_UHF_REMOTE_BRIGHTNESS", 3, 3353, 406, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Remote Display Brightness")
definePotentiometer("PLT_VUHF_REMOTE_BRIGHTNESS", 4, 3356, 1030, {0.0, 1.0}, "VUHF", "PILOT VHF/UHF Radio Remote Display Brightness")
defineToggleSwitch("PLT_UHF_DISPLAY_TEST", 2, 3352, 15004, "UHF 1", "PILOT UHF ARC-159 Radio Remote Display Test")
defineToggleSwitch("RIO_UHF_DISPLAY_TEST", 3, 3355, 405, "UHF 1", "RIO UHF ARC-159 Radio Remote Display Test")
defineToggleSwitch("PLT_VUHF_DISPLAY_TEST", 3, 3355, 15003, "VUHF", "PILOT VHF/UHF ARC-182 Radio Remote Display Test")

-- DECM Panel
defineMultipositionSwitch("RIO_DECM_PW_MODE", 53, 3252, 151, 6, 0.2, "DECM Panel" ,"RIO DECM ALQ-100 Power/Mode")
definePotentiometer("RIO_DECM_VOL", 53, 3253, 9950, {0.0, 1.0}, "DECM Panel", "RIO DECM ALQ-100 Volume")

-- RWR Control Panel ALR-67
definePotentiometer("PLT_RWR_BRIGHT", 54, 3261, 16011, {0.0, 1.0}, "RWR Control Panel", "PILOT AN/ALR-67 Display Brightness")
definePotentiometer("RIO_RWR_BRIGHT", 54, 3263, 376, {0.0, 1.0}, "RWR Control Panel", "RIO AN/ALR-67 Display Brightness")
defineMultipositionSwitch("RIO_RWR_DIS_TYP", 54, 3257, 2136, 5, 0.25, "DECM Panel" ,"RIO AN/ALR-67 Display Type")
define3PosTumb("RIO_RWR_MODE", 54, 3256, 2137, "DECM Panel", "RIO AN/ALR-67 Mode")
define3PosTumb("RIO_RWR_TEST", 54, 3261, 2140, "DECM Panel", "RIO AN/ALR-67 Mode")
defineToggleSwitch("RIO_RWR_PW", 54, 3259, 2139, "DECM Panel", "RIO AN/ALR-67 Power")
definePotentiometer("RIO_RWR_VOL", 54, 3254, 2138, {0.0, 1.0}, "DECM Panel", "RIO AN/ALR-67 Volume")

-- AN/ALE-39 Mode Panel
define3PosTumb("RIO_CMDS_PW", 5, 3267, 390, "CMDS", "RIO AN/ALE-37 Power/Mode")
define3PosTumb("RIO_CMDS_DISP_CHAFF", 5, 3269, 389, "CMDS", "RIO AN/ALE-37 Chaff Dispense")
define3PosTumb("RIO_CMDS_DISP_FLAR", 5, 3270, 388, "CMDS", "RIO AN/ALE-37 Flare Dispense")
define3PosTumb("RIO_CMDS_DISP_JAMMER", 5, 3271, 387, "CMDS", "RIO AN/ALE-37 Jammer Dispense")
define3PosTumb("RIO_CMDS_FLAREMODE", 5, 3272, 398, "CMDS", "RIO AN/ALE-37 Flare Mode")
definePushButton("RIO_CMDS_FLARE_SALVO", 5, 3272, 391, "CMDS", "RIO AN/ALE-37 Flare Salvo")
definePotentiometer("RIO_CMDS_COUNT_CHAFF", 5, 3275, 386, {0.0, 1.0}, "CMDS", "AN/ALE-37 Chaff Counter")
definePotentiometer("RIO_CMDS_COUNT_FLARE", 5, 3277, 385, {0.0, 1.0}, "CMDS", "AN/ALE-37 Flare Counter")
definePotentiometer("RIO_CMDS_COUNT_JAMMER", 5, 3279, 399, {0.0, 1.0}, "CMDS", "AN/ALE-37 Jammer Counter")

-- AN/ALE-39 Program Panel
defineTumb("RIO_CMDS_LOAD_TYP_L10", 5, 3281, 206, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 L10 Load Type")
defineTumb("RIO_CMDS_LOAD_TYP_L20", 5, 3283, 207, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 L20 Load Type")
defineTumb("RIO_CMDS_LOAD_TYP_R10", 5, 3285, 209, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 R10 Load Type")
defineTumb("RIO_CMDS_LOAD_TYP_R20", 5, 3287, 208, 0.5, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 R20 Load Type")
defineTumb("RIO_CMDS_CHAFF_BURST_QUAN", 5, 3298, 214, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Burst Quantity")
defineTumb("RIO_CMDS_CHAFF_BURST_INTER", 5, 3300, 215, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Burst Interval")
defineTumb("RIO_CMDS_CHAFF_SALVO_QUAN", 5, 3302, 203, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Salvo Quantity")
defineTumb("RIO_CMDS_CHAFF_SALVO_INTER", 5, 3304, 202, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Chaff Salvo Interval")
defineTumb("RIO_CMDS_FLARE_QUAN", 5, 3306, 205, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Flare Quantity")
defineTumb("RIO_CMDS_FLARE_INTER", 5, 3308, 210, 0.2, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Flare Interval")
defineTumb("RIO_CMDS_JAMM_QUAN", 5, 3295, 204, 0.333, {0.0, 1.0}, nil, false, "CMDS Program", "RIO AN/ALE-37 Jammer Quantity")
defineTumb("RIO_CMDS_JAMM_INTER_UNIT", 5, 3289, 211, 0.111, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Jammer Interval Units")
defineTumb("RIO_CMDS_JAMM_INTER_10", 5, 3291, 212, 0.111, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Jammer Interval Tens")
defineTumb("RIO_CMDS_JAMM_INTER_100", 5, 3293, 213, 0.111, {0.0, 1.0}, nil, false, "CMDS Program", "RIO Jammer Interval Hundreds")
definePushButton("RIO_CMDS_PROG_RESET", 5, 3297, 216, "CMDS", "RIO AN/ALE-37 Programmer Reset")

-- INS
defineMultipositionSwitch("RIO_TID_MODE_NAV", 50, 3106, 50, 7, 0.1666667, "INS" ,"RIO TID Navigation Mode")
defineMultipositionSwitch("RIO_TID_MODE_DEST", 46, 3109, 51, 8, 0.142857, "INS" ,"RIO TID Destination Mode")

-- AHRS / Compass  (COMP Panel)
definePotentiometer("PLT_AHRS_HDG_KNOB", 51, 3433, 904, {-1.0, 1.0}, "AHRS", "PILOT Compass HDG Slave Knob")
definePushButton("PLT_AHRS_HDG_PUSH", 51, 3432, 16014, "AHRS", "PILOT Compass HDG Slave Push")
define3PosTumb("PLT_AHRS_MODE", 51, 3434, 905, "AHRS", "PILOT Compass Mode")
defineToggleSwitch("PLT_AHRS_HEMISPHERE", 51, 3436, 906, "AHRS", "PILOT Compass N-S Hemisphere")
definePotentiometer("PLT_AHRS_LAT", 51, 3438, 909, {0.0, 1.0}, "AHRS", "PILOT Compass LAT Correction")

-- Spoiler Overrides
defineToggleSwitch("PLT_SPOIL_OVER_COVER_INBOARD", 14, 3428, 902, "Spoiler", "PILOT Inboard Spoiler Override Cover")
defineToggleSwitch("PLT_SPOIL_OVER_COVER_OUTBOARD", 14, 3429, 903, "Spoiler", "PILOT Outboard Spoiler Override Cover")
defineToggleSwitch("PLT_SPOIL_OVER_INBOARD", 14, 3430, 908, "Spoiler", "PILOT Inboard Spoiler Override")
defineToggleSwitch("PLT_SPOIL_OVER_OUTBOARD", 14, 3431, 907, "Spoiler", "PILOT Outboard Spoiler Override")

-- Gun Elevation 
defineRotary("PLT_GUN_ELEV_ADJUST", 55, 3131, 1000, "Gun", "PILOT Gun Elevation Lead Adjustment")
defineRotary("PLT_GUN_AMMU_COUNT_ADJUST", 55, 3132, 1022, "Gun", "PILOT Gun Ammunition Counter Adjustment")

-- DISPLAY Panel
definePotentiometer("PLT_HUD_PITCH_BRIGHT", 40, 3223, 1007, {0.0, 1.0}, "Display", "PILOT HUD Pitch Ladder Brightness")
defineToggleSwitch("PLT_VDI_MODE_DISP", 42, 3224, 1019, "Display", "PILOT VDI Display Mode")
defineToggleSwitch("PLT_VDI_MODE_LAND", 42, 3225, 1018, "Display", "PILOT VDI Landing Mode")
defineToggleSwitch("PLT_HUD_DECLUTTER", 40, 3226, 1021, "Display", "PILOT HUD De-clutter On/Off")
defineToggleSwitch("PLT_HUD_MODE_AWL", 40, 3227, 1020, "Display", "PILOT HUD AWL Mode")
definePushButton("PLT_HUD_MODE_TAKEOFF", 40, 3216, 1015, "Display", "PILOT HUD Take-Off Mode")
definePushButton("PLT_HUD_MODE_CRUISE", 40, 3217, 1014, "Display", "PILOT HUD Cruise Mode")
definePushButton("PLT_HUD_MODE_A2A", 40, 3218, 1013, "Display", "PILOT HUD Air-to-Air Mode")
definePushButton("PLT_HUD_MODE_A2G", 40, 3219, 1012, "Display", "PILOT HUD Air-to-Ground Mode")
definePushButton("PLT_HUD_MODE_LAND", 40, 3220, 1011, "Display", "PILOT HUD Landing Mode")

-- Standby ADI
definePushButton("PLT_STDBYAI_UNCAGE", 30, 3545, 1032, "Standby ADI", "PILOT Standby ADI Push to uncage")
definePotentiometer("PLT_STDBYAI_TRIM", 30, 3546, 19101, {0.0, 1.0}, "Standby ADI", "PILOT Standby ADI Knob")
definePushButton("RIO_STDBYAI_UNCAGE", 30, 3547, 6155, "Standby ADI", "RIO Standby ADI Push to uncage")
definePotentiometer("RIO_STDBYAI_TRIM", 30, 3548, 6156, {0.0, 1.0}, "Standby ADI", "RIO Standby ADI Knob")
definePushButton("PLT_ACCEL_RESET", 24, 3488, 228, "Display", "PILOT Accelerometer Reset")

-- VDI & HUD Indicator Controls
defineToggleSwitch("PLT_HUD_FILTER", 40, 3228, 1033, "HUD", "PILOT HUD Filter")
definePotentiometer("PLT_HUD_TRIM", 40, 3229, 1034, {0.0, 1.0}, "HUD", "PILOT HUD TRIM")
definePotentiometer("PLT_VSDI_TRIM", 42, 3230, 1035, {0.0, 1.0}, "HUD", "PILOT VSDI Screen Trim")
definePotentiometer("PLT_VDI_CONTRAST", 42, 3231, 1038, {0.0, 1.0}, "HUD", "PILOT VDI Screen Contrast")
definePotentiometer("PLT_VSDI_BRIGHT", 42, 3232, 1036, {0.0, 1.0}, "HUD", "PILOT VSDI Screen Brightness")
definePotentiometer("PLT_HUD_BRIGHT", 40, 3233, 1037, {0.0, 1.0}, "HUD", "PILOT HUD Brightness")
--definePushButton("PLT_VDI_FILTER", 42, 3234, XXXXX, "HUD", "PILOT VDI Filter") missing arg

-- Under HUD / Master Arm / Gun/Weapons Panel
defineToggleSwitch("PLT_MASTER_ARM_COVER", 55, 3135, 1046, "Weapons Panel", "PILOT Master Arm Cover")
define3PosTumb("PLT_MASTER_ARM_SW", 55, 3136, 1047, "Weapons Panel", "PILOT Master Arm Switch")
defineToggleSwitch("PLT_ACM_COVER", 55, 3133, 1049, "Weapons Panel", "PILOT ACM Cover")
definePushButton("PLT_ACM_JETT", 55, 3138, 1048, "Weapons Panel", "PILOT ACM Jettison")
definePushButton("PLT_MASTER_CAUTION_RESET", 34, 3056, 9199, "Weapons Panel", "PILOT Master Caution Reset")
definePushButton("PLT_GUN_RATE", 55, 3130, 16000, "Weapons Panel", "PILOT Gun Rate")
definePushButton("PLT_SIDEWINDER_COOL", 55, 3139, 16001, "Weapons Panel", "PILOT Sidewinder Cool")
definePushButton("PLT_MISSLE_PREP", 55, 3140, 16002, "Weapons Panel", "PILOT Missile Prepare")
definePushButton("PLT_MISSLE_MODE", 55, 3141, 16003, "Weapons Panel", "PILOT Missile Mode")
definePushButton("PLT_EMERG_STORE_JETT", 55, 3142, 239, "Weapons Panel", "PILOT Emergency Stores Jettison")
defineRotary("PLT_CLOCK_WIND", 26, 3042, 1051, "Weapons Panel", "PILOT Clock Wind")
definePushButton("PLT_CLOCK_TIMER", 26, 3043, 1000, "Weapons Panel", "PILOT Clock Timer Start/Stop/Reset")
defineRotary("RIO_CLOCK_WIND", 26, 3697, 1052, "Weapons Panel", "RIO Clock Wind")
definePushButton("RIO_CLOCK_TIMER", 26, 3698, 1053, "Weapons Panel", "RIO Clock Timer Start/Stop/Reset")

-- RIO TID
defineMultipositionSwitch("RIO_TID_MODE", 43, 3112, 2005, 4, 0.33333, "TID" ,"RIO TID Mode")
defineTumb("RIO_TID_RANGE", 43, 3113, 2006, 0.5, {-1.0, 1.0}, nil, false, "TID" ,"RIO TID Range")
definePushButton("RIO_TID_NON_ATTK", 43, 3114, 226, "TID", "RIO TID Non Attack")
definePushButton("RIO_TID_JAM_STROBE", 43, 3115, 1118, "TID", "RIO TID Jam Strobe")
definePushButton("RIO_TID_DATA_LINK", 43, 3116, 1117, "TID", "RIO TID Data Link")
definePushButton("RIO_TID_SYM_ELEM", 43, 3117, 1116, "TID", "RIO TID Sym Elem")
definePushButton("RIO_TID_ALT_NUM", 43, 3118, 1115, "TID", "RIO TID Alt Num")
definePushButton("RIO_TID_RID_DSBL", 43, 3119, 2004, "TID", "RIO TID Reject Image Device disable")
definePushButton("RIO_TID_LAUNCH_ZONE", 43, 3120, 2113, "TID", "RIO TID Launch Zone")
definePushButton("RIO_TID_VEL_VECTOR", 43, 3121, 2114, "TID", "RIO TID Velocity Vector")
definePushButton("RIO_TID_CLSN", 43, 3122, 52, "TID", "RIO TID Collision Steering")
definePushButton("RIO_TID_TRACKHOLD", 43, 3123, 53, "TID", "RIO TID Track Hold")
definePotentiometer("RIO_TID_BRIGHT", 43, 3124, 48, {0.0, 1.0}, "TID", "RIO TID Brightness")
definePotentiometer("RIO_TID_CONTRAST", 43, 3125, 49, {0.0, 1.0}, "TID", "RIO TID Contrast")

-- RIO HCU
defineToggleSwitch("RIO_HCU_TCS", 58, 3096, 2007, "HCU", "RIO HCU TCS Mode")
defineToggleSwitch("RIO_HCU_RADAR", 58, 3097, 2008, "HCU", "RIO HCU Radar Mode")
defineToggleSwitch("RIO_HCU_DDD", 58, 3098, 2009, "HCU", "RIO HCU DDD Mode")
defineToggleSwitch("RIO_HCU_TID", 58, 3099, 2010, "HCU", "RIO HCU TID Mode")
define3PosTumb("RIO_HCU_TVIR_SW", 37, 3100, 2011, "HCU", "RIO HCU TV/IR Switch")
define3PosTumb("RIO_HCU_WCS", 39, 3101, 2012, "HCU", "RIO HCU WCS Switch")
definePushButton("RIO_HCU_PW_RESET", 39, 3631, 2013, "HCU", "RIO HCU Power Reset")
definePushButton("RIO_HCU_LIGHT_TEST", 39, 3632, 2014, "HCU", "RIO HCU Light Test")

-- RIO DDD
definePushButton("RIO_RADAR_5", 39, 3450, 40, "DDD", "RIO Radar 5 NM")
definePushButton("RIO_RADAR_10", 39, 3451, 41, "DDD", "RIO Radar 10 NM")
definePushButton("RIO_RADAR_20", 39, 3452, 42, "DDD", "RIO Radar 20 NM")
definePushButton("RIO_RADAR_50", 39, 3453, 43, "DDD", "RIO Radar 50 NM")
definePushButton("RIO_RADAR_100", 39, 3454, 44, "DDD", "RIO Radar 100 NM")
definePushButton("RIO_RADAR_200", 39, 3455, 45, "DDD", "RIO Radar 200 NM")
--definePushButton("RIO_DDD_FILTER", 39, 3456, XXX, "DDD", "RIO DDD Filter") Missing agr
definePushButton("RIO_RADAR_PULSE", 39, 3457, 10, "DDD", "RIO Radar Pulse Search")
definePushButton("RIO_RADAR_TWSMAN", 39, 3458, 11, "DDD", "RIO Track While Scan Manual")
definePushButton("RIO_RADAR_TWSAUTO", 39, 3459, 12, "DDD", "RIO Track While Scan Auto")
definePushButton("RIO_RADAR_RWS", 39, 3460, 13, "DDD", "RIO Track While Scan")
definePushButton("RIO_RADAR_PDSRCH", 39, 3461, 14, "DDD", "RIO Radar Pulse Doppler Search")
definePushButton("RIO_RADAR_PSTT", 39, 3462, 15, "DDD", "RIO Radar Pulse Single Target Track")
definePushButton("RIO_RADAR_PDSTT", 39, 3463, 9916, "DDD", "RIO Radar Pulse Doppler Target Track")
definePushButton("RIO_DDD_IFF", 39, 3464, 17, "DDD", "RIO DDD Interrogate Friend or Foe")
definePushButton("RIO_DDD_IR", 39, 3465, 18, "DDD", "RIO DDD Infrared")
definePushButton("RIO_DDD_RADAR", 39, 3466, 19, "DDD", "RIO DDD Radar")
definePushButton("RIO_CCM_SPL", 39, 3673, 1812, "DDD", "RIO CCM SPL")
definePushButton("RIO_CCM_ALT_DIFF", 39, 3674, 1813, "DDD", "RIO CCM ALT DIFF")
definePushButton("RIO_CCM_VGS", 39, 3675, 1814, "DDD", "RIO CCM VGS")
definePotentiometer("RIO_RADAR_IR_GAIN", 39, 3473, 20, {0.0, 1.0}, "DDD", "RIO Radar IR Gain")
definePotentiometer("RIO_RADAR_IR_VOL", 39, 3474, 21, {0.0, 1.0}, "DDD", "RIO Radar IR Volume")
definePotentiometer("RIO_RADAR_IR_THERESHOLD", 39, 3475, 22, {0.0, 1.0}, "DDD", "RIO Radar IR Threshold")
definePotentiometer("RIO_DDD_BRIGHT", 39, 3476, 23, {0.0, 1.0}, "DDD", "RIO DDD Brightness")
definePotentiometer("RIO_DDD_PULSE_VID", 39, 3477, 24, {0.0, 1.0}, "DDD", "RIO DDD Pulse Video")
definePotentiometer("RIO_DDD_ERASE", 39, 3478, 25, {0.0, 1.0}, "DDD", "RIO DDD Erase")
definePotentiometer("RIO_DDD_PULSE_GAIN", 39, 3479, 26, {0.0, 1.0}, "DDD", "RIO Pulse Gain")
definePotentiometer("RIO_ACM_THERESHOLD", 39, 3480, 27, {0.0, 1.0}, "DDD", "RIO ACM Threshold")
definePotentiometer("RIO_RADAR_JAMJET", 39, 3481, 28, {0.0, 1.0}, "DDD", "RIO JAM/JET")
definePotentiometer("RIO_PD_THERESHOLD_CLUTTER", 39, 3482, 29, {0.0, 1.0}, "DDD", "RIO PD Threshold Clutter")
definePotentiometer("RIO_PD_THERESHOLD_CLEAR", 39, 3483, 30, {0.0, 1.0}, "DDD", "RIO PD Threshold Clear")
define3PosTumb("RIO_DDD_ASPECT", 39, 3467, 34, "DDD", "RIO DDD Aspect")
define3PosTumb("RIO_DDD_VC_SCALE", 39, 3468, 35, "DDD", "RIO DDD Closing Velocity Scale")
define3PosTumb("RIO_DDD_TGTS", 39, 3469, 36, "DDD", "RIO DDD Target Size")
define3PosTumb("RIO_DDD_MLC", 39, 3470, 37, "DDD", "RIO DDD Main Lobe Clutter Filter")
defineToggleSwitch("RIO_DDD_AGC", 39, 3471, 38, "DDD", "RIO DDD Automatic Gain Control")
defineToggleSwitch("RIO_DDD_PARA_AMP", 39, 3472, 3900, "DDD", "RIO DDD Parametric Amplifier")

-- RIO RADAR Panel
defineMultipositionSwitch("RIO_RADAR_ELE_BARS", 39, 3442, 79, 4, 0.33333, "Radar" ,"RIO Radar Elevation Scan")
defineMultipositionSwitch("RIO_RADAR_AZI_SCAN", 39, 3443, 80, 4, 0.33333, "Radar" ,"RIO Radar Azimuth Scan")
definePotentiometer("RIO_RADAR_ELE_CENTER", 39, 3446, 81, {-1.0, 1.0}, "Radar", "RIO Radar Elevation Center")
definePotentiometer("RIO_RADAR_AZI_CENTER", 39, 3447, 82, {-1.0, 1.0}, "Radar", "RIO Radar Azimuth Center")
defineToggleSwitch("RIO_RADAR_STABI", 39, 3449, 83, "Radar", "RIO Radar Stabilize")
define3PosTumb("RIO_RADAR_VSL", 39, 3448, 84, "Radar", "RIO Radar VSL Switch")

-- RIO TCS Controls
define3PosTumb("RIO_TCS_ACQ", 37, 3495, 87, "TCS", "RIO TCS Acquisition")
defineToggleSwitch("RIO_TCS_FOV", 37, 3494, 88, "TCS", "RIO TCS FOV")
define3PosTumb("RIO_TCS_SLAVE", 37, 3496, 89, "TCS", "RIO TCS Slave")
define3PosTumb("RIO_RECORD_PW", 37, 3604, 90, "TCS", "RIO Record Power")
defineMultipositionSwitch("RIO_RECORD_MODE", 37, 3605, 91, 5, 1.0/4.0, "TCS" ,"RIO Record Mode")
definePotentiometer("RIO_RECORD_RESET", 37, 3609, 16016, {0.0, 1.0}, "Radar", "RIO Record Reset")

-- RIO Armament Panel
defineMultipositionSwitch("RIO_WEAPON_TYPE", 55, 3146, 59, 44, 1.0/43.0, "Armament Panel" ,"RIO Weapon Type Wheel")
defineTumb("RIO_WEAPON_INTER_10", 55, 3148, 9960, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Interval x10ms")
defineTumb("RIO_WEAPON_INTER_100", 55, 3147, 9961, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Interval x100ms")
defineTumb("RIO_WEAPON_QUANT_10", 55, 3149, 9962, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Quantity 10s")
defineTumb("RIO_WEAPON_QUANTR_1", 55, 3150, 9963, 0.111, {0.0, 1.0}, nil, false, "Armament Panel", "RIO Weapon Quantity 1s")
defineMultipositionSwitch("RIO_WEAPON_ATTK_MODE", 55, 3151, 2022, 5, 0.25, "Armament Panel" ,"RIO Weapon Attack Mode")
defineMultipositionSwitch("RIO_WEAPON_ELEC_FUSE", 55, 3152, 58, 5, 0.25, "Armament Panel" ,"RIO Weapon Elec Fuse")
defineMultipositionSwitch("RIO_WEAPON_MSL_SPD", 55, 3153, 72, 6, 0.2, "Armament Panel" ,"RIO Weapon Missile Speed Gate")
define3PosTumb("RIO_WEAPON_SEL_JETT", 55, 3154, 78, "Armament Panel", "RIO Weapon Selective Jettison")
defineToggleSwitch("RIO_WEAPON_SEL_JETT_COVER", 55, 3655, 1069, "Armament Panel", "RIO Weapon Selective Jettison Aux Guard")
define3PosTumb("RIO_WEAPON_MECH_FUSE", 55, 3155, 63, "Armament Panel", "RIO RIO Weapon Mech Fuse")
define3PosTumb("RIO_WEAPON_MSL_OPT", 55, 3156, 75, "Armament Panel", "RIO RIO Weapon Missile Option")
defineToggleSwitch("RIO_WEAPON_BOMB_SINGLE", 55, 3157, 60, "Armament Panel", "RIO Weapon Bomb Single/Pairs")
defineToggleSwitch("RIO_WEAPON_BOMB_STEP", 55, 3158, 61, "Armament Panel", "RIO Weapon Bomb Step/Ripple")
defineToggleSwitch("RIO_WEAPON_AG_GUN", 55, 3159, 62, "Armament Panel", "RIO Weapon A/G Gun Mode")
defineToggleSwitch("RIO_WEAPON_JETT_RACK", 55, 3160, 66, "Armament Panel", "RIO Weapon Jettison Racks/Weapons")
defineToggleSwitch("RIO_WEAPON_JETT_TANK_L", 55, 3164, 73, "Armament Panel", "RIO Weapon Jettison Left Tank")
defineToggleSwitch("RIO_WEAPON_JETT_TANK_R", 55, 3169, 67, "Armament Panel", "RIO Weapon Jettison Right Tank")
define3PosTumb("RIO_WEAPON_JETT_STAT_1", 55, 3163, 68, "Armament Panel", "RIO Weapon Jettison Station 1")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_3", 55, 3165, 65, "Armament Panel", "RIO Weapon Jettison Station 3")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_4", 55, 3166, 69, "Armament Panel", "RIO Weapon Jettison Station 4")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_5", 55, 3167, 70, "Armament Panel", "RIO Weapon Jettison Station 5")
defineToggleSwitch("RIO_WEAPON_JETT_STAT_6", 55, 3168, 64, "Armament Panel", "RIO Weapon Jettison Station 6")
define3PosTumb("RIO_WEAPON_JETT_STAT_8", 55, 3170, 71, "Armament Panel", "RIO Weapon Jettison Station 8")
definePushButton("RIO_WEAPON_AA_LAUNCH", 55, 3161, 74, "Armament Panel", "RIO Weapon A/A Launch")
definePushButton("RIO_WEAPON_NEXT_LAUNCH", 43, 3162, 9964, "Armament Panel", "RIO Weapon Next Launch")

-- Computer Address Panel (CAP)
defineMultipositionSwitch("RIO_CAP_CATRGORY", 23, 3530, 98, 6, 0.2, "CAP" ,"RIO CAP Category")
definePushButton("RIO_CAP_BTN_4", 23, 3521, 124, "CAP", "RIO CAP Button 4")
definePushButton("RIO_CAP_BTN_5", 23, 3522, 123, "CAP", "RIO CAP Button 5")
definePushButton("RIO_CAP_BTN_3", 23, 3520, 125, "CAP", "RIO CAP Button 3")
definePushButton("RIO_CAP_BTN_2", 23, 3519, 126, "CAP", "RIO CAP Button 2")
definePushButton("RIO_CAP_BTN_1", 23, 3518, 127, "CAP", "RIO CAP Button 1")
definePushButton("RIO_CAP_BTN_TNG", 23, 3528, 128, "CAP", "RIO CAP Button TNG NBR")
definePushButton("RIO_CAP_BTN_10", 23, 3527, 129, "CAP", "RIO CAP Button 10")
definePushButton("RIO_CAP_BTN_9", 23, 3526, 130, "CAP", "RIO CAP Button 9")
definePushButton("RIO_CAP_BTN_8", 23, 3525, 131, "CAP", "RIO CAP Button 8")
definePushButton("RIO_CAP_BTN_7", 23, 3524, 132, "CAP", "RIO CAP Button 7")
definePushButton("RIO_CAP_BTN_6", 23, 3523, 133, "CAP", "RIO CAP Button 6")
definePushButton("RIO_CAP_BTN_PGM_RESTRT", 23, 3529, 134, "CAP", "RIO CAP Button PGM RSTRT")
definePushButton("RIO_CAP_LONG_6", 23, 3541, 136, "CAP", "RIO CAP LONG 6")
definePushButton("RIO_CAP_LAT_1", 23, 3536, 137, "CAP", "RIO CAP LAT 1")
definePushButton("RIO_CAP_NBR_2", 23, 3537, 138, "CAP", "RIO CAP NBR 2")
definePushButton("RIO_CAP_7", 23, 3542, 139, "CAP", "RIO CAP 7")
definePushButton("RIO_CAP_HDG_8", 23, 3543, 140, "CAP", "RIO CAP HDG 8")
definePushButton("RIO_CAP_SPD_3", 23, 3538, 141, "CAP", "RIO CAP SPD 3")
definePushButton("RIO_CAP_ALT_4", 23, 3539, 143, "CAP", "RIO CAP ALT 4")
definePushButton("RIO_CAP_9", 23, 3544, 142, "CAP", "RIO CAP 9")
definePushButton("RIO_CAP_BRG_0", 23, 3535, 144, "CAP", "RIO CAP BRG 0")
definePushButton("RIO_CAP_RNG_5", 23, 3540, 145, "CAP", "RIO CAP RNG 5")
definePushButton("RIO_CAP_NE", 23, 3533, 146, "CAP", "RIO CAP N+E")
definePushButton("RIO_CAP_SW", 23, 3532, 147, "CAP", "RIO CAP S-W")
definePushButton("RIO_CAP_CLEAR", 23, 3531, 148, "CAP", "RIO CAP Clear")
definePushButton("RIO_CAP_ENTER", 23, 3534, 149, "CAP", "RIO CAP Enter")

-- Datalink
define3PosTumb("RIO_DATALINK_PW", 52, 3589, 413, "Datalink", "RIO Datalink Power")
defineToggleSwitch("RIO_DATALINK_ANT", 52, 3590, 175, "Datalink", "RIO Datalink Antenna")
defineToggleSwitch("RIO_DATALINK_REPLY", 52, 3591, 176, "Datalink", "RIO Datalink Reply")
defineToggleSwitch("RIO_DATALINK_CAINS", 52, 3592, 177, "Datalink", "RIO Datalink CAINS/TAC")
define3PosTumb("RIO_DATALINK_ANTIJAM", 52, 3585, 191, "Datalink", "RIO Datalink Antijam")
defineTumb("RIO_DATALINK_FREQ_10", 52, 3586, 196, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Freq 10MHz")
defineTumb("RIO_DATALINK_FREQ_1", 52, 3587, 195, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Freq 1MHz")
defineTumb("RIO_DATALINK_FREQ_100", 52, 3588, 197, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Freq 100kHz")
defineTumb("RIO_DATALINK_ADDR_HI", 52, 3593, 222, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Address High")
defineTumb("RIO_DATALINK_ADDR_LO", 52, 3594, 223, 0.111, {0.0, 1.0}, nil, false, "Datalink", "RIO Datalink Address Low")
defineMultipositionSwitch("RIO_BEACON_MODE", 52, 3680, 118, 7, 0.1666667, "Datalink" ,"RIO Beacon Mode")
definePushButton("RIO_BEACON_ACLS", 52, 3679, 117, "Datalink", "RIO Beacon ACLS Test")
define3PosTumb("RIO_BEACON_PW", 52, 3678, 96, "Datalink", "RIO Beacon Power")

-- IFF Panel
define3PosTumb("RIO_IFF_AUDIOLIGHT", 64, 3613, 161, "IFF", "RIO IFF Audio/Light")
define3PosTumb("RIO_IFF_M1", 64, 3614, 162, "IFF", "RIO IFF M1")
define3PosTumb("RIO_IFF_M2", 64, 3615, 163, "IFF", "RIO IFF M2")
define3PosTumb("RIO_IFF_M3A", 64, 3616, 164, "IFF", "RIO IFF M3/A")
define3PosTumb("RIO_IFF_MC", 64, 3617, 165, "IFF", "RIO IFF MC")
define3PosTumb("RIO_IFF_RAD", 64, 3618, 166, "IFF", "RIO IFF RAD")
define3PosTumb("RIO_IFF_IDENT", 64, 3619, 167, "IFF", "RIO IFF Ident")
defineToggleSwitch("RIO_IFF_M4", 64, 3620, 181, "IFF", "RIO IFF M4")
defineMultipositionSwitch("RIO_IFF_CODE", 64, 3621, 183, 4, 1.0/3.0, "IFF" ,"RIO IFF Code")
defineMultipositionSwitch("RIO_IFF_MASTER", 64, 3622, 184, 5, 1.0/4.0, "IFF" ,"RIO IFF Master")
definePushButton("RIO_IFF_TEST", 64, 3623, 185, "IFF", "RIO IFF Test")
definePushButton("RIO_IFF_REPLY", 64, 3624, 186, "IFF", "RIO IFF Reply")
defineTumb("RIO_IFF_M3_1", 64, 3625, 2262, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 1s")
defineTumb("RIO_IFF_M3_10", 64, 3626, 2261, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 10s")
defineTumb("RIO_IFF_M3_100", 64, 3627, 198, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 100s")
defineTumb("RIO_IFF_M3_1000", 64, 3628, 199, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M3 Code 1000s")
defineTumb("RIO_IFF_M1_1", 64, 3629, 200, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M1 Code 1s")
defineTumb("RIO_IFF_M1_10", 64, 3630, 201, 0.111, {0.0, 1.0}, nil, false, "IFF", "RIO IFF M1 Code 10s")


-- LIQUID Cooling
define3PosTumb("RIO_LIQUD_COOL", 39, 3681, 95, "Radar Panel", "RIO Liquid Cooling Switch")

-- LANTIRN (Panel Arg:666)
defineMultipositionSwitch("RIO_LANTIRN_PW", 38, 3676, 667, 3, 1.0/2.0, "LANTIRN" ,"RIO LANTIRN Power")
defineToggleSwitch("RIO_LANTIRN_LASER_ARM", 38, 3516, 668, "LANTIRN", "RIO LANTIRN Laser Arm Switch")
definePushButton("RIO_LANTIRN_TCS_SEL", 38, 3498, 670, "LANTIRN", "RIO Video Output Toggle (TCS/LANTIRN)")
definePushButton("RIO_LANTIRN_TCS_SEL", 38, 3691, 669, "LANTIRN", "RIO LANTIRN Operate Mode (Unstow)")
definePushButton("RIO_LANTIRN_IBIT", 38, 3677, 671, "LANTIRN", "RIO LANTIRN IBIT")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_OPER", 673, "LANTIRN","RIO LANTIRN STBY Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_OPERSTBY", 673, "LANTIRN","RIO LANTIRN OPER STBY Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_STBY", 673, "LANTIRN","RIO LANTIRN STBY Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_IMU", 674, "LANTIRN","RIO LANTIRN IMU Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_IMUGPS", 674, "LANTIRN","RIO LANTIRN IMU GPS Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_GPS", 674, "LANTIRN","RIO LANTIRN GPS Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_LGP", 675, "LANTIRN","RIO LANTIRN LGP Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_LGPFLIR", 675, "LANTIRN","RIO LANTIRN LGP FLIR Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_FLIR", 675, "LANTIRN","RIO LANTIRN FLIR Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_MUX", 676, "LANTIRN","RIO LANTIRN MUX Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_MUXEGU", 676, "LANTIRN","RIO LANTIRN MUX EGU Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_EGU", 676, "LANTIRN","RIO LANTIRN EGU Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_LASER", 677, "LANTIRN","RIO LANTIRN SERVO Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_LASERSERVO", 677, "LANTIRN","RIO LANTIRN LASER SERVO Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_SERVO", 677, "LANTIRN","RIO LANTIRN SERVO Light (BOTTOM) (green)")
defineIndicatorLightLANTTop("RIO_LANTIRN_1_FLIR", 678, "LANTIRN","RIO LANTIRN FLIR Light (TOP) (green)")
defineIndicatorLightLANT("RIO_LANTIRN_2_FLIRTCS", 678, "LANTIRN","RIO LANTIRN FLIR TCS Light (BOOTH) (green)")
defineIndicatorLightLANTBottom("RIO_LANTIRN_3_TCS", 678, "LANTIRN","RIO LANTIRN TCS Light (BOTTOM) (green)")
defineIndicatorLightMulti1("RIO_LANTIRN_IBIT", 679, "LANTIRN","RIO LANTIRN IBIT Light (green)")
defineIndicatorLightMulti1("RIO_LANTIRN_LASERARMED", 680, "LANTIRN","RIO LANTIRN LASER ARMED Light (green)")	

-- Warning, Caution and IndicatorLights PLT
defineIndicatorLight("PLT_TACAN_COMAND_PLT", 290, "Warning, Caution and IndicatorLights","PILOT TACAN Command Light PLT (green)")
defineIndicatorLight("PLT_TACAN_COMAND_NFO", 291, "Warning, Caution and IndicatorLights","PILOT TACAN Command Light NFO (green)")
defineIndicatorLight("PLT_JETT_LIGHT", 701, "Warning, Caution and IndicatorLights","PILOT Emergency Stores Jettison Light (red)")
defineIndicatorLight("PLT_FLOOD_LIGHTS", 1800, "Warning, Caution and IndicatorLights","PILOT Flood Lights (red)")
defineIndicatorLight("PLT_PANEL_LIGHTS", 1801, "Warning, Caution and IndicatorLights","PILOT Panel Lights (red) inverted")
defineIndicatorLight("PLT_INSTRUMENT_LIGHTS", 1802, "Warning, Caution and IndicatorLights","PILOT Instrument Lights (red) inverted")
defineIndicatorLight("PLT_FLOOD_LIGHTS_W", 1803, "Warning, Caution and IndicatorLights","PILOT White Flood Lights (white)")
defineIndicatorLight("PLT_AOA_SLOW", 3760, "Warning, Caution and IndicatorLights","PILOT AOA Slow (green)")
defineIndicatorLight("PLT_AOA_OPT", 3761, "Warning, Caution and IndicatorLights","PILOT AOA Optimum (yellow)")
defineIndicatorLight("PLT_AOA_FAST", 3762, "Warning, Caution and IndicatorLights","PILOT AOA Fast (red)")
defineIndicatorLight("PLT_TACAN_GO", 8050, "Warning, Caution and IndicatorLights","PILOT TACAN GO Light (green)")
defineIndicatorLight("PLT_TACAN_NOGO", 8051, "Warning, Caution and IndicatorLights","PILOT TACAN NOGO Light (red)")
defineIndicatorLight("PLT_MASTER_CAUTION", 9200, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Master Caution Light (red)")
defineIndicatorLight("PLT_HOT_TRIGGER", 9201, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Hot Trigger Light (red)")
defineIndicatorLight("PLT_COLLISION_LIGHT", 9202, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Collision Light (green)")
defineIndicatorLight("PLT_SEAM_LOCK", 9203, "Warning, Caution and IndicatorLights","PILOT Weapon Panel SEAM Lock Light (green)")
defineIndicatorLight("PLT_GUN_RATE_HIGH", 9204, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Gunrate High Light (red)")
defineIndicatorLight("PLT_GUN_RATE_LOW", 9205, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Gunrate Low Light (red)")
defineIndicatorLight("PLT_SW_COOL_ON", 9206, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Sidewinder Cooling ON Light (red)")
defineIndicatorLight("PLT_SW_COOL_OFF", 9207, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Sidewinder Cooling OFF Light (red)")
defineIndicatorLight("PLT_MSL_PREP_ON", 9208, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Missle Prepare ON Light (red)")
defineIndicatorLight("PLT_MSL_PREP_OFF", 9209, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Missle Prepare OFF Light (red)")
defineIndicatorLight("PLT_MSL_MODE_NORM", 9210, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Missle Mode Normal Light (red)")
defineIndicatorLight("PLT_MSL_MODE_BORE", 9211, "Warning, Caution and IndicatorLights","PILOT Weapon Panel Missle Mode Boresight Light (red)")
defineIndicatorLight("PLT_HUD_LIGHT_WHEELS", 9350, "Warning, Caution and IndicatorLights","PILOT HUD Light Wheels (red)")
defineIndicatorLight("PLT_HUD_LIGHT_BRAKES", 9351, "Warning, Caution and IndicatorLights","PILOT HUD Light Brakes (red)")
defineIndicatorLight("PLT_HUD_LIGHT_ACLSAP", 9352, "Warning, Caution and IndicatorLights","PILOT HUD Light ACLS/AP (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_NWS", 9353, "Warning, Caution and IndicatorLights","PILOT HUD Light NWS Enga (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_AUTOTHR", 9354, "Warning, Caution and IndicatorLights","PILOT HUD Light Auto Throttle (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_RStall", 9355, "Warning, Caution and IndicatorLights","PILOT HUD Right Stall (red)")
defineIndicatorLight("PLT_HUD_LIGHT_LStall", 9356, "Warning, Caution and IndicatorLights","PILOT HUD Left Stall (red)")
defineIndicatorLight("PLT_HUD_LIGHT_SAM", 9357, "Warning, Caution and IndicatorLights","PILOT HUD SAM (red)")
defineIndicatorLight("PLT_HUD_LIGHT_AAA", 9358, "Warning, Caution and IndicatorLights","PILOT HUD AAA (red)")
defineIndicatorLight("PLT_HUD_LIGHT_AI", 9359, "Warning, Caution and IndicatorLights","PILOT HUD AI (red)")
defineIndicatorLight("PLT_VDI_LIGHT_ADJAC", 9360, "Warning, Caution and IndicatorLights","PILOT VDI ADJ A/C Light (red)") 
defineIndicatorLight("PLT_VDI_LIGHT_LANDCHK", 9361, "Warning, Caution and IndicatorLights","PILOT VDI LANDING CHK Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_ACLRDY", 9362, "Warning, Caution and IndicatorLights","PILOT VDI ACL READY Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_APCLR", 9363, "Warning, Caution and IndicatorLights","PILOT VDI A/P CPLR Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_CMDCON", 9364, "Warning, Caution and IndicatorLights","PILOT VDI CMD CONTROL Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_10SEC", 9365, "Warning, Caution and IndicatorLights","PILOT VDI 10 SECONDS Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_TILT", 9366, "Warning, Caution and IndicatorLights","PILOT VDI TILT Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_VOICE", 9367, "Warning, Caution and IndicatorLights","PILOT VDI VOICE Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_AUTOTH", 9368, "Warning, Caution and IndicatorLights","PILOT VDI AUTO THRO Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_APREF", 9369, "Warning, Caution and IndicatorLights","PILOT VDI A/P REF Light (red)")
defineIndicatorLight("PLT_GEAR_LIGHT", 15001, "Warning, Caution and IndicatorLights","PILOT Landing Gear Light (red)")
defineIndicatorLight("PLT_REFUELPROBE_LIGHT", 15002, "Warning, Caution and IndicatorLights","PILOT Refuel Probe Light (red)")
defineIndicatorLight("PLT_MASTERTEST_GO", 15010, "Warning, Caution and IndicatorLights","PILOT MASTER TEST GO Light (green)")
defineIndicatorLight("PLT_MASTERTEST_NOGO", 15011, "Warning, Caution and IndicatorLights","PILOT MASTER TEST NOGO Light (red)")
defineIndicatorLight("PLT_R_ENG_FIRE", 15014, "Warning, Caution and IndicatorLights","PILOT Right Engine Fire Light (red)")
defineIndicatorLight("PLT_L_ENG_FIRE", 15015, "Warning, Caution and IndicatorLights","PILOT Left Engine Fire Light (red)") 
defineIndicatorLight("PLT_WARN_LGEN", 15016, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Generator (yellow)")
defineIndicatorLight("PLT_WARN_LOILHOT", 15017, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_LFUELPRESS", 15018, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_ENGFIREEXT", 15019, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Engine Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_RGEN", 15020, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Generator (yellow)")
defineIndicatorLight("PLT_WARN_ROILHOT", 15021, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_RFUELPRESS", 15022, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_WINGSWEEP", 15023, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Wing Sweep (green)")
defineIndicatorLight("PLT_WARN_AUXFIREEXT", 15024, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Auxiliary Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_YAWSTABOP", 15025, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Yaw Stabilizer Op (yellow)")
defineIndicatorLight("PLT_WARN_YAWSTABOUT", 15026, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Yaw Stabilizer Out (yellow)")
defineIndicatorLight("PLT_WARN_CANOPY", 15027, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Canopy (yellow)")
defineIndicatorLight("PLT_WARN_CADC", 15028, "Warning, Caution and IndicatorLights","PILOT Warning Lamp CADC (yellow)")
defineIndicatorLight("PLT_WARN_LFUELLOW", 15029, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_WSHIELDHOT", 15030, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Windshield Hot (green)")
defineIndicatorLight("PLT_WARN_EMERGJETT", 15031, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Emergency Jettison (yellow)")
defineIndicatorLight("PLT_WARN_OXYLOW", 15032, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Qxygen Low (yellow)")
defineIndicatorLight("PLT_WARN_BINGO", 15033, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Bingo Fuel (yellow)")
defineIndicatorLight("PLT_WARN_HYDPRESS", 15034, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Hydraulic Pressure (yellow)")
defineIndicatorLight("PLT_WARN_RFUELLOW", 15035, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_MACHTRIM", 15036, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Mach Trim (green)")
defineIndicatorLight("PLT_WARN_PITCHSTAB", 15037, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Pitch Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_BLEEDDUCT", 15038, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Bleed Duct (yellow)")
defineIndicatorLight("PLT_WARN_ROLLSTAB", 15039, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Roll Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_PITCHSTAB2", 15040, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Pitch Stabilizer 2 (yellow)")
defineIndicatorLight("PLT_WARN_AUTOPLT", 15041, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Autopilot (yellow)")
defineIndicatorLight("PLT_WARN_LOVSPVALVE", 15042, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_ROVSPVALVE", 15043, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_RRAMP", 15044, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LAUNCHBAR", 15045, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Launchbar (green)")
defineIndicatorLight("PLT_WARN_FLAP", 15046, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Flap (yellow)")
defineIndicatorLight("PLT_WARN_HZTAILAUTH", 15047, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Horizontal Tail Auth (yellow)")
defineIndicatorLight("PLT_WARN_OILPRESS", 15048, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Oil Pressure (yellow)")
defineIndicatorLight("PLT_WARN_LRAMP", 15049, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LADDER", 15050, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Ladder (yellow)")
defineIndicatorLight("PLT_WARN_RINLET", 15051, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Inlet (yellow)")
defineIndicatorLight("PLT_WARN_INLETICE", 15052, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Inlet Ice (yellow)")
defineIndicatorLight("PLT_WARN_RUDDERAUTH", 15053, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Rudder Auth (yellow)")
defineIndicatorLight("PLT_WARN_LINLET", 15054, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Inlet (yellow)")
defineIndicatorLight("PLT_WARN_ANRS", 15055, "Warning, Caution and IndicatorLights","PILOT Warning Lamp ANRS (green)")
defineIndicatorLight("PLT_WARN_ROLLSTAB2", 15056, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Roll Stabilizer 2 (yellow)")	
defineIndicatorLight("PLT_WARN_SPOILERS", 15057, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Spoilers (yellow)")	
defineIndicatorLight("PLT_WARN_TRANSRECT", 15058, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Trans Rect (green)")
defineIndicatorLight("PLT_WARN_REDUCESPEED", 15059, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Reduce Speed (yellow)")
defineIndicatorLight("PLT_WARN_INTERTRIM", 15060, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Inter Trim (green)")
defineIndicatorLight("PLT_WARN_LENGSEC", 15061, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Left Engine Secondary (yellow)")
defineIndicatorLight("PLT_WARN_RATS", 15062, "Warning, Caution and IndicatorLights","PILOT Warning Lamp RATS (green)")
defineIndicatorLight("PLT_WARN_STARTVALVE", 15063, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Start Valve (yellow)")
defineIndicatorLight("PLT_WARN_RENGSEC", 15064, "Warning, Caution and IndicatorLights","PILOT Warning Lamp Right Engine Secondary (yellow)")
defineIndicatorLight("PLT_VDI_LIGHT_WAVEOFF", 15070, "Warning, Caution and IndicatorLights","PILOT VDI WAVE OFF Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_WINGSWEEP", 15071, "Warning, Caution and IndicatorLights","PILOT VDI WING SWEEP Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_REDUCESPD", 15072, "Warning, Caution and IndicatorLights","PILOT VDI REDUCE SPD Light (red)")
defineIndicatorLight("PLT_VDI_LIGHT_ALTLOW", 15073, "Warning, Caution and IndicatorLights","PILOT VDI ALT LOW Light (red)")
defineIndicatorLight("PLT_HOOK_LIGHT", 15090, "Warning, Caution and IndicatorLights","PILOT Hook Light (red)")
defineIndicatorLight("PLT_RADAR_ALT_LIGHT", 19107, "Warning, Caution and IndicatorLights","PILOT Radar Altimeter Warning Light (red)")
defineIndicatorLight("PLT_RADAR_ALT_TEST_LIGHT", 19108, "Warning, Caution and IndicatorLights","PILOT Radar Altimeter Test Light (red)")
defineIndicatorLight("PLT_SLATS_IND_LIGHT", 8310, "Gauges", "PILOT Slats Indicator as Light")	
defineIndicatorLight("PLT_FLAPS_IND_LIGHT", 8311, "Gauges", "PILOT Flaps Indicator as Light")
defineIndicatorLight("PLT_SPDBRK_IND_LIGHT", 8307, "Gauges", "PILOT Speedbrake Indicator as Light")
defineIndicatorLight("PLT_SPDBRK_FULL_LIGHT", 8308, "Gauges", "PILOT Speedbrake Full Indicator as Light")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_1A_STORE_L", 9221, "Gauges", "PILOT Weapon Store 1A as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_1B_STORE_L", 9222, "Gauges", "PILOT Weapon Store 1B as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_3_STORE_L", 9223, "Gauges", "PILOT Weapon Store 3 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_4_STORE_L", 9224, "Gauges", "PILOT Weapon Store 4 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_5_STORE_L", 9225, "Gauges", "PILOT Weapon Store 5 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_6_STORE_L", 9226, "Gauges", "PILOT Weapon Store 6 as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_8B_STORE_L", 9227, "Gauges", "PILOT Weapon Store 8B as Light (STORE)")
defineIndicatorLightMulti1("PLT_WEAPON_STORE_8A_STORE_L", 9228, "Gauges", "PILOT Weapon Store 8A as Light (STORE)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_1A_READY_L", 9221, "Gauges", "PILOT Weapon Store 1A as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_1B_READY_L", 9222, "Gauges", "PILOT Weapon Store 1B as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_3_READY_L", 9223, "Gauges", "PILOT Weapon Store 3 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_4_READY_L", 9224, "Gauges", "PILOT Weapon Store 4 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_5_READY_L", 9225, "Gauges", "PILOT Weapon Store 5 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_6_READY_L", 9226, "Gauges", "PILOT Weapon Store 6 as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_8B_READY_L", 9227, "Gauges", "PILOT Weapon Store 8B as Light (READY)")
defineIndicatorLightMulti2("PLT_WEAPON_STORE_8A_READY_L", 9228, "Gauges", "PILOT Weapon Store 8A as Light (READY)")

-- Warning, Caution and IndicatorLights RIO
defineIndicatorLight("RIO_SCP_RECORD_STBY_L", 92, "Warning, Caution and IndicatorLights","RIO SCP Record Standby Light (red)")
defineIndicatorLight("RIO_SCP_RECORD_REC_L", 93, "Warning, Caution and IndicatorLights","RIO SCP Record Light (green)")
defineIndicatorLight("RIO_SCP_RECORD_END_L", 94, "Warning, Caution and IndicatorLights","RIO SCP Record End of Tape Light (red)")
defineIndicatorLight("RIO_HCU_PW_RESET_L", 407, "Warning, Caution and IndicatorLights","RIO HCU Power Reset Light (green)")
defineIndicatorLight("RIO_HCS_WCS_PW_L", 408, "Warning, Caution and IndicatorLights","RIO HCU WCS Power Light (green)")
defineIndicatorLight("RIO_HCU_IR_STBY_L", 407, "Warning, Caution and IndicatorLights","RIO HCU IR Standby Light (green)")
defineIndicatorLight("RIO_FLOOD_LIGHTS", 1804, "Warning, Caution and IndicatorLights","RIO Flood Lights (red)")
defineIndicatorLight("RIO_PANEL_LIGHTS", 1805, "Warning, Caution and IndicatorLights","RIO Panel Lights (red) inverted")
defineIndicatorLight("RIO_INSTRUMENT_LIGHTS", 1806, "Warning, Caution and IndicatorLights","RIO Instrument Lights (red) inverted")
defineIndicatorLight("RIO_FLOOD_LIGHTS_W", 1807, "Warning, Caution and IndicatorLights","RIO White Flood Lights (white)")
defineIndicatorLight("RIO_ACLS_TEST_LIGHT", 2016, "Warning, Caution and IndicatorLights","RIO ACLS Test Light (green)")
defineIndicatorLight("RIO_CAD_OXYLOW", 2199, "Warning, Caution and IndicatorLights","RIO CAD OXY LOW Light (green)")
defineIndicatorLight("RIO_MASTERCAUTION_LIGHT", 2200, "Warning, Caution and IndicatorLights","RIO MASTER CAUTION Light (red)")
defineIndicatorLight("RIO_IFF_LIGHT", 2201, "Warning, Caution and IndicatorLights","RIO IFF Light (green)")	
defineIndicatorLight("RIO_RCV_LIGHT", 2202, "Warning, Caution and IndicatorLights","RIO RCV Light (green)")	
defineIndicatorLight("RIO_XMIT_LIGHT", 2203, "Warning, Caution and IndicatorLights","RIO XMIT Light (green)")	
defineIndicatorLight("RIO_SAM_LIGHT", 2204, "Warning, Caution and IndicatorLights","RIO SAM Light (red)")	
defineIndicatorLight("RIO_AAA_LIGHT", 2205, "Warning, Caution and IndicatorLights","RIO AAA Light (red)")	
defineIndicatorLight("RIO_CW_LIGHT", 2206, "Warning, Caution and IndicatorLights","RIO CW Light (red)")	
defineIndicatorLight("RIO_AI_LIGHT", 2208, "Warning, Caution and IndicatorLights","RIO AI Light (red)")		
defineIndicatorLight("RIO_CAD_CDHOT", 2209, "Warning, Caution and IndicatorLights","RIO CAD C D HOT Light (green)")
defineIndicatorLight("RIO_CAD_CABINPRESS", 2210, "Warning, Caution and IndicatorLights","RIO CAD CABIN PRESS Light (green)")
defineIndicatorLight("RIO_CAD_FUELLOW", 2211, "Warning, Caution and IndicatorLights","RIO CAD FUEL LOW Light (green)")
defineIndicatorLight("RIO_CAD_CANOPY", 2212, "Warning, Caution and IndicatorLights","RIO CAD CANOPY Light (green)")
defineIndicatorLight("RIO_CAD_FUZEHV", 2213, "Warning, Caution and IndicatorLights","RIO CAD FUZE HV Light (green)")
defineIndicatorLight("RIO_CAD_RDRENABLED", 2214, "Warning, Caution and IndicatorLights","RIO CAD RDR ENABLED Light (green)")
defineIndicatorLight("RIO_CAD_COOLINGAIR", 2215, "Warning, Caution and IndicatorLights","RIO CAD COOLING AIR Light (yellow)")
defineIndicatorLight("RIO_CAD_MSLCOND", 2216, "Warning, Caution and IndicatorLights","RIO CAD MSL COND Light (yellow)")
defineIndicatorLight("RIO_CAD_AWG9COND", 2217, "Warning, Caution and IndicatorLights","RIO CAD C D HOT Light (yellow)")
defineIndicatorLight("RIO_CAD_NAVCOMP", 2218, "Warning, Caution and IndicatorLights","RIO CAD NAV COMP Light (yellow)")
defineIndicatorLight("RIO_CAD_FILMLOW", 2219, "Warning, Caution and IndicatorLights","RIO CAD FILM LOW Light (yellow)")
defineIndicatorLight("RIO_CAD_IMU", 2220, "Warning, Caution and IndicatorLights","RIO CAD IMU Light (yellow)")
defineIndicatorLight("RIO_CAD_AHRS", 2221, "Warning, Caution and IndicatorLights","RIO CAD AHRS Light (yellow)")
defineIndicatorLight("RIO_DDI_LIGHTS_WAVEOFF", 2222, "Warning, Caution and IndicatorLights","RIO DDI WAVE OFF Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_LANDCHK", 2223, "Warning, Caution and IndicatorLights","RIO DDI LAND CHK Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ACLBEAC", 2224, "Warning, Caution and IndicatorLights","RIO DDI ACL BEAC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ACLRDY", 2225, "Warning, Caution and IndicatorLights","RIO DDI ACL RDY Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_APCPLR", 2226, "Warning, Caution and IndicatorLights","RIO DDI A PC PLR Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_10SEC", 2227, "Warning, Caution and IndicatorLights","RIO DDI 10 SEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ADJAC", 2228, "Warning, Caution and IndicatorLights","RIO DDI ADJ A C Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_VOICE", 2229, "Warning, Caution and IndicatorLights","RIO DDI VOICE Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_TILT", 2230, "Warning, Caution and IndicatorLights","RIO DDI TILT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CMDCHG", 2231, "Warning, Caution and IndicatorLights","RIO DDI CMD CHG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ALTCHG", 2232, "Warning, Caution and IndicatorLights","RIO DDI ALT CHG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_MONALT", 2233, "Warning, Caution and IndicatorLights","RIO DDI MON ALT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_MANUAL", 2234, "Warning, Caution and IndicatorLights","RIO DDI MANUAL Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_SPDCHG", 2235, "Warning, Caution and IndicatorLights","RIO DDI SPD CHG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_MONSPD", 2236, "Warning, Caution and IndicatorLights","RIO DDI MON SPD Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CMDCTRL", 2237, "Warning, Caution and IndicatorLights","RIO DDI CMD CTRL Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CHGCHN", 2238, "Warning, Caution and IndicatorLights","RIO DDI CHG CHN Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_HDGCHN", 2239, "Warning, Caution and IndicatorLights","RIO DDI HDG CHN Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CANCRPY", 2240, "Warning, Caution and IndicatorLights","RIO DDI CANC RPY Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_FWDVEC", 2241, "Warning, Caution and IndicatorLights","RIO DDI FWD VEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_AFTVEC", 2242, "Warning, Caution and IndicatorLights","RIO DDI AFT VEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_COIVEC", 2243, "Warning, Caution and IndicatorLights","RIO DDI COI VEC Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_NOMSG", 2244, "Warning, Caution and IndicatorLights","RIO DDI NO MSG Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_10WAYPT", 2245, "Warning, Caution and IndicatorLights","RIO DDI 10 WAYPT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_HANDOVER", 2246, "Warning, Caution and IndicatorLights","RIO DDI HANDOVER Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ORBIT", 2247, "Warning, Caution and IndicatorLights","RIO DDI ORBIT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_CHALNGE", 2248, "Warning, Caution and IndicatorLights","RIO DDI CHALNGE Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ARM1", 2249, "Warning, Caution and IndicatorLights","RIO DDI ARM 1 Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ARM2", 2250, "Warning, Caution and IndicatorLights","RIO DDI ARM 2 Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ARM3", 2251, "Warning, Caution and IndicatorLights","RIO DDI ARM 3 Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_NOTCMD", 2252, "Warning, Caution and IndicatorLights","RIO DDI NOT CMD Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_FRELAN", 2253, "Warning, Caution and IndicatorLights","RIO DDI FRE LAN Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_DISGAGE", 2254, "Warning, Caution and IndicatorLights","RIO DDI DISGAGE Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_ABORT", 2255, "Warning, Caution and IndicatorLights","RIO DDI ABORT Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_BEACON", 2256, "Warning, Caution and IndicatorLights","RIO DDI BEAC ON Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_SEACDUB", 2257, "Warning, Caution and IndicatorLights","RIO DDI SEAC DUB Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_DROP", 2258, "Warning, Caution and IndicatorLights","RIO DDI DROP Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_BEACOFF", 2259, "Warning, Caution and IndicatorLights","RIO DDI BEAC OFF Light (green)")
defineIndicatorLight("RIO_DDI_LIGHTS_RETBASE", 2260, "Warning, Caution and IndicatorLights","RIO DDI RET BASE Light (green)")	
defineIndicatorLight("RIO_TID_SCREEN_LIGHT", 3450, "Warning, Caution and IndicatorLights","RIO TID Screen Light (light green)")
defineIndicatorLight("RIO_IFF_TEST_LIGHT", 8052, "Warning, Caution and IndicatorLights","RIO IFF Test Light (green)")
defineIndicatorLight("RIO_IFF_REPLY_LIGHT", 8053, "Warning, Caution and IndicatorLights","RIO IFF Reply Light (green)")
defineIndicatorLight("RIO_TACAN_GO", 8893, "Warning, Caution and IndicatorLights","RIO TACAN GO Light (green)")
defineIndicatorLight("RIO_TACAN_NOGO", 8892, "Warning, Caution and IndicatorLights","RIO TACAN NOGO Light (red)")
defineIndicatorLight("RIO_DDD_LIGHTS_ANTTRK", 11503, "Warning, Caution and IndicatorLights","RIO DDD ANT TRK Light (green)")
defineIndicatorLight("RIO_DDD_LIGHTS_RDROT", 11504, "Warning, Caution and IndicatorLights","RIO DDD RDROT Light (green)")
defineIndicatorLight("RIO_DDD_LIGHTS_JAT", 11505, "Warning, Caution and IndicatorLights","RIO DDD JAT Light (green)")
defineIndicatorLight("RIO_DDD_LIGHTS_IROT", 11506, "Warning, Caution and IndicatorLights","RIO DDD IROT Light (green)")
defineIndicatorLightMulti1("RIO_TID_STBY_LIGHT_1", 490, "Warning, Caution and IndicatorLights","RIO TDI Standby Light (green)")
defineIndicatorLightMulti2("RIO_TID_STBY_LIGHT_2", 490, "Warning, Caution and IndicatorLights","RIO TDI Standby Light (blue)")
defineIndicatorLightMulti1("RIO_TID_READY_LIGHT_1", 491, "Warning, Caution and IndicatorLights","RIO TDI Ready Light (green)")
defineIndicatorLightMulti2("RIO_TID_READY_LIGHT_2", 491, "Warning, Caution and IndicatorLights","RIO TDI Ready Light (blue)")
defineIndicatorLightMulti1("RIO_LAUNCH_LIGHT_1", 492, "Warning, Caution and IndicatorLights","RIO Launch Light (red)")
defineIndicatorLightMulti2("RIO_LAUNCH_LIGHT_2", 492, "Warning, Caution and IndicatorLights","RIO Launch Light (green)")
defineIndicatorLightMulti1("RIO_DECM_LIGHT", 493, "Warning, Caution and IndicatorLights","RIO DECM Standby Light (yellow)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_CLEAR_1", 5550, "Warning, Caution and IndicatorLights","RIO CAP CLEAR Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_CLEAR_2", 5550, "Warning, Caution and IndicatorLights","RIO CAP CLEAR Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_SW_1", 5551, "Warning, Caution and IndicatorLights","RIO CAP SW Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_SW_2", 5551, "Warning, Caution and IndicatorLights","RIO CAP SW Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_NE_1", 5552, "Warning, Caution and IndicatorLights","RIO CAP NE Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_NE_2", 5552, "Warning, Caution and IndicatorLights","RIO CAP NE Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_ENTER_1", 5553, "Warning, Caution and IndicatorLights","RIO CAP ENTER Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_ENTER_2", 5553, "Warning, Caution and IndicatorLights","RIO CAP ENTER Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_1_1", 5554, "Warning, Caution and IndicatorLights","RIO CAP 1 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_1_2", 5554, "Warning, Caution and IndicatorLights","RIO CAP 1 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_2_1", 5555, "Warning, Caution and IndicatorLights","RIO CAP 2 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_2_2", 5555, "Warning, Caution and IndicatorLights","RIO CAP 2 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_3_1", 5556, "Warning, Caution and IndicatorLights","RIO CAP 3 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_3_2", 5556, "Warning, Caution and IndicatorLights","RIO CAP 3 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_4_1", 5557, "Warning, Caution and IndicatorLights","RIO CAP 4 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_4_2", 5557, "Warning, Caution and IndicatorLights","RIO CAP 4 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_5_1", 5558, "Warning, Caution and IndicatorLights","RIO CAP 5 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_5_2", 5558, "Warning, Caution and IndicatorLights","RIO CAP 5 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_6_1", 5559, "Warning, Caution and IndicatorLights","RIO CAP 6 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_6_2", 5559, "Warning, Caution and IndicatorLights","RIO CAP 6 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_7_1", 5560, "Warning, Caution and IndicatorLights","RIO CAP 7 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_7_2", 5560, "Warning, Caution and IndicatorLights","RIO CAP 7 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_8_1", 5561, "Warning, Caution and IndicatorLights","RIO CAP 8 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_8_2", 5561, "Warning, Caution and IndicatorLights","RIO CAP 8 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_9_1", 5562, "Warning, Caution and IndicatorLights","RIO CAP 9 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_9_2", 5562, "Warning, Caution and IndicatorLights","RIO CAP 9 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_0_1", 5563, "Warning, Caution and IndicatorLights","RIO CAP 0 Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_0_2", 5563, "Warning, Caution and IndicatorLights","RIO CAP 0 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN6", 5564, "Warning, Caution and IndicatorLights","RIO CAP BTN 6 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN7", 5565, "Warning, Caution and IndicatorLights","RIO CAP BTN 7 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN8", 5566, "Warning, Caution and IndicatorLights","RIO CAP BTN 8 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN9", 5567, "Warning, Caution and IndicatorLights","RIO CAP BTN 9 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN1", 5568, "Warning, Caution and IndicatorLights","RIO CAP BTN 1 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN2", 5569, "Warning, Caution and IndicatorLights","RIO CAP BTN 2 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN3", 5570, "Warning, Caution and IndicatorLights","RIO CAP BTN 3 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN4", 5571, "Warning, Caution and IndicatorLights","RIO CAP BTN 4 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN5", 5572, "Warning, Caution and IndicatorLights","RIO CAP BTN 5 Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_TNG_NBR_1", 5573, "Warning, Caution and IndicatorLights","RIO CAP TNG NBR Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_TNG_NBR_2", 5573, "Warning, Caution and IndicatorLights","RIO CAP TNG NBR Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_PGM_RESTART_1", 5574, "Warning, Caution and IndicatorLights","RIO CAP PGM Restart Light (red)")
defineIndicatorLightMulti2("RIO_CAP_LIGHT_PGM_RESTART_2", 5574, "Warning, Caution and IndicatorLights","RIO CAP PGM Restart Light (green)")
defineIndicatorLightMulti1("RIO_CAP_LIGHT_BTN10", 5590, "Warning, Caution and IndicatorLights","RIO CAP BTN 10 Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_RDR_1", 6111, "Warning, Caution and IndicatorLights","RIO DDD RDR Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_RDR_2", 6111, "Warning, Caution and IndicatorLights","RIO DDD RDR Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_IR_1", 6112, "Warning, Caution and IndicatorLights","RIO DDD IR Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_IR_2", 6112, "Warning, Caution and IndicatorLights","RIO DDD IR Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_IFF_1", 6113, "Warning, Caution and IndicatorLights","RIO DDD IFF Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_IFF_2", 6113, "Warning, Caution and IndicatorLights","RIO DDD IFF Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PDSTT_1", 6114, "Warning, Caution and IndicatorLights","RIO DDD PDSTT Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PDSTT_2", 6114, "Warning, Caution and IndicatorLights","RIO DDD PDSTT Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PSTT_1", 6115, "Warning, Caution and IndicatorLights","RIO DDD PULSE STT Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PSTT_2", 6115, "Warning, Caution and IndicatorLights","RIO DDD PULSE STT Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PDSEARCH_1", 6116, "Warning, Caution and IndicatorLights","RIO DDD PDSEARCH Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PDSEARCH_2", 6116, "Warning, Caution and IndicatorLights","RIO DDD PDSEARCH Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_RWS_1", 6117, "Warning, Caution and IndicatorLights","RIO DDD RWS Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_RWS_2", 6117, "Warning, Caution and IndicatorLights","RIO DDD RWS Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_TWS_AUTO_1", 6118, "Warning, Caution and IndicatorLights","RIO DDD TWS AUTO Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_TWS_AUTO_2", 6118, "Warning, Caution and IndicatorLights","RIO DDD TWS AUTO Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_TWS_MAN_1", 6119, "Warning, Caution and IndicatorLights","RIO DDD TWS MAN Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_TWS_MAN_2", 6119, "Warning, Caution and IndicatorLights","RIO DDD TWS MAN Light (green)")
defineIndicatorLightMulti1("RIO_DDD_LIGHT_PSEARCH_1", 6120, "Warning, Caution and IndicatorLights","RIO DDD PSEARCH Light (red)")
defineIndicatorLightMulti2("RIO_DDD_LIGHT_PSEARCH_2", 6120, "Warning, Caution and IndicatorLights","RIO DDD PSEARCH Light (green)")
defineIndicatorLightMulti1("RIO_CCM_LIGHT_SPL_1", 6121, "Warning, Caution and IndicatorLights","RIO CCM SPL Light (red)")
defineIndicatorLightMulti2("RIO_CCM_LIGHT_SPL_2", 6121, "Warning, Caution and IndicatorLights","RIO CCM SPL Light (green)")
defineIndicatorLightMulti1("RIO_CCM_LIGHT_ALTOFF_1", 6122, "Warning, Caution and IndicatorLights","RIO CCM ALT OFF Light (red)")
defineIndicatorLightMulti2("RIO_CCM_LIGHT_ALTOFF_2", 6122, "Warning, Caution and IndicatorLights","RIO CCM ALT OFF Light (green)")
defineIndicatorLightMulti1("RIO_CCM_LIGHT_VGS_1", 6123, "Warning, Caution and IndicatorLights","RIO CCM VGS Light (red)")
defineIndicatorLightMulti2("RIO_CCM_LIGHT_VGS_2", 6123, "Warning, Caution and IndicatorLights","RIO CCM VGS Light (green)")
defineIndicatorLightMulti1("RIO_TID_TRACKHOLD_LIGHT", 6125, "Warning, Caution and IndicatorLights","RIO TID TRACKHOLD Light (red)")
defineIndicatorLightMulti1("RIO_TID_CLSN_LIGHT_1", 6126, "Warning, Caution and IndicatorLights","RIO TID CLSN Light (red)")
defineIndicatorLightMulti2("RIO_TID_CLSN_LIGHT_2", 6126, "Warning, Caution and IndicatorLights","RIO TID CLSN Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_RIDDSBL_1", 6127, "Warning, Caution and IndicatorLights","RIO TID RID DSBL Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_RIDDSBL_2", 6127, "Warning, Caution and IndicatorLights","RIO TID RID DSBL Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_ALTNUM_1", 6128, "Warning, Caution and IndicatorLights","RIO TID ALT NUM Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_ALTNUM_2", 6128, "Warning, Caution and IndicatorLights","RIO TID ALT NUM Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_SYMELEM_1", 6129, "Warning, Caution and IndicatorLights","RIO TID SYM ELEM Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_SYMELEM_2", 6129, "Warning, Caution and IndicatorLights","RIO TID SYM ELEM Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_DATALINK_1", 6130, "Warning, Caution and IndicatorLights","RIO TID DATALINK Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_DATALINK_2", 6130, "Warning, Caution and IndicatorLights","RIO TID DATALINK Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_JAM_1", 6131, "Warning, Caution and IndicatorLights","RIO TID JAM STROBE Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_JAM_2", 6131, "Warning, Caution and IndicatorLights","RIO TID JAM STROBE Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_NONATTK_1", 6132, "Warning, Caution and IndicatorLights","RIO TID NON ATTK Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_NONATTK_2", 6132, "Warning, Caution and IndicatorLights","RIO TID NON ATTK Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_LZ_1", 6133, "Warning, Caution and IndicatorLights","RIO TID LAUNCH ZONE Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_LZ_2", 6133, "Warning, Caution and IndicatorLights","RIO TID LAUNCH ZONE Light (green)")
defineIndicatorLightMulti1("RIO_TID_LIGHT_VELVEC_1", 6134, "Warning, Caution and IndicatorLights","RIO TID VEL VECTOR Light (red)")
defineIndicatorLightMulti2("RIO_TID_LIGHT_VELVEC_2", 6134, "Warning, Caution and IndicatorLights","RIO TID VEL VECTOR Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_TVIR_1", 6135, "Warning, Caution and IndicatorLights","RIO HCU IR/TV Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_TVIR_2", 6135, "Warning, Caution and IndicatorLights","RIO HCU IR/TV Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_RDR_1", 6136, "Warning, Caution and IndicatorLights","RIO HCU RDR Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_RDR_2", 6136, "Warning, Caution and IndicatorLights","RIO HCU RDR Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_DDD_1", 6137, "Warning, Caution and IndicatorLights","RIO HCU DDD CURSOR Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_DDD_2", 6137, "Warning, Caution and IndicatorLights","RIO HCU DDD CURSOR Light (green)")
defineIndicatorLightMulti1("RIO_HCU_LIGHT_TID_1", 6138, "Warning, Caution and IndicatorLights","RIO HCU TID CURSOR  Light (red)")
defineIndicatorLightMulti2("RIO_HCU_LIGHT_TID_2", 6138, "Warning, Caution and IndicatorLights","RIO HCU TID CURSOR  Light (green)")

-- Gauges PLT
defineFloat("PLT_RADARALTI_NEEDLE", 103, {0, 1}, "Gauges", "PILOT Radar Altimeter Needle")
defineFloat("PLT_RADARALTI_FLAG", 2124, {0, 1}, "Gauges", "PILOT Radar Altimeter OFF Flag")
defineFloat("PLT_RADARALTI_POINTER", 4154, {0, 1}, "Gauges", "PILOT Radar Altimeter Pointer")
defineFloat("PLT_AIRSPEED_NEEDLE", 2129, {0, 1}, "Gauges", "PILOT Airspeed Outer Needle")
defineFloat("PLT_AIRSPEED_INNER", 2128, {0, 1}, "Gauges", "PILOT Airspeed Inner Needle")
defineFloat("PLT_AIRSPEED_POINTER1", 2125, {0, 1}, "Gauges", "PILOT Airspeed Pointer 1")
defineFloat("PLT_AIRSPEED_POINTER2", 2126, {0, 1}, "Gauges", "PILOT Airspeed Pointer 2")
defineFloat("PLT_ENGINE_RPM_L", 1057, {0, 1}, "Gauges", "PILOT Engine RPM Left")
defineFloat("PLT_ENGINE_RPM_R", 1058, {0, 1}, "Gauges", "PILOT Engine RPM Right")
defineFloat("PLT_ENGINE_TIT_L", 1059, {0, 1}, "Gauges", "PILOT Engine TIT Left")
defineFloat("PLT_ENGINE_TIT_R", 1060, {0, 1}, "Gauges", "PILOT Engine TIT Right")
defineFloat("PLT_ENGINE_FF_L", 1061, {0, 1}, "Gauges", "PILOT Engine FF Left")
defineFloat("PLT_ENGINE_FF_R", 1062, {0, 1}, "Gauges", "PILOT Engine FF Right")
defineFloat("PLT_ENGINE_OIL_PRESS_L", 1066, {0, 1}, "Gauges", "PILOT Engine Oil Pressure Left")
defineFloat("PLT_ENGINE_OIL_PRESS_R", 1065, {0, 1}, "Gauges", "PILOT Engine Oil Pressure Right")
defineFloat("PLT_ENGINE_NOZZLE_L", 1068, {0, 1}, "Gauges", "PILOT Engine Nozzle Left")
defineFloat("PLT_ENGINE_NOZZLE_R", 1067, {0, 1}, "Gauges", "PILOT Engine Nozzle Right")       
defineFloat("PLT_CLOCK_H", 1096, {0, 1}, "Gauges", "PILOT Clock Hours")
defineFloat("PLT_CLOCK_M", 1097, {0, 1}, "Gauges", "PILOT Clock Minutes") 
defineFloat("PLT_CLOCK_TS", 1098, {0, 1}, "Gauges", "PILOT Clock Timer Seconds") 
defineFloat("PLT_CLOCK_T", 1099, {0, 1}, "Gauges", "PILOT Clock Timer") 
defineFloat("PLT_CLOCK_TM", 2000, {0, 1}, "Gauges", "PILOT Clock Timer Minutes")   
defineFloat("PLT_SWEEP_MIN", 2047, {0, 1}, "Gauges", "PILOT Wing Sweep Minimum Index") 
defineFloat("PLT_SWEEP_COM", 2001, {0, 1}, "Gauges", "PILOT Wing Sweep Commanded") 
defineFloat("PLT_SWEEP_POS", 2002, {0, 1}, "Gauges", "PILOT Wing Sweep Position")
defineFloat("PLT_SWEEP_FLAG_OFF", 15091, {0, 1}, "Gauges", "PILOT Wing Sweep OFF Flag")
defineFloat("PLT_SWEEP_FLAG_AUTO", 15092, {0, 1}, "Gauges", "PILOT Wing Sweep AUTO Flag") 
defineFloat("PLT_SWEEP_FLAG_MAN", 15093, {0, 1}, "Gauges", "PILOT Wing Sweep MAN Flag") 
defineFloat("PLT_SWEEP_FLAG_EMER", 15094, {0, 1}, "Gauges", "PILOT Wing Sweep EMER Flag") 
defineFloat("PLT_SWEEP_FLAG_OVER", 15095, {0, 1}, "Gauges", "PILOT Wing Sweep OVER Flag") 
defineFloat("PLT_AOA_UNITS", 2003, {0, 1}, "Gauges", "PILOT AOA Unit Slider")
defineFloat("PLT_AOA_UNITS_OFF", 16004, {0, 1}, "Gauges", "PILOT AOA Unit OFF Flag")
defineFloat("PLT_ALTIMETER_NEEDLE", 104, {0, 1}, "Gauges", "PILOT Altimeter Needle Barometric")
defineFloat("PLT_VSI_NEEDLE", 106, {-1, 1}, "Gauges", "PILOT Vertical Velocity Indicator Needle")
defineFloat("PLT_COMP_SYNC_NEEDLE", 412, {-1, 1}, "Gauges", "PILOT Compass Sync Indicator Needle")	--(COMP Panel)
defineFloat("PLT_COMP_DIAL", 1026, {0, 1}, "Gauges", "PILOT Compass Dial")	--(COMP Panel)
defineFloat("PLT_ACCEL_METER_Needle", 110, {-1, 1}, "Gauges", "PILOT Accelerometer Needle")
defineFloat("PLT_ALT_METER_10000", 112, {0, 1}, "Gauges", "PILOT Altimeter 10000")
defineFloat("PLT_ALT_METER_1000", 262, {0, 1}, "Gauges", "PILOT Altimeter 1000")
defineFloat("PLT_ALT_METER_100", 300, {0, 1}, "Gauges", "PILOT Altimeter 100")
defineFloat("PLT_ALT_METER_SMALL_1", 301, {0, 1}, "Gauges", "PILOT Altimeter HG 1000")
defineFloat("PLT_ALT_METER_SMALL_2", 302, {0, 1}, "Gauges", "PILOT Altimeter 100")
defineFloat("PLT_ALT_METER_SMALL_3", 303, {0, 1}, "Gauges", "PILOT Altimeter 10")
defineFloat("PLT_ALT_METER_SMALL_4", 304, {0, 1}, "Gauges", "PILOT Altimeter 1")
defineFloat("PLT_ALT_METER_STBY", 305, {0, 1}, "Gauges", "PILOT Altimeter Standby Flag")
defineFloat("PLT_HYD_PRESS_COMB", 1064, {0, 1}, "Gauges", "PILOT Combined Hydraulic System Pressure Gauge")
defineFloat("PLT_HYD_PRESS_FLY", 1063, {0, 1}, "Gauges", "PILOT Flight Hydraulic System Pressure Gauge")
defineFloat("PLT_HYD_SPOIL_FLAG", 1023, {0, 1}, "Gauges", "PILOT Hydraulic Spoiler Flag")
defineFloat("PLT_HYD_EMERG_HI_FLAG", 1024, {0, 1}, "Gauges", "PILOT Hydraulic Emergency HI Flag")
defineFloat("PLT_HYD_EMERG_LOW_FLAG", 1025, {0, 1}, "Gauges", "PILOT Hydraulic Emergency LOW Flag")
defineFloat("PLT_GUN_ELEVATION_PLUSMINUS", 2273, {0, 1}, "Gauges", "PILOT Gun Elevation Plus / Minus")
defineFloat("PLT_ACCEL_METER_Needle2", 15076, {-1, 1}, "Gauges", "PILOT Accelerometer Needle 2")
defineFloat("PLT_ACCEL_METER_Needle3", 15077, {-1, 1}, "Gauges", "PILOT Accelerometer Needle 3")
defineFloat("PLT_HSD_BIT_INDICATOR", 15079, {0, 1}, "Gauges", "PILOT HSD BIT Indicator Flag")
defineFloat("PLT_FUEL_AFT_L", 1054, {0, 1}, "Gauges", "PILOT Fuel AFT & L")
defineFloat("PLT_FUEL_FWD_R", 1055, {0, 1}, "Gauges", "PILOT Fuel FWD & R")
defineFloat("PLT_FUEL_LEFT_1K", 6000, {0, 1}, "Gauges", "PILOT Fuel Left 1000")
defineFloat("PLT_FUEL_LEFT_100", 6001, {0, 1}, "Gauges", "PILOT Fuel Left 100")
defineFloat("PLT_FUEL_LEFT_10", 6002, {0, 1}, "Gauges", "PILOT Fuel Left 10")
defineFloat("PLT_FUEL_LEFT_1", 6003, {0, 1}, "Gauges", "PILOT Fuel Left 1")
local function getPLTFuelLeft()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(6000)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(6001)*10)
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(6002)*10)
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(6003)*10)
    return tonumber(digit1 .. digit2 .. digit3 .. digit4)
end
defineIntegerFromGetter("PLT_FUEL_LEFT_DISP", getPLTFuelLeft, 9999, "Gauges", "PILOT Fuel Left Display")

defineFloat("PLT_FUEL_RIGHT_1K", 6004, {0, 1}, "Gauges", "PILOT Fuel Right 1000")
defineFloat("PLT_FUEL_RIGHT_100", 6005, {0, 1}, "Gauges", "PILOT Fuel Right 100")
defineFloat("PLT_FUEL_RIGHT_10", 6006, {0, 1}, "Gauges", "PILOT Fuel Right 10")
defineFloat("PLT_FUEL_RIGHT_1", 6007, {0, 1}, "Gauges", "PILOT Fuel Right 1")
local function getPLTFuelRight()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(6004)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(6005)*10)
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(6006)*10)
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(6007)*10)
    return tonumber(digit1 .. digit2 .. digit3 .. digit4)
end
defineIntegerFromGetter("PLT_FUEL_RIGHT_DISP", getPLTFuelRight, 9999, "Gauges", "PILOT Fuel Right Display")

defineFloat("PLT_FUEL_TOTAL_10K", 6010, {0, 1}, "Gauges", "PILOT Fuel Total 10000")
defineFloat("PLT_FUEL_TOTAL_1K", 6011, {0, 1}, "Gauges", "PILOT Fuel Total 1000")
defineFloat("PLT_FUEL_TOTAL_100", 6012, {0, 1}, "Gauges", "PILOT Fuel Total 100")
defineFloat("PLT_FUEL_TOTAL_10", 6013, {0, 1}, "Gauges", "PILOT Fuel Total 10")
defineFloat("PLT_FUEL_TOTAL_1", 6014, {0, 1}, "Gauges", "PILOT Fuel Total 1")
local function getPLTFuelTotal()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(6010)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(6011)*10)
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(6012)*10)
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(6013)*10)
	local digit5 = string.format("%.0f", GetDevice(0):get_argument_value(6014)*10)
    return tonumber(digit1 .. digit2 .. digit3 .. digit4 .. digit5)
end
defineIntegerFromGetter("PLT_FUEL_TOTAL_DISP", getPLTFuelTotal, 59999, "Gauges", "PILOT Fuel Total Display")

defineFloat("PLT_FUEL_BINGO_10K", 6020, {0, 1}, "Gauges", "PILOT Fuel Bingo 10000")
defineFloat("PLT_FUEL_BINGO_1K", 6021, {0, 1}, "Gauges", "PILOT Fuel Bingo 1000")
defineFloat("PLT_FUEL_BINGO_100", 6022, {0, 1}, "Gauges", "PILOT Fuel Bingo 100")
defineFloat("PLT_FUEL_BINGO_10", 6023, {0, 1}, "Gauges", "PILOT Fuel Bingo 10")
defineFloat("PLT_FUEL_BINGO_1", 6024, {0, 1}, "Gauges", "PILOT Fuel Bingo 1")
defineFloat("PLT_AHRS_LAT_DIAL", 6500, {0, 1}, "Gauges", "PILOT Compass LAT Correction Dial")  --(COMP Panel)
defineFloat("PLT_ACM_TURN_IND", 6501, {-1, 1}, "Gauges", "PILOT ACM Turn Indicator")
defineFloat("PLT_ACM_SLIP_BALL", 6500, {-1, 1}, "Gauges", "PILOT ACM Slip Ball")
defineFloat("PLT_COMPBALL_HORIZONTAL", 6502, {0, 1}, "Gauges", "PILOT Compassball Horizontal")
defineFloat("PLT_COMPBALL_VERTICAL", 6503, {-1, 1}, "Gauges", "PILOT Compassball Vertical")
defineFloat("PLT_GEAR_NOSE_OFF", 8300, {0, 1}, "Gauges", "PILOT Nose Gear OFF Flag")
defineFloat("PLT_GEAR_NOSE_IND", 8301, {0, 1}, "Gauges", "PILOT Nose Gear Indicator")
defineFloat("PLT_GEAR_L_OFF", 8303, {0, 1}, "Gauges", "PILOT Left Gear OFF Flag")
defineFloat("PLT_GEAR_L_IND", 8302, {0, 1}, "Gauges", "PILOT Left Gear Indicator")
defineFloat("PLT_GEAR_R_OFF", 8304, {0, 1}, "Gauges", "PILOT Right Gear OFF Flag")
defineFloat("PLT_GEAR_R_IND", 8305, {0, 1}, "Gauges", "PILOT Right Gear Indicator")
defineFloat("PLT_SPDBRK_OFF", 8306, {0, 1}, "Gauges", "PILOT Speedbrake OFF Flag")
defineFloat("PLT_SPDBRK_IND", 8307, {0, 1}, "Gauges", "PILOT Speedbrake Indicator")
defineFloat("PLT_SPDBRK_FULL", 8308, {0, 1}, "Gauges", "PILOT Speedbrake Full Indicator")
defineFloat("PLT_SLATS_OFF", 8309, {0, 1}, "Gauges", "PILOT Slats OFF Flag")
defineFloat("PLT_SLATS_IND", 8310, {0, 1}, "Gauges", "PILOT Slats Indicator")	
defineFloat("PLT_FLAPS_IND", 8311, {0, 1}, "Gauges", "PILOT Flaps Indicator")
defineFloat("PLT_SPOILER_DN_OL", 8315, {0, 1}, "Gauges", "PILOT Spoiler DN Outer Left")
defineFloat("PLT_SPOILER_DN_IL", 8316, {0, 1}, "Gauges", "PILOT Spoiler DN Inner Left")
defineFloat("PLT_SPOILER_DN_OR", 8318, {0, 1}, "Gauges", "PILOT Spoiler DN Outer Right")
defineFloat("PLT_SPOILER_DN_IR", 8317, {0, 1}, "Gauges", "PILOT Spoiler DN Outer Right")
defineFloat("PLT_SPOILER_IND_OL", 8319, {0, 1}, "Gauges", "PILOT Spoiler Indicator Outer Left")
defineFloat("PLT_SPOILER_IND_IL", 8320, {0, 1}, "Gauges", "PILOT Spoiler Indicator Inner Left")
defineFloat("PLT_SPOILER_IND_OR", 8321, {0, 1}, "Gauges", "PILOT Spoiler Indicator Outer Right")
defineFloat("PLT_SPOILER_IND_IR", 8322, {0, 1}, "Gauges", "PILOT Spoiler Indicator Outer Right")
defineFloat("PLT_STABI_IND_L", 1090, {0, 1}, "Gauges", "PILOT Stabilisator Indicator Left")
defineFloat("PLT_STABI_IND_R", 1091, {0, 1}, "Gauges", "PILOT Stabilisator Indicator Right")
defineFloat("PLT_RUDDER_IND_L", 1092, {0, 1}, "Gauges", "PILOT Rudder Indicator Left")
defineFloat("PLT_RUDDER_IND_R", 1093, {0, 1}, "Gauges", "PILOT Rudder Indicator Right")
defineFloat("PLT_COMPBALL_ROLL", 15097, {-1, 1}, "Gauges", "PILOT Compassball Roll")
defineFloat("PLT_BRAKE_PRESS_L", 9260, {0, 1}, "Gauges", "PILOT Brake Pressure Left")
defineFloat("PLT_BRAKE_PRESS_R", 9260, {0, 1}, "Gauges", "PILOT Brake Pressure Right")
defineFloat("PLT_STDBYAI_OFF_FLAG", 19100, {0, 1}, "Gauges", "PILOT Standby ADI Off Flag")
defineFloat("PLT_COMP_RING", 19109, {0, 1}, "Gauges", "PILOT Compass Ring")
defineFloat("PLT_COMP_FLAG", 19105, {0, 1}, "Gauges", "PILOT Compass OFF Flag")
defineFloat("PLT_COMP_NEEDLE_TACAN", 699, {0, 1}, "Gauges", "PILOT Compass TACAN Needle")
defineFloat("PLT_COMP_NEEDLE_ADF", 700, {0, 1}, "Gauges", "PILOT Compass ADF Needle")
defineFloat("PLT_COMP_ROLLER1", 702, {0, 1}, "Gauges", "PILOT Compass Roller 1")
defineFloat("PLT_COMP_ROLLER2", 703, {0, 1}, "Gauges", "PILOT Compass Roller 2")
defineFloat("PLT_COMP_ROLLER3", 704, {0, 1}, "Gauges", "PILOT Compass Roller 3")
defineFloat("PLT_CABIN_PRESS", 935, {0, 1}, "Gauges", "PILOT Cabin Pressure Needle")
defineFloat("PLT_LIQU_OXY_FLAG", 2999, {0, 1}, "Gauges", "PILOT Liquid Oxygen OFF Flag")
defineFloat("PLT_STDBYAI_PITCH", 3001, {-1, 1}, "Gauges", "PILOT Standby ADI Pitch")
defineFloat("PLT_STDBYAI_ROLL", 3002, {-1, 1}, "Gauges", "PILOT Standby ADI Roll")
defineFloat("PLT_AMMO_100", 4060, {0, 1}, "Gauges", "PILOT Ammo 100")
defineFloat("PLT_AMMO_10", 4061, {0, 1}, "Gauges", "PILOT Ammo 10")
defineFloat("PLT_AMMO_1", 4062, {0, 1}, "Gauges", "PILOT Ammo 1")
local function getAmmo()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(4060)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(4061)*10)
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(4062)*10)
    return tonumber(digit1 .. digit2 .. digit3)
end
defineIntegerFromGetter("PLT_AMMO_DISP", getAmmo, 999, "Gauges", "PILOT Ammo Display")

defineFloat("PLT_GUN_LEAD_100", 2270, {0, 1}, "Gauges", "PILOT Gun Lead 100")
defineFloat("PLT_GUN_LEAD_10", 2271, {0, 1}, "Gauges", "PILOT Gun Lead 10")
defineFloat("PLT_GUN_LEAD_1", 2272, {0, 1}, "Gauges", "PILOT Gun Lead 1")
local function getGunLead()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(2270)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(2271)*10)
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(2272)*10)
    return tonumber(digit1 .. digit2 .. digit3)
end
defineIntegerFromGetter("PLT_GUN_LEAD_DISP", getGunLead, 999, "Gauges", "PILOT Gun Lead Display")
defineFloat("PLT_WEAPON_STORE_1A", 9221, {0, 1}, "Gauges", "PILOT Weapon Store 1A")
defineFloat("PLT_WEAPON_STORE_1B", 9222, {0, 1}, "Gauges", "PILOT Weapon Store 1B")
defineFloat("PLT_WEAPON_STORE_3", 9223, {0, 1}, "Gauges", "PILOT Weapon Store 3")
defineFloat("PLT_WEAPON_STORE_4", 9224, {0, 1}, "Gauges", "PILOT Weapon Store 4")
defineFloat("PLT_WEAPON_STORE_5", 9225, {0, 1}, "Gauges", "PILOT Weapon Store 5")
defineFloat("PLT_WEAPON_STORE_6", 9226, {0, 1}, "Gauges", "PILOT Weapon Store 6")
defineFloat("PLT_WEAPON_STORE_8B", 9227, {0, 1}, "Gauges", "PILOT Weapon Store 8B")
defineFloat("PLT_WEAPON_STORE_8A", 9228, {0, 1}, "Gauges", "PILOT Weapon Store 8A")

-- Gauges RIO
defineFloat("RIO_AIRSPEED_NEEDLE", 250, {0, 1}, "Gauges", "RIO Airspeed Outer Needle")
defineFloat("RIO_AIRSPEED_INNER", 251, {0, 1}, "Gauges", "RIO Airspeed Inner Needle")
defineFloat("RIO_AIRSPEED_POINTER1", 252, {0, 1}, "Gauges", "RIO Airspeed Pointer 1")
defineFloat("RIO_AIRSPEED_POINTER2", 253, {0, 1}, "Gauges", "RIO Airspeed Pointer 2")
defineFloat("RIO_CMDS_CHAFF_COUNT_10", 392, {0, 1}, "Gauges", "RIO CMDS Chaff Counter 10")
defineFloat("RIO_CMDS_CHAFF_COUNT_1", 393, {0, 1}, "Gauges", "RIO CMDS Chaff Counter 1")		
local function getChaffCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(392)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(393)*10)
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("RIO_CMDS_CHAFFCNT_DISPLAY", getChaffCount, 99, "CMDS", "RIO CMDS Chaff Counter Display")	

defineFloat("RIO_CMDS_FLARE_COUNT_10", 394, {0, 1}, "Gauges", "RIO CMDS Flare Counter 10")
defineFloat("RIO_CMDS_FLARE_COUNT_1", 395, {0, 1}, "Gauges", "RIO CMDS Flare Counter 1")		
local function getFlareCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(394)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(395)*10)
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("RIO_CMDS_FLARECNT_DISPLAY", getFlareCount, 99, "CMDS", "RIO CMDS Flare Counter Display")

defineFloat("RIO_CMDS_JAMM_COUNT_10", 396, {0, 1}, "Gauges", "RIO CMDS Jammer Counter 10")
defineFloat("RIO_CMDS_JAMM_COUNT_1", 397, {0, 1}, "Gauges", "RIO CMDS Jammer Counter 1")		
local function getJammerCount()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(396)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(397)*10)
    return tonumber(digit1 .. digit2)
end
defineIntegerFromGetter("RIO_CMDS_JAMMCNT_DISPLAY", getJammerCount, 99, "CMDS", "RIO CMDS Jammer Counter Display")

defineFloat("RIO_TACAN_COMAND_IND", 414, {0, 1}, "Gauges", "RIO TACAN Command Indicator")
defineFloat("RIO_ELEVATION_RADAR", 2121, {-1, 1}, "Gauges", "RIO Radar Elevation Arrow")
defineFloat("RIO_ELEVATION_TCS", 2122, {-1, 1}, "Gauges", "RIO TCS Elevation Arrow")
defineFloat("RIO_CLOCK_H", 4150, {0, 1}, "Gauges", "RIO Clock Hours")
defineFloat("RIO_CLOCK_M", 4151, {0, 1}, "Gauges", "RIO Clock Minutes") 
defineFloat("RIO_CLOCK_TS", 4152, {0, 1}, "Gauges", "RIO Clock Timer Seconds") 
defineFloat("RIO_CLOCK_T", 4153, {0, 1}, "Gauges", "RIO Clock Timer") 
defineFloat("RIO_ALTIMETER_NEEDLE", 20104, {0, 1}, "Gauges", "RIO Altimeter Needle Barometric")
defineFloat("RIO_FUEL_TOTAL_10K", 2117, {0, 1}, "Gauges", "RIO Fuel Total 10000")
defineFloat("RIO_FUEL_TOTAL_1K", 2118, {0, 1}, "Gauges", "RIO Fuel Total 1000")
defineFloat("RIO_FUEL_TOTAL_100", 2119, {0, 1}, "Gauges", "RIO Fuel Total 100")
defineFloat("RIO_FUEL_TOTAL_10", 2120, {0, 1}, "Gauges", "RIO Fuel Total 10")
defineFloat("RIO_FUEL_TOTAL_1", 2135, {0, 1}, "Gauges", "RIO Fuel Total 1")
local function getRIOFuelTotal()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    local digit1 = string.format("%.0f", GetDevice(0):get_argument_value(2117)*10)
    local digit2 = string.format("%.0f", GetDevice(0):get_argument_value(2118)*10)
	local digit3 = string.format("%.0f", GetDevice(0):get_argument_value(2119)*10)
    local digit4 = string.format("%.0f", GetDevice(0):get_argument_value(2120)*10)
	local digit5 = string.format("%.0f", GetDevice(0):get_argument_value(2135)*10)
    return tonumber(digit1 .. digit2 .. digit3 .. digit4 .. digit5)
end
defineIntegerFromGetter("RIO_FUEL_TOTAL_DISP", getRIOFuelTotal, 65535, "Gauges", "RIO Fuel Total Display")

defineFloat("RIO_STDBYAI_OFF_FLAG", 19900, {0, 1}, "Gauges", "RIO Standby ADI Off Flag")
defineFloat("RIO_STDBYAI_PITCH", 3333, {-1, 1}, "Gauges", "RIO Standby ADI Pitch")
defineFloat("RIO_STDBYAI_ROLL", 19901, {-1, 1}, "Gauges", "RIO Standby ADI Roll")
defineFloat("RIO_ALT_METER_10000", 20112, {0, 1}, "Gauges", "RIO Altimeter 10000")
defineFloat("RIO_ALT_METER_1000", 20262, {0, 1}, "Gauges", "RIO Altimeter 1000")
defineFloat("RIO_ALT_METER_100", 20300, {0, 1}, "Gauges", "RIO Altimeter 100")
defineFloat("RIO_ALT_METER_SMALL_1", 20301, {0, 1}, "Gauges", "RIO Altimeter HG 1000")
defineFloat("RIO_ALT_METER_SMALL_2", 20302, {0, 1}, "Gauges", "RIO Altimeter 100")
defineFloat("RIO_ALT_METER_SMALL_3", 20303, {0, 1}, "Gauges", "RIO Altimeter 10")
defineFloat("RIO_ALT_METER_SMALL_4", 20304, {0, 1}, "Gauges", "RIO Altimeter 1")
defineFloat("RIO_ALT_METER_STBY", 20305, {0, 1}, "Gauges", "RIO Altimeter Standby Flag")
defineFloat("RIO_COMP_RING", 29109, {0, 1}, "Gauges", "RIO Compass Ring")
defineFloat("RIO_COMP_FLAG", 29105, {0, 1}, "Gauges", "RIO Compass OFF Flag")
defineFloat("RIO_COMP_NEEDLE_TACAN", 20699, {0, 1}, "Gauges", "RIO Compass TACAN Needle")
defineFloat("RIO_COMP_NEEDLE_ADF", 20700, {0, 1}, "Gauges", "RIO Compass ADF Needle")
defineFloat("RIO_COMP_ROLLER1", 705, {0, 1}, "Gauges", "RIO Compass Roller 1")
defineFloat("RIO_COMP_ROLLER2", 706, {0, 1}, "Gauges", "RIO Compass Roller 2")
defineFloat("RIO_COMP_ROLLER3", 707, {0, 1}, "Gauges", "RIO Compass Roller 3")
defineFloat("RIO_DDD_RANGE_ROLLER", 6100, {0, 1}, "Gauges", "RIO DDD Range Roller")
defineFloat("RIO_TID_SRC_ROLLER", 6101, {0, 1}, "Gauges", "RIO TID Readout SRC Roller")
defineFloat("RIO_DDD_RADAR_MODE", 6102, {0, 1}, "Gauges", "RIO DDD Raadar Mode Gauge")
defineFloat("RIO_TID_STEER_ROLLER", 6103, {0, 1}, "Gauges", "RIO TID Steering Roller")
defineFloat("RIO_RECORD_MIN_HI", 11600, {0, 1}, "Gauges", "RIO Record Minutes HI")
defineFloat("RIO_RECORD_MIN_MED", 11601, {0, 1}, "Gauges", "RIO Record Minutes MED")
defineFloat("RIO_RECORD_MIN_LOW", 11602, {0, 1}, "Gauges", "RIO Record Minutes LOW")

defineFloat("CANOPY_POS", 403, {0, 1}, "Gauges", "Canopy Position")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(402)*65535)
end, 65535, "External Aircraft Model", "Bottom Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(401)*65535)
end, 65535, "External Aircraft Model", "Bottom Left Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP", function()
	return math.floor(LoGetAircraftDrawArgumentValue(400)*65535)
end, 65535, "External Aircraft Model", "Top Speed Brake")

defineIntegerFromGetter("EXT_REFUEL_PROBE_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(610) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Refuel Probe Light")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_WINGS", function()
	if LoGetAircraftDrawArgumentValue(611) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights Wings")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_BODY", function()
	if LoGetAircraftDrawArgumentValue(612) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights Body")

defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(613) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light")

defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights")

defineIntegerFromGetter("EXT_ANTI_COL", function()
	if LoGetAircraftDrawArgumentValue(620) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Anticollision Lights")

BIOS.protocol.endModule()