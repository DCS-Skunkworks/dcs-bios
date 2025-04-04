module("F-14", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_14: Module
local F_14 = Module:new("F-14", 0x1200, { "F-14B", "F-14A-135-GR" })

--v4.6b by WarLord,ArturDCS,Matchstick and Bullitt

local devices = {
	JESTERAI = 62,
}

-- remove Arg# Stick 33

----------------------------------------- Extra Functions
function F_14:defineIndicatorLightRed(identifier, arg_number, category, description) --red
	self:defineGatedIndicatorLight(identifier, arg_number, 0.4, 0.6, category, description)
end

function F_14:defineIndicatorLightGreen(identifier, arg_number, category, description) --green
	self:defineGatedIndicatorLight(identifier, arg_number, 0.8, 0.99, category, description)
end

function F_14:defineIndicatorLightLANTTop(identifier, arg_number, category, description)
	self:defineGatedIndicatorLight(identifier, arg_number, 0.24, 0.49, category, description)
end

function F_14:defineIndicatorLightLANT(identifier, arg_number, category, description)
	self:defineGatedIndicatorLight(identifier, arg_number, 0.49, 0.55, category, description)
end

function F_14:defineIndicatorLightLANTBottom(identifier, arg_number, category, description)
	self:defineGatedIndicatorLight(identifier, arg_number, 0.55, 0.99, category, description)
end

local steer_mode = "2"

F_14:addExportHook(function(dev0)
	steer_mode = "2"

	if dev0:get_argument_value(1002) == 1 then --TACAN
		steer_mode = "1"
	elseif dev0:get_argument_value(1003) == 1 then --DEST
		steer_mode = "2"
	elseif dev0:get_argument_value(1004) == 1 then --AWL/PCD
		steer_mode = "3"
	elseif dev0:get_argument_value(1005) == 1 then --Vector
		steer_mode = "4"
	elseif dev0:get_argument_value(1006) == 1 then --Manual
		steer_mode = "5"
	end
end)

local hsd_ind = {}

F_14:addExportHook(function()
	hsd_ind = Module.parse_indication(1)
end)

--------------------------------- Matchstick

--- Inserts a separator into the middle of a 6-character radio line
--- @param line string
--- @param separator string
--- @return string
local function insert_radio_separator(line, separator)
	if not line or not separator then
		return ""
	end
	return line:sub(1, 3) .. separator .. line:sub(4)
end

-- 2021/11/23 - Heatblur have changed the order of items in the List Indication for the Pilot Remote Displays but not for the RIO.
-- So we now need two different versions of the code depending which display we are requesting.
local function get_rio_uhf_display(dev0)
	local data = Module.parse_indication(10) -- Data from specified device (9=Pilot UHF, 10=RIO UHF, 13=Pilot VHF/UHF)
	local test_pressed = dev0:get_argument_value(405) == 1 -- whether test mode is enabled

	if not data[0] then
		return "0000000"
	end

	local manual_mode = data[0] == 6

	if manual_mode then
		if test_pressed then
			return insert_radio_separator(data[3], data[4])
		end

		return insert_radio_separator(data[5], data[6])
	end

	if test_pressed then
		return insert_radio_separator(data[3], data[4])
	end

	return insert_radio_separator(data[5], " ")
end

local function get_radio_remote_display(dev0, indicator_id, test_button_id)
	local data = Module.parse_indication(indicator_id) -- Data from specified device (9=Pilot UHF, 10=RIO UHF, 13=Pilot VHF/UHF)

	-- testPressed indicates the current value of the specified radio display test button - if pressed we need to return the test value not the current manual or preset frequency.
	-- depending on the type of data and the test button status assemble the result including separator if necessary.
	local test_pressed = dev0:get_argument_value(test_button_id) == 1 -- whether test mode is enabled

	if not data[0] then
		return "0000000"
	end

	-- data[0] holds the length of the data table. 6 Indicates it is in manual frequency mode otherwise it is in preset mode.
	local manual_mode = data[0] == 6

	if manual_mode then
		if test_pressed then
			return insert_radio_separator(data[5], data[6])
		end

		return insert_radio_separator(data[3], data[4])
	end

	if test_pressed then
		return insert_radio_separator(data[4], data[5])
	end

	return insert_radio_separator(data[3], " ")
end

---Gets a radio display
---@param indicator_id integer the indicator to read
---@param is_pilot boolean whether this is the pilot or rio display
---@return string display value
local function get_radio_vuhf_display(indicator_id, is_pilot)
	local data = Module.parse_indication(indicator_id)

	if not data[0] then
		return ""
	end

	-- data[0] holds the length of the data table. 6 Indicates it is in manual frequency mode otherwise it is in preset mode (5).
	local manual_mode = data[0] == 6

	-- for the rio, we want the data at index 3, and the separator at index 4 if not in preset mode
	-- for the pilot, we want the data at index 5, and the separator at index 6 if not in preset mode
	local lower_index = is_pilot and 5 or 3

	if manual_mode then
		-- in manual mode, the separator is in the next index
		return insert_radio_separator(data[lower_index], data[lower_index + 1])
	end

	-- in preset mode, there is no separator, but the next index has other data that we don't care about
	return insert_radio_separator(data[lower_index], " ")
end

--------------------------------- Matchstick End

----------------------------------------- BIOS-Profile

-- Hydraulics
F_14:defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_SW", 13, 3001, 629, "Hydraulics", "PILOT Hydraulic Transfer Pump Switch")
F_14:defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_COVER", 13, 3002, 630, "Hydraulics", "PILOT Hydraulic Transfer Pump Switch Cover")
F_14:defineToggleSwitch("PLT_HYD_ISOL_SW", 13, 3005, 631, "Hydraulics", "PILOT Hydraulic Isolation Switch")
F_14:define3PosTumb("PLT_HYD_EMERG_FCONTR_SW", 13, 3003, 928, "Hydraulics", "PILOT Hydraulic Emergency Flight Control Switch")
F_14:defineToggleSwitch("PLT_HYD_EMERG_FCONTR_COVER", 13, 3004, 615, "Hydraulics", "PILOT Hydraulic Emergency Flight Control Switch Cover")
F_14:defineToggleSwitch("PLT_HYD_HAND_PUMP", 13, 3006, 13133, "Hydraulics", "PILOT Hydraulic Hand Pump") --632

-- Master Reset
F_14:definePushButton("PLT_MASTER_RESET", 23, 3058, 1071, "Master Reset", "PILOT MASTER RESET")

-- AICS
F_14:defineToggleSwitch("PLT_INLET_RAMPS_L", 14, 3007, 2100, "AICS", "PILOT Stow Inlet Ramps Left Switch")
F_14:defineToggleSwitch("PLT_INLET_RAMPS_R", 14, 3008, 2101, "AICS", "PILOT Stow Inlet Ramps Right Switch")

-- Wing Sweep
F_14:defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_COVER", 17, 3029, 317, "Wing Sweep", "PILOT Emergency Wing Sweep Handle Cover")
F_14:definePotentiometer("PLT_EMERG_WING_SWEEPLT_LEVER", 17, 3031, 384, { 0, 1 }, "Wing Sweep", "PILOT Emergency Wing Sweep Handle")
F_14:defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_POP", 17, 3030, 15096, "Wing Sweep", "PILOT Emergency Wing Sweep Handle Pop out")

--Radar Altimeter
F_14:definePushButton("PLT_RADAR_ALT_BIT", 30, 3485, 16020, "Radar Altimeter", "PILOT Radar Altimeter BIT Test Button")
F_14:defineRotary("PLT_RADAR_ALT_KNOB", 30, 3484, 308, "Radar Altimeter", "PILOT Radar Altimeter Control Knob")

-- Airspeed Indicator
F_14:definePushButton("PLT_AIRSPD_KNOB_PUSH", 28, 3492, 2127, "Airspeed Indicator", "PILOT Airspeed Indicator Bug Push Knob")
F_14:defineRotary("PLT_AIRSPD_KNOB", 28, 3491, 310, "Airspeed Indicator", "PILOT Airspeed Indicator Bug Knob")
F_14:definePushButton("RIO_AIRSPD_KNOB_PUSH", 28, 3651, 255, "Airspeed Indicator", "RIO Airspeed Indicator Bug Push Knob")
F_14:defineRotary("RIO_AIRSPD_KNOB", 28, 3652, 254, "Airspeed Indicator", "RIO Airspeed Indicator Bug Knob")

-- Altimeter
F_14:define3PosTumb("PLT_ALTIMETER_MODE", 29, 3487, 307, "Altimeter", "PILOT Altimeter Mode Switch")
F_14:defineRotary("PLT_ALTIMETER_KNOB", 29, 3486, 306, "Altimeter", "PILOT Altimeter Pressure Setting")

-- RIO Altimeter
F_14:define3PosTumb("RIO_ALTIMETER_MODE", 29, 3490, 20307, "Altimeter", "RIO Altimeter Mode Switch")
F_14:defineRotary("RIO_ALTIMETER_KNOB", 29, 3489, 20306, "Altimeter", "RIO Altimeter Pressure Setting")

-- Gear
F_14:defineToggleSwitch("PLT_GEAR_LEVER", 18, 3016, 326, "Gear", "PILOT Landing Gear Lever")
F_14:defineToggleSwitch("PLT_GEAR_LEVER_EMERG", 18, 3646, 16015, "Gear", "PILOT Landing Gear Lever RB emergency extend")
F_14:definePushButton("PLT_LAUNCHBAR_ABORT", 18, 3672, 497, "Gear", "PILOT Launch Bar Abort")
F_14:defineToggleSwitch("PLT_LAUNCHBAR_ABORT_COVER", 18, 3673, 496, "Gear", "PILOT Launch Bar Abort Switch Cover")
F_14:define3PosTumb("PLT_NOSE_STRUT_SW", 18, 3019, 1075, "Gear", "PILOT Nose Strut Compression Switch")

-- Hook
F_14:defineToggleSwitch("PLT_HOOK_LEVER", 18, 3021, 238, "Gear", "PILOT Hook Extension Handle")
F_14:defineToggleSwitch("PLT_HOOK_LEVER_EMERG", 18, 3022, 15078, "Gear", "PILOT Hook Extension Handle RB cycle emergency mode")

-- Brakes
F_14:define3PosTumb("PLT_ANTI_SKID_SW", 18, 3014, 1072, "Brakes", "Anti-Skid Spoiler BK Switch")
F_14:defineToggleSwitch("PLT_PARK_BRAKE", 18, 3013, 237, "Brakes", "PILOT Parking Brake Handle")

-- SAS
F_14:defineToggleSwitch("PLT_AFCS_PITCH", 22, 3034, 2106, "SAS", "PILOT AFCS Stability Augmentation - Pitch")
F_14:defineToggleSwitch("PLT_AFCS_ROLL", 22, 3035, 2107, "SAS", "PILOT AFCS Stability Augmentation - Roll")
F_14:defineToggleSwitch("PLT_AFCS_YAW", 22, 3036, 2108, "SAS", "PILOT AFCS Stability Augmentation - Yaw")

-- Autopilot
F_14:define3PosTumb("PLT_AUTOPLT_VECTOR_CARRIER", 22, 3037, 2109, "Autopilot", "PILOT Autopilot - Vector / Automatic Carrier Landing")
F_14:defineToggleSwitch("PLT_AUTOPLT_ALT", 22, 3038, 2110, "Autopilot", "PILOT Autopilot - Altitude Hold")
F_14:define3PosTumb("PLT_AUTOPLT_HDG", 22, 3039, 2111, "Autopilot", "PILOT Autopilot - Heading / Ground Track")
F_14:defineFixedStepTumb("PLT_AUTOPLT_ENGAGE", 22, 3040, 2112, 2, { -1, 1 }, { -1, 1 }, nil, "Autopilot", "PILOT Autopilot - Engage")

-- Flaps
F_14:definePotentiometer("PLT_FLAPS_LEVER", 19, 3044, 225, { 0, 1 }, "Flaps", "PILOT Flaps Lever")

-- Engine
F_14:defineToggleSwitch("PLT_ENGINE_FUEL_CUT_L", 20, 3128, 12300, "Engine", "PILOT Left Engine Fuel Cutoff")
F_14:defineToggleSwitch("PLT_ENGINE_FUEL_CUT_R", 20, 3129, 12301, "Engine", "PILOT Right Engine Fuel Cutoff")
F_14:define3PosTumb("PLT_THROTTLE_MODE", 20, 3045, 2104, "Engine", "PILOT Throttle Mode")
F_14:define3PosTumb("PLT_THROTTLE_TEMP", 20, 3047, 2103, "Engine", "PILOT Throttle Temp")
F_14:define3PosTumb("PLT_ANTI_ICE", 20, 3049, 941, "Engine", "PILOT Engine/Probe Anti-Ice")
F_14:defineToggleSwitch("PLT_ENGINE_AIRSTART", 20, 3050, 2105, "Engine", "PILOT Engine Airstart")
F_14:define3PosTumb("PLT_ENGINE_CRANK", 20, 3051, 2102, "Engine", "PILOT Engine Crank")
F_14:defineToggleSwitch("PLT_ENGINE_MODE_L", 20, 3052, 16007, "Engine", "PILOT Left Engine Mode")
F_14:defineToggleSwitch("PLT_ENGINE_MODE_R", 20, 3053, 16008, "Engine", "PILOT Right Engine Mode")
F_14:defineToggleSwitch("PLT_ASY_THRUST_LIMIT_COVER", 20, 3055, 16005, "Engine", "PILOT Asymmetric Thrust Limiter Cover")
F_14:defineToggleSwitch("PLT_ASY_THRUST_LIMIT", 20, 3054, 16006, "Engine", "PILOT Asymmetric Thrust Limiter")

-- Fuel System
F_14:defineToggleSwitch("PLT_FUEL_SHUTOFF_R", 21, 3061, 1044, "Fuel System", "PILOT Fuel Shutoff - Right")
F_14:defineToggleSwitch("PLT_FUEL_SHUTOFF_L", 21, 3062, 15081, "Fuel System", "PILOT Fuel Shutoff - Left")
F_14:defineToggleSwitch("PLT_FUEL_FEED_COVER", 21, 3064, 1094, "Fuel System", "PILOT Fuel Feed Cover")
F_14:define3PosTumb("PLT_FUEL_FEED", 21, 3065, 1095, "Fuel System", "PILOT Fuel Feed")
F_14:define3PosTumb("PLT_FUEL_WING_EXT_TRANS", 21, 3066, 1001, "Fuel System", "PILOT Fuel Wing/Ext Trans")
F_14:defineToggleSwitch("PLT_FUEL_DUMP", 21, 3067, 1074, "Fuel System", "PILOT Fuel Dump")
F_14:define3PosTumb("PLT_REFUEL_PROBE", 21, 3068, 1073, "Fuel System", "PILOT Refuel Probe")
F_14:define3PosTumb("PLT_FUEL_QUANT_SEL", 21, 3063, 1076, "Fuel System", "PILOT Fuel Quantity Selector")
F_14:defineRotary("PLT_BINGO_FUEL_KNOB", 21, 3069, 1050, "Fuel System", "PILOT BINGO Fuel Level Knob")

-- Electrics
F_14:define3PosTumb("PLT_L_GEN_SW", 15, 3009, 937, "Electrics", "PILOT Left Generator Switch")
F_14:define3PosTumb("PLT_R_GEN_SW", 15, 3010, 936, "Electrics", "PILOT Right Generator Switch")
F_14:defineToggleSwitch("PLT_EMERG_GEN_COVER", 15, 3011, 927, "Electrics", "PILOT Emergency Generator Switch Cover")
F_14:defineToggleSwitch("PLT_EMERG_GEN_SW", 15, 3012, 926, "Electrics", "PILOT Emergency Generator Switch")

-- Cockpit Mechanics
F_14:defineToggleSwitch("PLT_CANOPY_JETT", 12, 3184, 224, "Cockpit Mechanics", "PILOT Canopy Jettison")
F_14:defineToggleSwitch("RIO_CANOPY_JETT", 12, 3760, 2051, "Cockpit Mechanics", "RIO Canopy Jettison")
F_14:defineToggleSwitch("RIO_EJECT_CMD", 12, 3185, 2049, "Cockpit Mechanics", "RIO Ejection CMD Lever")
F_14:defineToggleSwitch("PLT_EJECT_SEAT_SAFE", 12, 3186, 404, "Cockpit Mechanics", "PILOT Ejection Seat Safety")
F_14:defineToggleSwitch("RIO_EJECT_SEAT_SAFE", 12, 3187, 498, "Cockpit Mechanics", "RIO Ejection Seat Safety")
F_14:defineToggleSwitch("RIO_STORAGE_BOX", 12, 3612, 122, "Cockpit Mechanics", "RIO Storage Box")

-- Enivornment Control
F_14:defineToggleSwitch("PLT_OXY_ON", 12, 3190, 8114, "Enivornment Control", "PILOT Oxygen On")
F_14:defineToggleSwitch("RIO_OXY_ON", 12, 3191, 119, "Enivornment Control", "RIO Oxygen On")
F_14:defineToggleSwitch("PLT_CABIN_PRESS_DUMP", 12, 3192, 939, "Enivornment Control", "PILOT Cabin Pressure Dump")
F_14:definePushButton("PLT_AIR_SOURCE_RAM", 12, 3193, 929, "Enivornment Control", "PILOT Air Source Ram")
F_14:definePushButton("PLT_AIR_SOURCE_OFF", 12, 3194, 933, "Enivornment Control", "PILOT Air Source Off")
F_14:definePushButton("PLT_AIR_SOURCE_L", 12, 3195, 930, "Enivornment Control", "PILOT Air Left Engine")
F_14:definePushButton("PLT_AIR_SOURCE_R", 12, 3196, 931, "Enivornment Control", "PILOT Air Right Engine")
F_14:definePushButton("PLT_AIR_SOURCE_BOTH", 12, 3197, 932, "Enivornment Control", "PILOT Air Both Engines")
F_14:define3PosTumb("PLT_WINDSHIELD_AIR", 12, 3647, 942, "Enivornment Control", "PILOT Wind Shield Air")
F_14:defineMultipositionSwitch("PLT_TEMP", 12, 3648, 950, 9, 0.125, "Enivornment Control", "PILOT Cabin Temperature Switch")
F_14:defineToggleSwitch("PLT_TEMP_AUTO_MAN", 12, 3649, 940, "Enivornment Control", "PILOT Temperature Auto/Man")
F_14:defineToggleSwitch("PLT_RAM_AIR", 12, 3650, 938, "Enivornment Control", "PILOT Ram Air")

-- BIT Panel
F_14:defineTumb("PLT_BIT_SWITCH", 11, 3076, 934, 1 / 11, { 0, 1 }, nil, false, "BIT Panel", "PILOT Master Test Selector (LB to rotate)")
F_14:defineToggleSwitch("PLT_BIT_SWITCH_PUSH", 11, 3077, 15098, "BIT Panel", "PILOT Master Test Selector (RB to pull/push)")

-- Light Panel
F_14:defineToggleSwitch("PLT_HOOK_BYPASS", 26, 3211, 915, "Light Panel", "PILOT Hook Bypass")
F_14:defineToggleSwitch("PLT_TAXI_LIGHT", 12, 3171, 918, "Light Panel", "PILOT Taxi Light")
F_14:define3PosTumb("PLT_FLOOD_LIGHT_RED", 12, 3172, 924, "Light Panel", "PILOT Red Flood Light")
F_14:define3PosTumb("PLT_FLOOD_LIGHT_WH", 12, 3173, 921, "Light Panel", "PILOT White Flood Light")
F_14:define3PosTumb("PLT_POS_LIGHT_WING", 12, 3174, 913, "Light Panel", "PILOT Position Lights Wings")
F_14:define3PosTumb("PLT_POS_LIGHT_TAIL", 12, 3175, 916, "Light Panel", "PILOT Position Lights Tail")
F_14:defineToggleSwitch("PLT_POS_LIGHT_FLASH", 12, 3176, 919, "Light Panel", "PILOT Position Lights Flash")
F_14:defineToggleSwitch("PLT_ANTICOL_LIGHT", 12, 3177, 923, "Light Panel", "PILOT Anti-Collision Lights")
F_14:defineMultipositionSwitch("PLT_LIGHT_INTENT_ACM", 12, 3178, 15005, 9, 0.125, "Light Panel", "PILOT ACM Panel Light Intensity")
F_14:defineMultipositionSwitch("PLT_LIGHT_INTENT_INDEXER", 26, 3212, 15006, 9, 0.125, "Light Panel", "PILOT AoA Indexer Light Intensity")
F_14:defineMultipositionSwitch("PLT_LIGHT_INTENT_INSTRUMENT", 12, 3179, 15007, 9, 0.125, "Light Panel", "PILOT Instrument Light Intensity")
F_14:defineMultipositionSwitch("PLT_LIGHT_INTENT_CONSOLE", 12, 3180, 15008, 9, 0.125, "Light Panel", "PILOT Console Light Intensity")
F_14:defineMultipositionSwitch("PLT_LIGHT_INTENT_FORMATION", 12, 3181, 15009, 9, 0.125, "Light Panel", "PILOT Formation Light Intensity")

-- Light panel RIO
F_14:define3PosTumb("RIO_FLOOD_LIGHT_RED", 12, 3706, 194, "Light Panel", "RIO Red Flood Light")
F_14:define3PosTumb("RIO_FLOOD_LIGHT_WH", 12, 3707, 159, "Light Panel", "RIO White Flood Light")
F_14:defineMultipositionSwitch("RIO_LIGHT_INTENT_INSTRUMENT", 12, 3708, 193, 9, 0.125, "Light Panel", "RIO Instrument Light Intensity")
F_14:defineMultipositionSwitch("RIO_LIGHT_INTENT_CONSOLE", 12, 3709, 192, 9, 0.125, "Light Panel", "RIO Console Light Intensity")

-- DISPLAY Panel: Power
F_14:defineToggleSwitch("PLT_VDI_PW_SW", 42, 3214, 1010, "Display", "PILOT VDI Power On/Off")
F_14:defineToggleSwitch("PLT_HUD_PW_SW", 40, 3213, 1009, "Display", "PILOT HUD Power On/Off")
F_14:defineToggleSwitch("PLT_HSD_PW_SW", 41, 3215, 1008, "Display", "PILOT HSD/ECMD Power On/Off")

-- DISPLAY Panel: Steer CMD
F_14:definePushButton("PLT_NAV_STEER_TACAN", 46, 3314, 1002, "Display", "PILOT Navigation Steer Commands: TACAN")
F_14:definePushButton("PLT_NAV_STEER_DEST", 46, 3315, 1003, "Display", "PILOT Navigation Steer Commands: Destination")
F_14:definePushButton("PLT_NAV_STEER_AWL", 46, 3318, 1004, "Display", "PILOT Navigation Steer Commands: AWL PCD")
F_14:definePushButton("PLT_NAV_STEER_VECTOR", 46, 3316, 1005, "Display", "PILOT Navigation Steer Commands: Vector")
F_14:definePushButton("PLT_NAV_STEER_MAN", 46, 3317, 1006, "Display", "PILOT Navigation Steer Commands: Manual")

-- DISPLAY Panel: HSD
F_14:define3PosTumb("PLT_HSD_DIS_MODE", 41, 3235, 1016, "Display", "PILOT HSD Display Mode")
F_14:defineToggleSwitch("PLT_HSD_ECM_OVER", 41, 3239, 1017, "Display", "PILOT HSD ECM Override")

-- HSD
F_14:defineRotary("PLT_HSD_KNOB_HDG", 41, 3241, 1039, "HSD", "PILOT HSD Selected Heading")
F_14:defineRotary("PLT_HSD_KNOB_CRS", 41, 3242, 1040, "HSD", "PILOT HSD Selected Course")
F_14:definePotentiometer("PLT_HSD_BRIGHT", 41, 3240, 1043, { 0, 1 }, "HSD", "PILOT HSD Brightness")
F_14:definePushButton("PLT_HSD_TEST", 41, 3243, 1041, "HSD", "PILOT HSD Test")

-- ECMD
F_14:definePotentiometer("RIO_ECMD_BRIGHT", 45, 3245, 2023, { 0, 1 }, "ECMD", "RIO ECMD Brightness")
F_14:definePushButton("RIO_ECMD_TEST", 45, 3246, 2024, "ECMD", "RIO ECMD Test")
F_14:defineToggleSwitch("RIO_ECM_MODE", 45, 3247, 189, "ECMD", "RIO ECM Display Mode")
F_14:define3PosTumb("RIO_ECM_OVERRIDE", 45, 3248, 156, "ECMD", "RIO ECM Display Override")
F_14:define3PosTumb("RIO_ECM_CORR", 45, 3249, 168, "ECMD", "RIO ECM Display Corr")
F_14:define3PosTumb("RIO_ECM_ADF", 45, 3250, 190, "ECMD", "RIO ECM Display Data/ADF")

-- TACAN Pilot Panel
F_14:defineToggleSwitch("PLT_TACAN_CMD_BUTTON", 47, 3324, 292, "Volume Panel", "PILOT TACAN CMD Button")
F_14:defineToggleSwitch("RIO_TACAN_CMD_BUTTON", 47, 3325, 135, "TACAN RIO", "RIO TACAN CMD Button")
F_14:defineTumb("PLT_TACAN_MODE", 47, 3326, 2041, 0.25, { 0, 1 }, nil, false, "TACAN PILOT", "PILOT TACAN Mode")
F_14:definePotentiometer("PLT_TACAN_VOLUME", 47, 3328, 2036, { 0, 1 }, "TACAN PILOT", "PILOT TACAN Volume")
F_14:defineFixedStepTumb("PLT_TACAN_MODE_NORMAL_INV", 47, 3335, 2042, 2, { -1, 1 }, { -1, 1 }, nil, "TACAN PILOT", "PILOT TACAN Mode Normal/Inverse")
F_14:defineFixedStepTumb("PLT_TACAN_CHANNEL", 47, 3336, 2043, 2, { -1, 1 }, { -1, 1 }, nil, "TACAN PILOT", "PILOT TACAN Channel XY")
F_14:definePushButton("PLT_TACAN_BIT", 47, 3334, 2115, "TACAN PILOT", "PILOT TACAN Bit")
F_14:defineTumb("PLT_TACAN_DIAL_TENS", 47, 3330, 8888, 1 / 12, { 0, 1 }, nil, false, "TACAN PILOT", "PILOT TACAN Channel Wheel (Tens)")
F_14:defineTumb("PLT_TACAN_DIAL_ONES", 47, 3332, 8889, 1 / 9, { 0, 1 }, nil, false, "TACAN PILOT", "PILOT TACAN Channel Lever (Ones)")

-- TACAN RIO Panel
F_14:defineTumb("RIO_TACAN_MODE", 47, 3338, 374, 0.25, { 0, 1 }, nil, false, "TACAN RIO", "RIO TACAN Mode")
F_14:definePotentiometer("RIO_TACAN_VOLUME", 47, 3340, 375, { 0, 1 }, "TACAN RIO", "RIO TACAN Volume")
F_14:defineToggleSwitch("RIO_TACAN_MODE_NORMAL_INV", 47, 3347, 373, "TACAN RIO", "RIO TACAN Mode Normal/Inverse")
F_14:defineToggleSwitch("RIO_TACAN_CHANNEL", 47, 3348, 372, "TACAN RIO", "RIO TACAN Channel XY")
F_14:definePushButton("RIO_TACAN_BIT", 47, 3346, 371, "TACAN RIO", "RIO TACAN Bit")
F_14:defineTumb("RIO_TACAN_DIAL_TENS", 47, 3342, 8891, 1 / 12, { 0, 1 }, nil, false, "TACAN RIO", "RIO TACAN Channel Wheel (Tens)")
F_14:defineTumb("RIO_TACAN_DIAL_ONES", 47, 3344, 8890, 1 / 9, { 0, 1 }, nil, false, "TACAN RIO", "RIO TACAN Channel Lever (Ones)")

-- AN/ARA-63 Panel
F_14:defineToggleSwitch("PLT_ARA63_PW", 48, 3319, 910, "ANARA63 Panel", "PILOT AN/ARA-63 Power")
F_14:definePushButton("PLT_ARA63_BIT", 48, 3321, 911, "ANARA63 Panel", "PILOT AN/ARA-63 BIT Button")
F_14:defineTumb("PLT_ARA63_CHAN", 48, 3322, 912, 1 / 19, { 0, 1 }, nil, true, "ANARA63 Panel", "PILOT AN/ARA-63 Channel Knob")

-- Pilot TONE VOLUME Panel
F_14:definePotentiometer("PLT_ALR67_VOL", 2, 3395, 2040, { 0, 1 }, "Volume Panel", "PILOT ALR-67 Volume")
F_14:definePotentiometer("PLT_AIM9_VOL", 2, 3397, 2039, { 0, 1 }, "Volume Panel", "PILOT Sidewinder Volume")

-- ICS Pilot
F_14:definePotentiometer("PLT_ICS_VOL", 2, 3380, 2048, { 0, 1 }, "ICS", "PILOT ICS Volume")
F_14:defineMultipositionSwitch("PLT_ICS_AMP_SEL", 2, 3382, 2045, 3, 0.5, "ICS", "PILOT ICS Amplifier Selector")
F_14:define3PosTumb("PLT_ICS_FUNC_SEL", 2, 3383, 2044, "ICS", "PILOT ICS Function Selector")

-- ICS RIO
F_14:definePotentiometer("RIO_ICS_VOL", 2, 3387, 400, { 0, 1 }, "ICS", "RIO ICS Volume")
F_14:defineMultipositionSwitch("RIO_ICS_AMP_SEL", 2, 3389, 401, 3, 0.5, "ICS", "RIO ICS Amplifier Selector")
F_14:define3PosTumb("RIO_ICS_FUNC_SEL", 2, 3390, 402, "ICS", "RIO ICS Function Selector")
F_14:define3PosTumb("RIO_ICS_XMTR_SEL", 2, 3399, 381, "ICS", "RIO XMTR SEL Switch")
F_14:define3PosTumb("RIO_ICS_UHF_LWR", 2, 3598, 380, "ICS", "RIO V/UHF 2 ANT Switch")
F_14:define3PosTumb("RIO_ICS_KY_MODE", 2, 3597, 382, "ICS", "RIO KY MODE Switch")

-- UHF ARC-159
F_14:defineTumb("PLT_UHF1_FREQ_MODE", 3, 3375, 2033, 0.5, { 0, 1 }, nil, false, "UHF 1", "PILOT UHF ARC-159 Freq Mode GUARD/MANUAL/PRESET")
F_14:defineMultipositionSwitch("PLT_UHF1_FUNCTION", 3, 3371, 2034, 4, 0.333333, "UHF 1", "PILOT UHF ARC-159 Function ADF/BOTH/MAIN/OFF")
F_14:defineTumb("PLT_UHF1_PRESETS", 3, 3373, 2032, 0.0833333333, { 0, 1 }, nil, true, "UHF 1", "PILOT UHF ARC-159 Preset Channel Selector")
F_14:defineToggleSwitch("PLT_UHF1_SQUELCH", 3, 3365, 2035, "UHF 1", "PILOT UHF ARC-159 Squelch Switch")
F_14:define3PosTumb("PLT_UHF1_110_DIAL", 3, 3367, 2030, "UHF 1", "PILOT UHF ARC-159 100MHz & 10MHz Dial")
F_14:define3PosTumb("PLT_UHF1_1_DIAL", 3, 3368, 2029, "UHF 1", "PILOT UHF ARC-159 1MHz Dial")
F_14:define3PosTumb("PLT_UHF1_01_DIAL", 3, 3369, 2028, "UHF 1", "PILOT UHF ARC-159 0.1MHz Dial")
F_14:define3PosTumb("PLT_UHF1_025_DIAL", 3, 3370, 2026, "UHF 1", "PILOT UHF ARC-159 0.025MHz Dial")
F_14:defineToggleSwitch("PLT_UHF1_SHOW_PRESET_FREQ", 3, 3377, 8115, "UHF 1", "PILOT UHF ARC-159 Show Preset Frequency")
F_14:definePotentiometer("PLT_UHF1_VOL", 3, 3359, 2031, { 0, 1 }, "UHF 1", "PILOT UHF ARC-159 Volume")
F_14:definePotentiometer("RIO_UHF1_VOL", 3, 3361, 383, { 0, 1 }, "UHF 1", "RIO UHF ARC-159 Volume")
F_14:definePotentiometer("PLT_UHF1_BRIGHTNESS", 3, 3363, 2027, { 0, 1 }, "UHF 1", "PILOT UHF ARC-159 Display Brightness")
F_14:definePushButton("PLT_UHF1_LOAD", 3, 3378, 16009, "UHF 1", "PILOT UHF ARC-159 Load")
F_14:definePushButton("PLT_UHF1_TONE", 3, 3379, 16010, "UHF 1", "PILOT UHF ARC-159 Tone")

--- Gets an integer segment of the radio frequency
--- @param device_id integer the dcs device id
--- @param range integer[] a length-2 array containing the substring start and end indices to use
--- @return integer
local function getArc159RadioFrequencySegment(device_id, range)
	--225000288
	-- 65000056
	local arc_159 = GetDevice(device_id)

	if arc_159 == nil then
		return 0
	end

	local freq = tostring(arc_159:get_frequency())
	if freq == "nan" then
		return 0
	end
	freq = string.sub(freq, range[1], range[2])
	return tonumber(freq) or 0
end

local function getARC159_High_Frequency()
	return getArc159RadioFrequencySegment(3, { 1, 3 })
end

local function getARC159_Decimal_DIAL3_Frequency()
	return getArc159RadioFrequencySegment(3, { 4, 4 })
end

local function getARC159_Decimal_DIAL4_Frequency()
	return getArc159RadioFrequencySegment(3, { 5, 6 })
end

F_14:defineIntegerFromGetter("PLT_UHF_DIAL4_FREQ", getARC159_Decimal_DIAL4_Frequency, 100, "UHF 1", "PILOT Dial 4 ARC-159 Frequency")
F_14:defineIntegerFromGetter("PLT_UHF_DIAL3_FREQ", getARC159_Decimal_DIAL3_Frequency, 10, "UHF 1", "PILOT Dial 3 ARC-159 Frequency")
F_14:defineIntegerFromGetter("PLT_UHF_HIGH_FREQ", getARC159_High_Frequency, 400, "UHF 1", "PILOT High ARC-159 Frequency")

-- VHF/UHF ARC-182 ("V/UHF 2")
F_14:defineMultipositionSwitch("RIO_VUHF_FREQ_MODE", 4, 3417, 353, 6, 0.2, "VUHF", "RIO VHF/UHF ARC-182 Frequency Mode 243 MAN G PRESET READ LOAD")
F_14:defineMultipositionSwitch("RIO_VUHF_MODE", 4, 3413, 358, 5, 0.25, "VUHF", "RIO VHF/UHF ARC-182 MODE OFF T/R T/R&G DF TEST")
F_14:defineTumb("RIO_VUHF_PRESETS", 4, 3415, 352, 0.0833333333, { 0, 1 }, nil, true, "VUHF", "RIO VHF/UHF ARC-182 Preset Channel Selector")
F_14:defineToggleSwitch("RIO_VUHF_FM_AM", 4, 3419, 359, "VUHF", "RIO VHF/UHF ARC-182 FM/AM Switch")
F_14:defineToggleSwitch("RIO_VUHF_SQUELCH", 4, 3407, 351, "VUHF", "RIO VHF/UHF ARC-182 Squelch Switch")
F_14:define3PosTumb("RIO_VUHF_110_DIAL", 4, 3409, 354, "VUHF", "RIO VUHF ARC-182 100MHz & 10MHz Dial")
F_14:define3PosTumb("RIO_VUHF_1_DIAL", 4, 3410, 355, "VUHF", "RIO VUHF ARC-182 1MHz Dial")
F_14:define3PosTumb("RIO_VUHF_01_DIAL", 4, 3411, 356, "VUHF", "RIO VUHF ARC-182 0.1MHz Dial")
F_14:define3PosTumb("RIO_VUHF_025_DIAL", 4, 3412, 357, "VUHF", "RIO VUHF ARC-182 0.025MHz Dial")
F_14:definePotentiometer("RIO_VUHF_VOL", 4, 3401, 350, { 0, 1 }, "VUHF", "RIO VUHF ARC-182 Volume")
F_14:definePotentiometer("PLT_VUHF_VOL", 4, 3403, 2038, { 0, 1 }, "Volume Panel", "PILOT VUHF ARC-182 Volume")
F_14:definePotentiometer("RIO_VUHF_BRIGHTNESS", 4, 3405, 360, { 0, 1 }, "VUHF", "RIO VUHF ARC-182 Display Brightness")

--- Gets an integer segment of the radio frequency
--- @param device_id integer the dcs device id
--- @param len_8_range integer[] a length-2 array containing the substring start and end indices to use if the frequency is 8 digits long
--- @param len_9_range integer[] a length-2 array containing the substring start and end indices to use if the frequency is 9 digits long
--- @return integer
local function getArc182RadioFrequencySegment(device_id, len_8_range, len_9_range)
	--225000288
	-- 65000056
	local arc_182 = GetDevice(device_id)

	if arc_182 == nil then
		return 0
	end

	local freq = tostring(arc_182:get_frequency())
	if freq == "nan" then
		return 0
	end
	if string.len(freq) == 8 then
		freq = string.sub(freq, len_8_range[1], len_8_range[2])
	else
		freq = string.sub(freq, len_9_range[1], len_9_range[2])
	end
	return tonumber(freq) or 0
end

local function getARC182_High_Frequency()
	return getArc182RadioFrequencySegment(4, { 1, 2 }, { 1, 3 })
end

local function getARC182_Decimal_DIAL3_Frequency()
	return getArc182RadioFrequencySegment(4, { 3, 3 }, { 4, 4 })
end

local function getARC182_Decimal_DIAL4_Frequency()
	return getArc182RadioFrequencySegment(4, { 4, 5 }, { 5, 6 })
end

F_14:defineIntegerFromGetter("RIO_VUHF_DIAL4_FREQ", getARC182_Decimal_DIAL4_Frequency, 100, "VUHF", "RIO Dial 4 ARC-182 Frequency")
F_14:defineIntegerFromGetter("RIO_VUHF_DIAL3_FREQ", getARC182_Decimal_DIAL3_Frequency, 10, "VUHF", "RIO Dial 3 ARC-182 Frequency")
F_14:defineIntegerFromGetter("RIO_VUHF_HIGH_FREQ", getARC182_High_Frequency, 400, "VUHF", "RIO High ARC-182 Frequency")

-- KY-28
F_14:defineTumb("RIO_KY28_POWER", 2, 3423, 116, 0.5, { 0, 1 }, nil, false, "KY-28", "RIO KY-28 Power Mode")
F_14:defineTumb("RIO_KY28_RADIO_SELECTOR", 2, 3425, 115, 0.5, { 0, 1 }, nil, false, "KY-28", "RIO KY-28 Radio Selector")
F_14:defineToggleSwitch("RIO_KY28_FLIPCOVER", 2, 3608, 150, "KY-28", "RIO KY-28 ZEROIZE Cover")
F_14:defineToggleSwitch("RIO_KY28_ZEROIZE", 2, 3427, 361, "KY-28", "RIO KY-28 ZEROIZE")

-- UHF/VHF/UHF Pilot/RIO Remote Display
F_14:definePotentiometer("PLT_UHF_REMOTE_BRIGHTNESS", 3, 3350, 1031, { 0, 1 }, "UHF 1", "PILOT UHF ARC-159 Remote Display Brightness")
F_14:definePotentiometer("RIO_UHF_REMOTE_BRIGHTNESS", 3, 3353, 406, { 0, 1 }, "UHF 1", "RIO UHF ARC-159 Remote Display Brightness")
F_14:definePotentiometer("PLT_VUHF_REMOTE_BRIGHTNESS", 4, 3356, 1030, { 0, 1 }, "VUHF", "PILOT VHF/UHF Radio Remote Display Brightness")
F_14:defineToggleSwitch("PLT_UHF_DISPLAY_TEST", 3, 3352, 15004, "UHF 1", "PILOT UHF ARC-159 Radio Remote Display Test")
F_14:defineToggleSwitch("RIO_UHF_DISPLAY_TEST", 3, 3355, 405, "UHF 1", "RIO UHF ARC-159 Radio Remote Display Test")
F_14:defineToggleSwitch("PLT_VUHF_DISPLAY_TEST", 4, 3358, 15003, "VUHF", "PILOT VHF/UHF ARC-182 Radio Remote Display Test")

-- DECM Panel
F_14:defineMultipositionSwitch("RIO_DECM_PW_MODE", 53, 3252, 151, 6, 0.2, "DECM Panel", "RIO DECM ALQ-100 Power/Mode")
F_14:definePotentiometer("RIO_DECM_VOL", 53, 3253, 9950, { 0, 1 }, "DECM Panel", "RIO DECM ALQ-100 Volume")

-- RWR Control Panel ALR-67
F_14:definePotentiometer("PLT_RWR_BRIGHT", 54, 3262, 16011, { 0, 1 }, "RWR Control Panel", "PILOT AN/ALR-67 Display Brightness")
F_14:definePotentiometer("RIO_RWR_BRIGHT", 54, 3263, 376, { 0, 1 }, "RWR Control Panel", "RIO AN/ALR-67 Display Brightness")
F_14:defineMultipositionSwitch("RIO_RWR_DIS_TYP", 54, 3257, 2136, 5, 0.25, "DECM Panel", "RIO AN/ALR-67 Display Type")
F_14:define3PosTumb("RIO_RWR_MODE", 54, 3256, 2137, "DECM Panel", "RIO AN/ALR-67 Mode")
F_14:define3PosTumb("RIO_RWR_TEST", 54, 3261, 2140, "DECM Panel", "RIO AN/ALR-67 Mode")
F_14:defineToggleSwitch("RIO_RWR_PW", 54, 3259, 2139, "DECM Panel", "RIO AN/ALR-67 Power")
F_14:definePotentiometer("RIO_RWR_VOL", 54, 3254, 2138, { 0, 1 }, "DECM Panel", "RIO AN/ALR-67 Volume")

-- AN/ALE-39 Mode Panel
F_14:define3PosTumb("RIO_CMDS_PW", 5, 3267, 390, "CMDS", "RIO AN/ALE-37 Power/Mode")
F_14:define3PosTumb("RIO_CMDS_DISP_CHAFF", 5, 3269, 389, "CMDS", "RIO AN/ALE-37 Chaff Dispense")
F_14:define3PosTumb("RIO_CMDS_DISP_FLAR", 5, 3270, 388, "CMDS", "RIO AN/ALE-37 Flare Dispense")
F_14:define3PosTumb("RIO_CMDS_DISP_JAMMER", 5, 3271, 387, "CMDS", "RIO AN/ALE-37 Jammer Dispense")
F_14:define3PosTumb("RIO_CMDS_FLAREMODE", 5, 3272, 398, "CMDS", "RIO AN/ALE-37 Flare Mode")
F_14:definePushButton("RIO_CMDS_FLARE_SALVO", 5, 3272, 391, "CMDS", "RIO AN/ALE-37 Flare Salvo")
F_14:definePotentiometer("RIO_CMDS_COUNT_CHAFF", 5, 3275, 386, { 0, 1 }, "CMDS", "AN/ALE-37 Chaff Counter")
F_14:definePotentiometer("RIO_CMDS_COUNT_FLARE", 5, 3277, 385, { 0, 1 }, "CMDS", "AN/ALE-37 Flare Counter")
F_14:definePotentiometer("RIO_CMDS_COUNT_JAMMER", 5, 3279, 399, { 0, 1 }, "CMDS", "AN/ALE-37 Jammer Counter")

-- AN/ALE-39 Program Panel
F_14:defineTumb("RIO_CMDS_LOAD_TYP_L10", 5, 3281, 206, 0.5, { 0, 1 }, nil, false, "CMDS Program", "RIO AN/ALE-37 L10 Load Type")
F_14:defineTumb("RIO_CMDS_LOAD_TYP_L20", 5, 3283, 207, 0.5, { 0, 1 }, nil, false, "CMDS Program", "RIO AN/ALE-37 L20 Load Type")
F_14:defineTumb("RIO_CMDS_LOAD_TYP_R10", 5, 3285, 209, 0.5, { 0, 1 }, nil, false, "CMDS Program", "RIO AN/ALE-37 R10 Load Type")
F_14:defineTumb("RIO_CMDS_LOAD_TYP_R20", 5, 3287, 208, 0.5, { 0, 1 }, nil, false, "CMDS Program", "RIO AN/ALE-37 R20 Load Type")
F_14:defineTumb("RIO_CMDS_CHAFF_BURST_QUAN", 5, 3298, 214, 0.2, { 0, 1 }, nil, false, "CMDS Program", "RIO Chaff Burst Quantity")
F_14:defineTumb("RIO_CMDS_CHAFF_BURST_INTER", 5, 3300, 215, 0.2, { 0, 1 }, nil, false, "CMDS Program", "RIO Chaff Burst Interval")
F_14:defineTumb("RIO_CMDS_CHAFF_SALVO_QUAN", 5, 3302, 203, 0.2, { 0, 1 }, nil, false, "CMDS Program", "RIO Chaff Salvo Quantity")
F_14:defineTumb("RIO_CMDS_CHAFF_SALVO_INTER", 5, 3304, 202, 0.2, { 0, 1 }, nil, false, "CMDS Program", "RIO Chaff Salvo Interval")
F_14:defineTumb("RIO_CMDS_FLARE_QUAN", 5, 3306, 205, 0.2, { 0, 1 }, nil, false, "CMDS Program", "RIO Flare Quantity")
F_14:defineTumb("RIO_CMDS_FLARE_INTER", 5, 3308, 210, 0.2, { 0, 1 }, nil, false, "CMDS Program", "RIO Flare Interval")
F_14:defineTumb("RIO_CMDS_JAMM_QUAN", 5, 3295, 204, 0.333, { 0, 1 }, nil, false, "CMDS Program", "RIO AN/ALE-37 Jammer Quantity")
F_14:defineTumb("RIO_CMDS_JAMM_INTER_UNIT", 5, 3289, 211, 0.111, { 0, 1 }, nil, false, "CMDS Program", "RIO Jammer Interval Units")
F_14:defineTumb("RIO_CMDS_JAMM_INTER_10", 5, 3291, 212, 0.111, { 0, 1 }, nil, false, "CMDS Program", "RIO Jammer Interval Tens")
F_14:defineTumb("RIO_CMDS_JAMM_INTER_100", 5, 3293, 213, 0.111, { 0, 1 }, nil, false, "CMDS Program", "RIO Jammer Interval Hundreds")
F_14:definePushButton("RIO_CMDS_PROG_RESET", 5, 3297, 216, "CMDS", "RIO AN/ALE-37 Programmer Reset")

-- INS
F_14:defineMultipositionSwitch("RIO_TID_MODE_NAV", 50, 3106, 50, 7, 0.1666667, "INS", "RIO TID Navigation Mode")
F_14:defineMultipositionSwitch("RIO_TID_MODE_DEST", 46, 3109, 51, 8, 0.142857, "INS", "RIO TID Destination Mode")

-- AHRS / Compass  (COMP Panel)
F_14:definePotentiometer("PLT_AHRS_HDG_KNOB", 51, 3433, 904, { -1, 1 }, "AHRS", "PILOT Compass HDG Slave Knob")
F_14:definePushButton("PLT_AHRS_HDG_PUSH", 51, 3432, 16014, "AHRS", "PILOT Compass HDG Slave Push")
F_14:define3PosTumb("PLT_AHRS_MODE", 51, 3434, 905, "AHRS", "PILOT Compass Mode")
F_14:defineFixedStepTumb("PLT_AHRS_HEMISPHERE", 51, 3436, 906, 2, { -1, 1 }, { -1, 1 }, nil, "AHRS", "PILOT Compass N-S Hemisphere")
F_14:definePotentiometer("PLT_AHRS_LAT", 51, 3438, 909, { 0, 1 }, "AHRS", "PILOT Compass LAT Correction")

-- Spoiler Overrides
F_14:defineToggleSwitch("PLT_SPOIL_OVER_COVER_INBOARD", 15, 3428, 902, "Spoiler", "PILOT Inboard Spoiler Override Cover")
F_14:defineToggleSwitch("PLT_SPOIL_OVER_COVER_OUTBOARD", 15, 3429, 903, "Spoiler", "PILOT Outboard Spoiler Override Cover")
F_14:defineToggleSwitch("PLT_SPOIL_OVER_INBOARD", 15, 3430, 908, "Spoiler", "PILOT Inboard Spoiler Override")
F_14:defineToggleSwitch("PLT_SPOIL_OVER_OUTBOARD", 15, 3431, 907, "Spoiler", "PILOT Outboard Spoiler Override")

-- Gun Elevation
F_14:defineRotary("PLT_GUN_ELEV_ADJUST", 55, 3131, 1000, "Gun", "PILOT Gun Elevation Lead Adjustment")
F_14:defineRotary("PLT_GUN_AMMU_COUNT_ADJUST", 55, 3132, 1022, "Gun", "PILOT Gun Ammunition Counter Adjustment")

-- DISPLAY Panel
F_14:definePotentiometer("PLT_HUD_PITCH_BRIGHT", 40, 3223, 1007, { 0, 1 }, "Display", "PILOT HUD Pitch Ladder Brightness")
F_14:defineToggleSwitch("PLT_VDI_MODE_DISP", 42, 3224, 1019, "Display", "PILOT VDI Display Mode")
F_14:defineToggleSwitch("PLT_VDI_MODE_LAND", 42, 3225, 1018, "Display", "PILOT VDI Landing Mode")
F_14:defineToggleSwitch("PLT_HUD_DECLUTTER", 40, 3226, 1021, "Display", "PILOT HUD De-clutter On/Off")
F_14:defineToggleSwitch("PLT_HUD_MODE_AWL", 40, 3227, 1020, "Display", "PILOT HUD AWL Mode")
F_14:definePushButton("PLT_HUD_MODE_TAKEOFF", 40, 3216, 1015, "Display", "PILOT HUD Take-Off Mode")
F_14:definePushButton("PLT_HUD_MODE_CRUISE", 40, 3217, 1014, "Display", "PILOT HUD Cruise Mode")
F_14:definePushButton("PLT_HUD_MODE_A2A", 40, 3218, 1013, "Display", "PILOT HUD Air-to-Air Mode")
F_14:definePushButton("PLT_HUD_MODE_A2G", 40, 3219, 1012, "Display", "PILOT HUD Air-to-Ground Mode")
F_14:definePushButton("PLT_HUD_MODE_LAND", 40, 3220, 1011, "Display", "PILOT HUD Landing Mode")

-- Standby ADI
F_14:definePushButton("PLT_STDBYAI_UNCAGE", 31, 3545, 1032, "Standby ADI", "PILOT Standby ADI Push to uncage")
F_14:defineRotary("PLT_STDBYAI_TRIM", 31, 3546, 1042, "Standby ADI", "PILOT Standby ADI Knob")
F_14:definePushButton("RIO_STDBYAI_UNCAGE", 31, 3547, 6155, "Standby ADI", "RIO Standby ADI Push to uncage")
F_14:defineRotary("RIO_STDBYAI_TRIM", 31, 3548, 6156, "Standby ADI", "RIO Standby ADI Knob")
F_14:definePushButton("PLT_ACCEL_RESET", 25, 3488, 228, "Display", "PILOT Accelerometer Reset")

-- VDI & HUD Indicator Controls
F_14:defineToggleSwitch("PLT_HUD_FILTER", 40, 3228, 1033, "HUD", "PILOT HUD Filter")
F_14:definePotentiometer("PLT_HUD_TRIM", 40, 3229, 1034, { 0, 1 }, "HUD", "PILOT HUD TRIM")
F_14:definePotentiometer("PLT_VSDI_TRIM", 42, 3230, 1035, { 0, 1 }, "HUD", "PILOT VDI Trim")
F_14:definePotentiometer("PLT_VDI_CONTRAST", 42, 3231, 1038, { 0, 1 }, "HUD", "PILOT VDI Screen Contrast")
F_14:definePotentiometer("PLT_VSDI_BRIGHT", 42, 3232, 1036, { 0, 1 }, "HUD", "PILOT VDI Screen Brightness")
F_14:definePotentiometer("PLT_HUD_BRIGHT", 40, 3233, 1037, { 0, 1 }, "HUD", "PILOT HUD Brightness")

-- Under HUD / Master Arm / Gun/Weapons Panel
F_14:defineToggleSwitch("PLT_MASTER_ARM_COVER", 55, 3135, 1046, "Weapons Panel", "PILOT Master Arm Cover")
F_14:define3PosTumb("PLT_MASTER_ARM_SW", 55, 3136, 1047, "Weapons Panel", "PILOT Master Arm Switch")
F_14:defineToggleSwitch("PLT_ACM_COVER", 55, 3133, 1049, "Weapons Panel", "PILOT ACM Cover")
F_14:definePushButton("PLT_ACM_JETT", 55, 3138, 1048, "Weapons Panel", "PILOT ACM Jettison")
F_14:definePushButton("PLT_MASTER_CAUTION_RESET", 35, 3056, 9199, "Weapons Panel", "PILOT Master Caution Reset")
F_14:definePushButton("PLT_GUN_RATE", 55, 3130, 16000, "Weapons Panel", "PILOT Gun Rate")
F_14:definePushButton("PLT_SIDEWINDER_COOL", 55, 3139, 16001, "Weapons Panel", "PILOT Sidewinder Cool")
F_14:definePushButton("PLT_MISSLE_PREP", 55, 3140, 16002, "Weapons Panel", "PILOT Missile Prepare")
F_14:definePushButton("PLT_MISSLE_MODE", 55, 3141, 16003, "Weapons Panel", "PILOT Missile Mode")
F_14:definePushButton("PLT_EMERG_STORE_JETT", 55, 3142, 239, "Weapons Panel", "PILOT Emergency Stores Jettison")
F_14:defineRotary("PLT_CLOCK_WIND", 27, 3042, 1051, "Weapons Panel", "PILOT Clock Wind")
F_14:definePushButton("PLT_CLOCK_TIMER", 27, 3043, 1000, "Weapons Panel", "PILOT Clock Timer Start/Stop/Reset")
F_14:defineRotary("RIO_CLOCK_WIND", 27, 3710, 1052, "Weapons Panel", "RIO Clock Wind")
F_14:definePushButton("RIO_CLOCK_TIMER", 27, 3711, 1053, "Weapons Panel", "RIO Clock Timer Start/Stop/Reset")

-- RIO TID
F_14:defineMultipositionSwitch("RIO_TID_MODE", 43, 3112, 2005, 4, 0.33333, "TID", "RIO TID Mode")
F_14:defineTumb("RIO_TID_RANGE", 43, 3113, 2006, 0.5, { -1, 1 }, nil, false, "TID", "RIO TID Range")
F_14:definePushButton("RIO_TID_NON_ATTK", 43, 3114, 226, "TID", "RIO TID Non Attack")
F_14:definePushButton("RIO_TID_JAM_STROBE", 43, 3115, 1118, "TID", "RIO TID Jam Strobe")
F_14:definePushButton("RIO_TID_DATA_LINK", 43, 3116, 1117, "TID", "RIO TID Data Link")
F_14:definePushButton("RIO_TID_SYM_ELEM", 43, 3117, 1116, "TID", "RIO TID Sym Elem")
F_14:definePushButton("RIO_TID_ALT_NUM", 43, 3118, 1115, "TID", "RIO TID Alt Num")
F_14:definePushButton("RIO_TID_RID_DSBL", 43, 3119, 2004, "TID", "RIO TID Reject Image Device disable")
F_14:definePushButton("RIO_TID_LAUNCH_ZONE", 43, 3120, 2113, "TID", "RIO TID Launch Zone")
F_14:definePushButton("RIO_TID_VEL_VECTOR", 43, 3121, 2114, "TID", "RIO TID Velocity Vector")
F_14:definePushButton("RIO_TID_CLSN", 43, 3122, 52, "TID", "RIO TID Collision Steering")
F_14:definePushButton("RIO_TID_TRACKHOLD", 43, 3123, 53, "TID", "RIO TID Track Hold")
F_14:definePotentiometer("RIO_TID_BRIGHT", 43, 3124, 48, { 0, 1 }, "TID", "RIO TID Brightness")
F_14:definePotentiometer("RIO_TID_CONTRAST", 43, 3125, 49, { 0, 1 }, "TID", "RIO TID Contrast")

-- RIO HCU
F_14:defineToggleSwitch("RIO_HCU_TCS", 58, 3096, 2007, "HCU", "RIO HCU TCS Mode")
F_14:defineToggleSwitch("RIO_HCU_RADAR", 58, 3097, 2008, "HCU", "RIO HCU Radar Mode")
F_14:defineToggleSwitch("RIO_HCU_DDD", 58, 3098, 2009, "HCU", "RIO HCU DDD Mode")
F_14:defineToggleSwitch("RIO_HCU_TID", 58, 3099, 2010, "HCU", "RIO HCU TID Mode")
F_14:define3PosTumb("RIO_HCU_TVIR_SW", 37, 3100, 2011, "HCU", "RIO HCU TV/IR Switch")
F_14:define3PosTumb("RIO_HCU_WCS", 39, 3101, 2012, "HCU", "RIO HCU WCS Switch")
F_14:definePushButton("RIO_HCU_PW_RESET", 39, 3644, 2013, "HCU", "RIO HCU Power Reset")
F_14:definePushButton("RIO_HCU_LIGHT_TEST", 39, 3645, 2014, "HCU", "RIO HCU Light Test")

-- RIO DDD
F_14:definePushButton("RIO_RADAR_5", 39, 3450, 40, "DDD", "RIO Radar 5 NM")
F_14:definePushButton("RIO_RADAR_10", 39, 3451, 41, "DDD", "RIO Radar 10 NM")
F_14:definePushButton("RIO_RADAR_20", 39, 3452, 42, "DDD", "RIO Radar 20 NM")
F_14:definePushButton("RIO_RADAR_50", 39, 3453, 43, "DDD", "RIO Radar 50 NM")
F_14:definePushButton("RIO_RADAR_100", 39, 3454, 44, "DDD", "RIO Radar 100 NM")
F_14:definePushButton("RIO_RADAR_200", 39, 3455, 45, "DDD", "RIO Radar 200 NM")
F_14:definePushButton("RIO_RADAR_PULSE", 39, 3457, 10, "DDD", "RIO Radar Pulse Search")
F_14:definePushButton("RIO_RADAR_TWSMAN", 39, 3458, 11, "DDD", "RIO Track While Scan Manual")
F_14:definePushButton("RIO_RADAR_TWSAUTO", 39, 3459, 12, "DDD", "RIO Track While Scan Auto")
F_14:definePushButton("RIO_RADAR_RWS", 39, 3460, 13, "DDD", "RIO Track While Scan")
F_14:definePushButton("RIO_RADAR_PDSRCH", 39, 3461, 14, "DDD", "RIO Radar Pulse Doppler Search")
F_14:definePushButton("RIO_RADAR_PSTT", 39, 3462, 15, "DDD", "RIO Radar Pulse Single Target Track")
F_14:definePushButton("RIO_RADAR_PDSTT", 39, 3463, 9916, "DDD", "RIO Radar Pulse Doppler Target Track")
F_14:definePushButton("RIO_DDD_IFF", 39, 3464, 17, "DDD", "RIO DDD Interrogate Friend or Foe")
F_14:definePushButton("RIO_DDD_IR", 39, 3465, 18, "DDD", "RIO DDD Infrared")
F_14:definePushButton("RIO_DDD_RADAR", 39, 3466, 19, "DDD", "RIO DDD Radar")
F_14:definePushButton("RIO_CCM_SPL", 39, 3686, 1812, "DDD", "RIO CCM SPL")
F_14:definePushButton("RIO_CCM_ALT_DIFF", 39, 3687, 1813, "DDD", "RIO CCM ALT DIFF")
F_14:definePushButton("RIO_CCM_VGS", 39, 3688, 1814, "DDD", "RIO CCM VGS")
F_14:definePotentiometer("RIO_RADAR_IR_GAIN", 39, 3473, 20, { 0, 1 }, "DDD", "RIO Radar IR Gain")
F_14:definePotentiometer("RIO_RADAR_IR_VOL", 39, 3474, 21, { 0, 1 }, "DDD", "RIO Radar IR Volume")
F_14:definePotentiometer("RIO_RADAR_IR_THERESHOLD", 39, 3475, 22, { 0, 1 }, "DDD", "RIO Radar IR Threshold")
F_14:definePotentiometer("RIO_DDD_BRIGHT", 39, 3476, 23, { 0, 1 }, "DDD", "RIO DDD Brightness")
F_14:definePotentiometer("RIO_DDD_PULSE_VID", 39, 3477, 24, { 0, 1 }, "DDD", "RIO DDD Pulse Video")
F_14:definePotentiometer("RIO_DDD_ERASE", 39, 3478, 25, { 0, 1 }, "DDD", "RIO DDD Erase")
F_14:definePotentiometer("RIO_DDD_PULSE_GAIN", 39, 3479, 26, { 0, 1 }, "DDD", "RIO Pulse Gain")
F_14:definePotentiometer("RIO_ACM_THERESHOLD", 39, 3480, 27, { 0, 1 }, "DDD", "RIO ACM Threshold")
F_14:definePotentiometer("RIO_RADAR_JAMJET", 39, 3481, 28, { 0, 1 }, "DDD", "RIO JAM/JET")
F_14:definePotentiometer("RIO_PD_THERESHOLD_CLUTTER", 39, 3482, 29, { 0, 1 }, "DDD", "RIO PD Threshold Clutter")
F_14:definePotentiometer("RIO_PD_THERESHOLD_CLEAR", 39, 3483, 30, { 0, 1 }, "DDD", "RIO PD Threshold Clear")
F_14:define3PosTumb("RIO_DDD_ASPECT", 39, 3467, 34, "DDD", "RIO DDD Aspect")
F_14:define3PosTumb("RIO_DDD_VC_SCALE", 39, 3468, 35, "DDD", "RIO DDD Closing Velocity Scale")
F_14:define3PosTumb("RIO_DDD_TGTS", 39, 3469, 36, "DDD", "RIO DDD Target Size")
F_14:define3PosTumb("RIO_DDD_MLC", 39, 3470, 37, "DDD", "RIO DDD Main Lobe Clutter Filter")
F_14:defineToggleSwitch("RIO_DDD_AGC", 39, 3471, 38, "DDD", "RIO DDD Automatic Gain Control")
F_14:defineToggleSwitch("RIO_DDD_PARA_AMP", 39, 3472, 3900, "DDD", "RIO DDD Parametric Amplifier")

-- RIO RADAR Panel
F_14:defineMultipositionSwitch("RIO_RADAR_ELE_BARS", 39, 3442, 79, 4, 0.33333, "Radar", "RIO Radar Elevation Scan")
F_14:defineMultipositionSwitch("RIO_RADAR_AZI_SCAN", 39, 3443, 80, 4, 0.33333, "Radar", "RIO Radar Azimuth Scan")
F_14:definePotentiometer("RIO_RADAR_ELE_CENTER", 39, 3446, 81, { -1, 1 }, "Radar", "RIO Radar Elevation Center")
F_14:definePotentiometer("RIO_RADAR_AZI_CENTER", 39, 3447, 82, { -1, 1 }, "Radar", "RIO Radar Azimuth Center")
F_14:defineToggleSwitch("RIO_RADAR_STABI", 39, 3449, 83, "Radar", "RIO Radar Stabilize")
F_14:define3PosTumb("RIO_RADAR_VSL", 39, 3448, 84, "Radar", "RIO Radar VSL Switch")

-- RIO TCS Controls
F_14:define3PosTumb("RIO_TCS_ACQ", 38, 3495, 87, "TCS", "RIO TCS Acquisition")
F_14:defineToggleSwitch("RIO_TCS_FOV", 38, 3494, 88, "TCS", "RIO TCS FOV")
F_14:define3PosTumb("RIO_TCS_SLAVE", 38, 3496, 89, "TCS", "RIO TCS Slave")
F_14:define3PosTumb("RIO_RECORD_PW", 38, 3617, 90, "TCS", "RIO Record Power")
F_14:defineMultipositionSwitch("RIO_RECORD_MODE", 38, 3618, 91, 5, 1.0 / 4.0, "TCS", "RIO Record Mode")
F_14:definePotentiometer("RIO_RECORD_RESET", 38, 3622, 16016, { 0, 1 }, "Radar", "RIO Record Reset")

-- RIO Armament Panel
F_14:defineMultipositionSwitch("RIO_WEAPON_TYPE", 55, 3146, 59, 44, 1.0 / 43.0, "Armament Panel", "RIO Weapon Type Wheel")
F_14:defineTumb("RIO_WEAPON_INTER_10", 55, 3148, 9960, 0.111, { 0, 1 }, nil, false, "Armament Panel", "RIO Weapon Interval x10ms")
F_14:defineTumb("RIO_WEAPON_INTER_100", 55, 3147, 9961, 0.111, { 0, 1 }, nil, false, "Armament Panel", "RIO Weapon Interval x100ms")
F_14:defineTumb("RIO_WEAPON_QUANT_10", 55, 3149, 9962, 0.111, { 0, 1 }, nil, false, "Armament Panel", "RIO Weapon Quantity 10s")
F_14:defineTumb("RIO_WEAPON_QUANTR_1", 55, 3150, 9963, 0.111, { 0, 1 }, nil, false, "Armament Panel", "RIO Weapon Quantity 1s")
F_14:defineMultipositionSwitch("RIO_WEAPON_ATTK_MODE", 55, 3151, 2022, 5, 0.25, "Armament Panel", "RIO Weapon Attack Mode")
F_14:defineMultipositionSwitch("RIO_WEAPON_ELEC_FUSE", 55, 3152, 58, 5, 0.25, "Armament Panel", "RIO Weapon Elec Fuse")
F_14:defineMultipositionSwitch("RIO_WEAPON_MSL_SPD", 55, 3153, 72, 6, 0.2, "Armament Panel", "RIO Weapon Missile Speed Gate")
F_14:define3PosTumb("RIO_WEAPON_SEL_JETT", 55, 3154, 78, "Armament Panel", "RIO Weapon Selective Jettison")
F_14:defineToggleSwitch("RIO_WEAPON_SEL_JETT_COVER", 55, 3668, 1069, "Armament Panel", "RIO Weapon Selective Jettison Aux Guard")
F_14:define3PosTumb("RIO_WEAPON_MECH_FUSE", 55, 3155, 63, "Armament Panel", "RIO RIO Weapon Mech Fuse")
F_14:define3PosTumb("RIO_WEAPON_MSL_OPT", 55, 3156, 75, "Armament Panel", "RIO RIO Weapon Missile Option")
F_14:defineToggleSwitch("RIO_WEAPON_BOMB_SINGLE", 55, 3157, 60, "Armament Panel", "RIO Weapon Bomb Single/Pairs")
F_14:defineToggleSwitch("RIO_WEAPON_BOMB_STEP", 55, 3158, 61, "Armament Panel", "RIO Weapon Bomb Step/Ripple")
F_14:defineToggleSwitch("RIO_WEAPON_AG_GUN", 55, 3159, 62, "Armament Panel", "RIO Weapon A/G Gun Mode")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_RACK", 55, 3160, 66, "Armament Panel", "RIO Weapon Jettison Racks/Weapons")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_TANK_L", 55, 3164, 73, "Armament Panel", "RIO Weapon Jettison Left Tank")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_TANK_R", 55, 3169, 67, "Armament Panel", "RIO Weapon Jettison Right Tank")
F_14:define3PosTumb("RIO_WEAPON_JETT_STAT_1", 55, 3163, 68, "Armament Panel", "RIO Weapon Jettison Station 1")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_STAT_3", 55, 3165, 65, "Armament Panel", "RIO Weapon Jettison Station 3")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_STAT_4", 55, 3166, 69, "Armament Panel", "RIO Weapon Jettison Station 4")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_STAT_5", 55, 3167, 70, "Armament Panel", "RIO Weapon Jettison Station 5")
F_14:defineToggleSwitch("RIO_WEAPON_JETT_STAT_6", 55, 3168, 64, "Armament Panel", "RIO Weapon Jettison Station 6")
F_14:define3PosTumb("RIO_WEAPON_JETT_STAT_8", 55, 3170, 71, "Armament Panel", "RIO Weapon Jettison Station 8")
F_14:definePushButton("RIO_WEAPON_AA_LAUNCH", 55, 3161, 74, "Armament Panel", "RIO Weapon A/A Launch")
F_14:definePushButton("RIO_WEAPON_NEXT_LAUNCH", 43, 3162, 9964, "Armament Panel", "RIO Weapon Next Launch")

-- Computer Address Panel (CAP)
F_14:defineMultipositionSwitch("RIO_CAP_CATRGORY", 24, 3530, 98, 6, 0.2, "CAP", "RIO CAP Category")
F_14:definePushButton("RIO_CAP_BTN_4", 24, 3521, 124, "CAP", "RIO CAP Button 4")
F_14:definePushButton("RIO_CAP_BTN_5", 24, 3522, 123, "CAP", "RIO CAP Button 5")
F_14:definePushButton("RIO_CAP_BTN_3", 24, 3520, 125, "CAP", "RIO CAP Button 3")
F_14:definePushButton("RIO_CAP_BTN_2", 24, 3519, 126, "CAP", "RIO CAP Button 2")
F_14:definePushButton("RIO_CAP_BTN_1", 24, 3518, 127, "CAP", "RIO CAP Button 1")
F_14:definePushButton("RIO_CAP_BTN_TNG", 24, 3528, 128, "CAP", "RIO CAP Button TNG NBR")
F_14:definePushButton("RIO_CAP_BTN_10", 24, 3527, 129, "CAP", "RIO CAP Button 10")
F_14:definePushButton("RIO_CAP_BTN_9", 24, 3526, 130, "CAP", "RIO CAP Button 9")
F_14:definePushButton("RIO_CAP_BTN_8", 24, 3525, 131, "CAP", "RIO CAP Button 8")
F_14:definePushButton("RIO_CAP_BTN_7", 24, 3524, 132, "CAP", "RIO CAP Button 7")
F_14:definePushButton("RIO_CAP_BTN_6", 24, 3523, 133, "CAP", "RIO CAP Button 6")
F_14:definePushButton("RIO_CAP_BTN_PGM_RESTRT", 24, 3529, 134, "CAP", "RIO CAP Button PGM RSTRT")
F_14:definePushButton("RIO_CAP_LONG_6", 24, 3541, 136, "CAP", "RIO CAP LONG 6")
F_14:definePushButton("RIO_CAP_LAT_1", 24, 3536, 137, "CAP", "RIO CAP LAT 1")
F_14:definePushButton("RIO_CAP_NBR_2", 24, 3537, 138, "CAP", "RIO CAP NBR 2")
F_14:definePushButton("RIO_CAP_7", 24, 3542, 139, "CAP", "RIO CAP 7")
F_14:definePushButton("RIO_CAP_HDG_8", 24, 3543, 140, "CAP", "RIO CAP HDG 8")
F_14:definePushButton("RIO_CAP_SPD_3", 24, 3538, 141, "CAP", "RIO CAP SPD 3")
F_14:definePushButton("RIO_CAP_ALT_4", 24, 3539, 143, "CAP", "RIO CAP ALT 4")
F_14:definePushButton("RIO_CAP_9", 24, 3544, 142, "CAP", "RIO CAP 9")
F_14:definePushButton("RIO_CAP_BRG_0", 24, 3535, 144, "CAP", "RIO CAP BRG 0")
F_14:definePushButton("RIO_CAP_RNG_5", 24, 3540, 145, "CAP", "RIO CAP RNG 5")
F_14:definePushButton("RIO_CAP_NE", 24, 3533, 146, "CAP", "RIO CAP N+E")
F_14:definePushButton("RIO_CAP_SW", 24, 3532, 147, "CAP", "RIO CAP S-W")
F_14:definePushButton("RIO_CAP_CLEAR", 24, 3531, 148, "CAP", "RIO CAP Clear")
F_14:definePushButton("RIO_CAP_ENTER", 24, 3534, 149, "CAP", "RIO CAP Enter")

-- Datalink
F_14:define3PosTumb("RIO_DATALINK_PW", 52, 3602, 413, "Datalink", "RIO Datalink Power")
F_14:defineToggleSwitch("RIO_DATALINK_ANT", 52, 3603, 175, "Datalink", "RIO Datalink Antenna")
F_14:defineToggleSwitch("RIO_DATALINK_REPLY", 52, 3604, 176, "Datalink", "RIO Datalink Reply")
F_14:defineToggleSwitch("RIO_DATALINK_CAINS", 52, 3605, 177, "Datalink", "RIO Datalink CAINS/TAC")
F_14:define3PosTumb("RIO_DATALINK_ANTIJAM", 52, 3598, 191, "Datalink", "RIO Datalink Antijam")
F_14:defineTumb("RIO_DATALINK_FREQ_10", 52, 3599, 196, 0.111, { 0, 1 }, nil, false, "Datalink", "RIO Datalink Freq 10MHz")
F_14:defineTumb("RIO_DATALINK_FREQ_1", 52, 3600, 195, 0.111, { 0, 1 }, nil, false, "Datalink", "RIO Datalink Freq 1MHz")
F_14:defineTumb("RIO_DATALINK_FREQ_100", 52, 3601, 197, 0.111, { 0, 1 }, nil, false, "Datalink", "RIO Datalink Freq 100kHz")
F_14:defineTumb("RIO_DATALINK_ADDR_HI", 52, 3606, 222, 0.111, { 0, 1 }, nil, false, "Datalink", "RIO Datalink Address High")
F_14:defineTumb("RIO_DATALINK_ADDR_LO", 52, 3607, 223, 0.111, { 0, 1 }, nil, false, "Datalink", "RIO Datalink Address Low")
F_14:defineMultipositionSwitch("RIO_BEACON_MODE", 52, 3693, 118, 7, 0.1666667, "Datalink", "RIO Beacon Mode")
F_14:definePushButton("RIO_BEACON_ACLS", 52, 3692, 117, "Datalink", "RIO Beacon ACLS Test")
F_14:define3PosTumb("RIO_BEACON_PW", 52, 3691, 96, "Datalink", "RIO Beacon Power")

-- IFF Panel
F_14:define3PosTumb("RIO_IFF_AUDIOLIGHT", 64, 3626, 161, "IFF", "RIO IFF Audio/Light")
F_14:define3PosTumb("RIO_IFF_M1", 64, 3627, 162, "IFF", "RIO IFF M1")
F_14:define3PosTumb("RIO_IFF_M2", 64, 3628, 163, "IFF", "RIO IFF M2")
F_14:define3PosTumb("RIO_IFF_M3A", 64, 3629, 164, "IFF", "RIO IFF M3/A")
F_14:define3PosTumb("RIO_IFF_MC", 64, 3630, 165, "IFF", "RIO IFF MC")
F_14:define3PosTumb("RIO_IFF_RAD", 64, 3631, 166, "IFF", "RIO IFF RAD")
F_14:define3PosTumb("RIO_IFF_IDENT", 64, 3632, 167, "IFF", "RIO IFF Ident")
F_14:defineToggleSwitch("RIO_IFF_M4", 64, 3633, 181, "IFF", "RIO IFF M4")
F_14:defineMultipositionSwitch("RIO_IFF_CODE", 64, 3634, 183, 4, 1.0 / 3.0, "IFF", "RIO IFF Code")
F_14:defineMultipositionSwitch("RIO_IFF_MASTER", 64, 3635, 184, 5, 1.0 / 4.0, "IFF", "RIO IFF Master")
F_14:definePushButton("RIO_IFF_TEST", 64, 3636, 185, "IFF", "RIO IFF Test")
F_14:definePushButton("RIO_IFF_REPLY", 64, 3637, 186, "IFF", "RIO IFF Reply")
F_14:defineTumb("RIO_IFF_M3_1", 64, 3638, 2262, 0.111, { 0, 1 }, nil, false, "IFF", "RIO IFF M3 Code 1s")
F_14:defineTumb("RIO_IFF_M3_10", 64, 3639, 2261, 0.111, { 0, 1 }, nil, false, "IFF", "RIO IFF M3 Code 10s")
F_14:defineTumb("RIO_IFF_M3_100", 64, 3640, 198, 0.111, { 0, 1 }, nil, false, "IFF", "RIO IFF M3 Code 100s")
F_14:defineTumb("RIO_IFF_M3_1000", 64, 3641, 199, 0.111, { 0, 1 }, nil, false, "IFF", "RIO IFF M3 Code 1000s")
F_14:defineTumb("RIO_IFF_M1_1", 64, 3642, 200, 0.111, { 0, 1 }, nil, false, "IFF", "RIO IFF M1 Code 1s")
F_14:defineTumb("RIO_IFF_M1_10", 64, 3643, 201, 0.111, { 0, 1 }, nil, false, "IFF", "RIO IFF M1 Code 10s")

-- LIQUID Cooling
F_14:define3PosTumb("RIO_LIQUD_COOL", 39, 3694, 95, "Radar Panel", "RIO Liquid Cooling Switch")

-- LANTIRN (Panel Arg:666)
F_14:defineMultipositionSwitch("RIO_LANTIRN_PW", 7, 3689, 667, 3, 1.0 / 2.0, "LANTIRN", "RIO LANTIRN Power")
F_14:defineToggleSwitch("RIO_LANTIRN_LASER_ARM", 7, 3516, 668, "LANTIRN", "RIO LANTIRN Laser Arm Switch")
F_14:definePushButton("RIO_LANTIRN_UNSTOW", 7, 3704, 669, "LANTIRN", "RIO LANTIRN Operate Mode (Unstow)")
F_14:definePushButton("RIO_LANTIRN_TCS_SEL", 7, 3498, 670, "LANTIRN", "RIO Video Output Toggle (TCS/LANTIRN)")
F_14:definePushButton("RIO_LANTIRN_IBIT", 7, 3690, 671, "LANTIRN", "RIO LANTIRN IBIT")
F_14:defineIndicatorLightLANTTop("RIO_LANTIRN_1_OPER", 673, "LANTIRN", "RIO LANTIRN STBY Light (TOP) (green)")
F_14:defineIndicatorLightLANT("RIO_LANTIRN_2_OPERSTBY", 673, "LANTIRN", "RIO LANTIRN OPER STBY Light (BOOTH) (green)")
F_14:defineIndicatorLightLANTBottom("RIO_LANTIRN_3_STBY", 673, "LANTIRN", "RIO LANTIRN STBY Light (BOTTOM) (green)")
F_14:defineIndicatorLightLANTTop("RIO_LANTIRN_1_IMU", 674, "LANTIRN", "RIO LANTIRN IMU Light (TOP) (green)")
F_14:defineIndicatorLightLANT("RIO_LANTIRN_2_IMUGPS", 674, "LANTIRN", "RIO LANTIRN IMU GPS Light (BOOTH) (green)")
F_14:defineIndicatorLightLANTBottom("RIO_LANTIRN_3_GPS", 674, "LANTIRN", "RIO LANTIRN GPS Light (BOTTOM) (green)")
F_14:defineIndicatorLightLANTTop("RIO_LANTIRN_1_LGP", 675, "LANTIRN", "RIO LANTIRN LGP Light (TOP) (green)")
F_14:defineIndicatorLightLANT("RIO_LANTIRN_2_LGPFLIR", 675, "LANTIRN", "RIO LANTIRN LGP FLIR Light (BOOTH) (green)")
F_14:defineIndicatorLightLANTBottom("RIO_LANTIRN_3_FLIR", 675, "LANTIRN", "RIO LANTIRN FLIR Light (BOTTOM) (green)")
F_14:defineIndicatorLightLANTTop("RIO_LANTIRN_1_MUX", 676, "LANTIRN", "RIO LANTIRN MUX Light (TOP) (green)")
F_14:defineIndicatorLightLANT("RIO_LANTIRN_2_MUXEGU", 676, "LANTIRN", "RIO LANTIRN MUX EGU Light (BOOTH) (green)")
F_14:defineIndicatorLightLANTBottom("RIO_LANTIRN_3_EGU", 676, "LANTIRN", "RIO LANTIRN EGU Light (BOTTOM) (green)")
F_14:defineIndicatorLightLANTTop("RIO_LANTIRN_1_LASER", 677, "LANTIRN", "RIO LANTIRN SERVO Light (TOP) (green)")
F_14:defineIndicatorLightLANT("RIO_LANTIRN_2_LASERSERVO", 677, "LANTIRN", "RIO LANTIRN LASER SERVO Light (BOOTH) (green)")
F_14:defineIndicatorLightLANTBottom("RIO_LANTIRN_3_SERVO", 677, "LANTIRN", "RIO LANTIRN SERVO Light (BOTTOM) (green)")
F_14:defineIndicatorLightLANTTop("RIO_LANTIRN_1_FLIR", 678, "LANTIRN", "RIO LANTIRN FLIR Light (TOP) (green)")
F_14:defineIndicatorLightLANT("RIO_LANTIRN_2_FLIRTCS", 678, "LANTIRN", "RIO LANTIRN FLIR TCS Light (BOOTH) (green)")
F_14:defineIndicatorLightLANTBottom("RIO_LANTIRN_3_TCS", 678, "LANTIRN", "RIO LANTIRN TCS Light (BOTTOM) (green)")
F_14:defineIndicatorLightRed("RIO_LANTIRN_IBIT_L", 679, "LANTIRN", "RIO LANTIRN IBIT Light (green)")
F_14:defineIndicatorLightRed("RIO_LANTIRN_LASERARMED", 680, "LANTIRN", "RIO LANTIRN LASER ARMED Light (green)")

-- Indicator Lights PLT
F_14:defineIndicatorLight("PLT_TACAN_COMAND_PLT", 290, "PLT Indicator Lights", "PILOT TACAN Command Light PLT (green)")
F_14:defineIndicatorLight("PLT_TACAN_COMAND_NFO", 291, "PLT Indicator Lights", "PILOT TACAN Command Light NFO (green)")
F_14:defineIndicatorLight("PLT_JETT_LIGHT", 701, "PLT Indicator Lights", "PILOT Emergency Stores Jettison Light (red)")
F_14:defineIndicatorLight("PLT_FLOOD_LIGHTS", 1800, "PLT Indicator Lights", "PILOT Flood Lights Red (red)")
F_14:defineIndicatorLight("PLT_PANEL_LIGHTS", 1801, "PLT Indicator Lights", "PILOT Panel Lights (red) inverted")
F_14:defineIndicatorLight("PLT_INSTRUMENT_LIGHTS", 1802, "PLT Indicator Lights", "PILOT Instrument Lights (red) inverted")
F_14:defineIndicatorLight("PLT_FLOOD_LIGHTS_W", 1803, "PLT Indicator Lights", "PILOT Flood Lights White (white)")
F_14:defineIndicatorLight("PLT_AOA_SLOW", 3760, "PLT Indicator Lights", "PILOT AOA Slow (green)")
F_14:defineIndicatorLight("PLT_AOA_OPT", 3761, "PLT Indicator Lights", "PILOT AOA Optimum (yellow)")
F_14:defineIndicatorLight("PLT_AOA_FAST", 3762, "PLT Indicator Lights", "PILOT AOA Fast (red)")
F_14:defineIndicatorLight("PLT_TACAN_GO", 8050, "PLT Indicator Lights", "PILOT TACAN GO Light (green)")
F_14:defineIndicatorLight("PLT_TACAN_NOGO", 8051, "PLT Indicator Lights", "PILOT TACAN NOGO Light (red)")
F_14:defineIndicatorLight("PLT_MASTER_CAUTION", 9200, "PLT Indicator Lights", "PILOT Weapon Panel Master Caution Light (red)")
F_14:defineIndicatorLight("PLT_HOT_TRIGGER", 9201, "PLT Indicator Lights", "PILOT Weapon Panel Hot Trigger Light (red)")
F_14:defineIndicatorLight("PLT_COLLISION_LIGHT", 9202, "PLT Indicator Lights", "PILOT Weapon Panel Collision Light (green)")
F_14:defineIndicatorLight("PLT_SEAM_LOCK", 9203, "PLT Indicator Lights", "PILOT Weapon Panel SEAM Lock Light (green)")
F_14:defineIndicatorLight("PLT_GUN_RATE_HIGH", 9204, "PLT Indicator Lights", "PILOT Weapon Panel Gunrate High Light (red)")
F_14:defineIndicatorLight("PLT_GUN_RATE_LOW", 9205, "PLT Indicator Lights", "PILOT Weapon Panel Gunrate Low Light (red)")
F_14:defineIndicatorLight("PLT_SW_COOL_ON", 9206, "PLT Indicator Lights", "PILOT Weapon Panel Sidewinder Cooling ON Light (red)")
F_14:defineIndicatorLight("PLT_SW_COOL_OFF", 9207, "PLT Indicator Lights", "PILOT Weapon Panel Sidewinder Cooling OFF Light (red)")
F_14:defineIndicatorLight("PLT_MSL_PREP_ON", 9208, "PLT Indicator Lights", "PILOT Weapon Panel Missle Prepare ON Light (red)")
F_14:defineIndicatorLight("PLT_MSL_PREP_OFF", 9209, "PLT Indicator Lights", "PILOT Weapon Panel Missle Prepare OFF Light (red)")
F_14:defineIndicatorLight("PLT_MSL_MODE_NORM", 9210, "PLT Indicator Lights", "PILOT Weapon Panel Missle Mode Normal Light (red)")
F_14:defineIndicatorLight("PLT_MSL_MODE_BORE", 9211, "PLT Indicator Lights", "PILOT Weapon Panel Missle Mode Boresight Light (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_WHEELS", 9350, "PLT Indicator Lights", "PILOT HUD Light Wheels (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_BRAKES", 9351, "PLT Indicator Lights", "PILOT HUD Light Brakes (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_ACLSAP", 9352, "PLT Indicator Lights", "PILOT HUD Light ACLS/AP (yellow)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_NWS", 9353, "PLT Indicator Lights", "PILOT HUD Light NWS Enga (yellow)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_AUTOTHR", 9354, "PLT Indicator Lights", "PILOT HUD Light Auto Throttle (yellow)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_RSTALL", 9355, "PLT Indicator Lights", "PILOT HUD Right Stall (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_LSTALL", 9356, "PLT Indicator Lights", "PILOT HUD Left Stall (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_SAM", 9357, "PLT Indicator Lights", "PILOT HUD SAM (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_AAA", 9358, "PLT Indicator Lights", "PILOT HUD AAA (red)")
F_14:defineIndicatorLight("PLT_HUD_LIGHT_AI", 9359, "PLT Indicator Lights", "PILOT HUD AI (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_ADJAC", 9360, "PLT Indicator Lights", "PILOT VDI ADJ A/C Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_LANDCHK", 9361, "PLT Indicator Lights", "PILOT VDI LANDING CHK Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_ACLRDY", 9362, "PLT Indicator Lights", "PILOT VDI ACL READY Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_APCLR", 9363, "PLT Indicator Lights", "PILOT VDI A/P CPLR Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_CMDCON", 9364, "PLT Indicator Lights", "PILOT VDI CMD CONTROL Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_10SEC", 9365, "PLT Indicator Lights", "PILOT VDI 10 SECONDS Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_TILT", 9366, "PLT Indicator Lights", "PILOT VDI TILT Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_VOICE", 9367, "PLT Indicator Lights", "PILOT VDI VOICE Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_AUTOTH", 9368, "PLT Indicator Lights", "PILOT VDI AUTO THRO Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_APREF", 9369, "PLT Indicator Lights", "PILOT VDI A/P REF Light (red)")
F_14:defineIndicatorLight("PLT_GEAR_LIGHT", 15001, "PLT Indicator Lights", "PILOT Landing Gear Light (red)")
F_14:defineIndicatorLight("PLT_REFUELPROBE_LIGHT", 15002, "PLT Indicator Lights", "PILOT Refuel Probe Light (red)")
F_14:defineIndicatorLight("PLT_MASTERTEST_GO", 15010, "PLT Indicator Lights", "PILOT MASTER TEST GO Light (green)")
F_14:defineIndicatorLight("PLT_MASTERTEST_NOGO", 15011, "PLT Indicator Lights", "PILOT MASTER TEST NOGO Light (red)")
F_14:defineIndicatorLight("PLT_R_ENG_FIRE", 15014, "PLT Indicator Lights", "PILOT Right Engine Fire Light (red)")
F_14:defineIndicatorLight("PLT_L_ENG_FIRE", 15015, "PLT Indicator Lights", "PILOT Left Engine Fire Light (red)")
F_14:defineIndicatorLight("PLT_WARN_LGEN", 15016, "PLT Indicator Lights", "PILOT Warning Lamp Left Generator (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LOILHOT", 15017, "PLT Indicator Lights", "PILOT Warning Lamp Left Oil Hot (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LFUELPRESS", 15018, "PLT Indicator Lights", "PILOT Warning Lamp Left Fuel Pressure (yellow)")
F_14:defineIndicatorLight("PLT_WARN_ENGFIREEXT", 15019, "PLT Indicator Lights", "PILOT Warning Lamp Engine Fire Extinguisher (green)")
F_14:defineIndicatorLight("PLT_WARN_RGEN", 15020, "PLT Indicator Lights", "PILOT Warning Lamp Right Generator (yellow)")
F_14:defineIndicatorLight("PLT_WARN_ROILHOT", 15022, "PLT Indicator Lights", "PILOT Warning Lamp Right Oil Hot (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RFUELPRESS", 15021, "PLT Indicator Lights", "PILOT Warning Lamp Right Fuel Pressure (yellow)")
F_14:defineIndicatorLight("PLT_WARN_WINGSWEEP", 15023, "PLT Indicator Lights", "PILOT Warning Lamp Wing Sweep (green)")
F_14:defineIndicatorLight("PLT_WARN_AUXFIREEXT", 15024, "PLT Indicator Lights", "PILOT Warning Lamp Auxiliary Fire Extinguisher (green)")
F_14:defineIndicatorLight("PLT_WARN_YAWSTABOP", 15025, "PLT Indicator Lights", "PILOT Warning Lamp Yaw Stabilizer Op (yellow)")
F_14:defineIndicatorLight("PLT_WARN_YAWSTABOUT", 15026, "PLT Indicator Lights", "PILOT Warning Lamp Yaw Stabilizer Out (yellow)")
F_14:defineIndicatorLight("PLT_WARN_CANOPY", 15027, "PLT Indicator Lights", "PILOT Warning Lamp Canopy (yellow)")
F_14:defineIndicatorLight("PLT_WARN_CADC", 15028, "PLT Indicator Lights", "PILOT Warning Lamp CADC (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LFUELLOW", 15029, "PLT Indicator Lights", "PILOT Warning Lamp Left Fuel Low (yellow)")
F_14:defineIndicatorLight("PLT_WARN_WSHIELDHOT", 15030, "PLT Indicator Lights", "PILOT Warning Lamp Windshield Hot (green)")
F_14:defineIndicatorLight("PLT_WARN_EMERGJETT", 15031, "PLT Indicator Lights", "PILOT Warning Lamp Emergency Jettison (yellow)")
F_14:defineIndicatorLight("PLT_WARN_OXYLOW", 15032, "PLT Indicator Lights", "PILOT Warning Lamp Qxygen Low (yellow)")
F_14:defineIndicatorLight("PLT_WARN_BINGO", 15033, "PLT Indicator Lights", "PILOT Warning Lamp Bingo Fuel (yellow)")
F_14:defineIndicatorLight("PLT_WARN_HYDPRESS", 15034, "PLT Indicator Lights", "PILOT Warning Lamp Hydraulic Pressure (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RFUELLOW", 15035, "PLT Indicator Lights", "PILOT Warning Lamp Right Fuel Low (yellow)")
F_14:defineIndicatorLight("PLT_WARN_MACHTRIM", 15036, "PLT Indicator Lights", "PILOT Warning Lamp Mach Trim (green)")
F_14:defineIndicatorLight("PLT_WARN_PITCHSTAB", 15037, "PLT Indicator Lights", "PILOT Warning Lamp Pitch Stabilizer (yellow)")
F_14:defineIndicatorLight("PLT_WARN_BLEEDDUCT", 15038, "PLT Indicator Lights", "PILOT Warning Lamp Bleed Duct (yellow)")
F_14:defineIndicatorLight("PLT_WARN_ROLLSTAB", 15039, "PLT Indicator Lights", "PILOT Warning Lamp Roll Stabilizer (yellow)")
F_14:defineIndicatorLight("PLT_WARN_PITCHSTAB2", 15040, "PLT Indicator Lights", "PILOT Warning Lamp Pitch Stabilizer 2 (yellow)")
F_14:defineIndicatorLight("PLT_WARN_AUTOPLT", 15041, "PLT Indicator Lights", "PILOT Warning Lamp Autopilot (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LOVSPVALVE", 15042, "PLT Indicator Lights", "PILOT Warning Lamp Left Ovsp Valve (yellow)")
F_14:defineIndicatorLight("PLT_WARN_ROVSPVALVE", 15043, "PLT Indicator Lights", "PILOT Warning Lamp Right Ovsp Valve (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RRAMP", 15044, "PLT Indicator Lights", "PILOT Warning Lamp Right Ramp (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LAUNCHBAR", 15045, "PLT Indicator Lights", "PILOT Warning Lamp Launchbar (green)")
F_14:defineIndicatorLight("PLT_WARN_FLAP", 15046, "PLT Indicator Lights", "PILOT Warning Lamp Flap (yellow)")
F_14:defineIndicatorLight("PLT_WARN_HZTAILAUTH", 15047, "PLT Indicator Lights", "PILOT Warning Lamp Horizontal Tail Auth (yellow)")
F_14:defineIndicatorLight("PLT_WARN_OILPRESS", 15048, "PLT Indicator Lights", "PILOT Warning Lamp Oil Pressure (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LRAMP", 15049, "PLT Indicator Lights", "PILOT Warning Lamp Left Ramp (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LADDER", 15050, "PLT Indicator Lights", "PILOT Warning Lamp Ladder (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RINLET", 15051, "PLT Indicator Lights", "PILOT Warning Lamp Right Inlet (yellow)")
F_14:defineIndicatorLight("PLT_WARN_INLETICE", 15052, "PLT Indicator Lights", "PILOT Warning Lamp Inlet Ice (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RUDDERAUTH", 15053, "PLT Indicator Lights", "PILOT Warning Lamp Rudder Auth (yellow)")
F_14:defineIndicatorLight("PLT_WARN_LINLET", 15054, "PLT Indicator Lights", "PILOT Warning Lamp Left Inlet (yellow)")
F_14:defineIndicatorLight("PLT_WARN_ANRS", 15055, "PLT Indicator Lights", "PILOT Warning Lamp ANRS (green)")
F_14:defineIndicatorLight("PLT_WARN_ROLLSTAB2", 15056, "PLT Indicator Lights", "PILOT Warning Lamp Roll Stabilizer 2 (yellow)")
F_14:defineIndicatorLight("PLT_WARN_SPOILERS", 15057, "PLT Indicator Lights", "PILOT Warning Lamp Spoilers (yellow)")
F_14:defineIndicatorLight("PLT_WARN_TRANSRECT", 15058, "PLT Indicator Lights", "PILOT Warning Lamp Trans Rect (green)")
F_14:defineIndicatorLight("PLT_WARN_REDUCESPEED", 15059, "PLT Indicator Lights", "PILOT Warning Lamp Reduce Speed (yellow)")
F_14:defineIndicatorLight("PLT_WARN_INTERTRIM", 15060, "PLT Indicator Lights", "PILOT Warning Lamp Inter Trim (green)")
F_14:defineIndicatorLight("PLT_WARN_LENGSEC", 15061, "PLT Indicator Lights", "PILOT Warning Lamp Left Engine Secondary (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RATS", 15062, "PLT Indicator Lights", "PILOT Warning Lamp RATS (green)")
F_14:defineIndicatorLight("PLT_WARN_STARTVALVE", 15063, "PLT Indicator Lights", "PILOT Warning Lamp Start Valve (yellow)")
F_14:defineIndicatorLight("PLT_WARN_RENGSEC", 15064, "PLT Indicator Lights", "PILOT Warning Lamp Right Engine Secondary (yellow)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_WAVEOFF", 15070, "PLT Indicator Lights", "PILOT VDI WAVE OFF Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_WINGSWEEP", 15071, "PLT Indicator Lights", "PILOT VDI WING SWEEP Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_REDUCESPD", 15072, "PLT Indicator Lights", "PILOT VDI REDUCE SPD Light (red)")
F_14:defineIndicatorLight("PLT_VDI_LIGHT_ALTLOW", 15073, "PLT Indicator Lights", "PILOT VDI ALT LOW Light (red)")
F_14:defineIndicatorLight("PLT_HOOK_LIGHT", 15090, "PLT Indicator Lights", "PILOT Hook Light (red)")
F_14:defineIndicatorLight("PLT_RADAR_ALT_LIGHT", 19107, "PLT Indicator Lights", "PILOT Radar Altimeter Warning Light (red)")
F_14:defineIndicatorLight("PLT_RADAR_ALT_TEST_LIGHT", 681, "PLT Indicator Lights", "PILOT Radar Altimeter Test Light (green)")
F_14:defineIndicatorLight("PLT_SLATS_IND_LIGHT", 8310, "Gauges as Light", "PILOT Slats Indicator as Light")
F_14:defineIndicatorLight("PLT_FLAPS_IND_LIGHT", 8311, "Gauges as Light", "PILOT Flaps Indicator as Light")
F_14:defineIndicatorLight("PLT_SPDBRK_IND_LIGHT", 8307, "Gauges as Light", "PILOT Speedbrake Indicator as Light")
F_14:defineIndicatorLight("PLT_SPDBRK_FULL_LIGHT", 8308, "Gauges as Light", "PILOT Speedbrake Full Indicator as Light")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_1A_STORE_L", 9221, "Gauges as Light", "PILOT Weapon Store 1A as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_1B_STORE_L", 9222, "Gauges as Light", "PILOT Weapon Store 1B as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_3_STORE_L", 9223, "Gauges as Light", "PILOT Weapon Store 3 as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_4_STORE_L", 9224, "Gauges as Light", "PILOT Weapon Store 4 as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_5_STORE_L", 9225, "Gauges as Light", "PILOT Weapon Store 5 as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_6_STORE_L", 9226, "Gauges as Light", "PILOT Weapon Store 6 as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_8B_STORE_L", 9227, "Gauges as Light", "PILOT Weapon Store 8B as Light (STORE)")
F_14:defineIndicatorLightRed("PLT_WEAPON_STORE_8A_STORE_L", 9228, "Gauges as Light", "PILOT Weapon Store 8A as Light (STORE)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_1A_READY_L", 9221, "Gauges as Light", "PILOT Weapon Store 1A as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_1B_READY_L", 9222, "Gauges as Light", "PILOT Weapon Store 1B as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_3_READY_L", 9223, "Gauges as Light", "PILOT Weapon Store 3 as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_4_READY_L", 9224, "Gauges as Light", "PILOT Weapon Store 4 as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_5_READY_L", 9225, "Gauges as Light", "PILOT Weapon Store 5 as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_6_READY_L", 9226, "Gauges as Light", "PILOT Weapon Store 6 as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_8B_READY_L", 9227, "Gauges as Light", "PILOT Weapon Store 8B as Light (READY)")
F_14:defineIndicatorLightGreen("PLT_WEAPON_STORE_8A_READY_L", 9228, "Gauges as Light", "PILOT Weapon Store 8A as Light (READY)")
F_14:defineIndicatorLight("PLT_GEAR_NOSE_OFF_L", 8300, "Gauges as Light", "PILOT Nose Gear OFF Flag as Light")
F_14:defineIndicatorLight("PLT_GEAR_NOSE_IND_L", 8301, "Gauges as Light", "PILOT Nose Gear Indicator as Light")
F_14:defineIndicatorLight("PLT_GEAR_L_OFF_L", 8303, "Gauges as Light", "PILOT Left Gear OFF Flag as Light")
F_14:defineIndicatorLight("PLT_GEAR_L_IND_L", 8302, "Gauges as Light", "PILOT Left Gear Indicator as Light")
F_14:defineIndicatorLight("PLT_GEAR_R_OFF_L", 8304, "Gauges as Light", "PILOT Right Gear OFF Flag as Light")
F_14:defineIndicatorLight("PLT_GEAR_R_IND_L", 8305, "Gauges as Light", "PILOT Right Gear Indicator as Light")

-- Indicator Lights RIO
F_14:defineIndicatorLight("RIO_SCP_RECORD_STBY_L", 92, "RIO Indicator Lights", "RIO SCP Record Standby Light (red)")
F_14:defineIndicatorLight("RIO_SCP_RECORD_REC_L", 93, "RIO Indicator Lights", "RIO SCP Record Light (green)")
F_14:defineIndicatorLight("RIO_SCP_RECORD_END_L", 94, "RIO Indicator Lights", "RIO SCP Record End of Tape Light (red)")
F_14:defineIndicatorLight("RIO_HCU_PW_RESET_L", 407, "RIO Indicator Lights", "RIO HCU Power Reset Light (green)")
F_14:defineIndicatorLight("RIO_HCS_WCS_PW_L", 408, "RIO Indicator Lights", "RIO HCU WCS Power Light (green)")
F_14:defineIndicatorLight("RIO_HCU_IR_STBY_L", 407, "RIO Indicator Lights", "RIO HCU IR Standby Light (green)")
F_14:defineIndicatorLight("RIO_FLOOD_LIGHTS", 1804, "RIO Indicator Lights", "RIO Flood Lights (red)")
F_14:defineIndicatorLight("RIO_PANEL_LIGHTS", 1805, "RIO Indicator Lights", "RIO Panel Lights (red) inverted")
F_14:defineIndicatorLight("RIO_INSTRUMENT_LIGHTS", 1806, "RIO Indicator Lights", "RIO Instrument Lights (red) inverted")
F_14:defineIndicatorLight("RIO_FLOOD_LIGHTS_W", 1807, "RIO Indicator Lights", "RIO White Flood Lights (white)")
F_14:defineIndicatorLight("RIO_ACLS_TEST_LIGHT", 2016, "RIO Indicator Lights", "RIO ACLS Test Light (green)")
F_14:defineIndicatorLight("RIO_CAD_OXYLOW", 2199, "RIO Indicator Lights", "RIO CAD OXY LOW Light (green)")
F_14:defineIndicatorLight("RIO_MASTERCAUTION_LIGHT", 2200, "RIO Indicator Lights", "RIO MASTER CAUTION Light (red)")
F_14:defineIndicatorLight("RIO_IFF_LIGHT", 2201, "RIO Indicator Lights", "RIO IFF Light (green)")
F_14:defineIndicatorLight("RIO_RCV_LIGHT", 2202, "RIO Indicator Lights", "RIO RCV Light (green)")
F_14:defineIndicatorLight("RIO_XMIT_LIGHT", 2203, "RIO Indicator Lights", "RIO XMIT Light (green)")
F_14:defineIndicatorLight("RIO_SAM_LIGHT", 2204, "RIO Indicator Lights", "RIO SAM Light (red)")
F_14:defineIndicatorLight("RIO_AAA_LIGHT", 2205, "RIO Indicator Lights", "RIO AAA Light (red)")
F_14:defineIndicatorLight("RIO_CW_LIGHT", 2206, "RIO Indicator Lights", "RIO CW Light (red)")
F_14:defineIndicatorLight("RIO_AI_LIGHT", 2208, "RIO Indicator Lights", "RIO AI Light (red)")
F_14:defineIndicatorLight("RIO_CAD_CDHOT", 2209, "RIO Indicator Lights", "RIO CAD C D HOT Light (green)")
F_14:defineIndicatorLight("RIO_CAD_CABINPRESS", 2210, "RIO Indicator Lights", "RIO CAD CABIN PRESS Light (green)")
F_14:defineIndicatorLight("RIO_CAD_FUELLOW", 2211, "RIO Indicator Lights", "RIO CAD FUEL LOW Light (green)")
F_14:defineIndicatorLight("RIO_CAD_CANOPY", 2212, "RIO Indicator Lights", "RIO CAD CANOPY Light (green)")
F_14:defineIndicatorLight("RIO_CAD_FUZEHV", 2213, "RIO Indicator Lights", "RIO CAD FUZE HV Light (green)")
F_14:defineIndicatorLight("RIO_CAD_RDRENABLED", 2214, "RIO Indicator Lights", "RIO CAD RDR ENABLED Light (green)")
F_14:defineIndicatorLight("RIO_CAD_COOLINGAIR", 2215, "RIO Indicator Lights", "RIO CAD COOLING AIR Light (yellow)")
F_14:defineIndicatorLight("RIO_CAD_MSLCOND", 2216, "RIO Indicator Lights", "RIO CAD MSL COND Light (yellow)")
F_14:defineIndicatorLight("RIO_CAD_AWG9COND", 2217, "RIO Indicator Lights", "RIO CAD C D HOT Light (yellow)")
F_14:defineIndicatorLight("RIO_CAD_NAVCOMP", 2218, "RIO Indicator Lights", "RIO CAD NAV COMP Light (yellow)")
F_14:defineIndicatorLight("RIO_CAD_FILMLOW", 2219, "RIO Indicator Lights", "RIO CAD FILM LOW Light (yellow)")
F_14:defineIndicatorLight("RIO_CAD_IMU", 2220, "RIO Indicator Lights", "RIO CAD IMU Light (yellow)")
F_14:defineIndicatorLight("RIO_CAD_AHRS", 2221, "RIO Indicator Lights", "RIO CAD AHRS Light (yellow)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_WAVEOFF", 2222, "RIO Indicator Lights", "RIO DDI WAVE OFF Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_LANDCHK", 2223, "RIO Indicator Lights", "RIO DDI LAND CHK Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ACLBEAC", 2224, "RIO Indicator Lights", "RIO DDI ACL BEAC Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ACLRDY", 2225, "RIO Indicator Lights", "RIO DDI ACL RDY Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_APCPLR", 2226, "RIO Indicator Lights", "RIO DDI A PC PLR Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_10SEC", 2227, "RIO Indicator Lights", "RIO DDI 10 SEC Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ADJAC", 2228, "RIO Indicator Lights", "RIO DDI ADJ A C Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_VOICE", 2229, "RIO Indicator Lights", "RIO DDI VOICE Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_TILT", 2230, "RIO Indicator Lights", "RIO DDI TILT Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_CMDCHG", 2231, "RIO Indicator Lights", "RIO DDI CMD CHG Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ALTCHG", 2232, "RIO Indicator Lights", "RIO DDI ALT CHG Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_MONALT", 2233, "RIO Indicator Lights", "RIO DDI MON ALT Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_MANUAL", 2234, "RIO Indicator Lights", "RIO DDI MANUAL Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_SPDCHG", 2235, "RIO Indicator Lights", "RIO DDI SPD CHG Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_MONSPD", 2236, "RIO Indicator Lights", "RIO DDI MON SPD Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_CMDCTRL", 2237, "RIO Indicator Lights", "RIO DDI CMD CTRL Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_CHGCHN", 2238, "RIO Indicator Lights", "RIO DDI CHG CHN Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_HDGCHN", 2239, "RIO Indicator Lights", "RIO DDI HDG CHN Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_CANCRPY", 2240, "RIO Indicator Lights", "RIO DDI CANC RPY Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_FWDVEC", 2241, "RIO Indicator Lights", "RIO DDI FWD VEC Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_AFTVEC", 2242, "RIO Indicator Lights", "RIO DDI AFT VEC Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_COIVEC", 2243, "RIO Indicator Lights", "RIO DDI COI VEC Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_NOMSG", 2244, "RIO Indicator Lights", "RIO DDI NO MSG Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_10WAYPT", 2245, "RIO Indicator Lights", "RIO DDI 10 WAYPT Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_HANDOVER", 2246, "RIO Indicator Lights", "RIO DDI HANDOVER Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ORBIT", 2247, "RIO Indicator Lights", "RIO DDI ORBIT Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_CHALNGE", 2248, "RIO Indicator Lights", "RIO DDI CHALNGE Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ARM1", 2249, "RIO Indicator Lights", "RIO DDI ARM 1 Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ARM2", 2250, "RIO Indicator Lights", "RIO DDI ARM 2 Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ARM3", 2251, "RIO Indicator Lights", "RIO DDI ARM 3 Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_NOTCMD", 2252, "RIO Indicator Lights", "RIO DDI NOT CMD Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_FRELAN", 2253, "RIO Indicator Lights", "RIO DDI FRE LAN Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_DISGAGE", 2254, "RIO Indicator Lights", "RIO DDI DISGAGE Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_ABORT", 2255, "RIO Indicator Lights", "RIO DDI ABORT Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_BEACON", 2256, "RIO Indicator Lights", "RIO DDI BEAC ON Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_SEACDUB", 2257, "RIO Indicator Lights", "RIO DDI SEAC DUB Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_DROP", 2258, "RIO Indicator Lights", "RIO DDI DROP Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_BEACOFF", 2259, "RIO Indicator Lights", "RIO DDI BEAC OFF Light (green)")
F_14:defineIndicatorLight("RIO_DDI_LIGHTS_RETBASE", 2260, "RIO Indicator Lights", "RIO DDI RET BASE Light (green)")
F_14:defineIndicatorLight("RIO_TID_SCREEN_LIGHT", 3450, "RIO Indicator Lights", "RIO TID Screen Light (light green)")
F_14:defineIndicatorLight("RIO_IFF_TEST_LIGHT", 8052, "RIO Indicator Lights", "RIO IFF Test Light (green)")
F_14:defineIndicatorLight("RIO_IFF_REPLY_LIGHT", 8053, "RIO Indicator Lights", "RIO IFF Reply Light (green)")
F_14:defineIndicatorLight("RIO_TACAN_GO", 8893, "RIO Indicator Lights", "RIO TACAN GO Light (green)")
F_14:defineIndicatorLight("RIO_TACAN_NOGO", 8892, "RIO Indicator Lights", "RIO TACAN NOGO Light (red)")
F_14:defineIndicatorLight("RIO_DDD_LIGHTS_ANTTRK", 11503, "RIO Indicator Lights", "RIO DDD ANT TRK Light (green)")
F_14:defineIndicatorLight("RIO_DDD_LIGHTS_RDROT", 11504, "RIO Indicator Lights", "RIO DDD RDROT Light (green)")
F_14:defineIndicatorLight("RIO_DDD_LIGHTS_JAT", 11505, "RIO Indicator Lights", "RIO DDD JAT Light (green)")
F_14:defineIndicatorLight("RIO_DDD_LIGHTS_IROT", 11506, "RIO Indicator Lights", "RIO DDD IROT Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_STBY_LIGHT_1", 490, "RIO Indicator Lights", "RIO TDI Standby Light (green)")
F_14:defineIndicatorLightGreen("RIO_TID_STBY_LIGHT_2", 490, "RIO Indicator Lights", "RIO TDI Standby Light (blue)")
F_14:defineIndicatorLightRed("RIO_TID_READY_LIGHT_1", 491, "RIO Indicator Lights", "RIO TDI Ready Light (green)")
F_14:defineIndicatorLightGreen("RIO_TID_READY_LIGHT_2", 491, "RIO Indicator Lights", "RIO TDI Ready Light (blue)")
F_14:defineIndicatorLightRed("RIO_LAUNCH_LIGHT_1", 492, "RIO Indicator Lights", "RIO Launch Light (red)")
F_14:defineIndicatorLightGreen("RIO_LAUNCH_LIGHT_2", 492, "RIO Indicator Lights", "RIO Launch Light (green)")
F_14:defineIndicatorLightRed("RIO_DECM_LIGHT", 493, "RIO Indicator Lights", "RIO DECM Standby Light (yellow)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_CLEAR_1", 5550, "RIO Indicator Lights", "RIO CAP CLEAR Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_CLEAR_2", 5550, "RIO Indicator Lights", "RIO CAP CLEAR Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_SW_1", 5551, "RIO Indicator Lights", "RIO CAP SW Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_SW_2", 5551, "RIO Indicator Lights", "RIO CAP SW Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_NE_1", 5552, "RIO Indicator Lights", "RIO CAP NE Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_NE_2", 5552, "RIO Indicator Lights", "RIO CAP NE Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_ENTER_1", 5553, "RIO Indicator Lights", "RIO CAP ENTER Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_ENTER_2", 5553, "RIO Indicator Lights", "RIO CAP ENTER Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_1_1", 5554, "RIO Indicator Lights", "RIO CAP 1 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_1_2", 5554, "RIO Indicator Lights", "RIO CAP 1 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_2_1", 5555, "RIO Indicator Lights", "RIO CAP 2 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_2_2", 5555, "RIO Indicator Lights", "RIO CAP 2 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_3_1", 5556, "RIO Indicator Lights", "RIO CAP 3 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_3_2", 5556, "RIO Indicator Lights", "RIO CAP 3 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_4_1", 5557, "RIO Indicator Lights", "RIO CAP 4 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_4_2", 5557, "RIO Indicator Lights", "RIO CAP 4 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_5_1", 5558, "RIO Indicator Lights", "RIO CAP 5 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_5_2", 5558, "RIO Indicator Lights", "RIO CAP 5 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_6_1", 5559, "RIO Indicator Lights", "RIO CAP 6 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_6_2", 5559, "RIO Indicator Lights", "RIO CAP 6 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_7_1", 5560, "RIO Indicator Lights", "RIO CAP 7 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_7_2", 5560, "RIO Indicator Lights", "RIO CAP 7 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_8_1", 5561, "RIO Indicator Lights", "RIO CAP 8 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_8_2", 5561, "RIO Indicator Lights", "RIO CAP 8 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_9_1", 5562, "RIO Indicator Lights", "RIO CAP 9 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_9_2", 5562, "RIO Indicator Lights", "RIO CAP 9 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_0_1", 5563, "RIO Indicator Lights", "RIO CAP 0 Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_0_2", 5563, "RIO Indicator Lights", "RIO CAP 0 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN6", 5564, "RIO Indicator Lights", "RIO CAP BTN 6 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN7", 5565, "RIO Indicator Lights", "RIO CAP BTN 7 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN8", 5566, "RIO Indicator Lights", "RIO CAP BTN 8 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN9", 5567, "RIO Indicator Lights", "RIO CAP BTN 9 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN1", 5568, "RIO Indicator Lights", "RIO CAP BTN 1 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN2", 5569, "RIO Indicator Lights", "RIO CAP BTN 2 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN3", 5570, "RIO Indicator Lights", "RIO CAP BTN 3 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN4", 5571, "RIO Indicator Lights", "RIO CAP BTN 4 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN5", 5572, "RIO Indicator Lights", "RIO CAP BTN 5 Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_TNG_NBR_1", 5573, "RIO Indicator Lights", "RIO CAP TNG NBR Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_TNG_NBR_2", 5573, "RIO Indicator Lights", "RIO CAP TNG NBR Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_PGM_RESTART_1", 5574, "RIO Indicator Lights", "RIO CAP PGM Restart Light (red)")
F_14:defineIndicatorLightGreen("RIO_CAP_LIGHT_PGM_RESTART_2", 5574, "RIO Indicator Lights", "RIO CAP PGM Restart Light (green)")
F_14:defineIndicatorLightRed("RIO_CAP_LIGHT_BTN10", 5590, "RIO Indicator Lights", "RIO CAP BTN 10 Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_RDR_1", 6111, "RIO Indicator Lights", "RIO DDD RDR Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_RDR_2", 6111, "RIO Indicator Lights", "RIO DDD RDR Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_IR_1", 6112, "RIO Indicator Lights", "RIO DDD IR Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_IR_2", 6112, "RIO Indicator Lights", "RIO DDD IR Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_IFF_1", 6113, "RIO Indicator Lights", "RIO DDD IFF Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_IFF_2", 6113, "RIO Indicator Lights", "RIO DDD IFF Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_PDSTT_1", 6114, "RIO Indicator Lights", "RIO DDD PDSTT Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_PDSTT_2", 6114, "RIO Indicator Lights", "RIO DDD PDSTT Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_PSTT_1", 6115, "RIO Indicator Lights", "RIO DDD PULSE STT Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_PSTT_2", 6115, "RIO Indicator Lights", "RIO DDD PULSE STT Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_PDSEARCH_1", 6116, "RIO Indicator Lights", "RIO DDD PDSEARCH Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_PDSEARCH_2", 6116, "RIO Indicator Lights", "RIO DDD PDSEARCH Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_RWS_1", 6117, "RIO Indicator Lights", "RIO DDD RWS Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_RWS_2", 6117, "RIO Indicator Lights", "RIO DDD RWS Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_TWS_AUTO_1", 6118, "RIO Indicator Lights", "RIO DDD TWS AUTO Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_TWS_AUTO_2", 6118, "RIO Indicator Lights", "RIO DDD TWS AUTO Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_TWS_MAN_1", 6119, "RIO Indicator Lights", "RIO DDD TWS MAN Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_TWS_MAN_2", 6119, "RIO Indicator Lights", "RIO DDD TWS MAN Light (green)")
F_14:defineIndicatorLightRed("RIO_DDD_LIGHT_PSEARCH_1", 6120, "RIO Indicator Lights", "RIO DDD PSEARCH Light (red)")
F_14:defineIndicatorLightGreen("RIO_DDD_LIGHT_PSEARCH_2", 6120, "RIO Indicator Lights", "RIO DDD PSEARCH Light (green)")
F_14:defineIndicatorLightRed("RIO_CCM_LIGHT_SPL_1", 6121, "RIO Indicator Lights", "RIO CCM SPL Light (red)")
F_14:defineIndicatorLightGreen("RIO_CCM_LIGHT_SPL_2", 6121, "RIO Indicator Lights", "RIO CCM SPL Light (green)")
F_14:defineIndicatorLightRed("RIO_CCM_LIGHT_ALTOFF_1", 6122, "RIO Indicator Lights", "RIO CCM ALT OFF Light (red)")
F_14:defineIndicatorLightGreen("RIO_CCM_LIGHT_ALTOFF_2", 6122, "RIO Indicator Lights", "RIO CCM ALT OFF Light (green)")
F_14:defineIndicatorLightRed("RIO_CCM_LIGHT_VGS_1", 6123, "RIO Indicator Lights", "RIO CCM VGS Light (red)")
F_14:defineIndicatorLightGreen("RIO_CCM_LIGHT_VGS_2", 6123, "RIO Indicator Lights", "RIO CCM VGS Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_TRACKHOLD_LIGHT", 6125, "RIO Indicator Lights", "RIO TID TRACKHOLD Light (red)")
F_14:defineIndicatorLightRed("RIO_TID_CLSN_LIGHT_1", 6126, "RIO Indicator Lights", "RIO TID CLSN Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_CLSN_LIGHT_2", 6126, "RIO Indicator Lights", "RIO TID CLSN Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_RIDDSBL_1", 6127, "RIO Indicator Lights", "RIO TID RID DSBL Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_RIDDSBL_2", 6127, "RIO Indicator Lights", "RIO TID RID DSBL Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_ALTNUM_1", 6128, "RIO Indicator Lights", "RIO TID ALT NUM Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_ALTNUM_2", 6128, "RIO Indicator Lights", "RIO TID ALT NUM Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_SYMELEM_1", 6129, "RIO Indicator Lights", "RIO TID SYM ELEM Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_SYMELEM_2", 6129, "RIO Indicator Lights", "RIO TID SYM ELEM Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_DATALINK_1", 6130, "RIO Indicator Lights", "RIO TID DATALINK Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_DATALINK_2", 6130, "RIO Indicator Lights", "RIO TID DATALINK Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_JAM_1", 6131, "RIO Indicator Lights", "RIO TID JAM STROBE Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_JAM_2", 6131, "RIO Indicator Lights", "RIO TID JAM STROBE Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_NONATTK_1", 6132, "RIO Indicator Lights", "RIO TID NON ATTK Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_NONATTK_2", 6132, "RIO Indicator Lights", "RIO TID NON ATTK Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_LZ_1", 6133, "RIO Indicator Lights", "RIO TID LAUNCH ZONE Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_LZ_2", 6133, "RIO Indicator Lights", "RIO TID LAUNCH ZONE Light (green)")
F_14:defineIndicatorLightRed("RIO_TID_LIGHT_VELVEC_1", 6134, "RIO Indicator Lights", "RIO TID VEL VECTOR Light (red)")
F_14:defineIndicatorLightGreen("RIO_TID_LIGHT_VELVEC_2", 6134, "RIO Indicator Lights", "RIO TID VEL VECTOR Light (green)")
F_14:defineIndicatorLightRed("RIO_HCU_LIGHT_TVIR_1", 6135, "RIO Indicator Lights", "RIO HCU IR/TV Light (red)")
F_14:defineIndicatorLightGreen("RIO_HCU_LIGHT_TVIR_2", 6135, "RIO Indicator Lights", "RIO HCU IR/TV Light (green)")
F_14:defineIndicatorLightRed("RIO_HCU_LIGHT_RDR_1", 6136, "RIO Indicator Lights", "RIO HCU RDR Light (red)")
F_14:defineIndicatorLightGreen("RIO_HCU_LIGHT_RDR_2", 6136, "RIO Indicator Lights", "RIO HCU RDR Light (green)")
F_14:defineIndicatorLightRed("RIO_HCU_LIGHT_DDD_1", 6137, "RIO Indicator Lights", "RIO HCU DDD CURSOR Light (red)")
F_14:defineIndicatorLightGreen("RIO_HCU_LIGHT_DDD_2", 6137, "RIO Indicator Lights", "RIO HCU DDD CURSOR Light (green)")
F_14:defineIndicatorLightRed("RIO_HCU_LIGHT_TID_1", 6138, "RIO Indicator Lights", "RIO HCU TID CURSOR  Light (red)")
F_14:defineIndicatorLightGreen("RIO_HCU_LIGHT_TID_2", 6138, "RIO Indicator Lights", "RIO HCU TID CURSOR  Light (green)")

-- Gauges PLT
F_14:defineFloat("PLT_RADARALTI_NEEDLE", 103, { 0, 1 }, "PLT Gauges", "PILOT Radar Altimeter Needle")
F_14:defineFloat("PLT_RADARALTI_FLAG", 2124, { 0, 1 }, "PLT Gauges", "PILOT Radar Altimeter OFF Flag")
F_14:defineFloat("PLT_RADARALTI_POINTER", 4154, { 0, 1 }, "PLT Gauges", "PILOT Radar Altimeter Pointer")
F_14:defineFloat("PLT_AIRSPEED_NEEDLE", 2129, { 0, 1 }, "PLT Gauges", "PILOT Airspeed Inner Disc")
F_14:defineFloat("PLT_AIRSPEED_INNER", 2128, { 0, 1 }, "PLT Gauges", "PILOT Airspeed Number Disc")
F_14:defineFloat("PLT_AIRSPEED_POINTER1", 2125, { 0, 1 }, "PLT Gauges", "PILOT Airspeed Pointer 1")
F_14:defineFloat("PLT_AIRSPEED_POINTER2", 2126, { 0, 1 }, "PLT Gauges", "PILOT Airspeed Pointer 2")
F_14:defineFloat("PLT_ENGINE_RPM_L", 1057, { 0, 1 }, "PLT Gauges", "PILOT Engine RPM Left")
F_14:defineFloat("PLT_ENGINE_RPM_R", 1058, { 0, 1 }, "PLT Gauges", "PILOT Engine RPM Right")
F_14:defineFloat("PLT_ENGINE_TIT_L", 1059, { 0, 1 }, "PLT Gauges", "PILOT Engine TIT Left")
F_14:defineFloat("PLT_ENGINE_TIT_R", 1060, { 0, 1 }, "PLT Gauges", "PILOT Engine TIT Right")
F_14:defineFloat("PLT_ENGINE_FF_L", 1061, { 0, 1 }, "PLT Gauges", "PILOT Engine FF Left")
F_14:defineFloat("PLT_ENGINE_FF_R", 1062, { 0, 1 }, "PLT Gauges", "PILOT Engine FF Right")
F_14:defineFloat("PLT_ENGINE_OIL_PRESS_L", 1066, { 0, 1 }, "PLT Gauges", "PILOT Engine Oil Pressure Left")
F_14:defineFloat("PLT_ENGINE_OIL_PRESS_R", 1065, { 0, 1 }, "PLT Gauges", "PILOT Engine Oil Pressure Right")
F_14:defineFloat("PLT_ENGINE_NOZZLE_L", 1068, { 0, 1 }, "PLT Gauges", "PILOT Engine Nozzle Left")
F_14:defineFloat("PLT_ENGINE_NOZZLE_R", 1067, { 0, 1 }, "PLT Gauges", "PILOT Engine Nozzle Right")
F_14:defineFloat("PLT_CLOCK_H", 1096, { 0, 1 }, "PLT Gauges", "PILOT Clock Hours")
F_14:defineFloat("PLT_CLOCK_M", 1097, { 0, 1 }, "PLT Gauges", "PILOT Clock Minutes")
F_14:defineFloat("PLT_CLOCK_TS", 1098, { 0, 1 }, "PLT Gauges", "PILOT Clock Timer Seconds")
F_14:defineFloat("PLT_CLOCK_T", 1099, { 0, 1 }, "PLT Gauges", "PILOT Clock Timer")
F_14:defineFloat("PLT_CLOCK_TM", 2000, { 0, 1 }, "PLT Gauges", "PILOT Clock Timer Minutes")
F_14:defineFloat("PLT_SWEEP_MIN", 2047, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep Minimum Index")
F_14:defineFloat("PLT_SWEEP_COM", 2001, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep Commanded")
F_14:defineFloat("PLT_SWEEP_POS", 2002, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep Position")
F_14:defineFloat("PLT_SWEEP_FLAG_OFF", 15091, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep OFF Flag")
F_14:defineFloat("PLT_SWEEP_FLAG_AUTO", 15092, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep AUTO Flag")
F_14:defineFloat("PLT_SWEEP_FLAG_MAN", 15093, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep MAN Flag")
F_14:defineFloat("PLT_SWEEP_FLAG_EMER", 15094, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep EMER Flag")
F_14:defineFloat("PLT_SWEEP_FLAG_OVER", 15095, { 0, 1 }, "PLT Gauges", "PILOT Wing Sweep OVER Flag")
F_14:defineFloat("PLT_AOA_UNITS", 2003, { 0, 1 }, "PLT Gauges", "PILOT AOA Unit Slider")
F_14:defineFloat("PLT_AOA_UNITS_OFF", 16004, { 0, 1 }, "PLT Gauges", "PILOT AOA Unit OFF Flag")
F_14:defineFloat("PLT_ALTIMETER_NEEDLE", 104, { 0, 1 }, "PLT Gauges", "PILOT Altimeter Needle Barometric")
F_14:defineFloat("PLT_VSI_NEEDLE", 106, { -1, 1 }, "PLT Gauges", "PILOT Vertical Velocity Indicator Needle")
F_14:defineFloat("PLT_COMP_SYNC_NEEDLE", 412, { -1, 1 }, "PLT Gauges", "PILOT Compass Sync Indicator Needle") --(COMP Panel)
F_14:defineFloat("PLT_COMP_DIAL", 1026, { 0, 1 }, "PLT Gauges", "PILOT Compass Dial") --(COMP Panel)
F_14:defineFloat("PLT_ACCEL_METER_NEEDLE", 110, { -1, 1 }, "PLT Gauges", "PILOT Accelerometer Needle")
F_14:defineFloat("PLT_ALT_METER_10000", 112, { 0, 1 }, "PLT Gauges", "PILOT Altimeter 10000")
F_14:defineFloat("PLT_ALT_METER_1000", 262, { 0, 1 }, "PLT Gauges", "PILOT Altimeter 1000")
F_14:defineFloat("PLT_ALT_METER_100", 300, { 0, 1 }, "PLT Gauges", "PILOT Altimeter 100")
F_14:defineFloat("PLT_ALT_METER_SMALL_1", 301, { 0, 1 }, "PLT Gauges", "PILOT Altimeter HG 1000")
F_14:defineFloat("PLT_ALT_METER_SMALL_2", 302, { 0, 1 }, "PLT Gauges", "PILOT Altimeter 100")
F_14:defineFloat("PLT_ALT_METER_SMALL_3", 303, { 0, 1 }, "PLT Gauges", "PILOT Altimeter 10")
F_14:defineFloat("PLT_ALT_METER_SMALL_4", 304, { 0, 1 }, "PLT Gauges", "PILOT Altimeter 1")
F_14:defineFloat("PLT_ALT_METER_STBY", 305, { 0, 1 }, "PLT Gauges", "PILOT Altimeter Standby Flag")
F_14:defineFloat("PLT_HYD_PRESS_COMB", 1064, { 0, 1 }, "PLT Gauges", "PILOT Combined Hydraulic System Pressure Gauge")
F_14:defineFloat("PLT_HYD_PRESS_FLY", 1063, { 0, 1 }, "PLT Gauges", "PILOT Flight Hydraulic System Pressure Gauge")
F_14:defineFloat("PLT_HYD_SPOIL_FLAG", 1023, { 0, 1 }, "PLT Gauges", "PILOT Hydraulic Spoiler Flag")
F_14:defineFloat("PLT_HYD_EMERG_HI_FLAG", 1024, { 0, 1 }, "PLT Gauges", "PILOT Hydraulic Emergency HI Flag")
F_14:defineFloat("PLT_HYD_EMERG_LOW_FLAG", 1025, { 0, 1 }, "PLT Gauges", "PILOT Hydraulic Emergency LOW Flag")
F_14:defineFloat("PLT_GUN_LEAD_PLUSMINUS", 2273, { 0, 1 }, "PLT Gauges", "PILOT Gun Lead + / -")
F_14:defineFloat("PLT_ACCEL_METER_NEEDLE2", 15076, { -1, 1 }, "PLT Gauges", "PILOT Accelerometer Needle 2")
F_14:defineFloat("PLT_ACCEL_METER_NEEDLE3", 15077, { -1, 1 }, "PLT Gauges", "PILOT Accelerometer Needle 3")
F_14:defineFloat("PLT_HSD_BIT_INDICATOR", 15079, { 0, 1 }, "PLT Gauges", "PILOT HSD BIT Indicator Flag")
F_14:defineFloat("PLT_FUEL_AFT_L", 1054, { 0, 1 }, "PLT Gauges", "PILOT Fuel AFT & L")
F_14:defineFloat("PLT_FUEL_FWD_R", 1055, { 0, 1 }, "PLT Gauges", "PILOT Fuel FWD & R")
F_14:defineFloat("PLT_FUEL_LEFT_1K", 6000, { 0, 1 }, "PLT Gauges", "PILOT Fuel Left 1000")
F_14:defineFloat("PLT_FUEL_LEFT_100", 6001, { 0, 1 }, "PLT Gauges", "PILOT Fuel Left 100")
F_14:defineFloat("PLT_FUEL_LEFT_10", 6002, { 0, 1 }, "PLT Gauges", "PILOT Fuel Left 10")
F_14:defineFloat("PLT_FUEL_LEFT_1", 6003, { 0, 1 }, "PLT Gauges", "PILOT Fuel Left 1")
local function getPLTFuelLeft(dev0)
	return Module.build_gauge_from_arguments(dev0, { 6003, 6002, 6001, 6000 })
end
F_14:defineIntegerFromGetter("PLT_FUEL_LEFT_DISP", getPLTFuelLeft, 2500, "PLT Gauges", "PILOT Fuel Left Display")

F_14:defineFloat("PLT_FUEL_RIGHT_1K", 6004, { 0, 1 }, "PLT Gauges", "PILOT Fuel Right 1000")
F_14:defineFloat("PLT_FUEL_RIGHT_100", 6005, { 0, 1 }, "PLT Gauges", "PILOT Fuel Right 100")
F_14:defineFloat("PLT_FUEL_RIGHT_10", 6006, { 0, 1 }, "PLT Gauges", "PILOT Fuel Right 10")
F_14:defineFloat("PLT_FUEL_RIGHT_1", 6007, { 0, 1 }, "PLT Gauges", "PILOT Fuel Right 1")
local function getPLTFuelRight(dev0)
	return Module.build_gauge_from_arguments(dev0, { 6007, 6006, 6005, 6004 })
end
F_14:defineIntegerFromGetter("PLT_FUEL_RIGHT_DISP", getPLTFuelRight, 2500, "PLT Gauges", "PILOT Fuel Right Display")

F_14:defineFloat("PLT_FUEL_TOTAL_10K", 6010, { 0, 1 }, "PLT Gauges", "PILOT Fuel Total 10000")
F_14:defineFloat("PLT_FUEL_TOTAL_1K", 6011, { 0, 1 }, "PLT Gauges", "PILOT Fuel Total 1000")
F_14:defineFloat("PLT_FUEL_TOTAL_100", 6012, { 0, 1 }, "PLT Gauges", "PILOT Fuel Total 100")
F_14:defineFloat("PLT_FUEL_TOTAL_10", 6013, { 0, 1 }, "PLT Gauges", "PILOT Fuel Total 10")
F_14:defineFloat("PLT_FUEL_TOTAL_1", 6014, { 0, 1 }, "PLT Gauges", "PILOT Fuel Total 1")
local function getPLTFuelTotal(dev0)
	return Module.build_gauge_from_arguments(dev0, { 6014, 6013, 6012, 6011, 6010 })
end
F_14:defineIntegerFromGetter("PLT_FUEL_TOTAL_DISP", getPLTFuelTotal, 25000, "PLT Gauges", "PILOT Fuel Total Display")

F_14:defineFloat("PLT_FUEL_BINGO_10K", 6020, { 0, 1 }, "PLT Gauges", "PILOT Fuel Bingo 10000")
F_14:defineFloat("PLT_FUEL_BINGO_1K", 6021, { 0, 1 }, "PLT Gauges", "PILOT Fuel Bingo 1000")
F_14:defineFloat("PLT_FUEL_BINGO_100", 6022, { 0, 1 }, "PLT Gauges", "PILOT Fuel Bingo 100")
F_14:defineFloat("PLT_FUEL_BINGO_10", 6023, { 0, 1 }, "PLT Gauges", "PILOT Fuel Bingo 10")
F_14:defineFloat("PLT_FUEL_BINGO_1", 6024, { 0, 1 }, "PLT Gauges", "PILOT Fuel Bingo 1")
F_14:defineFloat("PLT_AHRS_LAT_DIAL", 1026, { 0, 1 }, "PLT Gauges", "PILOT Compass LAT Correction Dial") --(COMP Panel)
F_14:defineFloat("PLT_ACM_TURN_IND", 6501, { -1, 1 }, "PLT Gauges", "PILOT ACM Turn Indicator")
F_14:defineFloat("PLT_ACM_SLIP_BALL", 6500, { -1, 1 }, "PLT Gauges", "PILOT ACM Slip Ball")
F_14:defineFloat("PLT_COMPBALL_HORIZONTAL", 6502, { 0, 1 }, "PLT Gauges", "PILOT Compassball Horizontal")
F_14:defineFloat("PLT_COMPBALL_VERTICAL", 6503, { -1, 1 }, "PLT Gauges", "PILOT Compassball Vertical")
F_14:defineFloat("PLT_GEAR_NOSE_OFF", 8300, { 0, 1 }, "PLT Gauges", "PILOT Nose Gear OFF Flag")
F_14:defineFloat("PLT_GEAR_NOSE_IND", 8301, { 0, 1 }, "PLT Gauges", "PILOT Nose Gear Indicator")
F_14:defineFloat("PLT_GEAR_L_OFF", 8303, { 0, 1 }, "PLT Gauges", "PILOT Left Gear OFF Flag")
F_14:defineFloat("PLT_GEAR_L_IND", 8302, { 0, 1 }, "PLT Gauges", "PILOT Left Gear Indicator")
F_14:defineFloat("PLT_GEAR_R_OFF", 8304, { 0, 1 }, "PLT Gauges", "PILOT Right Gear OFF Flag")
F_14:defineFloat("PLT_GEAR_R_IND", 8305, { 0, 1 }, "PLT Gauges", "PILOT Right Gear Indicator")
F_14:defineFloat("PLT_SPDBRK_OFF", 8306, { 0, 1 }, "PLT Gauges", "PILOT Speedbrake OFF Flag")
F_14:defineFloat("PLT_SPDBRK_IND", 8307, { 0, 1 }, "PLT Gauges", "PILOT Speedbrake Indicator")
F_14:defineFloat("PLT_SPDBRK_FULL", 8308, { 0, 1 }, "PLT Gauges", "PILOT Speedbrake Full Indicator")
F_14:defineFloat("PLT_SLATS_OFF", 8309, { 0, 1 }, "PLT Gauges", "PILOT Slats OFF Flag")
F_14:defineFloat("PLT_SLATS_IND", 8310, { 0, 1 }, "PLT Gauges", "PILOT Slats Indicator")
F_14:defineFloat("PLT_FLAPS_IND", 8311, { 0, 1 }, "PLT Gauges", "PILOT Flaps Indicator")
F_14:defineFloat("PLT_SPOILER_DN_OL", 8315, { 0, 1 }, "PLT Gauges", "PILOT Spoiler DN Outer Left")
F_14:defineFloat("PLT_SPOILER_DN_IL", 8316, { 0, 1 }, "PLT Gauges", "PILOT Spoiler DN Inner Left")
F_14:defineFloat("PLT_SPOILER_DN_OR", 8318, { 0, 1 }, "PLT Gauges", "PILOT Spoiler DN Outer Right")
F_14:defineFloat("PLT_SPOILER_DN_IR", 8317, { 0, 1 }, "PLT Gauges", "PILOT Spoiler DN Outer Right")
F_14:defineFloat("PLT_SPOILER_IND_OL", 8319, { 0, 1 }, "PLT Gauges", "PILOT Spoiler Indicator Outer Left")
F_14:defineFloat("PLT_SPOILER_IND_IL", 8320, { 0, 1 }, "PLT Gauges", "PILOT Spoiler Indicator Inner Left")
F_14:defineFloat("PLT_SPOILER_IND_OR", 8322, { 0, 1 }, "PLT Gauges", "PILOT Spoiler Indicator Outer Right")
F_14:defineFloat("PLT_SPOILER_IND_IR", 8321, { 0, 1 }, "PLT Gauges", "PILOT Spoiler Indicator Inner Right")
F_14:defineFloat("PLT_STABI_IND_L", 1090, { 0, 1 }, "PLT Gauges", "PILOT Stabilisator Indicator Left")
F_14:defineFloat("PLT_STABI_IND_R", 1091, { 0, 1 }, "PLT Gauges", "PILOT Stabilisator Indicator Right")
F_14:defineFloat("PLT_RUDDER_IND_L", 1092, { 0, 1 }, "PLT Gauges", "PILOT Rudder Indicator Left")
F_14:defineFloat("PLT_RUDDER_IND_R", 1093, { 0, 1 }, "PLT Gauges", "PILOT Rudder Indicator Right")
F_14:defineFloat("PLT_COMPBALL_ROLL", 15097, { -1, 1 }, "PLT Gauges", "PILOT Compassball Roll")
F_14:defineFloat("PLT_BRAKE_PRESS_L", 9260, { 0, 1 }, "PLT Gauges", "PILOT Brake Pressure Left")
F_14:defineFloat("PLT_BRAKE_PRESS_R", 9260, { 0, 1 }, "PLT Gauges", "PILOT Brake Pressure Right")
F_14:defineFloat("PLT_STDBYAI_OFF_FLAG", 19100, { 0, 1 }, "PLT Gauges", "PILOT Standby ADI Off Flag")
F_14:defineFloat("PLT_COMP_RING", 19109, { 0, 1 }, "PLT Gauges", "PILOT Compass Ring")
F_14:defineFloat("PLT_COMP_FLAG", 19105, { 0, 1 }, "PLT Gauges", "PILOT Compass OFF Flag")
F_14:defineFloat("PLT_COMP_NEEDLE_TACAN", 699, { 0, 1 }, "PLT Gauges", "PILOT Compass TACAN Needle")
F_14:defineFloat("PLT_COMP_NEEDLE_ADF", 700, { 0, 1 }, "PLT Gauges", "PILOT Compass ADF Needle")
F_14:defineFloat("PLT_COMP_ROLLER1", 702, { 0, 1 }, "PLT Gauges", "PILOT Compass Roller 1")
F_14:defineFloat("PLT_COMP_ROLLER2", 703, { 0, 1 }, "PLT Gauges", "PILOT Compass Roller 2")
F_14:defineFloat("PLT_COMP_ROLLER3", 704, { 0, 1 }, "PLT Gauges", "PILOT Compass Roller 3")
F_14:defineFloat("PLT_CABIN_PRESS", 935, { 0, 1 }, "PLT Gauges", "PILOT Cabin Pressure Needle")
F_14:defineFloat("PLT_LIQU_OXY_FLAG", 952, { 0, 1 }, "PLT Gauges", "PILOT Liquid Oxygen OFF Flag")
F_14:defineFloat("PLT_STDBYAI_PITCH", 3001, { -1, 1 }, "PLT Gauges", "PILOT Standby ADI Pitch")
F_14:defineFloat("PLT_STDBYAI_ROLL", 3002, { -1, 1 }, "PLT Gauges", "PILOT Standby ADI Roll")
F_14:defineFloat("PLT_AMMO_100", 4060, { 0, 1 }, "PLT Gauges", "PILOT Ammo 100")
F_14:defineFloat("PLT_AMMO_10", 4061, { 0, 1 }, "PLT Gauges", "PILOT Ammo 10")
F_14:defineFloat("PLT_AMMO_1", 4062, { 0, 1 }, "PLT Gauges", "PILOT Ammo 1")
local function getAmmo(dev0)
	return Module.build_gauge_from_arguments(dev0, { 4062, 4061, 4060 })
end
F_14:defineIntegerFromGetter("PLT_AMMO_DISP", getAmmo, 690, "PLT Gauges", "PILOT Ammo Display")

F_14:defineFloat("PLT_GUN_LEAD_100", 2270, { 0, 1 }, "PLT Gauges", "PILOT Gun Lead 100")
F_14:defineFloat("PLT_GUN_LEAD_10", 2271, { 0, 1 }, "PLT Gauges", "PILOT Gun Lead 10")
F_14:defineFloat("PLT_GUN_LEAD_1", 2272, { 0, 1 }, "PLT Gauges", "PILOT Gun Lead 1")
local function getGunLead(dev0)
	return Module.build_gauge_from_arguments(dev0, { 2272, 2271, 2270 })
end
F_14:defineIntegerFromGetter("PLT_GUN_LEAD_DISP", getGunLead, 263, "PLT Gauges", "PILOT Gun Lead Display")
F_14:defineFloat("PLT_WEAPON_STORE_1A", 9221, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 1A")
F_14:defineFloat("PLT_WEAPON_STORE_1B", 9222, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 1B")
F_14:defineFloat("PLT_WEAPON_STORE_3", 9223, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 3")
F_14:defineFloat("PLT_WEAPON_STORE_4", 9224, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 4")
F_14:defineFloat("PLT_WEAPON_STORE_5", 9225, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 5")
F_14:defineFloat("PLT_WEAPON_STORE_6", 9226, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 6")
F_14:defineFloat("PLT_WEAPON_STORE_8B", 9227, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 8B")
F_14:defineFloat("PLT_WEAPON_STORE_8A", 9228, { 0, 1 }, "PLT Gauges", "PILOT Weapon Store 8A")

-- Gauges RIO
F_14:defineFloat("RIO_AIRSPEED_NEEDLE", 250, { 0, 1 }, "RIO Gauges", "RIO Airspeed Inner Disc")
F_14:defineFloat("RIO_AIRSPEED_INNER", 251, { 0, 1 }, "RIO Gauges", "RIO Airspeed Number Disc")
F_14:defineFloat("RIO_AIRSPEED_POINTER1", 252, { 0, 1 }, "RIO Gauges", "RIO Airspeed Pointer 1")
F_14:defineFloat("RIO_AIRSPEED_POINTER2", 253, { 0, 1 }, "RIO Gauges", "RIO Airspeed Pointer 2")
F_14:defineFloat("RIO_CMDS_CHAFF_COUNT_10", 392, { 0, 1 }, "RIO Gauges", "RIO CMDS Chaff Counter 10")
F_14:defineFloat("RIO_CMDS_CHAFF_COUNT_1", 393, { 0, 1 }, "RIO Gauges", "RIO CMDS Chaff Counter 1")
local function getChaffCount(dev0)
	return Module.build_gauge_from_arguments(dev0, { 393, 392 })
end
F_14:defineIntegerFromGetter("RIO_CMDS_CHAFFCNT_DISPLAY", getChaffCount, 99, "CMDS", "RIO CMDS Chaff Counter Display")

F_14:defineFloat("RIO_CMDS_FLARE_COUNT_10", 394, { 0, 1 }, "RIO Gauges", "RIO CMDS Flare Counter 10")
F_14:defineFloat("RIO_CMDS_FLARE_COUNT_1", 395, { 0, 1 }, "RIO Gauges", "RIO CMDS Flare Counter 1")
local function getFlareCount(dev0)
	return Module.build_gauge_from_arguments(dev0, { 395, 394 })
end
F_14:defineIntegerFromGetter("RIO_CMDS_FLARECNT_DISPLAY", getFlareCount, 99, "CMDS", "RIO CMDS Flare Counter Display")

F_14:defineFloat("RIO_CMDS_JAMM_COUNT_10", 396, { 0, 1 }, "RIO Gauges", "RIO CMDS Jammer Counter 10")
F_14:defineFloat("RIO_CMDS_JAMM_COUNT_1", 397, { 0, 1 }, "RIO Gauges", "RIO CMDS Jammer Counter 1")
local function getJammerCount(dev0)
	return Module.build_gauge_from_arguments(dev0, { 397, 396 })
end
F_14:defineIntegerFromGetter("RIO_CMDS_JAMMCNT_DISPLAY", getJammerCount, 99, "CMDS", "RIO CMDS Jammer Counter Display")

F_14:defineFloat("RIO_TACAN_COMAND_IND", 414, { 0, 1 }, "RIO Gauges", "RIO TACAN Command Indicator")
F_14:defineFloat("RIO_ELEVATION_RADAR", 2121, { -1, 1 }, "RIO Gauges", "RIO Radar Elevation Arrow")
F_14:defineFloat("RIO_ELEVATION_TCS", 2122, { -1, 1 }, "RIO Gauges", "RIO TCS Elevation Arrow")
F_14:defineFloat("RIO_CLOCK_H", 4150, { 0, 1 }, "RIO Gauges", "RIO Clock Hours")
F_14:defineFloat("RIO_CLOCK_M", 4151, { 0, 1 }, "RIO Gauges", "RIO Clock Minutes")
F_14:defineFloat("RIO_CLOCK_TS", 4152, { 0, 1 }, "RIO Gauges", "RIO Clock Timer Seconds")
F_14:defineFloat("RIO_CLOCK_T", 4153, { 0, 1 }, "RIO Gauges", "RIO Clock Timer")
F_14:defineFloat("RIO_ALTIMETER_NEEDLE", 20104, { 0, 1 }, "RIO Gauges", "RIO Altimeter Needle Barometric")
F_14:defineFloat("RIO_FUEL_TOTAL_10K", 2117, { 0, 1 }, "RIO Gauges", "RIO Fuel Total 10000")
F_14:defineFloat("RIO_FUEL_TOTAL_1K", 2118, { 0, 1 }, "RIO Gauges", "RIO Fuel Total 1000")
F_14:defineFloat("RIO_FUEL_TOTAL_100", 2119, { 0, 1 }, "RIO Gauges", "RIO Fuel Total 100")
F_14:defineFloat("RIO_FUEL_TOTAL_10", 2120, { 0, 1 }, "RIO Gauges", "RIO Fuel Total 10")
F_14:defineFloat("RIO_FUEL_TOTAL_1", 2135, { 0, 1 }, "RIO Gauges", "RIO Fuel Total 1")
local function getRIOFuelTotal(dev0)
	return Module.build_gauge_from_arguments(dev0, { 2135, 2120, 2119, 2118, 2117 })
end
F_14:defineIntegerFromGetter("RIO_FUEL_TOTAL_DISP", getRIOFuelTotal, 25000, "RIO Gauges", "RIO Fuel Total Display")

F_14:defineFloat("RIO_STDBYAI_OFF_FLAG", 19900, { 0, 1 }, "RIO Gauges", "RIO Standby ADI Off Flag")
F_14:defineFloat("RIO_STDBYAI_PITCH", 3333, { -1, 1 }, "RIO Gauges", "RIO Standby ADI Pitch")
F_14:defineFloat("RIO_STDBYAI_ROLL", 19901, { -1, 1 }, "RIO Gauges", "RIO Standby ADI Roll")
F_14:defineFloat("RIO_ALT_METER_10000", 20112, { 0, 1 }, "RIO Gauges", "RIO Altimeter 10000")
F_14:defineFloat("RIO_ALT_METER_1000", 20262, { 0, 1 }, "RIO Gauges", "RIO Altimeter 1000")
F_14:defineFloat("RIO_ALT_METER_100", 20300, { 0, 1 }, "RIO Gauges", "RIO Altimeter 100")
F_14:defineFloat("RIO_ALT_METER_SMALL_1", 20301, { 0, 1 }, "RIO Gauges", "RIO Altimeter HG 1000")
F_14:defineFloat("RIO_ALT_METER_SMALL_2", 20302, { 0, 1 }, "RIO Gauges", "RIO Altimeter 100")
F_14:defineFloat("RIO_ALT_METER_SMALL_3", 20303, { 0, 1 }, "RIO Gauges", "RIO Altimeter 10")
F_14:defineFloat("RIO_ALT_METER_SMALL_4", 20304, { 0, 1 }, "RIO Gauges", "RIO Altimeter 1")
F_14:defineFloat("RIO_ALT_METER_STBY", 20305, { 0, 1 }, "RIO Gauges", "RIO Altimeter Standby Flag")
F_14:defineFloat("RIO_COMP_RING", 29109, { 0, 1 }, "RIO Gauges", "RIO Compass Ring")
F_14:defineFloat("RIO_COMP_FLAG", 29105, { 0, 1 }, "RIO Gauges", "RIO Compass OFF Flag")
F_14:defineFloat("RIO_COMP_NEEDLE_TACAN", 20699, { 0, 1 }, "RIO Gauges", "RIO Compass TACAN Needle")
F_14:defineFloat("RIO_COMP_NEEDLE_ADF", 20700, { 0, 1 }, "RIO Gauges", "RIO Compass ADF Needle")
F_14:defineFloat("RIO_COMP_ROLLER1", 705, { 0, 1 }, "RIO Gauges", "RIO Compass Roller 1")
F_14:defineFloat("RIO_COMP_ROLLER2", 706, { 0, 1 }, "RIO Gauges", "RIO Compass Roller 2")
F_14:defineFloat("RIO_COMP_ROLLER3", 707, { 0, 1 }, "RIO Gauges", "RIO Compass Roller 3")
F_14:defineFloat("RIO_DDD_RANGE_ROLLER", 6100, { 0, 1 }, "RIO Gauges", "RIO DDD Range Roller")
F_14:defineFloat("RIO_TID_SRC_ROLLER", 6101, { 0, 1 }, "RIO Gauges", "RIO TID Readout SRC Roller")
F_14:defineFloat("RIO_DDD_RADAR_MODE", 6102, { 0, 1 }, "RIO Gauges", "RIO DDD Radar Mode Gauge")
F_14:defineFloat("RIO_TID_STEER_ROLLER", 6103, { 0, 1 }, "RIO Gauges", "RIO TID Steering Roller")
F_14:defineFloat("RIO_RECORD_MIN_HI", 11600, { 0, 1 }, "RIO Gauges", "RIO Record Minutes HI")
F_14:defineFloat("RIO_RECORD_MIN_MED", 11601, { 0, 1 }, "RIO Gauges", "RIO Record Minutes MED")
F_14:defineFloat("RIO_RECORD_MIN_LOW", 11602, { 0, 1 }, "RIO Gauges", "RIO Record Minutes LOW")

F_14:defineFloat("CANOPY_POS", 403, { 0, 1 }, "Cockpit", "Canopy Position")

F_14:defineString("PLT_UHF_REMOTE_DISP", function(dev0)
	return get_radio_remote_display(dev0, 9, 15004)
end, 7, "UHF 1", "PILOT UHF ARC-159 Radio Remote Display")
F_14:defineString("RIO_UHF_REMOTE_DISP", function(dev0)
	return get_rio_uhf_display(dev0)
end, 7, "UHF 1", "RIO UHF ARC-159 Radio Remote Display")
F_14:defineString("PLT_VUHF_REMOTE_DISP", function(_)
	return get_radio_vuhf_display(14, true)
end, 7, "VUHF", "PILOT VHF/UHF ARC-182 Radio Remote Display")

local function get_hud_mode(dev0)
	local hud_mode = "1"

	if dev0:get_argument_value(1014) == 1 then --Cruise
		hud_mode = "2"
	elseif dev0:get_argument_value(1013) == 1 then --A2A
		hud_mode = "3"
	elseif dev0:get_argument_value(1012) == 1 then --A2G
		hud_mode = "4"
	elseif dev0:get_argument_value(1011) == 1 then --Landing
		hud_mode = "5"
	end

	return hud_mode
end

F_14:defineString("PLT_HUD_MODE", get_hud_mode, 1, "Display", "PILOT HUD Mode (string)")
F_14:defineString("PLT_STEER_MODE", function()
	return steer_mode
end, 1, "Display", "PILOT STEER Mode (string)")

local function get_airsource_mode(dev0)
	local airsource_mode = "5"

	if dev0:get_argument_value(929) == 1 then --RAM
		airsource_mode = "1"
	elseif dev0:get_argument_value(930) == 1 then --LEFT
		airsource_mode = "2"
	elseif dev0:get_argument_value(931) == 1 then --RIGHT
		airsource_mode = "3"
	elseif dev0:get_argument_value(932) == 1 then --BOTH
		airsource_mode = "4"
	end

	return airsource_mode
end

F_14:defineString("PLT_AIR_SOURCE_MODE", get_airsource_mode, 1, "Display", "PILOT Air Source Mode (string)")
F_14:defineString("HSD_TACAN_RANGE_S", function()
	return steer_mode == "1" and hsd_ind[16] or "00000"
end, 5, "HSD", "HSD TACAN Range Display (string)")
F_14:defineString("HSD_TACAN_CRS_S", function()
	return steer_mode == "1" and hsd_ind[17] or "000"
end, 3, "HSD", "HSD TACAN Course Display (string)")
F_14:defineString("HSD_MAN_CRS_S", function()
	return steer_mode == "5" and hsd_ind[14] or "000"
end, 3, "HSD", "HSD MAN Course Display (string)")
F_14:defineIntegerFromGetter("HSD_TACAN_CRS", function()
	return steer_mode == "1" and tonumber(hsd_ind[17]) or 0
end, 360, "HSD", "HSD TACAN Course Display")
F_14:defineIntegerFromGetter("HSD_MAN_CRS", function()
	return steer_mode == "5" and tonumber(hsd_ind[14]) or 0
end, 360, "HSD", "HSD MAN Course Display")

F_14:defineToggleSwitch("PLT_HUDCAM", 12, 3756, 3490, "Cockpit Mechanics", "PILOT Hide Guncam")
F_14:definePotentiometer("RIO_TCS_TRIM_AZI", 38, 3750, 85, { 0, 1 }, "TCS", "RIO TCS Trim Azimuth")
F_14:definePotentiometer("RIO_TCS_TRIM_ELE", 38, 3751, 86, { 0, 1 }, "TCS", "RIO TCS Trim Elevation")

-- Fire System
F_14:definePushButton("PLT_FIRE_EX_BOTTLE_L", 67, 3059, 15083, "Fire System", "PILOT Fire Ext Bottle - Left")
F_14:definePushButton("PLT_FIRE_EX_BOTTLE_R", 67, 3060, 15082, "Fire System", "PILOT Fire Ext Bottle - Right")

F_14:defineIndicatorLight("RIO_MCB_R_LIGHT", 13130, "RIO F-14A Indicator Lights", "RIO MCB Panel Right Test Light (red)(F-14A)")
F_14:defineIndicatorLight("RIO_MCB_L_LIGHT", 13131, "RIO F-14A Indicator Lights", "RIO MCB Panel Left Test Light (red)(F-14A)")
F_14:defineToggleSwitch("RIO_MCOMP_BYPASS", 20, 3761, 13132, "F-14A Engine", "RIO Mid Compression Bypass Test (F-14A)")

F_14:defineToggleSwitch("PLT_GEAR_DN_LK_OVER", 18, 3017, 633, "Gear", "PILOT Gear Down Lock Override")

--Externals
F_14:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 402, "External Aircraft Model", "Bottom Right Speed Brake")
F_14:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 401, "External Aircraft Model", "Bottom Left Speed Brake")
F_14:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_TOP", 400, "External Aircraft Model", "Top Speed Brake")
F_14:defineFloatFromDrawArgument("EXT_REFUEL_PROBE", 22, "External Aircraft Model", "Fuel Probe")
F_14:defineBitFromDrawArgument("EXT_REFUEL_PROBE_LIGHT", 610, "External Aircraft Model", "Refuel Probe Light (red)")
F_14:defineBitFromDrawArgument("EXT_POSITION_LIGHTS_WINGS", 611, "External Aircraft Model", "Position Lights Wings (red/green)")
F_14:defineBitFromDrawArgument("EXT_POSITION_LIGHTS_BODY", 612, "External Aircraft Model", "Position Lights Body (red/green)")
F_14:defineBitFromDrawArgument("EXT_POSITION_LIGHT_TAIL", 613, "External Aircraft Model", "Tail Position Light (white)")
F_14:defineBitFromDrawArgument("EXT_POSITION_LIGHT_CHIN", 614, "External Aircraft Model", "Chinpod Position Light (red)")
F_14:defineFloatFromDrawArgument("EXT_FORMATION_LIGHTS", 200, "External Aircraft Model", "Formation Lights (yellow green)")
F_14:defineBitFromDrawArgument("EXT_ANTI_COL", 620, "External Aircraft Model", "Anticollision Lights")
F_14:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
F_14:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
F_14:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")
F_14:defineFullRangeFloatFromExternalDrawArgument("EXT_YAW_STRING_LR", 2500, "External Aircraft Model", "YAW String Left/Right")
F_14:defineFloatFromExternalDrawArgument("EXT_YAW_STRING_UD", 2501, { 0.75, 1 }, "External Aircraft Model", "YAW String Up/Down")
F_14:defineFloatFromDrawArgument("EXT_POSITION_LIGHTS_BODY_D", 612, "External Aircraft Model", "Position Lights Body Dimmer (red/green)")
F_14:defineFloatFromDrawArgument("EXT_POSITION_LIGHTS_WINGS_D", 611, "External Aircraft Model", "Position Lights Wings Dimmer (red/green)")
F_14:defineFloatFromDrawArgument("EXT_HOOK", 1305, "External Aircraft Model", "Hook")
F_14:defineFloatFromDrawArgument("EXT_WING_POS_L", 404, "External Aircraft Model", "Wing Position Left")
F_14:defineFloatFromDrawArgument("EXT_WING_POS_R", 405, "External Aircraft Model", "Wing Position Right")

F_14:defineFloat("INTERNAL_FLOOD_RED_L", 1800, { 0, 1 }, "Cockpit Lights", "Flood Lights red")
F_14:defineFloat("INTERNAL_FLOOD_WHT_L", 1803, { 0, 1 }, "Cockpit Lights", "Flood Lights white")
F_14:defineFloat("INTERNAL_PLT_PANEL_L", 1801, { 1, 0 }, "Cockpit Lights", "Panel Lights (red) inverted")
F_14:definePushButton("PLT_VDI_FILTER", 42, 3234, 0, "HUD", "PILOT VDI Filter") --miss arg
F_14:definePushButton("RIO_DDD_FILTER", 39, 3456, 0, "DDD", "RIO DDD Filter") --miss arg
F_14:defineFloat("PLT_EJECT_SEAT_SAVE", 2503, { 0, 1 }, "Cockpit", "PILOT Ejection Seat Safety")
F_14:defineFloat("RIO_EJECT_SEAT_SAVE", 2504, { 0, 1 }, "Cockpit", "RIO Ejection Seat Safety")
F_14:defineFloat("RIO_LANTIRN_PRESENT", 666, { 0, 1 }, "Cockpit", "RIO LANTIRN Present")
F_14:defineFloat("PLT_THROTTLE_POS_L", 753, { 0, 1 }, "Cockpit", "PILOT Left Throttle Position")
F_14:defineFloat("PLT_THROTTLE_POS_R", 752, { 0, 1 }, "Cockpit", "PILOT Right Throttle Position")
F_14:defineFloat("PLT_SWEEP_HANDLE_POS", 384, { 0, 1 }, "Cockpit", "PILOT Wing Sweep Handle Position")

local function getPLTFuelBingo(dev0)
	return Module.build_gauge_from_arguments(dev0, { 6024, 6023, 6022, 6021, 6020 })
end
F_14:defineIntegerFromGetter("PLT_FUEL_BINGO_DISP", getPLTFuelBingo, 25000, "PLT Gauges", "PILOT Bingo Fuel Display")
F_14:defineFloat("PLT_LIQU_OXY_NEEDLE", 951, { 0, 1 }, "PLT Gauges", "PILOT Liquid Oxygen Gauge Needle")
F_14:defineIndicatorLight("PLT_LIQU_OXY_FLAG_LIGHT", 952, "Gauges as Light", "PILOT Liquid Oxygen Gauge Flag as Light")
F_14:definePotentiometer("PLT_MIRROR_TOP", 12, 3858, 258, { 0, 1 }, "Cockpit Mechanics", "PILOT Adjust Top Mirror")
F_14:definePotentiometer("PLT_MIRROR_L", 12, 3859, 256, { 0, 1 }, "Cockpit Mechanics", "PILOT Adjust Left Mirror")
F_14:definePotentiometer("PLT_MIRROR_R", 12, 3860, 257, { 0, 1 }, "Cockpit Mechanics", "PILOT Adjust Right Mirror")
F_14:definePotentiometer("RIO_MIRROR_TOP", 12, 3857, 46, { 0, 1 }, "Cockpit Mechanics", "RIO Adjust Top Mirror")

F_14:defineReadWriteRadio("UHF_FREQ", 3, 7, 3, 1000, "UHF Radio")
F_14:defineReadWriteRadio("VUHF_FREQ", 4, 7, 3, 1000, "VUHF Radio")

--- @type number[]
local airframe_values = {}

F_14:addExportHook(function()
	local dev6 = GetDevice(6)

	if not dev6 then
		airframe_values = {}
		return
	end

	-- this method does exist on this device and is the only way to get data from the device
	---@diagnostic disable-next-line: undefined-field
	airframe_values = dev6:get_values()
end)

F_14:defineIntegerFromGetter("BUFFET", function()
	return Module.valueConvert(airframe_values[1], { 0, 1 }, { 0, 65535 })
end, 65535, "Airframe", "How much the aircraft is shaking")
F_14:defineIntegerFromGetter("AFTERBURNER_LEFT", function()
	return Module.valueConvert(airframe_values[2], { 0, 1 }, { 0, 65535 })
end, 65535, "Airframe", "Left afterburner position")
F_14:defineIntegerFromGetter("AFTERBURNER_RIGHT", function()
	return Module.valueConvert(airframe_values[3], { 0, 1 }, { 0, 65535 })
end, 65535, "Airframe", "Right afterburner position")
F_14:reserveIntValue(65535) -- todo: rolling speed (determine limits)
F_14:defineIntegerFromGetter("CATAPULTING", function()
	return airframe_values[5]
end, 1, "Airframe", "Whether the aircraft is catapulting")
F_14:reserveIntValue(65535) -- todo: pitch acceleration (determine limits)
F_14:reserveIntValue(65535) -- todo: roll acceleration (determine limits)
F_14:reserveIntValue(65535) -- todo: yaw acceleration (determine limits)
F_14:defineIntegerFromGetter("IS_F14A", function()
	return airframe_values[9]
end, 1, "Airframe", "Whether the aircraft is the A-model")
F_14:defineIntegerFromGetter("AFTERBURNER_ZONE_LEFT", function()
	return airframe_values[10]
end, 65535, "Airframe", "Left afterburner zone")
F_14:defineIntegerFromGetter("AFTERBURNER_ZONE_RIGHT", function()
	return airframe_values[11]
end, 5, "Airframe", "Right afterburner zone")

F_14:definePushButton("RIO_MASTER_CAUTION_RESET", 35, 3057, 9229, "Weapons Panel", "RIO Master Caution Reset")

-- Jester
local PILOT_JESTER_WHEEL = "PLT Jester Wheel"

F_14:defineInputOnlyPushButtonWithValues("PLT_JESTER_MENU_TOGGLE", devices.JESTERAI, 3550, 1, -1, PILOT_JESTER_WHEEL, "Toggle Menu")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_1", devices.JESTERAI, 3551, PILOT_JESTER_WHEEL, "Command 1")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_2", devices.JESTERAI, 3552, PILOT_JESTER_WHEEL, "Command 2")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_3", devices.JESTERAI, 3553, PILOT_JESTER_WHEEL, "Command 3")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_4", devices.JESTERAI, 3554, PILOT_JESTER_WHEEL, "Command 4")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_5", devices.JESTERAI, 3555, PILOT_JESTER_WHEEL, "Command 5")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_6", devices.JESTERAI, 3556, PILOT_JESTER_WHEEL, "Command 6")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_7", devices.JESTERAI, 3557, PILOT_JESTER_WHEEL, "Command 7")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_8", devices.JESTERAI, 3558, PILOT_JESTER_WHEEL, "Command 8")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_CHECK", devices.JESTERAI, 3669, PILOT_JESTER_WHEEL, "Check")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_LC", devices.JESTERAI, 3670, PILOT_JESTER_WHEEL, "Loud and Clear")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_MENU_CLOSE", devices.JESTERAI, 3725, PILOT_JESTER_WHEEL, "Close Menu")

local PILOT_JESTER_NAV_COMMANDS = "PLT Jester Nav Commands"

F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_SP_1", devices.JESTERAI, 3566, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint SP 1")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_SP_2", devices.JESTERAI, 3567, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint SP 2")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_SP_3", devices.JESTERAI, 3568, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint SP 3")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_FIXED_POINT", devices.JESTERAI, 3569, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint Fixed Point")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_IP", devices.JESTERAI, 3570, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint Initial Point")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_TARGET", devices.JESTERAI, 3571, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint Surface Target")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_HOME", devices.JESTERAI, 3572, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint Home Base")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_NAV_MAN", devices.JESTERAI, 3573, PILOT_JESTER_NAV_COMMANDS, "Set Steerpoint Man")

local PILOT_JESTER_RADAR_COMMANDS = "PLT Jester Radar Commands"

F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_VSL_HIGH", devices.JESTERAI, 3574, PILOT_JESTER_RADAR_COMMANDS, "VSL High")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_VSL_LOW", devices.JESTERAI, 3575, PILOT_JESTER_RADAR_COMMANDS, "VSL Low")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_STT_MODE", devices.JESTERAI, 3576, PILOT_JESTER_RADAR_COMMANDS, "Toggle PD-STT or P-STT")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_BREAK_LOCK", devices.JESTERAI, 3577, PILOT_JESTER_RADAR_COMMANDS, "Break Lock")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RANGE_AUTO", devices.JESTERAI, 3578, PILOT_JESTER_RADAR_COMMANDS, "Range Auto")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RANGE_25", devices.JESTERAI, 3579, PILOT_JESTER_RADAR_COMMANDS, "Range 25")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RANGE_50", devices.JESTERAI, 3580, PILOT_JESTER_RADAR_COMMANDS, "Range 50")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RANGE_100", devices.JESTERAI, 3581, PILOT_JESTER_RADAR_COMMANDS, "Range 100")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RANGE_200", devices.JESTERAI, 3582, PILOT_JESTER_RADAR_COMMANDS, "Range 200")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RANGE_400", devices.JESTERAI, 3583, PILOT_JESTER_RADAR_COMMANDS, "Range 400")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_LOCK_AHEAD", devices.JESTERAI, 3584, PILOT_JESTER_RADAR_COMMANDS, "STT Lock Ahead")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_LOCK_AHEAD_ENEMY", devices.JESTERAI, 3585, PILOT_JESTER_RADAR_COMMANDS, "STT Lock Enemy Ahead")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_LOCK_AHEAD_FRIENDLY", devices.JESTERAI, 3586, PILOT_JESTER_RADAR_COMMANDS, "STT Lock Friendly Ahead")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_GROUND_STABILIZE", devices.JESTERAI, 3587, PILOT_JESTER_RADAR_COMMANDS, "Ground Stabilize")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_AIRCRAFT_STABILIZE", devices.JESTERAI, 3588, PILOT_JESTER_RADAR_COMMANDS, "Aircraft Stabilize")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RADAR_TWS", devices.JESTERAI, 3589, PILOT_JESTER_RADAR_COMMANDS, "TWS Mode")
F_14:defineInputOnlyPushButtonNoOff("PLT_JESTER_COMMAND_RADAR_RWS", devices.JESTERAI, 3590, PILOT_JESTER_RADAR_COMMANDS, "RWS Mode")

-- Iceman
local RIO_ICEMAN_WHEEL = "RIO Iceman Wheel"

F_14:defineInputOnlyPushButtonWithValues("RIO_ICEMAN_MENU_TOGGLE", devices.JESTERAI, 3550, 1, -1, RIO_ICEMAN_WHEEL, "Toggle Menu")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_1", devices.JESTERAI, 3551, RIO_ICEMAN_WHEEL, "Command 1")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_2", devices.JESTERAI, 3552, RIO_ICEMAN_WHEEL, "Command 2")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_3", devices.JESTERAI, 3553, RIO_ICEMAN_WHEEL, "Command 3")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_4", devices.JESTERAI, 3554, RIO_ICEMAN_WHEEL, "Command 4")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_5", devices.JESTERAI, 3555, RIO_ICEMAN_WHEEL, "Command 5")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_6", devices.JESTERAI, 3556, RIO_ICEMAN_WHEEL, "Command 6")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_7", devices.JESTERAI, 3557, RIO_ICEMAN_WHEEL, "Command 7")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_COMMAND_8", devices.JESTERAI, 3558, RIO_ICEMAN_WHEEL, "Command 8")
F_14:defineInputOnlyPushButtonNoOff("RIO_ICEMAN_MENU_CLOSE", devices.JESTERAI, 3725, RIO_ICEMAN_WHEEL, "Close Menu")

F_14:defineString("RIO_VUHF_DISP", function(_)
	return get_radio_vuhf_display(13, false)
end, 7, "VUHF", "RIO VHF/UHF ARC-182 Radio Display")

return F_14
