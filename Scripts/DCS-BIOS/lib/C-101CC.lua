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

-- remove Arg# Pilot 1000 / Instructor 1002

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
definePotentiometer("FRONT_CRS_KNOB", 2, 3525, 943, {0, 1}, "CRS HDG Bugs", "FRONT Course Knob")
definePotentiometer("FRONT_HDG_KNOB", 2, 3526, 944, {0, 1}, "CRS HDG Bugs", "FRONT Heading Knob")

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
define3PosTumb("FRONT_LIGHTS_NAV", 3, 3107, 368, "External Lights", "FRONT Navigation Lights Switch")
define3PosTumb("FRONT_LIGHTS_FOR", 3, 3108, 367, "External Lights", "FRONT Formation Lights Switch")
define3PosTumb("FRONT_LIGHTS_TAXI_L", 3, 3109, 329, "External Lights", "FRONT Left Taxi/Landing Lights Switch")
define3PosTumb("FRONT_LIGHTS_TAXI_R", 3, 3110, 330, "External Lights", "FRONT Right Taxi/Landing Lights Switch")
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
defineToggleSwitch("FRONT_CB_VOR_DC", 2, 3070, 438, "CB Panel", "FRONT Circuit VOR DC")
defineToggleSwitch("FRONT_CB_RPM_N1", 2, 3061, 439, "CB Panel", "FRONT Circuit RPM N1")
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

BIOS.protocol.endModule()