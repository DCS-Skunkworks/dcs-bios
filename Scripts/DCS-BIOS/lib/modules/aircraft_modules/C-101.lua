module("C-101", package.seeall)

local ApiVariant = require("Scripts.DCS-BIOS.lib.modules.documentation.ApiVariant")
local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")
local VariableStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.VariableStepInput")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class C_101: Module
local C_101 = Module:new("C-101", 0x3600, { "C-101CC", "C-101EB" })

--by WarLord v1.1

--remove Arg# Pilot 1000 / Instructor 1002 / Hide Stick Front 309 Back 312

--- Adds an infitely-looping rotary, like an encoder, specifically for the C101's ADF frequency selectors
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command2 integer the dcs command to adjust the value of the control
--- @param command1 integer the dcs command the enable adjusting the value of the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function C_101:defineRotaryPlus(identifier, device_id, command2, command1, arg_number, category, description)
	local max_value = 65535
	self:addInputProcessor(identifier, function(value)
		local device = GetDevice(device_id)

		if device == nil then
			return
		end

		device:performClickableAction(command1, 1)
		device:performClickableAction(command2, (tonumber(value) or 0) / max_value)
		device:performClickableAction(command1, 0)
	end)
	local alloc = self:allocateInt(max_value, identifier)

	local control = Control:new(category, ControlType.analog_dial, identifier, description, {
		VariableStepInput:new(3200, max_value, "turn the dial left or right"),
	}, {
		IntegerOutput:new(alloc, Suffix.knob_pos, "the rotation of the knob in the cockpit (not the value that is controlled by this knob!)"),
	}, ApiVariant.multiturn)

	self:addControl(control)

	self:addExportHook(function(dev0)
		alloc:setValue(dev0:get_argument_value(arg_number) * max_value)
	end)
end

--======== COMMON COCKPIT ========
--Electrical Panel
C_101:defineToggleSwitch("FRONT_BATT_MASTER_SW", 1, 3001, 315, "Electrical Panel", "FRONT Battery Master Switch")
C_101:defineToggleSwitch("FRONT_L_BATT_ISO_COVER", 1, 3002, 324, "Electrical Panel", "FRONT Left Battery Isolation Cover")
C_101:definePushButton("FRONT_L_BATT_ISO_BTN", 1, 3003, 325, "Electrical Panel", "FRONT Left Battery Isolation Button")
C_101:defineToggleSwitch("FRONT_R_BATT_ISO_COVER", 1, 3004, 326, "Electrical Panel", "FRONT Right Battery Isolation Cover")
C_101:definePushButton("FRONT_R_BATT_ISO_BTN", 1, 3005, 327, "Electrical Panel", "FRONT Right Battery Isolation Button")
C_101:defineToggleSwitch("FRONT_DC_BUS_TIE", 1, 3006, 316, "Electrical Panel", "FRONT DC Bus Tie")
C_101:defineToggleSwitch("FRONT_ESS_BUS_COVER", 1, 3007, 322, "Electrical Panel", "FRONT ESS BUS Cover")
C_101:definePushButton("FRONT_ESS_BUS_BTN", 1, 3008, 323, "Electrical Panel", "FRONT ESS BUS Transfer")
C_101:defineToggleSwitch("FRONT_AC_INVERTER", 1, 3009, 319, "Electrical Panel", "FRONT AC Inverter Norm/Alt")
C_101:define3PosTumb("FRONT_GEN_SW", 1, 3010, 317, "Electrical Panel", "FRONT Generator ON/OFF/RESET")
C_101:define3PosTumb("FRONT_GEN_TEST_SW", 1, 3011, 318, "Electrical Panel", "FRONT Generator GROUND FAULT/OVERVOLTAGE Test")
C_101:defineToggleSwitch("BACK_L_BATT_ISO_COVER", 1, 3400, 935, "Electrical Panel", "BACK Left Battery Isolation Cover")
C_101:definePushButton("BACK_L_BATT_ISO_BTN", 1, 3401, 936, "Electrical Panel", "BACK Left Battery Isolation Button")
C_101:defineToggleSwitch("BACK_R_BATT_ISO_COVER", 1, 3402, 937, "Electrical Panel", "BACK Right Battery Isolation Cover")
C_101:definePushButton("BACK_R_BATT_ISO_BTN", 1, 3403, 938, "Electrical Panel", "BACK Right Battery Isolation Button")
C_101:defineToggleSwitch("BACK_ESS_BUS_COVER", 1, 3404, 933, "Electrical Panel", "BACK ESS BUS Cover")
C_101:definePushButton("BACK_ESS_BUS_BTN", 1, 3405, 934, "Electrical Panel", "BACK ESS BUS Transfer")

--CAWS Lighting/Test
C_101:defineToggleSwitch("FRONT_CAWS_BRIGHT_DIM", 1, 3012, 320, "CAWS Lighting", "FRONT CAWS Panel Bright/Dim")
C_101:definePushButton("FRONT_LAMP_TEST", 1, 3013, 321, "CAWS Lighting", "FRONT Lamp Test")
C_101:defineToggleSwitch("BACK_CAWS_BRIGHT_DIM", 1, 3406, 931, "CAWS Lighting", "BACK CAWS Panel Bright/Dim")
C_101:definePushButton("BACK_LAMP_TEST", 1, 3407, 932, "CAWS Lighting", "BACK Lamp Test")

--Primary ADI
C_101:definePushButton("FRONT_PRI_ADI_TEST", 1, 3166, 117, "ADI", "FRONT Primary ADI Test")
C_101:definePushButton("BACK_PRI_ADI_TEST", 1, 3688, 995, "ADI", "BACK Primary ADI Test")

--Backup ADI
C_101:definePushButton("FRONT_BAK_ADI_CAGE_BNT", 1, 3014, 41, "ADI", "FRONT Cage Standby Attitude Indicator Button")
C_101:definePotentiometer("FRONT_BAK_ADI_CAGE_KNOB", 1, 3241, 533, { 0, 1 }, "ADI", "FRONT Cage Standby Attitude Indicator Knob")
C_101:definePushButton("BACK_BAK_ADI_CAGE_BNT", 1, 3408, 782, "ADI", "BACK Cage Standby Attitude Indicator Button")
C_101:definePotentiometer("BACK_BAK_ADI_CAGE_KNOB", 1, 3409, 783, { 0, 1 }, "ADI", "BACK Cage Standby Attitude Indicator Knob")

--ALTIMETER
C_101:defineRotary("FRONT_ALTIMETER_KNOB", 1, 3015, 66, "Altimeter", "FRONT Altimeter Baro Adjust")
C_101:defineRotary("BACK_ALTIMETER_KNOB", 1, 3410, 792, "Altimeter", "BACK Altimeter Baro Adjust")

--CAWS ALERT RESET
C_101:definePushButton("FRONT_CAWS_FAULT_RESET", 1, 3016, 513, "CAWS Alert", "FRONT Fault Alert Reset")
C_101:definePushButton("FRONT_CAWS_FIRE_RESET", 1, 3017, 514, "CAWS Alert", "FRONT Fire Alert Reset")
C_101:definePushButton("FRONT_CAWS_CAUTION_RESET", 1, 3018, 515, "CAWS Alert", "FRONT Caution Alert Reset")
C_101:definePushButton("BACK_CAWS_FAULT_RESET", 1, 3412, 634, "CAWS Alert", "BACK Fault Alert Reset")
C_101:definePushButton("BACK_CAWS_FIRE_RESET", 1, 3413, 636, "CAWS Alert", "BACK Fire Alert Reset")
C_101:definePushButton("BACK_CAWS_CAUTION_RESET", 1, 3414, 637, "CAWS Alert", "BACK Caution Alert Reset")

--CRS AND HDG BUGS
C_101:defineRotary("FRONT_CRS_KNOB", 1, 3029, 344, "CRS HDG Bugs", "FRONT Course Knob")
C_101:defineRotary("FRONT_HDG_KNOB", 1, 3030, 345, "CRS HDG Bugs", "FRONT Heading Knob")
C_101:defineRotary("BACK_CRS_KNOB", 1, 3525, 943, "CRS HDG Bugs", "BACK Course Knob")
C_101:defineRotary("BACK_HDG_KNOB", 1, 3526, 944, "CRS HDG Bugs", "BACK Heading Knob")

--CANOPY
C_101:defineToggleSwitch("FRONT_CANOPY_SAFE", 1, 3040, 11, "Canopy", "FRONT Canopy Safety Catch")
C_101:defineToggleSwitch("FRONT_CANOPY_LOCK", 1, 3041, 13, "Canopy", "FRONT Canopy Locking Handle")
C_101:defineToggleSwitch("BACK_CANOPY_SAFE", 1, 3508, 750, "Canopy", "BACK Canopy Safety Catch")
C_101:defineToggleSwitch("BACK_CANOPY_LOCK", 1, 3509, 749, "Canopy", "BACK Canopy Locking Handle")

--G METER
C_101:definePushButton("FRONT_GMETER_RESET", 1, 3042, 25, "G Meter", "FRONT Reset Max/Min Needles")
C_101:definePushButton("BACK_GMETER_RESET", 1, 3415, 774, "G Meter", "BACK Reset Max/Min Needles")

--COCKPIT LIGHTING
C_101:defineTumb("FRONT_LIGHTS_FLOODRED", 2, 3102, 370, 0.5, { 0, 1 }, nil, false, "Cockpit Lighting", "FRONT Red Flood Lights")
C_101:defineToggleSwitch("FRONT_LIGHTS_STORM", 2, 3103, 369, "Cockpit Lighting", "FRONT Storm Lights")
C_101:definePotentiometer("FRONT_LIGHTS_CONSOLE", 2, 3104, 365, { 0, 1 }, "Cockpit Lighting", "FRONT Console Integral Lights")
C_101:definePotentiometer("FRONT_LIGHTS_INSTR", 2, 3105, 364, { 0, 1 }, "Cockpit Lighting", "FRONT Instrument Lights")
C_101:defineTumb("BACK_LIGHTS_FLOODRED", 2, 3416, 248, 0.5, { 0, 1 }, nil, false, "Cockpit Lighting", "BACK Red Flood Lights")
C_101:defineToggleSwitch("BACK_LIGHTS_STORM", 2, 3417, 249, "Cockpit Lighting", "BACK Storm Lights")
C_101:definePotentiometer("BACK_LIGHTS_CONSOLE", 2, 3418, 251, { 0, 1 }, "Cockpit Lighting", "BACK Console Integral Lights")
C_101:definePotentiometer("BACK_LIGHTS_INSTR", 2, 3419, 250, { 0, 1 }, "Cockpit Lighting", "BACK Instrument Lights")

--EXTERNAL LIGHTING
C_101:defineToggleSwitch("FRONT_LIGHTS_ANTI_COL", 2, 3106, 366, "External Lights", "FRONT Anti-Collision Becon Switch")
C_101:defineTumb("FRONT_LIGHTS_NAV", 2, 3107, 368, 0.5, { 0, 1 }, nil, false, "External Lights", "FRONT Navigation Lights Switch, DIM/OFF/BRIGHT")
C_101:defineTumb("FRONT_LIGHTS_FOR", 2, 3108, 367, 0.5, { 0, 1 }, nil, false, "External Lights", "FRONT Formation Lights Switch, DIM/OFF/BRIGHT")
C_101:defineTumb("FRONT_LIGHTS_TAXI_L", 2, 3109, 329, 0.5, { 0, 1 }, nil, false, "External Lights", "FRONT Left Taxi/Landing Lights Switch, RETRACT/TAXI/LAND")
C_101:defineTumb("FRONT_LIGHTS_TAXI_R", 2, 3110, 330, 0.5, { 0, 1 }, nil, false, "External Lights", "FRONT Right Taxi/Landing Lights Switch, RETRACT/TAXI/LAND")
C_101:defineToggleSwitch("BACK_LIGHTS_PRIO_TAXI_L", 2, 3420, 941, "External Lights", "BACK Left Taxi/Landing Lights Forward Cockpit Priority")
C_101:defineToggleSwitch("BACK_LIGHTS_PRIO_TAXI_R", 2, 3421, 942, "External Lights", "BACK Right Taxi/Landing Lights Forward Cockpit Priority")

--FUEL PANEL
C_101:defineToggleSwitch("FRONT_FUSE_TANK_PUMP_COVER", 1, 3044, 119, "Fuel Panel", "FRONT Fuselage Tank Pump Cover")
C_101:defineToggleSwitch("FRONT_ENG_FUEL_VALVE_PUMP_COVER", 1, 3045, 121, "Fuel Panel", "FRONT Engine Fuel Valve Cover")
C_101:definePushButton("FRONT_FUSE_TANK_PUMP", 1, 3046, 120, "Fuel Panel", "FRONT Fuselage Tank Pump Button")
C_101:definePushButton("FRONT_ENG_FUEL_VALVE_PUMP", 1, 3047, 122, "Fuel Panel", "FRONT Engine Fuel Valve Button")
C_101:definePushButton("FRONT_CENTER_WING_TANK_QTY", 1, 3048, 123, "Fuel Panel", "FRONT Center Wing Tank Qty Button")
C_101:definePushButton("FRONT_TEST_FUEL_QTY", 1, 3049, 124, "Fuel Panel", "FRONT Test Fuel Qty Indicator Button")
C_101:defineMultipositionSwitch("FRONT_FUEL_TRANS_L", 1, 3050, 130, 3, 0.5, "Fuel Panel", "FRONT Fuel Transfer Left")
C_101:defineMultipositionSwitch("FRONT_FUEL_TRANS_C1", 1, 3051, 131, 3, 0.5, "Fuel Panel", "FRONT Fuel Transfer Center 1")
C_101:defineMultipositionSwitch("FRONT_FUEL_TRANS_C2", 1, 3052, 132, 3, 0.5, "Fuel Panel", "FRONT Fuel Transfer Center 2")
C_101:defineMultipositionSwitch("FRONT_FUEL_TRANS_R", 1, 3053, 133, 3, 0.5, "Fuel Panel", "FRONT Fuel Transfer Right")
C_101:defineToggleSwitch("BACK_FUSE_TANK_PUMP_COVER", 1, 3474, 812, "Fuel Panel", "BACK Fuselage Tank Pump Cover")
C_101:defineToggleSwitch("BACK_ENG_FUEL_VALVE_PUMP_COVER", 1, 3475, 814, "Fuel Panel", "BACK Engine Fuel Valve Cover")
C_101:definePushButton("BACK_FUSE_TANK_PUMP", 1, 3476, 813, "Fuel Panel", "BACK Fuselage Tank Pump Button")
C_101:definePushButton("BACK_ENG_FUEL_VALVE_PUMP", 1, 3477, 815, "Fuel Panel", "BACK Engine Fuel Valve Button")
C_101:definePushButton("BACK_CENTER_WING_TANK_QTY", 1, 3478, 816, "Fuel Panel", "BACK Center Wing Tank Qty Button")
C_101:defineMultipositionSwitch("BACK_FUEL_TRANS_L", 1, 3480, 818, 3, 0.5, "Fuel Panel", "BACK Fuel Transfer Left/Fwd Cockpit Priority")
C_101:defineMultipositionSwitch("BACK_FUEL_TRANS_C1", 1, 3481, 819, 3, 0.5, "Fuel Panel", "BACK Fuel Transfer Center 1/Fwd Cockpit Priority")
C_101:defineMultipositionSwitch("BACK_FUEL_TRANS_C2", 1, 3482, 820, 3, 0.5, "Fuel Panel", "BACK Fuel Transfer Center 2/Fwd Cockpit Priority")
C_101:defineMultipositionSwitch("BACK_FUEL_TRANS_R", 1, 3483, 821, 3, 0.5, "Fuel Panel", "BACK Fuel Transfer Right/Fwd Cockpit Priority")
C_101:definePushButton("FRONT_FUEL_FLOW_RESET", 1, 3234, 32, "Fuel Panel", "FRONT Fuel Flow Reset")
C_101:definePushButton("FRONT_FUEL_FLOW_TEST", 1, 3235, 342, "Fuel Panel", "FRONT Fuel Flow Test")
C_101:definePushButton("BACK_FUEL_FLOW_RESET", 1, 3441, 779, "Fuel Panel", "BACK Fuel Flow Reset")

--CIRCUIT BREAKERS
C_101:defineToggleSwitch("FRONT_CB_ENG_GEN", 1, 3054, 427, "CB Panel", "FRONT Circuit Breaker Engine Generator")
C_101:defineToggleSwitch("FRONT_CB_ENG_COMP", 1, 3087, 428, "CB Panel", "FRONT Circuit Breaker Engine Computer")
C_101:defineToggleSwitch("FRONT_CB_RPM_N2", 1, 3062, 429, "CB Panel", "FRONT Circuit Breaker RPM N2")
C_101:defineToggleSwitch("FRONT_CB_OIL_PRESS", 1, 3073, 430, "CB Panel", "FRONT Circuit Breaker Oil Pressure")
C_101:defineToggleSwitch("FRONT_CB_EXT_LIGHTS_RH", 1, 3089, 431, "CB Panel", "FRONT Circuit Breaker Position Lights RH LAND/TAXI Lights")
C_101:defineToggleSwitch("FRONT_CB_AIR_COND", 1, 3071, 432, "CB Panel", "FRONT Circuit Breaker Air-Conditioning/Pressurization")
C_101:defineToggleSwitch("FRONT_CB_ELE_TRIM_PW", 1, 3088, 433, "CB Panel", "FRONT Circuit Breaker Elevator Trim Power")
C_101:defineToggleSwitch("FRONT_CB_ABRAKE_ANTISKID", 1, 3072, 434, "CB Panel", "FRONT Circuit Breaker Air-Brake/Anti-Skid Operation")
C_101:defineToggleSwitch("FRONT_CB_GEAR", 1, 3058, 435, "CB Panel", "FRONT Circuit Breaker Landing Gear")
C_101:defineToggleSwitch("FRONT_CB_VOR_DC", 1, 3070, 438, "CB Panel", "FRONT Circuit Breaker VOR DC")
C_101:defineToggleSwitch("FRONT_CB_RPM_N1", 1, 3061, 439, "CB Panel", "FRONT Circuit Breaker RPM N1")
C_101:defineToggleSwitch("FRONT_CB_ITT", 1, 3063, 440, "CB Panel", "FRONT Circuit Breaker ITT")
C_101:defineToggleSwitch("FRONT_CB_OIL_TMP", 1, 3081, 441, "CB Panel", "FRONT Circuit Breaker Oil Temperature Indicator")
C_101:defineToggleSwitch("FRONT_CB_ANTICE_RAIN", 1, 3083, 442, "CB Panel", "FRONT Circuit Breaker Anti-Ice/Rain Repellent")
C_101:defineToggleSwitch("FRONT_CB_ENG_START", 1, 3085, 443, "CB Panel", "FRONT Circuit Breaker Enginer Starter")
C_101:defineToggleSwitch("FRONT_CB_PITOT_STALL", 1, 3082, 444, "CB Panel", "FRONT Circuit Breaker PITOT Heat/Stall Warning System")
C_101:defineToggleSwitch("FRONT_CB_EXT_LIGHTS_LH", 1, 3101, 445, "CB Panel", "FRONT Circuit Breaker LH LAND/TAXI Lights")
C_101:defineToggleSwitch("FRONT_CB_NORM_INV", 1, 3055, 446, "CB Panel", "FRONT Circuit Breaker Normal Inverter")
C_101:defineToggleSwitch("FRONT_CB_GEAR_BRAKE_IND", 1, 3068, 447, "CB Panel", "FRONT Circuit Breaker Langing Gear/Airbrake/Trim Indicators")
C_101:defineToggleSwitch("FRONT_CB_FLAP_AILERON_IND", 1, 3084, 448, "CB Panel", "FRONT Circuit Breaker Flaps/Aileron Indicators")
C_101:defineToggleSwitch("FRONT_CB_OXY_HYD_IND", 1, 3069, 449, "CB Panel", "FRONT Circuit Breaker Oxygen/Hydraulic Press Indicators")
C_101:defineToggleSwitch("FRONT_CB_CAUTION_PANEL", 1, 3057, 450, "CB Panel", "FRONT Circuit Breaker Caution/Warning Panel")
C_101:defineToggleSwitch("FRONT_CB_BAK_INV", 1, 3056, 451, "CB Panel", "FRONT Circuit Breaker Backup Inverter")
C_101:defineToggleSwitch("FRONT_CB_C_WING_PUMPS", 1, 3075, 452, "CB Panel", "FRONT Circuit Breaker Center Wing Tank Pumps")
C_101:defineToggleSwitch("FRONT_CB_INSTR_STORM_ACOL_L", 1, 3094, 454, "CB Panel", "FRONT Circuit Breaker Instrument, Strom, Anti-Collision Lights")
C_101:defineToggleSwitch("FRONT_CB_SEAT", 1, 3096, 463, "CB Panel", "FRONT Circuit Breaker Seat Adjustment")
C_101:defineToggleSwitch("FRONT_CB_O_WING_PUMPS", 1, 3076, 464, "CB Panel", "FRONT Circuit Breaker Outer Wing Tank Pumps")
C_101:defineToggleSwitch("FRONT_CB_FUSELAGE_PUMP", 1, 3074, 467, "CB Panel", "FRONT Circuit Breaker Fuselage Tank Pump")
C_101:defineToggleSwitch("FRONT_CB_FIRE_DETECTOR", 1, 3091, 468, "CB Panel", "FRONT Circuit Breaker Fire Detector")
C_101:defineToggleSwitch("FRONT_CB_FORM_LIGHTS", 1, 3098, 456, "CB Panel", "FRONT Circuit Breaker Formation Lights")
C_101:defineToggleSwitch("FRONT_CB_GPS", 1, 3511, 1376, "CB Panel", "FRONT Circuit Breaker GPS")
C_101:defineToggleSwitch("BACK_CB_VOR_DC", 1, 3499, 949, "CB Panel", "BACK Circuit Breaker VOR DC")
C_101:defineToggleSwitch("BACK_CB_ENG_START", 1, 3504, 950, "CB Panel", "BACK Circuit Breaker Enginer Starter")
C_101:defineToggleSwitch("BACK_CB_OIL_TMP", 1, 3500, 951, "CB Panel", "BACK Circuit Breaker Oil Temperature Indicator")
C_101:defineToggleSwitch("BACK_CB_ITT", 1, 3497, 952, "CB Panel", "BACK Circuit Breaker ITT")
C_101:defineToggleSwitch("BACK_CB_RPM_N1", 1, 3495, 953, "CB Panel", "BACK Circuit Breaker RPM N1")
C_101:defineToggleSwitch("BACK_CB_RPM_N2", 1, 3496, 954, "CB Panel", "BACK Circuit Breaker RPM N2")
C_101:defineToggleSwitch("BACK_CB_OXY_HYD_IND", 1, 3498, 955, "CB Panel", "BACK Circuit Breaker Oxygen/Hydraulic Press Indicators")
C_101:defineToggleSwitch("BACK_CB_SEAT", 1, 3506, 956, "CB Panel", "BACK Circuit Breaker Seat Adjustment")
C_101:defineToggleSwitch("BACK_CB_INSTR_STORM_ACOL_L", 1, 3502, 957, "CB Panel", "BACK Circuit Breaker Instrument, Strom, Anti-Collision Lights")
C_101:defineToggleSwitch("BACK_CB_BAK_ADI", 1, 3494, 959, "CB Panel", "BACK Circuit Breaker Backup ADI")
C_101:defineToggleSwitch("BACK_CB_CPT_LIGHTS_RED", 1, 3501, 960, "CB Panel", "BACK Circuit Breaker Red Cockpit Lights")
C_101:defineToggleSwitch("BACK_CB_INTERPHONE", 1, 3505, 961, "CB Panel", "BACK Circuit Breaker Interphone")
C_101:defineToggleSwitch("BACK_CB_CONSOLE_LIGHTS", 1, 3503, 958, "CB Panel", "BACK Circuit Breaker Console Lights")
C_101:defineToggleSwitch("BACK_CB_GPS", 1, 3517, 1378, "CB Panel", "BACK Circuit Breaker GPS")

--ENGINE START PANEL
C_101:definePushButton("FRONT_GPU", 1, 3038, 134, "Engine Start Panel", "FRONT GPU Button")
C_101:definePushButton("FRONT_COMPUTER", 1, 3111, 136, "Engine Start Panel", "FRONT Computer Button")
C_101:definePushButton("FRONT_ANTI_ICE", 1, 3112, 135, "Engine Start Panel", "FRONT ANTI-ICE Button")
C_101:defineToggleSwitch("FRONT_START_MODE_SEL", 1, 3113, 137, "Engine Start Panel", "FRONT Starter Mode Selector")
C_101:definePushButton("FRONT_ABORT", 1, 3114, 138, "Engine Start Panel", "FRONT GPU Button")
C_101:define3PosTumb("FRONT_CONT_ING_START", 1, 3115, 139, "Engine Start Panel", "FRONT Continuous Ignition/Start")
C_101:definePushButton("FRONT_ENG_START_TEST_BTN", 1, 3116, 525, "Engine Start Panel", "FRONT Engine Start Test Button")
C_101:definePotentiometer("FRONT_ENG_START_TEST_KNB", 1, 3536, 1273, { 0, 1 }, "Engine Start Panel", "FRONT Engine Start Test Knob")
C_101:definePushButton("BACK_GPU", 1, 3422, 822, "Engine Start Panel", "BACK GPU Button")
C_101:definePushButton("BACK_COMPUTER", 1, 3423, 824, "Engine Start Panel", "BACK Computer Button")
C_101:definePushButton("BACK_ANTI_ICE", 1, 3424, 823, "Engine Start Panel", "BACK ANTI-ICE Button")
C_101:defineToggleSwitch("BACK_START_MODE_SEL", 1, 3425, 825, "Engine Start Panel", "BACK Starter Mode Selector")
C_101:definePushButton("BACK_ABORT", 1, 3426, 826, "Engine Start Panel", "BACK GPU Button")
C_101:define3PosTumb("BACK_CONT_ING_START", 1, 3427, 827, "Engine Start Panel", "BACK Continuous Ignition/Start")
C_101:definePushButton("BACK_ENG_START_TEST_BTN", 1, 3428, 828, "Engine Start Panel", "BACK Engine Start Test Button")
C_101:definePotentiometer("BACK_ENG_START_TEST_KNB", 1, 3537, 1275, { 0, 1 }, "Engine Start Panel", "BACK Engine Start Test Knob")

--OXYGEN SYSTEM
C_101:defineToggleSwitch("FRONT_OXY_SUPPLY", 1, 3117, 425, "Oxygen System", "FRONT Oxygen Supply")
C_101:defineToggleSwitch("FRONT_OXY_REGULATOR", 1, 3996, 997, "Oxygen System", "FRONT Oxygen Regulator - 100%/AIRMIX")
C_101:defineToggleSwitch("BACK_OXY_SUPPLY", 1, 3429, 253, "Oxygen System", "BACK Oxygen Supply")
C_101:defineToggleSwitch("BACK_OXY_REGULATOR", 1, 3997, 999, "Oxygen System", "BACK Oxygen Regulator - 100%/AIRMIX")

--CLOCK
C_101:definePushButton("FRONT_CHRONO", 1, 3149, 519, "Clock", "FRONT Chronograph")
C_101:definePushButton("FRONT_CLOCK_BTN", 1, 3147, 518, "Clock", "FRONT Set Clock Button")
C_101:defineRotary("FRONT_CLOCK_KNOB", 1, 3148, 517, "Clock", "FRONT Set Clock Knob")
C_101:definePushButton("BACK_CHRONO", 1, 3433, 811, "Clock", "BACK Chronograph")
C_101:definePushButton("BACK_CLOCK_BTN", 1, 3431, 810, "Clock", "BACK Set Clock Button")
C_101:defineRotary("BACK_CLOCK_KNOB", 1, 3432, 809, "Clock", "BACK Set Clock Knob")

--EMERGENCY LANDING GEAR EXTEND
C_101:defineToggleSwitch("FRONT_EMERG_GEAR", 1, 3150, 197, "Emergency", "FRONT Emergency Landing Gear Extension")
C_101:defineToggleSwitch("BACK_EMERG_GEAR", 1, 3435, 843, "Emergency", "BACK Emergency Landing Gear Extension")

--EMERGENCY AIR BRAKE RETRACT
C_101:definePushButton("FRONT_EMERG_AIRBRAKE", 1, 3151, 147, "Emergency", "FRONT Emergency Air-Brake Retract")
C_101:definePushButton("BACK_EMERG_AIRBRAKE", 1, 3436, 831, "Emergency", "BACK Emergency Air-Brake Retract")

--EMERGENCY AILERON HYD DISCONNECT
C_101:defineToggleSwitch("FRONT_EMERG_AILERON_COVER", 1, 3152, 144, "Emergency", "FRONT Aileron Hydraulic Override Cover")
C_101:definePushButton("FRONT_EMERG_AILERON", 1, 3153, 145, "Emergency", "FRONT Aileron Hydraulic Override")
C_101:defineToggleSwitch("BACK_EMERG_AILERON_COVER", 1, 3466, 829, "Emergency", "BACK Aileron Hydraulic Override Cover")
C_101:definePushButton("BACK_EMERG_AILERON", 1, 3467, 830, "Emergency", "BACK Aileron Hydraulic Override")

--EMERGENCY PITCH TRIM
C_101:defineToggleSwitch("FRONT_EMERG_ELEVATOR_TRIM_COVER", 1, 3156, 149, "Emergency", "FRONT Emergency Elevator Trim Switch Cutout Guard")
C_101:define3PosTumb("FRONT_EMERG_ELEVATOR_TRIM", 1, 3157, 148, "Emergency", "FRONT Emergency Elevator Trim Switch")
C_101:definePushButton("FRONT_PITCH_TRIM_L_TEST_BTN", 1, 3158, 526, "Emergency", "FRONT Pitch Trim Disc Lamp Test Button")
C_101:definePotentiometer("FRONT_PITCH_TRIM_L_TEST_KNOB", 1, 3552, 1274, { 0, 1 }, "Emergency", "FRONT Pitch Trim Disc Lamp Test Knob")
C_101:define3PosTumb("FRONT_SEAT_HEIGHT", 1, 3280, 193, "Emergency", "FRONT Seat Height Adjustment")
C_101:defineToggleSwitch("FRONT_CB_PITCH_TRIM", 1, 3160, 195, "Emergency", "FRONT Pitch Trim Breaker")
C_101:defineToggleSwitch("BACK_EMERG_ELEVATOR_TRIM_COVER", 1, 3468, 833, "Emergency", "BACK Emergency Elevator Trim Switch Cutout Guard")
C_101:define3PosTumb("BACK_EMERG_ELEVATOR_TRIM", 1, 3469, 832, "Emergency", "BACK Emergency Elevator Trim Switch")
C_101:definePushButton("BACK_PITCH_TRIM_L_TEST_BTN", 1, 3470, 534, "Emergency", "BACK Pitch Trim Disc Lamp Test Button")
C_101:definePotentiometer("BACK_PITCH_TRIM_L_TEST_KNOB", 1, 3553, 1276, { 0, 1 }, "Emergency", "BACK Pitch Trim Disc Lamp Test Knob")
C_101:define3PosTumb("BACK_SEAT_HEIGHT", 1, 3471, 841, "Emergency", "BACK Seat Height Adjustment")

--RED PANEL LIGHT ADJUSTMENTS
C_101:definePotentiometer("FRONT_RED_FLOODLIGHT_L_CONSOLE", 1, 3227, 258, { 0, 1 }, "Red Panel Lights", "FRONT Red Floodlight Left Console")
C_101:definePotentiometer("FRONT_RED_FLOODLIGHT_L_CENTER", 1, 3228, 259, { 0, 1 }, "Red Panel Lights", "FRONT Red Floodlight Left Center Panel")
C_101:definePotentiometer("FRONT_RED_FLOODLIGHT_R_CENTER", 1, 3230, 261, { 0, 1 }, "Red Panel Lights", "FRONT Red Floodlight Right Center Panel")
C_101:definePotentiometer("FRONT_RED_FLOODLIGHT_R_CONSOLE", 1, 3231, 262, { 0, 1 }, "Red Panel Lights", "FRONT Red Floodlight Right Console")
C_101:definePotentiometer("BACK_RED_FLOODLIGHT_L_CONSOLE", 1, 3437, 263, { 0, 1 }, "Red Panel Lights", "BACK Red Floodlight Left Console")
C_101:definePotentiometer("BACK_RED_FLOODLIGHT_L_CENTER", 1, 3438, 264, { 0, 1 }, "Red Panel Lights", "BACK Red Floodlight Left Center Panel")
C_101:definePotentiometer("BACK_RED_FLOODLIGHT_R_CENTER", 1, 3439, 266, { 0, 1 }, "Red Panel Lights", "BACK Red Floodlight Right Center Panel")
C_101:definePotentiometer("BACK_RED_FLOODLIGHT_R_CONSOLE", 1, 3440, 267, { 0, 1 }, "Red Panel Lights", "BACK Red Floodlight Right Console")

--MARKER BEACON TEST LIGHTS
C_101:definePushButton("FRONT_MARKER_TEST_BTN_OUT", 1, 3167, 528, "Beacon Test", "FRONT Outer Marker Lamp Test Button")
C_101:definePotentiometer("FRONT_MARKER_TEST_KNOB_OUT", 1, 3530, 1255, { 0, 1 }, "Beacon Test", "FRONT Outer Marker Lamp Test Knob")
C_101:definePushButton("FRONT_MARKER_TEST_BTN_MID", 1, 3168, 527, "Beacon Test", "FRONT Middle Marker Lamp Test Button")
C_101:definePotentiometer("FRONT_MARKER_TEST_KNOB_MID", 1, 3529, 1254, { 0, 1 }, "Beacon Test", "FRONT Middle Marker Lamp Test Knob")
C_101:definePushButton("FRONT_MARKER_TEST_BTN_INN", 1, 3169, 529, "Beacon Test", "FRONT Inner Marker Lamp Test Button")
C_101:definePotentiometer("FRONT_MARKER_TEST_KNOB_INN", 1, 3528, 1253, { 0, 1 }, "Beacon Test", "FRONT Inner Marker Lamp Test Knob")
C_101:definePushButton("BACK_MARKER_TEST_BTN_OUT", 1, 3444, 968, "Beacon Test", "BACK Outer Marker Lamp Test Button")
C_101:definePotentiometer("BACK_MARKER_TEST_KNOB_OUT", 1, 3533, 1260, { 0, 1 }, "Beacon Test", "BACK Outer Marker Lamp Test Knob")
C_101:definePushButton("BACK_MARKER_TEST_BTN_MID", 1, 3445, 969, "Beacon Test", "BACK Middle Marker Lamp Test Button")
C_101:definePotentiometer("BACK_MARKER_TEST_KNOB_MID", 1, 3532, 1259, { 0, 1 }, "Beacon Test", "BACK Middle Marker Lamp Test Knob")
C_101:definePushButton("BACK_MARKER_TEST_BTN_INN", 1, 3446, 970, "Beacon Test", "BACK Inner Marker Lamp Test Button")
C_101:definePotentiometer("BACK_MARKER_TEST_KNOB_INN", 1, 3531, 1258, { 0, 1 }, "Beacon Test", "BACK Inner Marker Lamp Test Knob")

--INTERCOM PANEL
C_101:defineToggleSwitch("FRONT_INTER_INT_SW", 6, 3001, 280, "Intercom", "FRONT Intercom INT Switch")
C_101:definePotentiometer("FRONT_INTER_INT_VOL", 6, 3002, 394, { 0, 1 }, "Intercom", "FRONT Intercom INT Volume")
C_101:defineToggleSwitch("FRONT_INTER_VHF_SW", 6, 3003, 282, "Intercom", "FRONT Intercom VHF Switch")
C_101:definePotentiometer("FRONT_INTER_VHF_VOL", 6, 3004, 396, { 0, 1 }, "Intercom", "FRONT Intercom VHF Volume")
C_101:defineToggleSwitch("FRONT_INTER_HM_SW", 6, 3005, 283, "Intercom", "FRONT Intercom HM Switch")
C_101:definePotentiometer("FRONT_INTER_HM_VOL", 6, 3006, 397, { 0, 1 }, "Intercom", "FRONT Intercom HM Volume")
C_101:defineToggleSwitch("FRONT_INTER_VOR_SW", 6, 3007, 285, "Intercom", "FRONT Intercom VOR Switch")
C_101:definePotentiometer("FRONT_INTER_VOR_VOL", 6, 3008, 399, { 0, 1 }, "Intercom", "FRONT Intercom VOR Volume")
C_101:defineToggleSwitch("FRONT_INTER_MK_SW", 6, 3009, 286, "Intercom", "FRONT Intercom MK Switch")
C_101:definePotentiometer("FRONT_INTER_MK_VOL", 6, 3010, 400, { 0, 1 }, "Intercom", "FRONT Intercom MK Volume")
C_101:defineToggleSwitch("FRONT_CB_HOTMIC", 6, 3011, 287, "Intercom", "FRONT Circuit Breaker TALK (Hot Mic)")
C_101:definePushButton("FRONT_CALL_BTN", 6, 3012, 402, "Intercom", "FRONT Call Button")
C_101:definePotentiometer("FRONT_INTER_VOL", 6, 3013, 403, { 0, 1 }, "Intercom", "FRONT Intercom Volume")
C_101:defineToggleSwitch("BACK_INTER_INT_SW", 6, 3024, 884, "Intercom", "BACK Intercom INT Switch")
C_101:definePotentiometer("BACK_INTER_INT_VOL", 6, 3025, 894, { 0, 1 }, "Intercom", "BACK Intercom INT Volume")
C_101:defineToggleSwitch("BACK_INTER_VHF_SW", 6, 3026, 886, "Intercom", "BACK Intercom VHF Switch")
C_101:definePotentiometer("BACK_INTER_VHF_VOL", 6, 3027, 896, { 0, 1 }, "Intercom", "BACK Intercom VHF Volume")
C_101:defineToggleSwitch("BACK_INTER_HM_SW", 6, 3028, 887, "Intercom", "BACK Intercom HM Switch")
C_101:definePotentiometer("BACK_INTER_HM_VOL", 6, 3029, 897, { 0, 1 }, "Intercom", "BACK Intercom HM Volume")
C_101:defineToggleSwitch("BACK_INTER_VOR_SW", 6, 3030, 889, "Intercom", "BACK Intercom VOR Switch")
C_101:definePotentiometer("BACK_INTER_VOR_VOL", 6, 3031, 899, { 0, 1 }, "Intercom", "BACK Intercom VOR Volume")
C_101:defineToggleSwitch("BACK_INTER_MK_SW", 6, 3032, 890, "Intercom", "BACK Intercom MK Switch")
C_101:definePotentiometer("BACK_INTER_MK_VOL", 6, 3033, 901, { 0, 1 }, "Intercom", "BACK Intercom MK Volume")
C_101:defineToggleSwitch("BACK_CB_HOTMIC", 6, 3034, 891, "Intercom", "BACK Circuit Breaker TALK (Hot Mic)")
C_101:definePushButton("BACK_CALL_BTN", 6, 3035, 945, "Intercom", "BACK Call Button")
C_101:definePotentiometer("BACK_INTER_VOL", 6, 3036, 946, { 0, 1 }, "Intercom", "BACK Intercom Volume")

--MISC FUNCTIONS
C_101:definePushButton("FRONT_ANTISKITD_PW", 1, 3043, 516, "Misc", "FRONT Antiskid ON/OFF")
C_101:definePushButton("FRONT_NAV_PRIO", 1, 3119, 336, "Misc", "FRONT NAV Priority")
C_101:definePushButton("FRONT_UHF_PRIO", 1, 3162, 334, "Misc", "FRONT UHF Priority")
C_101:definePushButton("FRONT_VHF_PRIO", 1, 3163, 335, "Misc", "FRONT VHF Priority")
C_101:definePushButton("FRONT_PITOT_PW", 1, 3201, 328, "Misc", "FRONT Pitot Heat ON/OFF")
C_101:definePushButton("FRONT_GEAR_MUTE", 1, 3202, 17, "Misc", "FRONT Landing Gear Warning Mute")
C_101:definePushButton("FRONT_GEAR_OVER", 1, 3232, 308, "Misc", "FRONT Landing Gear Override")
C_101:definePushButton("BACK_ANTISKITD_PW", 1, 3484, 638, "Misc", "BACK Antiskid ON/OFF")
C_101:definePushButton("BACK_NAV_PRIO", 1, 3485, 839, "Misc", "BACK NAV Priority")
C_101:definePushButton("BACK_UHF_PRIO", 1, 3486, 837, "Misc", "BACK UHF Priority")
C_101:definePushButton("BACK_VHF_PRIO", 1, 3487, 838, "Misc", "BACK VHF Priority")
C_101:definePushButton("BACK_PITOT_PW", 1, 3488, 940, "Misc", "BACK Pitot Heat ON/OFF")
C_101:definePushButton("BACK_GEAR_MUTE", 1, 3489, 770, "Misc", "BACK Landing Gear Warning Mute")
C_101:definePushButton("BACK_GEAR_OVER", 1, 3490, 939, "Misc", "BACK Landing Gear Override")
C_101:defineToggleSwitch("FRONT_PARK_BRAKE_LVR", 1, 3238, 333, "Misc", "FRONT Parking Brake Lever")
C_101:defineToggleSwitch("BACK_PARK_BRAKE_LVR", 1, 3492, 65, "Misc", "BACK Parking Brake Lever")
C_101:defineTumb("FRONT_RUDDER_ADJ_H", 1, 3888, 1279, 2, { -1, 1 }, nil, false, "Misc", "FRONT Adjust Rudder Pedals Handle")
C_101:definePotentiometer("FRONT_RUDDER_ADJ", 1, 3240, 311, { 0, 1 }, "Misc", "FRONT Adjust Rudder Pedals")
C_101:defineTumb("BACK_RUDDER_ADJ_H", 1, 3889, 1280, 2, { -1, 1 }, nil, false, "Misc", "BACK Adjust Rudder Pedals Handle")
C_101:definePotentiometer("BACK_RUDDER_ADJ", 1, 3696, 1202, { 0, 1 }, "Misc", "BACK Adjust Rudder Pedals")
C_101:defineMultipositionSwitch("FRONT_FLAP_SEL", 1, 3224, 14, 3, 0.5, "Misc", "FRONT Flap Position Selector")
C_101:defineToggleSwitch("FRONT_CPT_EMERG_JETT", 1, 3226, 12, "Misc", "FRONT Canopy Emergency Jettison")
C_101:definePotentiometer("FRONT_THROTTLE_FRICTION", 1, 3243, 16, nil, "Misc", "FRONT Throttle Friction")
C_101:definePotentiometer("FRONT_HARNESS_CONTROL", 1, 3244, 94, { 0, 1 }, "Misc", "FRONT Shouldern Harness Control Handle")
C_101:defineToggleSwitch("FRONT_EJECT_HANDLE", 1, 3245, 536, "Misc", "FRONT Ejection Handle")
C_101:defineToggleSwitch("FRONT_EJECT_HANDLE_COVER", 1, 3246, 538, "Misc", "FRONT Ejection Handle Safety")
C_101:defineToggleSwitch("FRONT_MAN_SEPERATION_HANDLE", 1, 3247, 537, "Misc", "FRONT Manual Seperation Handle")
C_101:definePotentiometer("FRONT_STORAGE_BOX", 1, 3248, 296, { 0, 1 }, "Misc", "FRONT Storage Box Cover")
C_101:definePotentiometer("FRONT_AIR_VENT", 1, 3800, 101, nil, "Misc", "FRONT Air Vent")
C_101:defineToggleSwitch("FRONT_GEAR_HANDLE", 1, 3250, 8, "Misc", "FRONT Landing Gear Handle")
C_101:defineMultipositionSwitch("BACK_FLAP_SEL", 1, 3514, 38, 3, 0.5, "Misc", "BACK Flap Position Selector")
C_101:defineToggleSwitch("BACK_CPT_EMERG_JETT", 1, 3515, 302, "Misc", "BACK Canopy Emergency Jettison")
C_101:definePotentiometer("BACK_HARNESS_CONTROL", 1, 3518, 523, { 0, 1 }, "Misc", "BACK Shouldern Harness Control Handle")
C_101:defineToggleSwitch("BACK_EJECT_HANDLE", 1, 3519, 520, "Misc", "BACK Ejection Handle")
C_101:defineToggleSwitch("BACK_EJECT_HANDLE_COVER", 1, 3520, 521, "Misc", "BACK Ejection Handle Safety")
C_101:defineToggleSwitch("BACK_MAN_SEPERATION_HANDLE", 1, 3521, 522, "Misc", "BACK Manual Seperation Handle")
C_101:definePotentiometer("BACK_AIR_VENT", 1, 3523, 1230, nil, "Misc", "BACK Air Vent")
C_101:defineToggleSwitch("BACK_GEAR_HANDLE", 1, 3524, 75, "Misc", "BACK Landing Gear Handle")
C_101:defineFloat("CANOPY_POS", 1, { 0, 1 }, "Misc", "Canopy Position")

--WARNING, CAUTION AND INDICATORLIGHTS
C_101:defineIndicatorLight("FRONT_TRANS_GEAR_LIGHT", 9, "Warning, Caution and IndicatorLights", "FRONT Transition Gear Light (red)")
C_101:defineIndicatorLight("FRONT_BACK_COMPUTER_LIGHT", 143, "Warning, Caution and IndicatorLights", "FRONT/BACK Computer Light MAN (yellow)")
C_101:defineIndicatorLight("FRONT_BACK_ANTI_ICE_LIGHT", 192, "Warning, Caution and IndicatorLights", "FRONT/BACK ANTI-ICE Light ON (yellow)")
C_101:defineIndicatorLight("FRONT_BACK_ENG_START_TLIGHT", 140, "Warning, Caution and IndicatorLights", "FRONT/BACK Engine Start Test Light (yellow)")

--Externals
C_101:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_RIGHT", 227, "External Aircraft Model", "Right Speed Brake")

C_101:defineFloatFromDrawArgument("EXT_SPEED_BRAKE_LEFT", 243, "External Aircraft Model", "Left Speed Brake")

C_101:defineFloatFromDrawArgument("EXT_FORMATION_LIGHTS", 88, "External Aircraft Model", "Formation Lights")

C_101:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
C_101:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")

C_101:defineBitFromDrawArgument("EXT_STROBE_TOP", 88, "External Aircraft Model", "Top Strobe Light (white)")

C_101:defineBitFromDrawArgument("EXT_WOW_NOSE", 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
C_101:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
C_101:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")

--------------FORWARD COCKPIT ONLY FUNCTIONS
--PRESSURIZATION/AIRCON SYSTEM
C_101:defineMultipositionSwitch("FRONT_AIR_COND_MASTER", 1, 3120, 419, 3, 0.5, "Aircon System", "FRONT Air-Conditioning Master Switch")
C_101:defineToggleSwitch("FRONT_AIR_FLOW_MODE", 1, 3121, 420, "Aircon System", "FRONT Air Flow Mode")
C_101:defineToggleSwitch("FRONT_EMERG_VENT", 1, 3122, 421, "Aircon System", "FRONT Emergency Ventilation")
C_101:defineToggleSwitch("FRONT_TEMP_MODE", 1, 3123, 422, "Aircon System", "FRONT Temperatur Mode")
C_101:definePotentiometer("FRONT_TEMP_REGULATOR", 1, 3124, 423, { 0, 1 }, "Aircon System", "FRONT Temperatur Regulation Control")
C_101:defineTumb("FRONT_TEMP_CONTROL_MAN", 1, 3125, 424, 2, { -1, 1 }, nil, false, "Aircon System", "FRONT Manual Temperatur Control")

--STALL SYSTEM
C_101:define3PosTumb("FRONT_STALL_WARN_TEST", 1, 3199, 331, "Stall System", "FRONT Stall Warning Test")
C_101:defineToggleSwitch("FRONT_STALL_WARN_PW", 1, 3200, 332, "Stall System", "FRONT Stall Warning Power")

--IFF PANEL
C_101:defineMultipositionSwitch("FRONT_IFF_CODE_SEL", 1, 3203, 346, 4, 0.25, "IFF", "FRONT IFF Code Selector")
C_101:defineMultipositionSwitch("FRONT_IFF_MASTER_SW", 1, 3204, 347, 5, 0.25, "IFF", "FRONT IFF Master Switch")
C_101:defineMultipositionSwitch("FRONT_IFF_AUDIO_LIGHT", 1, 3205, 348, 3, 0.5, "IFF", "FRONT IFF Audio Light Switch")
C_101:defineToggleSwitch("FRONT_IFF_TEST_M1", 1, 3206, 349, "IFF", "FRONT IFF TEST M-1 Switch")
C_101:defineToggleSwitch("FRONT_IFF_TEST_M2", 1, 3207, 350, "IFF", "FRONT IFF TEST M-2 Switch")
C_101:defineToggleSwitch("FRONT_IFF_TEST_M3", 1, 3208, 351, "IFF", "FRONT IFF TEST M-3/A Switch")
C_101:defineToggleSwitch("FRONT_IFF_TEST_MC", 1, 3209, 352, "IFF", "FRONT IFF TEST M/C Switch")
C_101:defineMultipositionSwitch("FRONT_IFF_RAD_TEST", 1, 3210, 353, 3, 0.5, "IFF", "FRONT IFF RAD Test Switch")
C_101:defineToggleSwitch("FRONT_IFF_MODE4", 1, 3211, 354, "IFF", "FRONT IFF Mode 4")
C_101:defineMultipositionSwitch("FRONT_IFF_MODE1_X0", 1, 3212, 355, 10, 0.1, "IFF", "FRONT IFF MODE 1 - X0")
C_101:defineMultipositionSwitch("FRONT_IFF_MODE1_0X", 1, 3213, 356, 10, 0.1, "IFF", "FRONT IFF MODE 1 - 0X")
C_101:defineMultipositionSwitch("FRONT_IFF_MODE3_X000", 1, 3214, 357, 10, 0.1, "IFF", "FRONT IFF MODE 3 - X000")
C_101:defineMultipositionSwitch("FRONT_IFF_MODE3_0X00", 1, 3215, 358, 10, 0.1, "IFF", "FRONT IFF MODE 3 - 0X00")
C_101:defineMultipositionSwitch("FRONT_IFF_MODE3_00X0", 1, 3216, 359, 10, 0.1, "IFF", "FRONT IFF MODE 3 - 00X0")
C_101:defineMultipositionSwitch("FRONT_IFF_MODE3_000X", 1, 3217, 360, 10, 0.1, "IFF", "FRONT IFF MODE 3 - 000X")
C_101:definePushButton("FRONT_IFF_REPLY_TEST_BTN", 1, 3218, 530, "IFF", "FRONT IFF Reply Lamp Test Button")
C_101:definePotentiometer("FRONT_IFF_REPLY_TEST_KNOB", 1, 3534, 1256, { 0, 1 }, "IFF", "FRONT IFF Reply Lamp Test Knob")
C_101:definePushButton("FRONT_IFF_TEST_BTN", 1, 3219, 531, "IFF", "FRONT IFF Test Button")
C_101:definePotentiometer("FRONT_IFF_TEST_KNOB", 1, 3535, 1257, { 0, 1 }, "IFF", "FRONT IFF Test Knob")
C_101:defineMultipositionSwitch("FRONT_IFF_IDENT", 1, 3220, 361, 3, 0.5, "IFF", "FRONT IFF Ident Switch")

--MISC FUNCTIONS
C_101:defineToggleSwitch("FRONT_MIRROR", 1, 3239, 10, "Misc", "FRONT Show Mirror")
C_101:defineToggleSwitch("FRONT_COMPASS_LIGHT", 2, 3252, 850, "Misc", "FRONT Compass Light Switch")
C_101:defineToggleSwitch("FRONT_PITCH_TRIM_TONE_MUTE", 1, 3236, 196, "Misc", "FRONT Pitch Trim Tone Mute")
C_101:definePushButton("FRONT_ANTI_RAIN", 1, 3222, 314, "Misc", "FRONT Anti-Rain Fluid")

--------------REAR COCKPIT ONLY FUNCTIONS
--OXYGEN SYSTEM
C_101:defineToggleSwitch("BACK_OXY_PRESS_WARN_SW", 1, 3527, 1196, "Misc", "BACK Oxygen Pressure Warning Switch")

--IFR hood
C_101:defineToggleSwitch("BACK_IFR_HOOD", 1, 3551, 329, "Misc", "BACK IFR Hood Close/Open")

--UNKNOWN BUTTONS/SWITCHES
C_101:defineToggleSwitch("BACK_EJECT_PRIO_LEVER", 1, 3691, 1182, "Misc", "BACK Ejection Seat Priority Lever")
C_101:definePotentiometer("BACK_STORAGE_BOX", 1, 3522, 299, { 0, 1 }, "Misc", "BACK Storage Box Cover")
C_101:definePotentiometer("BACK_IFR_HOOD_ME", 1, 3557, 256, { 0, 1 }, "Misc", "BACK IFR Hood (Equip via ME)")

--======== C-101CC COCKPIT ========
--MANUAL POWER RESERVE (MPR)
C_101:definePushButton("CC_FRONT_MRP_LAMP_TEST_BTN", 1, 3702, 1312, "MRP", "C-101CC FRONT MPR Lamp Test Button")
C_101:definePotentiometer("CC_FRONT_MRP_LAMP_TEST_KNB", 1, 3704, 1313, { 0, 1 }, "MRP", "C-101CC FRONT MPR Lamp Test Knob")
C_101:definePushButton("CC_BACK_MRP_LAMP_TEST_BTN", 1, 3703, 1317, "MRP", "C-101CC BACK MPR Lamp Test Button")
C_101:definePotentiometer("CC_BACK_MRP_LAMP_TEST_KNB", 1, 3705, 1318, { 0, 1 }, "MRP", "C-101CC BACK MPR Lamp Test Knob")

--FLIGHT DIRECTOR
C_101:definePushButton("CC_FRONT_FD_HDG_MODE", 1, 3171, 210, "Flight Director", "C-101CC FRONT Flight Director Heading Mode")
C_101:definePushButton("CC_FRONT_FD_ALT_MODE", 1, 3172, 215, "Flight Director", "C-101CC FRONT Flight Director Altitude Mode")
C_101:definePushButton("CC_FRONT_FD_NAV_MODE", 1, 3174, 211, "Flight Director", "C-101CC FRONT Flight Director Navigation Mode")
C_101:definePushButton("CC_FRONT_FD_APP_MODE", 1, 3175, 212, "Flight Director", "C-101CC FRONT Flight Director Approach Mode")
C_101:definePushButton("CC_FRONT_FD_BCRS_MODE", 1, 3176, 213, "Flight Director", "C-101CC FRONT Flight Director Back Course Mode")
C_101:definePushButton("CC_FRONT_FD_VOR_APP_MODE", 1, 3177, 214, "Flight Director", "C-101CC FRONT Flight Director VOR Approach Mode")
C_101:definePushButton("CC_FRONT_FD_VSPD_MODE", 1, 3178, 217, "Flight Director", "C-101CC FRONT Flight Director Vertical Speed Mode")
C_101:definePushButton("CC_FRONT_FD_IASPD_MODE", 1, 3179, 218, "Flight Director", "C-101CC FRONT Flight Director Indicated Air Speed Mode")
C_101:definePushButton("CC_FRONT_FD_STBY_MODE", 1, 3170, 219, "Flight Director", "C-101CC FRONT Flight Director Standby Mode")
C_101:definePotentiometer("CC_FRONT_FD_BRIGHT", 1, 3195, 343, { 0, 1 }, "Flight Director", "C-101CC FRONT Outer Flight Director Panel Brightnes Knob")
C_101:definePotentiometer("CC_BACK_FD_BRIGHT", 1, 3661, 916, { 0, 1 }, "Flight Director", "C-101CC BACK Outer Flight Director Panel Brightnes Knob")

--V/UHF RADIO
C_101:defineMultipositionSwitch("CC_FRONT_UHF_SEL100", 11, 3002, 226, 3, 0.1, "UHF Radio", "C-101CC FRONT UHF Radio 100 MHz Selector")
C_101:defineFixedStepTumb("CC_FRONT_UHF_SEL10", 11, 3003, 227, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101CC FRONT UHF Radio 10 MHz Selector")
C_101:defineFixedStepTumb("CC_FRONT_UHF_SEL1", 11, 3004, 228, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101CC FRONT UHF Radio 1 MHz Selector")
C_101:defineFixedStepTumb("CC_FRONT_UHF_SEL01", 11, 3005, 229, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101CC FRONT UHF Radio 0.1 MHz Selector")
C_101:defineFixedStepTumb("CC_FRONT_UHF_SEL0025", 11, 3006, 230, 0.25, { 0, 1 }, { -1, 1 }, { "00", "25", "50", "75", "00" }, "UHF Radio", "C-101CC FRONT UHF Radio 0.025 MHz Selector")
C_101:defineMultipositionSwitch("CC_FRONT_UHF_PRESET", 11, 3011, 231, 21, 0.05, "UHF Radio", "C-101CC FRONT UHF Radio Preset Channel Selector")
C_101:defineMultipositionSwitch("CC_FRONT_UHF_FUNCT", 11, 3007, 232, 4, 0.1, "UHF Radio", "C-101CC FRONT UHF Radio Function Dial")
C_101:defineMultipositionSwitch("CC_FRONT_UHF_FREQU", 11, 3008, 233, 3, 0.5, "UHF Radio", "C-101CC FRONT UHF Radio Frequency Mode Dial")
C_101:defineToggleSwitch("CC_FRONT_UHF_TEST", 11, 3001, 234, "UHF Radio", "C-101CC FRONT UHF Radio Test Selector Switch")
C_101:defineToggleSwitch("CC_FRONT_UHF_SQL", 11, 3009, 236, "UHF Radio", "C-101CC FRONT UHF Radio Squelch Switch")
C_101:defineToggleSwitch("CC_FRONT_UHF_POWER", 11, 3010, 235, "UHF Radio", "C-101CC FRONT UHF Radio Power Transmit Selector Switch")
C_101:defineMultipositionSwitch("CC_BACK_UHF_SEL100", 11, 3022, 862, 3, 0.1, "UHF Radio", "C-101CC BACK UHF Radio 100 MHz Selector")
C_101:defineFixedStepTumb("CC_BACK_UHF_SEL10", 11, 3003, 227, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101CC BACK UHF Radio 10 MHz Selector")
C_101:defineFixedStepTumb("CC_BACK_UHF_SEL1", 11, 3004, 228, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101CC BACK UHF Radio 1 MHz Selector")
C_101:defineFixedStepTumb("CC_BACK_UHF_SEL01", 11, 3005, 229, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101CC BACK UHF Radio 0.1 MHz Selector")
C_101:defineFixedStepTumb("CC_BACK_UHF_SEL0025", 11, 3006, 230, 0.25, { 0, 1 }, { -1, 1 }, { "00", "25", "50", "75", "00" }, "UHF Radio", "C-101CC BACK UHF Radio 0.025 MHz Selector")
C_101:defineMultipositionSwitch("CC_BACK_UHF_PRESET", 11, 3031, 867, 21, 0.05, "UHF Radio", "C-101CC BACK UHF Radio Preset Channel Selector")
C_101:defineMultipositionSwitch("CC_BACK_UHF_FUNCT", 11, 3027, 868, 4, 0.1, "UHF Radio", "C-101CC BACK UHF Radio Function Dial")
C_101:defineMultipositionSwitch("CC_BACK_UHF_FREQU", 11, 3028, 869, 3, 0.5, "UHF Radio", "C-101CC BACK UHF Radio Frequency Mode Dial")
C_101:defineToggleSwitch("CC_BACK_UHF_TEST", 11, 3021, 875, "UHF Radio", "C-101CC BACK UHF Radio Test Selector Switch")
C_101:defineToggleSwitch("CC_BACK_UHF_SQL", 11, 3029, 872, "UHF Radio", "C-101CC BACK UHF Radio Squelch Switch")
C_101:defineToggleSwitch("CC_BACK_UHF_POWER", 11, 3030, 876, "UHF Radio", "C-101CC BACK UHF Radio Power Transmit Selector Switch")

--VHF COMM/NAV
C_101:defineMultipositionSwitch("CC_FRONT_VHF_COMM_PW", 10, 3004, 653, 3, 0.5, "VHF", "C-101CC FRONT VHF COMM Switch OFF/PWR/TEST")
C_101:defineRotary("CC_FRONT_VHF_COMM_FREQ_100", 10, 3001, 640, "VHF", "C-101CC FRONT VHF COMM Frequency Control 100 MHz")
C_101:definePotentiometer("CC_FRONT_VHF_COMM_VOL", 10, 3003, 655, { 0, 1 }, "VHF", "C-101CC FRONT VHF COMM Volume Control")
C_101:defineRadioWheel("CC_FRONT_VHF_COMM_FREQ_10", 10, 3002, 3002, { -0.025, 0.025 }, 641, 0.025, { 0, 1.0 }, nil, "VHF", "C-101CC FRONT VHF COMM Frequency Control 10 kHz")
C_101:define3PosTumb("CC_FRONT_VHF_NAV_TEST", 12, 3005, 650, "VHF", "C-101CC FRONT VHF NAV Test Switch")
C_101:defineMultipositionSwitch("CC_FRONT_VHF_NAV_CONTROL", 12, 3004, 657, 5, 0.25, "VHF", "C-101CC FRONT VHF NAV Control Switch")
C_101:defineRotary("CC_FRONT_VHF_NAV_FREQ_1", 12, 3001, 645, "VHF1", "C-101CC FRONT VHF NAV Frequency Control 1 MHz")
C_101:definePotentiometer("CC_FRONT_VHF_NAV_VOL", 12, 3003, 659, { 0, 1 }, "VHF", "C-101CC FRONT VHF NAV Volume Control")
C_101:defineRadioWheel("CC_FRONT_VHF_NAV_FREQ_50", 12, 3002, 3002, { -0.025, 0.025 }, 646, 0.025, { 0, 1.0 }, nil, "VHF", "C-101CC FRONT VHF NAV Frequency Control 50 kHz")
C_101:defineMultipositionSwitch("CC_BACK_VHF_COMM_PW", 10, 3014, 917, 3, 0.5, "VHF", "C-101CC BACK VHF COMM Switch OFF/PWR/TEST")
C_101:defineRotary("CC_BACK_VHF_COMM_FREQ_1", 10, 3001, 904, "VHF", "C-101CC BACK VHF COMM Frequency Control 1 MHz")
C_101:definePotentiometer("CC_BACK_VHF_COMM_VOL", 10, 3003, 919, { 0, 1 }, "VHF", "C-101CC BACK VHF COMM Volume Control")
C_101:defineRadioWheel("CC_BACK_VHF_COMM_FREQ_10", 10, 3002, 3002, { -0.025, 0.025 }, 905, 0.025, { 0, 1.0 }, nil, "VHF", "C-101CC BACK VHF COMM Frequency Control 0.025 MHz")
C_101:defineToggleSwitch("CC_BACK_VHF_NAV_TEST", 12, 3015, 915, "VHF", "C-101CC BACK VHF NAV Test Switch")
C_101:defineMultipositionSwitch("CC_BACK_VHF_NAV_CONTROL", 12, 3014, 921, 5, 0.25, "VHF", "C-101CC BACK VHF NAV Control Switch")
C_101:defineRotary("CC_BACK_VHF_NAV_FREQ_1", 12, 3011, 906, "VHF", "C-101CC BACK VHF NAV Frequency Control 1 MHz")
C_101:definePotentiometer("CC_BACK_VHF_NAV_VOL", 12, 3013, 923, { 0, 1 }, "VHF", "C-101CC BACK VHF NAV Volume Control")
C_101:defineRadioWheel("CC_BACK_VHF_NAV_FREQ_50", 12, 3012, 3012, { -0.025, 0.025 }, 907, 0.025, { 0, 1.0 }, nil, "VHF", "C-101CC BACK VHF NAV Frequency Control 50 kHz")

--INTERCOM PANEL
C_101:definePushButton("CC_FRONT_INTER_ADF_BTN", 6, 3014, 849, "Intercom", "C-101CC FRONT Intercom ADF Switch (push)")
C_101:definePotentiometer("CC_FRONT_INTER_ADF_KNB", 6, 3015, 853, { 0, 1 }, "Intercom", "C-101CC FRONT Intercom ADF Switch (turn)")
C_101:definePushButton("CC_FRONT_INTER_DME_BTN", 6, 3016, 284, "Intercom", "C-101CC FRONT Intercom DME Switch (push)")
C_101:definePotentiometer("CC_FRONT_INTER_DME_KNB", 6, 3017, 398, { 0, 1 }, "Intercom", "C-101CC FRONT Intercom DME Switch (turn)")
C_101:definePushButton("CC_FRONT_INTER_VUHF_BTN", 6, 3018, 268, "Intercom", "C-101CC FRONT Intercom V/UHF Switch (push)")
C_101:definePotentiometer("CC_FRONT_INTER_VUHF_KNB", 6, 3019, 269, { 0, 1 }, "Intercom", "C-101CC FRONT Intercom V/UHF Switch (turn)")
C_101:defineMultipositionSwitch("CC_FRONT_INTER_MAIN_SEL", 6, 3020, 404, 7, 0.1, "Intercom", "C-101CC FRONT Intercom Main Mode Selector")
C_101:definePushButton("CC_BACK_INTER_ADF_BTN", 6, 3037, 1140, "Intercom", "C-101CC BACK Intercom ADF Switch (push)")
C_101:definePotentiometer("CC_BACK_INTER_ADF_KNB", 6, 3038, 1141, { 0, 1 }, "Intercom", "C-101CC BACK Intercom ADF Switch (turn)")
C_101:definePushButton("CC_BACK_INTER_DME_BTN", 6, 3039, 888, "Intercom", "C-101CC BACK Intercom DME Switch (push)")
C_101:definePotentiometer("CC_BACK_INTER_DME_KNB", 6, 3040, 898, { 0, 1 }, "Intercom", "C-101CC BACK Intercom DME Switch (turn)")
C_101:definePushButton("CC_BACK_INTER_VUHF_BTN", 6, 3041, 1109, "Intercom", "C-101CC BACK Intercom V/UHF Switch (push)")
C_101:definePotentiometer("CC_BACK_INTER_VUHF_KNB", 6, 3042, 1110, { 0, 1 }, "Intercom", "C-101CC BACK Intercom V/UHF Switch (turn)")
C_101:defineMultipositionSwitch("CC_BACK_INTER_MAIN_SEL", 6, 3043, 947, 7, 0.1, "Intercom", "C-101CC BACK Intercom Main Mode Selector")

--ADI KNOB
C_101:definePushButton("CC_FRONT_ADI_TEST", 1, 3346, 683, "ADI", "C-101CC FRONT ADI Test Switch")
C_101:definePotentiometer("CC_FRONT_ADI_DH_SET", 1, 3347, 412, { 0, 1 }, "ADI", "C-101CC FRONT Decision Height Setting")
C_101:definePotentiometer("CC_FRONT_ADI_HSI_BRIGHT", 1, 3161, 411, { 0, 1 }, "ADI", "C-101CC FRONT ADI/HSI Digital Displays Brightness")
C_101:definePushButton("CC_BACK_ADI_TEST", 1, 3600, 1045, "ADI", "C-101CC BACK ADI Test Switch")
C_101:definePotentiometer("CC_BACK_ADI_DH_SET", 1, 3601, 924, { 0, 1 }, "ADI", "C-101CC BACK Decision Height Setting")
C_101:definePotentiometer("CC_BACK_ADI_HSI_BRIGHT", 1, 3443, 923, { 0, 1 }, "ADI", "C-101CC BACK ADI/HSI Digital Displays Brightness")

--STANDBY ALTIMETER
C_101:definePotentiometer("CC_FRONT_STBY_ALT_BARO", 1, 3344, 620, { 0, 1 }, "Standby Altimeter", "C-101CC FRONT Standby Altimeter Baro Adjust")
C_101:definePushButton("CC_FRONT_STBY_ALT_TAP", 1, 3549, 1190, "Standby Altimeter", "C-101CC FRONT Standby Altimeter Tap Glass")
C_101:definePotentiometer("CC_BACK_STBY_ALT_BARO", 1, 3605, 1021, { 0, 1 }, "Standby Altimeter", "C-101CC BACK Standby Altimeter Baro Adjust")
C_101:definePushButton("CC_BACK_STBY_ALT_TAP", 1, 3550, 1191, "Standby Altimeter", "C-101CC BACK Standby Altimeter Tap Glass")

--AHRS CONTROL PANEL
C_101:defineToggleSwitch("CC_FRONT_DME_SEL", 12, 3006, 340, "AHRS", "C-101CC FRONT DME Selector")
C_101:defineToggleSwitch("CC_FRONT_RADAR_ALT", 1, 3028, 341, "AHRS", "C-101CC FRONT Radio Altimeter")
C_101:defineMultipositionSwitch("CC_FRONT_AHRS_EMERG_LOC_TRANS", 1, 3026, 339, 3, 0.5, "AHRS", "C-101CC FRONT AHRS Emergency Locator Tranmsitter")
C_101:defineToggleSwitch("CC_BACK_DME_SEL", 12, 3016, 965, "AHRS", "C-101CC BACK DME Selector")
C_101:definePushButton("CC_BACK_AHRS_FAST_ERECT", 1, 3512, 966, "AHRS", "C-101CC BACK AHRS Fast Erect")

--SCAR DISPLAY UNIT
C_101:defineMultipositionSwitch("CC_FRONT_SCAR_GUN_LOAD", 1, 3270, 569, 10, 0.11, "SCAR", "C-101CC FRONT SCAR Initial Cannon Load")
C_101:definePushButton("CC_FRONT_SCAR_MODE_SEL_BTN", 1, 3271, 573, "SCAR", "C-101CC FRONT SCAR Mode Selector/Cancel Button")
C_101:defineMultipositionSwitch("CC_BACK_SCAR_GUN_LOAD", 1, 3637, 1285, 10, 0.11, "SCAR", "C-101CC BACK SCAR Initial Cannon Load")
C_101:definePushButton("CC_BACK_SCAR_MODE_SEL_BTN", 1, 3638, 1289, "SCAR", "C-101CC BACK SCAR Mode Selector/Cancel Button")
C_101:definePushButton("CC_FRONT_SCAR_EMERG_JETT", 1, 3268, 567, "SCAR", "C-101CC FRONT SCAR Emergency Jettison")
C_101:definePushButton("CC_FRONT_SCAR_LIGHT_TEST", 1, 3269, 568, "SCAR", "C-101CC FRONT SCAR Light Test")
C_101:definePushButton("CC_FRONT_BACK_EMERG_JETT", 1, 3639, 597, "SCAR", "C-101CC BACK SCAR Emergency Jettison")
C_101:definePushButton("CC_FRONT_BACK_LIGHT_TEST", 1, 3640, 598, "SCAR", "C-101CC BACK SCAR Light Test")

--COLIMADOR
C_101:definePotentiometer("CC_FRONT_HUD_SIGHT_BRIGHT", 1, 3310, 722, { 0, 1 }, "Colimador", "C-101CC FRONT Sight Brightness")
C_101:defineMultipositionSwitch("CC_FRONT_HUD_VIDEO", 1, 3312, 720, 3, 0.5, "Colimador", "C-101CC FRONT Video ON/STB/OFF")
C_101:defineTumb("CC_FRONT_HUD_DEPRESS_0XX", 1, 3314, 587, 0.1, { 0, 0.2 }, nil, false, "Colimador", "C-101CC FRONT HUD Depression 0XX")
C_101:defineFixedStepTumb("CC_FRONT_HUD_DEPRESS_X0X", 1, 3315, 588, 0.1, { 0, 1 }, { -1, 1 }, nil, "Colimador", "C-101CC FRONT HUD Depression X0X")
C_101:defineFixedStepTumb("CC_FRONT_HUD_DEPRESS_XX0", 1, 3316, 589, 0.1, { 0, 1 }, { -1, 1 }, nil, "Colimador", "C-101CC FRONT HUD Depression XX0")
C_101:defineMultipositionSwitch("CC_FRONT_HUD_DEPRESS_MODE", 1, 3317, 590, 3, 0.5, "Colimador", "C-101CC FRONT HUD Depression AUTO/MAN/TEST")
C_101:defineToggleSwitch("CC_FRONT_HUD_SIGHT", 1, 3318, 591, "Colimador", "C-101CC FRONT Optical Sight ON/OFF")
C_101:definePotentiometer("CC_BACK_HUD_SIGHT_BRIGHT", 1, 3654, 713, { 0, 1 }, "Colimador", "C-101CC BACK Sight Brightness")

--MISC FUNCTIONS
C_101:definePotentiometer("CC_FRONT_SIGHT_SUN_FILTER", 2, 3670, 1112, { 0, 1 }, "Misc", "C-101CC FRONT Gunsight Sun Filter")
C_101:definePotentiometer("CC_BACK_SIGHT_SUN_FILTER", 2, 3671, 1113, { 0, 1 }, "Misc", "C-101CC BACK Gunsight Sun Filter")
C_101:definePushButton("CC_FRONT_ALT_TEST_ADJ", 1, 3364, 607, "Misc", "C-101CC FRONT Altimeter Test Adjust")
C_101:definePushButton("CC_BACK_ALT_TEST_ADJ", 1, 3658, 798, "Misc", "C-101CC BACK Altimeter Test Adjust")
C_101:definePushButton("CC_FRONT_HSI_BEARING_SEL", 1, 3349, 689, "Misc", "C-101CC FRONT HSI Bearing Select Button")
C_101:definePushButton("CC_BACK_HSI_BEARING_SEL", 1, 3349, 689, "Misc", "C-101CC BACK HSI Bearing Select Button")
C_101:defineToggleSwitch("CC_FRONT_CANOPY_EMERG_FRAC", 1, 3343, 294, "Misc", "C-101CC FRONT Canopy Emergency Fracturing")
C_101:defineToggleSwitch("CC_FRONT_CANOPY_EMERG_FRAC_PIN", 1, 3990, 1354, "Misc", "C-101CC FRONT Canopy Emergency Fracturing Safety Pin")
C_101:defineToggleSwitch("CC_BACK_CANOPY_EMERG_FRAC", 1, 3652, 277, "Misc", "C-101CC BACK Canopy Emergency Fracturing")
C_101:defineToggleSwitch("CC_BACK_CANOPY_EMERG_FRAC_PIN", 1, 3991, 1355, "Misc", "C-101CC BACK Canopy Emergency Fracturing Safety Pin")
C_101:defineToggleSwitch("CC_FRONT_RUDDER_TRIM_SW", 1, 3350, 717, "Misc", "C-101CC FRONT Rudder Trim Switch")
C_101:defineToggleSwitch("CC_BACK_RUDDER_TRIM_SW", 1, 3604, 1105, "Misc", "C-101CC BACK Rudder Trim Switch")
C_101:defineMultipositionSwitch("CC_FRONT_UHF_ANT_SEL", 1, 3221, 338, 3, 0.5, "Misc", "C-101CC FRONT UHF Antenna Selection")

--WARNING, CAUTION AND INDICATORLIGHTS
C_101:defineIndicatorLight("CC_FRONT_MRP_LAMP", 1314, "Warning, Caution and IndicatorLights", "C-101CC FRONT MPR Lamp (yellow)")
C_101:defineIndicatorLight("CC_BACK_MRP_LAMP", 1319, "Warning, Caution and IndicatorLights", "C-101CC BACK MPR Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_TELEBRIEFING_LAMP", 719, "Warning, Caution and IndicatorLights", "C-101CC FRONT Telebriefing Lamp (yellow)")

---------------------------------------FORWARD COCKPIT ONLY FUNCTIONS
--SCAR CONTROL UNIT
C_101:defineToggleSwitch("CC_FRONT_SCAR_MASTER_MODE_COVER", 1, 3254, 690, "SCAR", "C-101CC FRONT SCAR Master Mode Cover")
C_101:defineMultipositionSwitch("CC_FRONT_SCAR_MASTER_MODE", 1, 3255, 691, 3, 0.5, "SCAR", "C-101CC FRONT SCAR Master Mode")
C_101:defineToggleSwitch("CC_FRONT_SCAR_MASTER_ARM", 1, 3256, 692, "SCAR", "C-101CC FRONT SCAR Master Arm")
C_101:defineMultipositionSwitch("CC_FRONT_SCAR_BOMB_ARM", 1, 3257, 693, 4, 0.33, "SCAR", "C-101CC FRONT SCAR Bomb Arming Selector")
C_101:defineMultipositionSwitch("CC_FRONT_SCAR_MODE_SEL", 1, 3258, 694, 8, 0.142, "SCAR", "C-101CC FRONT SCAR Mode Selector")
C_101:defineMultipositionSwitch("CC_FRONT_SCAR_RIPPLE", 1, 3259, 695, 5, 0.25, "SCAR", "C-101CC FRONT SCAR Ripple Time")
C_101:defineMultipositionSwitch("CC_FRONT_SCAR_SEL_JETT_SEL", 1, 3260, 696, 4, 0.33, "SCAR", "C-101CC FRONT SCAR Selective Jettison Selector")
C_101:definePushButton("CC_FRONT_SCAR_SEL_JETT", 1, 3261, 697, "SCAR", "C-101CC FRONT SCAR Selective Jettison")
C_101:definePushButton("CC_FRONT_SCAR_PYLON_1", 1, 3262, 542, "SCAR", "C-101CC FRONT SCAR Select Pylon #1")
C_101:definePushButton("CC_FRONT_SCAR_PYLON_2", 1, 3263, 543, "SCAR", "C-101CC FRONT SCAR Select Pylon #2")
C_101:definePushButton("CC_FRONT_SCAR_PYLON_3", 1, 3264, 544, "SCAR", "C-101CC FRONT SCAR Select Pylon #3")
C_101:definePushButton("CC_FRONT_SCAR_PYLON_4", 1, 3265, 545, "SCAR", "C-101CC FRONT SCAR Select Pylon #4")
C_101:definePushButton("CC_FRONT_SCAR_PYLON_5", 1, 3266, 546, "SCAR", "C-101CC FRONT SCAR Select Pylon #5")
C_101:definePushButton("CC_FRONT_SCAR_PYLON_6", 1, 3267, 547, "SCAR", "C-101CC FRONT SCAR Select Pylon #6")

--ADF
C_101:defineRotaryPlus("CC_FRONT_ADF_FREQ_L_100", 13, 3003, 3001, 661, "ADF", "C-101CC FRONT ADF Left Frequency Selector 100 kHz") --issue
C_101:defineRotary("CC_FRONT_ADF_FREQ_L_10", 13, 3003, 662, "ADF", "C-101CC FRONT ADF Left Frequency Selector 10 kHz")
C_101:defineRotaryPlus("CC_FRONT_ADF_FREQ_L_05", 13, 3003, 3002, 663, "ADF", "C-101CC FRONT ADF Left Frequency Selector 0.5 kHz") --issue

C_101:defineRotaryPlus("CC_FRONT_ADF_FREQ_R_100", 13, 3006, 3004, 666, "ADF", "C-101CC FRONT ADF Right Frequency Selector 100 kHz") --issue
C_101:defineRotary("CC_FRONT_ADF_FREQ_R_10", 13, 3006, 668, "ADF", "C-101CC FRONT ADF Right Frequency Selector 10 kHz")
C_101:defineRotaryPlus("CC_FRONT_ADF_FREQ_R_05", 13, 3006, 3005, 669, "ADF", "C-101CC FRONT ADF Right Frequency Selector 0.5 kHz") --issue

C_101:defineMultipositionSwitch("CC_FRONT_ADF_FUNC", 13, 3007, 677, 4, 0.1, "ADF", "C-101CC FRONT ADF Function Selector Switch")
C_101:definePotentiometer("CC_FRONT_ADF_GAIN", 13, 3009, 678, { 0, 1 }, "ADF", "C-101CC FRONT ADF Gain Control")
C_101:defineToggleSwitch("CC_FRONT_ADF_TONE_SW", 13, 3010, 679, "ADF", "C-101CC FRONT ADF Tone Switch")
C_101:defineToggleSwitch("CC_FRONT_ADF_TRANS_SW", 13, 3011, 680, "ADF", "C-101CC FRONT ADF Transfer Switch")

--GYROSCOPE PLATFORM
C_101:defineMultipositionSwitch("CC_FRONT_GYRO_FUNC_SEL", 1, 3321, 728, 3, 0.5, "Gyro", "C-101CC FRONT Gyro Function Selector")
C_101:definePushButton("CC_FRONT_GYRO_SYNC_HDG_SET_BTN", 1, 3324, 1305, "Gyro", "C-101CC FRONT Gyro Synchnonizer and Heading Set Button")
C_101:definePotentiometer("CC_FRONT_GYRO_SYNC_HDG_SET_KNB", 1, 3322, 729, { 0, 1 }, "Gyro", "C-101CC FRONT Gyro Synchnonizer and Heading Set Knob")
C_101:definePotentiometer("CC_FRONT_GYRO_LAT_CORR", 1, 3323, 730, { 0, 1 }, "Gyro", "C-101CC FRONT Gyro Latitude Correction")
C_101:definePushButton("CC_FRONT_GYRO_FAST_ERECT", 1, 3325, 732, "Gyro", "C-101CC FRONT Gyro Fast Erect")
C_101:defineMultipositionSwitch("CC_FRONT_GYRO_MAG_VAR", 1, 3326, 733, 3, 0.5, "Gyro", "C-101CC FRONT Gyro Mag Var Control")
C_101:defineToggleSwitch("CC_FRONT_GYRO_HEMI_SW", 1, 3327, 734, "Gyro", "C-101CC FRONT Gyro Hemisphere Switch")

--WEAPONS
C_101:defineToggleSwitch("CC_FRONT_WP_PYLON_OR", 1, 3329, 699, "Weapons", "C-101CC FRONT Weapon Switch Pylon Outer Right")
C_101:defineToggleSwitch("CC_FRONT_WP_PYLON_MR", 1, 3330, 700, "Weapons", "C-101CC FRONT Weapon Switch Pylon Mid Right")
C_101:defineToggleSwitch("CC_FRONT_WP_PYLON_IR", 1, 3331, 701, "Weapons", "C-101CC FRONT Weapon Switch Pylon Inner Right")
C_101:defineToggleSwitch("CC_FRONT_WP_EMERG", 1, 3332, 702, "Weapons", "C-101CC FRONT Weapon Switch Emergency")
C_101:defineToggleSwitch("CC_FRONT_WP_NORM", 1, 3333, 703, "Weapons", "C-101CC FRONT Weapon Switch Normal")
C_101:defineToggleSwitch("CC_FRONT_WP_SIGHT_115", 1, 3335, 705, "Weapons", "C-101CC FRONT Weapon Switch Sight 115V AC")
C_101:defineToggleSwitch("CC_FRONT_WP_PYLON_OL", 1, 3336, 706, "Weapons", "C-101CC FRONT Weapon Switch Pylon Outer Left")
C_101:defineToggleSwitch("CC_FRONT_WP_PYLON_ML", 1, 3337, 707, "Weapons", "C-101CC FRONT Weapon Switch Pylon Mid Left")
C_101:defineToggleSwitch("CC_FRONT_WP_PYLON_IL", 1, 3338, 708, "Weapons", "C-101CC FRONT Weapon Switch Pylon Inner Left")
C_101:defineToggleSwitch("CC_FRONT_WP_GUN_1", 1, 3339, 709, "Weapons", "C-101CC FRONT Weapon Switch Machine Gun 1")
C_101:defineToggleSwitch("CC_FRONT_WP_GUN_2", 1, 3340, 710, "Weapons", "C-101CC FRONT Weapon Switch Machine Gun 2")
C_101:defineToggleSwitch("CC_FRONT_WP_ARM", 1, 3341, 711, "Weapons", "C-101CC FRONT Weapon Switch Arming Control")
C_101:defineToggleSwitch("CC_FRONT_WP_SIGHT_CAM", 1, 3342, 712, "Weapons", "C-101CC FRONT Weapon Switch Sight Camera")
C_101:defineToggleSwitch("CC_FRONT_WP_UHF_RACAL", 1, 3680, 704, "Weapons", "C-101CC FRONT Weapon Switch UHF Racal")

--CIRCUIT BREAKERS
C_101:defineToggleSwitch("CC_FRONT_CB_GYRO", 1, 3538, 436, "CB Panel", "C-101CC FRONT Circuit Breaker Gyro Platform")
C_101:defineToggleSwitch("CC_FRONT_CB_DME", 1, 3539, 437, "CB Panel", "C-101CC FRONT Circuit Breaker DME")
C_101:defineToggleSwitch("CC_FRONT_CB_FD", 1, 3291, 1382, "CB Panel", "C-101CC FRONT Circuit Breaker Flight Director")
C_101:defineToggleSwitch("CC_FRONT_CB_IFF", 1, 3292, 1383, "CB Panel", "C-101CC FRONT Circuit Breaker IFF")
C_101:defineToggleSwitch("CC_FRONT_CB_VHF", 1, 3092, 532, "CB Panel", "C-101CC FRONT Circuit Breaker VHF")
C_101:defineToggleSwitch("CC_FRONT_CB_RADIO_ALT", 1, 3540, 455, "CB Panel", "C-101CC FRONT Circuit Breaker Radio Altimeter")
C_101:defineToggleSwitch("CC_FRONT_CB_ADF_DC", 1, 3543, 465, "CB Panel", "C-101CC FRONT Circuit Breaker ADF DC")
C_101:defineToggleSwitch("CC_FRONT_CB_UVHF", 1, 3095, 466, "CB Panel", "C-101CC FRONT Circuit Breaker U/VHF")
C_101:defineToggleSwitch("CC_FRONT_CB_RED_L", 1, 3090, 469, "CB Panel", "C-101CC FRONT Circuit Breaker Red Cockpit Lighting")
C_101:defineToggleSwitch("CC_FRONT_CB_BAK_ADI", 1, 3059, 470, "CB Panel", "C-101CC FRONT Circuit Breaker Backup ADI")
C_101:defineToggleSwitch("CC_FRONT_CB_INTER", 1, 3093, 471, "CB Panel", "C-101CC FRONT Circuit Breaker Interphone")
C_101:defineToggleSwitch("CC_FRONT_CB_COMP", 1, 3541, 457, "CB Panel", "C-101CC FRONT Circuit Breaker Air Data Computer / Flight Director")
C_101:defineToggleSwitch("CC_FRONT_CB_GYRO_115", 1, 3542, 458, "CB Panel", "C-101CC FRONT Circuit Breaker Gyro Plat 115V AC")
C_101:defineToggleSwitch("CC_FRONT_CB_CONS_L", 1, 3099, 459, "CB Panel", "C-101CC FRONT Circuit Breaker Console Lights")
C_101:defineToggleSwitch("CC_FRONT_CB_VOR_AC", 1, 3078, 460, "CB Panel", "C-101CC FRONT Circuit Breaker VOR AC")
C_101:defineToggleSwitch("CC_FRONT_CB_GYRO_VERT", 1, 3544, 461, "CB Panel", "C-101CC FRONT Circuit Breaker Vertical Gyro")
C_101:defineToggleSwitch("CC_FRONT_CB_GYRO_HOR", 1, 3545, 462, "CB Panel", "C-101CC FRONT Circuit Breaker Horizontal Gyro")
C_101:defineToggleSwitch("CC_FRONT_CB_ADF_AC", 1, 3293, 1189, "CB Panel", "C-101CC FRONT Circuit Breaker ADF 26V AC")
C_101:defineToggleSwitch("CC_FRONT_CB_DME_26", 1, 3546, 472, "CB Panel", "C-101CC FRONT Circuit Breaker DME 26V AC")
C_101:defineToggleSwitch("CC_FRONT_CB_GYRO_26", 1, 3547, 473, "CB Panel", "C-101CC FRONT Circuit Breaker Gyro Plat 26V AC")
C_101:defineToggleSwitch("CC_FRONT_CB_FD_26", 1, 3100, 474, "CB Panel", "C-101CC FRONT Circuit Breaker Flight Director 26V AC")
C_101:defineToggleSwitch("CC_FRONT_CB_ADC", 1, 3294, 596, "CB Panel", "C-101CC FRONT Circuit Breaker ADC")
C_101:defineToggleSwitch("CC_BACK_CB_STALL_WARN", 1, 3548, 903, "CB Panel", "C-101CC BACK Circuit Breaker Stall Warning System")

--MISC FUNCTIONS
C_101:definePotentiometer("CC_FRONT_AOA_IND_KNB", 1, 3345, 290, { 0, 1 }, "Misc", "C-101CC FRONT AOA Indicator Knob")
C_101:definePushButton("CC_FRONT_EMERG_FUEL_VALVE", 1, 3352, 715, "Misc", "C-101CC FRONT Emergency Fuel Valve")
C_101:defineToggleSwitch("CC_FRONT_EMERG_FUEL_COVER", 1, 3351, 716, "Misc", "C-101CC FRONT Emergency Fuel Cover")
C_101:defineMultipositionSwitch("CC_FRONT_EMERG_FUEL_LEVER", 1, 3354, 726, 9, 0.1, "Misc", "C-101CC FRONT Emergency Fuel Lever")
C_101:definePushButton("CC_FRONT_TELEBRIEFING_BTN", 1, 3320, 718, "Misc", "C-101CC FRONT Telebriefing Button")
C_101:definePotentiometer("CC_FRONT_TELEBRIEFING_KNB", 1, 3554, 849, { 0, 1 }, "Misc", "C-101CC FRONT Telebriefing Knob")

--------------REAR COCKPIT ONLY FUNCTIONS
--MISC FUNCTIONS
C_101:defineToggleSwitch("CC_BACK_STALL_WARN_TEST", 1, 3606, 1208, "Misc", "C-101CC BACK Stall Warning Test")
C_101:defineToggleSwitch("CC_BACK_STALL_WARN_PW", 1, 3607, 1209, "Misc", "C-101CC BACK Stall Warning Power")
C_101:definePotentiometer("CC_BACK_AOA_ADJ", 1, 3653, 279, { 0, 1 }, "Misc", "C-101CC BACK AOA Adjust")
C_101:defineToggleSwitch("CC_BACK_EMERG_PITCH_TRIM", 1, 3473, 842, "Misc", "C-101CC BACK Emergency Pitch Trim Breaker")

--======== C-101EB COCKPIT ========
--ALTIMETER
C_101:definePushButton("EB_FRONT_ALT_TAP", 1, 3164, 68, "Altimeter", "C-101EB FRONT Altimeter Tap Glass")
C_101:definePushButton("EB_BACK_ALT_TAP", 1, 3411, 802, "Altimeter", "C-101EB BACK Altimeter Tap Glass")

--VHF COMM/NAV
C_101:definePushButton("EB_FRONT_VHF_NAV_TEST_VOR", 13, 3001, 381, "VHF", "C-101EB FRONT VHF NAV Test VOR/MKR")
C_101:definePushButton("EB_FRONT_VHF_NAV_TEST_DIGITS", 13, 3002, 382, "VHF", "C-101EB FRONT VHF NAV Test Digits")
C_101:definePotentiometer("EB_FRONT_VHF_NAV_DIM", 13, 3003, 383, { 0, 1 }, "VHF", "C-101EB FRONT VHF NAV Dimmer")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_108", 13, 3004, 377, 10, 0.1, "VHF", "C-101EB FRONT VHF NAV 108-117 Frequency Selector")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_9", 13, 3005, 378, 10, 0.1, "VHF", "C-101EB FRONT VHF NAV 0-9 Frequency Selector")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_50", 13, 3006, 379, 2, 0.5, "VHF", "C-101EB FRONT VHF NAV 00/50 Frequency Selector")
C_101:definePotentiometer("EB_FRONT_VHF_NAV_VOL", 13, 3007, 380, { 0, 1 }, "VHF", "C-101EB FRONT VHF NAV Volume")
C_101:definePushButton("EB_BACK_VHF_NAV_TEST_VOR", 13, 3010, 914, "VHF", "C-101EB BACK VHF NAV Test VOR/MKR")
C_101:definePushButton("EB_BACK_VHF_NAV_TEST_DIGITS", 13, 3011, 915, "VHF", "C-101EB BACK VHF NAV Test Digits")
C_101:definePotentiometer("EB_BACK_VHF_NAV_DIM", 13, 3012, 916, { 0, 1 }, "VHF", "C-101EB BACK VHF NAV Dimmer")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_108", 13, 3013, 910, 10, 0.1, "VHF", "C-101EB BACK VHF NAV 108-117 Frequency Selector")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_9", 13, 3014, 911, 10, 0.1, "VHF", "C-101EB BACK VHF NAV 0-9 Frequency Selector")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_50", 13, 3015, 912, 2, 0.5, "VHF", "C-101EB BACK VHF NAV 00/50 Frequency Selector")
C_101:definePotentiometer("EB_BACK_VHF_NAV_VOL", 13, 3016, 913, { 0, 1 }, "VHF", "C-101EB BACK VHF NAV Volume")
C_101:definePotentiometer("EB_FRONT_VHF_COMM_BRIGHT", 10, 3008, 412, { 0, 1 }, "VHF", "C-101EB FRONT VHF COMM Brightness")
C_101:definePotentiometer("EB_FRONT_VHF_COMM_VOL", 10, 3007, 411, { 0, 1 }, "VHF", "C-101EB FRONT VHF COMM Volume")
C_101:defineToggleSwitch("EB_FRONT_VHF_COMM_PW", 10, 3001, 413, "VHF", "C-101EB FRONT VHF COMM Power Switch")
C_101:definePushButton("EB_FRONT_VHF_COMM_TEST", 10, 3006, 414, "VHF", "C-101EB FRONT VHF COMM Display Test")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_X0XXXX", 10, 3002, 415, 4, 0.25, "VHF", "C-101EB FRONT VHF COMM Frequency Selector (X0X.XXX)")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_XX0XXX", 10, 3003, 416, 10, 0.1, "VHF", "C-101EB FRONT VHF COMM Frequency Selector (XX0.XXX)")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_XXX0XX", 10, 3004, 417, 10, 0.1, "VHF", "C-101EB FRONT VHF COMM Frequency Selector (XXX.0XX)")
C_101:defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_XXXX00", 10, 3005, 418, 4, 0.25, "VHF", "C-101EB FRONT VHF COMM Frequency Selector (XXX.X00)")
C_101:definePotentiometer("EB_BACK_VHF_COMM_BRIGHT", 10, 3017, 924, { 0, 1 }, "VHF", "C-101EB BACK VHF COMM Brightness")
C_101:definePotentiometer("EB_BACK_VHF_COMM_VOL", 10, 3016, 923, { 0, 1 }, "VHF", "C-101EB BACK VHF COMM Volume")
C_101:defineToggleSwitch("EB_BACK_VHF_COMM_PW", 10, 3010, 925, "VHF", "C-101EB BACK VHF COMM Power Switch")
C_101:definePushButton("EB_BACK_VHF_COMM_TEST", 10, 3015, 926, "VHF", "C-101EB BACK VHF COMM Display Test")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_X0XXXX", 10, 3011, 927, 4, 0.25, "VHF", "C-101EB BACK VHF COMM Frequency Selector (X0X.XXX)")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_XX0XXX", 10, 3012, 928, 10, 0.1, "VHF", "C-101EB BACK VHF COMM Frequency Selector (XX0.XXX)")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_XXX0XX", 10, 3013, 929, 10, 0.1, "VHF", "C-101EB BACK VHF COMM Frequency Selector (XXX.0XX)")
C_101:defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_XXXX00", 10, 3014, 930, 4, 0.25, "VHF", "C-101EB BACK VHF COMM Frequency Selector (XXX.X00)")

--UHF RADIO
C_101:defineMultipositionSwitch("EB_FRONT_UHF_SEL100", 11, 3002, 226, 3, 0.1, "UHF Radio", "C-101EB FRONT UHF Radio 100 MHz Selector")
C_101:defineFixedStepTumb("EB_FRONT_UHF_SEL10", 11, 3003, 227, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101EB FRONT UHF Radio 10 MHz Selector")
C_101:defineFixedStepTumb("EB_FRONT_UHF_SEL1", 11, 3004, 228, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101EB FRONT UHF Radio 1 MHz Selector")
C_101:defineFixedStepTumb("EB_FRONT_UHF_SEL01", 11, 3005, 229, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101EB FRONT UHF Radio 0.1 MHz Selector")
C_101:defineFixedStepTumb("EB_FRONT_UHF_SEL0025", 11, 3006, 230, 0.25, { 0, 1 }, { -1, 1 }, { "00", "25", "50", "75", "00" }, "UHF Radio", "C-101EB FRONT UHF Radio 0.025 MHz Selector")
C_101:defineMultipositionSwitch("EB_FRONT_UHF_PRESET", 11, 3001, 231, 20, 0.05, "UHF Radio", "C-101EB FRONT UHF Radio Preset Channel Selector")
C_101:defineMultipositionSwitch("EB_FRONT_UHF_FUNCT", 11, 3008, 232, 4, 0.25, "UHF Radio", "C-101EB FRONT UHF Radio Function Dial")
C_101:defineMultipositionSwitch("EB_FRONT_UHF_FREQU", 11, 3007, 233, 3, 0.5, "UHF Radio", "C-101EB FRONT UHF Radio Frequency Mode Dial")
C_101:definePotentiometer("EB_FRONT_UHF_VOL", 11, 3011, 234, { 0, 1 }, "UHF Radio", "C-101EB FRONT UHF Volume")
C_101:definePushButton("EB_FRONT_UHF_T_TONE", 11, 3009, 235, "UHF Radio", "C-101EB FRONT UHV T-Tone")
C_101:defineToggleSwitch("EB_FRONT_UHF_SQL", 11, 3010, 236, "UHF Radio", "C-101EB FRONT UHF Radio Squelch Switch")
C_101:definePotentiometer("EB_FRONT_UHF_COVER", 11, 3015, 854, { 0, 1 }, "UHF Radio", "C-101EB FRONT UHF Cover")
C_101:definePushButton("EB_FRONT_UHF_PRESET_BTN", 11, 3016, 855, "UHF Radio", "C-101EB FRONT UHF Preset Button")
C_101:defineMultipositionSwitch("EB_BACK_UHF_SEL100", 11, 3027, 862, 3, 0.1, "UHF Radio", "C-101EB BACK UHF Radio 100 MHz Selector")
C_101:defineFixedStepTumb("EB_BACK_UHF_SEL10", 11, 3003, 227, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101EB BACK UHF Radio 10 MHz Selector")
C_101:defineFixedStepTumb("EB_BACK_UHF_SEL1", 11, 3004, 228, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101EB BACK UHF Radio 1 MHz Selector")
C_101:defineFixedStepTumb("EB_BACK_UHF_SEL01", 11, 3005, 229, 0.1, { 0, 1 }, { -1, 1 }, nil, "UHF Radio", "C-101EB BACK UHF Radio 0.1 MHz Selector")
C_101:defineFixedStepTumb("EB_BACK_UHF_SEL0025", 11, 3006, 230, 0.25, { 0, 1 }, { -1, 1 }, { "00", "25", "50", "75", "00" }, "UHF Radio", "C-101EB BACK UHF Radio 0.025 MHz Selector")
C_101:defineMultipositionSwitch("EB_BACK_UHF_PRESET", 11, 3026, 867, 21, 0.05, "UHF Radio", "C-101EB BACK UHF Radio Preset Channel Selector")
C_101:defineMultipositionSwitch("EB_BACK_UHF_FUNCT", 11, 3033, 868, 4, 0.1, "UHF Radio", "C-101EB BACK UHF Radio Function Dial")
C_101:defineMultipositionSwitch("EB_BACK_UHF_FREQU", 11, 3032, 869, 3, 0.5, "UHF Radio", "C-101EB BACK UHF Radio Frequency Mode Dial")
C_101:definePotentiometer("EB_BACK_UHF_VOL", 11, 3036, 870, { 0, 1 }, "UHF Radio", "C-101EB BACK UHF Volume")
C_101:definePushButton("EB_BACK_UHF_T_TONE", 11, 3034, 871, "UHF Radio", "C-101EB BACK UHV T-Tone")
C_101:defineToggleSwitch("EB_BACK_UHF_SQL", 11, 3035, 872, "UHF Radio", "C-101EB BACK UHF Radio Squelch Switch")
C_101:definePotentiometer("EB_BACK_UHF_COVER", 11, 3040, 1167, { 0, 1 }, "UHF Radio", "C-101EB BACK UHF Cover")
C_101:definePushButton("EB_BACK_UHF_PRESET_BTN", 11, 3041, 1169, "UHF Radio", "C-101EB BACK UHF Preset Button")
C_101:defineSpringloaded_3PosTumb("FRONT_UHF_TEST_SW", 11, 3012, 3013, 207, "UHF Radio", "C-101EB FRONT UHF Frequency/Test Switch")
C_101:definePotentiometer("EB_FRONT_UHF_DIM", 11, 3014, 206, { 0, 1 }, "UHF Radio", "C-101EB FRONT UHF Digital Display Dimmer")
C_101:defineSpringloaded_3PosTumb("BACK_UHF_TEST_SW", 11, 3037, 3038, 844, "UHF Radio", "C-101EB BACK UHF Frequency/Test Switch")
C_101:definePotentiometer("EB_BACK_UHF_DIM", 11, 3039, 845, { 0, 1 }, "UHF Radio", "C-101EB BACK UHF Digital Display Dimmer")

--FLIGHT DIRECTOR
C_101:definePushButton("EB_FRONT_FD_GO_MODE", 1, 3170, 210, "Flight Director", "C-101EB FRONT Flight Director GO-Around Mode")
C_101:definePushButton("EB_FRONT_FD_HDG_MODE", 1, 3171, 211, "Flight Director", "C-101EB FRONT Flight Director Heading Mode")
C_101:definePushButton("EB_FRONT_FD_ALT_HOLD_MODE", 1, 3172, 212, "Flight Director", "C-101EB FRONT Flight Director Altitude Hold Mode")
C_101:definePushButton("EB_FRONT_FD_PITCH_MODE", 1, 3173, 213, "Flight Director", "C-101EB FRONT Flight Director Pitch Mode")
C_101:definePushButton("EB_FRONT_FD_VOR_LOC_MODE", 1, 3174, 214, "Flight Director", "C-101EB FRONT Flight Director VOR/LOC Mode")
C_101:definePushButton("EB_FRONT_FD_APPR_ARM", 1, 3175, 215, "Flight Director", "C-101EB FRONT Flight Director Approach Arm")
C_101:definePushButton("EB_FRONT_FD_GLIDES_MODE", 1, 3176, 216, "Flight Director", "C-101EB FRONT Flight Director Glideslope Mode")
C_101:definePushButton("EB_FRONT_FD_ILS_LOC_RES_MODE", 1, 3177, 217, "Flight Director", "C-101EB FRONT Flight Director ILS/VOR Reserve Mode")
C_101:definePushButton("EB_FRONT_FD_STBY_MODE", 1, 3178, 218, "Flight Director", "C-101EB FRONT Flight Director Standby Mode")
C_101:definePushButton("EB_FRONT_FD_GLIDES_EX_MODE", 1, 3179, 219, "Flight Director", "C-101EB FRONT Flight Director Glideslope Extended Mode")
C_101:defineToggleSwitch("EB_BACK_RD_DIM_BRIGHT", 1, 3630, 846, "Flight Director", "C-101EB BACK Flight Director Bright/Dim")

--INTERCOM PANEL
C_101:definePushButton("EB_FRONT_INTER_UHF_BTN", 6, 3014, 281, "Intercom", "C-101EB FRONT Intercom UHF Switch (push)")
C_101:definePotentiometer("EB_FRONT_INTER_UHF_KNB", 6, 3015, 395, { 0, 1 }, "Intercom", "C-101EB FRONT Intercom UHF Switch (turn)")
C_101:definePushButton("EB_FRONT_INTER_TCN_BTN", 6, 3016, 284, "Intercom", "C-101EB FRONT Intercom TCN Switch (push)")
C_101:definePotentiometer("EB_FRONT_INTER_TCN_KNB", 6, 3017, 398, { 0, 1 }, "Intercom", "C-101EB FRONT Intercom TCN Switch (turn)")
C_101:defineMultipositionSwitch("EB_FRONT_INTER_SEL", 6, 3018, 404, 3, 0.5, "Intercom", "C-101CC FRONT Intercom Selector Switch")
C_101:definePushButton("EB_BACK_INTER_UHF_BTN", 6, 3037, 885, "Intercom", "C-101EB BACK Intercom UHF Switch (push)")
C_101:definePotentiometer("EB_BACK_INTER_UHF_KNB", 6, 3038, 895, { 0, 1 }, "Intercom", "C-101EB BACK Intercom UHF Switch (turn)")
C_101:definePushButton("EB_BACK_INTER_TCN_BTN", 6, 3039, 888, "Intercom", "C-101EB BACK Intercom TCN Switch (push)")
C_101:definePotentiometer("EB_BACK_INTER_TCN_KNB", 6, 3040, 898, { 0, 1 }, "Intercom", "C-101EB BACK Intercom TCN Switch (turn)")
C_101:defineMultipositionSwitch("EB_BACK_INTER_SEL", 6, 3041, 947, 3, 0.5, "Intercom", "C-101EB BACK Intercom Selector Switch")

--AHRS CONTROL PANEL
C_101:defineMultipositionSwitch("EB_FRONT_AHRS_MAN_GYRO_CORR", 1, 3026, 339, 3, 0.5, "AHRS", "C-101CC FRONT AHRS Manual Gyro Correction")
C_101:definePushButton("EB_FRONT_AHRS_VERT_GYRO_FAST_ERECT", 1, 3027, 340, "AHRS", "C-101EB FRONT AHRS Vertical Gyro Fast Erect")
C_101:defineToggleSwitch("EB_FRONT_AHRS_GYRO_MODE", 1, 3028, 341, "AHRS", "C-101EB FRONT AHRS Gyro Mode")
C_101:defineMultipositionSwitch("EB_BACK_AHRS_MAN_GYRO_CORR", 1, 3650, 965, 3, 0.5, "AHRS", "C-101CC BACK AHRS Manual Gyro Correction")
C_101:definePushButton("EB_BACK_AHRS_VERT_GYRO_FAST_ERECT", 1, 3510, 966, "AHRS", "C-101EB BACK AHRS Vertical Gyro Fast Erect")
C_101:defineToggleSwitch("EB_BACK_AHRS_GYRO_MODE", 1, 3642, 967, "AHRS", "C-101EB BACK AHRS Gyro Mode")

--MISC FUNCTIONS
C_101:definePushButton("EB_FRONT_VOR_TCN_NAV_SEL", 1, 3037, 337, "Misc", "C-101EB FRONT VOR/TCN Nav Selector")
C_101:defineRotary("EB_FRONT_AIR_SPEED_IND_BUG", 1, 3237, 102, "Misc", "C-101EB FRONT Airspeed Indicator Bug")
C_101:definePushButton("EB_BACK_VOR_TCN_NAV_SEL", 1, 3641, 840, "Misc", "C-101EB BACK VOR/TCN Nav Selector")
C_101:defineRotary("EB_BACK_AIR_SPEED_IND_BUG", 1, 3491, 803, "Misc", "C-101EB BACK Airspeed Indicator Bug")
C_101:defineMultipositionSwitch("EB_FRONT_UHF_ANT_SEL", 1, 3221, 338, 3, 0.5, "Misc", "C-101EB FRONT UHF Antenna Selection")
C_101:definePotentiometer("EB_FRONT_ADJ_RED_LIGHT", 1, 3229, 260, { 0, 1 }, "Misc", "C-101EB FRONT Adjust Main Panel Red Light")
C_101:definePotentiometer("EB_BACK_ADJ_RED_LIGHT", 1, 3640, 265, { 0, 1 }, "Misc", "C-101EB BACK Adjust Main Panel Red Light")
C_101:definePotentiometer("EB_FRONT_ADJ_ADI_PITCH", 1, 3165, 112, { 0, 1 }, "Misc", "C-101EB FRONT ADI Pitch Adjust")
C_101:definePotentiometer("EB_BACK_ADJ_ADI_PITCH", 1, 3600, 990, { 0, 1 }, "Misc", "C-101EB BACK ADI Pitch Adjust")
C_101:definePotentiometer("EB_FRONT_HSI_BRIGHT", 1, 3161, 343, { 0, 1 }, "Misc", "C-101EB FRONT HSI Digit Brightness")
C_101:definePotentiometer("EB_BACK_HSI_BRIGHT", 1, 3443, 766, { 0, 1 }, "Misc", "C-101EB BACK HSI Digit Brightness")

--------------FORWARD COCKPIT ONLY FUNCTIONS
--TACAN PANEL
C_101:defineRotary("EB_FRONT_TCN_CHAN_10", 12, 3001, 387, "TACAN", "C-101EB FRONT TACAN Channel 00x-12x")
C_101:defineMultipositionSwitch("EB_FRONT_TCN_CHAN_1", 12, 3002, 388, 10, 0.1, "TACAN", "C-101EB FRONT TACAN Channel xx1")
C_101:defineToggleSwitch("EB_FRONT_TCN_CHAN_XY", 12, 3003, 389, "TACAN", "C-101EB FRONT TACAN Channel X/Y")
C_101:definePushButton("EB_FRONT_TCN_TEST", 12, 3004, 390, "TACAN", "C-101EB FRONT TACAN Test")
C_101:definePotentiometer("EB_FRONT_TCN_VOL", 12, 3005, 392, { 0, 1 }, "TACAN", "C-101EB FRONT TACAN Volume")
C_101:defineMultipositionSwitch("EB_FRONT_TCN_MODE", 12, 3006, 393, 5, 0.25, "TACAN", "C-101EB FRONT TACAN Mode")

--CIRCUIT BREAKERS
C_101:defineToggleSwitch("EB_FRONT_CB_VERT_GYRO_DC", 1, 3064, 436, "CB Panel", "C-101EB FRONT Circuit Breaker Vertical Gyro DC")
C_101:defineToggleSwitch("EB_FRONT_CB_DIR_GYRO_DC", 1, 3065, 437, "CB Panel", "C-101EB FRONT Circuit Breaker Directional Gyro DC")
C_101:defineToggleSwitch("EB_FRONT_CB_IFF_PRIM", 1, 3086, 462, "CB Panel", "C-101EB FRONT Circuit Breaker IFF Prim DC")
C_101:defineToggleSwitch("EB_FRONT_CB_FUEL_MEASURE", 1, 3060, 453, "CB Panel", "C-101EB FRONT Circuit Breaker Fuel Measuring System")
C_101:defineToggleSwitch("EB_FRONT_CB_UHF", 1, 3095, 455, "CB Panel", "C-101EB FRONT Circuit Breaker UHF")
C_101:defineToggleSwitch("EB_FRONT_CB_TACAN_DC", 1, 3077, 465, "CB Panel", "C-101EB FRONT Circuit Breaker TACAN DC")
C_101:defineToggleSwitch("EB_FRONT_CB_RED_L", 1, 3090, 466, "CB Panel", "C-101EB FRONT Circuit Breaker Red Cockpit Lighting")
C_101:defineToggleSwitch("EB_FRONT_CB_VHF_DC_ESS", 1, 3092, 469, "CB Panel", "C-101EB FRONT Circuit Breaker VHF DC ESS")
C_101:defineToggleSwitch("EB_FRONT_CB_BAK_ADI", 1, 3059, 471, "CB Panel", "C-101EB FRONT Circuit Breaker Backup ADI")
C_101:defineToggleSwitch("EB_FRONT_CB_INTER", 1, 3093, 470, "CB Panel", "C-101EB FRONT Circuit Breaker Interphone")
C_101:defineToggleSwitch("EB_FRONT_CB_VERT_GYRO_AC", 1, 3066, 458, "CB Panel", "C-101EB FRONT Circuit Breaker Vertical Gyro AC")
C_101:defineToggleSwitch("EB_FRONT_CB_DIR_GYRO_AC", 1, 3067, 457, "CB Panel", "C-101EB FRONT Circuit Breaker Directional Gyro AC")
C_101:defineToggleSwitch("EB_FRONT_CB_TACAN_115", 1, 3079, 459, "CB Panel", "C-101EB FRONT Circuit Breaker TACAN 115V AC")
C_101:defineToggleSwitch("EB_FRONT_CB_CONS_L", 1, 3099, 460, "CB Panel", "C-101EB FRONT Circuit Breaker Console Lights")
C_101:defineToggleSwitch("EB_FRONT_CB_IFF_115", 1, 3097, 461, "CB Panel", "C-101EB FRONT Circuit Breaker IFF 115V AC")
C_101:defineToggleSwitch("EB_FRONT_CB_FD", 1, 3100, 472, "CB Panel", "C-101EB FRONT Circuit Breaker Flight Director")
C_101:defineToggleSwitch("EB_FRONT_CB_TACAN_26", 1, 3080, 473, "CB Panel", "C-101EB FRONT Circuit Breaker TACAN 26V AC")
C_101:defineToggleSwitch("EB_FRONT_CB_VOR_26", 1, 3078, 532, "CB Panel", "C-101EB FRONT Circuit Breaker VOR 26V AC")
C_101:defineToggleSwitch("EB_FRONT_CB_SMOKE_COL", 1, 3643, 851, "CB Panel", "C-101EB FRONT Circuit Breaker Colour Smoke")
C_101:defineToggleSwitch("EB_FRONT_CB_SMOKE_WH", 1, 3644, 852, "CB Panel", "C-101EB FRONT Circuit Breaker White Smoke")

C_101:defineIndicatorLight("CC_FRONT_WARN_LOW_FUEL", 150, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel LOW FUEL Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_FIRE", 151, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel FIRE Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_OXY_P", 152, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel OXY PRESS Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_CANOPY", 153, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel CANOPY Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_CKPT_P", 154, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel CKPT RESS Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_HYD_P", 155, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel HYD PRESS Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_OIL_P", 156, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel OIL PRESS Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_CHP_DECT", 157, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel CHP DETECT Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_BAT", 158, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel BATTERY Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_GEN", 159, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel GENERATOR Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_WARN_FUEL_P", 160, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel FUEL PRESS Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_FUEL_V", 161, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel FUEL VALVE Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_AIR", 162, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel AIR COND Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_GEAR", 163, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel GEAR^ Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_PITOT", 164, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel PITOT HEAT Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_COMP", 165, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel COMPUTER Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_AICE", 166, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel ANTI-ICE Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_AOA", 167, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel AOA/STALL Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_NORM", 168, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel NORM INV Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_STBY", 169, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel STBY INV Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_BUS_ON", 175, "Warning, Caution and IndicatorLights", "C-101CC FRONT Warning Panel Bus Transfer ON Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_WARN_L", 170, "Warning, Caution and IndicatorLights", "C-101CC FRONT WARNING Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_FIRE_L", 171, "Warning, Caution and IndicatorLights", "C-101CC FRONT FIRE Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_CAUTION_L", 172, "Warning, Caution and IndicatorLights", "C-101CC FRONT CAUTION Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_OFF_L", 173, "Warning, Caution and IndicatorLights", "C-101CC FRONT OFF Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_ASKID_L", 174, "Warning, Caution and IndicatorLights", "C-101CC FRONT ANTI SKID Lamp (red)")
C_101:defineIndicatorLight("CC_FRONT_BUS_TRANS_ON_L", 175, "Warning, Caution and IndicatorLights", "C-101CC FRONT Bus Transfer ON Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_BAT_OFF_L_L", 176, "Warning, Caution and IndicatorLights", "C-101CC FRONT Left Batterie OFF Lamp (yellow)")
C_101:defineIndicatorLight("CC_FRONT_BAT_OFF_R_L", 177, "Warning, Caution and IndicatorLights", "C-101CC FRONT Right Batterie OFF Lamp (yellow)")
--178 ff
C_101:definePotentiometer("FRONT_MIRROR_ADJ", 1, 3242, 10, { 0, 1 }, "Misc", "FRONT Adjust Mirror")

C_101:defineReadWriteRadio("COMM_RADIO", 10, 7, 3, 1000, "COMM RADIO")
C_101:defineReadWriteRadio("VUHF_RADIO", 11, 7, 3, 1000, "VUHF RADIO")

C_101:defineSeatPosition("ownIndex", 2, "Player's current seat position (0 = Front, 1 = Back)")

return C_101
