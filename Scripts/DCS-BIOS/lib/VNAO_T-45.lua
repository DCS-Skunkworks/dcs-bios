BIOS.protocol.beginModule("VNAO_T-45", 0x9000)
BIOS.protocol.setExportModuleAircrafts({"T-45"})
--by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local define3PosTumb = BIOS.util.define3PosTumb
local defineTumb = BIOS.util.defineTumb
local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineRotary = BIOS.util.defineRotary
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-------- FRONT/SHARED Pit ------

defineTumb("FLAPS_LVR", 19, 3013, 7, 0.5, {0, 1}, nil, false, "General", "Flaps Lever, UP/ 1/2 /DOWN")
defineToggleSwitch("EMERG_FLAP_SW", 19, 3027, 184, "General", "EMER FLAPS Switch, NORM/DOWN")
defineToggleSwitch("PARK_BRAKE", 19, 3038, 117, "General", "Parking Brake Handle, OUT/IN")
definePushButton("HYD2_RESET_BTN", 19, 3025, 66, "General", "HYD 2 Reset Button")
defineToggleSwitch("PARK_BRAKE", 19, 3026, 180, "General", "Pitot Heat Switch, HEAT/OFF")
defineRotary("ALT_SET_KNB", 8, 3557, 165, "General", "Altimeter Setting Knob")
defineToggleSwitch("CANOPY_HANDLE", 19, 3042, 116, "General", "Canopy Handle, OPEN/CLOSE")
definePushButton("MASTER_ALERT_BTN", 19, 3040, 143, "General", "Master Alert Button")
--define3PosTumb("CONTR_AUG_SW", xx, 30xx, 92, "Electric System", "Control Aug Switch, ALL/SBI/RESET")
defineRotary("RUDDER_TRIM_KNB", 19, 3557, 165, "General", "Rudder Trim Knob")
defineToggleSwitch("SEAT_ARM", 19, 3061, 265, "General", "Seat Arming Handle, SAFE/ARMED")
definePushButton("EJECT_HANDLE", 19, 3063, 264, "General", "Ejection Handle - Pull To Eject")

-- Electric system
defineToggleSwitch("BATTERY1_SW", 19, 3020, 300, "Electric System", "Battery 1 Switch, ON/OFF")
defineToggleSwitch("BATTERY2_SW", 19, 3021, 301, "Electric System", "Battery 2 Switch, ON/OFF")
define3PosTumb("GEN_SW", 19, 3022, 303, "Electric System", "Generator Switch, ON/OFF/RESET")

-- Engine
defineToggleSwitch("FINGER_LIFT", 19, 3024, 0, "Engine", "Finger Lift")
define3PosTumb("ENG_SW", 19, 3019, 11, "Engine", "Engine Switch, OFF/ON/START")
definePushButton("GAS_TURB_START_BTN", 19, 3023, 35, "Engine", "Gas Turbine Starter Button")

-- Gear System
defineToggleSwitch("GEAR_LVR", 19, 3016, 6, "Gear System", "Landing Gear Lever, UP/DOWN")
defineToggleSwitch("HOOK_LVR", 19, 3011, 8, "Gear System", "Tail Hook Lever, UP/DOWN")
defineToggleSwitch("ANTI_SKID_SW", 19, 3017, 10, "Gear System", "Anti-Skid Switch, OFF/ON")
defineToggleSwitch("EMERG_GEAR_LVR", 19, 3018, 183, "Gear System", "Landing Gear Emergency Release Handle")
defineToggleSwitch("LAUNCH_BAR_SW", 19, 3015, 67, "Gear System", "Launch Bar Switch, UP/DOWN")

defineIndicatorLight("DOOR_L", 120, "Gear System Lights", "DOOR Light (yellow)")
defineIndicatorLight("GEAR_NOSE_L", 121, "Gear System Lights", "GEAR NOSE Light (green)")
defineIndicatorLight("GEAR_LEFT_L", 122, "Gear System Lights", "GEAR LEFT Light (green)")
defineIndicatorLight("GEAR_RIGHT_L", 123, "Gear System Lights","GEAR RIGHT Light (green)")
defineIndicatorLight("GEAR_LVR_L", 411, "Gear System Lights","GEAR Lever Light (red)")

-- Weapon System
definePushButton("EMERG_JETT_BTN", 5, 3501, 182, "Weapon System", "Emergency Jettison Button")
defineToggleSwitch("MASTER_ARM", 5, 3502, 114, "Weapon System", "Master Arm, ARM/SAFE")

-- External Lighting
define3PosTumb("ANTI_COL_STROBE_L_SW", 19, 3028, 402, "External Lighting", "Anti-Collision/Strobe Lights, BOTH/OFF/A-COLL")
define3PosTumb("TAIL_L_SW", 19, 3029, 404, "External Lighting", "Tail Lights, BRIGHT/OFF/DIM")
define3PosTumb("WING_L_SW", 19, 3030, 405, "External Lighting", "Wing Lights, BRIGHT/OFF/DIM")
define3PosTumb("FORMATION_L_SW", 19, 3031, 406, "External Lighting", "Formation Lights, BRIGHT/OFF/DIM")
defineToggleSwitch("LAND_TAXI_L_SW", 19, 3032, 401, "External Lighting", "Landing/Taxi Light, ON/OFF")
defineToggleSwitch("NAV_L_SW", 19, 3033, 403, "External Lighting", "Nav Lights, FLASH/STEADY")
defineToggleSwitch("EXT_L_MASTER_SW", 19, 3037, 400, "External Lighting", "Exterior Lights Master Switch")

-- Internal Lighting
definePotentiometer("FLOOD_L_KNB", 19, 3034, 452, {0, 1}, "Internal Lighting", "Flood Lights Knob")
definePotentiometer("CONSOLE_L_KNB", 19, 3035, 451, {0, 1}, "Internal Lighting", "Console Lights Knob")
definePotentiometer("MIP_L_KNB", 19, 3036, 450, {0, 1}, "Internal Lighting", "MIP Lights Knob")

defineIndicatorLight("INSTRUMENTS_BL", 408, "Internal Lights","Instruments Backlight (white)")
defineIndicatorLight("CONSOLE_BL", 409, "Internal Lights","Console Backlight (white)")
defineIndicatorLight("FLOOD_BL", 410, "Internal Lights","Flood Backlight (white)")

-- HUD
defineToggleSwitch("HUD_PW_SW", 11, 3533, 219, "HUD", "HUD Power Knob, ON/OFF")
definePotentiometer("HUD_BRIGHT_KNB", 11, 3534, 221, {0, 1}, "HUD", "HUD Brightness Knob")

defineIndicatorLight("AOA_SLOW_L", 320, "HUD Lights","AOA Light Slow (green)")
defineIndicatorLight("AOA_OPT_L", 321, "HUD Lights","AOA Light Optimum (yellow)")
defineIndicatorLight("AOA_FAST_L", 322, "HUD Lights","AOA Light Fast (red)")
defineIndicatorLight("WHEELS_L", 138, "HUD Lights","WHEELS Light (red)")

-- Data Entry Panel (DEP)
definePushButton("DEP_0_BTN", 15, 3537, 200, "DEP", "DEP 0 Button")
definePushButton("DEP_1_BTN", 15, 3538, 201, "DEP", "DEP 1 Button")
definePushButton("DEP_2_BTN", 15, 3539, 202, "DEP", "DEP 2 Button")
definePushButton("DEP_3_BTN", 15, 3540, 203, "DEP", "DEP 3 Button")
definePushButton("DEP_4_BTN", 15, 3541, 204, "DEP", "DEP 4 Button")
definePushButton("DEP_5_BTN", 15, 3542, 205, "DEP", "DEP 5 Button")
definePushButton("DEP_6_BTN", 15, 3543, 206, "DEP", "DEP 6 Button")
definePushButton("DEP_7_BTN", 15, 3544, 207, "DEP", "DEP 7 Button")
definePushButton("DEP_8_BTN", 15, 3545, 208, "DEP", "DEP 8 Button")
definePushButton("DEP_9_BTN", 15, 3546, 209, "DEP", "DEP 9 Button")
definePushButton("DEP_ENT_BTN", 15, 3547, 211, "DEP", "DEP Enter Button")
definePushButton("DEP_CLR_BTN", 15, 3548, 212, "DEP", "DEP Clear Button")
definePushButton("DEP_DECLUTT_BTN", 15, 3549, 210, "DEP", "DEP Declutter Button")
definePushButton("DEP_LOW_ALT_WARN_BTN", 15, 3550, 214, "DEP", "DEP Low Altitude Warning Set Button")
definePushButton("DEP_CRS_SET_BTN", 15, 3551, 215, "DEP", "DEP Course Set Button")
definePushButton("DEP_HDG_SET_BTN", 15, 3552, 216, "DEP", "DEP Heading Set Button")
definePushButton("DEP_BINGO_SET_BTN", 15, 3553, 217, "DEP", "DEP Bingo Set Button")
definePushButton("DEP_MASTER_MODE_BTN", 15, 3554, 218, "DEP", "DEP Master Mode Button")
definePushButton("DEP_MIL_DEP_INC_BTN", 15, 3555, 223, "DEP", "DEP Mil Depression Increase Button")
definePushButton("DEP_MIL_DEP_DEC_BTN", 15, 3556, 224, "DEP", "DEP Mil Depression Decrease Button")

-- MFD Left ----
definePushButton("MFD_L_ON_DAY", 12, 3501, 424, "MFD Left", "Left MFD On Day")
definePushButton("MFD_L_ON_NGT", 12, 3502, 425, "MFD Left", "Left MFD On Night")
definePushButton("MFD_L_OFF", 12, 3503, 426, "MFD Left", "Left MFD Off")
definePushButton("MFD_L_BRIGHT_INC", 12, 3504, 422, "MFD Left", "Left MFD Brightness Increase")
definePushButton("MFD_L_BRIGHT_DEC", 12, 3505, 423, "MFD Left", "Left MFD Brightness Decrease")
definePushButton("MFD_L_BTN_20", 12, 3525, 34, "MFD Left", "Left MFD Push Button 20")
definePushButton("MFD_L_BTN_19", 12, 3524, 33, "MFD Left", "Left MFD Push Button 19")
definePushButton("MFD_L_BTN_18", 12, 3523, 32, "MFD Left", "Left MFD Push Button 18")
definePushButton("MFD_L_BTN_17", 12, 3522, 31, "MFD Left", "Left MFD Push Button 17")
definePushButton("MFD_L_BTN_16", 12, 3521, 30, "MFD Left", "Left MFD Push Button 16")
definePushButton("MFD_L_BTN_15", 12, 3520, 29, "MFD Left", "Left MFD Push Button 15")
definePushButton("MFD_L_BTN_14", 12, 3519, 28, "MFD Left", "Left MFD Push Button 14")
definePushButton("MFD_L_BTN_13", 12, 3518, 27, "MFD Left", "Left MFD Push Button 13")
definePushButton("MFD_L_BTN_12", 12, 3517, 26, "MFD Left", "Left MFD Push Button 12")
definePushButton("MFD_L_BTN_11", 12, 3516, 25, "MFD Left", "Left MFD Push Button 11")
definePushButton("MFD_L_BTN_10", 12, 3515, 24, "MFD Left", "Left MFD Push Button 10")
definePushButton("MFD_L_BTN_9", 12, 3514, 23, "MFD Left", "Left MFD Push Button 9")
definePushButton("MFD_L_BTN_8", 12, 3513, 22, "MFD Left", "Left MFD Push Button 8")
definePushButton("MFD_L_BTN_7", 12, 3512, 21, "MFD Left", "Left MFD Push Button 7")
definePushButton("MFD_L_BTN_6", 12, 3511, 20, "MFD Left", "Left MFD Push Button 6")
definePushButton("MFD_L_BTN_5", 12, 3510, 19, "MFD Left", "Left MFD Push Button 5")
definePushButton("MFD_L_BTN_4", 12, 3509, 18, "MFD Left", "Left MFD Push Button 4")
definePushButton("MFD_L_BTN_3", 12, 3508, 17, "MFD Left", "Left MFD Push Button 3")
definePushButton("MFD_L_BTN_2", 12, 3507, 16, "MFD Left", "Left MFD Push Button 2")
definePushButton("MFD_L_BTN_1", 12, 3506, 15, "MFD Left", "Left MFD Push Button 1")

-- MFD Right ----
definePushButton("MFD_R_ON_DAY", 12, 3501, 434, "MFD Right", "Right MFD On Day")
definePushButton("MFD_R_ON_NGT", 12, 3502, 435, "MFD Right", "Right MFD On Night")
definePushButton("MFD_R_OFF", 12, 3503, 436, "MFD Right", "Right MFD Off")
definePushButton("MFD_R_BRIGHT_INC", 12, 3504, 432, "MFD Right", "Right MFD Brightness Increase")
definePushButton("MFD_R_BRIGHT_DEC", 12, 3505, 433, "MFD Right", "Right MFD Brightness Decrease")
definePushButton("MFD_R_BTN_20", 12, 3525, 59, "MFD Right", "Right MFD Push Button 20")
definePushButton("MFD_R_BTN_19", 12, 3524, 58, "MFD Right", "Right MFD Push Button 19")
definePushButton("MFD_R_BTN_18", 12, 3523, 57, "MFD Right", "Right MFD Push Button 18")
definePushButton("MFD_R_BTN_17", 12, 3522, 56, "MFD Right", "Right MFD Push Button 17")
definePushButton("MFD_R_BTN_16", 12, 3521, 55, "MFD Right", "Right MFD Push Button 16")
definePushButton("MFD_R_BTN_15", 12, 3520, 54, "MFD Right", "Right MFD Push Button 15")
definePushButton("MFD_R_BTN_14", 12, 3519, 53, "MFD Right", "Right MFD Push Button 14")
definePushButton("MFD_R_BTN_13", 12, 3518, 52, "MFD Right", "Right MFD Push Button 13")
definePushButton("MFD_R_BTN_12", 12, 3517, 51, "MFD Right", "Right MFD Push Button 12")
definePushButton("MFD_R_BTN_11", 12, 3516, 50, "MFD Right", "Right MFD Push Button 11")
definePushButton("MFD_R_BTN_10", 12, 3515, 49, "MFD Right", "Right MFD Push Button 10")
definePushButton("MFD_R_BTN_9", 12, 3514, 48, "MFD Right", "Right MFD Push Button 9")
definePushButton("MFD_R_BTN_8", 12, 3513, 47, "MFD Right", "Right MFD Push Button 8")
definePushButton("MFD_R_BTN_7", 12, 3512, 46, "MFD Right", "Right MFD Push Button 7")
definePushButton("MFD_R_BTN_6", 12, 3511, 45, "MFD Right", "Right MFD Push Button 6")
definePushButton("MFD_R_BTN_5", 12, 3510, 44, "MFD Right", "Right MFD Push Button 5")
definePushButton("MFD_R_BTN_4", 12, 3509, 43, "MFD Right", "Right MFD Push Button 4")
definePushButton("MFD_R_BTN_3", 12, 3508, 42, "MFD Right", "Right MFD Push Button 3")
definePushButton("MFD_R_BTN_2", 12, 3507, 41, "MFD Right", "Right MFD Push Button 2")
definePushButton("MFD_R_BTN_1", 12, 3506, 40, "MFD Right", "Right MFD Push Button 1")

-- COMM control panel
defineToggleSwitch("MIC_SW", 3, 3530, 196, "COMM Control Panel", "MIC Switch, HOT/COLD")
defineToggleSwitch("COMM1_SW", 3, 3532, 191, "COMM Control Panel", "COMM 1 Switch")
defineToggleSwitch("COMM2_SW", 3, 3533, 192, "COMM Control Panel", "COMM 2 Switch")
definePotentiometer("INTERCOM_VOL", 3, 3531, 198, {0, 1}, "COMM Control Panel", "Intercom Volume")
define3PosTumb("MIC_BTN", 3, 3534, 294, "COMM Control Panel", "Microphone Button, COMM 1/COMM 2")

--- V/UHF control panel 1
define3PosTumb("COMM_1_FREQ_10", 3, 3514, 250, "V/UHF 1", "COMM 1 Frequency Tens")
define3PosTumb("COMM_1_FREQ_1", 3, 3515, 251, "V/UHF 1", "COMM 1 Frequency Ones")
define3PosTumb("COMM_1_FREQ_010", 3, 3516, 252, "V/UHF 1", "COMM 1 Frequency Tenths")
define3PosTumb("COMM_1_FREQ_100", 3, 3517, 253, "V/UHF 1", "COMM 1 Frequency Hundredths")
defineToggleSwitch("COMM_1_AMFM", 3, 3518, 254, "V/UHF 1", "COMM 1 AM/FM Mode Switch, AM/FM")
definePotentiometer("COMM_1_VOL", 3, 3519, 246, {0, 1}, "V/UHF 1", "COMM 1 Volume")
define3PosTumb("COMM_1_MODE", 3, 3520, 256, "V/UHF 1", "COMM 1 Mode Control Selector, OFF/T+R/T+R&G")
definePotentiometer("COMM_1_BRIGHT", 3, 3521, 255, {0, 1}, "V/UHF 1", "COMM 1 Brightness")

defineIndicatorLight("COMM_1_FWD_L", 260, "V/UHF 1 Lights","COMM 1 FWD Light (green)")
defineIndicatorLight("COMM_1_AFT_L", 261, "V/UHF 1 Lights","COMM 1 AFT Light (green)")

--- V/UHF control panel 2
define3PosTumb("COMM_2_FREQ_10", 4, 3522, 274, "V/UHF 2", "COMM 2 Frequency Tens")
define3PosTumb("COMM_2_FREQ_1", 4, 3523, 275, "V/UHF 2", "COMM 2 Frequency Ones")
define3PosTumb("COMM_2_FREQ_010", 4, 3524, 276, "V/UHF 2", "COMM 2 Frequency Tenths")
define3PosTumb("COMM_2_FREQ_100", 4, 3525, 277, "V/UHF 2", "COMM 2 Frequency Hundredths")
defineToggleSwitch("COMM_2_AMFM", 4, 3526, 278, "V/UHF 2", "COMM 2 AM/FM Mode Switch, AM/FM")
definePotentiometer("COMM_2_VOL", 4, 3527, 270, {0, 1}, "V/UHF 2", "COMM 2 Volume")
define3PosTumb("COMM_2_MODE", 4, 3528, 280, "V/UHF 2", "COMM 2 Mode Control Selector, OFF/T+R/T+R&G")
definePotentiometer("COMM_2_BRIGHT", 4, 3529, 279, {0, 1}, "V/UHF 2", "COMM 2 Brightness")

defineIndicatorLight("COMM_2_FWD_L", 262, "V/UHF 2 Lights","COMM 2 FWD Light (green)")
defineIndicatorLight("COMM_2_AFT_L", 263, "V/UHF 2 Lights","COMM 2 AFT Light (green)")

-- VOR ILS
defineMultipositionSwitch("VOR_ILS_FREQ_1", 17, 3511, 230, 10, 0.1, "VOR ILS", "VOR/ILS 1MHz Frequency Knob")
defineMultipositionSwitch("VOR_ILS_FREQ_50", 17, 3512, 232, 20, 0.05, "VOR ILS", "VOR/ILS 50KHz Frequency Knob")
defineMultipositionSwitch("VOR_ILS_PW", 17, 3513, 231, 3, 0.5, "VOR ILS", "VOR/ILS Power Knob")

-- TACAN
defineToggleSwitch("TACAN_PW", 16, 3509, 241, "TACAN", "TACAN Power Switch, ON/OFF")
defineMultipositionSwitch("TACAN_CHAN_1", 16, 3507, 245, 10, 0.1, "TACAN", "TACAN Channel Selector Ones")
defineMultipositionSwitch("TACAN_CHAN_10", 16, 3508, 242, 20, 0.05, "TACAN", "TACAN Channel Selector Ones")

-------- REAR Pit ------
-- Misc Systems REAR
define3PosTumb("REAR_ENG_SW", 19, 3049, 11, "Rear Misc", "REAR Engine Switch, OFF/ON/START")
defineTumb("REAR_FLAPS_LVR", 19, 3044, 7, 0.5, {0, 1}, nil, false, "Rear Misc", "REAR Flaps Lever, UP/ 1/2 /DOWN")

-- Electric system REAR
defineToggleSwitch("REAR_BATTERY1_SW", 19, 3050, 300, "Rear Electric System", "REAR Battery 1 Switch, ON/OFF")
defineToggleSwitch("REAR_BATTERY2_SW", 19, 3051, 301, "Rear Electric System", "REAR Battery 2 Switch, ON/OFF")
define3PosTumb("REAR_GEN_SW", 19, 3052, 303, "Rear Electric System", "REAR Generator Switch, ON/OFF/RESET")

-- Internal Lighting REAR
definePotentiometer("REAR_FLOOD_L_KNB", 19, 3053, 455, {0, 1}, "Rear Internal Lighting", "REAR Flood Lights Knob")
definePotentiometer("REAR_CONSOLE_L_KNB", 19, 3054, 454, {0, 1}, "Rear Internal Lighting", "REAR Console Lights Knob")
definePotentiometer("REAR_MIP_L_KNB", 19, 3055, 453, {0, 1}, "Rear Internal Lighting", "REAR MIP Lights Knob")

-- Gear System REAR
defineToggleSwitch("REAR_GEAR_LVR", 19, 3046, 6, "Rear Gear System", "REAR Landing Gear Lever, UP/DOWN")
defineToggleSwitch("REAR_HOOK_LVR", 19, 3043, 8, "Rear Gear System", "REAR Tail Hook Lever, UP/DOWN")
defineToggleSwitch("REAR_ANTI_SKID_SW", 19, 3047, 10, "Rear Gear System", "REAR Anti-Skid Switch, OFF/ON")
defineToggleSwitch("REAR_EMERG_GEAR_LVR", 19, 3048, 183, "Rear Gear System", "REAR Landing Gear Emergency Release Handle")
defineToggleSwitch("REAR_LAUNCH_BAR_SW", 19, 3045, 67, "Rear Gear System", "REAR Launch Bar Switch, UP/DOWN")

-------- Lights, Gauges ------

--Warning, Caution and IndicatorLights
defineIndicatorLight("SEAT_L", 71, "Warning, Caution and IndicatorLights","SEAT Light (yellow)")
defineIndicatorLight("CANOPY_L", 72, "Warning, Caution and IndicatorLights","CANOPY Light (yellow)")
defineIndicatorLight("HYD_L", 74, "Warning, Caution and IndicatorLights","HYD Light (yellow)")
defineIndicatorLight("NSW_AUG_L", 75, "Warning, Caution and IndicatorLights","NWS AUG Light (yellow)")
defineIndicatorLight("ACCEL_L", 77, "Warning, Caution and IndicatorLights","ACCEL Light (yellow)")
defineIndicatorLight("FUEL_L", 78, "Warning, Caution and IndicatorLights","FUEL Light (yellow)")
defineIndicatorLight("RAT_L", 80, "Warning, Caution and IndicatorLights","RAT Light (yellow)")
defineIndicatorLight("TP_HOT_L", 81, "Warning, Caution and IndicatorLights","TP HOT Light (yellow)")
defineIndicatorLight("LP_PMP_L", 83, "Warning, Caution and IndicatorLights","LP PMP Light (yellow)")
defineIndicatorLight("F_PRES_L", 84, "Warning, Caution and IndicatorLights","F PRES Light (yellow)")
defineIndicatorLight("PK_BRK_L", 86, "Warning, Caution and IndicatorLights","PK BRK Light (yellow)")
defineIndicatorLight("C_AUG_L", 87, "Warning, Caution and IndicatorLights","C AUG Light (yellow)")
defineIndicatorLight("ECA_2_L", 89, "Warning, Caution and IndicatorLights","ECA 2 Light (yellow)")
defineIndicatorLight("AV_HOT_L", 90, "Warning, Caution and IndicatorLights","AV HOT Light (yellow)")
defineIndicatorLight("SLATS_L", 92, "Warning, Caution and IndicatorLights","SLATS Light (yellow)")
defineIndicatorLight("AC_INV_L", 93, "Warning, Caution and IndicatorLights","AC INV Light (yellow)")
defineIndicatorLight("NWS_L", 95, "Warning, Caution and IndicatorLights","NWS Light (yellow)")
defineIndicatorLight("SKID_Y_L", 96, "Warning, Caution and IndicatorLights","SKID Light (yellow)")
defineIndicatorLight("GTS_L", 98, "Warning, Caution and IndicatorLights","GTS Light (green)")
defineIndicatorLight("READY_L", 99, "Warning, Caution and IndicatorLights","READY Light (green)")
defineIndicatorLight("NWS_HI_L", 101, "Warning, Caution and IndicatorLights","NWS HI Light (green)")
defineIndicatorLight("SKID_G_L", 102, "Warning, Caution and IndicatorLights","SKID Light (green)")
defineIndicatorLight("ECA_L", 104, "Warning, Caution and IndicatorLights","ECA Light (green)")
defineIndicatorLight("M_FUEL_L", 105, "Warning, Caution and IndicatorLights","M FUEL Light (green)")
defineIndicatorLight("BAR_1_L", 107, "Warning, Caution and IndicatorLights","BAR 1 Light (green)")
defineIndicatorLight("BAR_2_L", 108, "Warning, Caution and IndicatorLights","BAR 2 Light (green)")
defineIndicatorLight("BRK_PRS_L", 110, "Warning, Caution and IndicatorLights","BRK PRS Light (yellow)")
defineIndicatorLight("HOOK_L", 111, "Warning, Caution and IndicatorLights","HOOK Light (red)")
defineIndicatorLight("FLAPS_HALF_L", 127, "Warning, Caution and IndicatorLights","FLAPS HALF Light (green)")
defineIndicatorLight("FLAPS_FULL_L", 128, "Warning, Caution and IndicatorLights","FLAPS FULL Light (green)")
defineIndicatorLight("L_BAR_R_L", 130, "Warning, Caution and IndicatorLights","L BAR Light (red)")
defineIndicatorLight("L_BAR_G_L", 131, "Warning, Caution and IndicatorLights","L BAR Light (green)")
defineIndicatorLight("I_L", 134, "Warning, Caution and IndicatorLights","I Light (red)")
defineIndicatorLight("M_R_L", 135, "Warning, Caution and IndicatorLights","M Light (red)")
defineIndicatorLight("O_L", 136, "Warning, Caution and IndicatorLights","O Light (green)")
defineIndicatorLight("SP_BRK_L", 140, "Warning, Caution and IndicatorLights","SP BRK Light (green)")
defineIndicatorLight("FULL_L", 141, "Warning, Caution and IndicatorLights","FULL Light (green)")
defineIndicatorLight("MASTER_ALERT_L", 135, "Warning, Caution and IndicatorLights","MASTER ALERT Light (yellow)")
defineIndicatorLight("GTS_FIRE_WL", 146, "Warning, Caution and IndicatorLights","GTS FIRE Warning Light (red)")
defineIndicatorLight("EGT_RPM_WL", 147, "Warning, Caution and IndicatorLights","EGT RPM Warning Light (red)")
defineIndicatorLight("OIL_PRESS_WL", 148, "Warning, Caution and IndicatorLights","OLI PRESS Warning Light (red)")
defineIndicatorLight("HYD_FAIL_WL", 149, "Warning, Caution and IndicatorLights","HYD FAIL Warning Light (red)")
defineIndicatorLight("BARS1_WL", 150, "Warning, Caution and IndicatorLights","Bars 1 Warning Light (red)")
defineIndicatorLight("CABIN_ALT_WL", 151, "Warning, Caution and IndicatorLights","CABIN ALT Warning Light (red)")
defineIndicatorLight("OXYGEN_WL", 152, "Warning, Caution and IndicatorLights","OXYGEN Warning Light (red)")
defineIndicatorLight("GENERATOR_WL", 154, "Warning, Caution and IndicatorLights","GENERATOR Warning Light (red)")
defineIndicatorLight("BARS2_WL", 155, "Warning, Caution and IndicatorLights","Bars 2 Warning Light (red)")
defineIndicatorLight("BARS3_WL", 156, "Warning, Caution and IndicatorLights","Bars 3 Warning Light (red)")
defineIndicatorLight("FIRE_WL", 157, "Warning, Caution and IndicatorLights","FIRE Warning Light (red)")

--Gauges
defineFloat("CANOPY_VALUE", 1, {0, 1}, "Gauges", "Canopy Position")
defineFloat("ADI_SLIP", 161, {-0.1, 0.1}, "Gauges", "ADI Slip")
defineFloat("AOA_GAUGE", 161, {0, 1}, "Gauges", "AoA Gauge")
defineFloat("EGT_G", 178, {0, 1}, "Gauges", "EGT Gauge")
defineFloat("CLOCK_H_G", 185, {0, 1}, "Gauges", "Clock Hours Gauge")
defineFloat("CLOCK_M_G", 186, {0, 1}, "Gauges", "Clock Minutes Gauge")
defineFloat("CLOCK_S_G", 187, {0, 1}, "Gauges", "Clock Seconds Gauge")
defineFloat("SADI_PITCH_G", 169, {1, -1}, "Gauges", "SADI Pitch Gauge")
defineFloat("SADI_ROLL_G", 170, {1, -1}, "Gauges", "SADI Roll Gauge")
defineFloat("VERT_VELOCITY_G", 162, {-1, 1}, "Gauges", "Vertical Velocity Gauge")
defineFloat("AIRSPEED_G", 162, {0, 1}, "Gauges", "Airspeed Gauge")
defineFloat("ALT_NEEDLE_G", 164, {0, 1}, "Gauges", "Altimeter Needle Gauge")
defineFloat("ALT_10K_G", 314, {0, 1}, "Gauges", "Altimeter 10K Gauge")
defineFloat("ALT_1K_G", 315, {0, 1}, "Gauges", "Altimeter 1K Gauge")
defineFloat("ALT_100_G", 316, {0, 1}, "Gauges", "Altimeter 100 Gauge")
defineFloat("ALT_10_G", 317, {0, 1}, "Gauges", "Altimeter 10 Gauge")
defineFloat("ALT_1_G", 318, {0, 1}, "Gauges", "Altimeter 1 Gauge")
defineFloat("ALT_BARO10_G", 324, {0, 1}, "Gauges", "Altimeter Barometric 10 Gauge")
defineFloat("ALT_BARO1_G", 325, {0, 1}, "Gauges", "Altimeter Barometric 1 Gauge")
defineFloat("ALT_BARO010_G", 326, {0, 1}, "Gauges", "Altimeter Barometric 0.10 Gauge")
defineFloat("ALT_BARO0100_G", 327, {0, 1}, "Gauges", "Altimeter Barometric 0.100 Gauge")
defineFloat("FUEL_FLOW_G", 173, {0, 1}, "Gauges", "Fuel Flow Needle Gauge")
defineFloat("FUEL_TOTAL_G", 174, {0, 1}, "Gauges", "Total Fuel Needle Gauge")
defineFloat("RPM_G", 175, {0, 1}, "Gauges", "RPM Needle Gauge")
defineFloat("RPM_S_G", 176, {0, 1}, "Gauges", "RPM Needle Small Gauge")
defineFloat("TACAN_1_G", 332, {0, 1}, "Gauges", "TACAN Dial 1 Gauge")
defineFloat("TACAN_10_G", 331, {0, 1}, "Gauges", "TACAN Dial 10 Gauge")
defineFloat("TACAN_100_G", 330, {0, 1}, "Gauges", "TACAN Dial 100 Gauge")
defineFloat("VOR_NXX_G", 334, {0, 1}, "Gauges", "VOR Dial Whole Xxx Gauge")
defineFloat("VOR_XNX_G", 335, {0, 1}, "Gauges", "VOR Dial Whole xXx Gauge")
defineFloat("VOR_XXN_G", 336, {0, 1}, "Gauges", "VOR Dial Whole xxX Gauge")
defineFloat("VOR_DEC_NX_G", 337, {0, 1}, "Gauges", "VOR Dial Decimal Xx Gauge")
defineFloat("VOR_DEC_XN_G", 338, {0, 1}, "Gauges", "VOR Dial Decimal xX Gauge")
defineFloat("INT_PTT_G", 295, {0, 1}, "Gauges", "Intercom PTT Gauge")
defineFloat("MAG_COMP_G", 118, {1, 0}, "Gauges", "Magnetic Compasss Gauge")

defineIntegerFromGetter("EXT_HOOK", function()
	return math.floor(LoGetAircraftDrawArgumentValue(25)*65535)
end, 65535, "External Aircraft Model", "Hook")
defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")
defineIntegerFromGetter("EXT_STROBE", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Lights (red)")
defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (green,red)")
defineIntegerFromGetter("EXT_NAV_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Navigation Lights (yellow)")
defineIntegerFromGetter("EXT_TAXI_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(189) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Taxi Light (white)")
defineIntegerFromGetter("EXT_SPEED_BRAKES", function()
	return math.floor(LoGetAircraftDrawArgumentValue(500)*65535)
end, 65535, "External Aircraft Model", "Speed Brakes")
defineIntegerFromGetter("EXT_FAN", function()
	if LoGetAircraftDrawArgumentValue(60) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Fan")
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

BIOS.protocol.endModule()