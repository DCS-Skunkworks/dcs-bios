BIOS.protocol.beginModule("F-14B", 0x1200)
BIOS.protocol.setExportModuleAircrafts({"F-14B"})

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
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

local function define3PosTumb(msg, device_id, command, arg_number, category, description)
	defineTumb(msg, device_id, command, arg_number, 1, {-1, 1}, nil, false, category, description)
end

-- Hydraulics
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_SW", 12, 3001, 629, "Hydraulics", "Pilot Hydraulic Transfer Pump Switch")
defineToggleSwitch("PLT_HYD_TRANS_PUMPLT_COVER", 12, 3002, 630, "Hydraulics", "Pilot Hydraulic Transfer Pump Switch Cover")
defineToggleSwitch("PLT_HYD_ISOL_SW", 12, 3005, 631, "Hydraulics", "Pilot Hydraulic Isolation Switch")
define3PosTumb("PLT_HYD_EMERG_FCONTR_SW", 12, 3003, 928, "Hydraulics", "Pilot Hydraulic Emergency Flight Control Switch")
defineToggleSwitch("PLT_HYD_EMERG_FCONTR_COVER", 12, 3004, 615, "Hydraulics", "Pilot Hydraulic Emergency Flight Control Switch Cover")
defineToggleSwitch("PLT_HYD_HAND_PUMP", 12, 3006, 632, "Hydraulics", "Pilot Hydraulic Hand Pump")

-- Master Reset
definePushButton("PLT_MASTER_RESET", 22, 3058, 1071, "Master Reset", "Pilot MASTER RESET")

-- AICS
defineToggleSwitch("PLT_INLET_RAMPS_L", 13, 3007, 2100, "AICS", "Pilot Stow Inlet Ramps Left Switch")
defineToggleSwitch("PLT_INLET_RAMPS_R", 13, 3008, 2101, "AICS", "Pilot Stow Inlet Ramps Right Switch")

-- Wing Sweep
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_COVER", 16, 3029, 317, "Wing Sweep", "Pilot Emergency Wing Sweep Handle Cover")
definePotentiometer("PLT_EMERG_WING_SWEEPLT_LEVER", 16, 3031, 384, {0, 1}, "Wing Sweep", "Pilot Emergency Wing Sweep Handle")
defineToggleSwitch("PLT_EMERG_WING_SWEEPLT_POP", 12, 3030, 15096, "Wing Sweep", "Pilot Emergency Wing Sweep Handle Pop out")

--Radar Altimeter
definePushButton("PLT_RADAR_ALT_BIT", 29, 3489, 16020, "Radar Altimeter", "Pilot Radar Altimeter BIT Test Button")
defineRotary("PLT_RADAR_ALT_KNOB", 29, 3490, 308, "Radar Altimeter", "Pilot Radar Altimeter Control Knob")

-- Airspeed Indicator
definePushButton("PLT_AIRSPD_KNOB_PUSH", 27, 3492, 2127, "Airspeed Indicator", "Pilot Airspeed Indicator Bug Push Knob")
defineRotary("PLT_AIRSPD_KNOB", 27, 3491, 310, "Airspeed Indicator", "Pilot Airspeed Indicator Bug Knob")

-- Altimeter
define3PosTumb("PLT_ALTIMETER_MODE", 28, 3487, 307, "Altimeter", "Pilot Altimeter Mode Switch")
definePotentiometer("PLT_ALTIMETER_KNOB", 28, 3486, 306, {0, 1}, "Altimeter", "Pilot Altimeter Pressure Setting")

-- RIO Altimeter
define3PosTumb("RIO_ALTIMETER_MODE", 28, 3490, 20307, "Altimeter", "RIO Altimeter Mode Switch")
definePotentiometer("RIO_ALTIMETER_KNOB", 28, 3489, 20306, {0, 1}, "Altimeter", "RIO Altimeter Pressure Setting")

-- Gear
defineToggleSwitch("PLT_GEAR_LEVER", 17, 3016, 326, "Gear", "Pilot Landing Gear Lever")
defineToggleSwitch("PLT_GEAR_LEVER_EMERG", 17, 3633, 16015, "Gear", "Pilot Landing Gear Lever RB emergency extend")
definePushButton("PLT_LAUNCHBAR_ABORT", 17, 3659, 497, "Gear", "Pilot Launch Bar Abort")
defineToggleSwitch("PLT_LAUNCHBAR_ABORT_COVER", 17, 3660, 496, "Gear", "Pilot Launch Bar Abort Switch Cover")
define3PosTumb("PLT_NOSE_STRUT_SW", 17, 3019, 1075, "Gear", "Pilot Nose Strut Compression Switch")

-- Hook
defineToggleSwitch("PLT_HOOK_LEVER", 17, 3021, 238, "Gear", "Pilot Hook Extension Handle")
defineToggleSwitch("PLT_HOOK_LEVER_EMERG", 17, 3022, 15078, "Gear", "Pilot Hook Extension Handle RB cycle emergency mode")

-- Brakes
define3PosTumb("PLT_ANTI_SKID_SW", 17, 3014, 1072, "Brakes", "Anti-Skid Spoiler BK Switch")
defineToggleSwitch("PLT_PARK_BRAKE", 17, 3013, 237, "Brakes", "Pilot Parking Brake Handle")

-- SAS
defineToggleSwitch("PLT_AFCS_PITCH", 21, 3034, 2106, "SAS", "Pilot AFCS Stability Augmentation - Pitch")
defineToggleSwitch("PLT_AFCS_ROLL", 21, 3035, 2107, "SAS", "Pilot AFCS Stability Augmentation - Roll")
defineToggleSwitch("PLT_AFCS_YAW", 21, 3036, 2108, "SAS", "Pilot AFCS Stability Augmentation - Yaw")

-- Autopilot
define3PosTumb("PLT_AUTOPLT_VECTOR_CARRIER", 21, 3037, 2109, "Autopilot", "Pilot Autopilot - Vector / Automatic Carrier Landing")
defineToggleSwitch("PLT_AUTOPLT_ALT", 21, 3038, 2110, "Autopilot", "Pilot Autopilot - Altitude Hold")
define3PosTumb("PLT_AUTOPLT_HDG", 21, 3039, 2111, "Autopilot", "Pilot Autopilot - Heading / Ground Track")
defineToggleSwitch("PLT_AUTOPLT_ENGAGE", 21, 3040, 2112, "Autopilot", "Pilot Autopilot - Engage")

-- Flaps
definePotentiometer("PLT_FLAPS_LEVER", 18, 3044, 225, {0, 1}, "Flaps", "Pilot Flaps Lever")

-- Engine
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_L", 19, 3128, 12300, "Engine", "Pilot Left Engine Fuel Cutoff")
defineToggleSwitch("PLT_ENGINE_FUEL_CUT_R", 19, 3129, 12301, "Engine", "Pilot Right Engine Fuel Cutoff")
define3PosTumb("PLT_THROTTLE_MODE", 19, 3045, 2104, "Engine", "Pilot Throttle Mode")
define3PosTumb("PLT_THROTTLE_TEMP", 19, 3047, 2103, "Engine", "Pilot Throttle Temp")
define3PosTumb("PLT_ANTI_ICE", 19, 3049, 941, "Engine", "Pilot Engine/Probe Anti-Ice")
defineToggleSwitch("PLT_ENGINE_AIRSTART", 19, 3050, 2105, "Engine", "Pilot Engine Airstart")
define3PosTumb("PLT_ENGINE_CRANK", 19, 3051, 2102, "Engine", "Pilot Engine Crank")
defineToggleSwitch("PLT_ENGINE_MODE_L", 19, 3052, 16007, "Engine", "Pilot Left Engine Mode")
defineToggleSwitch("PLT_ENGINE_MODE_R", 19, 3053, 16008, "Engine", "Pilot Right Engine Mode")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT_COVER", 19, 3055, 16005, "Engine", "Pilot Asymmetric Thrust Limiter Cover")
defineToggleSwitch("PLT_ASY_THRUST_LIMIT", 19, 3054, 16006, "Engine", "Pilot Asymmetric Thrust Limiter")

-- Fire System
--definePushButton("PLT_FIRE_EX_BOTTLE_L", devices.FIRE, 3059, 15083, "Gear", "Pilot Fire Ext Bottle - Left") missing device
--definePushButton("PLT_FIRE_EX_BOTTLE_R", devices.FIRE, 3060, 15082, "Gear", "Pilot Fire Ext Bottle - Right")

-- Fuel System
defineToggleSwitch("PLT_FUEL_SHUTOFF_R", 20, 3061, 1044, "Fuel System", "Pilot Fuel Shutoff - Right")
defineToggleSwitch("PLT_FUEL_SHUTOFF_L", 20, 3062, 15081, "Fuel System", "Pilot Fuel Shutoff - Left")
defineToggleSwitch("PLT_FUEL_FEED_COVER", 20, 3064, 1094, "Fuel System", "Pilot Fuel Feed Cover")
define3PosTumb("PLT_FUEL_FEED", 20, 3065, 1095, "Fuel System", "Pilot Fuel Feed")
define3PosTumb("PLT_FUEL_WING_EXT_TRANS", 20, 3066, 1001, "Fuel System", "Pilot Fuel Wing/Ext Trans")
defineToggleSwitch("PLT_FUEL_DUMP", 20, 3067, 1074, "Fuel System", "Pilot Fuel Dump")
define3PosTumb("PLT_REFUEL_PROBE", 20, 3068, 1073, "Fuel System", "Pilot Refuel Probe")
define3PosTumb("PLT_FUEL_QUANT_SEL", 20, 3063, 1076, "Fuel System", "Pilot Fuel Quantity Selector")
definePotentiometer("PLT_BINGO_FUEL_KNOB", 20, 3069, 1050, {0, 1}, "Flaps", "Pilot BINGO Fuel Level Knob")

-- Electrics
define3PosTumb("PLT_L_GEN_SW", 14, 3009, 937, "Electrics", "Pilot Left Generator Switch")
define3PosTumb("PLT_R_GEN_SW", 14, 3010, 936, "Electrics", "Pilot Right Generator Switch")
defineToggleSwitch("PLT_EMERG_GEN_COVER", 14, 3011, 927, "Electrics", "Pilot Emergency Generator Switch Cover")
defineToggleSwitch("PLT_EMERG_GEN_SW", 14, 3012, 926, "Electrics", "Pilot Emergency Generator Switch")

-- Cockpit Mechanics
defineToggleSwitch("PLT_CANOPY_JETT", 11, 3184, 224, "Cockpit Mechanics", "Pilot Canopy Jettison")
defineToggleSwitch("RIO_CANOPY_JETT", 11, 3184, 2051, "Cockpit Mechanics", "RIO Canopy Jettison")
defineToggleSwitch("RIO_EJECT_CMD", 11, 3185, 2049, "Cockpit Mechanics", "RIO Ejection CMD Lever")
defineToggleSwitch("PLT_EJECT_SEAT_SAFE", 11, 3186, 404, "Cockpit Mechanics", "Pilot Ejection Seat Safety")
defineToggleSwitch("RIO_EJECT_SEAT_SAFE", 11, 3187, 498, "Cockpit Mechanics", "RIO Ejection Seat Safety")
defineToggleSwitch("RIO_STORAGE_BOX", 11, 3599, 122, "Cockpit Mechanics", "RIO Storage Box")

-- Enivornment Control
defineToggleSwitch("PLT_OXY_ON", 11, 3190, 8114, "Enivornment Control", "Pilot Oxygen On")
defineToggleSwitch("RIO_OXY_ON", 11, 3191, 119, "Enivornment Control", "RIO Oxygen On")
defineToggleSwitch("PLT_CABIN_PRESS_DUMP", 11, 3192, 939, "Enivornment Control", "Pilot Cabin Pressure Dump")
definePushButton("PLT_AIR_SOURCE_RAM", 11, 3193, 929, "Enivornment Control", "Pilot Air Source Ram")
definePushButton("PLT_AIR_SOURCE_OFF", 11, 3194, 933, "Enivornment Control", "Pilot Air Source Off")
definePushButton("PLT_AIR_SOURCE_L", 11, 3195, 930, "Enivornment Control", "Pilot Air Left Engine")
definePushButton("PLT_AIR_SOURCE_R", 11, 3196, 931, "Enivornment Control", "Pilot Air Right Engine")
definePushButton("PLT_AIR_SOURCE_BOTH", 11, 3197, 932, "Enivornment Control", "Pilot Air Both Engines")
define3PosTumb("PLT_WINDSHIELD_AIR", 11, 3634, 942, "Enivornment Control", "Pilot Wind Shield Air")
defineMultipositionSwitch("PLT_TEMP", 11, 3635, 950, 9, 0.125,"Enivornment Control" ,"Pilot Cabin Temperature Switch")
defineToggleSwitch("PLT_TEMP_AUTO_MAN", 11, 3636, 940, "Enivornment Control", "Pilot Temperature Auto/Man")
defineToggleSwitch("PLT_RAM_AIR", 11, 3637, 938, "Enivornment Control", "Pilot Ram Air")

-- BIT Panel
defineTumb("PLT_BIT_SWITCH", 10, 3076, 934, 1/11, {0.0, 1.0}, nil, false, "BIT Panel", "Pilot Master Test Selector (LB to rotate)")
defineToggleSwitch("PLT_BIT_SWITCH_PUSH", 10, 3077, 15098, "BIT Panel", "Pilot Master Test Selector (RB to pull/push)")

-- Light Panel
defineToggleSwitch("PLT_HOOK_BYPASS", 25, 3653, 915, "Light Panel", "Pilot Hook Bypass")
defineToggleSwitch("PLT_TAXI_LIGHT", 11, 3171, 918, "Light Panel", "Pilot Taxi Light")
define3PosTumb("PLT_FLOOD_LIGHT_RED", 11, 3172, 924, "Light Panel", "Pilot Red Flood Light")
define3PosTumb("PLT_FLOOD_LIGHT_WH", 11, 3173, 921, "Light Panel", "Pilot White Flood Light")
define3PosTumb("PLT_POS_LIGHT_WING", 11, 3174, 913, "Light Panel", "Pilot Position Lights Wings")
define3PosTumb("PLT_POS_LIGHT_TAIL", 11, 3175, 916, "Light Panel", "Pilot Position Lights Tail")
defineToggleSwitch("PLT_POS_LIGHT_FLASH", 11, 3176, 919, "Light Panel", "Pilot Position Lights Flash")
defineToggleSwitch("PLT_ANTICOL_LIGHT", 11, 3177, 923, "Light Panel", "Pilot Anti-Collision Lights")
defineMultipositionSwitch("PLT_LIGHT_INTENT_ACM", 11, 3649, 15005, 9, 0.125,"Light Panel" ,"Pilot ACM Panel Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_INDEXER", 25, 3212, 15006, 9, 0.125,"Light Panel" ,"Pilot AoA Indexer Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_INSTRUMENT", 11, 3650, 15007, 9, 0.125,"Light Panel" ,"Pilot Instrument Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_CANSOLE", 11, 3651, 15008, 9, 0.125,"Light Panel" ,"Pilot Console Light Intensity")
defineMultipositionSwitch("PLT_LIGHT_INTENT_FORMATION", 11, 3652, 15009, 9, 0.125,"Light Panel" ,"Pilot Formation Light Intensity")

-- Light panel RIO
define3PosTumb("RIO_FLOOD_LIGHT_RED", 11, 3693, 194, "Light Panel", "RIO Red Flood Light")
define3PosTumb("RIO_FLOOD_LIGHT_WH", 11, 3694, 159, "Light Panel", "RIO White Flood Light")
defineMultipositionSwitch("RIO_LIGHT_INTENT_INSTRUMENT", 11, 3695, 193, 9, 0.125,"Light Panel" ,"RIO Instrument Light Intensity")
defineMultipositionSwitch("RIO_LIGHT_INTENT_CANSOLE", 11, 3696, 192, 9, 0.125,"Light Panel" ,"RIO Console Light Intensity")

-- DISPLAY Panel: Power
defineToggleSwitch("PLT_VDI_PW_SW", 42, 3214, 1010, "Display", "Pilot VDI Power On/Off")
defineToggleSwitch("PLT_HUD_PW_SW", 40, 3213, 1009, "Display", "Pilot HUD Power On/Off")
defineToggleSwitch("PLT_HSD_PW_SW", 41, 3215, 1008, "Display", "Pilot HSD/ECMD Power On/Off")

-- DISPLAY Panel: Steer CMD
definePushButton("PLT_NAV_STEER_TACAN", 46, 3314, 1002, "Display", "Pilot Navigation Steer Commands: TACAN")
definePushButton("PLT_NAV_STEER_DEST", 46, 3315, 1003, "Display", "Pilot Navigation Steer Commands: Destination")
definePushButton("PLT_NAV_STEER_AWL", 46, 3316, 1004, "Display", "Pilot Navigation Steer Commands: AWL PCD")
definePushButton("PLT_NAV_STEER_VECTOR", 46, 3317, 1005, "Display", "Pilot Navigation Steer Commands: Vector")
definePushButton("PLT_NAV_STEER_MAN", 46, 3318, 1006, "Display", "Pilot Navigation Steer Commands: Manual")

-- DISPLAY Panel: HSD
define3PosTumb("PLT_HSD_DIS_MODE", 41, 3235, 1016, "Display", "Pilot HSD Display Mode")
defineToggleSwitch("PLT_HSD_ECM_OVER", 41, 3239, 1017, "Display", "Pilot HSD ECM Override")

-- HSD
definePotentiometer("PLT_HSD_KNOB_HDG", 41, 3241, 1039, {0.0, 1.0}, "HSD", "Pilot HSD Selected Heading")
definePotentiometer("PLT_HSD_KNOB_CRS", 41, 3242, 1040, {0.0, 1.0}, "HSD", "Pilot HSD Selected Course")
definePotentiometer("PLT_HSD_BRIGHT", 41, 3240, 1043, {0.0, 1.0}, "HSD", "Pilot HSD Brightness")
definePushButton("PLT_HSD_TEST", 41, 3243, 1041, "HSD", "Pilot HSD Test")

-- ECMD
definePotentiometer("RIO_ECMD_BRIGHT", 41, 3245, 2023, {0.0, 1.0}, "ECMD", "RIO ECMD Brightness")
definePushButton("RIO_ECMD_TEST", 41, 3246, 2024, "ECMD", "RIO ECMD Test")

-- TACAN CMD
defineToggleSwitch("PLT_TACAN_CMD_BUTTON", 47, 3324, 292, "TACAN", "Pilot TACAN CMD Button")
defineToggleSwitch("RIO_TACAN_CMD_BUTTON", 47, 3325, 135, "TACAN", "RIO TACAN CMD Button")

-- TACAN Pilot Panel
defineTumb("PLT_TACAN_MODE", 47, 3326, 2041, 0.25, {0.0, 1.25}, nil, false, "TACAN", "Pilot TACAN Mode")
definePotentiometer("PLT_TACAN_VOLUME", 47, 3328, 2036, {0.0, 1.0}, "TACAN", "Pilot TACAN Volume")
defineFixedStepTumb("PLT_TACAN_MODE_NORMAL_INV", 47, 3335, 2042, 2, {0, 1}, {-1, 1}, nil, "TACAN", "Pilot TACAN Mode Normal/Inverse")
defineFixedStepTumb("PLT_TACAN_CHANNEL", 47, 3336, 2043, 2, {0, 1}, {-1, 1}, nil, "TACAN", "Pilot TACAN Channel X/Y")
definePushButton("PLT_TACAN_BIT", 47, 3334, 2115, "TACAN", "Pilot TACAN Bit")
defineTumb("PLT_TACAN_DIAL_TENS", 47, 3330, 8888, 1/12, {0.0, 1.08333333333}, nil, false, "TACAN", "Pilot TACAN Channel Wheel (Tens)")
defineTumb("PLT_TACAN_DIAL_ONES", 47, 3332, 8889, 1/9, {0.0, 1.11111111111}, nil, false, "TACAN", "Pilot TACAN Channel Lever (Ones)")

-- TACAN RIO Panel
defineTumb("RIO_TACAN_MODE", 47, 3338, 374, 0.25, {0.0, 1.25}, nil, false, "TACAN", "RIO TACAN Mode")
definePotentiometer("RIO_TACAN_VOLUME", 47, 3340, 375, {0.0, 1.0}, "TACAN", "RIO TACAN Volume")
defineToggleSwitch("RIO_TACAN_MODE_NORMAL_INV", 47, 3347, 373, "TACAN", "RIO TACAN Mode Normal/Inverse")
defineToggleSwitch("RIO_TACAN_CHANNEL", 47, 3348, 372, "TACAN", "RIO TACAN Channel X/Y")
definePushButton("RIO_TACAN_BIT", 47, 3346, 371, "TACAN", "RIO TACAN Bit")
defineTumb("RIO_TACAN_DIAL_TENS", 47, 3342, 8891, 1/12, {0.0, 1.08333333333}, nil, false, "TACAN", "RIO TACAN Channel Wheel (Tens)")
defineTumb("RIO_TACAN_DIAL_ONES", 47, 3344, 8890, 1/9, {0.0, 1.11111111111}, nil, false, "TACAN", "RIO TACAN Channel Lever (Ones)")

-- AN/ARA-63 Panel
defineToggleSwitch("PLT_ARA63_PW", 48, 3319, 910, "ANARA63 Panel", "Rilot TACAN Channel X/Y")
definePushButton("PLT_ARA63_BIT", 48, 3321, 911, "ANARA63 Panel", "Rilot AN/ARA-63 BIT Button")
defineMultipositionSwitch("PLT_ARA63_CHAN", 11, 3322, 912, 20, 1/19,"ANARA63 Panel" ,"Pilot AN/ARA-63 Channel Knob")

-- Pilot TONE VOLUME Panel
definePotentiometer("PLT_ALR67_VOL", 2, 3395, 2040, {0.0, 1.0}, "Volume Panel", "Pilot ALR-67 Volume")
definePotentiometer("PLT_AIM9_VOL", 2, 3397, 2039, {0.0, 1.0}, "Volume Panel", "Pilot Sidewinder Volume")

-- ICS Pilot
definePotentiometer("PLT_ICS_VOL", 2, 3380, 2048, {0.0, 1.0}, "ICS", "Pilot ICS Volume")
defineMultipositionSwitch("PLT_ICS_AMP_SEL", 2, 3382, 2045, 3, 0.5, "ICS" ,"Pilot ICS Amplifier Selector")
define3PosTumb("PLT_ICS_FUNC_SEL", 2, 3383, 2044, "ICS", "Pilot ICS Function Selector")

-- ICS RIO
definePotentiometer("RIO_ICS_VOL", 2, 3387, 400, {0.0, 1.0}, "ICS", "RIO ICS Volume")
defineMultipositionSwitch("RIO_ICS_AMP_SEL", 2, 3389, 401, 3, 0.5, "ICS" ,"RIO ICS Amplifier Selector")
define3PosTumb("RIO_ICS_FUNC_SEL", 2, 3390, 402, "ICS", "RIO ICS Function Selector")
define3PosTumb("RIO_ICS_XMTR_SEL", 2, 3399, 381, "ICS", "RIO XMTR SEL Switch")
define3PosTumb("RIO_ICS_UHF_LWR", 2, 3598, 380, "ICS", "RIO V/UHF 2 ANT Switch")
define3PosTumb("RIO_ICS_KY_MODE", 2, 3597, 382, "ICS", "RIO KY MODE Switch")

-- UHF ARC-159
defineTumb("PLT_UHF1_FREQ_MODE", 3, 3375, 2033, 0.5, {0.0, 1.5}, nil, false, "UHF 1", "Pilot UHF ARC-159 Freq Mode GUARD/MANUAL/PRESET")
defineTumb("PLT_UHF1_FUNCTION", 3, 3371, 2034, 0.333333, {0.0, 1.333332}, nil, false, "UHF 1", "Pilot UHF ARC-159 Function ADF/BOTH/MAIN/OFF")
defineTumb("PLT_UHF1_PRESETS", 3, 3373, 2032, 0.0833333333, {0.0, 1.666666666}, nil, false, "UHF 1", "Pilot UHF ARC-159 Preset Channel Selector")
defineToggleSwitch("PLT_UHF1_SQUELCH", 3, 3365, 2035, "UHF 1", "Pilot UHF ARC-159 Squelch Switch")
define3PosTumb("PLT_UHF1_110_DIAL", 3, 3367, 2030, "UHF 1", "Pilot UHF ARC-159 100MHz & 10MHz Dial")
define3PosTumb("PLT_UHF1_1_DIAL", 3, 3368, 2029, "UHF 1", "Pilot UHF ARC-159 1MHz Dial")
define3PosTumb("PLT_UHF1_01_DIAL", 3, 3369, 2028, "UHF 1", "Pilot UHF ARC-159 0.1MHz Dial")
define3PosTumb("PLT_UHF1_025_DIAL", 3, 3370, 2026, "UHF 1", "Pilot UHF ARC-159 0.025MHz Dial")
defineToggleSwitch("PLT_UHF1_SHOW_PRESET_FREQ", 3, 3377, 8115, "UHF 1", "Pilot UHF ARC-159 Show Preset Frequency")
definePotentiometer("PLT_UHF1_VOL", 3, 3359, 2031, {0.0, 1.0}, "UHF 1", "Pilot UHF ARC-159 Volume")
definePotentiometer("RIO_UHF1_VOL", 3, 3361, 383, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Volume")
definePotentiometer("PLT_UHF1_BRIGHTNESS", 3, 3363, 2027, {0.0, 1.0}, "UHF 1", "Pilot UHF ARC-159 Display Brightness")

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

defineIntegerFromGetter("PLT_UHF_DIAL4_FREQ", getARC159_Decimal_DIAL4_Frequency, 100, "UHF 1", "Pilot Dial 4 ARC-159 Frequency")
defineIntegerFromGetter("PLT_UHF_DIAL3_FREQ", getARC159_Decimal_DIAL3_Frequency, 10, "UHF 1", "Pilot Dial 3 ARC-159 Frequency")
defineIntegerFromGetter("PLT_UHF_HIGH_FREQ", getARC159_High_Frequency, 400, "UHF 1", "Pilot High ARC-159 Frequency")

moduleBeingDefined.inputProcessors["SET_UHF_FREQ"] = function(freq)
	freq = freq:gsub("%.", "")
	freq = tonumber(freq)
	if type(freq) == "nil" then return end
	
	GetDevice(3):set_frequency(freq*1000)
end

-- VHF/UHF ARC-182 ("V/UHF 2")
defineTumb("RIO_VUHF_FREQ_MODE", 4, 3417, 353, 0.2, {0.0, 1.2}, nil, false, "VUHF", "RIO VHF/UHF ARC-182 Frequency Mode 243 MAN G PRESET READ LOAD")
defineTumb("RIO_VUHF_MODE", 4, 3413, 358, 0.25, {0.0, 1.25}, nil, false, "VUHF", "RIO VHF/UHF ARC-182 MODE OFF T/R T/R&G DF TEST")
defineTumb("RIO_VUHF_PRESETS", 4, 3415, 352, 0.0833333333, {0.0, 1.666666666}, nil, false, "VUHF", "RIO VHF/UHF ARC-182 Preset Channel Selector")
defineToggleSwitch("RIO_VUHF_FM_AM", 4, 3419, 359, "VUHF", "RIO VHF/UHF ARC-182 Preset Channel Selector")
defineToggleSwitch("RIO_VUHF_FM_AM", 4, 3407, 351, "VUHF", "RIO VHF/UHF ARC-182 Squelch Switch")
define3PosTumb("RIO_VUHF_110_DIAL", 4, 3409, 354, "VUHF", "RIO VUHF ARC-182 100MHz & 10MHz Dial")
define3PosTumb("RIO_VUHF_1_DIAL", 4, 3410, 355, "VUHF", "RIO VUHF ARC-182 1MHz Dial")
define3PosTumb("RIO_VUHF_01_DIAL", 4, 3411, 356, "VUHF", "RIO VUHF ARC-182 0.1MHz Dial")
define3PosTumb("RIO_VUHF_025_DIAL", 4, 3412, 357, "VUHF", "RIO VUHF ARC-182 0.025MHz Dial")
definePotentiometer("RIO_VUHF_VOL", 4, 3401, 350, {0.0, 1.0}, "VUHF", "RIO VUHF ARC-182 Volume")
definePotentiometer("PLT_VUHF_VOL", 4, 3403, 2038, {0.0, 1.0}, "VUHF", "Pilot VUHF ARC-182 Volume")
definePotentiometer("RIO_VUHF_BRIGHTNESS", 4, 3405, 360, {0.0, 1.0}, "VUHF", "RIO VUHF ARC-182 Display Brightness")

function getARC182_High_Frequency()
	--Export : 225000192.000000
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	freq = string.sub(freq, 1, 3)
	return tonumber(freq)	
end
function getARC182_Decimal_DIAL3_Frequency()
	--Export : 225975
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	--Get the 9
	freq = string.sub(freq, 4, 4)
	return tonumber(freq)	
end

function getARC182_Decimal_DIAL4_Frequency()
	--Export : 225975192.000000
	--00 25 50 75
	local arc_182 = GetDevice(4)
	local freq = tostring(arc_182:get_frequency())
	--Get the 75
	freq = string.sub(freq, 5, 6)
	return tonumber(freq)	
end

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
definePotentiometer("PLT_UHF_REMOTE_BRIGHTNESS", 3, 3350, 1031, {0.0, 1.0}, "UHF 1", "Pilot UHF ARC-159 Remote Display Brightness")
definePotentiometer("RIO_UHF_REMOTE_BRIGHTNESS", 3, 3353, 406, {0.0, 1.0}, "UHF 1", "RIO UHF ARC-159 Remote Display Brightness")
definePotentiometer("PLT_VUHF_REMOTE_BRIGHTNESS", 4, 3356, 1030, {0.0, 1.0}, "VUHF", "Pilot VHF/UHF Radio Remote Display Brightness")
defineToggleSwitch("PLT_UHF_DISPLAY_TEST", 2, 3352, 15004, "UHF 1", "Pilot UHF ARC-159 Radio Remote Display Test")
defineToggleSwitch("RIO_UHF_DISPLAY_TEST", 3, 3355, 405, "UHF 1", "RIO UHF ARC-159 Radio Remote Display Test")
defineToggleSwitch("PLT_VUHF_DISPLAY_TEST", 3, 3355, 15003, "VUHF", "Pilot VHF/UHF ARC-182 Radio Remote Display Test")

-- DECM Panel
defineMultipositionSwitch("RIO_DECM_PW_MODE", 53, 3252, 151, 6, 0.2, "DECM Panel" ,"RIO DECM ALQ-100 Power/Mode")
definePotentiometer("RIO_DECM_VOL", 53, 3253, 9950, {0.0, 1.0}, "DECM Panel", "RIO DECM ALQ-100 Volume")

-- RWR Control Panel ALR-67
definePotentiometer("PLT_RWR_BRIGHT", 54, 3261, 16011, {0.0, 1.0}, "RWR Control Panel", "Pilot AN/ALR-67 Display Brightness")
definePotentiometer("RIO_RWR_BRIGHT", 54, 3263, 376, {0.0, 1.0}, "RWR Control Panel", "RIO AN/ALR-67 Display Brightness")
defineMultipositionSwitch("RIO_RWR_DIS_TYP", 53, 3257, 2136, 5, 0.25, "DECM Panel" ,"RIO AN/ALR-67 Display Type")
define3PosTumb("RIO_RWR_MODE", 53, 3256, 2137, "DECM Panel", "RIO AN/ALR-67 Mode")
define3PosTumb("RIO_RWR_TEST", 53, 3261, 2140, "DECM Panel", "RIO AN/ALR-67 Mode")
defineToggleSwitch("RIO_RWR_PW", 53, 3259, 2139, "DECM Panel", "RIO AN/ALR-67 Power")
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
defineFixedStepTumb("RIO_CMDS_LOAD_TYP_L10", 5, 3281, 206, 3, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO AN/ALE-37 L10 Load Type")
defineFixedStepTumb("RIO_CMDS_LOAD_TYP_L20", 5, 3283, 207, 3, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO AN/ALE-37 L20 Load Type")
defineFixedStepTumb("RIO_CMDS_LOAD_TYP_R10", 5, 3285, 209, 3, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO AN/ALE-37 R10 Load Type")
defineFixedStepTumb("RIO_CMDS_LOAD_TYP_R20", 5, 3287, 208, 3, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO AN/ALE-37 R20 Load Type")
defineFixedStepTumb("RIO_CMDS_CHAFF_BURST_QUAN", 5, 3298, 214, 6, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Chaff Burst Quantity")
defineFixedStepTumb("RIO_CMDS_CHAFF_BURST_INTER", 5, 3300, 215, 6, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Chaff Burst Interval")
defineFixedStepTumb("RIO_CMDS_CHAFF_SALVO_QUAN", 5, 3302, 203, 6, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Chaff Salvo Quantity")
defineFixedStepTumb("RIO_CMDS_CHAFF_SALVO_INTER", 5, 3304, 202, 6, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Chaff Salvo Interval")
defineFixedStepTumb("RIO_CMDS_FLARE_QUAN", 5, 3306, 205, 6, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Flare Quantity")
defineFixedStepTumb("RIO_CMDS_FLARE_INTER", 5, 3308, 210, 5, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Flare Interval")
defineFixedStepTumb("RIO_CMDS_JAMM_QUAN", 5, 3295, 204, 4, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO AN/ALE-37 Jammer Quantity")
defineFixedStepTumb("RIO_CMDS_JAMM_INTER_UNIT", 5, 3289, 211, 10, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Jammer Interval Units")
defineFixedStepTumb("RIO_CMDS_JAMM_INTER_10", 5, 3291, 212, 10, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Jammer Interval Tens")
defineFixedStepTumb("RIO_CMDS_JAMM_INTER_100", 5, 3293, 213, 10, {0, 1}, {-1, 1}, nil, "CMDS Program", "RIO Jammer Interval Hundreds")
definePushButton("RIO_CMDS_PROG_RESET", 5, 3297, 216, "CMDS", "RIO AN/ALE-37 Programmer Reset")

-- INS
defineMultipositionSwitch("RIO_TID_MODE_NAV", 50, 3106, 50, 7, 0.1666667, "INS" ,"RIO TID Navigation Mode")
defineMultipositionSwitch("RIO_TID_MODE_DEST", 46, 3106, 50, 8, 0.142857, "INS" ,"RIO TID Destination Mode")

-- AHRS / Compass  (COMP Panel)
definePotentiometer("PLT_AHRS_HDG_KNOB", 51, 3433, 904, {-1.0, 1.0}, "AHRS", "Pilot Compass HDG Slave Knob")
definePushButton("PLT_AHRS_HDG_PUSH", 51, 3432, 16014, "AHRS", "Pilot Compass HDG Slave Push")
define3PosTumb("PLT_AHRS_MODE", 51, 3434, 905, "AHRS", "Pilot Compass Mode")
defineToggleSwitch("PLT_AHRS_HEMISPHERE", 51, 3436, 906, "AHRS", "Pilot Compass N-S Hemisphere")
definePotentiometer("PLT_AHRS_LAT", 51, 3438, 909, {0.0, 1.0}, "AHRS", "Pilot Compass LAT Correction")

-- Spoiler Overrides
defineToggleSwitch("PLT_SPOIL_OVER_COVER_INBOARD", 14, 3428, 902, "Spoiler", "Pilot Inboard Spoiler Override Cover")
defineToggleSwitch("PLT_SPOIL_OVER_COVER_OUTBOARD", 14, 3429, 903, "Spoiler", "Pilot Outboard Spoiler Override Cover")
defineToggleSwitch("PLT_SPOIL_OVER_INBOARD", 14, 3430, 908, "Spoiler", "Pilot Inboard Spoiler Override")
defineToggleSwitch("PLT_SPOIL_OVER_OUTBOARD", 14, 3431, 907, "Spoiler", "Pilot Outboard Spoiler Override")

-- Gun Elevation
definePotentiometer("PLT_GUN_ELEV_ADJUST", 55, 3131, 1000, {0.0, 1.0}, "Gun", "Pilot Gun Elevation Lead Adjustment")
definePotentiometer("PLT_GUN_AMMU_COUNT_ADJUST", 55, 3132, 1022, {0.0, 1.0}, "Gun", "Pilot Gun Ammunition Counter Adjustment")

-- DISPLAY Panel
definePotentiometer("PLT_HUD_PITCH_BRIGHT", 40, 3223, 1007, {0.0, 1.0}, "Display", "Pilot HUD Pitch Ladder Brightness")
defineToggleSwitch("PLT_VDI_MODE_DISP", 42, 3224, 1019, "Display", "Pilot VDI Display Mode")
defineToggleSwitch("PLT_VDI_MODE_LAND", 42, 3225, 1018, "Display", "Pilot VDI Landing Mode")
defineToggleSwitch("PLT_HUD_DECLUTTER", 40, 3226, 1021, "Display", "Pilot HUD De-clutter On/Off")
defineToggleSwitch("PLT_HUD_MODE_AWL", 40, 3227, 1020, "Display", "Pilot HUD AWL Mode")
definePushButton("PLT_HUD_MODE_TAKEOFF", 40, 3216, 1015, "Display", "Pilot HUD Take-Off Mode")
definePushButton("PLT_HUD_MODE_CRUISE", 40, 3217, 1014, "Display", "Pilot HUD Cruise Mode")
definePushButton("PLT_HUD_MODE_A2A", 40, 3218, 1013, "Display", "Pilot HUD Air-to-Air Mode")
definePushButton("PLT_HUD_MODE_A2G", 40, 3219, 1012, "Display", "Pilot HUD Air-to-Ground Mode")
definePushButton("PLT_HUD_MODE_LAND", 40, 3220, 1011, "Display", "Pilot HUD Landing Mode")

-- Standby ADI
definePushButton("PLT_STDBYAI_UNCAGE", 30, 3545, 1032, "Standby ADI", "Pilot Standby ADI Push to uncage")
definePotentiometer("PLT_STDBYAI_TRIM", 30, 3546, 19101, {0.0, 1.0}, "Standby ADI", "Pilot Standby ADI Knob")
definePushButton("RIO_STDBYAI_UNCAGE", 30, 3547, 6155, "Standby ADI", "RIO Standby ADI Push to uncage")
definePotentiometer("RIO_STDBYAI_TRIM", 30, 3548, 6156, {0.0, 1.0}, "Standby ADI", "RIO Standby ADI Knob")
definePushButton("PLT_ACCEL_RESET", 24, 3488, 228, "Display", "Pilot Accelerometer Reset")

-- VDI & HUD Indicator Controls
defineToggleSwitch("PLT_HUD_FILTER", 40, 3228, 1033, "HUD", "Pilot HUD Filter")
definePotentiometer("PLT_HUD_TRIM", 42, 3229, 1034, {0.0, 1.0}, "HUD", "Pilot HUD TRIM")
definePotentiometer("PLT_VSDI_TRIM", 42, 3230, 1035, {0.0, 1.0}, "HUD", "Pilot VSDI Screen Trim")
definePotentiometer("PLT_VDI_CONTRAST", 42, 3231, 1038, {0.0, 1.0}, "HUD", "Pilot VDI Screen Contrast")
definePotentiometer("PLT_VSDI_BRIGHT", 42, 3232, 1036, {0.0, 1.0}, "HUD", "Pilot VSDI Screen Brightness")
definePotentiometer("PLT_HUD_BRIGHT", 40, 3233, 1037, {0.0, 1.0}, "HUD", "Pilot HUD Brightness")
--definePushButton("PLT_VDI_FILTER", 42, 3234, XXXXX, "HUD", "Pilot VDI Filter") missing arg

-- Under HUD / Master Arm / Gun/Weapons Panel
defineToggleSwitch("PLT_MASTER_ARM_COVER", 55, 3135, 1046, "Weapons Panel", "Pilot Master Arm Cover")
define3PosTumb("PLT_MASTER_ARM_SW", 55, 3136, 1047, "Weapons Panel", "Pilot Master Arm Switch")
defineToggleSwitch("PLT_ACM_COVER", 55, 3133, 1049, "Weapons Panel", "Pilot ACM Cover")

-- RIO TID

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
-- RIO RADAR Panel
-- RIO TCS Controls
-- RIO Armament Panel
-- Computer Address Panel (CAP)
-- Datalink
-- IFF Panel

-- LIQUID Cooling
define3PosTumb("RIO_LIQUD_COOL", 39, 3681, 95, "Radar Panel", "RIO Liquid Cooling Switch")

-- LANTIRN

-- Warning, Caution and IndicatorLights
defineIndicatorLight("PLT_JETT_LIGHT", 701, "Warning, Caution and IndicatorLights","Pilot Emergency Stores Jettison Light (red)")
defineIndicatorLight("PLT_AOA_SLOW", 3760, "Warning, Caution and IndicatorLights","Pilot AOA Slow (green)")
defineIndicatorLight("PLT_AOA_OPT", 3761, "Warning, Caution and IndicatorLights","Pilot AOA Optimum (yellow)")
defineIndicatorLight("PLT_AOA_FAST", 3762, "Warning, Caution and IndicatorLights","Pilot AOA Fast (red)")
defineIndicatorLight("PLT_TACAN_GO", 8050, "Warning, Caution and IndicatorLights","Pilot TACAN GO Light (green)")
defineIndicatorLight("PLT_TACAN_NOGO", 8051, "Warning, Caution and IndicatorLights","Pilot TACAN NOGO Light (red)")
defineIndicatorLight("PLT_HUD_LIGHT_WHEELS", 9350, "Warning, Caution and IndicatorLights","Pilot HUD Light Wheels (red)")
defineIndicatorLight("PLT_HUD_LIGHT_BRAKES", 9351, "Warning, Caution and IndicatorLights","Pilot HUD Light Brakes (red)")
defineIndicatorLight("PLT_HUD_LIGHT_ACLSAP", 9352, "Warning, Caution and IndicatorLights","Pilot HUD Light ACLS/AP (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_NWS", 9353, "Warning, Caution and IndicatorLights","Pilot HUD Light NWS Enga (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_AUTOTHR", 9354, "Warning, Caution and IndicatorLights","Pilot HUD Light Auto Throttle (yellow)")
defineIndicatorLight("PLT_HUD_LIGHT_RStall", 9355, "Warning, Caution and IndicatorLights","Pilot HUD Right Stall (red)")
defineIndicatorLight("PLT_HUD_LIGHT_LStall", 9356, "Warning, Caution and IndicatorLights","Pilot HUD Left Stall (red)")
defineIndicatorLight("PLT_HUD_LIGHT_SAM", 9357, "Warning, Caution and IndicatorLights","Pilot HUD SAM (red)")
defineIndicatorLight("PLT_HUD_LIGHT_AAA", 9358, "Warning, Caution and IndicatorLights","Pilot HUD AAA (red)")
defineIndicatorLight("PLT_HUD_LIGHT_AI", 9359, "Warning, Caution and IndicatorLights","Pilot HUD AI (red)")
defineIndicatorLight("PLT_GEAR_LIGHT", 15001, "Warning, Caution and IndicatorLights","Pilot Landing Gear Light (red)")
defineIndicatorLight("PLT_REFUELPROBE_LIGHT", 15002, "Warning, Caution and IndicatorLights","Pilot Refuel Probe Light (red)")
defineIndicatorLight("PLT_MASTERTEST_GO", 15010, "Warning, Caution and IndicatorLights","Pilot MASTER TEST GO Light (green)")
defineIndicatorLight("PLT_MASTERTEST_NOGO", 15011, "Warning, Caution and IndicatorLights","Pilot MASTER TEST NOGO Light (red)")
defineIndicatorLight("PLT_R_ENG_FIRE", 15014, "Warning, Caution and IndicatorLights","Pilot Right Engine Fire Light (red)")
defineIndicatorLight("PLT_L_ENG_FIRE", 15015, "Warning, Caution and IndicatorLights","Pilot Left Engine Fire Light (red)") 
defineIndicatorLight("PLT_WARN_LGEN", 15016, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Generator (yellow)")
defineIndicatorLight("PLT_WARN_LOILHOT", 15017, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_LFUELPRESS", 15018, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_ENGFIREEXT", 15019, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Engine Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_RGEN", 15020, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Generator (yellow)")
defineIndicatorLight("PLT_WARN_ROILHOT", 15021, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Oil Hot (yellow)")
defineIndicatorLight("PLT_WARN_RFUELPRESS", 15022, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Fuel Pressure (yellow)")
defineIndicatorLight("PLT_WARN_WINGSWEEP", 15023, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Wing Sweep (green)")
defineIndicatorLight("PLT_WARN_AUXFIREEXT", 15024, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Auxiliary Fire Extinguisher (green)")
defineIndicatorLight("PLT_WARN_YAWSTABOP", 15025, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Yaw Stabilizer Op (yellow)")
defineIndicatorLight("PLT_WARN_YAWSTABOUT", 15026, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Yaw Stabilizer Out (yellow)")
defineIndicatorLight("PLT_WARN_CANOPY", 15027, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Canopy (yellow)")
defineIndicatorLight("PLT_WARN_CADC", 15028, "Warning, Caution and IndicatorLights","Pilot Warning Lamp CADC (yellow)")
defineIndicatorLight("PLT_WARN_LFUELLOW", 15029, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_WSHIELDHOT", 15030, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Windshield Hot (green)")
defineIndicatorLight("PLT_WARN_EMERGJETT", 15031, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Emergency Jettison (yellow)")
defineIndicatorLight("PLT_WARN_OXYLOW", 15032, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Qxygen Low (yellow)")
defineIndicatorLight("PLT_WARN_BINGO", 15033, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Bingo Fuel (yellow)")
defineIndicatorLight("PLT_WARN_HYDPRESS", 15034, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Hydraulic Pressure (yellow)")
defineIndicatorLight("PLT_WARN_RFUELLOW", 15035, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Fuel Low (yellow)")
defineIndicatorLight("PLT_WARN_MACHTRIM", 15036, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Mach Trim (green)")
defineIndicatorLight("PLT_WARN_PITCHSTAB", 15037, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Pitch Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_BLEEDDUCT", 15038, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Bleed Duct (yellow)")
defineIndicatorLight("PLT_WARN_ROLLSTAB", 15039, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Roll Stabilizer (yellow)")
defineIndicatorLight("PLT_WARN_PITCHSTAB2", 15040, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Pitch Stabilizer 2 (yellow)")
defineIndicatorLight("PLT_WARN_AUTOPLT", 15041, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Autopilot (yellow)")
defineIndicatorLight("PLT_WARN_LOVSPVALVE", 15042, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_ROVSPVALVE", 15043, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Ovsp Valve (yellow)")
defineIndicatorLight("PLT_WARN_RRAMP", 15044, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LAUNCHBAR", 15045, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Launchbar (green)")
defineIndicatorLight("PLT_WARN_FLAP", 15046, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Flap (yellow)")
defineIndicatorLight("PLT_WARN_HZTAILAUTH", 15047, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Horizontal Tail Auth (yellow)")
defineIndicatorLight("PLT_WARN_OILPRESS", 15048, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Oil Pressure (yellow)")
defineIndicatorLight("PLT_WARN_LRAMP", 15049, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Ramp (yellow)")
defineIndicatorLight("PLT_WARN_LADDER", 15050, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Ladder (yellow)")
defineIndicatorLight("PLT_WARN_RINLET", 15051, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Inlet (yellow)")
defineIndicatorLight("PLT_WARN_INLETICE", 15052, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Inlet Ice (yellow)")
defineIndicatorLight("PLT_WARN_RUDDERAUTH", 15053, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Rudder Auth (yellow)")
defineIndicatorLight("PLT_WARN_LINLET", 15054, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Inlet (yellow)")
defineIndicatorLight("PLT_WARN_ANRS", 15055, "Warning, Caution and IndicatorLights","Pilot Warning Lamp ANRS (green)")
defineIndicatorLight("PLT_WARN_ROLLSTAB2", 15056, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Roll Stabilizer 2 (yellow)")	
defineIndicatorLight("PLT_WARN_SPOILERS", 15057, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Spoilers (yellow)")	
defineIndicatorLight("PLT_WARN_TRANSRECT", 15058, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Trans Rect (green)")
defineIndicatorLight("PLT_WARN_REDUCESPEED", 15059, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Reduce Speed (yellow)")
defineIndicatorLight("PLT_WARN_INTERTRIM", 15060, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Inter Trim (green)")
defineIndicatorLight("PLT_WARN_LENGSEC", 15061, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Left Engine Secondary (yellow)")
defineIndicatorLight("PLT_WARN_RATS", 15062, "Warning, Caution and IndicatorLights","Pilot Warning Lamp RATS (green)")
defineIndicatorLight("PLT_WARN_STARTVALVE", 15063, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Start Valve (yellow)")
defineIndicatorLight("PLT_WARN_RENGSEC", 15064, "Warning, Caution and IndicatorLights","Pilot Warning Lamp Right Engine Secondary (yellow)")
defineIndicatorLight("PLT_HOOK_LIGHT", 15090, "Warning, Caution and IndicatorLights","Pilot Hook Light (red)")
defineIndicatorLight("PLT_RADAR_ALT_LIGHT", 19107, "Warning, Caution and IndicatorLights","Pilot Radar Altimeter Warning Light (red)")
defineIndicatorLight("PLT_RADAR_ALT_TEST_LIGHT", 19108, "Warning, Caution and IndicatorLights","Pilot Radar Altimeter Test Light (red)")

defineIndicatorLight("RIO_TID_SCREEN_LIGHT", 3450, "Warning, Caution and IndicatorLights","RIO TID Screen Light (light green)")
defineIndicatorLight("RIO_IFF_TEST_LIGHT", 8052, "Warning, Caution and IndicatorLights","RIO IFF Test Light (green)")
defineIndicatorLight("RIO_IFF_REPLY_LIGHT", 8053, "Warning, Caution and IndicatorLights","RIO IFF Reply Light (green)")
defineIndicatorLight("RIO_TACAN_GO", 8893, "Warning, Caution and IndicatorLights","RIO TACAN GO Light (green)")
defineIndicatorLight("RIO_TACAN_NOGO", 8892, "Warning, Caution and IndicatorLights","RIO TACAN NOGO Light (red)")

-- Gauges 
defineFloat("PLT_AHRS_LAT_DIAL", 6500, {0, 1}, "Gauges", "Pilot Compass LAT Correction Dial")  --(COMP Panel)
defineFloat("PLT_ACM_TURN_IND", 6501, {-1, 1}, "Gauges", "Pilot ACM Turn Indicator")
defineFloat("PLT_ACM_SLIP_BALL", 6500, {-1, 1}, "Gauges", "Pilot ACM Slip Ball")
defineFloat("PLT_STDBYAI_OFF_FLAG", 19100, {0, 1}, "Gauges", "Pilot Standby ADI Off Flag")
defineFloat("RIO_STDBYAI_OFF_FLAG", 19900, {0, 1}, "Gauges", "RIO Standby ADI Off Flag")
defineFloat("RIO_STDBYAI_PITCH", 3333, {-1, 1}, "Gauges", "RIO Standby ADI Pitch")
defineFloat("RIO_STDBYAI_ROLL", 19901, {-1, 1}, "Gauges", "RIO Standby ADI Roll")

BIOS.protocol.endModule()