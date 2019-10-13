BIOS.protocol.beginModule("C-101CC", 0x3600)
BIOS.protocol.setExportModuleAircrafts({"C-101CC", "C-101EB"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- remove Arg# Pilot 1000 / Instructor 1002 / Hide Stick Front 309 Back 312

--================================================================ COMMON COCKPIT ==================================================================
-- Electrical Panel
defineToggleSwitch("FRONT_BATT_MASTER_SW", 2, 3001, 315, "Electrical Panel", "FRONT Battery Master Switch")
defineToggleSwitch("FRONT_L_BATT_ISO_COVER", 2, 3002, 324, "Electrical Panel", "FRONT Left Battery Isolation Cover")
definePushButton("FRONT_L_BATT_ISO_BTN", 2, 3003, 325, "Electrical Panel", "FRONT Left Battery Isolation Button")
defineToggleSwitch("FRONT_R_BATT_ISO_COVER", 2, 3004, 326, "Electrical Panel", "FRONT Right Battery Isolation Cover")
definePushButton("FRONT_R_BATT_ISO_BTN", 2, 3005, 327, "Electrical Panel", "FRONT Right Battery Isolation Button")
defineToggleSwitch("FRONT_DC_BUS_TIE", 2, 3006, 316, "Electrical Panel", "FRONT DC Bus Tie")
defineToggleSwitch("FRONT_ESS_BUS_COVER", 2, 3007, 322, "Electrical Panel", "FRONT ESS BUS Cover")
definePushButton("FRONT_ESS_BUS_BTN", 2, 3008, 323, "Electrical Panel", "FRONT ESS BUS Transfer")
defineToggleSwitch("FRONT_AC_INVERTER", 2, 3009, 319, "Electrical Panel", "FRONT AC Inverter Norm/Alt")
define3PosTumb("FRONT_GEN_SW", 2, 3010, 317, "Electrical Panel", "FRONT Generator ON/OFF/RESET")
define3PosTumb("FRONT_GEN_TEST_SW", 2, 3011, 318, "Electrical Panel", "FRONT Generator GROUND FAULT/OVERVOLTAGE Test")
defineToggleSwitch("BACK_L_BATT_ISO_COVER", 2, 3400, 935, "Electrical Panel", "BACK Left Battery Isolation Cover")
definePushButton("BACK_L_BATT_ISO_BTN", 2, 3401, 936, "Electrical Panel", "BACK Left Battery Isolation Button")
defineToggleSwitch("BACK_R_BATT_ISO_COVER", 2, 3402, 937, "Electrical Panel", "BACK Right Battery Isolation Cover")
definePushButton("BACK_R_BATT_ISO_BTN", 2, 3403, 938, "Electrical Panel", "BACK Right Battery Isolation Button")
defineToggleSwitch("BACK_ESS_BUS_COVER", 2, 3404, 933, "Electrical Panel", "BACK ESS BUS Cover")
definePushButton("BACK_ESS_BUS_BTN", 2, 3405, 934, "Electrical Panel", "BACK ESS BUS Transfer")

-- CAWS Lighting/Test 
defineToggleSwitch("FRONT_CAWS_BRIGHT_DIM", 2, 3012, 320, "CAWS Lighting", "FRONT CAWS Panel Bright/Dim")
definePushButton("FRONT_LAMP_TEST", 2, 3013, 321, "CAWS Lighting", "FRONT Lamp Test")
defineToggleSwitch("BACK_CAWS_BRIGHT_DIM", 2, 3406, 931, "CAWS Lighting", "BACK CAWS Panel Bright/Dim")
definePushButton("BACK_LAMP_TEST", 2, 3407, 932, "CAWS Lighting", "BACK Lamp Test")

-- Primary ADI 
definePushButton("FRONT_PRI_ADI_TEST", 2, 3166, 117, "ADI", "FRONT Primary ADI Test")
definePushButton("BACK_PRI_ADI_TEST", 2, 3688, 995, "ADI", "BACK Primary ADI Test")

-- Backup ADI
definePushButton("FRONT_BAK_ADI_CAGE_BNT", 2, 3014, 41, "ADI", "FRONT Cage Standby Attitude Indicator Button")
defineRotary("FRONT_BAK_ADI_CAGE_KNOB", 2, 3241, 533, "ADI", "FRONT Cage Standby Attitude Indicator Knob")
definePushButton("BACK_BAK_ADI_CAGE_BNT", 2, 3408, 782, "ADI", "BACK Cage Standby Attitude Indicator Button")
defineRotary("BACK_BAK_ADI_CAGE_KNOB", 2, 3409, 783, "ADI", "BACK Cage Standby Attitude Indicator Knob")

-- ALTIMETER 
definePotentiometer("FRONT_ALTIMETER_KNOB", 2, 3015, 66, {0, 1}, "Altimeter", "FRONT Altimeter Baro Adjust")
definePotentiometer("BACK_ALTIMETER_KNOB", 2, 3410, 792, {0, 1}, "Altimeter", "BACK Altimeter Baro Adjust")

-- CAWS ALERT RESET
definePushButton("FRONT_CAWS_FAULT_RESET", 2, 3016, 513, "CAWS Alert", "FRONT Fault Alert Reset")
definePushButton("FRONT_CAWS_FIRE_RESET", 2, 3017, 514, "CAWS Alert", "FRONT Fire Alert Reset")
definePushButton("FRONT_CAWS_CAUTION_RESET", 2, 3018, 515, "CAWS Alert", "FRONT Caution Alert Reset")
definePushButton("BACK_CAWS_FAULT_RESET", 2, 3412, 634, "CAWS Alert", "BACK Fault Alert Reset")
definePushButton("BACK_CAWS_FIRE_RESET", 2, 3413, 636, "CAWS Alert", "BACK Fire Alert Reset")
definePushButton("BACK_CAWS_CAUTION_RESET", 2, 3414, 637, "CAWS Alert", "BACK Caution Alert Reset")

-- CRS AND HDG BUGS
definePotentiometer("FRONT_CRS_KNOB", 2, 3029, 344, {0, 1}, "CRS HDG Bugs", "FRONT Course Knob")
definePotentiometer("FRONT_HDG_KNOB", 2, 3030, 345, {0, 1}, "CRS HDG Bugs", "FRONT Heading Knob")
definePotentiometer("BACK_CRS_KNOB", 2, 3525, 943, {0, 1}, "CRS HDG Bugs", "BACK Course Knob")
definePotentiometer("BACK_HDG_KNOB", 2, 3526, 944, {0, 1}, "CRS HDG Bugs", "BACK Heading Knob")

-- CANOPY
defineToggleSwitch("FRONT_CANOPY_SAFE", 2, 3040, 11, "Canopy", "FRONT Canopy Safety Catch")
defineToggleSwitch("FRONT_CANOPY_LOCK", 2, 3041, 13, "Canopy", "FRONT Canopy Locking Handle")
defineToggleSwitch("BACK_CANOPY_SAFE", 2, 3508, 750, "Canopy", "BACK Canopy Safety Catch")
defineToggleSwitch("BACK_CANOPY_LOCK", 2, 3509, 749, "Canopy", "BACK Canopy Locking Handle")

-- G METER 
definePushButton("FRONT_GMETER_RESET", 2, 3042, 25, "G Meter", "FRONT Reset Max/Min Needles")
definePushButton("BACK_GMETER_RESET", 2, 3415, 774, "G Meter", "BACK Reset Max/Min Needles")

-- COCKPIT LIGHTING
defineToggleSwitch("FRONT_LIGHTS_FLOODRED", 3, 3102, 370, "Cockpit Lighting", "FRONT Red Flood Lights")
defineToggleSwitch("FRONT_LIGHTS_STORM", 3, 3103, 369, "Cockpit Lighting", "FRONT Storm Lights")
definePotentiometer("FRONT_LIGHTS_CONSOLE", 3, 3104, 365, {0, 1}, "Cockpit Lighting", "FRONT Console Integral Lights")
definePotentiometer("FRONT_LIGHTS_INSTR", 3, 3105, 364, {0, 1}, "Cockpit Lighting", "FRONT Instrument Lights")
defineToggleSwitch("BACK_LIGHTS_FLOODRED", 3, 3416, 248, "Cockpit Lighting", "BACK Red Flood Lights")
defineToggleSwitch("BACK_LIGHTS_STORM", 3, 3417, 249, "Cockpit Lighting", "BACK Storm Lights")
definePotentiometer("BACK_LIGHTS_CONSOLE", 3, 3418, 251, {0, 1}, "Cockpit Lighting", "BACK Console Integral Lights")
definePotentiometer("BACK_LIGHTS_INSTR", 3, 3419, 250, {0, 1}, "Cockpit Lighting", "BACK Instrument Lights")

-- EXTERNAL LIGHTING
defineToggleSwitch("FRONT_LIGHTS_ANTI_COL", 3, 3106, 366, "External Lights", "FRONT Anti-Collision Becon Switch")
defineTumb("FRONT_LIGHTS_NAV", 3, 3107, 368, 0.5, {0, 1}, nil, false, "External Lights", "FRONT Navigation Lights Switch, DIM/OFF/BRIGHT")
defineTumb("FRONT_LIGHTS_FOR", 3, 3108, 367, 0.5, {0, 1}, nil, false, "External Lights", "FRONT Formation Lights Switch, DIM/OFF/BRIGHT")
defineTumb("FRONT_LIGHTS_TAXI_L", 3, 3109, 329, 0.5, {0, 1}, nil, false, "External Lights", "FRONT Left Taxi/Landing Lights Switch, RETRACT/TAXI/LAND")
defineTumb("FRONT_LIGHTS_TAXI_R", 3, 3110, 330, 0.5, {0, 1}, nil, false, "External Lights", "FRONT Right Taxi/Landing Lights Switch, RETRACT/TAXI/LAND")
defineToggleSwitch("BACK_LIGHTS_PRIO_TAXI_L", 3, 3420, 941, "External Lights", "BACK Left Taxi/Landing Lights Forward Cockpit Priority")
defineToggleSwitch("BACK_LIGHTS_PRIO_TAXI_R", 3, 3421, 942, "External Lights", "BACK Right Taxi/Landing Lights Forward Cockpit Priority")

-- FUEL PANEL 
defineToggleSwitch("FRONT_FUSE_TANK_PUMP_COVER", 2, 3044, 119, "Fuel Panel", "FRONT Fuselage Tank Pump Cover")
defineToggleSwitch("FRONT_ENG_FUEL_VALVE_PUMP_COVER", 2, 3045, 121, "Fuel Panel", "FRONT Engine Fuel Valve Cover")
definePushButton("FRONT_FUSE_TANK_PUMP", 2, 3046, 120, "Fuel Panel", "FRONT Fuselage Tank Pump Button")
definePushButton("FRONT_ENG_FUEL_VALVE_PUMP", 2, 3047, 122, "Fuel Panel", "FRONT Engine Fuel Valve Button")
definePushButton("FRONT_CENTER_WING_TANK_QTY", 2, 3048, 123, "Fuel Panel", "FRONT Center Wing Tank Qty Button")
definePushButton("FRONT_TEST_FUEL_QTY", 2, 3049, 124, "Fuel Panel", "FRONT Test Fuel Qty Indicator Button")
defineMultipositionSwitch("FRONT_FUEL_TRANS_L", 2, 3050, 130, 3, 0.5,"Fuel Panel" ,"FRONT Fuel Transfer Left")
defineMultipositionSwitch("FRONT_FUEL_TRANS_C1", 2, 3051, 131, 3, 0.5,"Fuel Panel" ,"FRONT Fuel Transfer Center 1")
defineMultipositionSwitch("FRONT_FUEL_TRANS_C2", 2, 3052, 132, 3, 0.5,"Fuel Panel" ,"FRONT Fuel Transfer Center 2")
defineMultipositionSwitch("FRONT_FUEL_TRANS_R", 2, 3053, 133, 3, 0.5,"Fuel Panel" ,"FRONT Fuel Transfer Right")
defineToggleSwitch("BACK_FUSE_TANK_PUMP_COVER", 2, 3474, 812, "Fuel Panel", "BACK Fuselage Tank Pump Cover")
defineToggleSwitch("BACK_ENG_FUEL_VALVE_PUMP_COVER", 2, 3475, 814, "Fuel Panel", "BACK Engine Fuel Valve Cover")
definePushButton("BACK_FUSE_TANK_PUMP", 2, 3476, 813, "Fuel Panel", "BACK Fuselage Tank Pump Button")
definePushButton("BACK_ENG_FUEL_VALVE_PUMP", 2, 3477, 815, "Fuel Panel", "BACK Engine Fuel Valve Button")
definePushButton("BACK_CENTER_WING_TANK_QTY", 2, 3478, 816, "Fuel Panel", "BACK Center Wing Tank Qty Button")
defineMultipositionSwitch("BACK_FUEL_TRANS_L", 2, 3480, 818, 3, 0.5,"Fuel Panel" ,"BACK Fuel Transfer Left/Fwd Cockpit Priority")
defineMultipositionSwitch("BACK_FUEL_TRANS_C1", 2, 3481, 819, 3, 0.5,"Fuel Panel" ,"BACK Fuel Transfer Center 1/Fwd Cockpit Priority")
defineMultipositionSwitch("BACK_FUEL_TRANS_C2", 2, 3482, 820, 3, 0.5,"Fuel Panel" ,"BACK Fuel Transfer Center 2/Fwd Cockpit Priority")
defineMultipositionSwitch("BACK_FUEL_TRANS_R", 2, 3483, 821, 3, 0.5,"Fuel Panel" ,"BACK Fuel Transfer Right/Fwd Cockpit Priority")
definePushButton("FRONT_FUEL_FLOW_RESET", 2, 3234, 32, "Fuel Panel", "FRONT Fuel Flow Reset")
definePushButton("FRONT_FUEL_FLOW_TEST", 2, 3235, 342, "Fuel Panel", "FRONT Fuel Flow Test")
definePushButton("BACK_FUEL_FLOW_RESET", 2, 3441, 779, "Fuel Panel", "BACK Fuel Flow Reset")

-- CIRCUIT BREAKERS
defineToggleSwitch("FRONT_CB_ENG_GEN", 2, 3054, 427, "CB Panel", "FRONT Circuit Breaker Engine Generator")
defineToggleSwitch("FRONT_CB_ENG_COMP", 2, 3087, 428, "CB Panel", "FRONT Circuit Breaker Engine Computer")
defineToggleSwitch("FRONT_CB_RPM_N2", 2, 3062, 429, "CB Panel", "FRONT Circuit Breaker RPM N2")
defineToggleSwitch("FRONT_CB_OIL_PRESS", 2, 3073, 430, "CB Panel", "FRONT Circuit Breaker Oil Pressure")
defineToggleSwitch("FRONT_CB_EXT_LIGHTS_RH", 2, 3089, 431, "CB Panel", "FRONT Circuit Breaker Position Lights RH LAND/TAXI Lights")
defineToggleSwitch("FRONT_CB_AIR_COND", 2, 3071, 432, "CB Panel", "FRONT Circuit Breaker Air-Conditioning/Pressurization")
defineToggleSwitch("FRONT_CB_ELE_TRIM_PW", 2, 3088, 433, "CB Panel", "FRONT Circuit Breaker Elevator Trim Power")
defineToggleSwitch("FRONT_CB_ABRAKE_ANTISKID", 2, 3072, 434, "CB Panel", "FRONT Circuit Breaker Air-Brake/Anti-Skid Operation")
defineToggleSwitch("FRONT_CB_GEAR", 2, 3058, 435, "CB Panel", "FRONT Circuit Breaker Landing Gear")
defineToggleSwitch("FRONT_CB_VOR_DC", 2, 3070, 438, "CB Panel", "FRONT Circuit Breaker VOR DC")
defineToggleSwitch("FRONT_CB_RPM_N1", 2, 3061, 439, "CB Panel", "FRONT Circuit Breaker RPM N1")
defineToggleSwitch("FRONT_CB_ITT", 2, 3063, 440, "CB Panel", "FRONT Circuit Breaker ITT")
defineToggleSwitch("FRONT_CB_OIL_TMP", 2, 3081, 441, "CB Panel", "FRONT Circuit Breaker Oil Temperature Indicator")
defineToggleSwitch("FRONT_CB_ANTICE_RAIN", 2, 3083, 442, "CB Panel", "FRONT Circuit Breaker Anti-Ice/Rain Repellent")
defineToggleSwitch("FRONT_CB_ENG_START", 2, 3085, 443, "CB Panel", "FRONT Circuit Breaker Enginer Starter")
defineToggleSwitch("FRONT_CB_PITOT_STALL", 2, 3082, 444, "CB Panel", "FRONT Circuit Breaker PITOT Heat/Stall Warning System")
defineToggleSwitch("FRONT_CB_EXT_LIGHTS_LH", 2, 3101, 445, "CB Panel", "FRONT Circuit Breaker LH LAND/TAXI Lights")
defineToggleSwitch("FRONT_CB_NORM_INV", 2, 3055, 446, "CB Panel", "FRONT Circuit Breaker Normal Inverter")
defineToggleSwitch("FRONT_CB_GEAR_BRAKE_IND", 2, 3068, 447, "CB Panel", "FRONT Circuit Breaker Langing Gear/Airbrake/Trim Indicators")
defineToggleSwitch("FRONT_CB_FLAP_AILERON_IND", 2, 3084, 448, "CB Panel", "FRONT Circuit Breaker Flaps/Aileron Indicators")
defineToggleSwitch("FRONT_CB_OXY_HYD_IND", 2, 3069, 449, "CB Panel", "FRONT Circuit Breaker Oxygen/Hydraulic Press Indicators")
defineToggleSwitch("FRONT_CB_CAUTION_PANEL", 2, 3057, 450, "CB Panel", "FRONT Circuit Breaker Caution/Warning Panel")
defineToggleSwitch("FRONT_CB_BAK_INV", 2, 3056, 451, "CB Panel", "FRONT Circuit Breaker Backup Inverter")
defineToggleSwitch("FRONT_CB_C_WING_PUMPS", 2, 3075, 452, "CB Panel", "FRONT Circuit Breaker Center Wing Tank Pumps")
defineToggleSwitch("FRONT_CB_INSTR_STORM_ACOL_L", 2, 3094, 454, "CB Panel", "FRONT Circuit Breaker Instrument, Strom, Anti-Collision Lights")
defineToggleSwitch("FRONT_CB_SEAT", 2, 3096, 463, "CB Panel", "FRONT Circuit Breaker Seat Adjustment")
defineToggleSwitch("FRONT_CB_O_WING_PUMPS", 2, 3076, 464, "CB Panel", "FRONT Circuit Breaker Outer Wing Tank Pumps")
defineToggleSwitch("FRONT_CB_FUSELAGE_PUMP", 2, 3074, 467, "CB Panel", "FRONT Circuit Breaker Fuselage Tank Pump")
defineToggleSwitch("FRONT_CB_FIRE_DETECTOR", 2, 3091, 468, "CB Panel", "FRONT Circuit Breaker Fire Detector")
defineToggleSwitch("FRONT_CB_FORM_LIGHTS", 2, 3098, 456, "CB Panel", "FRONT Circuit Breaker Formation Lights")
defineToggleSwitch("BACK_CB_VOR_DC", 2, 3499, 949, "CB Panel", "BACK Circuit Breaker VOR DC")
defineToggleSwitch("BACK_CB_ENG_START", 2, 3504, 950, "CB Panel", "BACK Circuit Breaker Enginer Starter")
defineToggleSwitch("BACK_CB_OIL_TMP", 2, 3500, 951, "CB Panel", "BACK Circuit Breaker Oil Temperature Indicator")
defineToggleSwitch("BACK_CB_ITT", 2, 3497, 952, "CB Panel", "BACK Circuit Breaker ITT")
defineToggleSwitch("BACK_CB_RPM_N1", 2, 3495, 953, "CB Panel", "BACK Circuit Breaker RPM N1")
defineToggleSwitch("BACK_CB_RPM_N2", 2, 3496, 954, "CB Panel", "BACK Circuit Breaker RPM N2")
defineToggleSwitch("BACK_CB_OXY_HYD_IND", 2, 3498, 955, "CB Panel", "BACK Circuit Breaker Oxygen/Hydraulic Press Indicators")
defineToggleSwitch("BACK_CB_SEAT", 2, 3506, 956, "CB Panel", "BACK Circuit Breaker Seat Adjustment")
defineToggleSwitch("BACK_CB_INSTR_STORM_ACOL_L", 2, 3502, 957, "CB Panel", "BACK Circuit Breaker Instrument, Strom, Anti-Collision Lights")
defineToggleSwitch("BACK_CB_BAK_ADI", 2, 3494, 959, "CB Panel", "BACK Circuit Breaker Backup ADI")
defineToggleSwitch("BACK_CB_CPT_LIGHTS_RED", 2, 3501, 960, "CB Panel", "BACK Circuit Breaker Red Cockpit Lights")
defineToggleSwitch("BACK_CB_INTERPHONE", 2, 3505, 961, "CB Panel", "BACK Circuit Breaker Interphone")
defineToggleSwitch("BACK_CB_CONSOLE_LIGHTS", 2, 3503, 958, "CB Panel", "BACK Circuit Breaker Console Lights")

-- ENGINE START PANEL
definePushButton("FRONT_GPU", 2, 3038, 134, "Engine Start Panel", "FRONT GPU Button")
definePushButton("FRONT_COMPUTER", 2, 3111, 136, "Engine Start Panel", "FRONT Computer Button")
definePushButton("FRONT_ANTI_ICE", 2, 3112, 135, "Engine Start Panel", "FRONT ANTI-ICE Button")
defineToggleSwitch("FRONT_START_MODE_SEL", 2, 3113, 137, "Engine Start Panel", "FRONT Starter Mode Selector")
definePushButton("FRONT_ABORT", 2, 3114, 138, "Engine Start Panel", "FRONT GPU Button")
defineTumb("FRONT_CONT_ING_START", 2, 3115, 139, 2, {-1, 1}, nil, false, "Engine Start Panel", "FRONT Continuous Ignition/Start")
definePushButton("FRONT_ENG_START_TEST_BTN", 2, 3116, 525, "Engine Start Panel", "FRONT Engine Start Test Button")
definePotentiometer("FRONT_ENG_START_TEST_KNB", 2, 3536, 1273, {0, 1}, "Engine Start Panel", "FRONT Engine Start Test Knob")
definePushButton("BACK_GPU", 2, 3422, 822, "Engine Start Panel", "BACK GPU Button")
definePushButton("BACK_COMPUTER", 2, 3423, 824, "Engine Start Panel", "BACK Computer Button")
definePushButton("BACK_ANTI_ICE", 2, 3424, 823, "Engine Start Panel", "BACK ANTI-ICE Button")
defineToggleSwitch("BACK_START_MODE_SEL", 2, 3425, 825, "Engine Start Panel", "BACK Starter Mode Selector")
definePushButton("BACK_ABORT", 2, 3426, 826, "Engine Start Panel", "BACK GPU Button")
defineTumb("BACK_CONT_ING_START", 2, 3427, 827, 2, {-1, 1}, nil, false, "Engine Start Panel", "BACK Continuous Ignition/Start")
definePushButton("BACK_ENG_START_TEST_BTN", 2, 3428, 828, "Engine Start Panel", "BACK Engine Start Test Button")
definePotentiometer("BACK_ENG_START_TEST_KNB", 2, 3537, 1275, {0, 1}, "Engine Start Panel", "BACK Engine Start Test Knob")

-- OXYGEN SYSTEM 
defineToggleSwitch("FRONT_OXY_SUPPLY", 2, 3117, 425, "Oxygen System", "FRONT Oxygen Supply")
defineToggleSwitch("BACK_OXY_SUPPLY", 2, 3429, 253, "Oxygen System", "BACK Oxygen Supply")

-- CLOCK
definePushButton("FRONT_CHRONO", 2, 3149, 519, "Clock", "FRONT Chronograph")
definePushButton("FRONT_CLOCK_BTN", 2, 3147, 518, "Clock", "FRONT Set Clock Button")
definePotentiometer("FRONT_CLOCK_KNOB", 2, 3148, 517, {0, 1}, "Clock", "FRONT Set Clock Knob")
definePushButton("BACK_CHRONO", 2, 3433, 811, "Clock", "BACK Chronograph")
definePushButton("BACK_CLOCK_BTN", 2, 3431, 810, "Clock", "BACK Set Clock Button")
definePotentiometer("BACK_CLOCK_KNOB", 2, 3432, 809, {0, 1}, "Clock", "BACK Set Clock Knob")

-- EMERGENCY LANDING GEAR EXTEND
defineToggleSwitch("FRONT_EMERG_GEAR", 2, 3150, 197, "Emergency", "FRONT Emergency Landing Gear Extension")
defineToggleSwitch("BACK_EMERG_GEAR", 2, 3435, 843, "Emergency", "BACK Emergency Landing Gear Extension")

-- EMERGENCY AIR BRAKE RETRACT
definePushButton("FRONT_EMERG_AIRBRAKE", 2, 3151, 147, "Emergency", "FRONT Emergency Air-Brake Retract")
definePushButton("BACK_EMERG_AIRBRAKE", 2, 3436, 831, "Emergency", "BACK Emergency Air-Brake Retract")

-- EMERGENCY AILERON HYD DISCONNECT
defineToggleSwitch("FRONT_EMERG_AILERON_COVER", 2, 3152, 144, "Emergency", "FRONT Aileron Hydraulic Override Cover")
definePushButton("FRONT_EMERG_AILERON", 2, 3153, 145, "Emergency", "FRONT Aileron Hydraulic Override")
defineToggleSwitch("BACK_EMERG_AILERON_COVER", 2, 3466, 829, "Emergency", "BACK Aileron Hydraulic Override Cover")
definePushButton("BACK_EMERG_AILERON", 2, 3467, 830, "Emergency", "BACK Aileron Hydraulic Override")

-- EMERGENCY PITCH TRIM
defineToggleSwitch("FRONT_EMERG_ELEVATOR_TRIM_COVER", 2, 3156, 149, "Emergency", "FRONT Emergency Elevator Trim Switch Cutout Guard")
define3PosTumb("FRONT_EMERG_ELEVATOR_TRIM", 2, 3157, 148, "Emergency", "FRONT Emergency Elevator Trim Switch")
definePushButton("FRONT_PITCH_TRIM_L_TEST_BTN", 2, 3158, 526, "Emergency", "FRONT Pitch Trim Disc Lamp Test Button")
definePotentiometer("FRONT_PITCH_TRIM_L_TEST_KNOB", 2, 3552, 1274, {0, 1}, "Emergency", "FRONT Pitch Trim Disc Lamp Test Knob")
defineTumb("FRONT_SEAT_HEIGHT", 2, 3280, 193, 2, {-1, 1}, nil, false, "Emergency", "FRONT Seat Height Adjustment")
defineToggleSwitch("FRONT_CB_PITCH_TRIM", 2, 3160, 195, "Emergency", "FRONT Pitch Trim Breaker")
defineToggleSwitch("BACK_EMERG_ELEVATOR_TRIM_COVER", 2, 3468, 833, "Emergency", "BACK Emergency Elevator Trim Switch Cutout Guard")
define3PosTumb("BACK_EMERG_ELEVATOR_TRIM", 2, 3469, 832, "Emergency", "BACK Emergency Elevator Trim Switch")
definePushButton("BACK_PITCH_TRIM_L_TEST_BTN", 2, 3470, 534, "Emergency", "BACK Pitch Trim Disc Lamp Test Button")
definePotentiometer("BACK_PITCH_TRIM_L_TEST_KNOB", 2, 3553, 1276, {0, 1}, "Emergency", "BACK Pitch Trim Disc Lamp Test Knob")
defineTumb("BACK_SEAT_HEIGHT", 2, 3471, 841, 2, {-1, 1}, nil, false, "Emergency", "BACK Seat Height Adjustment")

-- RED PANEL LIGHT ADJUSTMENTS
definePotentiometer("FRONT_RED_FLOODLIGHT_L_CONSOLE", 2, 3227, 258, {0, 1}, "Red Panel Lights", "FRONT Red Floodlight Left Console")
definePotentiometer("FRONT_RED_FLOODLIGHT_L_CENTER", 2, 3228, 259, {0, 1}, "Red Panel Lights", "FRONT Red Floodlight Left Center Panel")
definePotentiometer("FRONT_RED_FLOODLIGHT_R_CENTER", 2, 3230, 261, {0, 1}, "Red Panel Lights", "FRONT Red Floodlight Right Center Panel")
definePotentiometer("FRONT_RED_FLOODLIGHT_R_CONSOLE", 2, 3231, 262, {0, 1}, "Red Panel Lights", "FRONT Red Floodlight Right Console")
definePotentiometer("BACK_RED_FLOODLIGHT_L_CONSOLE", 2, 3437, 263, {0, 1}, "Red Panel Lights", "BACK Red Floodlight Left Console")
definePotentiometer("BACK_RED_FLOODLIGHT_L_CENTER", 2, 3438, 264, {0, 1}, "Red Panel Lights", "BACK Red Floodlight Left Center Panel")
definePotentiometer("BACK_RED_FLOODLIGHT_R_CENTER", 2, 3439, 266, {0, 1}, "Red Panel Lights", "BACK Red Floodlight Right Center Panel")
definePotentiometer("BACK_RED_FLOODLIGHT_R_CONSOLE", 2, 3440, 267, {0, 1}, "Red Panel Lights", "BACK Red Floodlight Right Console")

-- MARKER BEACON TEST LIGHTS
definePushButton("FRONT_MARKER_TEST_BTN_OUT", 2, 3167, 528, "Beacon Test", "FRONT Outer Marker Lamp Test Button")
definePotentiometer("FRONT_MARKER_TEST_KNOB_OUT", 2, 3530, 1255, {0, 1}, "Beacon Test", "FRONT Outer Marker Lamp Test Knob")
definePushButton("FRONT_MARKER_TEST_BTN_MID", 2, 3168, 527, "Beacon Test", "FRONT Middle Marker Lamp Test Button")
definePotentiometer("FRONT_MARKER_TEST_KNOB_MID", 2, 3529, 1254, {0, 1}, "Beacon Test", "FRONT Middle Marker Lamp Test Knob")
definePushButton("FRONT_MARKER_TEST_BTN_INN", 2, 3169, 529, "Beacon Test", "FRONT Inner Marker Lamp Test Button")
definePotentiometer("FRONT_MARKER_TEST_KNOB_INN", 2, 3528, 1253, {0, 1}, "Beacon Test", "FRONT Inner Marker Lamp Test Knob")
definePushButton("BACK_MARKER_TEST_BTN_OUT", 2, 3444, 968, "Beacon Test", "BACK Outer Marker Lamp Test Button")
definePotentiometer("BACK_MARKER_TEST_KNOB_OUT", 2, 3533, 1260, {0, 1}, "Beacon Test", "BACK Outer Marker Lamp Test Knob")
definePushButton("BACK_MARKER_TEST_BTN_MID", 2, 3445, 969, "Beacon Test", "BACK Middle Marker Lamp Test Button")
definePotentiometer("BACK_MARKER_TEST_KNOB_MID", 2, 3532, 1259, {0, 1}, "Beacon Test", "BACK Middle Marker Lamp Test Knob")
definePushButton("BACK_MARKER_TEST_BTN_INN", 2, 3446, 970, "Beacon Test", "BACK Inner Marker Lamp Test Button")
definePotentiometer("BACK_MARKER_TEST_KNOB_INN", 2, 3531, 1258, {0, 1}, "Beacon Test", "BACK Inner Marker Lamp Test Knob")

-- INTERCOM PANEL
defineToggleSwitch("FRONT_INTER_INT_SW", 7, 3001, 280, "Intercom", "FRONT Intercom INT Switch")
definePotentiometer("FRONT_INTER_INT_VOL", 7, 3002, 394, {0, 1}, "Intercom", "FRONT Intercom INT Volume")
defineToggleSwitch("FRONT_INTER_VHF_SW", 7, 3003, 282, "Intercom", "FRONT Intercom VHF Switch")
definePotentiometer("FRONT_INTER_VHF_VOL", 7, 3004, 396, {0, 1}, "Intercom", "FRONT Intercom VHF Volume")
defineToggleSwitch("FRONT_INTER_HM_SW", 7, 3005, 283, "Intercom", "FRONT Intercom HM Switch")
definePotentiometer("FRONT_INTER_HM_VOL", 7, 3006, 397, {0, 1}, "Intercom", "FRONT Intercom HM Volume")
defineToggleSwitch("FRONT_INTER_VOR_SW", 7, 3007, 285, "Intercom", "FRONT Intercom VOR Switch")
definePotentiometer("FRONT_INTER_VOR_VOL", 7, 3008, 399, {0, 1}, "Intercom", "FRONT Intercom VOR Volume")
defineToggleSwitch("FRONT_INTER_MK_SW", 7, 3009, 286, "Intercom", "FRONT Intercom MK Switch")
definePotentiometer("FRONT_INTER_MK_VOL", 7, 3010, 400, {0, 1}, "Intercom", "FRONT Intercom MK Volume")
defineToggleSwitch("FRONT_CB_HOTMIC", 7, 3011, 287, "Intercom", "FRONT Circuit Breaker TALK (Hot Mic)")
definePushButton("FRONT_CALL_BTN", 2, 3012, 402, "Intercom", "FRONT Call Button")
definePotentiometer("FRONT_INTER_VOL", 7, 3013, 403, {0, 1}, "Intercom", "FRONT Intercom Volume")
defineToggleSwitch("BACK_INTER_INT_SW", 7, 3024, 884, "Intercom", "BACK Intercom INT Switch")
definePotentiometer("BACK_INTER_INT_VOL", 7, 3025, 894, {0, 1}, "Intercom", "BACK Intercom INT Volume")
defineToggleSwitch("BACK_INTER_VHF_SW", 7, 3026, 886, "Intercom", "BACK Intercom VHF Switch")
definePotentiometer("BACK_INTER_VHF_VOL", 7, 3027, 896, {0, 1}, "Intercom", "BACK Intercom VHF Volume")
defineToggleSwitch("BACK_INTER_HM_SW", 7, 3028, 887, "Intercom", "BACK Intercom HM Switch")
definePotentiometer("BACK_INTER_HM_VOL", 7, 3029, 897, {0, 1}, "Intercom", "BACK Intercom HM Volume")
defineToggleSwitch("BACK_INTER_VOR_SW", 7, 3030, 889, "Intercom", "BACK Intercom VOR Switch")
definePotentiometer("BACK_INTER_VOR_VOL", 7, 3031, 899, {0, 1}, "Intercom", "BACK Intercom VOR Volume")
defineToggleSwitch("BACK_INTER_MK_SW", 7, 3032, 890, "Intercom", "BACK Intercom MK Switch")
definePotentiometer("BACK_INTER_MK_VOL", 7, 3033, 901, {0, 1}, "Intercom", "BACK Intercom MK Volume")
defineToggleSwitch("BACK_CB_HOTMIC", 7, 3034, 891, "Intercom", "BACK Circuit Breaker TALK (Hot Mic)")
definePushButton("BACK_CALL_BTN", 2, 3035, 945, "Intercom", "BACK Call Button")
definePotentiometer("BACK_INTER_VOL", 7, 3036, 946, {0, 1}, "Intercom", "BACK Intercom Volume")

-- MISC FUNCTIONS 
definePushButton("FRONT_ANTISKITD_PW", 2, 3043, 516, "Misc", "FRONT Antiskid ON/OFF")
definePushButton("FRONT_NAV_PRIO", 2, 3119, 336, "Misc", "FRONT NAV Priority")
definePushButton("FRONT_UHF_PRIO", 2, 3162, 334, "Misc", "FRONT UHF Priority")
definePushButton("FRONT_VHF_PRIO", 2, 3163, 335, "Misc", "FRONT VHF Priority")
definePushButton("FRONT_PITOT_PW", 2, 3201, 328, "Misc", "FRONT Pitot Heat ON/OFF")
definePushButton("FRONT_GEAR_MUTE", 2, 3202, 17, "Misc", "FRONT Landing Gear Warning Mute")
definePushButton("FRONT_GEAR_OVER", 2, 3232, 308, "Misc", "FRONT Landing Gear Override")
definePushButton("BACK_ANTISKITD_PW", 2, 3484, 638, "Misc", "BACK Antiskid ON/OFF")
definePushButton("BACK_NAV_PRIO", 2, 3485, 839, "Misc", "BACK NAV Priority")
definePushButton("BACK_UHF_PRIO", 2, 3486, 837, "Misc", "BACK UHF Priority")
definePushButton("BACK_VHF_PRIO", 2, 3487, 838, "Misc", "BACK VHF Priority")
definePushButton("BACK_PITOT_PW", 2, 3488, 940, "Misc", "BACK Pitot Heat ON/OFF")
definePushButton("BACK_GEAR_MUTE", 2, 3489, 770, "Misc", "BACK Landing Gear Warning Mute")
definePushButton("BACK_GEAR_OVER", 2, 3490, 939, "Misc", "BACK Landing Gear Override")
defineToggleSwitch("FRONT_PARK_BRAKE_LVR", 2, 3238, 333, "Misc", "FRONT Parking Brake Lever")
defineToggleSwitch("BACK_PARK_BRAKE_LVR", 2, 3492, 65, "Misc", "BACK Parking Brake Lever")
definePotentiometer("FRONT_RUDDER_ADJ", 2, 3240, 311, {0, 1}, "Misc", "FRONT Adjust Rudder Pedals")
definePotentiometer("BACK_RUDDER_ADJ", 2, 3696, 1202, {0, 1}, "Misc", "BACK Adjust Rudder Pedals")
defineMultipositionSwitch("FRONT_FLAP_SEL", 2, 3224, 14, 3, 0.5,"Misc" ,"FRONT Flap Position Selector")
defineToggleSwitch("FRONT_CPT_EMERG_JETT", 2, 3226, 12, "Misc", "FRONT Canopy Emergency Jettison")
definePotentiometer("FRONT_THROTTLE_FRICTION", 2, 3243, 16, nil, "Misc", "FRONT Throttle Friction")
definePotentiometer("FRONT_HARNESS_CONTROL", 2, 3244, 94, {0, 1}, "Misc", "FRONT Shouldern Harness Control Handle")
defineToggleSwitch("FRONT_EJECT_HANDLE", 2, 3245, 536, "Misc", "FRONT Ejection Handle")
defineToggleSwitch("FRONT_EJECT_HANDLE_COVER", 2, 3246, 538, "Misc", "FRONT Ejection Handle Safety")
defineToggleSwitch("FRONT_MAN_SEPERATION_HANDLE", 2, 3247, 537, "Misc", "FRONT Manual Seperation Handle")
definePotentiometer("FRONT_STORAGE_BOX", 2, 3248, 296, {0, 1}, "Misc", "FRONT Storage Box Cover")
definePotentiometer("FRONT_AIR_VENT", 2, 3249, 101, nil, "Misc", "FRONT Air Vent")
defineToggleSwitch("FRONT_GEAR_HANDLE", 2, 3250, 8, "Misc", "FRONT Landing Gear Handle")
defineMultipositionSwitch("BACK_FLAP_SEL", 2, 3514, 38, 3, 0.5,"Misc" ,"BACK Flap Position Selector")
defineToggleSwitch("BACK_CPT_EMERG_JETT", 2, 3515, 302, "Misc", "BACK Canopy Emergency Jettison")
definePotentiometer("BACK_THROTTLE_FRICTION", 2, 3517, 16, nil, "Misc", "BACK Throttle Friction")
definePotentiometer("BACK_HARNESS_CONTROL", 2, 3518, 523, {0, 1}, "Misc", "BACK Shouldern Harness Control Handle")
defineToggleSwitch("BACK_EJECT_HANDLE", 2, 3519, 520, "Misc", "BACK Ejection Handle")
defineToggleSwitch("BACK_EJECT_HANDLE_COVER", 2, 3520, 521, "Misc", "BACK Ejection Handle Safety")
defineToggleSwitch("BACK_MAN_SEPERATION_HANDLE", 2, 3521, 522, "Misc", "BACK Manual Seperation Handle")
definePotentiometer("BACK_AIR_VENT", 2, 3523, 1230, nil, "Misc", "BACK Air Vent")
defineToggleSwitch("BACK_GEAR_HANDLE", 2, 3524, 75, "Misc", "BACK Landing Gear Handle")
defineFloat("CANOPY_VALUE", 1, {0.0, 1.0}, "Misc", "Canopy Position")

-- WARNING, CAUTION AND INDICATORLIGHTS
defineIndicatorLight("FRONT_TRANS_GEAR_LIGHT", 9, "Warning, Caution and IndicatorLights","FRONT Transition Gear Light (red)")

defineIndicatorLight("FRONT_BACK_COMPUTER_LIGHT", 143, "Warning, Caution and IndicatorLights","FRONT/BACK Computer Light MAN (yellow)")
defineIndicatorLight("FRONT_BACK_ANTI_ICE_LIGHT", 192, "Warning, Caution and IndicatorLights","FRONT/BACK ANTI-ICE Light ON (yellow)")
defineIndicatorLight("FRONT_BACK_ENG_START_TLIGHT", 140, "Warning, Caution and IndicatorLights","FRONT/BACK Engine Start Test Light (yellow)")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(227)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(243)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(88)*65535)
end, 65535, "External Aircraft Model", "Formation Lights")


defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

defineIntegerFromGetter("EXT_STROBE_TOP", function()
	if LoGetAircraftDrawArgumentValue(88) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Strobe Light")



--------------------------------------- FORWARD COCKPIT ONLY FUNCTIONS ------------------------------------
-- PRESSURIZATION/AIRCON SYSTEM 
defineMultipositionSwitch("FRONT_AIR_COND_MASTER", 2, 3120, 419, 3, 0.5,"Aircon System" ,"FRONT Air-Conditioning Master Switch")
defineToggleSwitch("FRONT_AIR_FLOW_MODE", 2, 3121, 420, "Aircon System", "FRONT Air Flow Mode")
defineToggleSwitch("FRONT_EMERG_VENT", 2, 3122, 421, "Aircon System", "FRONT Emergency Ventilation")
defineToggleSwitch("FRONT_TEMP_MODE", 2, 3123, 422, "Aircon System", "FRONT Temperatur Mode")
definePotentiometer("FRONT_TEMP_REGULATOR", 2, 3124, 423, {0, 1}, "Aircon System", "FRONT Temperatur Regulation Control")
defineTumb("FRONT_TEMP_CONTROL_MAN", 2, 3125, 424, 2, {-1, 1}, nil, false, "Aircon System", "FRONT Manual Temperatur Control")

-- STALL SYSTEM 
defineTumb("FRONT_STALL_WARN_TEST", 2, 3199, 331, 2, {-1, 1}, nil, false, "Stall System", "FRONT Stall Warning Test")
defineToggleSwitch("FRONT_STALL_WARN_PW", 2, 3200, 332, "Stall System", "FRONT Stall Warning Power")

-- IFF PANEL 
defineMultipositionSwitch("FRONT_IFF_CODE_SEL", 2, 3203, 346, 4, 0.25,"IFF" ,"FRONT IFF Code Selector")
defineMultipositionSwitch("FRONT_IFF_MASTER_SW", 2, 3204, 347, 5, 0.25,"IFF" ,"FRONT IFF Master Switch")
defineMultipositionSwitch("FRONT_IFF_AUDIO_LIGHT", 2, 3205, 348, 3, 0.5,"IFF" ,"FRONT IFF Audio Light Switch")
defineToggleSwitch("FRONT_IFF_TEST_M1", 2, 3206, 349, "IFF", "FRONT IFF TEST M-1 Switch")
defineToggleSwitch("FRONT_IFF_TEST_M2", 2, 3207, 350, "IFF", "FRONT IFF TEST M-2 Switch")
defineToggleSwitch("FRONT_IFF_TEST_M3", 2, 3208, 351, "IFF", "FRONT IFF TEST M-3/A Switch")
defineToggleSwitch("FRONT_IFF_TEST_MC", 2, 3209, 352, "IFF", "FRONT IFF TEST M/C Switch")
defineMultipositionSwitch("FRONT_IFF_RAD_TEST", 2, 3210, 353, 3, 0.5,"IFF" ,"FRONT IFF RAD Test Switch")
defineToggleSwitch("FRONT_IFF_MODE4", 2, 3211, 354, "IFF", "FRONT IFF Mode 4")
defineMultipositionSwitch("FRONT_IFF_MODE1_X0", 2, 3212, 355, 10, 0.1,"IFF" ,"FRONT IFF MODE 1 - X0")
defineMultipositionSwitch("FRONT_IFF_MODE1_0X", 2, 3213, 356, 10, 0.1,"IFF" ,"FRONT IFF MODE 1 - 0X")
defineMultipositionSwitch("FRONT_IFF_MODE3_X000", 2, 3214, 357, 10, 0.1,"IFF" ,"FRONT IFF MODE 3 - X000")
defineMultipositionSwitch("FRONT_IFF_MODE3_0X00", 2, 3215, 358, 10, 0.1,"IFF" ,"FRONT IFF MODE 3 - 0X00")
defineMultipositionSwitch("FRONT_IFF_MODE3_00X0", 2, 3216, 359, 10, 0.1,"IFF" ,"FRONT IFF MODE 3 - 00X0")
defineMultipositionSwitch("FRONT_IFF_MODE3_000X", 2, 3217, 360, 10, 0.1,"IFF" ,"FRONT IFF MODE 3 - 000X")
definePushButton("FRONT_IFF_REPLY_TEST_BTN", 2, 3218, 530, "IFF", "FRONT IFF Reply Lamp Test Button")
definePotentiometer("FRONT_IFF_REPLY_TEST_KNOB", 2, 3534, 1256, {0, 1}, "IFF", "FRONT IFF Reply Lamp Test Knob")
definePushButton("FRONT_IFF_TEST_BTN", 2, 3219, 531, "IFF", "FRONT IFF Test Button")
definePotentiometer("FRONT_IFF_TEST_KNOB", 2, 3535, 1257, {0, 1}, "IFF", "FRONT IFF Test Knob")
defineMultipositionSwitch("FRONT_IFF_IDENT", 2, 3220, 361, 3, 0.5,"IFF" ,"FRONT IFF Ident Switch")

-- MISC FUNCTIONS
defineToggleSwitch("FRONT_MIRROR", 2, 3239, 10, "Misc", "FRONT Mirror")
defineToggleSwitch("FRONT_COMPASS_LIGHT", 2, 3252, 850, "Misc", "FRONT Compass Light Switch")
defineToggleSwitch("FRONT_PITCH_TRIM_TONE_MUTE", 2, 3236, 196, "Misc", "FRONT Pitch Trim Tone Mute")
definePushButton("FRONT_ANTI_RAIN", 2, 3222, 314, "Misc", "FRONT Anti-Rain Fluid")
definePotentiometer("FRONT_IFR_Hood", 2, 3557, 256, {0, 1}, "Misc", "FRONT IFR Hood")

--------------------------------------- REAR COCKPIT ONLY FUNCTIONS ---------------------------------------
-- OXYGEN SYSTEM 
defineToggleSwitch("BACK_OXY_PRESS_WARN_SW", 2, 3527, 1196, "Misc", "BACK Oxygen Pressure Waring Switch")

-- IFR hood 
defineToggleSwitch("BACK_IFR_HOOD", 2, 3551, 329, "Misc", "BACK IFR Hood Close/Open")

-- UNKNOWN BUTTONS/SWITCHES
defineToggleSwitch("BACK_EJECT_PRIO_LEVER", 2, 3691, 1182, "Misc", "BACK Ejection Seat Priority Lever")
definePotentiometer("BACK_STORAGE_BOX", 2, 3522, 299, {0, 1}, "Misc", "BACK Storage Box Cover")

--================================================================ C-101CC COCKPIT ==================================================================
-- MANUAL POWER RESERVE (MPR)
definePushButton("CC_FRONT_MRP_LAMP_TEST_BTN", 2, 3702, 1312, "MRP", "C-101CC FRONT MPR Lamp Test Button")
definePotentiometer("CC_FRONT_MRP_LAMP_TEST_KNB", 2, 3704, 1313, {0, 1}, "MRP", "C-101CC FRONT MPR Lamp Test Knob")
definePushButton("CC_BACK_MRP_LAMP_TEST_BTN", 2, 3703, 1317, "MRP", "C-101CC BACK MPR Lamp Test Button")
definePotentiometer("CC_BACK_MRP_LAMP_TEST_KNB", 2, 3705, 1318, {0, 1}, "MRP", "C-101CC BACK MPR Lamp Test Knob")

-- FLIGHT DIRECTOR 
definePushButton("CC_FRONT_FD_HDG_MODE", 2, 3171, 210, "Flight Director", "C-101CC FRONT Flight Director Heading Mode")
definePushButton("CC_FRONT_FD_ALT_MODE", 2, 3172, 215, "Flight Director", "C-101CC FRONT Flight Director Altitude Mode")
definePushButton("CC_FRONT_FD_NAV_MODE", 2, 3174, 211, "Flight Director", "C-101CC FRONT Flight Director Navigation Mode")
definePushButton("CC_FRONT_FD_APP_MODE", 2, 3175, 212, "Flight Director", "C-101CC FRONT Flight Director Approach Mode")
definePushButton("CC_FRONT_FD_BCRS_MODE", 2, 3176, 213, "Flight Director", "C-101CC FRONT Flight Director Back Course Mode")
definePushButton("CC_FRONT_FD_VOR_APP_MODE", 2, 3177, 214, "Flight Director", "C-101CC FRONT Flight Director VOR Approach Mode")
definePushButton("CC_FRONT_FD_VSPD_MODE", 2, 3178, 217, "Flight Director", "C-101CC FRONT Flight Director Vertical Speed Mode")
definePushButton("CC_FRONT_FD_IASPD_MODE", 2, 3179, 218, "Flight Director", "C-101CC FRONT Flight Director Indicated Air Speed Mode")
definePushButton("CC_FRONT_FD_STBY_MODE", 2, 3170, 219, "Flight Director", "C-101CC FRONT Flight Director Standby Mode")
definePotentiometer("CC_FRONT_FD_BRIGHT", 2, 3195, 343, {0, 1}, "Flight Director", "C-101CC FRONT Outer Flight Director Panel Brightnes Knob")
definePotentiometer("CC_BACK_FD_BRIGHT", 2, 3661, 916, {0, 1}, "Flight Director", "C-101CC BACK Outer Flight Director Panel Brightnes Knob")

-- V/UHF RADIO 
defineMultipositionSwitch("CC_FRONT_UHF_SEL100", 10, 3002, 226, 3, 0.1,"UHF Radio" ,"C-101CC FRONT UHF Radio 100 MHz Selector")
defineMultipositionSwitch("CC_FRONT_UHF_SEL10", 10,3003,227,11,0.1,"UHF Radio" ,"C-101CC FRONT UHF Radio 10 MHz Selector")
defineMultipositionSwitch("CC_FRONT_UHF_SEL1", 10,3004,228,11,0.1,"UHF Radio" ,"C-101CC FRONT UHF Radio 1 MHz Selector")
defineMultipositionSwitch("CC_FRONT_UHF_SEL01", 10,3005,229,11,0.1,"UHF Radio" ,"C-101CC FRONT UHF Radio 0.1 MHz Selector")
defineMultipositionSwitch("CC_FRONT_UHF_SEL0025", 10,3006,230,5,0.25,"UHF Radio" ,"C-101CC FRONT UHF Radio 0.025 MHz Selector")
defineMultipositionSwitch("CC_FRONT_UHF_PRESET", 10,3011,231,21,0.05,"UHF Radio" ,"C-101CC FRONT UHF Radio Preset Channel Selector")
defineMultipositionSwitch("CC_FRONT_UHF_FUNCT", 10,3007,232,4,0.1,"UHF Radio" ,"C-101CC FRONT UHF Radio Function Dial")
defineMultipositionSwitch("CC_FRONT_UHF_FREQU", 10,3008,233,3,0.5,"UHF Radio" ,"C-101CC FRONT UHF Radio Frequency Mode Dial")
defineToggleSwitch("CC_FRONT_UHF_TEST", 10, 3001, 234, "UHF Radio", "C-101CC FRONT UHF Radio Test Selector Switch")
defineToggleSwitch("CC_FRONT_UHF_SQL", 10, 3009, 236, "UHF Radio", "C-101CC FRONT UHF Radio Squelch Switch")
defineToggleSwitch("CC_FRONT_UHF_POWER", 10, 3010, 235, "UHF Radio", "C-101CC FRONT UHF Radio Power Transmit Selector Switch")
defineMultipositionSwitch("CC_BACK_UHF_SEL100", 10,3022,862,3,0.1,"UHF Radio" ,"C-101CC BACK UHF Radio 100 MHz Selector")
defineMultipositionSwitch("CC_BACK_UHF_SEL10", 10,3023,863,11,0.1,"UHF Radio" ,"C-101CC BACK UHF Radio 10 MHz Selector")
defineMultipositionSwitch("CC_BACK_UHF_SEL1", 10,3024,864,11,0.1,"UHF Radio" ,"C-101CC BACK UHF Radio 1 MHz Selector")
defineMultipositionSwitch("CC_BACK_UHF_SEL01", 10,3025,865,11,0.1,"UHF Radio" ,"C-101CC BACK UHF Radio 0.1 MHz Selector")
defineMultipositionSwitch("CC_BACK_UHF_SEL0025", 10,3026,866,5,0.25,"UHF Radio" ,"C-101CC BACK UHF Radio 0.025 MHz Selector")
defineMultipositionSwitch("CC_BACK_UHF_PRESET", 10,3031,867,21,0.05,"UHF Radio" ,"C-101CC BACK UHF Radio Preset Channel Selector")
defineMultipositionSwitch("CC_BACK_UHF_FUNCT", 10,3027,868,4,0.1,"UHF Radio" ,"C-101CC BACK UHF Radio Function Dial")
defineMultipositionSwitch("CC_BACK_UHF_FREQU", 10,3028,869,3,0.5,"UHF Radio" ,"C-101CC BACK UHF Radio Frequency Mode Dial")
defineToggleSwitch("CC_BACK_UHF_TEST", 10, 3021, 875, "UHF Radio", "C-101CC BACK UHF Radio Test Selector Switch")
defineToggleSwitch("CC_BACK_UHF_SQL", 10, 3029,872, "UHF Radio", "C-101CC BACK UHF Radio Squelch Switch")
defineToggleSwitch("CC_BACK_UHF_POWER", 10, 3030,876, "UHF Radio", "C-101CC BACK UHF Radio Power Transmit Selector Switch")	

-- VHF COMM/NAV 
defineMultipositionSwitch("CC_FRONT_VHF_COMM_PW", 9,3004,653,3,0.5,"VHF" ,"C-101CC FRONT VHF COMM Switch OFF/PWR/TEST")
defineMultipositionSwitch("CC_FRONT_VHF_COMM_FREQ_100", 9,3001,640,35,0.01,"VHF" ,"C-101CC FRONT VHF COMM Frequency Control 100 MHz")
definePotentiometer("CC_FRONT_VHF_COMM_VOL", 9, 3003, 655, {0, 1}, "VHF", "C-101CC FRONT VHF COMM Volume Control")	
defineMultipositionSwitch("CC_FRONT_VHF_COMM_FREQ_10", 9,3002,641,40,0.025,"VHF" ,"C-101CC FRONT VHF COMM Frequency Control 10 kHz")
define3PosTumb("CC_FRONT_VHF_NAV_TEST", 2,3355,650, "VHF", "C-101CC FRONT VHF NAV Test Switch")
defineMultipositionSwitch("CC_FRONT_VHF_NAV_CONTROL", 11,3004,657,5,0.25,"VHF" ,"C-101CC FRONT VHF NAV Control Switch")
defineMultipositionSwitch("CC_FRONT_VHF_NAV_FREQ_1", 11,3001,645,35,0.01,"VHF" ,"C-101CC FRONT VHF NAV Frequency Control 1 MHz")
definePotentiometer("CC_FRONT_VHF_NAV_VOL", 11, 3003, 659, {0, 1}, "VHF", "C-101CC FRONT VHF NAV Volume Control")	
defineMultipositionSwitch("CC_FRONT_VHF_NAV_FREQ_50", 11,3002,646,40,0.025,"VHF" ,"C-101CC FRONT VHF NAV Frequency Control 50 kHz")
defineMultipositionSwitch("CC_BACK_VHF_COMM_PW", 9,3014,917,3,0.5,"VHF" ,"C-101CC BACK VHF COMM Switch OFF/PWR/TEST")
defineMultipositionSwitch("CC_BACK_VHF_COMM_FREQ_1", 9,3001,904,35,0.01,"VHF" ,"C-101CC BACK VHF COMM Frequency Control 1 MHz")
definePotentiometer("CC_BACK_VHF_COMM_VOL", 9, 3003, 919, {0, 1}, "VHF", "C-101CC BACK VHF COMM Volume Control")	
defineMultipositionSwitch("CC_BACK_VHF_COMM_FREQ_10", 9,3002,905,40,0.025,"VHF" ,"C-101CC BACK VHF COMM Frequency Control 0.025 MHz")
defineToggleSwitch("CC_BACK_VHF_NAV_TEST", 2,3628,915, "VHF", "C-101CC BACK VHF NAV Test Switch")
defineMultipositionSwitch("CC_BACK_VHF_NAV_CONTROL", 11,3014,921,5,0.25,"VHF" ,"C-101CC BACK VHF NAV Control Switch")
defineMultipositionSwitch("CC_BACK_VHF_NAV_FREQ_1", 11,3011,906,35,0.01,"VHF" ,"C-101CC BACK VHF NAV Frequency Control 1 MHz")
definePotentiometer("CC_BACK_VHF_NAV_VOL", 11, 3013, 923, {0, 1}, "VHF", "C-101CC BACK VHF NAV Volume Control")	
defineMultipositionSwitch("CC_BACK_VHF_NAV_FREQ_50", 11,3012,907,40,0.025,"VHF" ,"C-101CC BACK VHF NAV Frequency Control 50 kHz")

-- INTERCOM PANEL
definePushButton("CC_FRONT_INTER_ADF_BTN", 7, 3014, 849, "Intercom", "C-101CC FRONT Intercom ADF Switch (push)")
definePotentiometer("CC_FRONT_INTER_ADF_KNB", 7, 3015, 853, {0, 1}, "Intercom", "C-101CC FRONT Intercom ADF Switch (turn)")
definePushButton("CC_FRONT_INTER_DME_BTN", 7, 3016, 284, "Intercom", "C-101CC FRONT Intercom DME Switch (push)")
definePotentiometer("CC_FRONT_INTER_DME_KNB", 7, 3017, 398, {0, 1}, "Intercom", "C-101CC FRONT Intercom DME Switch (turn)")
definePushButton("CC_FRONT_INTER_VUHF_BTN", 7, 3018, 268, "Intercom", "C-101CC FRONT Intercom V/UHF Switch (push)")
definePotentiometer("CC_FRONT_INTER_VUHF_KNB", 7, 3019, 269, {0, 1}, "Intercom", "C-101CC FRONT Intercom V/UHF Switch (turn)")
defineMultipositionSwitch("CC_FRONT_INTER_MAIN_SEL", 7,3020,404,7,0.1,"Intercom" ,"C-101CC FRONT Intercom Main Mode Selector")
definePushButton("CC_BACK_INTER_ADF_BTN", 7, 3037, 1140, "Intercom", "C-101CC BACK Intercom ADF Switch (push)")
definePotentiometer("CC_BACK_INTER_ADF_KNB", 7, 3038, 1141, {0, 1}, "Intercom", "C-101CC BACK Intercom ADF Switch (turn)")
definePushButton("CC_BACK_INTER_DME_BTN", 7, 3039, 888, "Intercom", "C-101CC BACK Intercom DME Switch (push)")
definePotentiometer("CC_BACK_INTER_DME_KNB", 7, 3040, 898, {0, 1}, "Intercom", "C-101CC BACK Intercom DME Switch (turn)")
definePushButton("CC_BACK_INTER_VUHF_BTN", 7, 3041, 1109, "Intercom", "C-101CC BACK Intercom V/UHF Switch (push)")
definePotentiometer("CC_BACK_INTER_VUHF_KNB", 7, 3042, 1110, {0, 1}, "Intercom", "C-101CC BACK Intercom V/UHF Switch (turn)")
defineMultipositionSwitch("CC_BACK_INTER_MAIN_SEL", 7,3043,947,7,0.1,"Intercom" ,"C-101CC BACK Intercom Main Mode Selector")

-- ADI KNOB 
definePushButton("CC_FRONT_ADI_TEST", 2,3346,683, "ADI", "C-101CC FRONT ADI Test Switch")
definePotentiometer("CC_FRONT_ADI_DH_SET", 2, 3347, 412, {0, 1}, "ADI", "C-101CC FRONT Decision Height Setting")
definePotentiometer("CC_FRONT_ADI_HSI_BRIGHT", 2, 3161, 411, {0, 1}, "ADI", "C-101CC FRONT ADI/HSI Digital Displays Brightness")
definePushButton("CC_BACK_ADI_TEST", 2,3600,1045, "ADI", "C-101CC BACK ADI Test Switch")
definePotentiometer("CC_BACK_ADI_DH_SET", 2, 3601, 924, {0, 1}, "ADI", "C-101CC BACK Decision Height Setting")
definePotentiometer("CC_BACK_ADI_HSI_BRIGHT", 2, 3443, 923, {0, 1}, "ADI", "C-101CC BACK ADI/HSI Digital Displays Brightness")

-- STANDBY ALTIMETER 
definePotentiometer("CC_FRONT_STBY_ALT_BARO", 2, 3344, 620, {0, 1}, "Standby Altimeter", "C-101CC FRONT Standby Altimeter Baro Adjust")
definePushButton("CC_FRONT_STBY_ALT_TAP", 2, 3549, 1190, "Standby Altimeter", "C-101CC FRONT Standby Altimeter Tap Glass")
definePotentiometer("CC_BACK_STBY_ALT_BARO", 2, 3605, 1021, {0, 1}, "Standby Altimeter", "C-101CC BACK Standby Altimeter Baro Adjust")
definePushButton("CC_BACK_STBY_ALT_TAP", 2, 3550, 1191, "Standby Altimeter", "C-101CC BACK Standby Altimeter Tap Glass")

-- AHRS CONTROL PANEL 	
defineToggleSwitch("CC_FRONT_DME_SEL", 11,3006,340, "AHRS", "C-101CC FRONT DME Selector")
defineToggleSwitch("CC_FRONT_RADAR_ALT", 2,3028,341, "AHRS", "C-101CC FRONT Radio Altimeter")
defineMultipositionSwitch("CC_FRONT_AHRS_EMERG_LOC_TRANS", 2,3026,339,3,0.5,"AHRS" ,"C-101CC FRONT AHRS Emergency Locator Tranmsitter")
defineToggleSwitch("CC_BACK_DME_SEL", 11,3016,965, "AHRS", "C-101CC BACK DME Selector")
definePushButton("CC_BACK_AHRS_FAST_ERECT",2,3512,966, "AHRS", "C-101CC BACK AHRS Fast Erect")

-- SCAR DISPLAY UNIT
defineMultipositionSwitch("CC_FRONT_SCAR_GUN_LOAD", 2,3270,569,10,0.11,"SCAR" ,"C-101CC FRONT SCAR Initial Cannon Load")
definePushButton("CC_FRONT_SCAR_MODE_SEL_BTN", 2,3271,573, "SCAR", "C-101CC FRONT SCAR Mode Selector/Cancel Button")
defineMultipositionSwitch("CC_BACK_SCAR_GUN_LOAD", 2,3637,1285,10,0.11,"SCAR" ,"C-101CC BACK SCAR Initial Cannon Load")
definePushButton("CC_BACK_SCAR_MODE_SEL_BTN", 2,3638,1289, "SCAR", "C-101CC BACK SCAR Mode Selector/Cancel Button")
definePushButton("CC_FRONT_SCAR_EMERG_JETT", 2,3268,567, "SCAR", "C-101CC FRONT SCAR Emergency Jettison")
definePushButton("CC_FRONT_SCAR_LIGHT_TEST", 2,3269,568, "SCAR", "C-101CC FRONT SCAR Light Test")
definePushButton("CC_FRONT_BACK_EMERG_JETT", 2,3639,597, "SCAR", "C-101CC BACK SCAR Emergency Jettison")
definePushButton("CC_FRONT_BACK_LIGHT_TEST", 2,3640,598, "SCAR", "C-101CC BACK SCAR Light Test")

-- COLIMADOR
definePotentiometer("CC_FRONT_HUD_SIGHT_BRIGHT", 2,3310,722, {0, 1}, "Colimador", "C-101CC FRONT Sight Brightness")
defineMultipositionSwitch("CC_FRONT_HUD_VIDEO", 2,3312,720,3,0.5,"Colimador" ,"C-101CC FRONT Video ON/STB/OFF")
defineMultipositionSwitch("CC_FRONT_HUD_DEPRESS_0XX", 2,3314,587,10,0.1,"Colimador" ,"C-101CC FRONT HUD Depression 0XX")
defineMultipositionSwitch("CC_FRONT_HUD_DEPRESS_X0X", 2,3315,588,10,0.1,"Colimador" ,"C-101CC FRONT HUD Depression X0X")
defineMultipositionSwitch("CC_FRONT_HUD_DEPRESS_XX0", 2,3316,589,10,0.1,"Colimador" ,"C-101CC FRONT HUD Depression XX0")
defineMultipositionSwitch("CC_FRONT_HUD_DEPRESS_MODE", 2,3317,590,3,0.5,"Colimador" ,"C-101CC FRONT HUD Depression AUTO/MAN/TEST")
defineToggleSwitch("CC_FRONT_HUD_SIGHT", 2,3318,591, "Colimador", "C-101CC FRONT Optical Sight ON/OFF")
definePotentiometer("CC_BACK_HUD_SIGHT_BRIGHT", 2,3654,713, {0, 1}, "Colimador", "C-101CC BACK Sight Brightness")

-- MISC FUNCTIONS
definePotentiometer("CC_FRONT_SIGHT_SUN_FILTER", 3,3670,1112, {0, 1}, "Misc", "C-101CC FRONT Gunsight Sun Filter")
definePotentiometer("CC_BACK_SIGHT_SUN_FILTER", 3,3671,1113, {0, 1}, "Misc", "C-101CC BACK Gunsight Sun Filter")
definePushButton("CC_FRONT_ALT_TEST_ADJ", 2,3364,607, "Misc", "C-101CC FRONT Altimeter Test Adjust")
definePushButton("CC_BACK_ALT_TEST_ADJ", 2,3658,798, "Misc", "C-101CC BACK Altimeter Test Adjust")
definePushButton("CC_FRONT_HSI_BEARING_SEL", 2,3349,689, "Misc", "C-101CC FRONT HSI Bearing Select Button")
definePushButton("CC_BACK_HSI_BEARING_SEL", 2,3349,689, "Misc", "C-101CC BACK HSI Bearing Select Button")
defineToggleSwitch("CC_FRONT_CANOPY_EMERG_FRAC", 2,3343,294, "Misc", "C-101CC FRONT Canopy Emergency Fracturing")
defineToggleSwitch("CC_BACK_CANOPY_EMERG_FRAC", 2,3652,277, "Misc", "C-101CC BACK Canopy Emergency Fracturing")
defineToggleSwitch("CC_FRONT_RUDDER_TRIM_SW", 2, 3350, 717, "Misc", "C-101CC FRONT Rudder Trim Switch")
defineToggleSwitch("CC_BACK_RUDDER_TRIM_SW", 2, 3604, 1105, "Misc", "C-101CC BACK Rudder Trim Switch")
defineMultipositionSwitch("CC_FRONT_UHF_ANT_SEL", 2,3221,338,3,0.5,"Misc" ,"C-101CC FRONT UHF Antenna Selection")

-- WARNING, CAUTION AND INDICATORLIGHTS
defineIndicatorLight("CC_FRONT_MRP_LAMP", 1314, "Warning, Caution and IndicatorLights","C-101CC FRONT MPR Lamp (yellow)")
defineIndicatorLight("CC_BACK_MRP_LAMP", 1319, "Warning, Caution and IndicatorLights","C-101CC BACK MPR Lamp (yellow)")
defineIndicatorLight("CC_FRONT_TELEBRIEFING_LAMP", 719, "Warning, Caution and IndicatorLights","C-101CC FRONT Telebriefing Lamp (yellow)")

--------------------------------------- FORWARD COCKPIT ONLY FUNCTIONS ------------------------------------
-- SCAR CONTROL UNIT 
defineToggleSwitch("CC_FRONT_SCAR_MASTER_MODE_COVER", 2,3254,690, "SCAR", "C-101CC FRONT SCAR Master Mode Cover")
defineMultipositionSwitch("CC_FRONT_SCAR_MASTER_MODE", 2,3255,691,3,0.5,"SCAR" ,"C-101CC FRONT SCAR Master Mode")
defineToggleSwitch("CC_FRONT_SCAR_MASTER_ARM", 2,3256,692, "SCAR", "C-101CC FRONT SCAR Master Arm")
defineMultipositionSwitch("CC_FRONT_SCAR_BOMB_ARM", 2,3257,693,4,0.33,"SCAR" ,"C-101CC FRONT SCAR Bomb Arming Selector")
defineMultipositionSwitch("CC_FRONT_SCAR_MODE_SEL", 2,3258,694,8,0.142,"SCAR" ,"C-101CC FRONT SCAR Mode Selector")
defineMultipositionSwitch("CC_FRONT_SCAR_RIPPLE", 2,3259,695,5,0.25,"SCAR" ,"C-101CC FRONT SCAR Ripple Time")
defineMultipositionSwitch("CC_FRONT_SCAR_SEL_JETT_SEL", 2,3260,696,4,0.33,"SCAR" ,"C-101CC FRONT SCAR Selective Jettison Selector")
definePushButton("CC_FRONT_SCAR_SEL_JETT", 2,3261,697, "SCAR", "C-101CC FRONT SCAR Selective Jettison")
definePushButton("CC_FRONT_SCAR_PYLON_1", 2,3262,542, "SCAR", "C-101CC FRONT SCAR Select Pylon #1")
definePushButton("CC_FRONT_SCAR_PYLON_2", 2,3263,543, "SCAR", "C-101CC FRONT SCAR Select Pylon #2")
definePushButton("CC_FRONT_SCAR_PYLON_3", 2,3264,544, "SCAR", "C-101CC FRONT SCAR Select Pylon #3")
definePushButton("CC_FRONT_SCAR_PYLON_4", 2,3265,545, "SCAR", "C-101CC FRONT SCAR Select Pylon #4")
definePushButton("CC_FRONT_SCAR_PYLON_5", 2,3266,546, "SCAR", "C-101CC FRONT SCAR Select Pylon #5")
definePushButton("CC_FRONT_SCAR_PYLON_6", 2,3267,547, "SCAR", "C-101CC FRONT SCAR Select Pylon #6")

-- ADF
definePotentiometer("CC_FRONT_ADF_FREQ_L_100", 12,3001,661, {0, 1}, "Misc", "C-101CC FRONT ADF Left Frequency Selector 100 kHz")
definePotentiometer("CC_FRONT_ADF_FREQ_L_10", 12,3002,662, {0, 1}, "Misc", "C-101CC FRONT ADF Left Frequency Selector 10 kHz")
definePotentiometer("CC_FRONT_ADF_FREQ_L_05", 12,3003,663, {0, 1}, "Misc", "C-101CC FRONT ADF Left Frequency Selector 0.5 kHz")
definePotentiometer("CC_FRONT_ADF_FREQ_R_100", 12,3004,666, {0, 1}, "Misc", "C-101CC FRONT ADF Right Frequency Selector 100 kHz")
definePotentiometer("CC_FRONT_ADF_FREQ_R_10", 12,3005,668, {0, 1}, "Misc", "C-101CC FRONT ADF Right Frequency Selector 10 kHz")
definePotentiometer("CC_FRONT_ADF_FREQ_R_05", 12,3006,669, {0, 1}, "Misc", "C-101CC FRONT ADF Right Frequency Selector 0.5 kHz")
defineMultipositionSwitch("CC_FRONT_ADF_FUNC", 12,3007,677,4,0.1,"Misc" ,"C-101CC FRONT ADF Function Selector Switch")
definePotentiometer("CC_FRONT_ADF_GAIN", 12,3009,678, {0, 1}, "Misc", "C-101CC FRONT ADF Gain Control")
defineToggleSwitch("CC_FRONT_ADF_TONE_SW", 12, 3010, 679, "ADF", "C-101CC FRONT ADF Tone Switch")
defineToggleSwitch("CC_FRONT_ADF_TRANS_SW", 12, 3011, 680, "ADF", "C-101CC FRONT ADF Transfer Switch")

-- GYROSCOPE PLATFORM 
defineMultipositionSwitch("CC_FRONT_GYRO_FUNC_SEL", 2,3321,728,3,0.5,"Gyro" ,"C-101CC FRONT Gyro Function Selector")
definePushButton("CC_FRONT_GYRO_SYNC_HDG_SET_BTN", 2, 3324, 1305, "Gyro", "C-101CC FRONT Gyro Synchnonizer and Heading Set Button")
definePotentiometer("CC_FRONT_GYRO_SYNC_HDG_SET_KNB", 2,3322,729, {0,1}, "Gyro", "C-101CC FRONT Gyro Synchnonizer and Heading Set Knob")
definePotentiometer("CC_FRONT_GYRO_LAT_CORR", 2,3323,730, {0,1}, "Gyro", "C-101CC FRONT Gyro Latitude Correction")
definePushButton("CC_FRONT_GYRO_FAST_ERECT", 2,3325,732, "Gyro", "C-101CC FRONT Gyro Fast Erect")
defineMultipositionSwitch("CC_FRONT_GYRO_MAG_VAR", 2,3326,733,3,0.5,"Gyro" ,"C-101CC FRONT Gyro Mag Var Control")
defineToggleSwitch("CC_FRONT_GYRO_HEMI_SW", 2,3327,734, "Gyro", "C-101CC FRONT Gyro Hemisphere Switch")

-- WEAPONS
defineToggleSwitch("CC_FRONT_WP_PYLON_OR", 2,3329,699, "Weapons", "C-101CC FRONT Weapon Switch Pylon Outer Right")
defineToggleSwitch("CC_FRONT_WP_PYLON_MR", 2,3330,700, "Weapons", "C-101CC FRONT Weapon Switch Pylon Mid Right")
defineToggleSwitch("CC_FRONT_WP_PYLON_IR", 2,3331,701, "Weapons", "C-101CC FRONT Weapon Switch Pylon Inner Right")
defineToggleSwitch("CC_FRONT_WP_EMERG", 2,3332,702, "Weapons", "C-101CC FRONT Weapon Switch Emergency")
defineToggleSwitch("CC_FRONT_WP_NORM", 2,3333,703, "Weapons", "C-101CC FRONT Weapon Switch Normal")
defineToggleSwitch("CC_FRONT_WP_SIGHT_115", 2,3335,705, "Weapons", "C-101CC FRONT Weapon Switch Sight 115V AC")
defineToggleSwitch("CC_FRONT_WP_PYLON_OL", 2,3336,706, "Weapons", "C-101CC FRONT Weapon Switch Pylon Outer Left")
defineToggleSwitch("CC_FRONT_WP_PYLON_ML", 2,3337,707, "Weapons", "C-101CC FRONT Weapon Switch Pylon Mid Left")
defineToggleSwitch("CC_FRONT_WP_PYLON_IL", 2,3338,708, "Weapons", "C-101CC FRONT Weapon Switch Pylon Inner Left")
defineToggleSwitch("CC_FRONT_WP_GUN_1", 2,3339,709, "Weapons", "C-101CC FRONT Weapon Switch Machine Gun 1")
defineToggleSwitch("CC_FRONT_WP_GUN_2", 2,3340,710, "Weapons", "C-101CC FRONT Weapon Switch Machine Gun 2")
defineToggleSwitch("CC_FRONT_WP_ARM", 2,3341,711, "Weapons", "C-101CC FRONT Weapon Switch Arming Control")
defineToggleSwitch("CC_FRONT_WP_SIGHT_CAM", 2,3342,712, "Weapons", "C-101CC FRONT Weapon Switch Sight Camera")
defineToggleSwitch("CC_FRONT_WP_UHF_RACAL", 2,3680,704, "Weapons", "C-101CC FRONT Weapon Switch UHF Racal")

-- CIRCUIT BREAKERS 
defineToggleSwitch("CC_FRONT_CB_GYRO", 2,3538,436, "CB Panel", "C-101CC FRONT Circuit Breaker Gyro Platform")
defineToggleSwitch("CC_FRONT_CB_DME", 2,3539,437, "CB Panel", "C-101CC FRONT Circuit Breaker DME")
defineToggleSwitch("CC_FRONT_CB_FD", 2,3291,593, "CB Panel", "C-101CC FRONT Circuit Breaker Flight Director")
defineToggleSwitch("CC_FRONT_CB_IFF", 2,3292,594, "CB Panel", "C-101CC FRONT Circuit Breaker IFF")
defineToggleSwitch("CC_FRONT_CB_VHF", 2,3092,532, "CB Panel", "C-101CC FRONT Circuit Breaker VHF")
defineToggleSwitch("CC_FRONT_CB_RADIO_ALT", 2,3540,455, "CB Panel", "C-101CC FRONT Circuit Breaker Radio Altimeter")
defineToggleSwitch("CC_FRONT_CB_ADF_DC", 2,3543,465, "CB Panel", "C-101CC FRONT Circuit Breaker ADF DC")
defineToggleSwitch("CC_FRONT_CB_UVHF", 2,3095,466, "CB Panel", "C-101CC FRONT Circuit Breaker U/VHF")
defineToggleSwitch("CC_FRONT_CB_RED_L", 2,3090,469, "CB Panel", "C-101CC FRONT Circuit Breaker Red Cockpit Lighting")
defineToggleSwitch("CC_FRONT_CB_BAK_ADI", 2,3059,470, "CB Panel", "C-101CC FRONT Circuit Breaker Backup ADI")
defineToggleSwitch("CC_FRONT_CB_INTER", 2,3093,471, "CB Panel", "C-101CC FRONT Circuit Breaker Interphone")
defineToggleSwitch("CC_FRONT_CB_COMP", 2,3541,457, "CB Panel", "C-101CC FRONT Circuit Breaker Air Data Computer / Flight Director")
defineToggleSwitch("CC_FRONT_CB_GYRO_115", 2,3542,458, "CB Panel", "C-101CC FRONT Circuit Breaker Gyro Plat 115V AC")
defineToggleSwitch("CC_FRONT_CB_CONS_L", 2,3099,459, "CB Panel", "C-101CC FRONT Circuit Breaker Console Lights")
defineToggleSwitch("CC_FRONT_CB_VOR_AC", 2,3078,460, "CB Panel", "C-101CC FRONT Circuit Breaker VOR AC")
defineToggleSwitch("CC_FRONT_CB_GYRO_VERT", 2,3544,461, "CB Panel", "C-101CC FRONT Circuit Breaker Vertical Gyro")
defineToggleSwitch("CC_FRONT_CB_GYRO_HOR", 2,3545,462, "CB Panel", "C-101CC FRONT Circuit Breaker Horizontal Gyro")
defineToggleSwitch("CC_FRONT_CB_ADF_AC", 2,3293,1189, "CB Panel", "C-101CC FRONT Circuit Breaker ADF 26V AC")
defineToggleSwitch("CC_FRONT_CB_DME_26", 2,3546,472, "CB Panel", "C-101CC FRONT Circuit Breaker DME 26V AC")
defineToggleSwitch("CC_FRONT_CB_GYRO_26", 2,3547,473, "CB Panel", "C-101CC FRONT Circuit Breaker Gyro Plat 26V AC")
defineToggleSwitch("CC_FRONT_CB_FD_26", 2,3100,474, "CB Panel", "C-101CC FRONT Circuit Breaker Flight Director 26V AC")
defineToggleSwitch("CC_FRONT_CB_ADC", 2,3294,596, "CB Panel", "C-101CC FRONT Circuit Breaker ADC")
defineToggleSwitch("CC_BACK_CB_STALL_WARN", 2,3548,903, "CB Panel", "C-101CC BACK Circuit Breaker Stall Warning System")

-- MISC FUNCTIONS
definePotentiometer("CC_FRONT_AOA_IND_KNB", 2,3345,290, {0, 1}, "Misc", "C-101CC FRONT AOA Indicator Knob")
definePushButton("CC_FRONT_EMERG_FUEL_VALVE", 2,3352,715, "Misc", "C-101CC FRONT Emergency Fuel Valve")
defineToggleSwitch("CC_FRONT_EMERG_FUEL_Cover", 2,3351,716, "Misc", "C-101CC FRONT Emergency Fuel Cover")
defineMultipositionSwitch("CC_FRONT_EMERG_FUEL_LEVER", 2,3354,726,9,0.1,"Misc" ,"C-101CC FRONT Emergency Fuel Lever")
definePushButton("CC_FRONT_TELEBRIEFING_BTN", 2, 3320, 718, "Misc", "C-101CC FRONT Telebriefing Button")
definePotentiometer("CC_FRONT_TELEBRIEFING_KNB", 2, 3554, 849, {0, 1}, "Misc", "C-101CC FRONT Telebriefing Knob")

--------------------------------------- REAR COCKPIT ONLY FUNCTIONS ---------------------------------------
-- MISC FUNCTIONS
defineToggleSwitch("CC_BACK_STALL_WARN_TEST", 2,3606,1208, "Misc", "C-101CC BACK Stall Warning Test")
defineToggleSwitch("CC_BACK_STALL_WARN_PW", 2,3607,1209, "Misc", "C-101CC BACK Stall Warning Power")
definePotentiometer("CC_BACK_AOA_ADJ", 2,3653,279, {0, 1}, "Misc", "C-101CC BACK AOA Adjust")
defineToggleSwitch("CC_BACK_EMERG_PITCH_TRIM", 2,3473,842, "Misc", "C-101CC BACK Emergency Pitch Trim Breaker")	

--================================================================ C-101EB COCKPIT ==================================================================
-- ALTIMETER 
definePushButton("EB_FRONT_ALT_TAP", 2, 3164, 68, "Altimeter", "C-101EB FRONT Altimeter Tap Glass")
definePushButton("EB_BACK_ALT_TAP", 2, 3411, 802, "Altimeter", "C-101EB BACK Altimeter Tap Glass")

-- VHF COMM/NAV
definePushButton("EB_FRONT_VHF_NAV_TEST_VOR", 12,3001,381, "VHF", "C-101EB FRONT VHF NAV Test VOR/MKR")
definePushButton("EB_FRONT_VHF_NAV_TEST_DIGITS", 12,3002,382, "VHF", "C-101EB FRONT VHF NAV Test Digits")
definePotentiometer("EB_FRONT_VHF_NAV_DIM", 12,3003,383, {0, 1}, "VHF", "C-101EB FRONT VHF NAV Dimmer")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_108", 12,3004,377,10,0.1,"VHF" ,"C-101EB FRONT VHF NAV 108-117 Frequency Selector")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_9", 12,3005,378,10,0.1,"VHF" ,"C-101EB FRONT VHF NAV 0-9 Frequency Selector")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_50", 12,3006,379,2,0.5,"VHF" ,"C-101EB FRONT VHF NAV 00/50 Frequency Selector")
definePotentiometer("EB_FRONT_VHF_NAV_VOL", 12,3007,380, {0, 1}, "VHF", "C-101EB FRONT VHF NAV Volume")
definePushButton("EB_BACK_VHF_NAV_TEST_VOR", 12,3010,914, "VHF", "C-101EB BACK VHF NAV Test VOR/MKR")
definePushButton("EB_BACK_VHF_NAV_TEST_DIGITS", 12,3011,915, "VHF", "C-101EB BACK VHF NAV Test Digits")
definePotentiometer("EB_BACK_VHF_NAV_DIM", 12,3012,916, {0, 1}, "VHF", "C-101EB BACK VHF NAV Dimmer")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_108", 12,3013,910,10,0.1,"VHF" ,"C-101EB BACK VHF NAV 108-117 Frequency Selector")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_9", 12,3014,911,10,0.1,"VHF" ,"C-101EB BACK VHF NAV 0-9 Frequency Selector")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_50", 12,3015,912,2,0.5,"VHF" ,"C-101EB BACK VHF NAV 00/50 Frequency Selector")
definePotentiometer("EB_BACK_VHF_NAV_VOL", 12,3016,913, {0, 1}, "VHF", "C-101EB BACK VHF NAV Volume")
definePotentiometer("EB_FRONT_VHF_COMM_BRIGHT", 9,3008,412, {0, 1}, "VHF", "C-101EB FRONT VHF COMM Brightness")
definePotentiometer("EB_FRONT_VHF_COMM_VOL", 9,3007,411, {0, 1}, "VHF", "C-101EB FRONT VHF COMM Volume")
defineToggleSwitch("EB_FRONT_VHF_COMM_PW", 9,3001,413,"VHF" ,"C-101EB FRONT VHF COMM Power Switch")
definePushButton("EB_FRONT_VHF_COMM_TEST", 9,3006,414, "VHF", "C-101EB FRONT VHF COMM Display Test")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_X0XXXX", 9,3002,415,4,0.25,"VHF" ,"C-101EB FRONT VHF COMM Frequency Selector (X0X.XXX)")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_XX0XXX", 9,3003,416,10,0.1,"VHF" ,"C-101EB FRONT VHF COMM Frequency Selector (XX0.XXX)")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_XXX0XX", 9,3004,417,10,0.1,"VHF" ,"C-101EB FRONT VHF COMM Frequency Selector (XXX.0XX)")
defineMultipositionSwitch("EB_FRONT_VHF_NAV_FREQ_XXXX00", 9,3005,418,4,0.25,"VHF" ,"C-101EB FRONT VHF COMM Frequency Selector (XXX.X00)")
definePotentiometer("EB_BACK_VHF_COMM_BRIGHT", 9,3017,924, {0, 1}, "VHF", "C-101EB BACK VHF COMM Brightness")
definePotentiometer("EB_BACK_VHF_COMM_VOL", 9,3016,923, {0, 1}, "VHF", "C-101EB BACK VHF COMM Volume")
defineToggleSwitch("EB_BACK_VHF_COMM_PW", 9,3010,925,"VHF" ,"C-101EB BACK VHF COMM Power Switch")
definePushButton("EB_BACK_VHF_COMM_TEST", 9,3015,926, "VHF", "C-101EB BACK VHF COMM Display Test")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_X0XXXX", 9,3011,927,4,0.25,"VHF" ,"C-101EB BACK VHF COMM Frequency Selector (X0X.XXX)")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_XX0XXX", 9,3012,928,10,0.1,"VHF" ,"C-101EB BACK VHF COMM Frequency Selector (XX0.XXX)")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_XXX0XX", 9,3013,929,10,0.1,"VHF" ,"C-101EB BACK VHF COMM Frequency Selector (XXX.0XX)")
defineMultipositionSwitch("EB_BACK_VHF_NAV_FREQ_XXXX00", 9,3014,930,4,0.25,"VHF" ,"C-101EB BACK VHF COMM Frequency Selector (XXX.X00)")

-- UHF RADIO
defineMultipositionSwitch("EB_FRONT_UHF_SEL100", 10, 3002, 226, 2, 0.1,"UHF Radio" ,"C-101EB FRONT UHF Radio 100 MHz Selector")
defineMultipositionSwitch("EB_FRONT_UHF_SEL10", 10,3003,227,10,0.1,"UHF Radio" ,"C-101EB FRONT UHF Radio 10 MHz Selector")
defineMultipositionSwitch("EB_FRONT_UHF_SEL1", 10,3004,228,10,0.1,"UHF Radio" ,"C-101EB FRONT UHF Radio 1 MHz Selector")
defineMultipositionSwitch("EB_FRONT_UHF_SEL01", 10,3005,229,10,0.1,"UHF Radio" ,"C-101EB FRONT UHF Radio 0.1 MHz Selector")
defineMultipositionSwitch("EB_FRONT_UHF_SEL0025", 10,3006,230,4,0.25,"UHF Radio" ,"C-101EB FRONT UHF Radio 0.025 MHz Selector")
defineMultipositionSwitch("EB_FRONT_UHF_PRESET", 10,3001,231,20,0.05,"UHF Radio" ,"C-101EB FRONT UHF Radio Preset Channel Selector")
defineMultipositionSwitch("EB_FRONT_UHF_FUNCT", 10,3008,232,4,0.25,"UHF Radio" ,"C-101EB FRONT UHF Radio Function Dial")
defineMultipositionSwitch("EB_FRONT_UHF_FREQU", 10,3007,233,3,0.5,"UHF Radio" ,"C-101EB FRONT UHF Radio Frequency Mode Dial")
definePotentiometer("EB_FRONT_UHF_VOL", 10,3011,234, {0, 1}, "UHF Radio", "C-101EB FRONT UHF Volume")
definePushButton("EB_FRONT_UHF_T_TONE", 10,3009,235, "UHF Radio", "C-101EB FRONT UHV T-Tone")
defineToggleSwitch("EB_FRONT_UHF_SQL", 10, 3010,236, "UHF Radio", "C-101EB FRONT UHF Radio Squelch Switch")
definePotentiometer("EB_FRONT_UHF_COVER", 10,3015,854, {0, 1}, "UHF Radio", "C-101EB FRONT UHF Cover")
definePushButton("EB_FRONT_UHF_PRESET", 10,3016,855, "UHF Radio", "C-101EB FRONT UHV Preset Button")
defineMultipositionSwitch("EB_BACK_UHF_SEL100", 10,3027,862,3,0.1,"UHF Radio" ,"C-101EB BACK UHF Radio 100 MHz Selector")
defineMultipositionSwitch("EB_BACK_UHF_SEL10", 10,3028,863,11,0.1,"UHF Radio" ,"C-101EB BACK UHF Radio 10 MHz Selector")
defineMultipositionSwitch("EB_BACK_UHF_SEL1", 10,3029,864,11,0.1,"UHF Radio" ,"C-101EB BACK UHF Radio 1 MHz Selector")
defineMultipositionSwitch("EB_BACK_UHF_SEL01", 10,3030,865,11,0.1,"UHF Radio" ,"C-101EB BACK UHF Radio 0.1 MHz Selector")
defineMultipositionSwitch("EB_BACK_UHF_SEL0025", 10,3031,866,5,0.25,"UHF Radio" ,"C-101EB BACK UHF Radio 0.025 MHz Selector")
defineMultipositionSwitch("EB_BACK_UHF_PRESET", 10,3026,867,21,0.05,"UHF Radio" ,"C-101EB BACK UHF Radio Preset Channel Selector")
defineMultipositionSwitch("EB_BACK_UHF_FUNCT", 10,3033,868,4,0.1,"UHF Radio" ,"C-101EB BACK UHF Radio Function Dial")
defineMultipositionSwitch("EB_BACK_UHF_FREQU", 10,3032,869,3,0.5,"UHF Radio" ,"C-101EB BACK UHF Radio Frequency Mode Dial")
definePotentiometer("EB_BACK_UHF_VOL", 10,3036,870, {0, 1}, "UHF Radio", "C-101EB BACK UHF Volume")
definePushButton("EB_BACK_UHF_T_TONE", 10,3034,871, "UHF Radio", "C-101EB BACK UHV T-Tone")
defineToggleSwitch("EB_BACK_UHF_SQL", 10, 3035,872, "UHF Radio", "C-101EB BACK UHF Radio Squelch Switch")
definePotentiometer("EB_BACK_UHF_COVER", 10,3040,1167, {0, 1}, "UHF Radio", "C-101EB BACK UHF Cover")
definePushButton("EB_BACK_UHF_PRESET", 10,3041,1169, "UHF Radio", "C-101EB BACK UHV Preset Button")
define3PosTumb("FRONT_UHF_TEST_SW", 10, 3010, 207, "UHF Radio", "C-101EB FRONT UHF Frequency/Test Switch")
definePotentiometer("EB_FRONT_UHF_DIM", 10,3014,206, {0, 1}, "UHF Radio", "C-101EB FRONT UHF Digital Display Dimmer")
define3PosTumb("FRONT_UHF_TEST_SW", 10, 3037, 844, "UHF Radio", "C-101EB FRONT UHF Frequency/Test Switch")
definePotentiometer("EB_BACK_UHF_DIM", 10,3039,845, {0, 1}, "UHF Radio", "C-101EB BACK UHF Digital Display Dimmer")

-- FLIGHT DIRECTOR 
definePushButton("EB_FRONT_FD_GO_MODE", 2,3170,210, "Flight Director", "C-101EB FRONT Flight Director GO-Around Mode")
definePushButton("EB_FRONT_FD_HDG_MODE", 2,3171,211, "Flight Director", "C-101EB FRONT Flight Director Heading Mode")
definePushButton("EB_FRONT_FD_ALT_HOLD_MODE", 2,3172,212, "Flight Director", "C-101EB FRONT Flight Director Altitude Hold Mode")
definePushButton("EB_FRONT_FD_PITCH_MODE", 2,3173,213, "Flight Director", "C-101EB FRONT Flight Director Pitch Mode")
definePushButton("EB_FRONT_FD_VOR_LOC_MODE", 2,3174,214, "Flight Director", "C-101EB FRONT Flight Director VOR/LOC Mode")
definePushButton("EB_FRONT_FD_APPR_ARM", 2,3175,215, "Flight Director", "C-101EB FRONT Flight Director Approach Arm")
definePushButton("EB_FRONT_FD_GLIDES_MODE", 2,3176,216, "Flight Director", "C-101EB FRONT Flight Director Glideslope Mode")
definePushButton("EB_FRONT_FD_ILS_LOC_RES_MODE", 2,3177,217, "Flight Director", "C-101EB FRONT Flight Director ILS/VOR Reserve Mode")
definePushButton("EB_FRONT_FD_STBY_MODE", 2,3178,218, "Flight Director", "C-101EB FRONT Flight Director Standby Mode")
definePushButton("EB_FRONT_FD_GLIDES_EX_MODE", 2,3179,219, "Flight Director", "C-101EB FRONT Flight Director Glideslope Extended Mode")
defineToggleSwitch("EB_BACK_RD_DIM_BRIGHT", 2,3630,846,"Flight Director" ,"C-101EB BACK Flight Director Bright/Dim")

-- INTERCOM PANEL
definePushButton("EB_FRONT_INTER_UHF_BTN", 7, 3014, 281, "Intercom", "C-101EB FRONT Intercom UHF Switch (push)")
definePotentiometer("EB_FRONT_INTER_UHF_KNB", 7, 3015, 395, {0, 1}, "Intercom", "C-101EB FRONT Intercom UHF Switch (turn)")
definePushButton("EB_FRONT_INTER_TCN_BTN", 7, 3016, 284, "Intercom", "C-101EB FRONT Intercom TCN Switch (push)")
definePotentiometer("EB_FRONT_INTER_TCN_KNB", 7, 3017, 398, {0, 1}, "Intercom", "C-101EB FRONT Intercom TCN Switch (turn)")
defineMultipositionSwitch("EB_FRONT_INTER_SEL", 7,3018,404,3,0.5,"Intercom" ,"C-101CC FRONT Intercom Selector Switch")
definePushButton("EB_BACK_INTER_UHF_BTN", 7, 3037, 885, "Intercom", "C-101EB BACK Intercom UHF Switch (push)")
definePotentiometer("EB_BACK_INTER_UHF_KNB", 7, 3038, 895, {0, 1}, "Intercom", "C-101EB BACK Intercom UHF Switch (turn)")
definePushButton("EB_BACK_INTER_TCN_BTN", 7, 3039, 888, "Intercom", "C-101EB BACK Intercom TCN Switch (push)")
definePotentiometer("EB_BACK_INTER_TCN_KNB", 7, 3040, 898, {0, 1}, "Intercom", "C-101EB BACK Intercom TCN Switch (turn)")
defineMultipositionSwitch("EB_BACK_INTER_SEL", 7,3041,947,3,0.5,"Intercom" ,"C-101EB BACK Intercom Selector Switch")

-- AHRS CONTROL PANEL
defineMultipositionSwitch("EB_FRONT_AHRS_MAN_GYRO_CORR", 2,3026,339,3,0.5,"AHRS" ,"C-101CC FRONT AHRS Manual Gyro Correction")
definePushButton("EB_FRONT_AHRS_VERT_GYRO_FAST_ERECT",2,3027,340, "AHRS", "C-101EB FRONT AHRS Vertical Gyro Fast Erect")
defineToggleSwitch("EB_FRONT_AHRS_GYRO_MODE", 2,3028,341, "AHRS", "C-101EB FRONT AHRS Gyro Mode")
defineMultipositionSwitch("EB_BACK_AHRS_MAN_GYRO_CORR", 2,3650,965,3,0.5,"AHRS" ,"C-101CC BACK AHRS Manual Gyro Correction")
definePushButton("EB_BACK_AHRS_VERT_GYRO_FAST_ERECT",2,3510,966, "AHRS", "C-101EB BACK AHRS Vertical Gyro Fast Erect")
defineToggleSwitch("EB_BACK_AHRS_GYRO_MODE",2,3642,967, "AHRS", "C-101EB BACK AHRS Gyro Mode")

-- MISC FUNCTIONS
definePushButton("EB_FRONT_VOR_TCN_NAV_SEL", 2, 3037, 337, "Misc", "C-101EB FRONT VOR/TCN Nav Selector")
definePotentiometer("EB_FRONT_AIR_SPEED_IND_BUG", 2, 3237, 102, {0, 1}, "Misc", "C-101EB FRONT Airspeed Indicator Bug")
definePushButton("EB_BACK_VOR_TCN_NAV_SEL", 2, 3641, 840, "Misc", "C-101EB BACK VOR/TCN Nav Selector")
definePotentiometer("EB_BACK_AIR_SPEED_IND_BUG", 2, 3491, 803, {0, 1}, "Misc", "C-101EB BACK Airspeed Indicator Bug")
defineMultipositionSwitch("EB_FRONT_UHF_ANT_SEL", 2,3221,338,3,0.5,"Misc" ,"C-101EB FRONT UHF Antenna Selection")
definePotentiometer("EB_FRONT_ADJ_RED_LIGHT", 2,3229,260, {0, 1}, "Misc", "C-101EB FRONT Adjust Red Light")
definePotentiometer("EB_BACK_ADJ_RED_LIGHT", 2,3640,265, {0, 1}, "Misc", "C-101EB BACK Adjust Red Light")
definePotentiometer("EB_FRONT_ADJ_ADI_PITCH", 2,3165,112, {0, 1}, "Misc", "C-101EB FRONT ADI Pitch Adjust")
definePotentiometer("EB_BACK_ADJ_ADI_PITCH", 2,3600,990, {0, 1}, "Misc", "C-101EB BACK ADI Pitch Adjust")
definePotentiometer("EB_FRONT_HSI_BRIGHT", 2,3161,343, {0, 1}, "Misc", "C-101EB FRONT HSI Digit Brightness")
definePotentiometer("EB_BACK_HSI_BRIGHT", 2,3443,766, {0, 1}, "Misc", "C-101EB BACK HSI Digit Brightness")

--------------------------------------- FORWARD COCKPIT ONLY FUNCTIONS ------------------------------------
-- TACAN PANEL
defineRotary("EB_FRONT_TCN_CHAN_10", 11, 3001, 387, "TACAN", "C-101EB FRONT TACAN Channel 00x-12x")
defineMultipositionSwitch("EB_FRONT_TCN_CHAN_1", 11,3002,388,10,0.1,"TACAN" ,"C-101EB FRONT TACAN Channel xx1")
defineToggleSwitch("EB_FRONT_TCN_CHAN_XY", 11, 3003, 389, "TACAN", "C-101EB FRONT TACAN Channel X/Y")
definePushButton("EB_FRONT_TCN_TEST", 11,3004,390, "TACAN", "C-101EB FRONT TACAN Test")
definePotentiometer("EB_FRONT_TCN_VOL", 11,3005,392, {0, 1}, "TACAN", "C-101EB FRONT TACAN Volume")
defineMultipositionSwitch("EB_FRONT_TCN_MODE", 11,3006,393,5,0.25,"TACAN" ,"C-101EB FRONT TACAN Mode")

-- CIRCUIT BREAKERS 
defineToggleSwitch("EB_FRONT_CB_VERT_GYRO_DC",2,3064,436, "CB Panel", "C-101EB FRONT Circuit Breaker Vertical Gyro DC")
defineToggleSwitch("EB_FRONT_CB_DIR_GYRO_DC",2,3065,437, "CB Panel", "C-101EB FRONT Circuit Breaker Directional Gyro DC")
defineToggleSwitch("EB_FRONT_CB_IFF_PRIM",2,3086,462, "CB Panel", "C-101EB FRONT Circuit Breaker IFF Prim DC")
defineToggleSwitch("EB_FRONT_CB_FUEL_MEASURE",2,3060,453, "CB Panel", "C-101EB FRONT Circuit Breaker Fuel Measuring System")
defineToggleSwitch("EB_FRONT_CB_UHF",2,3095,455, "CB Panel", "C-101EB FRONT Circuit Breaker UHF")
defineToggleSwitch("EB_FRONT_CB_TACAN_DC",2,3077,465, "CB Panel", "C-101EB FRONT Circuit Breaker TACAN DC")
defineToggleSwitch("EB_FRONT_CB_RED_L", 2,3090,466, "CB Panel", "C-101EB FRONT Circuit Breaker Red Cockpit Lighting")
defineToggleSwitch("EB_FRONT_CB_VHF_DC_ESS",2,3092,469, "CB Panel", "C-101EB FRONT Circuit Breaker VHF DC ESS")
defineToggleSwitch("EB_FRONT_CB_BAK_ADI", 2,3059,471, "CB Panel", "C-101EB FRONT Circuit Breaker Backup ADI")
defineToggleSwitch("EB_FRONT_CB_INTER", 2,3093,470, "CB Panel", "C-101EB FRONT Circuit Breaker Interphone")
defineToggleSwitch("EB_FRONT_CB_VERT_GYRO_AC",2,3066,458, "CB Panel", "C-101EB FRONT Circuit Breaker Vertical Gyro AC")
defineToggleSwitch("EB_FRONT_CB_DIR_GYRO_AC",2,3067,457, "CB Panel", "C-101EB FRONT Circuit Breaker Directional Gyro AC")
defineToggleSwitch("EB_FRONT_CB_TACAN_115",2,3079,459, "CB Panel", "C-101EB FRONT Circuit Breaker TACAN 115V AC")
defineToggleSwitch("EB_FRONT_CB_CONS_L", 2,3099,460, "CB Panel", "C-101EB FRONT Circuit Breaker Console Lights")
defineToggleSwitch("EB_FRONT_CB_IFF_115",2,3097,461, "CB Panel", "C-101EB FRONT Circuit Breaker IFF 115V AC")
defineToggleSwitch("EB_FRONT_CB_FD", 2,3100,472, "CB Panel", "C-101EB FRONT Circuit Breaker Flight Director")
defineToggleSwitch("EB_FRONT_CB_TACAN_26",2,3080,473, "CB Panel", "C-101EB FRONT Circuit Breaker TACAN 26V AC")
defineToggleSwitch("EB_FRONT_CB_VOR_26",2,3078,532, "CB Panel", "C-101EB FRONT Circuit Breaker VOR 26V AC")
defineToggleSwitch("EB_FRONT_CB_SMOKE_COL", 2,3643,851, "CB Panel", "C-101EB FRONT Circuit Breaker Colour Smoke")
defineToggleSwitch("EB_FRONT_CB_SMOKE_WH", 2,3644,852, "CB Panel", "C-101EB FRONT Circuit Breaker White Smoke")

BIOS.protocol.endModule()