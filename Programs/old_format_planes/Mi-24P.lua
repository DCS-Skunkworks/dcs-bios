BIOS.protocol.beginModule("Mi-24P", 0x6800)
BIOS.protocol.setExportModuleAircrafts({"Mi-24P"})
--v1.2b by WarLord&charliefoxtwo
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

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
local defineSpringloaded_3PosTumb = BIOS.util.defineSpringloaded_3PosTumb
local define3PosTumb = BIOS.util.define3PosTumb

--Engine
defineToggleSwitch("PLT_ROTOR_BRAKE", 3, 3011, 745, "Engine", "PILOT Rotor Brake")
defineToggleSwitch("PLT_ENG_STOP_L", 3, 3009, 6, "Engine", "PILOT Left Engine Stop")
defineToggleSwitch("PLT_ENG_STOP_R", 3, 3010, 7, "Engine", "PILOT Right Engine Stop")
defineRotary("PLT_ENG_THROTTLE_L", 3, 3006, 5, "Engine", "PILOT Left Engine Throttle")
defineRotary("PLT_ENG_THROTTLE_R", 3, 3008, 4, "Engine", "PILOT Right Engine Throttle")
defineSpringloaded_3PosTumb("PLT_FREE_TURB_RPM", 3, 3020, 3019, 747, "Engine", "PILOT Readjust Free Turbine RPM, RIGHT/NEUTRAL/LEFT")

defineFloat("PLT_ROTOR_RPM", 42, {0, 1}, "Engine Gauges", "PILOT Rotor RPM")
defineFloat("PLT_ROTOR_PITCH", 36, {0, 1}, "Engine Gauges", "PILOT Rotor Pitch")
defineFloat("OP_ROTOR_RPM", 845, {0, 1}, "Engine Gauges", "OPERATOR Rotor RPM")
defineFloat("PLT_ENG_L_RPM", 40, {0, 1}, "Engine Gauges", "PILOT Left Engine RPM")
defineFloat("PLT_ENG_R_RPM", 41, {0, 1}, "Engine Gauges", "PILOT Right Engine RPM")
defineFloat("OP_ENG_L_RPM", 838, {0, 1}, "Engine Gauges", "OPERATOR Left Engine RPM")
defineFloat("OP_ENG_R_RPM", 839, {0, 1}, "Engine Gauges", "OPERATOR Right Engine RPM")
defineFloat("PLT_ENG_L_TEMP_100", 43, {0, 1}, "Engine Gauges", "PILOT Left Engine Temperature 100")
defineFloat("PLT_ENG_L_TEMP_10", 44, {0, 1}, "Engine Gauges", "PILOT Left Engine Temperature 10")
defineFloat("PLT_ENG_R_TEMP_100", 45, {0, 1}, "Engine Gauges", "PILOT Right Engine Temperature 100")
defineFloat("PLT_ENG_R_TEMP_10", 46, {0, 1}, "Engine Gauges", "PILOT Right Engine Temperature 10")
defineFloat("PLT_APU_TEMP", 292, {0, 1}, "Engine Gauges", "PILOT APU Temperature")
defineFloat("PLT_APU_PRESS", 305, {0, 1}, "Engine Gauges", "PILOT APU Pressure")
defineFloat("PLT_ENG_MODES", 39, {0, 1}, "Engine Gauges", "PILOT Engines Mode Indicator")
defineFloat("PLT_ENG_L_MODE", 37, {0, 1}, "Engine Gauges", "PILOT Left Engine Mode Indicator")
defineFloat("PLT_ENG_R_MODE", 38, {0, 1}, "Engine Gauges", "PILOT Right Engine Mode Indicator")
defineFloat("PLT_AICE_CURR", 118, {0, 1}, "Engine Gauges", "PILOT AntiIceCurrent")
defineFloat("PLT_OIL_PRESS_MAIN", 181, {0, 1}, "Engine Gauges", "PILOT Oil Pressure Main reductor")
defineFloat("PLT_OIL_TEMP_MAIN", 180, {-0.25, 0.65}, "Engine Gauges", "PILOT Oil Temperature Main reductor")
defineFloat("PLT_OIL_TEMP_TAIL", 190, {-0.25, 0.75}, "Engine Gauges", "PILOT Oil Temperature Tail reductor")
defineFloat("PLT_OIL_TEMP_INTER", 179, {-0.25, 0.75}, "Engine Gauges", "PILOT Oil Temperature Intermediate reductor")
defineFloat("PLT_OIL_PRESS_GEARBOX", 186, {0, 1}, "Engine Gauges", "PILOT Oil Pressure Gearbox")
defineFloat("PLT_OIL_TEMP_GEARBOX", 188, {-0.25, 0.65}, "Engine Gauges", "PILOT Oil Temperature Gearbox")
defineFloat("PLT_OIL_PRESS_ENG_L", 182, {0, 1}, "Engine Gauges", "PILOT Oil Pressure Left Engine")
defineFloat("PLT_OIL_TEMP_ENG_L", 183, {-0.25, 0.75}, "Engine Gauges", "PILOT Oil Temperature Left Engine")
defineFloat("PLT_OIL_PRESS_ENG_R", 184, {0, 1}, "Engine Gauges", "PILOT Oil Pressure Right Engine")
defineFloat("PLT_OIL_TEMP_ENG_R", 185, {-0.25, 0.75}, "Engine Gauges", "PILOT Oil Temperature Right Engine")
defineFloat("PLT_HYD_PRESS_MAIN", 23, {0, 1}, "Engine Gauges", "PILOT Hydraulic Main Pressure")
defineFloat("PLT_HYD_PRESS_AUX", 24, {0, 1}, "Engine Gauges", "PILOT Hydraulic Auxiliary Pressure")
defineFloat("PLT_HYD_PRESS_UTIL", 22, {0, 1}, "Engine Gauges", "PILOT Hydraulic Utility Pressure")
defineFloat("PLT_RAM_TEMP", 980, {0, 1}, "Engine Gauges", "PILOT RAM Temperature")

defineIndicatorLight("PLT_APU_ON_L", 79, "Engine Lights", "PILOT APU OFF Light (yellow)")
defineIndicatorLight("PLT_GEN_R_OFF_L", 81, "Engine Lights", "PILOT Right Generator OFF Light (red)")
defineIndicatorLight("PLT_GEN_L_OFF_L", 94, "Engine Lights", "PILOT Left Generator OFF Light (red)")
defineIndicatorLight("PLT_GEN_PARALLEL_L", 94, "Engine Lights", "PILOT Generators in Parallel Light (green)")
defineIndicatorLight("PLT_MAIN_TRANS_115_OFF_L", 82, "Engine Lights", "PILOT Main Transformer 115V OFF Light (yellow)")
defineIndicatorLight("PLT_MAIN_TRANS_36_OFF_L", 84, "Engine Lights", "PILOT Main Transformer 36V OFF Light (yellow)")
defineIndicatorLight("PLT_DC_SOCK_ON_L", 64, "Engine Lights", "PILOT DC Socket ON Light (yellow)")
defineIndicatorLight("PLT_AC_SOCK_ON_L", 86, "Engine Lights", "PILOT AC Socket ON Light (yellow)")
defineIndicatorLight("PLT_PO750A_ON_L", 92, "Engine Lights", "PILOT PO750A ON Light (yellow)")
defineIndicatorLight("PLT_PT125TS_OFF_L", 93, "Engine Lights", "PILOT PT125TS OFF Light (yellow)")

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

defineIndicatorLight("PLT_HYDRO_GEAR_L", 209, "Hydro Interface Lights", "PILOT Hydro Gear OFF Light (red)")
defineIndicatorLight("PLT_HYDRO_MAIN_L", 210, "Hydro Interface Lights", "PILOT Hydro Main ON Light (green)")
defineIndicatorLight("PLT_HYDRO_AUX_ON_L", 211, "Hydro Interface Lights", "PILOT Hydro Auxiliary ON Light (yellow)")
defineIndicatorLight("PLT_HYDRO_AUX_OFF_L", 212, "Hydro Interface Lights", "PILOT Hydro Auxiliary OFF Light (red)")

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
defineToggleSwitch("OP_CLOCK_HEAT", 11, 3048, 672, "Cockpit Mechanics OP", "OPERATOR Clock Heating Switch, ON/OFF")
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
define3PosTumb("PLT_STATIC-VALVE", 37, 3001, 520, "Cockpit Mechanics PLT", "PILOT Static valve sensor select LEFT/BOTH/RIGHT")

defineIndicatorLight("PLT_GEAR_N_DN_L", 230, "Cockpit Mechanics Lights", "PILOT Nose Gear Down Light (green)")
defineIndicatorLight("PLT_GEAR_L_DN_L", 229, "Cockpit Mechanics Lights", "PILOT Left Gear Down Light (green)")
defineIndicatorLight("PLT_GEAR_R_DN_L", 231, "Cockpit Mechanics Lights", "PILOT Right Gear Down Light (green)")
defineIndicatorLight("PLT_GEAR_N_UP_L", 226, "Cockpit Mechanics Lights", "PILOT Nose Gear Up Light (red)")
defineIndicatorLight("PLT_GEAR_L_UP_L", 225, "Cockpit Mechanics Lights", "PILOT Left Gear Up Light (red)")
defineIndicatorLight("PLT_GEAR_R_UP_L", 227, "Cockpit Mechanics Lights", "PILOT Right Gear Up Light (red)")
defineIndicatorLight("OP_GEAR_N_DN_L", 684, "Cockpit Mechanics Lights", "OPERATOR Nose Gear Down Light (green)")
defineIndicatorLight("OP_GEAR_L_DN_L", 683, "Cockpit Mechanics Lights", "OPERATOR Left Gear Down Light (green)")
defineIndicatorLight("OP_GEAR_R_DN_L", 685, "Cockpit Mechanics Lights", "OPERATOR Right Gear Down Light (green)")
defineIndicatorLight("OP_SIGHT_DOOR_OPEN_L", 754, "Cockpit Mechanics Lights", "OPERATOR Sight Doors Open Light (yellow)")

--IntLightSystem
define3PosTumb("OP_CABIN_L_SW", 23, 3001, 682, "Int Light System", "OPERATOR Cabin Lighting Switch, WHITE/OFF/RED")
define3PosTumb("PLT_CABIN_L_SW", 23, 3002, 356, "Int Light System", "PILOT Cabin Lighting Switch, WHITE/OFF/RED")
defineToggleSwitch("PLT_CARGO_L_SW", 23, 3003, 354, "Int Light System", "PILOT Cargo Lighting Switch, ON/OFF")
defineToggleSwitch("PLT_CARGO_L_CV", 23, 3004, 353, "Int Light System", "PILOT Cargo Lighting Switch Cover, UP/DOWN")
define3PosTumb("PLT_CARGO_COLOR_L_SW", 23, 3005, 355, "Int Light System", "PILOT Cargo Lighting Switch, WHITE/OFF/BLUE")
definePushButton("PLT_WARN_L_TEST", 23, 3008, 363, "Int Light System", "PILOT Test Warning Lights Button")
definePushButton("OP_WARN_L_TEST", 23, 3009, 681, "Int Light System", "OPERATOR Test Warning Lights Button")
defineToggleSwitch("PLT_DAY_NIGHT_SW", 23, 3010, 362, "Int Light System", "PILOT Day-Night Switch, DAY/NIGHT")
defineToggleSwitch("PLT_BLINK_SW", 23, 3011, 364, "Int Light System", "PILOT Blinker Switch, ON/OFF")
defineTumb("PLT_TRANSFROM_1_R", 23, 3012, 148, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 1 Group Of Red Lights Right And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("PLT_TRANSFROM_2_R", 23, 3013, 147, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 2 Group Of Red Lights Right And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineToggleSwitch("PLT_ARM_RED_L_SW", 23, 3014, 822, "Int Light System", "PILOT Armament Panel red Lights Switch, ON/OFF")
defineTumb("PLT_TRANSFROM_1_L", 23, 3015, 820, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 1 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("PLT_TRANSFROM_2_L", 23, 3016, 503, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Transformer 2 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("OP_TRANSFROM_1_L", 23, 3017, 1013, 0.1, {0, 1}, nil, false, "Int Light System", "OPERATOR Transformer 1 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("OP_TRANSFROM_2_L", 23, 3018, 1014, 0.1, {0, 1}, nil, false, "Int Light System", "OPERATOR Transformer 2 Group Of Red Lights Left And Pilot Panel, OFF/8V/9V/10V/11V/12V/13V/14V/16V/18V/20V")
defineTumb("PLT_TRANSFROM_BUILTIN", 23, 3020, 149, 0.1, {0, 1}, nil, false, "Int Light System", "PILOT Buildin Red Lights Transformer, OFF/0.6V/1.2V/1.8V/2.4V/3V/3.6V/4.2V/4.8V/5.4V/6V")

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

--EC System
defineToggleSwitch("PLT_CABIN_UNSEAL", 29, 3001, 133, "EC System", "PILOT Cabin Unseal Switch, ON/OFF")
define3PosTumb("PLT_AC_MODE", 29, 3002, 134, "EC System", "PILOT Blowdown Conditioning Switch, CONDITIONING/OFF/BLOWDOWN")
defineToggleSwitch("PLT_AC_FILTER", 29, 3003, 143, "EC System", "PILOT Filter Switch, ON/OFF")
defineToggleSwitch("PLT_AC_HEAT_MODE_1", 29, 3004, 144, "EC System", "PILOT Heating Switch, HOT/NORMAL")
defineMultipositionSwitch("PLT_AC_HEAT_MODE_2", 29, 3005, 145, 4, 0.1, "EC System", "PILOT Automatic Hot Cold Switch, OFF/COLD/HOT/AUTO")
defineMultipositionSwitch("PLT_AC_TEMP", 29, 3006, 146, 11, 1/9, "EC System", "PILOT Temperature Selector, 5/10/15/18/20/22/24/30/35/40/50")
defineToggleSwitch("OP_SIGHT_FAN", 29, 3007, 774, "EC System", "OPERATOR Sight Fan, ON/OFF")
definePotentiometer("PLT_CABIN_PRESS", 29, 3008, 516, {0, 1}, "EC System", "PILOT Sealing, OPEN/CLOSE")

defineIndicatorLight("PLT_EC_SYS_OFF_L", 132, "EC System Lights", "PILOT EC System Disabled Light (yellow)")
defineIndicatorLight("PLT_EC_CABIN_OVERPRESS_L", 172, "EC System Lights", "PILOT EC System Cabin Overpressure Light (yellow)")
defineIndicatorLight("PLT_EC_DOORS_CLOSE_L", 221, "EC System Lights", "PILOT EC System Doors Sealed Light (green)")
defineIndicatorLight("PLT_EC_DOORS_OPEN_L", 221, "EC System Lights", "PILOT EC System Doors Unsealed Light (yellow)")

--PKP72M
defineToggleSwitch("PLT_GYRO_SW", 34, 3001, 12, "PKP72M", "PILOT Gyrovertical Switch, 1/2")
defineToggleSwitch("OP_ADI_SW", 34, 3002, 759, "PKP72M", "OPERTOR ADI Switch, ON/OFF")
definePushButton("PLT_ADI_TEST", 32, 3002, 946, "PKP72M", "PILOT Test ADI Button")
defineRotary("PLT_ADI_PITCH_TRIM", 32, 3001, 941, "PKP72M", "PILOT ADI Pitch Trim Knob")
definePushButton("OP_ADI_TEST", 33, 3002, 787, "PKP72M", "OPERTOR Test ADI Button")
defineRotary("OP_ADI_PITCH_TRIM", 33, 3001, 782, "PKP72M", "OPERTOR ADI Pitch Trim Knob")

defineFloat("PLT_ADI_PITCH_G", 939, {-1, 1}, "PKP72M Gauges", "PILOT ADI Pitch Gauge")
defineFloat("PLT_ADI_BANK_G", 942, {0.5, -0.5}, "PKP72M Gauges", "PILOT ADI Bank Gauge")
defineFloat("PLT_ADI_FLAG", 940, {0, 1}, "PKP72M Gauges", "PILOT ADI Flag")
defineFloat("PLT_ADI_ALT", 945, {0, 1}, "PKP72M Gauges", "PILOT ADI Altitude")
defineFloat("PLT_ADI_ALT_FLAG", 936, {0, 1}, "PKP72M Gauges", "PILOT ADI Altitude Flag")
defineFloat("PLT_ADI_BALL", 943, {1, -1}, "PKP72M Gauges", "PILOT ADI Slip Ball")
defineFloat("PLT_ADI_BLANK_K", 937, {0, 1}, "PKP72M Gauges", "PILOT ADI Blanker K")
defineFloat("PLT_ADI_BLANK_T", 938, {0, 1}, "PKP72M Gauges", "PILOT ADI Blanker T")
defineFloat("OP_ADI_PITCH_G", 780, {-1, 1}, "PKP72M Gauges", "OPERTOR ADI Pitch Gauge")
defineFloat("OP_ADI_BANK_G", 783, {0.5, -0.5}, "PKP72M Gauges", "OPERTOR ADI Bank Gauge")
defineFloat("OP_ADI_FLAG", 781, {0, 1}, "PKP72M Gauges", "OPERTOR ADI Flag")
defineFloat("OP_ADI_ALT", 786, {0, 1}, "PKP72M Gauges", "OPERTOR ADI Altitude")
defineFloat("OP_ADI_ALT_FLAG", 777, {0, 1}, "PKP72M Gauges", "OPERTOR ADI Altitude Flag")
defineFloat("OP_ADI_BALL", 784, {1, -1}, "PKP72M Gauges", "OPERTOR ADI Slip Ball")
defineFloat("OP_ADI_BLANK_K", 778, {0, 1}, "PKP72M Gauges", "OPERTOR ADI Blanker K")
defineFloat("OP_ADI_BLANK_T", 779, {0, 1}, "PKP72M Gauges", "OPERTOR ADI Blanker T")

--MGV1SU
definePushButton("PLT_GYRO_1_CAGE", 25, 3001, 10, "MGV1SU", "PILOT Cage Gyro 1")
definePushButton("PLT_GYRO_2_CAGE", 26, 3001, 14, "MGV1SU", "PILOT Cage Gyro 2")
defineToggleSwitch("PLT_GYRO_1_PWR", 25, 3004, 369, "MGV1SU", "PILOT Gyro 1 Power, ON/OFF")
defineToggleSwitch("PLT_GYRO_2_PWR", 26, 3004, 368, "MGV1SU", "PILOT Gyro 2 Power, ON/OFF")
definePushButton("OP_GYRO_2_CAGE", 26, 3003, 701, "MGV1SU", "OPERATOR Cage Gyro 2")

--UKT2
defineRotary("PLT_UKT2_PITCH_TRIM", 18, 3001, 951, "UKT-2", "PILOT UKT-2 Pitch Trim Knob")

defineFloat("PLT_UKT2_PITCH", 949, {-1, 1}, "UKT-2 Gauges", "PILOT UKT-2 Pitch")
defineFloat("PLT_UKT2_ROLL", 950, {1, -1}, "UKT-2 Gauges", "PILOT UKT-2 Roll")
defineFloat("PLT_UKT2_FAIL_FLG", 948, {0, 1}, "UKT-2 Gauges", "PILOT UKT-2 Failure Flag")

--Barometric Altimeter
definePotentiometer("PLT_ALT_PRESS", 41, 3001, 18, {0, 1}, "Barometric Altimeter", "PILOT Baro Pressure Knob")
definePotentiometer("OP_ALT_PRESS", 42, 3001, 788, {0, 1}, "Barometric Altimeter", "OPERATOR Baro Pressure Knob")

defineFloat("PLT_ALT_100", 19, {0, 1}, "Barometric Altimeter Gauges", "PILOT Baro Pressure 100 Gauge")
defineFloat("PLT_ALT_10", 20, {0, 1}, "Barometric Altimeter Gauges", "PILOT Baro Pressure 10 Gauge")
defineFloat("PLT_ALT_IND_100", 833, {0, 1}, "Barometric Altimeter Gauges", "PILOT Baro Pressure Ind 100 Gauge")
defineFloat("PLT_ALT_IND_10", 832, {0, 1}, "Barometric Altimeter Gauges", "PILOT Baro Pressure Ind 10 Gauge")
defineFloat("PLT_ALT_SHUTTER", 916, {0.822, 0.75}, "Barometric Altimeter Gauges", "PILOT Baro Pressure Shutter Gauge")
defineFloat("PLT_ALT_RESS", 21, {0, 1}, "Barometric Altimeter Gauges", "PILOT Baro Pressure RESS Gauge")
defineFloat("OP_ALT_100", 789, {0, 1}, "Barometric Altimeter Gauges", "OPERATOR Baro Pressure 100 Gauge")
defineFloat("OP_ALT_10", 988, {0, 1}, "Barometric Altimeter Gauges", "OPERATOR Baro Pressure 10 Gauge")
defineFloat("OP_ALT_IND_100", 837, {0, 1}, "Barometric Altimeter Gauges", "OPERATOR Baro Pressure Ind 100 Gauge")
defineFloat("OP_ALT_IND_10", 836, {0, 1}, "Barometric Altimeter Gauges", "OPERATOR Baro Pressure Ind 10 Gauge")
defineFloat("OP_ALT_SHUTTER", 835, {0.822, 0.75}, "Barometric Altimeter Gauges", "OPERATOR Baro Pressure Shutter Gauge")
defineFloat("OP_ALT_RESS", 834, {0, 1}, "Barometric Altimeter Gauges", "OPERATOR Baro Pressure RESS Gauge")

--RMI2
defineToggleSwitch("PLT_RMI2_MODE", 43, 3002, 26, "RMI2", "PILOT RMI2 Mode Switch, ZK/ARKU2")
defineToggleSwitch("OP_RMI2_MODE", 44, 3002, 843, "RMI2", "OPERATOR RMI2 Mode Switch, ZK/ARKU2")

defineFloat("PLT_RMI2_HDG", 25, {0, 1}, "RMI2 Gauges", "PILOT RMI2 Heading Gauge")
defineFloat("PLT_RMI2_CRS1", 28, {0, 1}, "RMI2 Gauges", "PILOT RMI2 Bearing 1 Gauge")
defineFloat("PLT_RMI2_CRS2", 27, {0, 1}, "RMI2 Gauges", "PILOT RMI2 Bearing 2 Gauge")
defineFloat("OP_RMI2_HDG", 841, {0, 1}, "RMI2 Gauges", "OPERATOR RMI2 Heading Gauge")
defineFloat("OP_RMI2_CRS1", 842, {0, 1}, "RMI2 Gauges", "OPERATOR RMI2 Bearing 1 Gauge")
defineFloat("OP_RMI2_CRS2", 840, {0, 1}, "RMI2 Gauges", "OPERATOR RMI2 Bearing 2 Gauge")

--Clock
definePushButton("PLT_CLOCK_L_PUSH", 35, 3001, 57, "Clock", "PILOT Clock Left Lever Push")
defineRotary("PLT_CLOCK_L_TURN", 35, 3003, 58, "Clock", "PILOT Clock Left Lever Turn") --Module BUG?
definePushButton("PLT_CLOCK_R_PUSH", 35, 3004, 59, "Clock", "PILOT Clock Right Lever Push")
defineRotary("PLT_CLOCK_R_TURN", 35, 3005, 60, "Clock", "PILOT Clock Right Lever Turn")
definePushButton("OP_CLOCK_L_PUSH", 36, 3001, 687, "Clock", "OPERATOR Clock Left Lever Push")
defineRotary("OP_CLOCK_L_TURN", 36, 3003, 688, "Clock", "OPERATOR Clock Left Lever Turn") --Module BUG?
definePushButton("OP_CLOCK_R_PUSH", 36, 3004, 693, "Clock", "OPERATOR Clock Right Lever Push")
defineRotary("OP_CLOCK_R_TURN", 36, 3005, 694, "Clock", "OPERATOR Clock Right Lever Turn")

defineFloat("PLT_CLOCK_CT_H", 49, {0, 1}, "Clock Gauges", "PILOT Clock Current Time Hours")
defineFloat("PLT_CLOCK_CT_M", 50, {0, 1}, "Clock Gauges", "PILOT Clock Current Time Minutes")
defineFloat("PLT_CLOCK_CT_S", 51, {0, 1}, "Clock Gauges", "PILOT Clock Current Time Seconds")
defineFloat("PLT_CLOCK_FT_STAT", 56, {0, 1}, "Clock Gauges", "PILOT Clock Flight Time Status")
defineFloat("PLT_CLOCK_F_H", 52, {0, 1}, "Clock Gauges", "PILOT Clock Flight Hours")
defineFloat("PLT_CLOCK_F_M", 53, {0, 1}, "Clock Gauges", "PILOT Clock Flight Minutes")
defineFloat("PLT_CLOCK_ST_M", 54, {0, 1}, "Clock Gauges", "PILOT Clock Seconds Time Minutes")
defineFloat("PLT_CLOCK_ST_S", 55, {0, 1}, "Clock Gauges", "PILOT Clock Seconds Time Seconds")
defineFloat("OP_CLOCK_CT_H", 695, {0, 1}, "Clock Gauges", "OPERATOR Clock Current Time Hours")
defineFloat("OP_CLOCK_CT_M", 1027, {0, 1}, "Clock Gauges", "OPERATOR Clock Current Time Minutes")
defineFloat("OP_CLOCK_CT_S", 690, {0, 1}, "Clock Gauges", "OPERATOR Clock Current Time Seconds")
defineFloat("OP_CLOCK_FT_STAT", 692, {0, 1}, "Clock Gauges", "OPERATOR Clock Flight Time Status")
defineFloat("OP_CLOCK_F_H", 961, {0, 1}, "Clock Gauges", "OPERATOR Clock Flight Hours")
defineFloat("OP_CLOCK_F_M", 689, {0, 1}, "Clock Gauges", "OPERATOR Clock Flight Minutes")
defineFloat("OP_CLOCK_ST_M", 698, {0, 1}, "Clock Gauges", "OPERATOR Clock Seconds Time Minutes")
defineFloat("OP_CLOCK_ST_S", 697, {0, 1}, "Clock Gauges", "OPERATOR Clock Seconds Time Seconds")

--Electric Interface
defineToggleSwitch("PLT_D_BATT_R", 1, 3037, 61, "Electric Interface", "PILOT DC Right Battery switch, ON/OFF")
defineToggleSwitch("PLT_D_BATT_L", 1, 3034, 75, "Electric Interface", "PILOT DC Left Battery switch, ON/OFF")
defineToggleSwitch("PLT_D_RECT_R", 1, 3043, 65, "Electric Interface", "PILOT DC Right Rectifier switch, ON/OFF")
defineToggleSwitch("PLT_D_RECT_L", 1, 3040, 62, "Electric Interface", "PILOT DC Left Rectifier switch, ON/OFF")
defineToggleSwitch("PLT_D_APU", 1, 3046, 66, "Electric Interface", "PILOT DC APU Generator switch, ON/OFF")
defineMultipositionSwitch("PLT_D_VOLT_KNB", 1, 3055, 69, 10, 0.1, "Electric Interface", "PILOT DC Voltmeter Knob")
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

defineFloat("PLT_ELEC_VOLT_DC", 68, {0, 1}, "Electric Gauges", "PILOT Voltmeter DC")
defineFloat("PLT_ELEC_VOLT_AC", 90, {0, 1}, "Electric Gauges", "PILOT Voltmeter AC")
defineFloat("PLT_ELEC_AMP_BATT_L", 77, {0, 1}, "Electric Gauges", "PILOT Amperemeter Left Batterie")
defineFloat("PLT_ELEC_AMP_BATT_R", 76, {0, 1}, "Electric Gauges", "PILOT Amperemeter Right Batterie")
defineFloat("PLT_ELEC_AMP_GEN_DC", 67, {0, 1}, "Electric Gauges", "PILOT Amperemeter DC Generator")
defineFloat("PLT_ELEC_AMP_GEN_L", 102, {0, 1}, "Electric Gauges", "PILOT Amperemeter Left Generator")
defineFloat("PLT_ELEC_AMP_GEN_R", 78, {0, 1}, "Electric Gauges", "PILOT Amperemeter Right Generator")

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

defineFloat("PLT_FUEL_METER", 525, {0, 1}, "Fuel Gauges", "PILOT Fuel Meter")

defineIndicatorLight("PLT_AUTO_ON_L", 317, "Fuel Lights", "PILOT Automatic ON Lamp (green)")
defineIndicatorLight("PLT_START_WORK_L", 316, "Fuel Lights", "PILOT Starter Works Lamp (yellow)")
defineIndicatorLight("PLT_AUTO_ON_TURB_L", 310, "Fuel Lights", "PILOT Automatic ON Turbine Lamp (green)")
defineIndicatorLight("PLT_OIL_PRESS_NORM_L", 306, "Fuel Lights", "PILOT Oil Pressure Normal Lamp (green)")
defineIndicatorLight("PLT_AI9V_NORM_L", 288, "Fuel Lights", "PILOT Rev AI 9V Normal Lamp (green)")
defineIndicatorLight("PLT_AI9V_HIGH_L", 309, "Fuel Lights", "PILOT Rev AI 9V High Lamp (red)")

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

--SAU (Autopilot)
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

local function getSAURouteAzimuth()
    local function a(n) return GetDevice(0):get_argument_value(n) end
    return string.format("%.0f%.0f%.0f", 10-(a(265)*10), 10-(a(264)*10), 10-(a(263)*10))
end
defineString("PLT_SAU_ROUTE_AZIMUTH_DISPLAY_STR", getSAURouteAzimuth, 3, "SAU", "PILOT SAU Route Azimuth (String)")
definePushButton("PLT_SAU_SPEED_STAB_ON", 10, 3042, 268, "SAU", "PILOT SAU Speed Stabilization ON")
definePushButton("PLT_SAU_SPEED_STAB_OFF", 10, 3044, 269, "SAU", "PILOT SAU Speed Stabilization OFF")
defineRockerSwitch("PLT_SAU_ALT_CONTROL", 10, 3019, 3019, 3017, 3017, 253, "SAU", "PILOT SAU Altitude Control")
defineFloat("PLT_SAU_H_CORRECT_PRESS", 233, {0, 1}, "SAU", "PILOT SAU Yaw Pressed")
defineFloat("PLT_SAU_K_CORRECT_PRESS", 239, {0, 1}, "SAU", "PILOT SAU Roll Pressed")
defineFloat("PLT_SAU_T_CORRECT_PRESS", 245, {0, 1}, "SAU", "PILOT SAU Pitch Pressed")

defineIndicatorLight("PLT_SAU_K_ON_L", 281, "SAU Lights", "PILOT SAU K ON Light (green)")
defineIndicatorLight("PLT_SAU_K_OFF_L", 280, "SAU Lights", "PILOT SAU K OFF Light (red)")
defineIndicatorLight("PLT_SAU_H_ON_L", 279, "SAU Lights", "PILOT SAU H ON Light (green)")
defineIndicatorLight("PLT_SAU_H_OFF_L", 278, "SAU Lights", "PILOT SAU H OFF Light (red)")
defineIndicatorLight("PLT_SAU_B_ON_L", 296, "SAU Lights", "PILOT SAU B ON Light (green)")
defineIndicatorLight("PLT_SAU_B_OFF_L", 295, "SAU Lights", "PILOT SAU B OFF Light (red)")
defineIndicatorLight("PLT_SAU_T_ON_L", 294, "SAU Lights", "PILOT SAU T ON Light (green)")
defineIndicatorLight("PLT_SAU_T_OFF_L", 293, "SAU Lights", "PILOT SAU T OFF Light (red)")
defineIndicatorLight("PLT_SAU_ROUTE_MODE_ON_L", 299, "SAU Lights", "PILOT SAU Route Mode ON Light (green)")
defineIndicatorLight("PLT_SAU_HOVER_ROUTE_MODE_OFF_L", 298, "SAU Lights", "PILOT SAU Hover and Route Modes OFF Light (red)")
defineIndicatorLight("PLT_SAU_HOVER_MODE_ON_L", 297, "SAU Lights", "PILOT SAU Hover Mode ON Light (green)")
defineIndicatorLight("PLT_SAU_ALT_MODE_ON_L", 304, "SAU Lights", "PILOT SAU Altitude Mode ON Light (green)")
defineIndicatorLight("PLT_SAU_ALT_MODE_OFF_L", 303, "SAU Lights", "PILOT SAU Altitude Mode OFF Light (red)")

defineFloat("PLT_SAU_H_DELTA", 238, {-1, 1}, "SAU Gauges", "PILOT SAU Yaw Delta")
defineFloat("PLT_SAU_K_DELTA", 244, {-1, 1}, "SAU Gauges", "PILOT SAU Roll Delta")
defineFloat("PLT_SAU_T_DELTA", 251, {-1, 1}, "SAU Gauges", "PILOT SAU Pitch Delta")
defineFloat("PLT_SAU_B_DELTA", 256, {-1, 1}, "SAU Gauges", "PILOT SAU Altitude Delta")
defineFloat("PLT_SAU_H_NUM", 235, {0, 1}, "SAU Gauges", "PILOT SAU Yaw Number")
defineFloat("PLT_SAU_K_NUM", 241, {0, 1}, "SAU Gauges", "PILOT SAU Roll Number")
defineFloat("PLT_SAU_T_NUM", 247, {0, 1}, "SAU Gauges", "PILOT SAU Pitch Number")
defineFloat("PLT_SAU_CRS_100", 265, {0, 1}, "SAU Gauges", "PILOT SAU Course 100")
defineFloat("PLT_SAU_CRS_10", 264, {0, 1}, "SAU Gauges", "PILOT SAU Course 10")
defineFloat("PLT_SAU_CRS_1", 263, {0, 1}, "SAU Gauges", "PILOT SAU Course 1")

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
defineMultipositionSwitch("PLT_FIRE_EX_SENSOR_CHAN", 13, 3013, 484, 4, 0.1, "Fire Extinguisher", "PILOT Fire Extinguisher Sensor Channel OFF/1/2/3")
defineSpringloaded_3PosTumb("PLT_FIRE_EX_SQUIB", 13, 3011, 3012, 486, "Fire Extinguisher", "PILOT Extinguisher Squib Control")
defineToggleSwitch("PLT_FIRE_EX_PW", 13, 3014, 487, "Fire Extinguisher", "PILOT Extinguisher Power ON/OFF")

--SPUU-52
defineToggleSwitch("PLT_SPUU_POWER", 19, 3010, 270, "SPUU", "PILOT SPUU Power, ON/OFF")
defineToggleSwitch("PLT_SPUU_OFF", 19, 3001, 275, "SPUU", "PILOT SPUU OFF")
defineRockerSwitch("PLT_SPUU_CONTROL", 19, 3007, 3007, 3006, 3006, 277, "SPUU", "PILOT SPUU Control Switch, P/NONE/T")
definePotentiometer("PLT_SPUU_ROUTE_AZIMUTH", 19, 3003, 276, {0, 1}, "SPUU", "PILOT SPUU Route Azimuth")

defineIndicatorLight("PLT_SPUU_OFF_L", 302, "SPUU Lights", "PILOT SAU SPUU OFF Light (red)")

defineFloat("PLT_SPUU_DELTA", 271, {-1, 1}, "SPUU Gauges", "PILOT SPUU Delta")

--Cyclic
definePushButton("PLT_CYCLIC_AP_TRIM", 10, 3027, 742, "Cyclic", "PILOT Cyclic Autopilot Trimmer")
definePushButton("OP_CYCLIC_AP_TRIM", 10, 3028, 855, "Cyclic", "OPERATOR Cyclic Autopilot Trimmer")

----Weapon Systems
defineToggleSwitch("OP_MAIN_WPN_SAVE", 6, 3020, 673, "Weapon Systems", "OPERATOR Main Weapon Safe Switch")
defineTumb("OP_WPN_SEL", 6, 3027, 709, 0.1, {0, 0.4}, nil, false, "Weapon Systems", "OPERATOR Select Weapon")
defineToggleSwitch("OP_EMERG_JETT_CV", 6, 3042, 141, "Weapon Systems", "OPERATOR Emergency Jettison Cover, UP/DOWN")
definePushButton("OP_EMERG_JETT", 6, 3025, 142, "Weapon Systems", "OPERATOR Emergency Jettison")
defineToggleSwitch("OP_BOMB_BLOCK_CV", 6, 3043, 699, "Weapon Systems", "OPERATOR Bombs/Blocks Mode Cover, UP/DOWN")
define3PosTumb("OP_BOMB_BLOCK", 6, 3033, 700, "Weapon Systems", "OPERATOR Bombs/Blocks Mode")
defineToggleSwitch("OP_EXPL_JETT_CV", 6, 3041, 714, "Weapon Systems", "OPERATOR Explosion on Jettison Cover, UP/DOWN")
defineToggleSwitch("OP_EXPL_JETT", 6, 3024, 715, "Weapon Systems", "OPERATOR Explosion on Jettison")
defineToggleSwitch("OP_WPN_CONTROL_CV", 6, 3040, 712, "Weapon Systems", "OPERATOR Weapon Control Cover, UP/DOWN")
defineToggleSwitch("OP_WPN_CONTROL", 6, 3023, 713, "Weapon Systems", "OPERATOR Weapon Control")
defineToggleSwitch("OP_JETT_LAUNCHER_CV", 6, 3044, 764, "Weapon Systems", "OPERATOR Jettison Launcher Cover, UP/DOWN")
defineToggleSwitch("OP_JETT_LAUNCHER", 6, 3032, 765, "Weapon Systems", "OPERATOR Jettison Launcher ON/OFF")
define3PosTumb("OP_BURST_LENGTH", 6, 3026, 770, "Weapon Systems", "OPERATOR Burst Length SHORT/MED/LONG")
defineToggleSwitch("OP_CAN_RATE", 6, 3037, 772, "Weapon Systems", "OPERATOR Cannon Fire Rate SLOW/FAST")
defineToggleSwitch("OP_MISSL_PW", 6, 3028, 773, "Weapon Systems", "OPERATOR Missiles Power")
definePushButton("OP_JETT_TEST", 6, 3031, 768, "Weapon Systems", "OPERATOR Release Check PU")
define3PosTumb("OP_DISTR_CONTROL", 6, 3029, 762, "Weapon Systems", "OPERATOR CHECK1-WORK-CHECK2") --Arg doubled
definePushButton("OP_CAN_RELOAD", 6, 3039, 769, "Weapon Systems", "OPERATOR Reload Cannon")
defineToggleSwitch("OP_SCHO_PW", 6, 3030, 955, "Weapon Systems", "OPERATOR SCHO Power")
definePushButton("OP_SCHO_L_CHECK", 6, 3035, 956, "Weapon Systems", "OPERATOR SCHO Lamps Check")
defineMultipositionSwitch("OP_STATION_SEL", 6, 3038, 963, 9, 0.1, "Weapon Systems", "OPERATOR Select Station")
definePushButton("OP_CONTAINER_START", 6, 3045, 711, "Weapon Systems", "OPERATOR Start container")
definePushButton("OP_CONTAINER_STOP", 6, 3046, 710, "Weapon Systems", "OPERATOR Stop container")

--Stick
defineToggleSwitch("PLT_STICK_FIRE_WPNS_CV", 6, 3002, 740, "Stick", "PILOT Stick Fire Weapons Cover")
definePushButton("PLT_STICK_FIRE_WPNS", 6, 3001, 741, "Stick", "PILOT Stick Fire Weapons")
defineToggleSwitch("OP_STICK_FIRE_WPNS_CV", 6, 3022, 853, "Stick", "OPERATOR Stick Fire Weapons Cover")
definePushButton("OP_STICK_FIRE_WPNS", 6, 3021, 187, "Stick", "OPERATOR Stick Fire Weapons")
definePushButton("OP_STICK_ENGAGE", 30, 3011, 865, "Stick", "OPERATOR Engage Stick")
defineToggleSwitch("OP_STICK_DISENGAGE_CV", 30, 3013, 857, "Stick", "OPERATOR Disengage Stick Cover")
definePushButton("OP_STICK_DISENGAGE", 30, 3012, 859, "Stick", "OPERATOR Disengage Stick")

---PUVL
defineToggleSwitch("PLT_PUVL_SIGHT_DIST", 16, 3003, 515, "PUVL", "PILOT Sight Distance, MANUAL/AUTO")
define3PosTumb("PLT_PUVL_BURST_LENGTH", 6, 3003, 521, "PUVL", "PILOT Burst Length, SHORT/LONG/MEDIUM")
defineTumb("PLT_PUVL_REL_LEFT_GONDOLA", 6, 3004, 522, 0.1, {0, 0.3}, nil, false, "PUVL", "PILOT Reload Left Gondola, OFF/1/2/3")
defineTumb("PLT_PUVL_REL_RIGHT_GONDOLA", 6, 3005, 527, 0.1, {0, 0.3}, nil, false, "PUVL", "PILOT Reload Right Gondola, OFF/1/2/3")
defineToggleSwitch("PLT_PUVL_WPN_SIGHT", 16, 3014, 529, "PUVL", "PILOT Weapon Sight, ON/OFF")
defineToggleSwitch("PLT_PUVL_WPN_CAM", 6, 3006, 530, "PUVL", "PILOT Weapon Camera, ON/OFF")
definePotentiometer("PLT_PUVL_MAN_RANGE", 16, 3004, 552, {0, 1}, "PUVL", "PILOT Manual Range Adjustment")
defineTumb("PLT_PUVL_WPN_SEL", 6, 3007, 523, 0.1, {0.0, 0.8}, nil, false, "PUVL", "PILOT Weapon Selector, 9-POS")
definePushButton("PLT_PUVL_SIGHT_ZERO", 16, 3007, 528, "PUVL", "PILOT Sight Reset Crosshair")
define3PosTumb("PLT_PUVL_ROCKET_SEL", 6, 3008, 531, "PUVL", "PILOT Rocket Select, LEFT/BOTH/RIGHT")
defineToggleSwitch("PLT_PUVL_FIRE_CONTROL", 6, 3009, 551, "PUVL", "PILOT Weapon Control, ON/OFF")
defineToggleSwitch("PLT_PUVL_CANNON_FIRE_RATE", 6, 3010, 550, "PUVL", "PILOT Cannon Fire Rate, SLOW/FAST")
definePushButton("PLT_PUVL_REL_CANNON", 6, 3011, 549, "PUVL", "PILOT Reload Cannon")
definePushButton("PLT_PUVL_STOP_CONTAINER", 6, 3012, 547, "PUVL", "PILOT Stop Container")
defineToggleSwitch("PLT_PUVL_EXP_ON_JETT", 6, 3013, 546, "PUVL", "PILOT Explosion on Jettison, ON/OFF")
defineToggleSwitch("PLT_PUVL_EXP_ON_JETT_CV", 6, 3014, 545, "PUVL", "PILOT Explosion on Jettison Cover, UP/DOWN")
definePushButton("PLT_PUVL_JETT_PYLONS", 6, 3015, 542, "PUVL", "PILOT Jettison Pylons")
defineToggleSwitch("PLT_PUVL_JETT_PYLONS_CV", 6, 3016, 541, "PUVL", "PILOT Jettison Pylons Cover, UP/DOWN")
definePushButton("PLT_PUVL_JETT_LAUNCHER", 6, 3017, 538, "PUVL", "PILOT Jettison Launcher")
defineToggleSwitch("PLT_PUVL_JETT_LAUNCHER_CV", 6, 3018, 537, "PUVL", "PILOT Jettison Launcher Cover, UP/DOWN")
definePushButton("PLT_PUVL_ARM_ROCKETS", 6, 3019, 536, "PUVL", "PILOT Arm Rockets")
defineRotary("PLT_PUVL_USB_COUNT1", 6, 3092, 719, "PUVL", "PILOT Counter Adjustment 1")
defineRotary("PLT_PUVL_USB_COUNT2", 6, 3093, 723, "PUVL", "PILOT Counter Adjustment 2")
defineRotary("PLT_PUVL_USB_COUNT3", 6, 3094, 727, "PUVL", "PILOT Counter Adjustment 3")
defineRotary("PLT_PUVL_USB_COUNT4", 6, 3095, 731, "PUVL", "PILOT Counter Adjustment 4")
defineRotary("PLT_PUVL_USB_COUNT5", 6, 3096, 735, "PUVL", "PILOT Counter Adjustment 6")

defineFloat("PLT_PUVL_USB_1_100", 716, {0, 1}, "PUVL Gauges", "PILOT Counter 1 100")
defineFloat("PLT_PUVL_USB_1_10", 717, {0, 1}, "PUVL Gauges", "PILOT Counter 1 10")
defineFloat("PLT_PUVL_USB_2_100", 720, {0, 1}, "PUVL Gauges", "PILOT Counter 2 100")
defineFloat("PLT_PUVL_USB_2_10", 721, {0, 1}, "PUVL Gauges", "PILOT Counter 2 10")
defineFloat("PLT_PUVL_USB_3_100", 724, {0, 1}, "PUVL Gauges", "PILOT Counter 3 100")
defineFloat("PLT_PUVL_USB_3_10", 725, {0, 1}, "PUVL Gauges", "PILOT Counter 3 10")
defineFloat("PLT_PUVL_USB_4_100", 728, {0, 1}, "PUVL Gauges", "PILOT Counter 4 100")
defineFloat("PLT_PUVL_USB_4_10", 729, {0, 1}, "PUVL Gauges", "PILOT Counter 4 10")
defineFloat("PLT_PUVL_USB_5_100", 732, {0, 1}, "PUVL Gauges", "PILOT Counter 5 100")
defineFloat("PLT_PUVL_USB_5_10", 733, {0, 1}, "PUVL Gauges", "PILOT Counter 5 10")

defineIndicatorLight("PLT_PUVL_EXPL_ARM_L", 548, "PUVL Lights PLT", "PILOT PUVL Explosion on Jettison ARMED Light (red)")
defineIndicatorLight("PLT_PUVL_PYLON_1_L", 544, "PUVL Lights PLT", "PILOT PUVL Pylon 1 Light (yellow)")
defineIndicatorLight("PLT_PUVL_PYLON_2_L", 543, "PUVL Lights PLT", "PILOT PUVL Pylon 2 Light (yellow)")
defineIndicatorLight("PLT_PUVL_PYLON_3_L", 540, "PUVL Lights PLT", "PILOT PUVL Pylon 3 Light (yellow)")
defineIndicatorLight("PLT_PUVL_PYLON_4_L", 539, "PUVL Lights PLT", "PILOT PUVL Pylon 4 Light (yellow)")
defineIndicatorLight("PLT_PUVL_USLP_LOAD_L", 533, "PUVL Lights PLT", "PILOT PUVL USLP Loaded Light (yellow)")
defineIndicatorLight("PLT_PUVL_USLP_FINISHED_L", 532, "PUVL Lights PLT", "PILOT PUVL USLP Finished Light (yellow)")
defineIndicatorLight("PLT_PUVL_LH_SIDE_L", 535, "PUVL Lights PLT", "PILOT PUVL LH Side Light (yellow)")
defineIndicatorLight("PLT_PUVL_RH_SIDE_L", 534, "PUVL Lights PLT", "PILOT PUVL RH Side Light (yellow)")
defineIndicatorLight("PLT_PUVL_GUV1_ON_L", 718, "PUVL Lights PLT", "PILOT PUVL GUV Ready 1 Light (red)")
defineIndicatorLight("PLT_PUVL_GUV2_ON_L", 722, "PUVL Lights PLT", "PILOT PUVL GUV Ready 2 Light (red)")
defineIndicatorLight("PLT_PUVL_GUV3_ON_L", 726, "PUVL Lights PLT", "PILOT PUVL GUV Ready 3 Light (red)")
defineIndicatorLight("PLT_PUVL_GUV4_ON_L", 730, "PUVL Lights PLT", "PILOT PUVL GUV Ready 4 Light (red)")
defineIndicatorLight("PLT_PUVL_GUV5_ON_L", 734, "PUVL Lights PLT", "PILOT PUVL GUV Ready 5 Light (red)")

defineIndicatorLight("OP_PUVL_EXPL_ARM_L", 135, "PUVL Lights OP", "OPERATOR PUVL Explosion on Jettison ARMED Light (red)")
defineIndicatorLight("OP_PUVL_BD_1_L", 137, "PUVL Lights OP", "OPERATOR PUVL Pylon 1 Light (yellow)")
defineIndicatorLight("OP_PUVL_BD_2_L", 138, "PUVL Lights OP", "OPERATOR PUVL Pylon 2 Light (yellow)")
defineIndicatorLight("OP_PUVL_BD_3_L", 139, "PUVL Lights OP", "OPERATOR PUVL Pylon 3 Light (yellow)")
defineIndicatorLight("OP_PUVL_BD_4_L", 140, "PUVL Lights OP", "OPERATOR PUVL Pylon 4 Light (yellow)")
defineIndicatorLight("OP_PUVL_KMG_PW_L", 707, "PUVL Lights OP", "OPERATOR PUVL KMG Powered Light (yellow)")
defineIndicatorLight("OP_PUVL_KMG_LOAD_L", 706, "PUVL Lights OP", "OPERATOR PUVL KMG Loaded Light (yellow)")
defineIndicatorLight("OP_PUVL_KMG_FINISHED_L", 708, "PUVL Lights OP", "OPERATOR PUVL KMG Finished Light (yellow)")
defineIndicatorLight("OP_PUVL_L_REL_L", 766, "PUVL Lights OP", "OPERATOR PUVL PU Left Release Light (green)")
defineIndicatorLight("OP_PUVL_R_REL_L", 767, "PUVL Lights OP", "OPERATOR PUVL PU Right Release Light (green)")
defineIndicatorLight("OP_PUVL_NPU30_L", 703, "PUVL Lights OP", "OPERATOR PUVL NPU-30 Light (yellow)")
defineIndicatorLight("OP_PUVL_NRS_L", 705, "PUVL Lights OP", "OPERATOR PUVL NRS Light (yellow)")
defineIndicatorLight("OP_PUVL_BOMBS_L", 704, "PUVL Lights OP", "OPERATOR PUVL Bombs Light (yellow)")
defineIndicatorLight("OP_PUVL_KMG_L", 707, "PUVL Lights OP", "OPERATOR PUVL KMG Light (yellow)")
defineIndicatorLight("OP_WEAPON_ON_L", 662, "PUVL Lights OP", "OPERATOR PUVL Weapon ON Light (yellow)")
defineIndicatorLight("OP_WEAPON_OFF_L", 663, "PUVL Lights OP", "OPERATOR PUVL Weapon OFF Light (green)")

--I9K113
defineToggleSwitch("OP_SIGHT_PW", 7, 3001, 885, "I9K113", "OPERATOR Sight Power Switch")
defineToggleSwitch("OP_SIGHT_BACK_L", 7, 3062, 884, "I9K113", "OPERATOR Sight Backlight")
defineToggleSwitch("OP_SIGHT_OBSERVE", 7, 3002, 886, "I9K113", "OPERATOR Sight OBSERVE")
defineToggleSwitch("OP_SIGHT_DIAFR", 7, 3003, 887, "I9K113", "OPERATOR Sight DIAFR Open")
defineToggleSwitch("OP_SIGHT_LOCK_ARU", 7, 3004, 912, "I9K113", "OPERATOR Sight LOCK ARU")
defineToggleSwitch("OP_SIGHT_SSP", 7, 3005, 913, "I9K113", "OPERATOR Sight SSP On")
defineToggleSwitch("OP_SIGHT_GEN", 7, 3006, 910, "I9K113", "OPERATOR Sight GENERATOR-IMIT")
define3PosTumb("OP_SIGHT_CHECK", 7, 3007, 905, "I9K113", "OPERATOR Sight CHECK2-NEUTR-CHECK1")
defineToggleSwitch("OP_SIGHT_CHECK", 7, 3008, 903, "I9K113", "OPERATOR Sight WORK-CHECK")
defineToggleSwitch("OP_SIGHT_PM_START", 7, 3010, 911, "I9K113", "OPERATOR Sight Start PM")
defineMultipositionSwitch("OP_BVK_SET", 7, 3009, 899, 5, 0.1, "I9K113", "OPERATOR BVK Set")
defineToggleSwitch("OP_SIGHT_HEAT", 7, 3064, 890, "I9K113", "OPERATOR Sight Heating")
defineToggleSwitch("OP_SIGHT_ZOOM", 7, 3021, 871, "I9K113", "OPERATOR Sight Zoom In-Out")
defineToggleSwitch("OP_SIGHT_FILTER_ORG", 7, 3022, 872, "I9K113", "OPERATOR Sight Orange Filter")
defineToggleSwitch("OP_SIGHT_FILTER_LASER", 7, 3023, 873, "I9K113", "OPERATOR Sight Laser Filter")
defineToggleSwitch("OP_SIGHT_MISL_HEAT", 7, 3018, 775, "I9K113", "OPERATOR Sight Doors")
define3PosTumb("OP_SIGHT_L_CHECK", 7, 3011, 870, "I9K113", "OPERATOR Sight Lamps Check")
defineToggleSwitch("OP_SHTV_SW_0_04", 7, 3014, 933, "I9K113", "OPERATOR SHTV Switcher 0 - 0.4")
defineToggleSwitch("OP_SHTV_SW_IN_OUT", 7, 3012, 934, "I9K113", "OPERATOR SHTV Switcher IN-OUT")
defineToggleSwitch("OP_SHTV_SW_CODE", 7, 3013, 935, "I9K113", "OPERATOR SHTV Switcher CODE1-CODE2")
definePushButton("OP_SHTV_CHECK", 7, 3015, 931, "I9K113", "OPERATOR SHTV Checking")
definePushButton("OP_SHTV_HIGH_K", 7, 3016, 875, "I9K113", "OPERATOR SHTV High K")
definePushButton("OP_SHTV_L_CHECK", 7, 3017, 932, "I9K113", "OPERATOR SHTV Display Lamps Check")
definePushButton("OP_SHTV_RAD_RESET", 7, 3029, 882, "I9K113", "OPERATOR SHTV Radiation Reset")

defineFloat("OP_SIGHT_AZI", 874, {-1, 1}, "I9K113 Gauges", "OPERATOR Sight Azimuth")
defineFloat("OP_SIGHT_ELE", 876, {-1, 1}, "I9K113 Gauges", "OPERATOR Sight Elevation")

defineIndicatorLight("OP_SHTV_PLUS27V_L", 915, "I9K113 Lights", "OPERATOR SHTV Tablo +27V Light (yellow)")
defineIndicatorLight("OP_SHTV_MINUS27V_L", 914, "I9K113 Lights", "OPERATOR SHTV Tablo -27V Light (yellow)")
defineIndicatorLight("OP_SHTV_0_L", 918, "I9K113 Lights", "OPERATOR SHTV Tablo 0 Light (yellow)")
defineIndicatorLight("OP_SHTV_04K_L", 924, "I9K113 Lights", "OPERATOR SHTV Tablo 0,4K Light (yellow)")
defineIndicatorLight("OP_SHTV_04T_L", 923, "I9K113 Lights", "OPERATOR SHTV Tablo 0,4T Light (yellow)")
defineIndicatorLight("OP_SHTV_APCH_L", 922, "I9K113 Lights", "OPERATOR SHTV Tablo APCH  Light (yellow)")
defineIndicatorLight("OP_SHTV_UP_L", 928, "I9K113 Lights", "OPERATOR SHTV Tablo UP Light (yellow)")
defineIndicatorLight("OP_SHTV_L_L", 929, "I9K113 Lights", "OPERATOR SHTV Tablo LEFT Light (yellow)")
defineIndicatorLight("OP_SHTV_DN_L", 927, "I9K113 Lights", "OPERATOR SHTV Tablo DOWN Light (yellow)")
defineIndicatorLight("OP_SHTV_R_L", 930, "I9K113 Lights", "OPERATOR SHTV Tablo RIGHT Light (yellow)")
defineIndicatorLight("OP_SHTV_RDY_L", 917, "I9K113 Lights", "OPERATOR SHTV Tablo READY Light (yellow)")
defineIndicatorLight("OP_SHTV_CONTR_L", 919, "I9K113 Lights", "OPERATOR SHTV Tablo CONTR Light (yellow)")
defineIndicatorLight("OP_SHTV_0K_L", 926, "I9K113 Lights", "OPERATOR SHTV Tablo 0K Light (yellow)")
defineIndicatorLight("OP_SHTV_0T_L", 925, "I9K113 Lights", "OPERATOR SHTV Tablo 0T Light (yellow)")
defineIndicatorLight("OP_SHTV_WORK_L", 920, "I9K113 Lights", "OPERATOR SHTV Tablo WORK Light (yellow)")
defineIndicatorLight("OP_SHTV_TOK_L", 921, "I9K113 Lights", "OPERATOR SHTV Tablo TOK Light (yellow)")
defineIndicatorLight("OP_PK_L1_L", 902, "I9K113 Lights", "OPERATOR PK L1 Light (red)")
defineIndicatorLight("OP_PK_L2_L", 901, "I9K113 Lights", "OPERATOR PK L2 Light (green)")
defineIndicatorLight("OP_PK_L3_L", 888, "I9K113 Lights", "OPERATOR PK L3 Light (white)")
defineIndicatorLight("OP_PK_L4_L", 889, "I9K113 Lights", "OPERATOR PK L4 Light (white)")
defineIndicatorLight("OP_PK_L5_L", 898, "I9K113 Lights", "OPERATOR PK L5 Light (green)")
defineIndicatorLight("OP_PK_L6_L", 904, "I9K113 Lights", "OPERATOR PK L6 Light (green)")
defineIndicatorLight("OP_PK_L7_L", 900, "I9K113 Lights", "OPERATOR PK L7 Light (green)")
defineIndicatorLight("OP_PK_L8_L", 894, "I9K113 Lights", "OPERATOR PK L8 Light (white)")
defineIndicatorLight("OP_PK_L9_L", 896, "I9K113 Lights", "OPERATOR PK L9 Light (red)")
defineIndicatorLight("OP_PK_L10_L", 897, "I9K113 Lights", "OPERATOR PK L10 Light (red)")
defineIndicatorLight("OP_PK_L11_L", 891, "I9K113 Lights", "OPERATOR PK L11 Light (white)")
defineIndicatorLight("OP_PK_L12_L", 892, "I9K113 Lights", "OPERATOR PK L12 Light (white)")
defineIndicatorLight("OP_PK_L13_L", 895, "I9K113 Lights", "OPERATOR PK L13 Light (white)")
defineIndicatorLight("OP_PK_L14_L", 893, "I9K113 Lights", "OPERATOR PK L14 Light (red)")
defineIndicatorLight("OP_SCHO_COMPL_ON_L", 957, "I9K113 Lights", "OPERATOR SCHO COMPL ON Light (green)")
defineIndicatorLight("OP_SCHO_PU_OFF_L", 958, "I9K113 Lights", "OPERATOR SCHO PU OFF Light (yellow)")
defineIndicatorLight("OP_SCHO_CHK_L", 959, "I9K113 Lights", "OPERATOR SCHO CHECK Light (yellow)")
defineIndicatorLight("OP_SCHO_RDY_L", 960, "I9K113 Lights", "OPERATOR SCHO READY Light (green)")
defineIndicatorLight("OP_SCHO_MSL_EX_L", 961, "I9K113 Lights", "OPERATOR SCHO MSL EXIST Light (green)")
defineIndicatorLight("OP_SCHO_LAUNCH_L", 962, "I9K113 Lights", "OPERATOR SCHO LAUNCH PERMISSION Light (red)")
defineIndicatorLight("OP_L166B_WORK_L", 868, "I9K113 Lights", "OPERATOR L166B Work Light (red)")
defineIndicatorLight("OP_L166B_FAIL_L", 869, "I9K113 Lights", "OPERATOR L166B Failure Light (green)")

---ASP17
defineToggleSwitch("PLT_ASP17_MODE_MAN_AUTO", 16, 3001, 553, "ASP17", "PILOT ASP17 Sight Mode, MANUAL/AUTO")
defineToggleSwitch("PLT_ASP17_MODE_SYNC_ASYNC", 16, 3002, 554, "ASP17", "PILOT ASP17 Sight Sync, SYNC/ASYNC")
definePotentiometer("PLT_ASP17_VERTICAL_ADJ", 16, 3005, 556, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Vertical Adjustment")
definePotentiometer("PLT_ASP17_BASE_ADJ", 16, 3008, 557, {0, 1}, "ASP17", "PILOT ASP17 Base and Range Adjustment")
definePotentiometer("PLT_ASP17_CROSSHAIR_BRIGHT_ADJ", 16, 3011, 564, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Brightness Adjustment")
definePotentiometer("PLT_ASP17_HORIZONTAL_ADJ", 16, 3006, 566, {0, 1}, "ASP17", "PILOT ASP17 Sight Crosshair Horizontal Adjustment")
definePotentiometer("PLT_ASP17_GRID_BRIGHT_ADJ", 16, 3010, 567, {0, 1}, "ASP17", "PILOT ASP17 Sight Grid Brightness Adjustment")
defineToggleSwitch("PLT_ASP17_CROSSHAIR_LAMP", 16, 3013, 568, "ASP17", "PILOT ASP17 Sight Crosshair Lamp, MAIN/BACKUP")
defineToggleSwitch("PLT_ASP17_GRID_LAMP", 16, 3012, 569, "ASP17", "PILOT ASP17 Sight Grid Lamp, MAIN/BACKUP")
definePushButton("PLT_ASP17_CONTROL", 16, 3009, 570, "ASP17", "PILOT ASP17 Sight Check")
defineToggleSwitch("OP_USR_PW", 16, 3015, 761, "ASP17", "OPERATOR USR power")
defineToggleSwitch("OP_USR_CHECK", 16, 3016, 762, "ASP17", "OPERATOR USR check")  -- Arg doubled
defineToggleSwitch("PLT_ASP17_REFLECTOR_FIX", 16, 3045, 1005, "ASP17", "PILOT ASP17 Sight Reflector Control Fix")
defineRotary("PLT_ASP17_REFLECTOR_MOVE", 16, 3046, 1006, "ASP17", "PILOT ASP17 Sight Reflector Control Move")

defineIndicatorLight("PLT_ASP17_KMG_L", 559, "ASP17 Lights", "PILOT ASP17 KMG (USLP) Light (yellow)")
defineIndicatorLight("PLT_ASP17_GUV_L", 560, "ASP17 Lights", "PILOT ASP17 GUV (FXD MG) Light (yellow)")
defineIndicatorLight("PLT_ASP17_BOMBS_L", 561, "ASP17 Lights", "PILOT ASP17 BOMBS Light (yellow)")
defineIndicatorLight("PLT_ASP17_30_L", 562, "ASP17 Lights", "PILOT ASP17 30 Light (yellow)")
defineIndicatorLight("PLT_ASP17_NRS_L", 563, "ASP17 Lights", "PILOT ASP17 NRS (RKT) Light (yellow)")
defineIndicatorLight("PLT_ASP17_GRN_L", 679, "ASP17 Lights", "PILOT ASP17 Green Light (green)")
defineIndicatorLight("PLT_ASP17_YEL_L", 678, "ASP17 Lights", "PILOT ASP17 yellow Light (yellow)")
defineIndicatorLight("PLT_ASP17_GODEN_L", 571, "ASP17 Lights", "PILOT ASP17 Goden Light (white)")
defineIndicatorLight("OP_ASP17_USR_CHECK_L", 760, "ASP17 Lights", "OPERATOR ASP17 USR Check Light (green)")

defineFloat("PLT_ASP17_UP_DN", 555, {1, 0}, "ASP17 Gauges", "PILOT ASP17 Up Down")
defineFloat("PLT_ASP17_L_R", 565, {0, 1}, "ASP17 Gauges", "PILOT ASP17 Left Right")
defineFloat("PLT_ASP17_BASE", 558, {0, 1}, "ASP17 Gauges", "PILOT ASP17 Base")

--ASO-2V
definePushButton("OP_ASO2V_COUNTERMEASURES", 9, 3003, 968, "ASO-2V", "OPERATOR Launch Countermeasures")
defineTumb("OP_ASO2V_SET", 6, 3006, 971, 0.1, {0, 0.3}, nil, false, "ASO-2V", "OPERATOR Set I/II/III")
definePushButton("OP_ASO2V_INTERVAL", 9, 3001, 1008, "ASO-2V", "OPERATOR Interval")
definePushButton("OP_ASO2V_SERIE", 9, 3002, 965, "ASO-2V", "OPERATOR Serie")
definePushButton("OP_ASO2V_LEFT", 9, 3004, 969, "ASO-2V", "OPERATOR Left Side")
definePushButton("OP_ASO2V_RIGHT", 9, 3005, 970, "ASO-2V", "OPERATOR Right Side")
definePushButton("OP_ASO2V_SNARS", 9, 3007, 847, "ASO-2V", "OPERATOR Launch Snars")

defineIndicatorLight("OP_ASO2V_L_L", 966, "ASO-2V Lights", "OPERATOR ASO-2V Left Light (red)")
defineIndicatorLight("OP_ASO2V_R_L", 966, "ASO-2V Lights", "OPERATOR ASO-2V Right Light (red)")

--SPO-10
definePushButton("PLT_RWR_CHECK", 67, 3004, 990, "SPO-10", "PILOT Check RWR")
defineToggleSwitch("PLT_RWR_DAY_NIGHT", 67, 3003, 989, "SPO-10", "PILOT RWR DAY/NIGHT")
defineToggleSwitch("PLT_RWR_PW", 67, 3001, 366, "SPO-10", "PILOT RWR Power")
defineToggleSwitch("PLT_RWR_SIGNAL", 67, 3002, 365, "SPO-10", "PILOT RWR Signal")

defineIndicatorLight("PLT_RWR_R_F_DAY_L", 997, "SPO-10 Lights", "PILOT RWR Right Front DAY Light (white)")
defineIndicatorLight("PLT_RWR_R_B_DAY_L", 998, "SPO-10 Lights", "PILOT RWR Right Back DAY Light (white)")
defineIndicatorLight("PLT_RWR_L_F_DAY_L", 995, "SPO-10 Lights", "PILOT RWR Left Front DAY Light (white)")
defineIndicatorLight("PLT_RWR_L_B_DAY_L", 996, "SPO-10 Lights", "PILOT RWR Left Back DAY Light (white)")
defineIndicatorLight("PLT_RWR_R_F_NGT_L", 993, "SPO-10 Lights", "PILOT RWR Right Front NIGHT Light (red)")
defineIndicatorLight("PLT_RWR_R_B_NGT_L", 994, "SPO-10 Lights", "PILOT RWR Right Back NIGHT Light (red)")
defineIndicatorLight("PLT_RWR_L_F_NGT_L", 991, "SPO-10 Lights", "PILOT RWR Left Front NIGHT Light (red)")
defineIndicatorLight("PLT_RWR_L_B_NGT_L", 992, "SPO-10 Lights", "PILOT RWR Left Back NIGHT Light (red)")
defineIndicatorLight("PLT_RWR_NO_SND_L", 999, "SPO-10 Lights", "PILOT RWR No Sound Light (red)")

--GREBEN
defineRotary("PLT_GREB_CRS_SET", 27, 3015, 858, "GREBEN", "PILOT Greben Course setter")
defineToggleSwitch("PLT_GREB_PW", 27, 3001, 367, "GREBEN", "PILOT Greben ON/OFF")
definePushButton("PLT_GREB_MATCH", 27, 3007, 450, "GREBEN", "PILOT Greben Match")
defineToggleSwitch("PLT_GREB_SETUP", 27, 3012, 451, "GREBEN", "PILOT Greben Mode SETUP/OPER")
define3PosTumb("PLT_GREB_MODE", 27, 3009, 449, "GREBEN", "PILOT Greben Mode ZK/GPK/MK")
defineRotary("PLT_GREB_LAT_SET", 27, 3004, 448, "GREBEN", "PILOT Greben Set Latitude")

defineFloat("PLT_GREB_CLOSE_N", 443, {0, 1}, "GREBEN Gauges", "PILOT Greben North Closed")
defineFloat("PLT_GREB_CLOSE_N_10", 442, {0, 1}, "GREBEN Gauges", "PILOT Greben North 10")
defineFloat("PLT_GREB_CLOSE_N_1", 441, {0, 1}, "GREBEN Gauges", "PILOT Greben North 1")
defineFloat("PLT_GREB_CLOSE_N_10S", 440, {0, 1}, "GREBEN Gauges", "PILOT Greben North 10s")
defineFloat("PLT_GREB_CLOSE_S", 447, {0, 1}, "GREBEN Gauges", "PILOT Greben South Closed")
defineFloat("PLT_GREB_CLOSE_S_10", 446, {0, 1}, "GREBEN Gauges", "PILOT Greben South 10")
defineFloat("PLT_GREB_CLOSE_S_1", 445, {0, 1}, "GREBEN Gauges", "PILOT Greben South 1")
defineFloat("PLT_GREB_CLOSE_S_10S", 444, {0, 1}, "GREBEN Gauges", "PILOT Greben South 10s")

--KM-2
definePushButton("PLT_KM2_TEST", 68, 3002, 645, "KM-2", "PILOT KM-2 Test button")
defineRotary("PLT_KM2_MAG_DEC", 68, 3001, 647, "KM-2", "PILOT KM-2 set Magnetic Declination")

defineFloat("PLT_KM2_MAG_DEC_G", 646, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination Gauge")

--DISS
defineToggleSwitch("PLT_DISS_PW", 8, 3001, 371, "DISS", "PILOT DISS-15D ON/OFF")
defineToggleSwitch("PLT_DISS_DVS", 8, 3002, 370, "DISS", "PILOT Airspeed to DISS-15 ON/OFF")
definePushButton("PLT_DISS_COORD_OFF", 8, 3003, 818, "DISS", "PILOT DISS-15 coordinates OFF")
definePushButton("PLT_DISS_COORD_ON", 8, 3004, 819, "DISS", "PILOT DISS-15 coordinates ON")
definePushButton("PLT_DISS_DEC_MAPANGLE", 8, 3005, 815, "DISS", "PILOT DISS-15 decrease map angle")
definePushButton("PLT_DISS_INC_MAPANGLE", 8, 3006, 816, "DISS", "PILOT DISS-15 increase map angle")
definePushButton("PLT_DISS_DEC_PATH", 8, 3007, 809, "DISS", "PILOT DISS-15 decrease path")
definePushButton("PLT_DISS_INC_PATH", 8, 3008, 810, "DISS", "PILOT DISS-15 increase path")
definePushButton("PLT_DISS_DEC_DEVIATION", 8, 3009, 803, "DISS", "PILOT DISS-15 decrease deviation")
definePushButton("PLT_DISS_INC_DEVIATION", 8, 3010, 804, "DISS", "PILOT DISS-15 increase deviation")
defineToggleSwitch("PLT_DISS_MODE_WORK", 8, 3011, 797, "DISS", "PILOT DISS-15 Mode WORK/CHECK")
defineToggleSwitch("PLT_DISS_MODE_LAND", 8, 3012, 798, "DISS", "PILOT DISS-15 Mode LAND/SEA")
defineMultipositionSwitch("PLT_DISS_SEL_KNB", 8, 3013, 826, 5, 0.1, "DISS", "PILOT DISS-15 select mode IDK/IDK/IDK/MEM/OPER")

defineFloat("PLT_DISS_HOVER_X", 830, {-1, 1}, "DISS Gauges", "PILOT DISS-15 Hover X Indicator")
defineFloat("PLT_DISS_HOVER_Y", 828, {-1, 1}, "DISS Gauges", "PILOT DISS-15 Hover Y Indicator")
defineFloat("PLT_DISS_HOVER_Z", 829, {-1, 1}, "DISS Gauges", "PILOT DISS-15 Hover Z Indicator")
defineFloat("PLT_DISS_DRIFT", 791, {-1, 1}, "DISS Gauges", "PILOT DISS-15 Drift Angle")
defineFloat("PLT_DISS_W_SHUTTER", 795, {0, 1}, "DISS Gauges", "PILOT DISS-15 W Shutter")
defineFloat("PLT_DISS_W_100", 792, {0, 1}, "DISS Gauges", "PILOT DISS-15 W 100")
defineFloat("PLT_DISS_W_10", 793, {0, 1}, "DISS Gauges", "PILOT DISS-15 W 10")
defineFloat("PLT_DISS_W_1", 794, {0, 1}, "DISS Gauges", "PILOT DISS-15 W 1")
defineFloat("PLT_COORD_FWD", 805, {1, 0}, "DISS Gauges", "PILOT DISS-15 Coord Forward")
defineFloat("PLT_COORD_R", 802, {1, 0}, "DISS Gauges", "PILOT DISS-15 Coord Right")
defineFloat("PLT_COORD_X_100", 806, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord X 100")
defineFloat("PLT_COORD_X_10", 807, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord X 10")
defineFloat("PLT_COORD_X_1", 808, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord X 1")
defineFloat("PLT_COORD_Z_100", 799, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Z 100")
defineFloat("PLT_COORD_Z_10", 800, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Z 10")
defineFloat("PLT_COORD_Z_1", 801, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Z 1")
defineFloat("PLT_COORD_ANG_100", 811, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Angle 100")
defineFloat("PLT_COORD_ANG_10", 812, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Angle 10")
defineFloat("PLT_COORD_ANG_1", 813, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Angle 1")
defineFloat("PLT_COORD_ANG_M", 814, {0, 1}, "DISS Gauges", "PILOT DISS-15 Coord Angle Minutes")

defineIndicatorLight("PLT_DISS_HOVER_L", 831, "DISS Lights", "PILOT DISS-15 Hover Light (red)")
defineIndicatorLight("PLT_DISS_W_MEMORY_L", 975, "DISS Lights", "PILOT DISS-15 W Memory Light (green)")
defineIndicatorLight("PLT_DISS_COORD_L", 817, "DISS Lights", "PILOT DISS-15 Coord ON Light (yellow)")
defineIndicatorLight("PLT_DISS_CHK_WORK_L", 823, "DISS Lights", "PILOT DISS-15 Check Work Light (green)")
defineIndicatorLight("PLT_DISS_CHK_FAILM_L", 824, "DISS Lights", "PILOT DISS-15 Check Fail M Light (red)")
defineIndicatorLight("PLT_DISS_CHK_FAILC_L", 825, "DISS Lights", "PILOT DISS-15 Check Fail C Light (red)")

--Radar Altimeter
definePushButton("PLT_RV5_PW", 12, 3003, 372, "Radar Altimeter", "PILOT RV-5 ON/OFF")
definePushButton("PLT_RV5_TEST", 12, 3002, 31, "Radar Altimeter", "PILOT RV-5 Test")
defineRotary("PLT_RV5_ADJ", 12, 3001, 30, "Radar Altimeter", "PILOT RV-5 Adjust")

defineFloat("PLT_RV5_ALT", 32, {0, 1}, "Radar Altimeter Gauges", "PILOT Radar Altitude")
defineFloat("PLT_RV5_DALT", 33, {0, 1}, "Radar Altimeter Gauges", "PILOT Radar Danger Altitude")
defineFloat("PLT_RV5_WARN_FLG", 1021, {0, 1}, "Radar Altimeter Gauges", "PILOT Radar Warning Flag")

defineIndicatorLight("PLT_RV5_DALT_L", 284, "Radar Altimeter Lights", "PILOT Radar Danger Altitude Light (yellow)")

--MAP DISPLAY
define3PosTumb("PLT_MAP_LIGHT", 45, 3011, 192, "MAP DISPLAY", "PILOT Map Highlight  BRIGHT/OFF/DIM")
definePotentiometer("PLT_MAP_ADJ_HOR", 45, 3006, 983, {0, 1}, "MAP DISPLAY", "PILOT Set the horizontal position of the helicopter on the Map")
definePotentiometer("PLT_MAP_ADJ_VERT", 45, 3004, 291, {0, 1}, "MAP DISPLAY", "PILOT Set the vertical position of the helicopter on the Map")
defineToggleSwitch("PLT_MAP_PW", 45, 3008, 984, "MAP DISPLAY", "PILOT Map Power ON/OFF")
defineToggleSwitch("PLT_MAP_SCALE", 45, 3001, 985, "MAP DISPLAY", "PILOT Map Scale Selector")

defineFloat("PLT_MAP_LON", 986, {-1, 1}, "MAP DISPLAY Gauges", "PILOT Map Longitude")
defineFloat("PLT_MAP_LAT", 987, {-1, 1}, "MAP DISPLAY Gauges", "PILOT Map Latitude")

defineIndicatorLight("PLT_MAP_L", 977, "MAP DISPLAY Lights", "PILOT Map Display Light (white)")

--ARC-15
local ARC15_FREQ_POS = {
  ["0"] = "0",
  ["1"] = "0.5",
  ["2"] = "1",
  ["3"] = "1.5",
  ["4"] = "2",
  ["5"] = "2.5",
  ["6"] = "3",
  ["7"] = "3.5",
  ["8"] = "4",
  ["9"] = "4.5",
  ["10"] = "5",
  ["11"] = "5.5",
  ["12"] = "6",
  ["13"] = "6.5",
  ["14"] = "7",
  ["15"] = "7.5",
  ["16"] = "8",
  ["17"] = "8.5",
  ["18"] = "9",
  ["19"] = "9.5"
}

definePotentiometer("PLT_ARC_VOL", 47, 3001, 459, {0, 1}, "ARC-15 PLT", "PILOT ARC-15 Volume")
defineToggleSwitch("PLT_ARC_MODUL", 47, 3002, 460, "ARC-15 PLT", "PILOT ARC-15 TLF/TLG")
defineMultipositionSwitch("PLT_ARC_MODE", 47, 3003, 463, 4, 0.115, "ARC-15 PLT", "PILOT ARC-15 mode OFF/COMPASS/ANT/FRAME")
defineMultipositionSwitch("PLT_ARC_FREQ_L_100", 47, 3004, 467, 18, 1/17, "ARC-15 PLT", "PILOT ARC-15 Left Frequency 100KHz")
defineMultipositionSwitch("PLT_ARC_FREQ_L_10", 47, 3005, 468, 10, 1/9, "ARC-15 PLT", "PILOT ARC-15 Left Frequency 10KHz")
defineMultipositionSwitch("PLT_ARC_FREQ_L_1", 47, 3006, 469, 20, 1/20, "ARC-15 PLT", "PILOT ARC-15 Left Frequency 1KHz")
defineMultipositionSwitch("PLT_ARC_FREQ_R_100", 47, 3007, 464, 18, 1/17, "ARC-15 PLT", "PILOT ARC-15 Right Frequency 100KHz")
defineMultipositionSwitch("PLT_ARC_FREQ_R_10", 47, 3008, 465, 10, 1/9, "ARC-15 PLT", "PILOT ARC-15 Right Frequency 10KHz")
defineMultipositionSwitch("PLT_ARC_FREQ_R_1", 47, 3009, 466, 20, 1/20, "ARC-15 PLT", "PILOT ARC-15 Right Frequency 1KHz")
definePushButton("PLT_ARC_LOOP", 47, 3010, 458, "ARC-15 PLT", "PILOT ARC-15 Loop Button")
defineToggleSwitch("PLT_ARC_CHAN", 47, 3011, 462, "ARC-15 PLT", "PILOT ARC-15 1/2")
definePushButton("PLT_ARC_CONTROL", 47, 3012, 461, "ARC-15 PLT", "PILOT ARC-15 Control Button")

local function getARCLPLTFrequency()
    local freq1 = string.format("%.0f", GetDevice(0):get_argument_value(467)/(1/17))
	if freq1 == nil then freq1 = "0" end
    local freq2 = string.format("%.0f", GetDevice(0):get_argument_value(468)/(1/9))
	if freq2 == nil then freq2 = "0" end
	local freq3 = ARC15_FREQ_POS[string.format("%.0f", GetDevice(0):get_argument_value(469)/(1/20))]
	if freq3 == nil then freq3 = "000" end
    local frequency = freq1 .. freq2 .. freq3

	return  frequency or "000000"
end
defineString("PLT_ARC_FREQ_L", getARCLPLTFrequency, 6, "ARC-15 PLT", "PILOT ARC-15 Left Frequency (String)")

local function getARCRPLTFrequency()
    local freq1 = string.format("%.0f", GetDevice(0):get_argument_value(464)/(1/17))
	if freq1 == nil then freq1 = "0" end
    local freq2 = string.format("%.0f", GetDevice(0):get_argument_value(465)/(1/9))
	if freq2 == nil then freq2 = "0" end
	local freq3 = ARC15_FREQ_POS[string.format("%.0f", GetDevice(0):get_argument_value(466)/(1/20))]
	if freq3 == nil then freq3 = "000" end
    local frequency = freq1 .. freq2 .. freq3

    return  frequency or "000000"
end
defineString("PLT_ARC_FREQ_R", getARCRPLTFrequency, 6, "ARC-15 PLT", "PILOT ARC-15 Right Frequency (String)")

definePotentiometer("OP_ARC_VOL", 48, 3001, 634, {0, 1}, "ARC-15 OP", "OPERATOR ARC-15 Volume")
defineToggleSwitch("OP_ARC_MODUL", 48, 3002, 635, "ARC-15 OP", "OPERATOR ARC-15 TLF/TLG")
defineMultipositionSwitch("OP_ARC_MODE", 48, 3003, 638, 4, 0.115, "ARC-15 OP", "OPERATOR ARC-15 mode OFF/COMPASS/ANT/FRAME")
defineMultipositionSwitch("OP_ARC_FREQ_L_100", 48, 3004, 639, 18, 1/17, "ARC-15 OP", "OPERATOR ARC-15 Left Frequency 100KHz")
defineMultipositionSwitch("OP_ARC_FREQ_L_10", 48, 3005, 640, 10, 1/9, "ARC-15 OP", "OPERATOR ARC-15 Left Frequency 10KHz")
defineMultipositionSwitch("OP_ARC_FREQ_L_1", 48, 3006, 641, 20, 1/20, "ARC-15 OP", "OPERATOR ARC-15 Left Frequency 1KHz")
defineMultipositionSwitch("OP_ARC_FREQ_R_100", 48, 3007, 642, 18, 1/17, "ARC-15 OP", "OPERATOR ARC-15 Right Frequency 100KHz")
defineMultipositionSwitch("OP_ARC_FREQ_R_10", 48, 3008, 643, 10, 1/9, "ARC-15 OP", "OPERATOR ARC-15 Right Frequency 10KHz")
defineMultipositionSwitch("OP_ARC_FREQ_R_1", 48, 3009, 644, 20, 1/20, "ARC-15 OP", "OPERATOR ARC-15 Right Frequency 1KHz")
definePushButton("OP_ARC_LOOP", 48, 3010, 633, "ARC-15 OP", "OPERATOR ARC-15 Loop Button")
defineToggleSwitch("OP_ARC_CHAN", 48, 3011, 637, "ARC-15 OP", "OPERATOR ARC-15 1/2")
definePushButton("OP_ARC_CONTROL", 48, 3012, 636, "ARC-15 OP", "OPERATOR ARC-15 Control Button")

local function getARCLOPFrequency()
    local freq1 = string.format("%.0f", GetDevice(0):get_argument_value(639)/(1/17))
	if freq1 == nil then freq1 = "0" end
    local freq2 = string.format("%.0f", GetDevice(0):get_argument_value(640)/(1/9))
	if freq2 == nil then freq2 = "0" end
	local freq3 = ARC15_FREQ_POS[string.format("%.0f", GetDevice(0):get_argument_value(641)/(1/20))]
	if freq3 == nil then freq3 = "000" end
    local frequency = freq1 .. freq2 .. freq3

    return  frequency or "000000"
end
defineString("OP_ARC_FREQ_L", getARCLOPFrequency, 6, "ARC-15 OP", "OPERATOR ARC-15 Left Frequency (String)")

local function getARCROPFrequency()
    local freq1 = string.format("%.0f", GetDevice(0):get_argument_value(642)/(1/17))
	if freq1 == nil then freq1 = "0" end
    local freq2 = string.format("%.0f", GetDevice(0):get_argument_value(643)/(1/9))
	if freq2 == nil then freq2 = "0" end
	local freq3 = ARC15_FREQ_POS[string.format("%.0f", GetDevice(0):get_argument_value(644)/(1/20))]
	if freq3 == nil then freq3 = "000" end
    local frequency = freq1 .. freq2 .. freq3

    return  frequency or "000000"
end
defineString("OP_ARC_FREQ_R", getARCROPFrequency, 6, "ARC-15 OP", "OPERATOR ARC-15 Right Frequency (String)")

--R863
defineToggleSwitch("PLT_R863_PW", 49, 3001, 375, "R-863", "PILOT R-863 ON/OFF")
defineToggleSwitch("PLT_R863_MODUL", 49, 3004, 506, "R-863", "PILOT R-863 FM/AM")
defineToggleSwitch("PLT_R863_EMERG_RCV", 49, 3015, 507, "R-863", "PILOT R-863 Emergency Receiver ON/OFF")
defineToggleSwitch("PLT_R863_ARC", 49, 3018, 509, "R-863", "PILOT R-863 ARC-UD ON/OFF")
defineToggleSwitch("PLT_R863_SQUELCH", 49, 3009, 510, "R-863", "PILOT R-863 Squelch ON/OFF")
definePotentiometer("PLT_R863_VOL", 49, 3012, 511, {0, 1}, "R-863", "PILOT R-863 Volume")
defineMultipositionSwitch("PLT_R863_CHAN", 49, 3007, 513, 20, 1/20, "R-863", "PILOT R-863 Channel Select")

local function getR863Chan()
    local chan = string.format("%.0f", GetDevice(0):get_argument_value(513)/(1/20))
    if chan == nil then chan = "00" end
	return  chan or "00"
end
defineString("PLT_R863_CHAN_S", getR863Chan, 2, "R-863", "PILOT R-863 Channel (String)")

defineFloat("PLT_R863_CHAN_G", 512, {0, 1}, "R-863 Gauges", "PILOT R-863 Channel Gauge")

defineIndicatorLight("PLT_R863_L", 508, "R-863 Lights", "PILOT R-863 Light (green)")

--Jadro 1I
defineToggleSwitch("PLT_JADRO_PW", 50, 3027, 374, "Jadro-1I", "PILOT Jadro-1I ON/OFF")
defineMultipositionSwitch("PLT_JADRO_MODUL", 50, 3001, 438, 3, 0.1, "Jadro-1I", "PILOT Jadro-1I Mode OFF/AM/OM")
definePotentiometer("PLT_JADRO_VOL", 50, 3019, 426, {0, 1}, "Jadro-1I", "PILOT Jadro-1I Volume")
definePotentiometer("PLT_JADRO_SQUELCH", 50, 3022, 421, {0, 1}, "Jadro-1I", "PILOT Jadro-1I Squelch")
definePushButton("PLT_JADRO_TEST", 50, 3025, 423, "Jadro-1I", "PILOT Jadro-1I Test")
defineFixedStepTumb("PLT_JADRO_1M", 50, 3004, 437, 0.1, {0.2, 1.6}, {-0.1, 0.1}, nil, "Jadro-1I", "PILOT Jadro-1I Frequency 1MHz")
defineFixedStepTumb("PLT_JADRO_100K", 50, 3007, 436, 0.1, {0, 0.9}, {-0.1, 0.1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "Jadro-1I", "PILOT Jadro-1I Frequency 100KHz")
defineFixedStepTumb("PLT_JADRO_10K", 50, 3010, 429, 0.1, {0, 0.9}, {-0.1, 0.1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "Jadro-1I", "PILOT Jadro-1I Frequency 10KHz")
defineFixedStepTumb("PLT_JADRO_1K", 50, 3013, 428, 0.1, {0, 0.9}, {-0.1, 0.1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "Jadro-1I", "PILOT Jadro-1I Frequency 1KHz")
defineFixedStepTumb("PLT_JADRO_100H", 50, 3016, 427, 0.1, {0, 0.9}, {-0.1, 0.1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "Jadro-1I", "PILOT Jadro-1I Frequency 100Hz")

local function getJadroFrequency()
    local yfreq0 = string.format("%.0f", GetDevice(0):get_argument_value(435)*10)
	if yfreq0 == nil then yfreq0 = "0" end
    local yfreq1 = string.format("%.0f", GetDevice(0):get_argument_value(437)*10)
	if yfreq1 == nil then yfreq1 = "0" end
    local yfreq2 = string.format("%.0f", GetDevice(0):get_argument_value(436)*10)
	if yfreq2 == nil then yfreq2 = "0" end
    local yfreq3 = string.format("%.0f", GetDevice(0):get_argument_value(429)*10)
	if yfreq3 == nil then yfreq3 = "0" end
    local yfreq4 = string.format("%.0f", GetDevice(0):get_argument_value(428)*10)
	if yfreq4 == nil then yfreq4 = "0" end
    local yfreq5 = string.format("%.0f", GetDevice(0):get_argument_value(427)*10)
	if yfreq5 == nil then yfreq5 = "0" end
	return  yfreq0 .. yfreq1 .. yfreq2 .. yfreq3 .. yfreq4 .. "." .. yfreq5
end
defineString("JADRO_FREQ", getJadroFrequency, 7, "Jadro-1I", "PILOT Jadro-1I Frequency (String)")

defineIndicatorLight("PLT_JADRO_SEARCH_L", 422, "Jadro-1I Lights", "PILOT Jadro-1I Search Lamp (yellow)")
defineIndicatorLight("PLT_JADRO_CTL_L", 424, "Jadro-1I Lights", "PILOT Jadro-1I Ctl Lamp (red)")
defineIndicatorLight("PLT_JADRO_BREAK_L", 425, "Jadro-1I Lights", "PILOT Jadro-1I Breakdown Lamp (yellow)")

--Eucalypt_M24 (R828)
defineToggleSwitch("PLT_R828_PW", 51, 3005, 373, "Eucalypt-M24", "PILOT R-828 ON/OFF")
defineMultipositionSwitch("PLT_R828_CHAN", 51, 3001, 337, 10, 0.1, "Eucalypt-M24", "PILOT R-828 Channel Select")
definePotentiometer("PLT_R828_VOL", 51, 3002, 339, {0, 1}, "Eucalypt-M24", "PILOT R-828 Volume Knob")
definePushButton("PLT_R828_ASU", 51, 3003, 340, "Eucalypt-M24", "PILOT R-828 ASU")
defineToggleSwitch("PLT_R828_SQUELCH", 51, 3004, 341, "Eucalypt-M24", "PILOT R-828 Squelch ON/OFF")

local function getR828Chan()
    local chan = string.format("%.0f", GetDevice(0):get_argument_value(337)*10)
    if chan == nil then chan = "0" end
	return  chan or "0"
end
defineString("PLT_R828_CHAN_S", getR828Chan, 1, "Eucalypt-M24", "PILOT Eucalypt-M24 Channel (String)")

defineFloat("PLT_R828_CHAN_G", 338, {0, 1}, "Eucalypt-M24 Gauges", "PILOT Eucalypt-M24 Channel Gauge")

defineIndicatorLight("PLT_R828_L", 342, "Eucalypt-M24 Lights", "PILOT Eucalypt-M24 Light (green)")

--R852
definePotentiometer("PLT_R852_VOL", 52, 3004, 517, {0, 1}, "R-852", "PILOT R-852 Volume")
defineMultipositionSwitch("PLT_R852_CHAN", 52, 3001, 518, 4, 0.1, "R-852", "PILOT R-852 Channel Select")

defineFloat("PLT_R852_CHAN_G", 519, {0, 1}, "R-852 Gauges", "PILOT R-852 Channel Gauge")

--Accelerometer
definePushButton("PLT_RESET_G", 53, 3001, 947, "Accelerometer", "PILOT Accelerometer Reset Button - Push to reset")

--Wiper
defineTumb("PLT_WIPER_OFF", 11, 3020, 418, 0.1, {0, 0}, nil, false, "Wiper", "PILOT Windscreen Wiper Control Switch, OFF")
defineTumb("PLT_WIPER_ON", 11, 3020, 418, 0.05, {0, 0.05}, nil, false, "Wiper", "PILOT Windscreen Wiper Control Switch, START")
defineTumb("PLT_WIPER_RST", 11, 3020, 418, 0.35, {0, 0.35}, nil, false, "Wiper", "PILOT Windscreen Wiper Control Switch, RESET")
defineTumb("PLT_WIPER_SPD_1", 11, 3020, 418, 0.15, {0, 0.15}, nil, false, "Wiper", "PILOT Windscreen Wiper Control Switch, SPEED 1")
defineTumb("PLT_WIPER_SPD_2", 11, 3020, 418, 0.25, {0, 0.25}, nil, false, "Wiper", "PILOT Windscreen Wiper Control Switch, SPEED 2")
defineTumb("OP_WIPER_OFF", 11, 3021, 674, 0.1, {0, 0}, nil, false, "Wiper", "OPERATOR Windscreen Wiper Control Switch, OFF")
defineTumb("OP_WIPER_ON", 11, 3021, 674, 0.05, {0, 0.05}, nil, false, "Wiper", "OPERATOR Windscreen Wiper Control Switch, START")
defineTumb("OP_WIPER_RST", 11, 3021, 674, 0.35, {0, 0.35}, nil, false, "Wiper", "OPERATOR Windscreen Wiper Control Switch, RESET")
defineTumb("OP_WIPER_SPD_1", 11, 3021, 674, 0.15, {0, 0.15}, nil, false, "Wiper", "OPERATOR Windscreen Wiper Control Switch, SPEED 1")
defineTumb("OP_WIPER_SPD_2", 11, 3021, 674, 0.25, {0, 0.25}, nil, false, "Wiper", "OPERATOR Windscreen Wiper Control Switch, SPEED 2")

--ARK U2
defineToggleSwitch("PLT_ARCU2_PW", 54, 3001, 324, "ARC-U2 ", "PILOT ARC-U2 switcher ON/OFF")
defineSpringloaded_3PosTumb("PLT_ARCU2_FRAME", 54, 3002, 3003, 325, "ARC-U2 ", "PILOT ARC-U2 switcher L–RAMKA-P")
defineToggleSwitch("PLT_ARCU2_SENS", 54, 3004, 326, "ARC-U2 ", "PILOT ARC-U2 switcher sensitivity B-M")
define3PosTumb("PLT_ARCU2_COMPASS", 54, 3005, 327, "ARC-U2 ", "PILOT ARC-U2 switcher COMPASS R-852–RADIOLINK–COMPASS R-828")

--SPU-8
defineToggleSwitch("PLT_SPU8_NET", 55, 3007, 452, "SPU-8 PLT", "PILOT SPU-8 Network 1/2 Switch (N/F)")
definePotentiometer("PLT_SPU8_RADIO_VOL", 55, 3002, 453, {0, 1}, "SPU-8 PLT", "PILOT SPU-8 Radio Volume Knob")
definePushButton("PLT_SPU8_CIRC", 55, 3008, 454, "SPU-8 PLT", "PILOT SPU-8 Circular Call Button (N/F)")
defineMultipositionSwitch("PLT_SPU8_MODE", 55, 3003, 455, 6, 1/5, "SPU-8 PLT", "PILOT SPU-8 Radio Source Selector Switch, R-863/NF/JADRO-1A/R-828(Eucalypt)/ARC-15/ARC-U2")
defineToggleSwitch("PLT_SPU8_ICS", 55, 3004, 456, "SPU-8 PLT", "PILOT SPU-8 Radio/ICS Switch")
definePotentiometer("PLT_SPU8_VOL", 55, 3001, 457, {0, 1}, "SPU-8 PLT", "PILOT SPU-8 Volume Knob")
defineToggleSwitch("PLT_SPU8_1_PW", 55, 3017, 376, "SPU-8 PLT", "PILOT SPU-8 Switch NET-1 ON/OFF")
defineToggleSwitch("PLT_SPU8_2_PW", 55, 3018, 377, "SPU-8 PLT", "PILOT SPU-8 Switch NET-2 ON/OFF")
defineToggleSwitch("OP_SPU8_NET", 55, 3013, 656, "SPU-8 OP", "OPERATOR SPU-8 Network 1/2 Switch (N/F)")
definePotentiometer("OP_SPU8_RADIO_VOL", 55, 3010, 657, {0, 1}, "SPU-8 OP", "OPERATOR SPU-8 Radio Volume Knob")
definePushButton("OP_SPU8_CIRC", 55, 3014, 658, "SPU-8 OP", "OPERATOR SPU-8 Circular Call Button (N/F)")
defineMultipositionSwitch("OP_SPU8_MODE", 55, 3011, 659, 6, 1/5, "SPU-8 OP", "OPERATOR SPU-8 Radio Source Selector Switch, R-863/NF/JADRO-1A/R-828(Eucalypt)/ARC-15/ARC-U2")
defineToggleSwitch("OP_SPU8_ICS", 55, 3012, 660, "SPU-8 OP", "OPERATOR SPU-8 Radio/ICS Switch")
definePotentiometer("OP_SPU8_VOL", 55, 3009, 661, {0, 1}, "SPU-8 OP", "OPERATOR SPU-8 Volume Knob")
defineToggleSwitch("OP_SPU8_SPUU_PW", 55, 3015, 664, "SPU-8 OP", "OPERATOR SPU-8 SPUU Power ON/OFF")

--IFF
defineMultipositionSwitch("PLT_IFF_MODE", 57, 3001, 334, 4, 1/3, "IFF", "PILOT IFF Transponder Mode Selector Switch, AUTO/KD/+-15/KP")
defineToggleSwitch("PLT_IFF_DEVICE_SEL", 57, 3002, 336, "IFF", "PILOT IFF Transponder Device Selector Switch, WORK/RESERVE")
defineToggleSwitch("PLT_IFF_MODE_1_2", 57, 3003, 332, "IFF", "PILOT IFF Transponder Device Mode Switch, 1/2")
defineToggleSwitch("PLT_IFF_ERASE_CV", 57, 3004, 328, "IFF", "PILOT IFF Transponder Erase Button Cover, OPEN/CLOSE")
definePushButton("PLT_IFF_ERASE", 57, 3005, 329, "IFF", "PILOT IFF Transponder Erase Button - Push to erase")
defineToggleSwitch("PLT_IFF_SOS_CV", 57, 3006, 330, "IFF", "PILOT IFF Transponder Disaster Switch Cover, OPEN/CLOSE")
defineToggleSwitch("PLT_IFF_SOS", 57, 3007, 331, "IFF", "PILOT IFF Transponder Disaster Switch, ON/OFF")
defineToggleSwitch("PLT_IFF_PW", 57, 3008, 383, "IFF", "PILOT IFF Transponder Power Switch, ON/OFF")

defineIndicatorLight("PLT_IFF_KD_L", 333, "IFF Lights", "PILOT IFF KD Lamp (green)")
defineIndicatorLight("PLT_IFF_KP_L", 335, "IFF Lights", "PILOT IFF KP Lamp (green)")

--Recorder MC 61
defineToggleSwitch("PLT_REC_PW", 58, 3001, 378, "Recorder MC 61", "PILOT Recorder MC 61 Power Switch, ON/OFF")
defineToggleSwitch("PLT_REC_MODE", 58, 3002, 1007, "Recorder MC 61", "PILOT Recorder MC 61 AUTO/WORK")
definePotentiometer("PLT_REC_BRGHT", 58, 3003, 381, {0, 1}, "Recorder MC 61", "PILOT Recorder MC 61 Brightness Knob")
defineToggleSwitch("PLT_REC_SOURCE", 58, 3004, 1012, "Recorder MC 61", "PILOT Recorder MC 61 Laryngophone Switch, ON/OFF")

defineIndicatorLight("PLT_REC_L", 379, "Recorder MC 61 Lights", "PILOT Recorder MC 61 Lamp (green)")

--RI-65
definePushButton("PLT_RI65_OFF", 59, 3001, 359, "RI-65", "PILOT RI-65 OFF Button")
definePushButton("PLT_RI65_CHECK", 59, 3002, 360, "RI-65", "PILOT RI-65 Check Button")
definePushButton("PLT_RI65_REPEAT", 59, 3003, 361, "RI-65", "PILOT RI-65 Repeat Button")

--External Cargo Equipment
defineToggleSwitch("PLT_CARGO_TACT_CV", 61, 3002, 751, "External Cargo Equipment", "PILOT Tactical Cargo Release Button Cover, OPEN/CLOSE")
definePushButton("PLT_CARGO_TACT", 61, 3001, 752, "External Cargo Equipment", "PILOT Tactical Cargo Release Button - Push to release")
defineToggleSwitch("PLT_CARGO_EMERG_CV", 61, 3004, 748, "External Cargo Equipment", "PILOT Emergency Cargo Release Button Cover, OPEN/CLOSE")
definePushButton("PLT_CARGO_EMERG", 61, 3003, 749, "External Cargo Equipment", "PILOT Emergency Cargo Release Button - Push to release")
defineToggleSwitch("PLT_CARGO_AUTOLOCK", 61, 3007, 199, "External Cargo Equipment", "PILOT External Cargo Automatic Dropping, ON/OFF")
defineToggleSwitch("PLT_CARGO_REMOVE", 61, 3008, 198, "External Cargo Equipment", "PILOT External Cargo Remove Release, ON/OFF")
defineToggleSwitch("OP_CARGO_EMERG_CV", 61, 3006, 862, "External Cargo Equipment", "OPERATOR Emergency Cargo Release Button Cover, OPEN/CLOSE")
definePushButton("OP_CARGO_EMERG", 61, 3005, 863, "External Cargo Equipment", "OPERATOR Emergency Cargo Release Button - Push to release")

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
defineFloat("OP_CANOPY_POS", 849, {0, 1}, "Gauges OP", "OPERATOR Canopy Position")
defineFloat("PLT_CANOPY_POS", 9, {0, 1}, "Gauges PLT", "PILOT Door Position")
defineFloat("OP_WIPER_POS", 973, {0, 1}, "Gauges OP", "OPERATOR Wiper Position")
defineFloat("PLT_WIPER_POS", 972, {0, 1}, "Gauges PLT", "PILOT Wiper Position")
defineFloat("PLT_VARIOMETER", 1, {-1, 1}, "Gauges PLT", "PILOT Variometer")
defineFloat("PLT_GMETER", 17, {-1, 1}, "Gauges PLT", "PILOT G-Meter")
defineFloat("PLT_GMETER_MIN", 16, {-1, 1}, "Gauges PLT", "PILOT G-Meter Min")
defineFloat("PLT_GMETER_MAX", 18, {-1, 1}, "Gauges PLT", "PILOT G-Meter Max")
defineFloat("PLT_IAS", 790, {-1, 1}, "Gauges PLT", "PILOT IAS Speed")
defineFloat("OP_IAS", 776, {-1, 1}, "Gauges OP", "OPERATOR IAS Speed")

--Warning, Caution and IndicatorLights
defineIndicatorLight("OP_GYRO2_FAIL_L", 320, "Warning, Caution and IndicatorLights OP", "OPERATOR failure Gyro 2 Lamp (red)")
defineIndicatorLight("OP_PIT_WH_L", 981, "Warning, Caution and IndicatorLights OP", "OPERATOR White Cabin Lamp (white)")
defineIndicatorLight("OP_PIT_RD_L", 982, "Warning, Caution and IndicatorLights OP", "OPERATOR Red Cabin Lamp (red)")
defineIndicatorLight("PLT_L_VU_OFF_L", 63, "Warning, Caution and IndicatorLights PLT", "PILOT Left VU OFF Lamp (yellow)")
defineIndicatorLight("PLT_R_VU_OFF_L", 64, "Warning, Caution and IndicatorLights PLT", "PILOT Right VU OFF Lamp (yellow)")
defineIndicatorLight("PLT_MAIN_TRANS_36_DIM_OFF_L", 197, "Warning, Caution and IndicatorLights PLT", "PILOT Main Transformer 36V DIM OFF Light (yellow)")
defineIndicatorLight("PLT_PIT_WH_L", 881, "Warning, Caution and IndicatorLights PLT", "PILOT White Cabin Lamp (white)")
defineIndicatorLight("PLT_PIT_RD_L", 976, "Warning, Caution and IndicatorLights PLT", "PILOT Red Cabin Lamp (red)")
defineIndicatorLight("PLT_MAIN_RED_LOW_PRESS_L", 154, "Warning, Caution and IndicatorLights PLT", "PILOT Main Reducer Low Pressure Lamp (red)")
defineIndicatorLight("PLT_TANK1_120_L", 152, "Warning, Caution and IndicatorLights PLT", "PILOT Tank 1 remains 120L Lamp (red)")
defineIndicatorLight("PLT_TANK2_120_L", 153, "Warning, Caution and IndicatorLights PLT", "PILOT Tank 2 remains 120L Lamp (red)")
defineIndicatorLight("PLT_HYD_UNIT1_FAIL_L", 11, "Warning, Caution and IndicatorLights PLT", "PILOT Hydro Unit 1 Failure Lamp (red)")
defineIndicatorLight("PLT_HYD_UNIT2_FAIL_L", 13, "Warning, Caution and IndicatorLights PLT", "PILOT Hydro Unit 2 Failure Lamp (red)")
defineIndicatorLight("PLT_EL_SYS_ATTENTION_L", 155, "Warning, Caution and IndicatorLights PLT", "PILOT Attention Electro System Panel Lamp (yellow)")
defineIndicatorLight("PLT_AI9V_WORK_L", 79, "Warning, Caution and IndicatorLights PLT", "PILOT AI 9V Works Lamp (yellow)")
defineIndicatorLight("PLT_REST_MANEUVER_L", 157, "Warning, Caution and IndicatorLights PLT", "PILOT Restrict Maneuver Lamp (red)")
defineIndicatorLight("PLT_PUMP1_WORK_L", 407, "Warning, Caution and IndicatorLights PLT", "PILOT Pump 1 works Lamp (green)")
defineIndicatorLight("PLT_PUMP2_WORK_L", 409, "Warning, Caution and IndicatorLights PLT", "PILOT Pump 2 works Lamp (green)")
defineIndicatorLight("PLT_PUMP4_WORK_L", 403, "Warning, Caution and IndicatorLights PLT", "PILOT Pump 4 works Lamp (green)")
defineIndicatorLight("PLT_PUMP5_WORK_L", 405, "Warning, Caution and IndicatorLights PLT", "PILOT Pump 5 works Lamp (green)")
defineIndicatorLight("PLT_FUEL_TRANS_L", 413, "Warning, Caution and IndicatorLights PLT", "PILOT Fuel Transfer Lamp (green)")
defineIndicatorLight("PLT_FUEL_TRANS_OFF_L", 412, "Warning, Caution and IndicatorLights PLT", "PILOT Fuel Transfer OFF Lamp (yellow)")
defineIndicatorLight("PLT_TANK_VALVE_CLOSE_L_L", 391, "Warning, Caution and IndicatorLights PLT", "PILOT Left Consumption Tank Valve Close Lamp (yellow)")
defineIndicatorLight("PLT_TANK_VALVE_CLOSE_R_L", 393, "Warning, Caution and IndicatorLights PLT", "PILOT Right Consumption Tank Valve Close Lamp (yellow)")
defineIndicatorLight("PLT_ENG_VALVE_CLOSE_L_L", 395, "Warning, Caution and IndicatorLights PLT", "PILOT Left Engine Valve Close Lamp (yellow)")
defineIndicatorLight("PLT_ENG_VALVE_CLOSE_R_L", 398, "Warning, Caution and IndicatorLights PLT", "PILOT Right Engine Valve Close Lamp (yellow)")
defineIndicatorLight("PLT_SEP_VALVE_CLOSE_L", 401, "Warning, Caution and IndicatorLights PLT", "PILOT Separatory Valve Close Lamp (yellow)")
defineIndicatorLight("PLT_FIRE_L", 151, "Warning, Caution and IndicatorLights PLT", "PILOT Fire Lamp (red)")
defineIndicatorLight("PLT_FIRE_L_ENG_L", 470, "Warning, Caution and IndicatorLights PLT", "PILOT Fire Left Engine Lamp (red)")
defineIndicatorLight("PLT_FIRE_R_ENG_L", 473, "Warning, Caution and IndicatorLights PLT", "PILOT Fire Right Engine Lamp (red)")
defineIndicatorLight("PLT_FIRE_AI9_L", 476, "Warning, Caution and IndicatorLights PLT", "PILOT Fire AI-9 Tank Lamp (red)")
defineIndicatorLight("PLT_FIRE_MAIN_RED_L", 479, "Warning, Caution and IndicatorLights PLT", "PILOT Fire Main Reducer Lamp (red)")
defineIndicatorLight("PLT_PYRO1_1_L", 471, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 1 1 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO1_2_L", 474, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 1 2 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO1_3_L", 477, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 1 3 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO1_4_L", 480, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 1 4 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO2_1_L", 472, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 2 1 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO2_2_L", 475, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 2 2 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO2_3_L", 478, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 2 3 Lamp (yellow)")
defineIndicatorLight("PLT_PYRO2_4_L", 481, "Warning, Caution and IndicatorLights PLT", "PILOT Pyro 2 4 Lamp (yellow)")
defineIndicatorLight("PLT_CONTRL_SENSOR_L", 483, "Warning, Caution and IndicatorLights PLT", "PILOT Control Sensor Lamp (yellow)")
defineIndicatorLight("PLT_CHIP_TRANS_OIL_L", 158, "Warning, Caution and IndicatorLights PLT", "PILOT Chip in Transmission Oil Lamp (yellow)")
defineIndicatorLight("PLT_WHEEL_BRK_L", 220, "Warning, Caution and IndicatorLights PLT", "PILOT Wheel Brake Lamp (red)")
defineIndicatorLight("PLT_OP_CONTROL_L", 177, "Warning, Caution and IndicatorLights PLT", "PILOT Operator Control Lamp (yellow)")
defineIndicatorLight("PLT_ICING_L", 150, "Warning, Caution and IndicatorLights PLT", "PILOT Icing Lamp (red)")
defineIndicatorLight("PLT_ANTI_ICE_FAIL_L", 163, "Warning, Caution and IndicatorLights PLT", "PILOT Anti Icing System Failed Lamp (yellow)")
defineIndicatorLight("PLT_ANTI_ICE_AUTO_L", 156, "Warning, Caution and IndicatorLights PLT", "PILOT Automatic Control Anti Icing System Lamp (yellow)")
defineIndicatorLight("PLT_ANTI_ICE_ON_L", 103, "Warning, Caution and IndicatorLights PLT", "PILOT Anti Icing ON Lamp (green)")
defineIndicatorLight("PLT_HEAT_L_ENG_ON_L", 104, "Warning, Caution and IndicatorLights PLT", "PILOT Heating Left Engine ON Lamp (green)")
defineIndicatorLight("PLT_HEAT_R_ENG_ON_L", 105, "Warning, Caution and IndicatorLights PLT", "PILOT Heating Right Engine ON Lamp (green)")
defineIndicatorLight("PLT_HEAT_L_DUST_ON_L", 106, "Warning, Caution and IndicatorLights PLT", "PILOT Heating Left Dustproof ON Lamp (green)")
defineIndicatorLight("PLT_HEAT_R_DUST_ON_L", 107, "Warning, Caution and IndicatorLights PLT", "PILOT Heating Right Dustproof ON Lamp (green)")
defineIndicatorLight("PLT_HEAT_RIO3_NORM_L", 108, "Warning, Caution and IndicatorLights PLT", "PILOT Heating RIO-3 in Normal State Lamp (green)")
defineIndicatorLight("PLT_BLADES_SEC1_L", 131, "Warning, Caution and IndicatorLights PLT", "PILOT Blades Section HB 1 Lamp (green)")
defineIndicatorLight("PLT_BLADES_SEC2_L", 117, "Warning, Caution and IndicatorLights PLT", "PILOT Blades Section HB 2 Lamp (green)")
defineIndicatorLight("PLT_BLADES_SEC3_L", 116, "Warning, Caution and IndicatorLights PLT", "PILOT Blades Section HB 3 Lamp (green)")
defineIndicatorLight("PLT_BLADES_SEC4_L", 115, "Warning, Caution and IndicatorLights PLT", "PILOT Blades Section HB 4 Lamp (green)")
defineIndicatorLight("PLT_ENG_L_GAS_TEMP_L", 161, "Warning, Caution and IndicatorLights PLT", "PILOT Left Engine Gas Temperature High Lamp (red)")
defineIndicatorLight("PLT_ENG_R_GAS_TEMP_L", 162, "Warning, Caution and IndicatorLights PLT", "PILOT Right Engine Gas Temperature High Lamp (red)")
defineIndicatorLight("PLT_ENG_L_ANTI_DUST_L", 175, "Warning, Caution and IndicatorLights PLT", "PILOT Left Engine Anti Dust ON Lamp (green)")
defineIndicatorLight("PLT_ENG_R_ANTI_DUST_L", 176, "Warning, Caution and IndicatorLights PLT", "PILOT Right Engine Anti Dust ON Lamp (green)")
defineIndicatorLight("PLT_TEMP_PEDAL_L", 291, "Warning, Caution and IndicatorLights PLT", "PILOT Great Temperature Give a Pedal Lamp (yellow)")
defineIndicatorLight("PLT_LOCK_REL_L", 200, "Warning, Caution and IndicatorLights PLT", "PILOT Lock Released Lamp (yellow)")
defineIndicatorLight("PLT_LOCK_OPENL", 201, "Warning, Caution and IndicatorLights PLT", "PILOT Lock Open Lamp (green)")
defineIndicatorLight("PLT_AUTO_DEP_ON_L", 202, "Warning, Caution and IndicatorLights PLT", "PILOT Automatic Department ON Lamp (yellow)")
defineIndicatorLight("PLT_SARPP_WORKS_L", 358, "Warning, Caution and IndicatorLights PLT", "PILOT SARPP Works Lamp (green)")

defineIndicatorLight("PLT_INSTR_R_PANEL_L", 821, "Internal Lights", "PILOT Instrument & Right Panel Lighting (red)")
defineIndicatorLight("PLT_L_PANEL_L", 979, "Internal Lights", "PILOT Left Panel Lighting (red)")
defineIndicatorLight("PLT_OP_GAUGES_L", 978, "Internal Lights", "PILOT OPERATOR Built In Gauges Lighting (red)")
defineIndicatorLight("OP_PANEL1_L", 282, "Internal Lights", "OPERATOR Panel 1 Lighting (red)")
defineIndicatorLight("OP_PANEL1_L", 283, "Internal Lights", "OPERATOR Panel 1 Lighting (red)")

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

defineIndicatorLight("OP_TIMER_L", 1026, "Internal Lights", "OPERATOR Timer Device Lamp (yellow)")
defineToggleSwitch("PLT_SPU8_STICK_BTN", 55, 3024, 738, "SPU-8 PLT", "PILOT SPU-8 Trigger Button, RADIO(LMB)/ICS(RMB)")
defineToggleSwitch("OP_SPU8_STICK_BTN", 55, 3025, 856, "SPU-8 OP", "OPERATOR SPU-8 Trigger Button, RADIO(LMB)/ICS(RMB)")

--Timer
defineToggleSwitch("OP_TIMER_L_UP", 70, 3003, 1015, "Timer", "OPERATOR Left Timer Control Up/Down")
definePotentiometer("OP_TIMER_L_ROT", 70, 3004, 1016, {0, 1}, "Timer", "OPERATOR Left Timer Control Rotary")
defineToggleSwitch("OP_TIMER_R_UP", 70, 3005, 1019, "Timer", "OPERATOR Right Timer Control Up/Down")
definePotentiometer("OP_TIMER_R_ROT", 70, 3006, 1020, {0, 1}, "Timer", "OPERATOR Right Timer Control Rotary")
defineTumb("OP_TIMER_SEL", 70, 3002, 1017, 0.5, {0, 1}, nil, false, "Timer", "OPERATOR Active Timer Select")
defineToggleSwitch("OP_TIMER_ON", 70, 3001, 1018, "Timer", "OPERATOR Active Timer Start/Stop")

defineFloat("PLT_KM2_MAG_DEC_01P_G", 651, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 01 Plus Gauge")
defineFloat("PLT_KM2_MAG_DEC_1P_G", 650, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 1 Plus Gauge")
defineFloat("PLT_KM2_MAG_DEC_10P_G", 649, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 10 Plus Gauge")
defineFloat("PLT_KM2_MAG_DEC_100P_G", 648, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 100 Plus Gauge")
defineFloat("PLT_KM2_MAG_DEC_01M_G", 652, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 01 Minus Gauge")
defineFloat("PLT_KM2_MAG_DEC_1M_G", 653, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 1 Minus Gauge")
defineFloat("PLT_KM2_MAG_DEC_10M_G", 654, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 10 Minus Gauge")
defineFloat("PLT_KM2_MAG_DEC_100M_G", 655, {0, 1}, "KM-2 Gauges", "PILOT KM-2 Magnetic Declination 100 Minus Gauge")

--PKI
defineRotary("OP_PKI_CONTROL", 17, 3001, 846, "PKI", "OPERATOR PKI reflector control")
definePotentiometer("OP_PKI_BRIGHT", 17, 3004, 136, {0, 1}, "PKI", "OPERATOR PKI Brightness Adjustment")
defineToggleSwitch("OP_PKI_LOCK", 17, 3006, 15, "PKI", "OPERATOR PKI Lock/Unlock")

defineFloat("OP_AIM_REF_MARKER", 1028, {0, 1}, "Gauges OP", "OPERATOR Aiming Reference Marker")

defineIntegerFromGetter("EXT_ROTOR", function()
	return math.floor(LoGetAircraftDrawArgumentValue(40)*65535)
end, 65535, "External Aircraft Model", "Rotor Move")

--R60 control
defineToggleSwitch("PLT_R60_PW", 73, 3001, 1033, "R60", "PILOT R60 Power")
defineToggleSwitch("PLT_R60_FUSE", 73, 3002, 1034, "R60", "PILOT R60 Fuse Selector")
defineMultipositionSwitch("PLT_R60_CHAN", 73, 3003, 1032, 5, 0.1, "R60", "PILOT R60 Active missile selector")

defineIndicatorLight("PLT_R60_ON_L", 1031, "R60 Lights", "PILOT R60 ON Lamp (green)")
defineIndicatorLight("PLT_R60_WORK_L", 1029, "R60 Lights", "PILOT R60 Working Lamp (yellow)")
defineIndicatorLight("PLT_R60_RDY_L", 1030, "R60 Lights", "PILOT R60 Ready Lamp (green)")

defineToggleSwitch("PLT_HEAT_CLOCK", 11, 3047, 386, "Cockpit Mechanics PLT", "PILOT Clock Heating Switch, ON/OFF")
defineToggleSwitch("PLT_HEAT_L_PPD", 11, 3043, 387, "Cockpit Mechanics PLT", "PILOT Heating PPD Left, ON/OFF")
defineToggleSwitch("PLT_HEAT_R_PPD", 11, 3045, 389, "Cockpit Mechanics PLT", "PILOT Heating PPD Right, ON/OFF")

defineIndicatorLight("PLT_HEAT_L_FAIL_L", 388, "Cockpit Mechanics Lights", "PILOT Heating Left Failed Lamp (yellow)")
defineIndicatorLight("PLT_HEAT_R_FAIL_L", 390, "Cockpit Mechanics Lights", "PILOT Heating Left Failed Lamp (yellow)")

define3PosTumb("PLT_SARPP12_MODE", 62, 3001, 357, "SARPP-12", "PILOT SARPP-12 Mode Switch, MANUAL/AUTO")

defineMultipositionSwitch("PLT_JADRO_SQUELCH_SW", 50, 3022, 421, 8, 0.125, "Jadro-1I", "PILOT Jadro-1I Squelch (as Multipos)")

BIOS.protocol.endModule()