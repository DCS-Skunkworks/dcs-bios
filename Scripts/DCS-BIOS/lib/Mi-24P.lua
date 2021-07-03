BIOS.protocol.beginModule("Mi-24P", 0x6800)
BIOS.protocol.setExportModuleAircrafts({"Mi-24P"})
--v1.0 by WarLord (aka BlackLibrary)&charliefoxtwo

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3Pos2CommandSwitch = BIOS.util.define3Pos2CommandSwitch
local define3PosTumb = BIOS.util.define3PosTumb

--Engine
defineToggleSwitch("PLT_ROTOR_BRAKE", 3, 3011, 745, "Engine", "PILOT Rotor Brake")
defineToggleSwitch("PLT_ENG_STOP_L", 3, 3009, 6, "Engine", "PILOT Left Engine Stop")
defineToggleSwitch("PLT_ENG_STOP_R", 3, 3010, 7, "Engine", "PILOT Right Engine Stop")
defineRotary("PLT_ENG_THROTTLE_L", 3, 3006, 5, "Engine", "PILOT Left Engine Throttle")
defineRotary("PLT_ENG_THROTTLE_R", 3, 3008, 4, "Engine", "PILOT Right Engine Throttle")
define3Pos2CommandSwitch("PLT_FREE_TURB_RPM", 3, 3020, 3019, 747, "Engine", "PILOT Readjust Free Turbine RPM, RIGHT/NEUTRAL/LEFT")

--HydroInterface
defineToggleSwitch("PLT_MAIN_AUXHYD_CV", 4, 3002, 216, "Hydro Interface", "PILOT Main/Auxiliary Hydraulic Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_MAIN_AUXHYD", 4, 3001, 217, "Hydro Interface", "PILOT Main/Auxiliary Hydraulic Switch, MAIN/AUXILIARY")
defineToggleSwitch("PLT_MAIN_GEARHYD_CV", 4, 3004, 218, "Hydro Interface", "PILOT Main/Reserve Gear Hydraulic Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_MAIN_GEARHYD", 4, 3003, 219, "Hydro Interface", "PILOT Main/Reserve Gear Hydraulic Switch, MAIN/RESERVE")
definePushButton("PLT_AUX_DISABLE", 4, 3005, 213, "Hydro Interface", "PILOT Auxiliary Disable Button")
defineToggleSwitch("PLT_AUX_DISABLE_CV", 4, 3006, 215, "Hydro Interface", "PILOT Auxiliary Disable Button Cover, UP/DOWN")
defineToggleSwitch("PLT_CONTROL_ASSUMEND_CV", 4, 3012, 47, "Hydro Interface", "PILOT Control Assumed Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_CONTROL_ASSUMEND", 4, 3011, 48, "Hydro Interface", "PILOT Control Assumed Switch Cover, ON/OFF")
defineToggleSwitch("PLT_PEDAL_DAMPER_CV", 4, 3008, 289, "Hydro Interface", "PILOT Pedal Damper Cover, UP/DOWN")
defineToggleSwitch("PLT_PEDAL_DAMPER", 4, 3007, 290, "Hydro Interface", "PILOT Pedal Damper, ON/OFF")
defineToggleSwitch("OP_PEDAL_DAMPER_CV", 4, 3001, 666, "Hydro Interface", "OPERATOR Pedal Damper Cover, UP/DOWN")
defineToggleSwitch("OP_PEDAL_DAMPER", 4, 3009, 667, "Hydro Interface", "OPERATOR Pedal Damper, ON/OFF")

--CockpitMechanics
defineToggleSwitch("PLT_GEAR_IND_L_SW", 11, 3003, 224, "Cockpit Mechanics PLT", "PILOT Gear Indication Lights, ON/OFF")
defineToggleSwitch("PLT_GEAR_IND_L_CV", 11, 3004, 223, "Cockpit Mechanics PLT", "PILOT Gear Indication Lights Cover, UP/DOWN")
defineToggleSwitch("PLT_GEAR_LVR", 11, 3001, 232, "Cockpit Mechanics PLT", "PILOT Gear Lever, UP/DOWN")
defineToggleSwitch("PLT_GEAR_LVR_LOCK", 11, 3002, 228, "Cockpit Mechanics PLT", "PILOT Gear Lever Lock, UP/DOWN")
defineToggleSwitch("OP_GEAR_SW", 11, 3005, 677, "Cockpit Mechanics OP", "OPERATOR Gear Switch, UP/DOWN")
defineToggleSwitch("OP_GEAR_SW_CV", 11, 3006, 676, "Cockpit Mechanics OP", "OPERATOR Gear Switch Cover UP/DOWN")
defineToggleSwitch("PLT_EMERG_GEAR_LVR", 11, 3007, 827, "Cockpit Mechanics PLT", "PILOT Emergency Gear Lever")
definePushButton("PLT_WIN_SPRAY", 11, 3015, 384, "Cockpit Mechanics PLT", "PILOT Window Sprayer Button")
definePushButton("OP_WIN_SPRAY", 11, 3016, 680, "Cockpit Mechanics OP", "OPERATOR Window Sprayer Button")
definePushButton("PLT_COLLECTIVE_STOP", 11, 3028, 753, "Cockpit Mechanics PLT", "PILOT friction clutch of the collective")
defineToggleSwitch("OP_CLOCK_HEAT", 11, 3013, 672, "Cockpit Mechanics OP", "OPERATOR Clock Heating Switch, ON/OFF")
defineToggleSwitch("OP_DUAS_HEAT", 11, 3012, 763, "Cockpit Mechanics OP", "OPERATOR Heating DUAS, ON/OFF")
definePushButton("PLT_FAN_FUN", 11, 3029, 0, "Cockpit Mechanics PLT", "PILOT Cockpit Fan - Touch")
definePushButton("OP_FAN_FUN", 11, 3030, 0, "Cockpit Mechanics OP", "OPERATOR Cockpit Fan - Touch")
definePushButton("PLT_BRAKE_WHEEL", 11, 3026, 737, "Cockpit Mechanics PLT", "PILOT Wheel Brakes Handle")
defineToggleSwitch("PLT_BRAKE_PARK", 11, 3027, 736, "Cockpit Mechanics PLT", "PILOT Parking Brake Handle")
defineToggleSwitch("PLT_FAN", 11, 3024, 420, "Cockpit Mechanics PLT", "PILOT Fan, ON/OFF")
defineToggleSwitch("OP_FAN", 11, 3025, 665, "Cockpit Mechanics OP", "OPERATOR Fan, ON/OFF")
defineToggleSwitch("STICK_HIDE", 11, 3031, 974, "Cockpit Mechanics", "Hide Stick toggle")
definePushButton("PLT_DOOR_LOCK_BTN", 11, 3018, 189, "Cockpit Mechanics PLT", "PILOT Door Safety Lock Button")
defineToggleSwitch("PLT_DOOR_LOCK", 11, 3017, 8, "Cockpit Mechanics PLT", "PILOT Door Safety Lock, OPEN/CLOSE")
defineToggleSwitch("OP_DOOR_LOCK", 11, 3019, 848, "Cockpit Mechanics OP", "OPERATOR Door Safety Lock, OPEN/CLOSE")
defineToggleSwitch("OP_AP_TRIM", 11, 3040, 671, "Cockpit Mechanics OP", "OPERATOR Autopilot Trimmer for yourself")
defineToggleSwitch("OP_AP_TRIM_CV", 11, 3041, 670, "Cockpit Mechanics OP", "OPERATOR Autopilot Trimmer for yourself Switch Cover, UP/DOWN")

--IntLightSystem
define3PosTumb("OP_CABIN_L_SW", 23, 3001, 682, "Int Light System", "OPERATOR Cabin Lighting Switch, WHITE/OFF/RED")
define3PosTumb("PLT_CABIN_L_SW", 23, 3002, 356, "Int Light System", "PILOT Cabin Lighting Switch, WHITE/OFF/RED")
defineToggleSwitch("PLT_CARGO_L_SW", 23, 3003, 354, "Int Light System", "PILOT Cargo Lighting Switch, ON/OFF")
defineToggleSwitch("PLT_CARGO_L_CV", 23, 3004, 353, "Int Light System", "PILOT Cargo Lighting Switch Cover, UP/DOWN")
defineToggleSwitch("PLT_CARGO_COLOR_L_SW", 23, 3005, 355, "Int Light System", "PILOT Cargo Lighting Switch, WHITE/OFF/BLUE")
definePushButton("PLT_WARN_L_TEST", 23, 3008, 363, "Int Light System", "PILOT Test Warning Lights Button")
definePushButton("OP_WARN_L_TEST", 23, 3009, 681, "Int Light System", "OPERATOR Test Warning Lights Button")
defineToggleSwitch("PLT_DAY_NIGHT_SW", 23, 3010, 362, "Int Light System", "PILOT Day-Night Switch, DAY/NIGHT")
defineToggleSwitch("PLT_BLINK_SW", 23, 3011, 36, "Int Light System", "PILOT Blinker Switch, ON/OFF")
defineTumb("PLT_TRANSFROM_1_R", 23, 3012, 148, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 1 Group Of Red Lights Right And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("PLT_TRANSFROM_2_R", 23, 3013, 147, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 2 Group Of Red Lights Right And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineToggleSwitch("PLT_ARM_RED_L_SW", 23, 3014, 822, "Int Light System", "PILOT Armament Panel Red Lights Switch, ON/OFF")
defineTumb("PLT_TRANSFROM_1_L", 23, 3015, 820, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 1 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("PLT_TRANSFROM_2_L", 23, 3016, 503, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 2 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("OP_TRANSFROM_1_L", 23, 3017, 1013, 0.1, {0, 1}, nil, false, "Int Light System", "OPERATOR Transformer 1 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("OP_TRANSFROM_2_L", 23, 3018, 1014, 0.1, {0, 1}, nil, false, "Int Light System", "OPERATOR Transformer 2 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("PLT_TRANSFROM_BUILTIN", 23, 3020, 149, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Builtin Red Lights Transformer, OFF/0.6V/1.2V/1.8V/2.4V/3V/3.6V/4.2V/4.8V/5.4V/6V")

--ExtLightsSystem
define3PosTumb("PLT_LND_L_SW", 15, 3008, 208, "Ext Light System", "PILOT LND LT Control-Off-Retract Switch")
defineToggleSwitch("PLT_TAXI_L_SW", 15, 3001, 34, "Ext Light System", "PILOT Taxi LT Switch, ON/OFF")
defineToggleSwitch("OP_TAXI_L_SW", 15, 3001, 686, "Ext Light System", "OPERATOR Taxi LT Switch, ON/OFF")
define3PosTumb("PLT_NAV_L_SW", 15, 3003, 207, "Ext Light System", "PILOT Navigation Lights Switch, BRIGHT/OFF/DIM")
definePushButton("PLT_NAV_L_CODE", 15, 3004, 35, "Ext Light System", "PILOT Navigation Lights Code Button")
define3PosTumb("PLT_FORMATION_L_SW", 15, 3005, 414, "Ext Light System", "PILOT Formation Lights Switch, BRIGHT/OFF/DIM")
defineToggleSwitch("PLT_TIP_L_SW", 15, 3006, 415, "Ext Light System", "PILOT Tip Lights Switch, ON/OFF")
defineToggleSwitch("PLT_STROBE_L_SW", 15, 3007, 417, "Ext Light System", "PILOT Strobe Light Switch, ON/OFF")
defineToggleSwitch("OP_LND_L_CV", 15, 3012, 668, "Ext Light System", "OPERATOR LND Light Assumed Switch Cover, OPEN/CLOSE")
defineToggleSwitch("OP_LND_L_SW", 15, 3011, 669, "Ext Light System", "OPERATOR LND Light Assumed Switch, ON/OFF")

--ECSystem
defineToggleSwitch("PLT_CABIN_UNSEAL", 29, 3001, 133, "ECS", "PILOT Cabin Unseal Switch, ON/OFF")
define3PosTumb("PLT_AC_MODE", 29, 3002, 134, "ECS", "PILOT Blowdown Conditioning Switch, CONDITIONING/OFF/BLOWDOWN")
defineToggleSwitch("PLT_AC_FILTER", 29, 3003, 143, "ECS", "PILOT Filter Switch, ON/OFF")
defineToggleSwitch("PLT_AC_HEAT_MODE_1", 29, 3004, 144, "ECS", "PILOT Heating Switch, HOT/NORMAL")
defineMultipositionSwitch("PLT_AC_HEAT_MODE_2", 29, 3005, 145, 4, 0.1, "ECS", "PILOT Automatic Hot Cold Switch, OFF/COLD/HOT/AUTO")
defineMultipositionSwitch("PLT_AC_TEMP", 29, 3006, 146, 11, 1/9, "ECS", "PILOT Temperature Selector, 5/10/15/18/20/22/24/30/35/40/50")
defineToggleSwitch("OP_SIGHT_FAN", 29, 3007, 774, "ECS", "OPERATOR Sight Fan, ON/OFF")
definePotentiometer("PLT_CABIN_PRESS", 29, 3008, 516, {0, 1}, "ECS", "PILOT Sealing, OPEN/CLOSE")

--PKP72M
defineToggleSwitch("PLT_GYRO_SW", 34, 3001, 12, "PKP72M", "PILOT Gyrovertical Switch, 1/2")
defineToggleSwitch("OP_ADI_SW", 34, 3002, 759, "PKP72M", "OPERTOR ADI Switch, ON/OFF")
definePushButton("PLT_ADI_TEST", 32, 3002, 946, "PKP72M", "PILOT Test ADI Button")
defineRotary("PLT_ADI_PITCH_TRIM", 32, 3001, 941, "PKP72M", "PILOT ADI Pitch Trim Knob")
definePushButton("OP_ADI_TEST", 33, 3002, 787, "PKP72M", "OPERTOR Test ADI Button")
defineRotary("OP_ADI_PITCH_TRIM", 33, 3001, 782, "PKP72M", "OPERTOR ADI Pitch Trim Knob")

--MGV1SU
definePushButton("PLT_GYRO_1_CAGE", 25, 3001, 10, "MGV1SU", "PILOT Cage Gyro 1")
definePushButton("PLT_GYRO_2_CAGE", 26, 3001, 14, "MGV1SU", "PILOT Cage Gyro 2")
defineToggleSwitch("PLT_GYRO_1_PWR", 25, 3004, 369, "MGV1SU", "PILOT Gyro 1 Power, ON/OFF")
defineToggleSwitch("PLT_GYRO_2_PWR", 26, 3004, 368, "MGV1SU", "PILOT Gyro 2 Power, ON/OFF")
definePushButton("OP_GYRO_2_CAGE", 26, 3003, 701, "MGV1SU", "OPERATOR Cage Gyro 2")

--UKT2
defineRotary("PLT_UKT_PITCH_TRIM", 18, 3001, 951, "UKT 2", "PILOT UKT Pitch Trim Knob")

--Barometric Altimeter
definePotentiometer("PLT_ALT_PRESS", 41, 3001, 18, {0, 1}, "Barometric Altimeter", "PILOT Baro Pressure Knob")
definePotentiometer("OP_ALT_PRESS", 42, 3001, 788, {0, 1}, "Barometric Altimeter", "OPERATOR Baro Pressure Knob")

--RMI2
defineToggleSwitch("PLT_RMI2_MODE", 43, 3002, 26, "RMI2", "PILOT Mode Switch, ZK/ARKU2")
defineToggleSwitch("OP_RMI2_MODE", 44, 3002, 843, "RMI2", "OPERATOR Mode Switch, ZK/ARKU2")

--Clock
definePushButton("PLT_CLOCK_L_PUSH", 35, 3001, 57, "Clock", "PILOT Mech Clock Left Lever Push")
defineRotary("PLT_CLOCK_L_TURN", 35, 3003, 58, "Clock", "PILOT Mech Clock Left Lever Turn") --Module BUG?
definePushButton("PLT_CLOCK_R_PUSH", 35, 3004, 59, "Clock", "PILOT Mech Clock Right Lever Push")
defineRotary("PLT_CLOCK_R_TURN", 35, 3005, 60, "Clock", "PILOT Mech Clock Right Lever Turn")
definePushButton("OP_CLOCK_L_PUSH", 36, 3001, 687, "Clock", "OPERATOR Mech Clock Left Lever Push")
defineRotary("OP_CLOCK_L_TURN", 36, 3003, 688, "Clock", "OPERATOR Mech Clock Left Lever Turn") --Module BUG?
definePushButton("OP_CLOCK_R_PUSH", 36, 3004, 693, "Clock", "OPERATOR Mech Clock Right Lever Push")
defineRotary("OP_CLOCK_R_TURN", 36, 3005, 694, "Clock", "OPERATOR Mech Clock Right Lever Turn")

--Electric Interface
defineToggleSwitch("PLT_D_BATT_R", 1, 3037, 61, "Electric Interface", "PILOT DC Right Battery switch, ON/OFF")
defineToggleSwitch("PLT_D_BATT_L", 1, 3034, 75, "Electric Interface", "PILOT DC Left Battery switch, ON/OFF")
defineToggleSwitch("PLT_D_RECT_R", 1, 3043, 65, "Electric Interface", "PILOT DC Right Rectifier switch, ON/OFF")
defineToggleSwitch("PLT_D_RECT_L", 1, 3040, 62, "Electric Interface", "PILOT DC Left Rectifier switch, ON/OFF")
defineToggleSwitch("PLT_D_APU", 1, 3046, 66, "Electric Interface", "PILOT DC APU Generator switch, ON/OFF")
defineMultipositionSwitch("PLT_D_VOLT_KNB", 1, 3055, 69, 10, 1/9, "Electric Interface", "PILOT DC Voltmeter Knob")
defineToggleSwitch("PLT_D_NET_BATT_CV", 1, 3067, 70, "Electric Interface", "PILOT DC Network to Batteries cover, UP/DOWN")
defineToggleSwitch("PLT_D_NET_BATT", 1, 3052, 71, "Electric Interface", "PILOT DC Network to Batteries, ON/OFF")
defineToggleSwitch("PLT_D_GROUND_PW", 1, 3031, 73, "Electric Interface", "PILOT DC Ground Power, ON/OFF")
defineToggleSwitch("PLT_D_BATT_HEAT", 1, 3049, 74, "Electric Interface", "PILOT DC Battery Heating, ON/OFF")
defineToggleSwitch("PLT_A_GEN_R", 1, 3007, 80, "Electric Interface", "PILOT AC Right Generator switch, ON/OFF")
defineToggleSwitch("PLT_A_GEN_L", 1, 3004, 101, "Electric Interface", "PILOT AC Left Generator switch, ON/OFF")
define3PosTumb("PLT_A_TRANS_115", 1, 3010, 83, "Electric Interface", "PILOT AC Transformer 115V, MAIN/AUTO/BACKUP")
define3PosTumb("PLT_A_TRANS_36", 1, 3013, 85, "Electric Interface", "PILOT AC Transformer 36V, MAIN/AUTO/BACKUP")
defineToggleSwitch("PLT_A_GPW", 1, 3001, 87, "Electric Interface", "PILOT AC Ground Power, ON/OFF")
defineToggleSwitch("PLT_A_GCHECK_CV", 1, 3058, 88, "Electric Interface", "PILOT AC Ground Check Cover, UP/DOWN")
defineToggleSwitch("PLT_A_GCHECK", 1, 3016, 89, "Electric Interface", "PILOT AC Ground Check, ON/OFF")
defineMultipositionSwitch("PLT_A_VOLT_KNB", 1, 3025, 91, 11, 0.1, "Electric Interface", "PILOT AC Voltmeter Knob")
defineToggleSwitch("PLT_A_INVERT_115_CV", 1, 3061, 97, "Electric Interface", "PILOT AC Inverter PO-750A Cover, UP/DOWN")
defineToggleSwitch("PLT_A_INVERT_115", 1, 3019, 98, "Electric Interface", "PILOT AC Inverter PO-750A, ON/OFF")
defineToggleSwitch("PLT_A_INVERT_36_CV", 1, 3064, 99, "Electric Interface", "PILOT AC Inverter PT-125Ts Cover, UP/DOWN")
defineToggleSwitch("PLT_A_INVERT_36", 1, 3022, 100, "Electric Interface", "PILOT AC Inverter PT-125Ts, ON/OFF")
defineToggleSwitch("PLT_A_TRANSFORM_36", 1, 3028, 196, "Electric Interface", "PILOT AC DIM Transformer switch, MAIN/BACKUP")
definePushButton("PLT_CB_R_ALL", 1, 3072, 632, "Electric Interface - CB-R", "PILOT CB All Right CBs ON")
defineToggleSwitch("PLT_CB_R_CONTR_FORCE", 1, 3074, 602, "Electric Interface - CB-R", "PILOT CB Control Force Grad, ON/OFF")
defineToggleSwitch("PLT_CB_R_CONTR_CLUTCH", 1, 3075, 603, "Electric Interface - CB-R", "PILOT CB Collective Lever Lock, ON/OFF")
defineToggleSwitch("PLT_CB_R_TEMP_L", 1, 3076, 604, "Electric Interface - CB-R", "PILOT CB Temperature Control Left Governor RPM, ON/OFF")
defineToggleSwitch("PLT_CB_R_TEMP_R", 1, 3077, 605, "Electric Interface - CB-R", "PILOT CB Temperature Control Right Governor RPM, ON/OFF")
defineToggleSwitch("PLT_CB_R_ROTOR_RPM", 1, 3078, 606, "Electric Interface - CB-R", "PILOT CB Rotor RPM Adjust, ON/OFF")
defineToggleSwitch("PLT_CB_R_SIGNAL", 1, 3079, 607, "Electric Interface - CB-R", "PILOT CB Signal, ON/OFF")
defineToggleSwitch("PLT_CB_R_CAMERA", 1, 3080, 608, "Electric Interface - CB-R", "PILOT CB Camera, ON/OFF")
defineToggleSwitch("PLT_CB_R_ARM_CONTROL", 1, 3081, 609, "Electric Interface - CB-R", "PILOT CB Armament Control, ON/OFF")
defineToggleSwitch("PLT_CB_R_CANNON", 1, 3082, 610, "Electric Interface - CB-R", "PILOT CB Cannon, ON/OFF")
defineToggleSwitch("PLT_CB_R_FIRE_AUTO", 1, 3083, 611, "Electric Interface - CB-R", "PILOT CB Squib-2 Auto Fire Protection, ON/OFF")
defineToggleSwitch("PLT_CB_R_FIRE_MAN", 1, 3084, 612, "Electric Interface - CB-R", "PILOT CB Squib-2 Manual Fire Protection, ON/OFF")
defineToggleSwitch("PLT_CB_R_STORE_TAC", 1, 3085, 613, "Electric Interface - CB-R", "PILOT CB External Stores Tactical Release, ON/OFF")
defineToggleSwitch("PLT_CB_R_STORE_LOCK", 1, 3086, 614, "Electric Interface - CB-R", "PILOT CB External Stores Release Lock, ON/OFF")
defineToggleSwitch("PLT_CB_R_GEAR_VALVE", 1, 3087, 615, "Electric Interface - CB-R", "PILOT CB Landing Gear Valve, ON/OFF")
defineToggleSwitch("PLT_CB_R_DETACH_RAILS", 1, 3088, 616, "Electric Interface - CB-R", "PILOT CB Jettison Missile Rails, ON/OFF")
defineToggleSwitch("PLT_CB_R_BOMB_REL", 1, 3089, 617, "Electric Interface - CB-R", "PILOT CB Bombs Release, ON/OFF")
defineToggleSwitch("PLT_CB_R_CONNECT_DISTR", 1, 3090, 618, "Electric Interface - CB-R", "PILOT CB Connection Distribution Device, ON/OFF")
defineToggleSwitch("PLT_CB_R_PILOT_SIGHT", 1, 3091, 619, "Electric Interface - CB-R", "PILOT CB PILOT SIGHT Device, ON/OFF")
defineToggleSwitch("PLT_CB_R_DUASV_HEAT", 1, 3092, 620, "Electric Interface - CB-R", "PILOT CB Air Data Computer Heating, ON/OFF")
defineToggleSwitch("PLT_CB_R_JETT_DOOR_PLT", 1, 3093, 621, "Electric Interface - CB-R", "PILOT CB Jettison Pilot´s Door, ON/OFF")
defineToggleSwitch("PLT_CB_R_JETT_DOOR_OP", 1, 3094, 622, "Electric Interface - CB-R", "PILOT CB Jettison Gunner´s Door, ON/OFF")
defineToggleSwitch("PLT_CB_R_AIR_CONT", 1, 3095, 623, "Electric Interface - CB-R", "PILOT CB Air Conditioning, ON/OFF")
defineToggleSwitch("PLT_CB_R_FUEL_IND", 1, 3096, 624, "Electric Interface - CB-R", "PILOT CB Fuel Quantity Indication, ON/OFF")
defineToggleSwitch("PLT_CB_R_FUEL_T2_VALVE", 1, 3097, 625, "Electric Interface - CB-R", "PILOT CB Fuel Tank 2 Valve, ON/OFF")
defineToggleSwitch("PLT_CB_R_FUEL_T2_OFF", 1, 3098, 626, "Electric Interface - CB-R", "PILOT CB Fuel Tank 2 Shutoff Valve, ON/OFF")
defineToggleSwitch("PLT_CB_R_FUEL_PUMP2", 1, 3099, 627, "Electric Interface - CB-R", "PILOT CB Fuel Pump 2, ON/OFF")
defineToggleSwitch("PLT_CB_R_FUEL_PUMP4", 1, 3100, 628, "Electric Interface - CB-R", "PILOT CB Fuel Pump 4, ON/OFF")
defineToggleSwitch("PLT_CB_R_PILOT_SEAT", 1, 3101, 629, "Electric Interface - CB-R", "PILOT CB Pilot Seat Adjustment, ON/OFF")
defineToggleSwitch("PLT_CB_R_AICE_WARN", 1, 3102, 630, "Electric Interface - CB-R", "PILOT CB Anti-Ice System - Warning, ON/OFF")
defineToggleSwitch("PLT_CB_R_AICE_CONTR", 1, 3103, 631, "Electric Interface - CB-R", "PILOT CB Anti-Ice System - Control, ON/OFF")
definePushButton("PLT_CB_L_ALL", 1, 3070, 601, "Electric Interface - CB-L", "PILOT CB All Left CBs ON")
defineToggleSwitch("PLT_CB_L_MISSLE_PWR", 1, 3104, 572, "Electric Interface - CB-L", "PILOT CB Missile Power - Control, ON/OFF")
defineToggleSwitch("PLT_CB_L_EMERG_JETT", 1, 3105, 573, "Electric Interface - CB-L", "PILOT CB Emergency Jettison - Control, ON/OFF")
defineToggleSwitch("PLT_CB_L_BOMBS", 1, 3106, 574, "Electric Interface - CB-L", "PILOT CB Bombs, ON/OFF")
defineToggleSwitch("PLT_CB_L_ROCKETS", 1, 3107, 575, "Electric Interface - CB-L", "PILOT CB Rockets, ON/OFF")
defineToggleSwitch("PLT_CB_L_ADF", 1, 3108, 576, "Electric Interface - CB-L", "PILOT CB ADF, ON/OFF")
defineToggleSwitch("PLT_CB_L_FUEL_OFF", 1, 3109, 577, "Electric Interface - CB-L", "PILOT CB Fuel Shutoff Valve, ON/OFF")
defineToggleSwitch("PLT_CB_L_CROSS_FEED", 1, 3110, 578, "Electric Interface - CB-L", "PILOT CB Cross Feed Valve, ON/OFF")
defineToggleSwitch("PLT_CB_L_TANK1", 1, 3111, 579, "Electric Interface - CB-L", "PILOT CB Tank 1 Valve, ON/OFF")
defineToggleSwitch("PLT_CB_L_TANK_FIRE", 1, 3112, 580, "Electric Interface - CB-L", "PILOT CB Tank Fire Warning, ON/OFF")
defineToggleSwitch("PLT_CB_L_VALVE_SEP", 1, 3113, 581, "Electric Interface - CB-L", "PILOT CB Left Valve Separation, ON/OFF")
defineToggleSwitch("PLT_CB_L_WS_SPRAY", 1, 3114, 582, "Electric Interface - CB-L", "PILOT CB Windshield Spray, ON/OFF")
defineToggleSwitch("PLT_CB_L_WS_WIPER_OP", 1, 3115, 583, "Electric Interface - CB-L", "PILOT CB Windshield Wiper Gunner, ON/OFF")
defineToggleSwitch("PLT_CB_L_WS_WIPER_PLT", 1, 3116, 584, "Electric Interface - CB-L", "PILOT CB Windshield Wiper Pilot, ON/OFF")
defineToggleSwitch("PLT_CB_L_WARN_SYS", 1, 3117, 585, "Electric Interface - CB-L", "PILOT CB Audio Warning System, ON/OFF")
defineToggleSwitch("PLT_CB_L_FLIGHT_REC", 1, 3118, 586, "Electric Interface - CB-L", "PILOT CB Flight Recorder, ON/OFF")
defineToggleSwitch("PLT_CB_L_FIRE_SYS_AUTO", 1, 3119, 587, "Electric Interface - CB-L", "PILOT CB Fire Protection System - Auto, ON/OFF")
defineToggleSwitch("PLT_CB_L_FIRE_SYS_MAN", 1, 3120, 588, "Electric Interface - CB-L", "PILOT CB Fire Protection System - Manual, ON/OFF")
defineToggleSwitch("PLT_CB_L_FIRE_SYS_WARN", 1, 3121, 589, "Electric Interface - CB-L", "PILOT CB Fire Protection System Warning, ON/OFF")
defineToggleSwitch("PLT_CB_L_CARGO_EXT_JETT", 1, 3122, 590, "Electric Interface - CB-L", "PILOT CB External Cargo Emergency Jettison, ON/OFF")
defineToggleSwitch("PLT_CB_L_GEAR", 1, 3123, 591, "Electric Interface - CB-L", "PILOT CB Landing Gear Extend / Retract, ON/OFF")
defineToggleSwitch("PLT_CB_L_GEAR_WARN", 1, 3124, 592, "Electric Interface - CB-L", "PILOT CB Landing Gear Warning, ON/OFF")
defineToggleSwitch("PLT_CB_L_INVERTER", 1, 3125, 593, "Electric Interface - CB-L", "PILOT CB Inverter, ON/OFF")
defineToggleSwitch("PLT_CB_L_AIR_SPEED", 1, 3126, 594, "Electric Interface - CB-L", "PILOT CB Air Speed Sensor, ON/OFF")
defineToggleSwitch("PLT_CB_L_AFCS_WARN", 1, 3127, 595, "Electric Interface - CB-L", "PILOT CB AFCS Warn, ON/OFF")
defineToggleSwitch("PLT_CB_L_AUTO_START", 1, 3128, 596, "Electric Interface - CB-L", "PILOT CB Auto Start System, ON/OFF")
defineToggleSwitch("PLT_CB_L_IGNITION", 1, 3129, 597, "Electric Interface - CB-L", "PILOT CB Igniter, ON/OFF")
defineToggleSwitch("PLT_CB_L_BEACON_L", 1, 3130, 598, "Electric Interface - CB-L", "PILOT CB Beacon Light, ON/OFF")
defineToggleSwitch("PLT_CB_L_LAND_L", 1, 3131, 599, "Electric Interface - CB-L", "PILOT CB Landing Light Control, ON/OFF")
defineToggleSwitch("PLT_CB_L_MAIN_ATT", 1, 3132, 600, "Electric Interface - CB-L", "PILOT CB Main Attitude Indicator, ON/OFF")

--Fuel Interface
defineToggleSwitch("PLT_FEED_TANK1", 2, 3031, 392, "Fuel Interface", "PILOT Feed Tank 1 Valve Switch, OPEN/CLOSE")
defineToggleSwitch("PLT_FEED_TANK2", 2, 3034, 394, "Fuel Interface", "PILOT Feed Tank 2 Valve Switch, OPEN/CLOSE")
defineToggleSwitch("PLT_FIRE_VALVE_L_CV", 2, 3019, 396, "Fuel Interface", "PILOT Left Engine Fire Valve Cover, UP/DOWN")
defineToggleSwitch("PLT_FIRE_VALVE_L", 2, 3016, 397, "Fuel Interface", "PILOT Left Engine Fire Valve, OPEN/CLOSE")
defineToggleSwitch("PLT_FIRE_VALVE_R_CV", 2, 3025, 399, "Fuel Interface", "PILOT Right Engine Fire Valve Cover, UP/DOWN")
defineToggleSwitch("PLT_FIRE_VALVE_R", 2, 3022, 400, "Fuel Interface", "PILOT Right Engine Fire Valve, OPEN/CLOSE")
defineToggleSwitch("PLT_FUEL_DELIM", 2, 3028, 402, "Fuel Interface", "PILOT Fuel Delimiter Valve, OPEN/CLOSE")
defineToggleSwitch("PLT_EXT_TANKS", 2, 3013, 411, "Fuel Interface", "PILOT External Tanks, OPEN/CLOSE")
defineToggleSwitch("PLT_PUMP_TANK4", 2, 3007, 404, "Fuel Interface", "PILOT Tank 4 Pump, ON/OFF")
defineToggleSwitch("PLT_PUMP_TANK5", 2, 3010, 406, "Fuel Interface", "PILOT Tank 5 Pump, ON/OFF")
defineToggleSwitch("PLT_PUMP_TANK1", 2, 3001, 408, "Fuel Interface", "PILOT Tank 1 Pump, ON/OFF")
defineToggleSwitch("PLT_PUMP_TANK2", 2, 3004, 410, "Fuel Interface", "PILOT Tank 2 Pump, ON/OFF")
definePushButton("PLT_FUEL_TEST_H", 2, 3040, 524, "Fuel Interface", "PILOT Fuel meter test low")
definePushButton("PLT_FUEL_TEST_P", 2, 3042, 526, "Fuel Interface", "PILOT Fuel meter test high")
defineMultipositionSwitch("PLT_FUEL_METER_KNB", 2, 3037, 191, 7, 1/6, "Fuel Interface", "PILOT Select tank for fuel meter")

--Engine Interface
definePushButton("PLT_APU_START", 3, 3012, 307, "Engine Interface", "PILOT APU Start")
definePushButton("PLT_APU_STOP", 3, 3013, 311, "Engine Interface", "PILOT APU Stop")
define3PosTumb("PLT_APU_CRANK", 3, 3014, 313, "Engine Interface", "PILOT APU Launch Method START/CRANK/FALSE")
definePushButton("PLT_ENG_START", 3, 3015, 314, "Engine Interface", "PILOT Engine Start")
definePushButton("PLT_ENG_ABORT", 3, 3017, 318, "Engine Interface", "PILOT Engine Interrupt Start")
defineToggleSwitch("PLT_ENG_SEL_LR", 3, 3016, 320, "Engine Interface", "PILOT Engine Select RIGHT/LEFT")
defineToggleSwitch("PLT_ENG_SEL_LAUNCH", 3, 3018, 321, "Engine Interface", "PILOT Engine Select RIGHT/LEFT")
defineToggleSwitch("PLT_DEDUST_CV", 3, 3022, 514, "Engine Interface", "PILOT Antidust ON Cover, UP/DOWN")
defineToggleSwitch("PLT_DEDUST", 3, 3021, 796, "Engine Interface", "PILOT Antidust ON/OFF")
definePushButton("PLT_ENG_TEMP_COLD", 3, 3023, 194, "Engine Interface", "PILOT Engine Thermometer control COLD")
definePushButton("PLT_ENG_TEMP_HOT", 3, 3024, 195, "Engine Interface", "PILOT Engine Thermometer control HOT")

--AntiIce Interface
defineToggleSwitch("PLT_DEICER_MODE", 60, 3001, 109, "AntiIce Interface", "PILOT AntiIce AUTO/MANUAL")
definePushButton("PLT_DEICER_OFF", 60, 3002, 110, "AntiIce Interface", "PILOT AntiIce OFF")
defineToggleSwitch("PLT_DEICER_ENG_L", 60, 3003, 113, "AntiIce Interface", "PILOT Left Engine AntiIce ON/OFF")
defineToggleSwitch("PLT_DEICER_ENG_R", 60, 3004, 112, "AntiIce Interface", "PILOT Right Engine AntiIce ON/OFF")
define3PosTumb("PLT_DEICER_WSHIELD", 60, 3005, 111, "AntiIce Interface", "PILOT Windshield Antiice LOW/OFF/HIGH")
define3PosTumb("OP_DEICER_WSHIELD", 60, 3006, 675, "AntiIce Interface", "OPERATOR Windshield Antiice LOW/OFF/HIGH")
defineMultipositionSwitch("PLT_DEICER_KNB", 60, 3007, 114, 11, 0.1, "AntiIce Interface", "PILOT AntiIce Knob")

--SAU (autopilot)
defineToggleSwitch("PLT_SAU_BTN_BRIGHT", 10, 3070, 267, "SAU", "PILOT SAU Button Brightness, BRIGHT/DIM")
definePushButton("PLT_SAU_H_ON", 10, 3005, 237, "SAU", "PILOT SAU H Channel ON")
definePushButton("PLT_SAU_H_OFF", 10, 3007, 236, "SAU", "PILOT SAU H Channel OFF")
definePushButton("PLT_SAU_K_ON", 10, 3001, 243, "SAU", "PILOT SAU K Channel ON")
definePushButton("PLT_SAU_K_OFF", 10, 3003, 242, "SAU", "PILOT SAU K Channel OFF")
definePushButton("PLT_SAU_T_ON", 10, 3009, 249, "SAU", "PILOT SAU T Channel ON")
definePushButton("PLT_SAU_T_OFF", 10, 3011, 248, "SAU", "PILOT SAU T Channel OFF")
definePushButton("PLT_SAU_B_ON", 10, 3013, 255, "SAU", "PILOT SAU B Channel ON")
definePushButton("PLT_SAU_B_OFF", 10, 3015, 254, "SAU", "PILOT SAU B Channel OFF")
defineRotary("PLT_SAU_H_CORRECT", 10, 3021, 234, "SAU", "PILOT SAU H Channel Delta Correction")
defineRotary("PLT_SAU_K_CORRECT", 10, 3023, 240, "SAU", "PILOT SAU K Channel Delta Correction")
defineRotary("PLT_SAU_T_CORRECT", 10, 3025, 246, "SAU", "PILOT SAU T Channel Delta Correction")
definePushButton("PLT_SAU_ALT_MODE_ON", 10, 3032, 258, "SAU", "PILOT SAU Altitude Mode ON")
definePushButton("PLT_SAU_ALT_MODE_OFF", 10, 3034, 257, "SAU", "PILOT SAU Altitude Mode OFF")
definePushButton("PLT_SAU_HOVER_MODE_ON", 10, 3036, 259, "SAU", "PILOT SAU Hover Mode ON")
definePushButton("PLT_SAU_ROUTE_MODE_ON", 10, 3038, 261, "SAU", "PILOT SAU Route Mode ON")
definePushButton("PLT_SAU_HOVER_ROUTE_MODE_OFF", 10, 3040, 260, "SAU", "PILOT SAU Hover and Route Modes OFF")
defineRotary("PLT_SAU_ROUTE_AZIMUTH", 10, 3030, 262, "SAU", "PILOT SAU Route Azimuth")
-- defineFixedStepInput("PLT_SAU_ROUTE_AZIMUTH", 10, 3030, {-1, 1}, "SAU", "PILOT SAU Route Azimuth") --TODO: get fixed step input working

local function getSAURouteAzimuth()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    return string.format("%.0f%.0f%.0f", 10-(a(265)*10), 10-(a(264)*10), 10-(a(263)*10))
end
defineString("PLT_SAU_ROUTE_AZIMUTH_DISPLAY_STR", getSAURouteAzimuth, 3, "SAU", "PILOT SAU Route Azimuth (String)")
definePushButton("PLT_SAU_SPEED_STAB_ON", 10, 3042, 268, "SAU", "PILOT SAU Speed Stabilization ON")
definePushButton("PLT_SAU_SPEED_STAB_OFF", 10, 3044, 269, "SAU", "PILOT SAU Speed Stabilization OFF")
defineRockerSwitch("PLT_SAU_ALT_CONTROL", 10, 3019, 3019, 3017, 3017, 253, "SAU", "PILOT SAU Altitude Control")

---Lights
defineIndicatorLight("PLT_SAU_L_K_ON", 281, "SAU Lights", "PILOT SAU K ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_K_OFF", 280, "SAU Lights", "PILOT SAU K OFF Light (Red)")
defineIndicatorLight("PLT_SAU_L_H_ON", 279, "SAU Lights", "PILOT SAU H ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_H_OFF", 278, "SAU Lights", "PILOT SAU H OFF Light (Red)")
defineIndicatorLight("PLT_SAU_L_B_ON", 296, "SAU Lights", "PILOT SAU B ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_B_OFF", 295, "SAU Lights", "PILOT SAU B OFF Light (Red)")
defineIndicatorLight("PLT_SAU_L_T_ON", 294, "SAU Lights", "PILOT SAU T ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_T_OFF", 293, "SAU Lights", "PILOT SAU T OFF Light (Red)")
defineIndicatorLight("PLT_SAU_L_ROUTE_MODE_ON", 299, "SAU Lights", "PILOT SAU Route Mode ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_HOVER_ROUTE_MODE_OFF", 298, "SAU Lights", "PILOT SAU Hover and Route Modes OFF Light (Red)")
defineIndicatorLight("PLT_SAU_L_HOVER_MODE_ON", 297, "SAU Lights", "PILOT SAU Hover Mode ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_ALT_MODE_ON", 304, "SAU Lights", "PILOT SAU Altitude Mode ON Light (Green)")
defineIndicatorLight("PLT_SAU_L_ALT_MODE_OFF", 303, "SAU Lights", "PILOT SAU Altitude Mode OFF Light (Red)")

---Gauges
defineFloat("PLT_SAU_H_DELTA", 238, {-1, 1}, "SAU Gauges", "PILOT SAU Yaw Delta")
defineFloat("PLT_SAU_K_DELTA", 244, {-1, 1}, "SAU Gauges", "PILOT SAU Roll Delta")
defineFloat("PLT_SAU_T_DELTA", 251, {-1, 1}, "SAU Gauges", "PILOT SAU Pitch Delta")
defineFloat("PLT_SAU_B_DELTA", 256, {-1, 1}, "SAU Gauges", "PILOT SAU Altitude Delta")
defineFloat("PLT_SAU_H_NUM", 235, {0, 1}, "SAU Gauges", "PILOT SAU Yaw Number")
defineFloat("PLT_SAU_K_NUM", 241, {0, 1}, "SAU Gauges", "PILOT SAU Roll Number")
defineFloat("PLT_SAU_T_NUM", 247, {0, 1}, "SAU Gauges", "PILOT SAU Pitch Number")
defineFloat("PLT_SAU_H_CORRECT_PRESS", 233, {0, 1}, "SAU", "PILOT SAU Yaw Pressed")
defineFloat("PLT_SAU_K_CORRECT_PRESS", 239, {0, 1}, "SAU", "PILOT SAU Roll Pressed")
defineFloat("PLT_SAU_T_CORRECT_PRESS", 245, {0, 1}, "SAU", "PILOT SAU Pitch Pressed")

--Fire Extinguisher
definePushButton("PLT_FIRE_EX_ENG_L1", 13, 3001, 502, "Fire Extinguisher", "PILOT Extinguish Left Engine 1")
definePushButton("PLT_FIRE_EX_ENG_L2", 13, 3002, 504, "Fire Extinguisher", "PILOT Extinguish Left Engine 2")
definePushButton("PLT_FIRE_EX_ENG_R1", 13, 3003, 498, "Fire Extinguisher", "PILOT Extinguish Right Engine 1")
definePushButton("PLT_FIRE_EX_ENG_R2", 13, 3004, 500, "Fire Extinguisher", "PILOT Extinguish Right Engine 2")
definePushButton("PLT_FIRE_EX_APU1", 13, 3005, 494, "Fire Extinguisher", "PILOT Extinguish APU 1")
definePushButton("PLT_FIRE_EX_APU2", 13, 3006, 496, "Fire Extinguisher", "PILOT Extinguish APU 2")
definePushButton("PLT_FIRE_EX_GEAR1", 13, 3007, 490, "Fire Extinguisher", "PILOT Extinguish Gearbox 1")
definePushButton("PLT_FIRE_EX_GEAR2", 13, 3008, 492, "Fire Extinguisher", "PILOT Extinguish Gearbox 2")
definePushButton("PLT_FIRE_ALARM_OFF", 13, 3009, 488, "Fire Extinguisher", "PILOT Turn Off Fire Signal Button")
defineToggleSwitch("PLT_FIRE_EX_CONTROL", 13, 3010, 482, "Fire Extinguisher", "PILOT Extinguisher Control Switch EXING/CNTRL")
defineTumb("PLT_FIRE_EX_SENSOR_CHAN", 13, 3013, 484, 0.3, {0, 1}, nil, false, "Fire Extinguisher", "PILOT Fire Extinguisher Sensor Channel OFF/1/2/3")
define3Pos2CommandSwitch("PLT_FIRE_EX_SQUIB", 13, 3012, 3011, 486, "Fire Extinguisher", "PILOT Extinguisher Squib Control")
defineToggleSwitch("PLT_FIRE_EX_PW", 13, 3014, 487, "Fire Extinguisher", "PILOT Extinguisher Power ON/OFF")


--SPUU-52
defineToggleSwitch("PLT_SPUU_POWER", 19, 3010, 270, "SPUU", "PILOT SPUU Power, ON/OFF")
defineToggleSwitch("PLT_SPUU_OFF", 19, 3001, 275, "SPUU", "PILOT SPUU OFF")
defineRockerSwitch("PLT_SPUU_CONTROL", 19, 3007, 3007, 3006, 3006, 277, "SPUU", "PILOT SPUU Control Switch, P/NONE/T")
definePotentiometer("PLT_SPUU_ROUTE_AZIMUTH", 19, 3003, 276, {0, 1}, "SPUU", "PILOT SPUU Route Azimuth")

---Lights
defineIndicatorLight("PLT_SPUU_L_SPUU_OFF", 302, "SPUU Lights", "PILOT SAU SPUU OFF Light (Red)")

---Gauges
defineFloat("PLT_SPUU_DELTA", 271, {-1, 1}, "SPUU Gauges", "PILOT SPUU Delta")

--Cyclic
definePushButton("PLT_CYCLIC_AP_TRIM", 10, 3027, 742, "Cyclic", "PILOT Cyclic Autopilot Trimmer")
definePushButton("OP_CYCLIC_AP_TRIM", 10, 3028, 855, "Cyclic", "OPERATOR Cyclic Autopilot Trimmer")

----WeaponSystems
--Stick
defineToggleSwitch("PLT_STICK_FIRE_WPNS_CV", 6, 3002, 740, "Stick", "PILOT Stick Fire Weapons Cover")
definePushButton("PLT_STICK_FIRE_WPNS", 6, 3001, 741, "Stick", "PILOT Stick Fire Weapons")
defineToggleSwitch("OP_STICK_FIRE_WPNS_CV", 6, 3022, 583, "Stick", "OPERATOR Stick Fire Weapons Cover")
definePushButton("OP_STICK_FIRE_WPNS", 6, 3021, 187, "Stick", "OPERATOR Stick Fire Weapons")
definePushButton("OP_STICK_ENGAGE", 30, 3011, 865, "Stick", "OPERATOR Engage Stick")
defineToggleSwitch("OP_STICK_DISENGAGE_CV", 30, 3013, 857, "Stick", "OPERATOR Disengage Stick Cover")
definePushButton("OP_STICK_DISENGAGE", 30, 3012, 859, "Stick", "OPERATOR Disengage Stick")

---PUVL
defineToggleSwitch("PLT_PUVL_SIGHT_DISTANCE", 16, 3003, 515, "PUVL", "PILOT Sight Distance, MANUAL/AUTO")
define3PosTumb("PLT_PUVL_BURST_LENGTH", 6, 3003, 521, "PUVL", "PILOT Burst Length, SHORT/LONG/MEDIUM")
defineTumb("PLT_PUVL_RELOAD_LEFT_GONDOLA", 6, 3004, 522, 0.1, {0.0, 0.3}, nil, false, "PUVL", "PILOT Reload Left Gondola, OFF/1/2/3")
defineTumb("PLT_PUVL_RELOAD_RIGHT_GONDOLA", 6, 3005, 527, 0.1, {0.0, 0.3}, nil, false, "PUVL", "PILOT Reload Right Gondola, OFF/1/2/3")
defineToggleSwitch("PLT_PUVL_WEAPON_SIGHT", 16, 3014, 529, "PUVL", "PILOT Weapon Sight, ON/OFF")
defineToggleSwitch("PLT_PUVL_WEAPON_CAMERA", 6, 3006, 530, "PUVL", "PILOT Weapon Camera, ON/OFF")
definePotentiometer("PLT_PUVL_MANUAL_RANGE", 16, 3004, 552, {0, 1}, "PUVL", "PILOT Manual Range Adjustment")
defineTumb("PLT_PUVL_WEAPON_SELECT", 6, 3007, 523, 0.1, {0.0, 0.8}, nil, false, "PUVL", "PILOT Weapon Selector, 9-POS")
definePushButton("PLT_PUVL_SIGHT_ZERO", 16, 3007, 528, "PUVL", "PILOT Sight Reset Crosshair")
define3PosTumb("PLT_PUVL_ROCKET_SELECT", 6, 3008, 531, "PUVL", "PILOT Rocket Select, LEFT/BOTH/RIGHT")
defineToggleSwitch("PLT_PUVL_FIRE_CONTROL", 6, 3009, 551, "PUVL", "PILOT Weapon Control, ON/OFF")
defineToggleSwitch("PLT_PUVL_CANNON_FIRE_RATE", 6, 3010, 550, "PUVL", "PILOT Cannon Fire Rate, SLOW/FAST")
definePushButton("PLT_PUVL_RELOAD_CANNON", 6, 3011, 549, "PUVL", "PILOT Reload Cannon")
definePushButton("PLT_PUVL_STOP_CONTAINER", 6, 3012, 547, "PUVL", "PILOT Stop Container")
defineToggleSwitch("PLT_PUVL_EXP_ON_JETT", 6, 3013, 546, "PUVL", "PILOT Explosion on Jettison, ON/OFF")
defineToggleSwitch("PLT_PUVL_EXP_ON_JETT_CV", 6, 3014, 545, "PUVL", "PILOT Explosion on Jettison Cover, UP/DOWN")
definePushButton("PLT_PUVL_JETT_PYLONS", 6, 3015, 542, "PUVL", "PILOT Jettison Pylons")
defineToggleSwitch("PLT_PUVL_JETT_PYLONS_CV", 6, 3016, 541, "PUVL", "PILOT Jettison Pylons Cover, UP/DOWN")
definePushButton("PLT_PUVL_JETT_LAUNCHER", 6, 3017, 538, "PUVL", "PILOT Jettison Launcher")
defineToggleSwitch("PLT_PUVL_JETT_LAUNCHER_CV", 6, 3018, 537, "PUVL", "PILOT Jettison Launcher Cover, UP/DOWN")
definePushButton("PLT_PUVL_ARM_ROCKETS", 6, 3019, 536, "PUVL", "PILOT Arm Rockets")

---ASP17
defineToggleSwitch("PLT_ASP17_SIGHT_MODE_MAN_AUTO", 16, 3001, 553, "ASP17", "PILOT ASP17 Sight Mode, MANUAL/AUTO")
defineToggleSwitch("PLT_ASP17_SIGHT_MODE_SYNC_ASYNC", 16, 3002, 554, "ASP17", "PILOT ASP17 Sight Mode, SYNC/ASYNC")
definePotentiometer("PLT_ASP17_SIGHT_VERTICAL_ADJUST", 16, 3005, 556, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Vertical Adjustment")
definePotentiometer("PLT_ASP17_SIGHT_BASE_ADJUST", 16, 3008, 557, {0, 1}, "ASP17", "PILOT ASP17 Base and Range Adjustment")
definePotentiometer("PLT_ASP17_SIGHT_CROSSHAIR_BRIGHT_ADJUST", 16, 3011, 564, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Brightness Adjustment")
definePotentiometer("PLT_ASP17_SIGHT_HORIZONTAL_ADJUST", 16, 3006, 566, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Horizontal Adjustment")
definePotentiometer("PLT_ASP17_SIGHT_GRID_BRIGHT_ADJUST", 16, 3010, 567, {0, 1}, "ASP17", "PILOT ASP17 Sight Grid Brightness Adjustment")
defineToggleSwitch("PLT_ASP17_SIGHT_CROSSHAIR_LAMP", 16, 3013, 568, "ASP17", "PILOT ASP17 Sight Crosshair Lamp, MAIN/BACKUP")
defineToggleSwitch("PLT_ASP17_SIGHT_GRID_LAMP", 16, 3012, 569, "ASP17", "PILOT ASP17 Sight Grid Lamp, MAIN/BACKUP")
definePushButton("PLT_ASP17_SIGHT_CONTROL", 16, 3009, 570, "ASP17", "PILOT ASP17 Sight Control")

--Lights
defineIndicatorLight("PLT_ASP17_L_KMG", 559, "ASP17 Lights", "PILOT ASP17 KMG (USLP) Light (Amber)")
defineIndicatorLight("PLT_ASP17_L_GUV", 560, "ASP17 Lights", "PILOT ASP17 GUV (FXD MG) Light (Amber)")
defineIndicatorLight("PLT_ASP17_L_BOMBS", 561, "ASP17 Lights", "PILOT ASP17 BOMBS Light (Amber)")
defineIndicatorLight("PLT_ASP17_L_30", 562, "ASP17 Lights", "PILOT ASP17 30 Light (Amber)")
defineIndicatorLight("PLT_ASP17_L_NRS", 563, "ASP17 Lights", "PILOT ASP17 NRS (RKT) Light (Amber)")
defineIndicatorLight("PLT_ASP17_L_GREEN", 679, "ASP17 Lights", "PILOT ASP17 Green Light (Green)")
defineIndicatorLight("PLT_ASP17_L_YELLOW", 678, "ASP17 Lights", "PILOT ASP17 Yellow Light (Yellow)")
defineIndicatorLight("PLT_ASP17_L_GODEN", 571, "ASP17 Lights", "PILOT ASP17 Goden Light")
defineIndicatorLight("PLT_ASP17_L_USR_CHECK", 760, "ASP17 Lights", "PILOT ASP17 USR Check Light")

defineIndicatorLight("PLT_PUVL_L_EXPLODE_ARMED", 548, "PUVL Lights", "PILOT PUVL Explosion on Jettison ARMED Light (Red)")
defineIndicatorLight("PLT_PUVL_L_PYLON_1", 544, "PUVL Lights", "PILOT PUVL Pylon 1 Light (Yellow)")
defineIndicatorLight("PLT_PUVL_L_PYLON_2", 543, "PUVL Lights", "PILOT PUVL Pylon 2 Light (Yellow)")
defineIndicatorLight("PLT_PUVL_L_PYLON_3", 540, "PUVL Lights", "PILOT PUVL Pylon 3 Light (Yellow)")
defineIndicatorLight("PLT_PUVL_L_PYLON_4", 539, "PUVL Lights", "PILOT PUVL Pylon 4 Light (Yellow)")
defineIndicatorLight("PLT_PUVL_L_USLP_LOADED", 533, "PUVL Lights", "PILOT PUVL USLP Loaded Light (Amber)")
defineIndicatorLight("PLT_PUVL_L_USLP_FINISHED", 532, "PUVL Lights", "PILOT PUVL USLP Finished Light (Amber)")
defineIndicatorLight("PLT_PUVL_L_LH_SIDE", 535, "PUVL Lights", "PILOT PUVL LH Side Light (Amber)")
defineIndicatorLight("PLT_PUVL_L_RH_SIDE", 534, "PUVL Lights", "PILOT PUVL RH Side Light (Amber)")

--Signal Flares
defineToggleSwitch("PLT_FLARES_1_PW", 64, 3001, 343, "Signal Flares", "PILOT Signal Flares Cassette 1 Power Switch, ON/OFF")
defineToggleSwitch("PLT_FLARES_1_RED", 64, 3003, 344, "Signal Flares", "PILOT Signal Flares Cassette 1 Launch Red Button")
defineToggleSwitch("PLT_FLARES_1_GRN", 64, 3002, 345, "Signal Flares", "PILOT Signal Flares Cassette 1 Launch Green Button")
defineToggleSwitch("PLT_FLARES_1_YEL", 64, 3005, 346, "Signal Flares", "PILOT Signal Flares Cassette 1 Launch Yellow Button")
defineToggleSwitch("PLT_FLARES_1_WHT", 64, 3004, 347, "Signal Flares", "PILOT Signal Flares Cassette 1 Launch White Button")
defineToggleSwitch("PLT_FLARES_2_PW", 64, 3006, 352, "Signal Flares", "PILOT Signal Flares Cassette 2 Power Switch, ON/OFF")
defineToggleSwitch("PLT_FLARES_2_RED", 64, 3008, 351, "Signal Flares", "PILOT Signal Flares Cassette 2 Launch Red Button")
defineToggleSwitch("PLT_FLARES_2_GRN", 64, 3007, 350, "Signal Flares", "PILOT Signal Flares Cassette 2 Launch Green Button")
defineToggleSwitch("PLT_FLARES_2_YEL", 64, 3010, 349, "Signal Flares", "PILOT Signal Flares Cassette 2 Launch Yellow Button")
defineToggleSwitch("PLT_FLARES_2_WHT", 64, 3009, 348, "Signal Flares", "PILOT Signal Flares Cassette 2 Launch White Button")

--Gauges
defineFloat("OP_CANOPY_VALUE", 849, {0, 1}, "Gauges OP", "OPERATOR Canopy Position")
defineFloat("PLT_CANOPY_PILOT_VALUE", 9, {0, 1}, "Gauges PLT", "PILOT Door Position")
defineFloat("PLT_VARIOMETER", 1, {-1, 1}, "Gauges PLT", "PILOT Variometer")
defineFloat("PLT_GMETER", 17, {-1, 1}, "Gauges PLT", "PILOT G-Meter")
defineFloat("PLT_GMETER_MIN", 16, {-1, 1}, "Gauges PLT", "PILOT G-Meter Min")
defineFloat("PLT_GMETER_MAX", 16, {-1, 1}, "Gauges PLT", "PILOT G-Meter Max")
defineFloat("PLT_IAS", 790, {-1, 1}, "Gauges PLT", "PILOT IAS Speed")
defineFloat("OP_IAS", 776, {-1, 1}, "Gauges OP", "OPERATOR IAS Speed")
defineFloat("PLT_UKT2_PITCH", 949, {-1, 1}, "Gauges PLT", "PILOT UKT-2 Pitch")
defineFloat("PLT_UKT2_ROLL", 950, {1, -1}, "Gauges PLT", "PILOT UKT-2 Roll")
defineFloat("PLT_UKT2_FAIL_FLG", 849, {0, 1}, "Gauges PLT", "PILOT UKT-2 Failure Flag")

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHTS", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Position Lights")
defineIntegerFromGetter("EXT_NOSE_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Nose Light (yellow)")
defineIntegerFromGetter("EXT_LAND_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (yellow)")
defineIntegerFromGetter("EXT_BEACON", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Beacon Light (red)")
defineIntegerFromGetter("EXT_TIP_L", function()
	if LoGetAircraftDrawArgumentValue(47) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tip Lights (yellow)")
defineIntegerFromGetter("EXT_WIPER", function()
	return math.floor(LoGetAircraftDrawArgumentValue(973)*65535)
end, 65535, "External Aircraft Model", "Wiper")
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