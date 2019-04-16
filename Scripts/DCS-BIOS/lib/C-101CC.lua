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

-- remove Arg# Pilot 1000 / Instructor 1002 / Hide Stick Front 309 Back 312

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
defineTumb("FRONT_LIGHTS_NAV", 3, 3107, 368, 3, {0, 1}, nil, false, "External Lights", "FRONT Navigation Lights Switch")
defineTumb("FRONT_LIGHTS_FOR", 3, 3108, 367, 3, {0, 1}, nil, false, "External Lights", "FRONT Formation Lights Switch")
defineTumb("FRONT_LIGHTS_TAXI_L", 3, 3109, 329, 3, {0, 1}, nil, false, "External Lights", "FRONT Left Taxi/Landing Lights Switch")
defineTumb("FRONT_LIGHTS_TAXI_R", 3, 3110, 330, 3, {0, 1}, nil, false, "External Lights", "FRONT Right Taxi/Landing Lights Switch")
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

-- Warning, Caution and IndicatorLights
defineIndicatorLight("FRONT_LANDING_GEAR_LIGHT", 9, "Warning, Caution and IndicatorLights","FRONT Landing Gear Light (red)")
defineIndicatorLight("FRONT_BACK_COMPUTER_LIGHT", 143, "Warning, Caution and IndicatorLights","FRONT/BACK Computer Light MAN (yellow)")
defineIndicatorLight("FRONT_BACK_ANTI_ICE_LIGHT", 192, "Warning, Caution and IndicatorLights","FRONT/BACK ANTI-ICE Light ON (yellow)")
defineIndicatorLight("FRONT_BACK_ENG_START_TLIGHT", 140, "Warning, Caution and IndicatorLights","FRONT/BACK Engine Start Test Light (yellow)")

-- Gauges


--------------------------------------- FORWARD COCKPIT ONLY FUNCTIONS ---------------------------------------
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

-- Unknown buttons/switches
defineToggleSwitch("BACK_EJECT_PRIO_LEVER", 2, 3691, 1182, "Misc", "BACK Ejection Seat Priority Lever")
definePotentiometer("BACK_STORAGE_BOX", 2, 3522, 299, {0, 1}, "Misc", "BACK Storage Box Cover")

BIOS.protocol.endModule()