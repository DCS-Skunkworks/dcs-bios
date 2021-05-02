BIOS.protocol.beginModule("A-29B", 0x8800)
BIOS.protocol.setExportModuleAircrafts({"A-29B"})
--v 1.1 by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local define3PosTumb = BIOS.util.define3PosTumb
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineRotary = BIOS.util.defineRotary
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- ELECTRICAL
define3PosTumb("BATTERY_SW", 1, 3178, 961, "Electric System", "Battery (Reset/On/Off)")
defineToggleSwitch("GENERATOR_SW", 1, 3179, 962, "Electric System", "Generator (On/Off-Reset)")
defineToggleSwitch("EXT_PW_SW", 1, 3181, 963, "Electric System", "External Power (ON/Off)")
defineToggleSwitch("BACKUP_SW", 1, 3182, 964, "Electric System", "Backup (Auto/Off)")
define3PosTumb("EMERG_OVER_SW", 1, 3183, 965, "Electric System", "Emergency Override (Emergency/Auto/Auto)")
define3PosTumb("AIR_INTERCON_SW", 1, 3184, 966, "Electric System", "Aircraft Interconnect (On/Off/Off)")

-- BASIC FLIGHT INSTRUMENT
definePushButton("ALT_BRIGHTNESS", 17, 3228, 951, "Flight Instruments", "Altimeter BRIGHT Button")
definePushButton("ALT_STD_BTN", 17, 3020, 952, "Flight Instruments", "Altimeter STD Button")
defineRotary("ALT_PRESS_KNB", 17, 3019, 953, "Flight Instruments", "Altimeter Pressure Knob")
definePushButton("ASI_CAGE", 17, 3229, 756, "Flight Instruments", "ASI Cage")
defineRotary("ASI_KNB", 17, 3230, 755, "Flight Instruments", "ASI Adjust (Up/Down)")

-- ICE PROTECTION
defineToggleSwitch("ICE_PROT_PROP", 6, 3185, 991, "Ice Protection", "Anti Ice Propeller (On/Off)")
define3PosTumb("ICE_PROT_WIND", 6, 3186, 992, "Ice Protection", "Anti Ice Windshield (Start/Set/Off")
defineToggleSwitch("PITOT_PRI", 6, 3187, 993, "Ice Protection", "Pitot / Stat - Pri/Tat (On/Off)")
defineToggleSwitch("PITOT_SEC", 6, 3188, 994, "Ice Protection", "Pitot / Stat - Sec (On/Off)")

-- INTERNAL LIGHTS
definePotentiometer("PANEL_BRIGHT", 5, 3189, 941, {0, 1}, "Internal Lights", "Panel Lights (Off/Brightness)")
defineToggleSwitch("STORM_LIGHTS", 5, 3190, 942, "Internal Lights", "Storm Lights (On/Off)")
definePotentiometer("CONSOLE_BRIGHT", 5, 3191, 943, {0, 1}, "Internal Lights", "Console Lights (Off/Brightness)")
define3PosTumb("ALARM_TEST_SW", 5, 3192, 944, "Internal Lights", "Alarm Test (Panel/Fire)")
definePotentiometer("CHART_BRIGHT", 5, 3193, 945, {0, 1}, "Internal Lights", "Chart Lights (Off/Brightness)")
defineToggleSwitch("NIGHT_VISION", 5, 3194, 946, "Internal Lights", "Nightvision (NVG/Norm)")

-- EXTERNAL LIGHTS
defineToggleSwitch("SEARCH_L_SW", 4, 3170, 931, "External Lights", "Search Lights (On/Off)")
defineToggleSwitch("BEACON_L_SW", 4, 3171, 932, "External Lights", "Beacon Lights (On/Off)")
defineToggleSwitch("STROBE_L_SW", 4, 3172, 933, "External Lights", "Strobe Lights (On/Off)")
defineToggleSwitch("FORMATION_IR_L_SW", 4, 3173, 934, "External Lights", "Formation Infrared Lights (On/Off)")
define3PosTumb("FORMATION_L_SW", 4, 3174, 935, "External Lights", "Formation Normal Lights (Brt/Dim/Off)")
defineToggleSwitch("NAV_L_SW", 4, 3175, 936, "External Lights", "Navigation Lights (On/Off)")
define3PosTumb("TAXI_L_SW", 4, 3176, 937, "External Lights", "Taxi Lights (On/Auto/Off)")
defineToggleSwitch("LAND_L_SW", 4, 3177, 938, "External Lights", "Landing Lights (On/Off)")

-- ENGINE
defineToggleSwitch("PMU_SW", 2, 3167, 921, "Engine", "PMU (Auto/Manual)")
define3PosTumb("IGNITION_SW", 2, 3168, 922, "Engine", "Ignition (On/Auto/Off)")
define3PosTumb("START_SW", 2, 3166, 923, "Engine", "Start (Start/No Function/Interrupt)")
defineToggleSwitch("INT_SEP_SW", 2, 3169, 924, "Engine", "Innertial Separation (Open/Close)")
define3PosTumb("SHUTOFF", 2, 3214, 871, "Engine", "Fuel/Hydraulic/Bleed Shutoff (Open/Close/Close)")

-- COCKPIT MECHANICS
defineToggleSwitch("CANOPY_LVR", 15, 71, 129, "Cockpit Mechanics", "Canopy Lever")
define3PosTumb("THROTTLE", 2, 3386, 911, "Cockpit Mechanics", "Throttle")
defineToggleSwitch("FLAPS_SW", 16, 3015, 912, "Cockpit Mechanics", "Flaps (Up/Down)")
definePotentiometer("THROTTLE_FRIC", 17, 3220, 913, {0, 1}, "Cockpit Mechanics", "Throttle Friction")
define3PosTumb("SEAT_UP_DN", 17, 3212, 891, "Cockpit Mechanics", "Seat (Up/Stop/Down)")
define3PosTumb("EMERG_SPD_BRK", 17, 3213, 881, "Cockpit Mechanics", "Emergency Speed Break (Close/Off/Normal)")
definePushButton("SUIT_TEST", 17, 3215, 861, "Cockpit Mechanics", "Anti-G Suit Test")
define3PosTumb("EMERG_PARK_BRK", 9, 3221, 791, "Cockpit Mechanics", "Emergency Parking Brakes")
defineToggleSwitch("MIRRORS", 1, 0, 1625, "Cockpit Mechanics", "Toggle Mirrors")

-- AUDIO
defineToggleSwitch("AUDIO_SEL", 18, 3227, 761, "Audio", "Audio Selector (Normal/Backup)")
definePotentiometer("COM1_VOL", 18, 3363, 762, {0, 1}, "Audio", "COM 1 Audio Volume")
definePotentiometer("COM2_VOL", 18, 3364, 763, {0, 1}, "Audio", "COM 2 Audio Volume")
definePotentiometer("COM3_VOL", 18, 3365, 764, {0, 1}, "Audio", "COM 3 Audio Volume")
definePotentiometer("COM4_VOL", 18, 3366, 765, {0, 1}, "Audio", "COM 4 Audio Volume")
definePotentiometer("ADF_VOL", 18, 3367, 766, {0, 1}, "Audio", "ADF Audio Volume")
definePotentiometer("NAV_VOL", 18, 3368, 767, {0, 1}, "Audio", "NAV Audio Volume")
definePotentiometer("MSL_VOL", 18, 3369, 768, {0, 1}, "Audio", "MSL Audio Volume")
definePotentiometer("MKR_VOL", 18, 3370, 769, {0, 1}, "Audio", "MKR Audio Volume")
definePotentiometer("AUDIO_VOL", 18, 3371, 770, {0, 1}, "Audio", "Audio Volume")
definePotentiometer("VOX_VOL", 18, 3372, 771, {0, 1}, "Audio", "VOX Audio Volume")

-- LANDING GEAR
defineTumb("GEAR", 8, 3205, 821, 2, {-1, 1}, nil, false, "Gear", "Landing Gear (Up/Down)")
definePushButton("GEAR_BEEP", 8, 3206, 822, "Gear", "Gear Beep Supress")
definePushButton("GEAR_OVERR", 8, 3207, 823, "Gear", "Gear Down Lock Override")
defineToggleSwitch("EMERG_GEAR", 8, 3208, 851, "Gear", "Gear Emergency Down (Emergency Down/Normal)")

-- AVIONICS
defineToggleSwitch("MDP_1_PW", 1, 3195, 841, "Avionics", "MDP 1 (On/Off)")
defineToggleSwitch("MDP_2_PW", 1, 3196, 842, "Avionics", "MDP 2 (On/Off)")
defineToggleSwitch("AVI_MASTER_PW", 1, 3197, 843, "Avionics", "Avionics Master (On/Off)")
defineToggleSwitch("SMS_PW", 1, 3198, 844, "Avionics", "SMS (On/Off)")
defineToggleSwitch("VUHF_MODE", 1, 3199, 845, "Avionics", "V/UHF (Guard/Normal)")
define3PosTumb("EMERG_AILERON", 12, 3216, 901, "Avionics", "Aileron Emergency (Left/Stop/Right)")
define3PosTumb("EMERG_ELEVATOR", 12, 3217, 902, "Avionics", "Elevator Emergency (Down/Stop/Up)")
define3PosTumb("AUTO_RUDDER", 12, 3218, 903, "Avionics", "Auto Rudder (Engage/Power/Off)")
definePushButton("WARNING_BTN", 22, 3346, 441, "Avionics", "Warning Button")
definePushButton("CAUTION_BTN", 22, 3347, 442, "Avionics", "Caution Button")
define3PosTumb("ELT_PW", 17, 3222, 771, "Avionics", "ELT (On/Arm-Reset)")
define3PosTumb("PNAV_MAN", 17, 3223, 772, "Avionics", "PIC NAV Manual Sync (CW/CCW)")
define3PosTumb("PNAV_SLAVE", 17, 3224, 773, "Avionics", "PIC NAV Slave (Free/Slave/Fast Slave)")

-- FUEL
defineToggleSwitch("FUEL_PUMP_MAIN", 3, 3209, 801, "Fuel", "Fuel Main Pump (Auto/Off)")
defineTumb("FUEL_PUMP_AUX", 3, 3210, 802, 0.25, {0, 1}, nil, false, "Fuel", "Fuel Aux Pump (LH/Auto/RH/Both)")
define3PosTumb("FUEL_TRANS", 20, 3211, 803, "Fuel", "Fuel Transfer (U-Wing/Ventral-Auto/Off)")

-- WEAPONS
define3PosTumb("WPN_MASS", 18, 3225, 781, "Weapon System", "Mass (Sim/Save/Live)")
define3PosTumb("WPN_L_ARM", 18, 3226, 782, "Weapon System", "Late Arm (On/Safe)")
definePushButton("WPN_SALVO", 18, 3204, 811, "Weapon System", "Salvo Mode")

-- ENVIRONMENTAL CONTROL SYSTEM
definePotentiometer("TEMP_SET", 7, 3200, 831, {0, 1}, "Environmental Control System", "Temperature (Cold/Hot)")
defineToggleSwitch("AC_PW", 7, 3201, 832, "Environmental Control System", "Air Conditioner (On/Off)")
defineToggleSwitch("ECS_MODE", 7, 3202, 833, "Environmental Control System", "ECS (Auto/Manual)")
defineToggleSwitch("REC_FAN_PW", 7, 3203, 834, "Environmental Control System", "Recirculating Fan (On/Off)")

-- CMFD1
definePushButton("CMFD_1_OSS1", 10, 3231, 501, "CMFD1", "CMFD #1 OSS 1")
definePushButton("CMFD_1_OSS2", 10, 3232, 502, "CMFD1", "CMFD #1 OSS 2")
definePushButton("CMFD_1_OSS3", 10, 3233, 503, "CMFD1", "CMFD #1 OSS 3")
definePushButton("CMFD_1_OSS4", 10, 3234, 504, "CMFD1", "CMFD #1 OSS 4")
definePushButton("CMFD_1_OSS5", 10, 3235, 505, "CMFD1", "CMFD #1 OSS 5")
definePushButton("CMFD_1_OSS6", 10, 3236, 506, "CMFD1", "CMFD #1 OSS 6")
definePushButton("CMFD_1_OSS7", 10, 3237, 507, "CMFD1", "CMFD #1 OSS 7")
definePushButton("CMFD_1_OSS8", 10, 3238, 508, "CMFD1", "CMFD #1 OSS 8")
definePushButton("CMFD_1_OSS9", 10, 3239, 509, "CMFD1", "CMFD #1 OSS 9")
definePushButton("CMFD_1_OSS10", 10, 3240, 510, "CMFD1", "CMFD #1 OSS 10")
definePushButton("CMFD_1_OSS11", 10, 3241, 511, "CMFD1", "CMFD #1 OSS 11")
definePushButton("CMFD_1_OSS12", 10, 3242, 512, "CMFD1", "CMFD #1 OSS 12")
definePushButton("CMFD_1_OSS13", 10, 3243, 513, "CMFD1", "CMFD #1 OSS 13")
definePushButton("CMFD_1_OSS14", 10, 3244, 514, "CMFD1", "CMFD #1 OSS 14")
definePushButton("CMFD_1_OSS15", 10, 3245, 515, "CMFD1", "CMFD #1 OSS 15")
definePushButton("CMFD_1_OSS16", 10, 3246, 516, "CMFD1", "CMFD #1 OSS 16")
definePushButton("CMFD_1_OSS17", 10, 3247, 517, "CMFD1", "CMFD #1 OSS 17")
definePushButton("CMFD_1_OSS18", 10, 3248, 518, "CMFD1", "CMFD #1 OSS 18")
definePushButton("CMFD_1_OSS19", 10, 3249, 519, "CMFD1", "CMFD #1 OSS 19")
definePushButton("CMFD_1_OSS20", 10, 3250, 520, "CMFD1", "CMFD #1 OSS 20")
definePushButton("CMFD_1_OSS21", 10, 3251, 521, "CMFD1", "CMFD #1 OSS 21")
definePushButton("CMFD_1_OSS22", 10, 3252, 522, "CMFD1", "CMFD #1 OSS 22")
definePushButton("CMFD_1_OSS23", 10, 3253, 523, "CMFD1", "CMFD #1 OSS 23")
definePushButton("CMFD_1_OSS24", 10, 3254, 524, "CMFD1", "CMFD #1 OSS 24")
definePushButton("CMFD_1_OSS25", 10, 3255, 525, "CMFD1", "CMFD #1 OSS 25")
definePushButton("CMFD_1_OSS26", 10, 3256, 526, "CMFD1", "CMFD #1 OSS 26")
definePushButton("CMFD_1_OSS27", 10, 3257, 527, "CMFD1", "CMFD #1 OSS 27")
definePushButton("CMFD_1_OSS28", 10, 3258, 528, "CMFD1", "CMFD #1 OSS 28")
defineToggleSwitch("CMFD_1_PW", 10, 3259, 529, "CMFD1", "CMFD #1 Power (On/Off)")
define3PosTumb("CMFD_1_GAIN", 10, 3260, 530, "CMFD1", "CMFD #1 Gain")
define3PosTumb("CMFD_1_SYMB", 10, 3261, 531, "CMFD1", "CMFD #1 Symbology")
define3PosTumb("CMFD_1_BRIGHT", 10, 3262, 532, "CMFD1", "CMFD #1 Bright")

-- CMFD2
definePushButton("CMFD_2_OSS1", 10, 3263, 551, "CMFD2", "CMFD #2 OSS 1")
definePushButton("CMFD_2_OSS2", 10, 3264, 552, "CMFD2", "CMFD #2 OSS 2")
definePushButton("CMFD_2_OSS3", 10, 3265, 553, "CMFD2", "CMFD #2 OSS 3")
definePushButton("CMFD_2_OSS4", 10, 3266, 554, "CMFD2", "CMFD #2 OSS 4")
definePushButton("CMFD_2_OSS5", 10, 3267, 555, "CMFD2", "CMFD #2 OSS 5")
definePushButton("CMFD_2_OSS6", 10, 3268, 556, "CMFD2", "CMFD #2 OSS 6")
definePushButton("CMFD_2_OSS7", 10, 3269, 557, "CMFD2", "CMFD #2 OSS 7")
definePushButton("CMFD_2_OSS8", 10, 3270, 558, "CMFD2", "CMFD #2 OSS 8")
definePushButton("CMFD_2_OSS9", 10, 3271, 559, "CMFD2", "CMFD #2 OSS 9")
definePushButton("CMFD_2_OSS10", 10, 3272, 560, "CMFD2", "CMFD #2 OSS 10")
definePushButton("CMFD_2_OSS11", 10, 3273, 561, "CMFD2", "CMFD #2 OSS 11")
definePushButton("CMFD_2_OSS12", 10, 3274, 562, "CMFD2", "CMFD #2 OSS 12")
definePushButton("CMFD_2_OSS13", 10, 3275, 563, "CMFD2", "CMFD #2 OSS 13")
definePushButton("CMFD_2_OSS14", 10, 3276, 564, "CMFD2", "CMFD #2 OSS 14")
definePushButton("CMFD_2_OSS15", 10, 3277, 565, "CMFD2", "CMFD #2 OSS 15")
definePushButton("CMFD_2_OSS16", 10, 3278, 566, "CMFD2", "CMFD #2 OSS 16")
definePushButton("CMFD_2_OSS17", 10, 3279, 567, "CMFD2", "CMFD #2 OSS 17")
definePushButton("CMFD_2_OSS18", 10, 3280, 568, "CMFD2", "CMFD #2 OSS 18")
definePushButton("CMFD_2_OSS19", 10, 3281, 569, "CMFD2", "CMFD #2 OSS 19")
definePushButton("CMFD_2_OSS20", 10, 3282, 570, "CMFD2", "CMFD #2 OSS 20")
definePushButton("CMFD_2_OSS21", 10, 3283, 571, "CMFD2", "CMFD #2 OSS 21")
definePushButton("CMFD_2_OSS22", 10, 3284, 572, "CMFD2", "CMFD #2 OSS 22")
definePushButton("CMFD_2_OSS23", 10, 3285, 573, "CMFD2", "CMFD #2 OSS 23")
definePushButton("CMFD_2_OSS24", 10, 3286, 574, "CMFD2", "CMFD #2 OSS 24")
definePushButton("CMFD_2_OSS25", 10, 3287, 575, "CMFD2", "CMFD #2 OSS 25")
definePushButton("CMFD_2_OSS26", 10, 3288, 576, "CMFD2", "CMFD #2 OSS 26")
definePushButton("CMFD_2_OSS27", 10, 3289, 577, "CMFD2", "CMFD #2 OSS 27")
definePushButton("CMFD_2_OSS28", 10, 3290, 578, "CMFD2", "CMFD #2 OSS 28")
defineToggleSwitch("CMFD_2_PW", 10, 3291, 579, "CMFD2", "CMFD #2 Power (On/Off)")
define3PosTumb("CMFD_2_GAIN", 10, 3292, 580, "CMFD2", "CMFD #2 Gain")
define3PosTumb("CMFD_2_SYMB", 10, 3293, 581, "CMFD2", "CMFD #2 Symbology")
define3PosTumb("CMFD_2_BRIGHT", 10, 3294, 582, "CMFD2", "CMFD #2 Bright")

-- CLOCK
definePushButton("CLOCK_SEL", 17, 3295, 491, "Clock", "Clock Selection")
definePushButton("CLOCK_CONTROL", 17, 3296, 492, "Clock", "Clock Control")

-- UFCP
definePushButton("UFCP_COM1", 20, 3297, 451, "UFCP", "UFCP COM 1")
definePushButton("UFCP_COM2", 20, 3298, 452, "UFCP", "UFCP COM 2")
definePushButton("UFCP_NAV_AID", 20, 3300, 453, "UFCP", "UFCP NAV AIDS")
definePushButton("UFCP_AG", 20, 3301, 454, "UFCP", "UFCP A/G")
definePushButton("UFCP_NAV", 20, 3302, 455, "UFCP", "UFCP NAV")
definePushButton("UFCP_AA", 20, 3303, 456, "UFCP", "UFCP A/A")
definePushButton("UFCP_BARO", 20, 3304, 457, "UFCP", "UFCP BARO/RALT")
definePushButton("UFCP_IDNT", 20, 3305, 458, "UFCP", "UFCP IDNT")
definePushButton("UFCP_1", 20, 3306, 459, "UFCP", "UFCP 1")
definePushButton("UFCP_2", 20, 3307, 460, "UFCP", "UFCP 2")
definePushButton("UFCP_3", 20, 3308, 461, "UFCP", "UFCP 3")
definePushButton("UFCP_4", 20, 3309, 462, "UFCP", "UFCP 4")
definePushButton("UFCP_5", 20, 3310, 463, "UFCP", "UFCP 5")
definePushButton("UFCP_6", 20, 3311, 464, "UFCP", "UFCP 6")
definePushButton("UFCP_7", 20, 3312, 465, "UFCP", "UFCP 7")
definePushButton("UFCP_8", 20, 3313, 466, "UFCP", "UFCP 8")
definePushButton("UFCP_9", 20, 3314, 467, "UFCP", "UFCP 9")
definePushButton("UFCP_0", 20, 3315, 468, "UFCP", "UFCP 0")
definePushButton("UFCP_CLR", 20, 3318, 469, "UFCP", "UFCP Clear")
definePushButton("UFCP_ENT", 20, 3319, 470, "UFCP", "UFCP Enter")
definePushButton("UFCP_CZ", 20, 3320, 471, "UFCP", "UFCP CZ")
definePushButton("UFCP_AIRSPD", 20, 3321, 472, "UFCP", "UFCP Airspeed")
definePushButton("UFCP_WARN", 20, 3322, 473, "UFCP", "UFCP Warning Reset")
definePushButton("UFCP_UP", 20, 3316, 474, "UFCP", "UFCP Up")
definePushButton("UFCP_DN", 20, 3317, 475, "UFCP", "UFCP Down")
define3PosTumb("UFCP_DAY_NIGHT", 20, 3323, 476, "UFCP", "UFCP Day/Night/Auto")
defineToggleSwitch("UFCP_RAD_ALT", 20, 3324, 478, "UFCP", "UFCP Radar Altimeter Transmit/Off")
define3PosTumb("UFCP_DVR_REC", 20, 3325, 478, "UFCP", "UFCP DVR Rec/Standby/Off")
defineTumb("UFCP_EGI", 20, 3326, 479, 0.25, {0.0, 1.0}, nil, false, "UFCP", "UFCP EGI Nav/Align/Storage Heading/Off/Test")
definePotentiometer("UFCP_UFC_BRT", 20, 3327, 480, {0, 1}, "UFCP", "UFCP UFC BRT/OFF")
defineToggleSwitch("UFCP_HUD_TEST", 20, 3328, 481, "UFCP", "UFCP HUD Test")
defineToggleSwitch("UFCP_SBS", 20, 3329, 482, "UFCP", "UFCP SBS On")
definePotentiometer("UFCP_HUD_BRT", 11, 3330, 483, {0, 1}, "UFCP", "UFCP HUD Britghness")
definePotentiometer("UFCP_SBS_ADJUST", 20, 3331, 484, {0, 1}, "UFCP", "UFCP UFC BRT/OFF")
definePushButton("UFCP_JOY_R", 20, 3332, 485, "UFCP", "UFCP Joystick Right")
definePushButton("UFCP_JOY_L", 20, 3333, 486, "UFCP", "UFCP Joystick Left")
definePushButton("UFCP_JOY_U", 20, 3334, 487, "UFCP", "UFCP Joystick Up")
definePushButton("UFCP_JOY_D", 20, 3335, 488, "UFCP", "UFCP Joystick Down")

-- AUTOPILOT
definePushButton("AP_ROLL_PITCH", 25, 3374, 431, "Autopilot", "AP Roll/Pitch")
definePushButton("AP_HDG", 25, 3375, 432, "Autopilot", "AP Heading")
definePushButton("AP_ALT", 25, 3376, 433, "Autopilot", "AP Altitude")
definePushButton("AP_TEST", 25, 3377, 434, "Autopilot", "AP Test")
definePushButton("AP_NAV", 25, 3378, 435, "Autopilot", "AP NAV")
definePushButton("AP_APR", 25, 3379, 436, "Autopilot", "AP Approach")
definePushButton("AP_GS", 25, 3380, 437, "Autopilot", "AP GS")
definePushButton("AP_ON", 25, 3381, 438, "Autopilot", "AP ON")

-- GAUGES
defineFloat("CANOPY_VALUE", 26, {0.0, 1.0}, "Gauges", "Canopy Position")
defineFloat("VERT_VELO_G", 662, {-1, 1}, "Gauges", "Vertical Velocity")
defineFloat("ASI_ROLL", 752, {-1, 1}, "Gauges", "ASI Roll")
defineFloat("ASI_PITCH", 753, {-1, 1}, "Gauges", "ASI Pitch")
defineFloat("ASI_OFF", 754, {0, 1}, "Gauges", "ASI OFF Flag")

-- Warning, Caution and IndicatorLights
defineIndicatorLight("PANEL_BACK_L", 201, "Warning, Caution and IndicatorLights", "Panel Backlighting (green)")
defineIndicatorLight("CONSOLE_BACK_L", 202, "Warning, Caution and IndicatorLights", "Console Backlighting (green)")
defineIndicatorLight("CHART_L", 203, "Warning, Caution and IndicatorLights", "Chart Light (green)")
defineIndicatorLight("STORM_L", 204, "Warning, Caution and IndicatorLights", "Storm Light (white)")
defineIndicatorLight("WARN_L", 205, "Warning, Caution and IndicatorLights", "Warning Light (red)")
defineIndicatorLight("CAUTION_L", 206, "Warning, Caution and IndicatorLights", "Caution Light (yellow)")
defineIndicatorLight("FIRE_L", 207, "Warning, Caution and IndicatorLights", "Fire Light (red)")
defineIndicatorLight("PBRAKE_L", 208, "Warning, Caution and IndicatorLights", "Park Brake Light (green)")
defineIndicatorLight("GEAR_NOSE_L", 209, "Warning, Caution and IndicatorLights", "Nose Gear Light (green)")
defineIndicatorLight("GEAR_LEFT_L", 210, "Warning, Caution and IndicatorLights", "Left Gear Light (green)")
defineIndicatorLight("GEAR_RIGHT_L", 211, "Warning, Caution and IndicatorLights", "Right Gear Light (green)")
defineIndicatorLight("GEAR_HANDLE_L", 207, "Warning, Caution and IndicatorLights", "Gear Handle Light (red)")
defineIndicatorLight("UFCP_BACK_L", 489, "Warning, Caution and IndicatorLights", "UFCP Backlighting (green)")
defineIndicatorLight("AP_RP_L", 213, "Warning, Caution and IndicatorLights", "AP Roll/Pitch Light (green)")
defineIndicatorLight("AP_HDG_L", 214, "Warning, Caution and IndicatorLights", "AP Heading Light (green)")
defineIndicatorLight("AP_ALT_L", 215, "Warning, Caution and IndicatorLights", "AP Altitude Light (green)")
defineIndicatorLight("AP_TEST_L", 216, "Warning, Caution and IndicatorLights", "AP Test Light (green)")
defineIndicatorLight("AP_TEST_F_L", 217, "Warning, Caution and IndicatorLights", "AP Test Fail Light (red)")
defineIndicatorLight("AP_NAV_L", 218, "Warning, Caution and IndicatorLights", "AP NAV Light (green)")
defineIndicatorLight("AP_NAV_F_L", 219, "Warning, Caution and IndicatorLights", "AP NAV Fail Light (red)")
defineIndicatorLight("AP_APR_L", 220, "Warning, Caution and IndicatorLights", "AP Approach Light (green)")
defineIndicatorLight("AP_APR_F_L", 221, "Warning, Caution and IndicatorLights", "AP Approach Fail Light (red)")
defineIndicatorLight("AP_GS_L", 222, "Warning, Caution and IndicatorLights", "AP GS Light (green)")
defineIndicatorLight("AP_GS_F_L", 223, "Warning, Caution and IndicatorLights", "AP GS Fail Light (red)")
defineIndicatorLight("AP_ON_L", 224, "Warning, Caution and IndicatorLights", "AP ON Light (green)")
defineIndicatorLight("AP_ON_F_L", 225, "Warning, Caution and IndicatorLights", "AP ON Fail Light (red)")

-- Externals
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(49) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights (red,green, White)")

defineIntegerFromGetter("EXT_LANDING_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(51) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Lights (yellow)")

defineIntegerFromGetter("EXT_STROBE_TOP", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Strobe Light (white)")

defineIntegerFromGetter("EXT_TOP_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(802) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Light (white)")

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_REAR", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Rear Gear")

BIOS.protocol.endModule()