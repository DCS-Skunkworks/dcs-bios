BIOS.protocol.beginModule("MirageF1", 0x8600)
BIOS.protocol.setExportModuleAircrafts({"Mirage-F1BE", "Mirage-F1CE", "Mirage-F1EE"})
--by WarLord v1.7a
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local define3PosTumb = BIOS.util.define3PosTumb
local defineSpringloaded_3PosTumb = BIOS.util.defineSpringloaded_3PosTumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineRadioWheel = BIOS.util.defineRadioWheel
local defineSpringloaded_2PosTumb = BIOS.util.defineSpringloaded_2PosTumb

--remove Arg# Stick #34

----Common
defineToggleSwitch("P_STICK_HIDE", 1, 3001, 34, "COMMON Misc", "Pilot Show/Hide Flight Stick")
defineSpringloaded_3PosTumb("P_INCIDENCE_TEST", 1, 3006, 3005, 98, "COMMON Misc", "Pilot Incidence Test Switch")
definePushButton("P_ALT_PTT", 1, 3100, 405, "Misc", "COMMON Pilot Alternative PTT")

--Flight Control System controls
definePushButton("P_FCS_TEST_RES", 1, 3007, 368, "COMMON Flight Control System", "Pilot Flight Control Test Restart Button")
defineToggleSwitch("P_FCS_TEST_CVR", 1, 3008, 369, "COMMON Flight Control System", "Pilot Flight Control Test Switch Guard")
defineToggleSwitch("P_FCS_TEST", 1, 3009, 370, "COMMON Flight Control System", "Pilot Flight Control Test Switch")
definePushButton("P_FCS_SERVO_RES", 1, 3012, 89, "COMMON Flight Control System", "Pilot Servo Reset Button")
defineToggleSwitch("P_FCS_STICK_UNCOUPLE_CVR", 1, 3014, 95, "COMMON Flight Control System", "Pilot Stick Uncouple Switch Guard")
defineToggleSwitch("P_FCS_STICK_UNCOUPLE", 1, 3013, 97, "COMMON Flight Control System", "Pilot Stick Uncouple Switch")
defineToggleSwitch("P_FCS_ARTHUR_SEL_CVR", 1, 3015, 94, "COMMON Flight Control System", "Pilot ARTHUR Selector Switch Guard")
defineMultipositionSwitch("P_FCS_ARTHUR_SEL", 1, 3016, 96, 3, 0.5, "COMMON Flight Control System", "Pilot ARTHUR Selector Switch")
defineMultipositionSwitch("P_FCS_YAW_ANTISLIP", 1, 3017, 90, 3, 0.5, "COMMON Flight Control System", "Pilot Yaw/Anti-Slip Switch")
defineToggleSwitch("P_FCS_PITCH_SW", 1, 3018, 91, "COMMON Flight Control System", "Pilot Pitch Switch")
defineSpringloaded_3PosTumb("P_FCS_RUDDER_TRIM", 1, 3019, 3020, 406, "COMMON Flight Control System", "Pilot Rudder Trim Control Switch")
definePushButton("P_FCS_AP_PA_BTN", 1, 3025, 974, "COMMON Flight Control System", "Pilot Autopilot PA Button")
definePushButton("P_FCS_AP_ALT_BTN", 1, 3026, 977, "COMMON Flight Control System", "Pilot Autopilot ALT Button")
definePushButton("P_FCS_AP_CAP_BTN", 1, 3027, 980, "COMMON Flight Control System", "Pilot Autopilot CAP Button")
definePushButton("P_FCS_AP_R_BTN", 1, 3028, 982, "COMMON Flight Control System", "Pilot Autopilot R Button")
definePushButton("P_FCS_AP_G_BTN", 1, 3029, 987, "COMMON Flight Control System", "Pilot Autopilot G Button")
defineRotary("P_FCS_AP_INT", 1, 3031, 992, "COMMON Flight Control System", "Pilot Autopilot Intensity Control")
definePushButton("P_FCS_AP_TEST_BTN", 1, 3032, 973, "COMMON Flight Control System", "Pilot Autopilot Control and Indicator Unit Test Button")

defineIndicatorLight("P_FCS_AP1_P_L", 975, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 1 P Light (red)")
defineIndicatorLight("P_FCS_AP1_A_L", 976, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 1 A Light (green)")
defineIndicatorLight("P_FCS_AP2_ALT_L", 978, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 2 ALT Light (green)")
defineIndicatorLight("P_FCS_AP2_ALT_R_L", 979, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 2 ALT RED Light (red)")
defineIndicatorLight("P_FCS_AP3_CAP_L", 981, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 3 CAP Light (green)")
defineIndicatorLight("P_FCS_AP4_LR_L", 983, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 4 Left Arrow Light (red)")
defineIndicatorLight("P_FCS_AP4_R_L", 984, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 4 R Light (red)")
defineIndicatorLight("P_FCS_AP4_RR_L", 985, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 4 Right Arrow Light (red)")
defineIndicatorLight("P_FCS_AP4_GN_L", 986, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 4 Bottom Light (green)")
defineIndicatorLight("P_FCS_AP5_G_L", 988, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 5 G Light (red)")
defineIndicatorLight("P_FCS_AP5_UR_L", 989, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 5 Upper Arrow Light (red)")
defineIndicatorLight("P_FCS_AP5_GN_L", 990, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 5 Right Light (green)")
defineIndicatorLight("P_FCS_AP5_LR_L", 991, "COMMON Flight Control System Lights", "Pilot Autopilot BTN 5 Lower Arrow Light (red)")

defineFloat("P_FCS_TRIM_RDR_G", 723, {-1, 1}, "COMMON Flight Control System Gauges", "Pilot Rudder Trim Indicator")
defineFloat("P_FCS_TRIM_ROLL_G", 724, {-1, 1}, "COMMON Flight Control System Gauges", "Pilot Roll Trim Indicator")
defineFloat("P_FCS_TRIM_P_G", 725, {-1, 1}, "COMMON Flight Control System Gauges", "Pilot Pitch Trim Indicator")
defineFloat("P_FCS_CABIN_PRESS_G", 726, {0, 1}, "COMMON Flight Control System Gauges", "Pilot Cabin Altimeter Gauge")

--Engine and Fuel Controls
definePushButton("P_EFC_THL_CUT_IDLE", 1, 3037, 239, "COMMON Engine-Fuel Control", "Pilot Throttle Cut/Idle Switch")
defineSpringloaded_2PosTumb("P_EFC_ENG_RELIGHT", 1, 3038, 3039, 240, "COMMON Engine-Fuel Control", "Pilot In-flight Relight Control")
define3PosTumb("P_EFC_ING_VENT_SEL", 1, 3040, 376, "COMMON Engine-Fuel Control", "Pilot Ignition/Ventilation Selector Switch")
defineToggleSwitch("P_EFC_START_CVR", 1, 3041, 374, "COMMON Engine-Fuel Control", "Pilot Start Button Cover")
definePushButton("P_EFC_START", 1, 3042, 375, "COMMON Engine-Fuel Control", "Pilot Start Button")
defineToggleSwitch("P_EFC_LP_MAIN_CVR", 1, 3043, 380, "COMMON Engine-Fuel Control", "Pilot LP Main Cock Switch Guard")
defineToggleSwitch("P_EFC_LP_MAIN", 1, 3044, 381, "COMMON Engine-Fuel Control", "Pilot LP Main Cock Switch")
defineToggleSwitch("P_EFC_JPT_EMERG", 1, 3047, 396, "COMMON Engine-Fuel Control", "Pilot JPT Emergency Regulation Switch")
defineToggleSwitch("P_EFC_AB_MAIN_CVR", 1, 3048, 397, "COMMON Engine-Fuel Control", "Pilot A/B Main Cock Switch Guard")
defineToggleSwitch("P_EFC_AB_MAIN", 1, 3049, 398, "COMMON Engine-Fuel Control", "Pilot A/B Main Cock Switch")
defineToggleSwitch("P_EFC_PUMP_START", 1, 3050, 377, "COMMON Engine-Fuel Control", "Pilot Starting Pump Switch")
defineToggleSwitch("P_EFC_PUMP_LP_R", 1, 3051, 378, "COMMON Engine-Fuel Control", "Pilot R/H LP Pump Switch")
defineToggleSwitch("P_EFC_PUMP_LP_L", 1, 3052, 379, "COMMON Engine-Fuel Control", "Pilot L/H LP Pump Switch")
defineSpringloaded_2PosTumb("P_EFC_SHOCK_CONE_MAN", 1, 3054, 3053, 754, "COMMON Engine-Fuel Control", "Pilot Shock-Cone Manual Control Switch")
defineSpringloaded_2PosTumb("P_EFC_SHOCK_CONE", 1, 3055, 3056, 755, "COMMON Engine-Fuel Control", "Pilot Shock-Cone Pushbutton")
defineToggleSwitch("P_EFC_FIRE_FUEL_DIP", 1, 3057, 591, "COMMON Engine-Fuel Control", "Pilot Firing Fuel Dipper Switch")
defineToggleSwitch("P_EFC_FEEDER_SEL", 1, 3062, 1144, "COMMON Engine-Fuel Control", "Pilot Feeder Tank/Fuselage Selector Switch")
definePushButton("P_EFC_FUEL_G_TEST", 1, 3063, 1145, "COMMON Engine-Fuel Control", "Pilot Fuel Gauge Test Button")

--Jettison Panel
defineToggleSwitch("P_JETT_EMERG_CVR", 1, 3064, 966, "COMMON Jettison Panel", "Pilot Emergency Jettison Button Guard")
definePushButton("P_JETT_EMERG", 1, 3065, 967, "COMMON Jettison Panel", "Pilot Emergency Jettison Button")
defineToggleSwitch("P_JETT_SEL_CVR", 1, 3066, 968, "COMMON Jettison Panel", "Pilot Selective Jettison Button Guard")
definePushButton("P_JETT_SEL", 1, 3067, 969, "COMMON Jettison Panel", "Pilot Selective Jettison Button")
define3PosTumb("P_JETT_SEL_SW", 1, 3068, 970, "COMMON Jettison Panel", "Pilot Jettison Selector Switch")

--Fuel Transfer, Refuelling and Indication
defineRotary("P_FS_QUANT_RES", 1, 3069, 1150, "COMMON Fuel System", "Pilot Fuel Quantity Reset Thumbwheel")
defineToggleSwitch("P_FS_CROSSFEED", 1, 3070, 1151, "COMMON Fuel System", "Pilot Crossfeed Switch")
defineToggleSwitch("P_FS_EMERG_TRANS", 1, 3071, 1152, "COMMON Fuel System", "Pilot Emergency Transfer Switch")
defineToggleSwitch("P_FS_TRANS_SEQ_SEL", 1, 3072, 1153, "COMMON Fuel System", "Pilot Fuel Transfer Sequence Selector Switch")
definePushButton("P_FS_TRANS_IND_TEST", 1, 3073, 1166, "COMMON Fuel System", "Pilot Fuel Transfer Indicator Test")

defineIndicatorLight("P_FS_TRANS_L4_L", 1154, "COMMON Fuel System Lights", "Pilot Fuel Transfer Left 4 Light (red)")
defineIndicatorLight("P_FS_TRANS_2_L", 1155, "COMMON Fuel System Lights", "Pilot Fuel Transfer 2 Light (red)")
defineIndicatorLight("P_FS_TRANS_R4_L", 1156, "COMMON Fuel System Lights", "Pilot Fuel Transfer Right 4 Light (red)")
defineIndicatorLight("P_FS_TRANS_LT_L", 1157, "COMMON Fuel System Lights", "Pilot Fuel Transfer Left Tank Light (red)")
defineIndicatorLight("P_FS_TRANS_RT_L", 1158, "COMMON Fuel System Lights", "Pilot Fuel Transfer Right Tank Light (red)")
defineIndicatorLight("P_FS_TRANS_L1_L", 1159, "COMMON Fuel System Lights", "Pilot Fuel Transfer Left 1 Light (red)")
defineIndicatorLight("P_FS_TRANS_C_L", 1160, "COMMON Fuel System Lights", "Pilot Fuel Transfer Center Light (red)")
defineIndicatorLight("P_FS_TRANS_R1_L", 1161, "COMMON Fuel System Lights", "Pilot Fuel Transfer Right 1 Light (red)")
defineIndicatorLight("P_FS_TRANS_L3_L", 1162, "COMMON Fuel System Lights", "Pilot Fuel Transfer Left 3 Light (red)")
defineIndicatorLight("P_FS_TRANS_R3_L", 1163, "COMMON Fuel System Lights", "Pilot Fuel Transfer Right 3 Light (red)")
defineIndicatorLight("P_FS_TRANS_L5_L", 1164, "COMMON Fuel System Lights", "Pilot Fuel Transfer Left 5 Light (red)")
defineIndicatorLight("P_FS_TRANS_R5_L", 1165, "COMMON Fuel System Lights", "Pilot Fuel Transfer Right 5 Light (red)")

defineFloat("P_FS_FUEL_G_G", 1142, {0, 1}, "COMMON Fuel System Gauges", "Pilot Dual Fuel Gauge G Needle")
defineFloat("P_FS_FUEL_D_G", 1143, {0, 1}, "COMMON Fuel System Gauges", "Pilot Dual Fuel Gauge D Needle")
defineFloat("P_FS_FUEL_REMAIN_1000_G", 1146, {0, 1}, "COMMON Fuel System Gauges", "Pilot Fuel Remaining Drum 1000")
defineFloat("P_FS_FUEL_REMAIN_100_G", 1147, {0, 1}, "COMMON Fuel System Gauges", "Pilot Fuel Remaining Drum 100")
defineFloat("P_FS_FUEL_REMAIN_10_G", 1148, {0, 1}, "COMMON Fuel System Gauges", "Pilot Fuel Remaining Drum 10")
defineFloat("P_FS_FUEL_REMAIN_1_G", 1149, {0, 1}, "COMMON Fuel System Gauges", "Pilot Fuel Remaining Drum 1")

--Radar Control Stick
definePushButton("P_RCS_ALT_DIFF", 1, 3078, 259, "COMMON Radar Control Stick", "Pilot Radar Control Stick Elevation/Altitude Difference Button")
defineMultipositionSwitch("P_RCS_SCALE_SEL", 1, 3079, 258, 4, 1/3, "COMMON Radar Control Stick", "Pilot Radar Control Stick Scale Selection")
defineMultipositionSwitch("P_RCS_SCAN_SEL", 1, 3081, 257, 3, 0.5, "COMMON Radar Control Stick", "Pilot Radar Control Stick Scan Selection")

--High-Lift Devices
defineMultipositionSwitch("P_HLD_FLAP_SLAT", 1, 3105, 248, 3, 0.5, "COMMON High-Lift Devices", "Pilot Slat/Flap Lever")
define3PosTumb("P_HLD_SEL", 1, 3106, 399, "COMMON High-Lift Devices", "Pilot High-Lift Devices Selector Switch")

defineIndicatorLight("P_L_SLAT_G_L", 1083, "COMMON High-Lift Devices Lights", "Pilot Green Slats Light (green)")
defineIndicatorLight("P_L_SLAT_Y_L", 1084, "COMMON High-Lift Devices Lights", "Pilot Yellow Slats Light (yellow)")
defineIndicatorLight("P_L_SLAT_R_L", 1085, "COMMON High-Lift Devices Lights", "Pilot Red Slats Light (red)")
defineIndicatorLight("P_L_FLAP_R_L", 1086, "COMMON High-Lift Devices Lights", "Pilot Red Flaps Light (red)")
defineIndicatorLight("P_L_FLAP_Y_L", 1087, "COMMON High-Lift Devices Lights", "Pilot Yellow Flaps Light (yellow)")
defineIndicatorLight("P_L_FLAP_G_L", 1088, "COMMON High-Lift Devices Lights", "Pilot Green Flaps Light (green)")
defineIndicatorLight("P_L_FREIN_L", 1089, "COMMON High-Lift Devices Lights", "Pilot FREIN Light (yellow)")

--Radio selector unit
definePotentiometer("P_RADIO_MISS", 1, 3107, 306, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio MISS Potentiometer")
definePotentiometer("P_RADIO_TAC", 1, 3109, 307, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio TAC Potentiometer")
definePotentiometer("P_RADIO_VOR", 1, 3111, 308, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio VOR Potentiometer")
defineToggleSwitch("P_RADIO_AMPLI", 1, 3113, 309, "COMMON Radio Selector Unit", "Pilot Radio AMPLI 2-1 Selector Switch")
definePushButton("P_RADIO_U_V_BTN", 1, 3114, 310, "COMMON Radio Selector Unit", "Pilot Radio U+V Knob (Push)")
definePotentiometer("P_RADIO_U_V_KNB", 1, 3115, 311, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio U+V Knob (Turn)")
definePushButton("P_RADIO_U_BTN", 1, 3117, 313, "COMMON Radio Selector Unit", "Pilot Radio U Knob (Push)")
definePotentiometer("P_RADIO_U_KNB", 1, 3118, 314, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio U Knob (Turn)")
definePushButton("P_RADIO_RAP_CME_BTN", 1, 3120, 316, "COMMON Radio Selector Unit", "Pilot Radio RAP+CME Knob (Push)")
definePotentiometer("P_RADIO_RAP_CME_KNB", 1, 3121, 317, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio RAP+CME Knob (Turn)")
definePushButton("P_RADIO_MKR_TP_BTN", 1, 3123, 319, "COMMON Radio Selector Unit", "Pilot Radio MKR+TP Knob (Push)")
definePotentiometer("P_RADIO_MKR_TP_KNB", 1, 3124, 320, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio MKR+TP Knob (Turn)")

defineIndicatorLight("P_RADIO_U_V_L", 312, "COMMON Radio Selector Unit Lights", "Pilot Radio U+V Light (green)")
defineIndicatorLight("P_RADIO_U_L", 315, "COMMON Radio Selector Unit Lights", "Pilot Radio U Light (red)")
defineIndicatorLight("P_RADIO_RAP_CME_L", 318, "COMMON Radio Selector Unit Lights", "Pilot Radio RAP+CME Light (yellow)")
defineIndicatorLight("P_RADIO_MKR_TP_L", 321, "COMMON Radio Selector Unit Lights", "Pilot Radio MKR+TP Light (yellow)")

--V/UHF radio control unit (TRT - TRAP 136)
define3PosTumb("P_VUHF_TEST", 1, 3130, 272, "COMMON V/UHF Control Unit", "Pilot V/UHF Test Selector Switch")
defineToggleSwitch("P_VUHF_SIL", 1, 3131, 273, "COMMON V/UHF Control Unit", "Pilot V/UHF SIL Switch")
defineSetCommandTumb("P_VUHF_FREQ_100", 1, 3132, 274, 0.1, {0, 0.3}, {"1", "2", "3"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 100")
defineSetCommandTumb("P_VUHF_FREQ_10", 1, 3134, 275, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 10")
defineSetCommandTumb("P_VUHF_FREQ_1", 1, 3136, 276, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 1")
defineSetCommandTumb("P_VUHF_FREQ_01", 1, 3138, 277, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 0.1")
defineSetCommandTumb("P_VUHF_FREQ_0025", 1, 3140, 278, 0.333, {0, 1}, {"00", "25", "50", "75"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 0.025")
defineSetCommandTumb("P_VUHF_FUNC_SEL", 1, 3142, 280, 0.2, {0, 0.8}, nil, true, "COMMON V/UHF Control Unit", "Pilot V/UHF Function Selector")
defineToggleSwitch("P_VUHF_25_5_SW", 1, 3145, 281, "COMMON V/UHF Control Unit", "Pilot V/UHF 25W - 5W Switch")
defineMultipositionSwitch("P_VUHF_FREQ_SEL", 1, 3146, 282, 3, 0.5, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Selector Switch")
defineRadioWheel("P_VUHF_CHAN", 1, 3148, 3148, {-0.05, 0.05}, 283, 0.05, {0, 1}, {" 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", " 1", " 2", " 3", " 4", " 5"}, "COMMON V/UHF Control Unit", "Pilot V/UHF Channel Selector")

defineIndicatorLight("P_VUHF_TEST_L", 271, "COMMON V/UHF Control Unit Lights", "Pilot V/UHF Test Light (red)")

--Engine Emergency Regulation
definePushButton("P_EER_REG_L_BTN", 1, 3152, 354, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Light Knob (Push)")
definePotentiometer("P_EER_REG_L_KNB", 1, 3153, 355, {0, 1}, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Light Knob (Turn)")
defineToggleSwitch("P_EER_SW_CVR", 1, 3154, 357, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Switch Guard")
defineToggleSwitch("P_EER_SW", 1, 3155, 358, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Switch")
defineSpringloaded_3PosTumb("P_EER_CONTROL", 1, 3157, 3156, 359, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Control Lever")
defineToggleSwitch("P_EER_BRAKE_CHUTE", 1, 3160, 54, "COMMON Engine Emergency Regulation", "Pilot Brake Chute Control")

defineIndicatorLight("P_EER_REG_L", 356, "COMMON Engine Emergency Regulation Light", "Pilot Emergency Regulation Light (red)")

--Canopy controls
defineToggleSwitch("P_CANOPY_LOCK", 1, 3161, 55, "COMMON Canopy", "Pilot Canopy Lock Control")
definePushButton("P_CANOPY_EMBRITTLE", 1, 3162, 56, "COMMON Canopy", "Pilot Canopy Embrittle Control")
defineToggleSwitch("P_CANOPY_HINGE", 1, 3163, 3, "COMMON Canopy", "Pilot Canopy Hinged Handle")
defineToggleSwitch("P_CANOPY_SEAL", 1, 3164, 233, "COMMON Canopy", "Pilot Canopy Seal Valve Control Lever")
defineToggleSwitch("P_CANOPY_R_MIRRORS", 1, 3165, 2, "COMMON Canopy", "Pilot Hide Right Mirrors")
defineToggleSwitch("P_CANOPY_L_MIRRORS", 1, 3167, 2, "COMMON Canopy", "Pilot Hide Left Mirrors")
defineToggleSwitch("P_CANOPY_R_OPEN", 1, 3170, 1, "COMMON Canopy", "Pilot Right Canopy Open/Close")
defineToggleSwitch("P_CANOPY_L_OPEN", 1, 3171, 1, "COMMON Canopy", "Pilot Left Canopy Open/Close")

defineFloat("CANOPY_POS", 1, {0, 1}, "COMMON Canopy Gauges", "Canopy Position")

--Undercarriage, nose wheel steering, brake and anti-skid
defineToggleSwitch("P_U_SAFE_LVR", 1, 3175, 85, "COMMON Undercarriage NWS Brake", "Pilot U/C Safety Lever")
defineToggleSwitch("P_U_CONTROL_LVR", 1, 3176, 86, "COMMON Undercarriage NWS Brake", "Pilot U/C Control Lever")
definePushButton("P_U_ANTI_RETRAC_OVER", 1, 3177, 87, "COMMON Undercarriage NWS Brake", "Pilot Anti-Retraction Override Button")
defineToggleSwitch("P_U_PARK_EMERG_BRAKE", 1, 3178, 84, "COMMON Undercarriage NWS Brake", "Pilot Emergency/Parking Brake Handle")
defineToggleSwitch("P_U_ANTI_SKID_CVR", 1, 3179, 402, "COMMON Undercarriage NWS Brake", "Pilot Anti-Skid (SPAD) Switch Guard")
defineToggleSwitch("P_U_ANTI_SKID", 1, 3180, 403, "COMMON Undercarriage NWS Brake", "Pilot Anti-Skid (SPAD) Switch")
defineSpringloaded_2PosTumb("P_U_NWS_SENSI", 1, 3181, 3182, 756, "COMMON Undercarriage NWS Brake", "Pilot Nose Wheel Steering High Sensitivity Button")
defineToggleSwitch("P_U_NWS_STEER_CVR", 1, 3183, 757, "COMMON Undercarriage NWS Brake", "Pilot Nose Wheel Steering Switch Guard")
defineToggleSwitch("P_U_NWS_STEER", 1, 3184, 758, "COMMON Undercarriage NWS Brake", "Pilot Nose Wheel Steering Switch")
defineMultipositionSwitch("P_U_EMERG_UC", 1, 3185, 107, 3, 0.5, "COMMON Undercarriage NWS Brake", "Pilot Emergency U/C Handle")

--Hydraulic System Controls
defineToggleSwitch("P_HSC_PRESS_SEL", 1, 3186, 88, "COMMON Hydraulic System Controls", "Pilot Hydraulic Pressure Selector Switch")
defineToggleSwitch("P_HSC_EL_PUMP", 1, 3187, 475, "COMMON Hydraulic System Controls", "Pilot Electro-Pump Switch")

defineFloat("P_HSC_L_PRESS_G", 721, {0, 1}, "COMMON Clock Gauges", "Pilot Left Hydraulic Pressure Gauge")
defineFloat("P_HSC_R_PRESS_G", 722, {0, 1}, "COMMON Clock Gauges", "Pilot Right Hydraulic Pressure Gauge")

--Clock
definePushButton("P_CLOCK_SET_KNB", 1, 3192, 232, "COMMON Clock", "Pilot Chronometer Starting Control and Clock Setting Knob")
defineRotary("P_CLOCK_WIND_KNB", 1, 3193, 67, "COMMON Clock", "Pilot Chronometer Starting Control and Clock Winding Knob")
defineToggleSwitch("P_CLOCK_WIND_LVR", 1, 3195, 231, "COMMON Clock", "Pilot Clock Winding/Setting Lever")

defineFloat("P_CLOCK_NEEDLE_M_G", 63, {0, 1}, "COMMON Clock Gauges", "Pilot Clock Minutes Needle")
defineFloat("P_CLOCK_NEEDLE_S_G", 62, {0, 1}, "COMMON Clock Gauges", "Pilot Clock Seconds Needle")
defineFloat("P_CLOCK_NEEDLE_H_G", 64, {0, 1}, "COMMON Clock Gauges", "Pilot Clock Hour Needle")
defineFloat("P_CLOCK_NEEDLE_C_G", 65, {0, 1}, "COMMON Clock Gauges", "Pilot Clock Counter Needle")

--Air Data Instrument Controls
definePotentiometer("P_ADI_SPEED_KNB", 1, 3200, 1270, {0, 1}, "COMMON Air Data Instrument Controls", "Pilot Mach/Airspeed Indicator Reference Airspeed Knob")
defineRotary("P_ADI_ALT_BARO_SLAVE", 1, 3202, 1053, "COMMON Air Data Instrument Controls", "Pilot Slaved Altimeter Barometric Pressure Setting Knob")
defineRotary("P_ADI_ALT_BARO_STBY", 1, 3204, 1072, "COMMON Air Data Instrument Controls", "Pilot Standby Altimeter Barometric Pressure Setting Knob")
defineToggleSwitch("P_ADI_PROBE_HEAT", 1, 3206, 477, "COMMON Air Data Instrument Controls", "Pilot Probe Heater Switch")

defineFloat("P_ADI_ALT_SL_NEEDLE_G", 1043, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Needle")
defineFloat("P_ADI_ALT_SL_FLAG_G", 1044, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Flag")
defineFloat("P_ADI_ALT_SL_T_DRUM_100_G", 1045, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Top Drum 100")
defineFloat("P_ADI_ALT_SL_T_DRUM_10_G", 1046, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Top Drum 10")
defineFloat("P_ADI_ALT_SL_T_DRUM_1_G", 1047, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Top Drum 1")
defineFloat("P_ADI_ALT_SL_T_DRUM_0.1_G", 1048, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Top Drum 0.1")
defineFloat("P_ADI_ALT_SL_L_DRUM_1000_G", 1049, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Lower Drum 1000")
defineFloat("P_ADI_ALT_SL_L_DRUM_100_G", 1050, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Lower Drum 100")
defineFloat("P_ADI_ALT_SL_L_DRUM_10_G", 1051, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Lower Drum 10")
defineFloat("P_ADI_ALT_SL_L_DRUM_1_G", 1052, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Slaved Altimeter Lower Drum 1")
defineFloat("P_ADI_ALT_STBY_S_NEEDLE_G", 1065, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Small Needle")
defineFloat("P_ADI_ALT_STBY_B_NEEDLE_G", 1066, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Big Needle")
defineFloat("P_ADI_ALT_STBY_A_NEEDLE_G", 1067, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Arrow Needle")
defineFloat("P_ADI_ALT_STBY_DRUM_1000_G", 1068, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Lower Drum 1000")
defineFloat("P_ADI_ALT_STBY_DRUM_100_G", 1069, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Lower Drum 100")
defineFloat("P_ADI_ALT_STBY_DRUM_10_G", 1070, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Lower Drum 10")
defineFloat("P_ADI_ALT_STBY_DRUM_1_G", 1071, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Standby Altimeter Lower Drum 1")
defineFloat("P_ADI_VERT_SPEED_G", 1025, {-1, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Vertical Speed Indicator")
defineFloat("P_ADI_SPEED_G", 1023, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Speed Indicator")
defineFloat("P_ADI_SPEED_I", 1070, {0, 1}, "COMMON Air Data Instrument Controls Gauges", "Pilot Speed Index Arrow")

--Heading and vertical reference system and standby horizon controls
defineToggleSwitch("P_FRS_STBY_HORIZON", 1, 3209, 474, "COMMON Flight Ref System", "Pilot Standby Horizon Switch")
definePotentiometer("P_FRS_SPHER_IND_DN", 1, 3210, 1116, {0, 1}, "COMMON Flight Ref System", "Pilot Spherical Indicator Day/Night Selector Switch")
definePushButton("P_FRS_SPHER_IND_MB_BTN", 1, 3211, 202, "COMMON Flight Ref System", "Pilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Push)")
definePotentiometer("P_FRS_SPHER_IND_MB_KNB", 1, 3212, 1117, {0, 1}, "COMMON Flight Ref System", "Pilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Turn)")
definePushButton("P_FRS_STBY_HORIZON_UNCAGE_BTN", 1, 3213, 1132, "COMMON Flight Ref System", "Pilot Standby Horizon Uncage and Aircraft Model Control (Push)")
definePotentiometer("P_FRS_STBY_HORIZON_UNCAGE_KNB", 1, 3214, 1133, {0, 1}, "COMMON Flight Ref System", "Pilot Standby Horizon Uncage and Aircraft Model Control (Turn)")
defineMultipositionSwitch("P_FRS_HDG_REF_SYS", 1, 3217, 537, 4, 0.3333, "COMMON Flight Ref System", "Pilot Heading and Vertical Reference System Control Switch")
defineToggleSwitch("P_FRS_EMERG_GYRO", 1, 3219, 538, "COMMON Flight Ref System", "Pilot Emergency Gyromagnetic Compass Switch")
definePushButton("P_FRS_HDG_EREC", 1, 3220, 540, "COMMON Flight Ref System", "Pilot Heading Control Unit Erection Button")

defineIndicatorLight("P_FRS_SPHER_IND_DN_L", 1279, "COMMON Flight Ref System Lights", "Pilot Spherical Indicator Day/Night Light (yellow)")

defineFloat("P_FRS_COMP_HDG_G", 76, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Compass Gauge Heading")
defineFloat("P_FRS_COMP_PITCH_G", 77, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Compass Gauge Pitch")
defineFloat("P_FRS_COMP_BANK_G", 78, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Compass Gauge Bank")
defineFloat("P_FRS_HDG_DEVI_G", 539, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Heading Deviation Needle")
defineFloat("P_FRS_SPHER_IND_ILS_H_G", 1108, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Spherical Indicator ILS Horizontal Indicator")
defineFloat("P_FRS_SPHER_IND_ILS_V_G", 1109, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Spherical Indicator ILS Vertical Indicator")
defineFloat("P_FRS_SPHER_IND_PITCH_G", 1110, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Spherical Indicator Pitch")
defineFloat("P_FRS_SPHER_IND_BANK_G", 1111, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Spherical Indicator Bank")
defineFloat("P_FRS_SPHER_IND_HDG_G", 1112, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Spherical Indicator Heading")
defineFloat("P_FRS_SLIP_IND_G", 1113, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Slip Indicator")
defineFloat("P_FRS_SPHER_IND_FLAG_G", 1115, {0, 1}, "COMMON Flight Ref System Gauges", "Pilot Spherical Indicator Flag")
defineFloat("P_FRS_STBY_HORIZON_BANK_G", 1128, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Standby Horizon Gauge Bank")
defineFloat("P_FRS_STBY_HORIZON_R_I_G", 1129, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Standby Horizon Roll Indicator")
defineFloat("P_FRS_STBY_HORIZON_H_I_G", 1130, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Standby Horizon Horizontal Indicator")
defineFloat("P_FRS_STBY_HORIZON_FLAG_G", 1131, {0, 1}, "COMMON Flight Ref System Gauges", "Pilot Standby Horizon Flag")
defineFloat("P_FRS_STBY_HORIZON_PITCH_G", 1134, {-1, 1}, "COMMON Flight Ref System Gauges", "Pilot Standby Horizon Gauge Pitch")

--Electrical System Controls
defineToggleSwitch("P_EL_BATT", 1, 3223, 113, "COMMON Electrical System Controls", "Pilot Battery Switch")
defineToggleSwitch("P_EL_GEN1", 1, 3224, 114, "COMMON Electrical System Controls", "Pilot Alternator 1 Switch")
defineToggleSwitch("P_EL_GEN2", 1, 3225, 115, "COMMON Electrical System Controls", "Pilot Alternator 2 Switch")
definePushButton("P_EL_TR_RESET", 1, 3226, 116, "COMMON Electrical System Controls", "Pilot TR Reset Button")
defineSpringloaded_3PosTumb("P_EL_INVERT_SEL", 1, 3228, 3227, 117, "COMMON Electrical System Controls", "Pilot Inverter Selector Switch")

--Warning Light Switches
definePushButton("P_WL_M_FAIL_L", 1, 3231, 920, "EE Warning Switches", "Pilot Left Master Failure Warning Light Button")
definePushButton("P_WL_C_FLAP_BTN", 1, 3232, 956, "COMMON Warning Switches", "Pilot Combat Flaps Light Button (Push)")
definePotentiometer("P_WL_C_FLAP_KNB", 1, 3233, 957, {0, 1}, "COMMON Warning Switches", "Pilot Combat Flaps Light Knob (Turn)")
definePushButton("P_WL_UC_BTN", 1, 3235, 928, "COMMON Warning Switches", "Pilot U/C Light Button")
definePushButton("P_WL_NWS_BTN", 1, 3270, 950, "COMMON Warning Switches", "Pilot Nose Wheel Steering Light Button (Push)")
definePotentiometer("P_WL_NWS_KNB", 1, 3237, 951, {0, 1}, "COMMON Warning Switches", "Pilot Nose Wheel Steering Light Knob (Turn)")
definePushButton("P_WL_AIR_B_BTN", 1, 3239, 944, "COMMON Warning Switches", "Pilot Airbrake Light Button (Push)")
definePotentiometer("P_WL_AIR_B_KNB", 1, 3240, 945, {0, 1}, "COMMON Warning Switches", "Pilot Airbrake Light Knob (Turn)")
definePushButton("P_WL_LIMIT_WARN", 1, 3242, 932, "COMMON Warning Switches", "Pilot Limit Warning Light Button")
definePushButton("P_WL_AB_FIRE_WARN", 1, 3243, 940, "EE Warning Switches", "Pilot Fire Warning Light AB Button")
definePushButton("P_WL_AB_INJ", 1, 3244, 1029, "COMMON Warning Switches", "Pilot A/B INJ Light Button")
definePushButton("P_WL_AB_ON", 1, 3245, 1031, "COMMON Warning Switches", "Pilot A/B ON Light Button")
definePushButton("P_WL_AB_SRL", 1, 3246, 1033, "COMMON Warning Switches", "Pilot A/B SRL Light Button")
definePushButton("P_WL_STBY_RECEPT_BTN", 1, 3247, 92, "COMMON Warning Switches", "Pilot Standby Receptacle Light Button (Push)")
definePotentiometer("P_WL_STBY_RECEPT_KNB", 1, 3248, 93, {0, 1}, "COMMON Warning Switches", "Pilot Standby Receptacle Light Knob (Turn)")
definePushButton("P_WL_BIP", 1, 3266, 1081, "COMMON Warning Switches", "Pilot BIP Button")
definePushButton("P_WL_CONFIG_TEST", 1, 3250, 1082, "COMMON Warning Switches", "Pilot Configuration Indicator Test Button")
definePushButton("P_WL_FAIL_T_TEST", 1, 3251, 118, "COMMON Warning Switches", "Pilot Failure Warning Panel T Test Button")
definePushButton("P_WL_FAIL_O2_TEST", 1, 3252, 119, "COMMON Warning Switches", "Pilot Failure Warning Panel O2 Test Button")
defineToggleSwitch("P_WL_WARN_HORN", 1, 3253, 476, "COMMON Warning Switches", "Pilot Warning Horn Switch")
definePushButton("P_CE_WL_JAMMER_BTN", 1, 3257, 194, "CE/BE Warning Switches", "CE/BE Pilot Jammer Detection / Feeder Tanks Overflow Light Button (Push)")
definePotentiometer("P_CE_WL_JAMMER_KNB", 1, 3258, 195, {0, 1}, "CE/BE Warning Switches", "CE/BE Pilot Jammer Detection / Feeder Tanks Overflow Light Knob (Turn)")
definePushButton("P_WL_R_LIGHT_BTN", 1, 3260, 197, "COMMON Warning Switches", "Pilot (C + M or SW) R Light Button (Push)")
definePotentiometer("P_WL_R_LIGHT_KNB", 1, 3261, 198, {0, 1}, "COMMON Warning Switches", "Pilot (C + M or SW) R Light Knob (Turn)")
definePushButton("P_WL_CAN_HOT_BTN", 1, 3263, 108, "COMMON Warning Switches", "Pilot Cannons too Hot Light Button (Push)")
definePotentiometer("P_WL_CAN_HOT_KNB", 1, 3264, 109, {0, 1}, "COMMON Warning Switches", "Pilot Cannons too Hot Light Knob (Turn)")

defineIndicatorLight("P_WL_M_FAIL_L_L", 921, "COMMON Warning Switches Lights", "Pilot Master Failure PANNE Light Left (red)")
defineIndicatorLight("P_WL_M_FAIL_R_L", 923, "COMMON Warning Switches Lights", "Pilot Master Failure PANNE Light Right (yellow)")
defineIndicatorLight("P_WL_C_FLAP_L", 958, "COMMON Warning Switches Lights", "Pilot Combat Flaps Light (yellow)")
defineIndicatorLight("P_WL_UC_BTN_L", 929, "COMMON Warning Switches Lights", "Pilot U/C TRAIN Light (red)")
defineIndicatorLight("P_WL_NWS_L", 952, "COMMON Warning Switches Lights", "Pilot Nose Wheel Steering Light (yellow)")
defineIndicatorLight("P_WL_AIR_B_L", 946, "COMMON Warning Switches Lights", "Pilot Nose Wheel Steering Light (yellow)")
defineIndicatorLight("P_WL_LIMIT_WARN_L", 933, "COMMON Warning Switches Lights", "Pilot Limit Warning Light (red)")
defineIndicatorLight("P_WL_FIRE_WARN_U_L", 937, "COMMON Warning Switches Lights", "Pilot Fire Warning REAC Light UP (red)")
defineIndicatorLight("P_WL_FIRE_WARN_D_L", 941, "COMMON Warning Switches Lights", "Pilot Fire Warning P/C Light DN (red)")
defineIndicatorLight("P_WL_AB_INJ_L", 1030, "COMMON Warning Switches Lights", "Pilot A/B INJ Light (red)")
defineIndicatorLight("P_WL_AB_ON_L", 1032, "COMMON Warning Switches Lights", "Pilot A/B FON Light (green)")
defineIndicatorLight("P_WL_AB_SRL_L", 1034, "COMMON Warning Switches Lights", "Pilot A/B ADF Light (yellow)")
defineIndicatorLight("P_WL_STBY_RECEPT_L", 99, "COMMON Warning Switches Lights", "Pilot Standby Receptacle Light (red)")
defineIndicatorLight("P_WL_JAMMER_L", 196, "COMMON Warning Switches Lights", "Pilot Jammer Detection Light (yellow)")
defineIndicatorLight("P_WL_R_L", 199, "COMMON Warning Switches Lights", "Pilot (C + M or SW) R Light (green)")
defineIndicatorLight("P_WL_CAN_HOT_L", 110, "COMMON Warning Switches Lights", "Pilot Cannons too Hot Light (red)")

--Exterior lighting
defineMultipositionSwitch("P_EXL_LAND_CTRL", 1, 3271, 353, 3, 0.5, "COMMON Exterior Lighting", "Pilot Landing Light Control")
defineMultipositionSwitch("P_EXL_FORM_CTRL", 1, 3272, 112, 3, 0.5, "COMMON Exterior Lighting", "Pilot Formation Light Control")
defineMultipositionSwitch("P_EXL_NAV_CTRL", 1, 3273, 111, 3, 0.5, "COMMON Exterior Lighting", "Pilot Navigation Light Control")
defineToggleSwitch("P_EXL_SEARCH_CTRL", 1, 3274, 479, "COMMON Exterior Lighting", "Pilot Search Light Control")

--Cabin lighting
defineToggleSwitch("P_CL_MISC_L_SW", 1, 3275, 470, "COMMON Cabin Lighting", "Pilot Miscellaneous Instrument Lighting Switch")
definePotentiometer("P_CL_MAP_BRT_KNB", 1, 3276, 66, {0, 1}, "COMMON Cabin Lighting", "Pilot Map Lighting")
definePotentiometer("P_CL_MISC_BRT_KNB", 1, 3278, 68, {0, 1}, "COMMON Cabin Lighting", "Pilot Miscellaneous Instrument Integral Lighting")

--Lighting Control Unit
defineToggleSwitch("P_IL_D_N_SEL", 1, 3280, 382, "COMMON Lighting Control Unit", "Pilot Day/Night Selector Switch")
definePotentiometer("P_IL_LIGHT_BRT_KNB", 1, 3081, 383, {0, 1}, "COMMON Lighting Control Unit", "Pilot Light and Panel Lighting")
definePotentiometer("P_IL_UV_BRT_KNB", 1, 3283, 384, {0, 1}, "COMMON Lighting Control Unit", "Pilot Ultraviolet Lighting")
definePotentiometer("P_IL_INST_BRT_FLOOD_KNB", 1, 3285, 385, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Instrument Panel Lighting (Flood)")
definePotentiometer("P_IL_INST_BRT_INTEG_KNB", 1, 3287, 386, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Instrument Panel Lighting (Integral)")
definePotentiometer("P_IL_CON_BRT_FLOOD_KNB", 1, 3289, 387, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Console and Pedestal Lighting (Flood)")
definePotentiometer("P_IL_CON_BRT_INTEG_KNB", 1, 3291, 388, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Console and Pedestal Lighting (Integral)")
definePotentiometer("P_IL_INCIDENCE_BRT_KNB", 1, 3196, 201, {0, 1}, "COMMON Lighting Control Unit", "Pilot Incidence Indicator Lighting")

defineFloat("P_IL_CKP_RAIL_T_L", 1291, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Cockpit Top Rail Lamps (white)")
defineFloat("P_IL_INCIDENCE_L", 1292, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Incidence Indicator Lights (red)")
defineFloat("P_IL_CKP_RAIL_S_L", 1293, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Cockpit Side Rail Lamps (red)")
defineFloat("P_IL_UV_L", 1294, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Ultraviolet Lights (white)")
defineFloat("P_IL_MISC_INSTR_L", 1295, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Misc Instrument Lights (red)")
defineFloat("P_IL_INST_L", 1296, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Instrument Lights (red)")
defineFloat("P_IL_FLOOD_L", 1297, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Flood Lights (red)")
defineFloat("P_IL_CONSOLE_L", 1299, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Console Lights (red)")

defineFloat("P_IL_INCIDENCE_FLAG_G", 200, {0, 1}, "COMMON Lighting Control Unit Gauges", "Pilot Incidence Flag")
defineFloat("P_IL_INCIDENCE_IND_G", 203, {0, 1}, "COMMON Lighting Control Unit Gauges", "Pilot Incidence Indicator Bar")

--TACAN Control Box
definePushButton("P_TCN_TEST", 1, 3313, 480, "COMMON TACAN Control Box", "Pilot TACAN Test Button")
defineToggleSwitch("P_TCN_XY_MODE", 1, 3297, 485, "COMMON TACAN Control Box", "Pilot TACAN X/Y Mode Selector")
defineTumb("P_TCN_FREQ_10100", 1, 3298, 486, 1/13, {0, 0.997}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "0"}, false, "COMMON TACAN Control Box", "Pilot TACAN Frequency Selector 10/100")
defineMultipositionSwitch("P_TCN_MODE", 1, 3299, 487, 4, 0.3333, "COMMON TACAN Control Box", "Pilot TACAN Mode Selector")
defineRadioWheel("P_TCN_FREQ_1", 1, 3339, 3301, {-0.1, 0.1}, 488, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "COMMON TACAN Control Box", "Pilot TACAN Frequency Selector 1")

defineFloat("P_TCN_XY_G", 481, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN X/Y Gauge")
defineFloat("P_TCN_100_G", 482, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN 100 Gauge")
defineFloat("P_TCN_10_G", 483, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN 10 Gauge")
defineFloat("P_TCN_1_G", 484, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN 1 Gauge")

defineIndicatorLight("P_TCN_WARN_L", 1312, "COMMON TACAN Lights", "Pilot TACAN WARN Light (red)")
defineIndicatorLight("P_TCN_GO_L", 1313, "COMMON TACAN Lights", "Pilot TACAN GO Light (green)")

--VOR/ILS Control Box
defineToggleSwitch("P_VOR_PW_SW", 1, 3302, 503, "COMMON VOR ILS Control Box", "Pilot VOR-ILS Control Unit ON/OFF")
defineRadioWheel("P_VOR_FREQ_MHZ", 1, 3303, 3303, {-0.1, 0.1}, 504, 0.1, {0, 1}, nil, "COMMON VOR ILS Control Box", "Pilot VOR/ILS MHz Frequency Selector")
defineSpringloaded_3PosTumb("P_VOR_TEST", 1, 3305, 3304, 505, "COMMON VOR ILS Control Box", "Pilot VOR/ILS Test Selector")
defineRadioWheel("P_VOR_FREQ_KHZ", 1, 3306, 3306, {-0.1, 0.1}, 506, 0.1, {0, 1}, nil, "COMMON VOR ILS Control Box", "Pilot VOR/ILS kHz Frequency Selector")
definePotentiometer("P_VOR_OMNI_SEL", 1, 3307, 545, {0, 1}, "COMMON VOR ILS Control Box", "Pilot Omnibearing Selector")
defineMultipositionSwitch("P_VOR_MODE", 1, 3309, 544, 3, 0.5, "COMMON VOR ILS Control Box", "Pilot VOR/ILS/OFF/TACAN Selector")
defineRotary("P_VOR_HDG_SEL", 1, 3311, 547, "COMMON VOR ILS Control Box", "Pilot Heading Selector Knob")

defineFloat("P_VOR_100_G", 498, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot VOR/ILS 100 Gauge")
defineFloat("P_VOR_10_G", 499, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot VOR/ILS 10 Gauge")
defineFloat("P_VOR_1_G", 500, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot VOR/ILS 1 Gauge")
defineFloat("P_VOR_01_G", 501, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot VOR/ILS 0.1 Gauge")
defineFloat("P_VOR_001_G", 502, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot VOR/ILS 0.01 Gauge")
defineFloat("P_VOR_OMNI_100_G", 541, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot Omnibearing 100 Gauge")
defineFloat("P_VOR_OMNI_10_G", 542, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot Omnibearing 10 Gauge")
defineFloat("P_VOR_OMNI_1_G", 543, {0, 1}, "COMMON VOR ILS Control Box Gauges", "Pilot Omnibearing 1 Gauge")

--Oxygen System
definePushButton("P_OXY_TEST", 1, 3318, 517, "COMMON Oxygen System", "Pilot Oxygen Test (T Button)")
definePushButton("P_OXY_TEST_P", 1, 3319, 519, "COMMON Oxygen System", "Pilot Oxygen Test Button")
definePushButton("P_OXY_OVERPRESS", 1, 3321, 710, "COMMON Oxygen System", "Pilot Oxygen Overpressure Button")
defineMultipositionSwitch("P_OXY_N100_EMG", 1, 3320, 709, 3, 0.5, "COMMON Oxygen System", "Pilot N-100%-EMG Mode Selector Switch")
definePushButton("P_OXY_G_CON_CVR", 1, 3322, 712, "COMMON Oxygen System", "Pilot Anti-G Connection Cover")
definePushButton("P_OXY_G_TEST", 1, 3323, 713, "COMMON Oxygen System", "Pilot Anti-G Test Button")
defineToggleSwitch("P_OXY_G_VALVE", 1, 3324, 714, "COMMON Oxygen System", "Pilot Anti-G Valve Cock")

defineFloat("P_OXY_QUANT_G", 516, {-1, 1}, "COMMON Oxygen System Gauges", "Pilot Oxygen Quantity Needle")
defineFloat("P_OXY_SEL_POS_G", 518, {-1, 1}, "COMMON Oxygen System Gauges", "Pilot Oxygen Selector Position Repeater")
defineFloat("P_OXY_BLINK_G", 719, {0, 1}, "COMMON Oxygen System Gauges", "Pilot Oxygen Blinker")

--Air Conditioning System
defineToggleSwitch("P_AC_EMERG_COLD", 1, 3327, 524, "COMMON Air Conditioning System", "Pilot Emergency Cold Switch")
defineToggleSwitch("P_AC_M_VALVE", 1, 3328, 525, "COMMON Air Conditioning System", "Pilot Master Valve Control Switch")
definePotentiometer("P_AC_TEMP", 1, 3329, 527, {0, 1}, "COMMON Air Conditioning System", "Pilot Temperature Control Rheostat")
defineToggleSwitch("P_AC_AUTO_MAN", 1, 3331, 529, "COMMON Air Conditioning System", "Pilot Auto/Manual Selector Switch")
defineSpringloaded_3PosTumb("P_AC_HOT_COLD", 1, 3333, 3332, 530, "COMMON Air Conditioning System", "Pilot Hot/Cold Selector Switch")
defineToggleSwitch("P_AC_RAM_AIR_CVR", 1, 3334, 410, "COMMON Air Conditioning System", "Pilot Ram Air Switch Guard")
defineToggleSwitch("P_AC_RAM_AIR", 1, 3335, 411, "COMMON Air Conditioning System", "Pilot Ram Air Switch")
defineToggleSwitch("P_AC_DEMIST", 1, 3336, 412, "COMMON Air Conditioning System", "Pilot Demist Switch")

defineFloat("P_AC_SOL_VALVE_G", 526, {0, 1}, "COMMON Oxygen System Gauges", "Pilot Solenoid Valve Position Indicator")
defineFloat("P_AC_TEMP_G", 528, {-1, 1}, "COMMON Oxygen System Gauges", "Pilot Temperatur Indicator")

--Circuit Breaker
defineToggleSwitch("P_CB_GYRO_CONTR", 1, 3340, 548, "COMMON Circuit Breaker", "Pilot CB Gyro Control Unit Power Supply")
defineToggleSwitch("P_CB_HLIFT_SERVO", 1, 3341, 550, "COMMON Circuit Breaker", "Pilot CB High-Lift Device Servo Unit Power Supply")
defineToggleSwitch("P_CB_IND_FAIL", 1, 3342, 552, "COMMON Circuit Breaker", "Pilot CB Indicator and Failure Detector Power Supply")
defineToggleSwitch("P_CB_INVERT_TRANS", 1, 3343, 554, "COMMON Circuit Breaker", "Pilot CB Inverter Transfer Unit Power Supply and Control")
defineToggleSwitch("P_CB_HYYD_PRESS_G", 1, 3344, 556, "COMMON Circuit Breaker", "Pilot CB Dual Hydraulic Pressure Gauge Power Supply")
defineToggleSwitch("P_CB_GUN_TRIG", 1, 3345, 558, "COMMON Circuit Breaker", "Pilot CB Gun firing Trigger Power Supply")
defineToggleSwitch("P_CB_LP_COCK", 1, 3346, 560, "COMMON Circuit Breaker", "Pilot CB LP Cock Power Supply")
defineToggleSwitch("P_CB_EL_PUMP", 1, 3347, 562, "COMMON Circuit Breaker", "Pilot CB Electro-Pump Relay Power Supply")
defineToggleSwitch("P_CB_REFUEL_SYS", 1, 3348, 564, "COMMON Circuit Breaker", "Pilot CB Flight Refuelling System Power Supply")
defineToggleSwitch("P_CB_CABIN_PRESS", 1, 3349, 566, "COMMON Circuit Breaker", "Pilot CB Cabin Pressurization System Power Supply")
defineToggleSwitch("P_CB_INVERT_28", 1, 3350, 568, "COMMON Circuit Breaker", "Pilot CB Inverter 28V Power Supply")
defineToggleSwitch("P_CB_UC_NORM", 1, 3351, 570, "COMMON Circuit Breaker", "Pilot CB U/C Normal Operation Power Supply")
defineToggleSwitch("P_CB_VUHF", 1, 3352, 572, "COMMON Circuit Breaker", "Pilot CB V/UHF Power Supply")
defineToggleSwitch("P_CB_START_SEQU", 1, 3353, 574, "COMMON Circuit Breaker", "Pilot CB Starter and Sequencing System Power Supply")
defineToggleSwitch("P_CB_REFUEL_PROBE", 1, 3354, 576, "COMMON Circuit Breaker", "Pilot CB Refuelling Probe Control Power Supply")
defineToggleSwitch("P_CB_TRIM_CONTRL", 1, 3355, 578, "COMMON Circuit Breaker", "Pilot CB Manual Trim Control Power Supply")
defineToggleSwitch("P_CB_GROUND_PW", 1, 3356, 580, "COMMON Circuit Breaker", "Pilot CB Valve Position Repeater, Control Valve and Ground Mode Power Supply")
defineToggleSwitch("P_CB_WARN_L", 1, 3357, 582, "COMMON Circuit Breaker", "Pilot CB Failure Warning Panel and Master Failure Warning Light Power Supply")
defineToggleSwitch("P_CB_UC_WARN_L", 1, 3358, 584, "COMMON Circuit Breaker", "Pilot CB Configuration Indicator (U/C section) and U/C Warning Light Power Supply")
defineToggleSwitch("P_CB_IFF", 1, 3359, 586, "COMMON Circuit Breaker", "Pilot CB IFF Power Supply")
defineToggleSwitch("P_CB_EMERG_REG", 1, 3360, 588, "COMMON Circuit Breaker", "Pilot CB Emergency Regulation System and Control Lever Power Supply")

--Ejection Seat
defineSpringloaded_3PosTumb("P_ES_SEAT_HEIGHT", 1, 3364, 3363, 11, "COMMON Ejection Seat", "Pilot Seat Height Adjustment Control")
definePushButton("P_ES_FIRE_HND_BLIND", 1, 3365, 13, "COMMON Ejection Seat", "Pilot Face Blind Firing Handle")
definePushButton("P_ES_FIRE_HND2_BLIND", 1, 3366, 13, "COMMON Ejection Seat", "Pilot Face Blind Firing Handle")
definePushButton("P_ES_FIRE_HND_ALT", 1, 3367, 14, "COMMON Ejection Seat", "Pilot Alternative Firing Handle")
definePushButton("P_ES_FIRE_HND_ALT1", 1, 3368, 14, "COMMON Ejection Seat", "Pilot Alternative Firing Handle")
definePushButton("P_ES_FIRE_HND_ALT2", 1, 3369, 14, "COMMON Ejection Seat", "Pilot Alternative Firing Handle")
definePotentiometer("P_ES_SAFE_PIN", 1, 3562, 1316, {0, 1}, "COMMON Ejection Seat", "Pilot Ejection Handle Safety Pin")

defineFloat("P_ES_SEAT_HEIGHT_G", 10, {0, 1}, "COMMON Ejection Seat Gauges ", "Pilot Seat Height")

--Chaff and flares dispenser ALE 40 control unit
defineMultipositionSwitch("P_C_CHAFF_FLARE_SEL", 1, 3370, 208, 3, 0.5, "COMMON Countermeassures", "Pilot Chaff/Flares Selector Switch")
defineMultipositionSwitch("P_C_PROG_SEL", 1, 3371, 209, 4, 0.3333, "COMMON Countermeassures", "Pilot Program Selector Switch")
definePushButton("P_C_COUNTRES_CHAFF", 1, 3373, 212, "COMMON Countermeassures", "Pilot Chaff Counter Reset Button")
definePushButton("P_C_COUNTRES_FLARE", 1, 3374, 215, "COMMON Countermeassures", "Pilot Flares Counter Reset Button")
defineToggleSwitch("P_C_EMERG_JETT", 1, 3375, 216, "COMMON Countermeassures", "Pilot Emergency Jettisoning Switch")
definePushButton("P_C_CHAFF_FLARE_REL", 1, 3377, 708, "COMMON Countermeassures", "Pilot Chaff/Flares Release Button")
defineToggleSwitch("P_C_RADAR_DETECOR", 1, 3376, 478, "COMMON Countermeassures", "Radar Detector Switch")

--Caution Light Panel
defineIndicatorLight("P_CLP_BATT_L", 120, "COMMON Caution Light Panel", "Pilot BATT Light (red)")
defineIndicatorLight("P_CLP_ALT1_L", 121, "COMMON Caution Light Panel", "Pilot ALT1 Light (yellow)")
defineIndicatorLight("P_CLP_ALT2_L", 122, "COMMON Caution Light Panel", "Pilot ALT2 Light (yellow)")
defineIndicatorLight("P_CLP_TR1_L", 123, "COMMON Caution Light Panel", "Pilot TR1 Light (yellow)")
defineIndicatorLight("P_CLP_SEC_L", 124, "COMMON Caution Light Panel", "Pilot SEC Light (yellow)")
defineIndicatorLight("P_CLP_BP_L", 125, "COMMON Caution Light Panel", "Pilot BP Light (red)")
defineIndicatorLight("P_CLP_BPG_L", 126, "COMMON Caution Light Panel", "Pilot BPG Light (yellow)")
defineIndicatorLight("P_CLP_BPD_L", 127, "COMMON Caution Light Panel", "Pilot BPD Light (yellow)")
defineIndicatorLight("P_CLP_TR2_L", 128, "COMMON Caution Light Panel", "Pilot TR2 Light (yellow)")
defineIndicatorLight("P_CLP_NIV_L", 129, "COMMON Caution Light Panel", "Pilot NIV Light (yellow)")
defineIndicatorLight("P_CLP_HUILE_L", 130, "COMMON Caution Light Panel", "Pilot HUILE Light (red)")
defineIndicatorLight("P_CLP_EP_L", 131, "COMMON Caution Light Panel", "Pilot EP Light (red)")
defineIndicatorLight("P_CLP_HYDS_L", 132, "COMMON Caution Light Panel", "Pilot HYD S Light (red)")
defineIndicatorLight("P_CLP_HYDR1_L", 133, "COMMON Caution Light Panel", "Pilot HYDR1 Light (yellow)")
defineIndicatorLight("P_CLP_HYDR2_L", 134, "COMMON Caution Light Panel", "Pilot HYDR2 Light (yellow)")
defineIndicatorLight("P_CLP_REGO2_L", 135, "COMMON Caution Light Panel", "Pilot REG O2 Light (red)")
defineIndicatorLight("P_CLP_5MNO2_L", 136, "COMMON Caution Light Panel", "Pilot 5mnO2 Light (yellow)")
defineIndicatorLight("P_CLP_TEQ_L", 137, "COMMON Caution Light Panel", "Pilot TEQ Light (yellow)")
defineIndicatorLight("P_CLP_TCAB_L", 138, "COMMON Caution Light Panel", "Pilot T CAB Light (red)")
defineIndicatorLight("P_CLP_PCAB_L", 139, "COMMON Caution Light Panel", "Pilot P CAB Light (red)")
defineIndicatorLight("P_CLP_TRIM_L", 140, "COMMON Caution Light Panel", "Pilot TRIM Light (yellow)")
defineIndicatorLight("P_CLP_PA_L", 141, "COMMON Caution Light Panel", "Pilot PA Light (red)")
defineIndicatorLight("P_CLP_CAP_L", 142, "COMMON Caution Light Panel", "Pilot CAP Light (yellow)")
defineIndicatorLight("P_CLP_ANEMO_L", 143, "COMMON Caution Light Panel", "Pilot ANEMO Light (yellow)")
defineIndicatorLight("P_CLP_CAERO_L", 144, "COMMON Caution Light Panel", "Pilot CAERO Light (yellow)")
defineIndicatorLight("P_CLP_LACET_L", 145, "COMMON Caution Light Panel", "Pilot LACET Light (yellow)")
defineIndicatorLight("P_CLP_TANG_L", 146, "COMMON Caution Light Panel", "Pilot TANG Light (yellow)")
defineIndicatorLight("P_CLP_ROUL_L", 147, "COMMON Caution Light Panel", "Pilot ROUL Light (yellow)")
defineIndicatorLight("P_CLP_EMP_L", 148, "COMMON Caution Light Panel", "Pilot EMP Light (yellow)")
defineIndicatorLight("P_CLP_DIR_L", 149, "COMMON Caution Light Panel", "Pilot DIR Light (yellow)")
defineIndicatorLight("P_CLP_HYPER_L", 150, "COMMON Caution Light Panel", "Pilot HYPER Light (yellow)")
defineIndicatorLight("P_CLP_MODUL_L", 151, "COMMON Caution Light Panel", "Pilot MODUL Light (red)")
defineIndicatorLight("P_CLP_VAND_L", 152, "COMMON Caution Light Panel", "Pilot VAND Light (red)")

--Warning, Caution and IndicatorLights
defineIndicatorLight("P_L_GEAR_L_DN_L", 1090, "COMMON Warning, Caution and IndicatorLights", "Pilot Left Gear Down Light (green)")
defineIndicatorLight("P_L_GEAR_UP_L", 1091, "COMMON Warning, Caution and IndicatorLights", "Pilot Gear UP Down Light (red)")
defineIndicatorLight("P_L_GEAR_N_DN_L", 1092, "COMMON Warning, Caution and IndicatorLights", "Pilot Nose Gear Down Light (green)")
defineIndicatorLight("P_L_GEAR_R_DN_L", 1093, "COMMON Warning, Caution and IndicatorLights", "Pilot Right Gear Down Light (green)")

defineFloat("P_SHOCK_CONE_G", 1021, {0, 0.2}, "COMMON Misc Gauges ", "Pilot Shock Cone Indicator")
defineFloat("P_RPM_S_G", 1027, {0, 1}, "COMMON Misc Gauges ", "Pilot RPM Indicator Short Needle")
defineFloat("P_RPM_L_G", 1106, {0, 1}, "COMMON Misc Gauges ", "Pilot RPM Indicator Long Needle")
defineFloat("P_JPT_IND_G", 1028, {0, 1}, "COMMON Misc Gauges ", "Pilot JPT Indicator")

----F1CE/BE/EE
defineToggleSwitch("P_CE_ANT_GYRO", 1, 3378, 408, "CE/BE/EE Misc", "CE/BE/EE Pilot ANTENNA-GYRO Switch")

--Navigation indicator
defineMultipositionSwitch("P_CE_NAV_MODE", 1, 3479, 1204, 4, 0.3333, "CE/BE Navigation Indicator", "CE/BE Pilot Navigation Mode Selector Switch")
defineToggleSwitch("P_CE_NAV_NORM_ADD_VEC", 1, 3481, 1205, "CE/BE Navigation Indicator", "CE/BE Pilot Navigation Normal/Additional Vector Switch")
defineToggleSwitch("P_CE_NAV_ADD_TARGET", 1, 3482, 1206, "CE/BE Navigation Indicator", "CE/BE Pilot Navigation Additional Target Selector Switch")
defineRotary("P_CE_NAV_BRG_DIST", 1, 3484, 1207, "CE/BE Navigation Indicator", "CE/BE Pilot Navigation Bearing/Distance Selector Knob")
definePushButton("P_CE_NAV_TEST", 1, 3486, 1208, "CE/BE Navigation Indicator", "CE/BE Pilot Navigation Test Button")

defineFloat("P_CE_NAV_HDG_G", 1189, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Heading Rose")
defineFloat("P_CE_NAV_AP_SEL_G", 1190, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Heading Selection for Autopilot")
defineFloat("P_CE_NAV_TCN_TRG_G", 1191, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation TACAN Target Bearing")
defineFloat("P_CE_NAV_RDR_ANT_G", 1192, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Radar Antenna Bearing")
defineFloat("P_CE_NAV_TCN_DIST_100_G", 1193, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation TACAN Target Distance Drum 100")
defineFloat("P_CE_NAV_TCN_DIST_10_G", 1194, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation TACAN Target Distance Drum 10")
defineFloat("P_CE_NAV_TCN_DIST_1_G", 1195, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation TACAN Target Distance Drum 1")
defineFloat("P_CE_NAV_TCN_DIST_FLAG_G", 1196, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation TACAN Target Distance Flag")
defineFloat("P_CE_NAV_VEC_B_100_G", 1197, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Additional Vector Bearing Drum 100")
defineFloat("P_CE_NAV_VEC_B_10_G", 1198, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Additional Vector Bearing Drum 10")
defineFloat("P_CE_NAV_VEC_B_1_G", 1199, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Additional Vector Bearing Drum 1")
defineFloat("P_CE_NAV_VEC_D_100_G", 1200, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Additional Vector Distance Drum 100")
defineFloat("P_CE_NAV_VEC_D_10_G", 1201, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Additional Vector Distance Drum 10")
defineFloat("P_CE_NAV_VEC_D_1_G", 1202, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation Additional Vector Distance Drum 1")
defineFloat("P_CE_NAV_VOR_FLAG_G", 1203, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation VOR/LOC Failure Flag")
defineFloat("P_CE_NAV_IDN_FLAG_G", 1306, {0, 1}, "CE/BE Navigation Indicator Gauges", "CE/BE Pilot Navigation IDN Failure Flag")

--Radar Detector Indicator
definePushButton("P_CE_RD_L_BRT_BTN", 1, 3494, 1290, "CE/BE Radar Detector", "CE/BE Pilot 'T' Test Button (Push)")
definePotentiometer("P_C_RD_L_BRT_KNB", 1, 3495, 1237, {0, 1}, "C Radar Detector", "C Pilot Indicator Lights Intensity Adjusting Knob (Turn)")
defineSpringloaded_3PosTumb("P_C_RD_TEST", 1, 3498, 3497, 1238, "C Radar Detector", "C Pilot Radar Detector Indicator Test Selector")

defineIndicatorLight("P_CE_RD_NOT_L", 1230, "CE/BE Radar Detector Lights", "CE/BE Pilot NATURE OF THREAT Light (red)")
defineIndicatorLight("P_CE_RD_TWS_L", 1233, "CE/BE Radar Detector Lights", "CE/BE Pilot TWS Light (red)")
defineIndicatorLight("P_CE_RD_CW_L", 1236, "CE/BE Radar Detector Lights", "CE/BE Pilot CW Light (red)")
defineIndicatorLight("P_CE_RD_ARROW_F_L", 1239, "CE/BE Radar Detector Lights", "CE/BE Pilot Front Arrow Light (red)")
defineIndicatorLight("P_CE_RD_ARROW_L_L", 1240, "CE/BE Radar Detector Lights", "CE/BE Pilot Left Arrow Light (red)")
defineIndicatorLight("P_CE_RD_ARROW_R_L", 1241, "CE/BE Radar Detector Lights", "CE/BE Pilot Right Arrow Light (red)")
defineIndicatorLight("P_CE_RD_ARROW_B_L", 1242, "CE/BE Radar Detector Lights", "CE/BE Pilot Back Arrow Light (red)")

--Armament Control
defineMultipositionSwitch("P_CE_ARM_SIGHT", 1, 3503, 590, 3, 0.5, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Armament Sight Selector")
defineMultipositionSwitch("P_CE_ARM_BOMB_ROCK_SEL", 1, 3504, 592, 3, 0.5, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Armament Bomb/Rocket Selector")
defineToggleSwitch("P_CE_ARM_MATRA_SW", 1, 3505, 593, "CE/BE/EE Armament Control", "CE/BE/EE Pilot MATRA 550 or Sidewinder Missile Switch")
defineToggleSwitch("P_CE_ARM_FORE_AFT", 1, 3506, 594, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Fore/Aft Selector Switch")
defineToggleSwitch("P_CE_ARM_MAN_AUTO", 1, 3507, 595, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Auto/Manual Firing Selector Switch")
defineToggleSwitch("P_CE_ARM_SINGLE_SALVO", 1, 3508, 596, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Single/Salvo Selector")
defineMultipositionSwitch("P_CE_ARM_INST_DEL_SAFE", 1, 3509, 597, 3, 0.5, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Instantaneous/Delay/Safe Selector Switch")
defineToggleSwitch("P_CE_ARM_EXTG", 1, 3510, 604, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Left MATRA R550 or Sidewinder Missile Pushbutton")
defineToggleSwitch("P_CE_ARM_MGFUS", 1, 3511, 606, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Left or fuselage MATRA R530 Missile Pushbutton")
defineToggleSwitch("P_CE_ARM_CANA", 1, 3512, 608, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Air-to-Air Guns Pushbutton")
defineToggleSwitch("P_CE_ARM_BOMB_VOIL", 1, 3513, 610, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Wing Bombs Pushbutton")
defineToggleSwitch("P_CE_ARM_EXTD", 1, 3514, 612, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Right MATRA R550 or Sidewinder Missile Pushbutton")
defineToggleSwitch("P_CE_ARM_MD", 1, 3515, 614, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Right MATRA R530 Missile Pushbutton")
defineToggleSwitch("P_CE_ARM_CANSROQ", 1, 3516, 616, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Air-to-Ground Guns or Rockets Pushbutton")
defineToggleSwitch("P_CE_ARM_BOMBFUS", 1, 3517, 618, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Fuselage Bombs Pushbutton")
defineToggleSwitch("P_CE_ARM_MISL_NORM_ALT", 1, 3518, 601, "CE/BE/EE Armament Control", "CE/BE/EE Pilot R 530 Missile Normal/Altitude Difference Selector Switch")
defineToggleSwitch("P_CE_ARM_NORM_JAM", 1, 3519, 603, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Normal/Jammer Pursuit Switch")
definePushButton("P_CE_ARM_L_TEST", 1, 3520, 602, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Armament Panel Lights Test")
defineToggleSwitch("P_CE_ARM_MATRA_JETT_CVR", 1, 3487, 962, "CE/BE Armament Control", "CE/BE Pilot MATRA 550 or Sidewinder Jettison Button Guard")
definePushButton("P_CE_ARM_MATRA_JETT", 1, 3488, 963, "CE/BE Armament Control", "CE/BE Pilot MATRA 550 or Sidewinder Jettison Button")
defineToggleSwitch("P_CE_ARM_MASTER_CVR", 1, 3128, 432, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Armament Master Switch Guard")
defineMultipositionSwitch("P_CE_ARM_MASTER", 1, 3129, 433, 3, 0.5, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Armament Master Switch")
definePushButton("P_CE_ARM_R_DESELECT", 1, 3397, 361, "CE/BE/EE Armament Control", "CE/BE/EE Pilot (C + M or SW) R Deselection Button")
define3PosTumb("P_CE_ARM_TELE_ZONE_SCAN", 1, 3398, 360, "CE/BE/EE Armament Control", "CE/BE/EE Pilot Telemeter/Zone Scanning Switch")

defineIndicatorLight("P_CE_ARM_EXTG_L", 605, "CE/BE/EE Armament Control Lights", "Pilot EXT G Light (white)")
defineIndicatorLight("P_CE_ARM_MGFUS_L", 607, "CE/BE/EE Armament Control Lights", "Pilot MG FUS Light (white)")
defineIndicatorLight("P_CE_ARM_CANA_L", 609, "CE/BE/EE Armament Control Lights", "Pilot CAN A Light (white)")
defineIndicatorLight("P_CE_ARM_BOMB_VOIL_L", 611, "CE/BE/EE Armament Control Lights", "Pilot BOMB VOIL Light (white)")
defineIndicatorLight("P_CE_ARM_EXTD_L", 613, "CE/BE/EE Armament Control Lights", "Pilot EXT D Light (white)")
defineIndicatorLight("P_CE_ARM_MD_L", 615, "CE/BE/EE Armament Control Lights", "Pilot MD Light (white)")
defineIndicatorLight("P_CE_ARM_CANSROQ_L", 617, "CE/BE/EE Armament Control Lights", "Pilot CANS ROQ Light (white)")
defineIndicatorLight("P_CE_ARM_BOMBFUS_L", 619, "CE/BE/EE Armament Control Lights", "Pilot BOMB FUS Light (white)")

--UHF Radio (TRT - TRAP 137B)
defineToggleSwitch("P_CE_UHF_5_25_SEL", 1, 3383, 340, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF 5W/25W Selector Switch")
defineToggleSwitch("P_CE_UHF_SQUELCH", 1, 3384, 341, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF Squelch Switch")
define3PosTumb("P_CE_UHF_TEST_SEL", 1, 3385, 342, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF Test Selector Switch")
definePushButton("P_CE_UHF_CDE", 1, 3386, 343, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF CDE Button")
defineMultipositionSwitch("P_CE_UHF_FUNC", 1, 3387, 344, 3, 0.5, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF Function Selector")
defineRadioWheel("P_CE_UHF_CHAN", 1, 3391, 3391, {-0.05, 0.05}, 348, 0.05, {0, 1}, {" 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", " 1", " 2", " 3", " 4", " 5"}, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF Channel Selector")

defineIndicatorLight("P_CE_UHF_CDE_L", 351, "CE/BE/EE UHF Radio Lights", "CE/BE/EE Pilot UHF Radio CDE Light (green)")
defineIndicatorLight("P_CE_UHF_TEST_L", 352, "CE/BE/EE UHF Radio Lights", "CE/BE/EE Pilot UHF Radio TEST Light (red)")

--Accelerometer Reset Button and Rheostat
definePushButton("P_CE_ACCEL_RESET_BTN", 1, 3399, 1288, "CE/BE/EE Accelerometer", "CE/BE/EE Pilot Accelerometer Reset Button (Push)")
definePotentiometer("P_CE_ACCEL_BRT_KNB", 1, 3400, 1289, {0, 1}, "CE/BE/EE Accelerometer", "CE/BE/EE Pilot Accelerometer Rheostat Knob (Turn)")

defineFloat("P_CE_ACCEL_U_ARROW_G", 218, {0, 1}, "CE/BE/EE Accelerometer Gauges", "CE/BE/EE Pilot Accelerometer Upper Arrow")
defineFloat("P_CE_ACCEL_M_ARROW_G", 218, {0, 1}, "CE/BE/EE Accelerometer Gauges", "CE/BE/EE Pilot Accelerometer Main Arrow")
defineFloat("P_CE_ACCEL_L_ARROW_G", 218, {0, 1}, "CE/BE/EE Accelerometer Gauges", "CE/BE/EE Pilot Accelerometer Lower Arrow")

--Sight System and Recording Camera
defineToggleSwitch("P_CE_SIGHT_AUTO_MAN_INTENT", 1, 3403, 760, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight AUTO/MAN Intensity Selector Switch")
defineMultipositionSwitch("P_CE_SIGHT_LIGHTING", 1, 3404, 761, 3, 0.5, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Lighting Selector Switch")
defineRotary("P_CE_SIGHT_MAN_GRAV_DROP", 1, 3405, 769, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Manual Gravity Drop Selection Thumbwheel")
definePotentiometer("P_CE_SIGHT_FIX_RETICLE_BRT", 1, 3406, 770, {0, 1}, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Fixed Reticle Intensity Rheostat")
definePotentiometer("P_CE_SIGHT_MOVE_TGT_RETICLE_BRT", 1, 3408, 771, {0, 1}, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Moving and Target Reticles Intensity Rheostat")
definePotentiometer("P_CE_SIGHT_ATT_RETICLE_BRT", 1, 3410, 772, {0, 1}, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Attitude Reticle Intensity Rheostat")
definePushButton("P_CE_SIGHT_TEST", 1, 3412, 773, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight System Test Button")
definePotentiometer("P_CE_SIGHT_EX_TIME_REP", 1, 3413, 774, {0, 1}, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Exposure Time Repeater")
definePotentiometer("P_CE_SIGHT_OVERRUN", 1, 3415, 775, {0, 1}, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Overrun Select Thumbwheel")
defineToggleSwitch("P_CE_SIGHT_FRAME_RATE", 1, 3417, 777, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight 5/16 PPS Framing Rate Selector Switch")
definePushButton("P_CE_SIGHT_CAM_TEST", 1, 3418, 776, "CE/BE/EE Sight System", "CE/BE/EE Pilot Sight Camera Test Switch")

defineFloat("P_CE_SIGHT_MAN_GRAV_100_G", 766, {0, 1}, "CE/BE/EE Sight System Gauges", "CE/BE/EE Pilot Manual Gravity Drop Drum 100")
defineFloat("P_CE_SIGHT_MAN_GRAV_10_G", 767, {0, 1}, "CE/BE/EE Sight System Gauges", "CE/BE/EE Pilot Manual Gravity Drop Drum 10")
defineFloat("P_CE_SIGHT_MAN_GRAV_1_G", 768, {0, 1}, "CE/BE/EE Sight System Gauges", "CE/BE/EE Pilot Manual Gravity Drop Drum 1")
defineFloat("P_CE_SIGHT_G", 774, {0, 1}, "CE/BE/EE Sight System Gauges", "CE/BE/EE Pilot Sight Gauge")

--Radar
definePushButton("P_CE_RADAR_TEST", 1, 3424, 836, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Test Button")
definePotentiometer("P_CE_RADAR_SCOPE_INTENT", 1, 3425, 837, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Scope Intensity Adjustment")
defineMultipositionSwitch("P_CE_RADAR_FUNC", 1, 3427, 838, 8, 1/7, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Function Selection")
definePotentiometer("P_CE_RADAR_STORAGE_ADJ", 1, 3429, 839, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Storage Adjustment")
definePushButton("P_CE_RADAR_SCOPE_DEL", 1, 3431, 840, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Scope Erasing")
definePotentiometer("P_CE_RADAR_POLAROID", 1, 3432, 841, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Polaroid Screen Adjustment")
defineMultipositionSwitch("P_CE_RADAR_SEL", 1, 3523, 598, 3, 0.5, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Selector")
definePushButton("P_CE_RADAR_EMERG_TRANS", 1, 3524, 599, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Emergency Transmission Button")
defineToggleSwitch("P_CE_RADAR_4_1_LINE", 1, 3525, 600, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar 4 lines/1 line Scan Switch")
definePotentiometer("P_CE_RADAR_IND_L_BRT", 1, 3527, 632, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Indicator Lights Brightness")
definePotentiometer("P_CE_RADAR_STROBE_BRT", 1, 3529, 633, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Strobe Brightness")
definePotentiometer("P_CE_RADAR_DIST_M_BRT", 1, 3531, 634, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Distance Markers Brightness")
definePotentiometer("P_CE_RADAR_VEL_M_BRT", 1, 3533, 635, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Horizon and Radial Velocity Marker Brightness")
definePotentiometer("P_CE_RADAR_HORIZON_POS", 1, 3535, 636, {0, 1}, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Horizon Symbol Vertical Position")
defineToggleSwitch("P_CE_RADAR_CVR", 1, 3537, 864, "CE/BE/EE Radar", "CE/BE/EE Pilot Radar Cover Remove Toggle")

defineIndicatorLight("P_CE_RADAR_HA_L", 842, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar HA Light (yellow)")
defineIndicatorLight("P_CE_RADAR_IC_L", 843, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar IC Light (yellow)")
defineIndicatorLight("P_CE_RADAR_TL_L", 844, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar TL Light (green)")
defineIndicatorLight("P_CE_RADAR_BZ_L", 845, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar BZ Light (green)")
defineIndicatorLight("P_CE_RADAR_TS_L", 846, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar TS Light (green)")
defineIndicatorLight("P_CE_RADAR_V1_L", 847, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar V1 Light (yellow)")
defineIndicatorLight("P_CE_RADAR_V2_L", 848, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar V2 Light (yellow)")
defineIndicatorLight("P_CE_RADAR_DC_L", 849, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar DC Light (yellow)")
defineIndicatorLight("P_CE_RADAR_PR_L", 850, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar PR Light (yellow)")
defineIndicatorLight("P_CE_RADAR_AC_L", 851, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar AC Light (yellow)")
defineIndicatorLight("P_CE_RADAR_DB_L", 852, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar DB Light (yellow)")
defineIndicatorLight("P_CE_RADAR_Y_L", 853, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar Yellow Light (yellow)")
defineIndicatorLight("P_CE_RADAR_G_L", 854, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar Green Light (green)")
defineIndicatorLight("P_CE_RADAR_R_L", 855, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar Red Light (red)")
defineIndicatorLight("P_CE_RADAR_7_L", 856, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar 7 Light (green)")
defineIndicatorLight("P_CE_RADAR_15_L", 857, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar 15 Light (green)")
defineIndicatorLight("P_CE_RADAR_35_L", 858, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar 35 Light (yellow)")
defineIndicatorLight("P_CE_RADAR_60_L", 859, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar 60 Light (yellow)")
defineIndicatorLight("P_CE_RADAR_AP_L", 860, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar AP Light (yellow)")
defineIndicatorLight("P_CE_RADAR_TCH_L", 861, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar TCH Light (yellow)")
defineIndicatorLight("P_CE_RADAR_EMI_L", 862, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar EMI Light (yellow)")
defineIndicatorLight("P_CE_RADAR_PNE_L", 863, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar PNE Light (yellow)")
defineFloat("P_CE_RADAR_ALT_BRT_L", 1320, {0, 1}, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar Altitude Difference Brightness (red)")
defineFloat("P_CE_RADAR_BACK_L", 1331, {0, 1}, "CE/BE/EE Radar Lights", "CE/BE/EE Pilot Radar Backklight Brightness (red)")

--IFF
defineRadioWheel("P_CE_IFF_M1_10", 1, 3438, 3438, {-0.125, 0.125}, 732, 0.125, {0, 1}, nil, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 1 Coding Tens Selector")
defineRadioWheel("P_CE_IFF_M1_1", 1, 3440, 3440, {-0.125, 0.125}, 733, 0.125, {0, 1}, nil, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 1 Coding Units Selector")
defineRadioWheel("P_CE_IFF_M3A_1000", 1, 3442, 3442, {-0.125, 0.125}, 734, 0.125, {0, 1}, nil, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 3A Coding Thousands Selector")
defineRadioWheel("P_CE_IFF_M3A_100", 1, 3444, 3444, {-0.125, 0.125}, 735, 0.125, {0, 1}, nil, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 3A Coding Hundreds Selector")
defineRadioWheel("P_CE_IFF_M3A_10", 1, 3528, 3528, {-0.125, 0.125}, 736, 0.125, {0, 1}, nil, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 3A Coding Tens Selector")
defineRadioWheel("P_CE_IFF_M3A_1", 1, 3446, 3446, {-0.125, 0.125}, 737, 0.125, {0, 1}, nil, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 3A Coding Units Selector")
defineSpringloaded_3PosTumb("P_CE_IFF_POS_IDENT", 1, 3451, 3450, 744, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Position Identification Selector")
definePushButton("P_CE_IFF_TEST", 1, 3452, 738, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Test Button")
defineMultipositionSwitch("P_CE_IFF_M4_SEL", 1, 3453, 743, 4, 0.3333, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 4 Selector Switch")
definePushButton("P_CE_IFF_MONITOR_BTN", 1, 3455, 740, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Monitoring Light Button (Push)")
definePotentiometer("P_CE_IFF_MONITOR_KNB", 1, 3456, 741, {0, 1}, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Monitoring Light Knob (Turn)")
defineMultipositionSwitch("P_CE_IFF_FUNC_SEL", 1, 3458, 739, 4, 0.3333, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Function Selector Switch")
defineToggleSwitch("P_CE_IFF_MODE4", 1, 3460, 745, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Mode 4 Switch")
definePushButton("P_CE_IFF_FAULT_BTN", 1, 3461, 746, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Fault Light Button (Push)")
definePotentiometer("P_CE_IFF_FAULT_KNB", 1, 3462, 747, {0, 1}, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF Fault Light Knob (Turn)")
define3PosTumb("P_CE_IFF_AUDIO_L_SW", 1, 3464, 749, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF AUDIO-LIGHT Switch")
defineToggleSwitch("P_CE_IFF_MODE_M1", 1, 3465, 750, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF M-1 Mode Switch")
defineToggleSwitch("P_CE_IFF_MODE_M2", 1, 3466, 751, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF M-2 Mode Switch")
defineToggleSwitch("P_CE_IFF_MODE_M3", 1, 3467, 752, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF M-3 Mode Switch")
defineToggleSwitch("P_CE_IFF_MODE_M4", 1, 3468, 753, "CE/BE/EE IFF", "CE/BE/EE Pilot IFF M-4 Mode Switch")

defineIndicatorLight("P_CE_IFF_L", 742, "CE/BE/EE IFF Lights", "CE/BE/EE Pilot IFF Light (green)")
defineIndicatorLight("P_CE_IFF_FAULT_L", 748, "CE/BE/EE IFF Lights", "CE/BE/EE Pilot IFF Fault Light (red)")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_R_T", function()
	return math.floor(LoGetAircraftDrawArgumentValue(120)*65535)
end, 65535, "External Aircraft Model", "Right Top Speed Brake")
defineIntegerFromGetter("EXT_SPEED_BRAKE_L_T", function()
	return math.floor(LoGetAircraftDrawArgumentValue(123)*65535)
end, 65535, "External Aircraft Model", "Left Top Speed Brake")
defineIntegerFromGetter("EXT_SPEED_BRAKE_R_B", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Right Bottom Speed Brake")
defineIntegerFromGetter("EXT_SPEED_BRAKE_L_B", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Left Bottom Speed Brake")
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_LAND_L", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (white)")
defineIntegerFromGetter("EXT_LEFT_L", function()
	if LoGetAircraftDrawArgumentValue(905) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Light (white)")
defineIntegerFromGetter("EXT_TAXI_L", function()
	if LoGetAircraftDrawArgumentValue(903) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Taxi Light (white)")
defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(803) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light (white)")
defineIntegerFromGetter("EXT_BEACON_TAIL", function()
	if LoGetAircraftDrawArgumentValue(802) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Beacon Light (red)")
defineIntegerFromGetter("EXT_BEACON_B", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Beacon Light (red)")
defineIntegerFromGetter("EXT_BEACON_T", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Beacon Light (red)")
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

definePushButton("P_CE_UHF_TEST_BTN", 1, 3390, 345, "CE/BE/EE UHF Radio", "CE/BE/EE Pilot UHF Test Button")

--Navigation Indicator
defineToggleSwitch("P_EE_IDN_HEAD_SEL", 1, 3655, 1254, "EE Navigation Indicator", "EE Pilot Gyromagnetic/True IDN Heading Selector")
defineToggleSwitch("P_EE_VOR_RDR_NEEDLE_SEL", 1, 3656, 1255, "EE Navigation Indicator", "EE Pilot VOR/Radar Narrow Needle Selector")
defineMultipositionSwitch("P_EE_NAV_MODE_SEL", 1, 3657, 1256, 6, 0.2, "EE Navigation Indicator", "EE Pilot Mode Selector Switch")
defineSpringloaded_3PosTumb("P_EE_VECTOR_ADJ", 1, 3658, 3659, 1257, "EE Navigation Indicator", "EE Pilot Additional Vector Bearing/Distance Adjustment Switch")

--In-flight Refuelling System
defineToggleSwitch("P_EE_AAR_TRANS_FILL_SW_CVR", 1, 3664, 400, "EE AAR System", "EE Pilot Transfer/Filling Switch Guard")
defineToggleSwitch("P_EE_AAR_TRANS_FILL_SW", 1, 3663, 401, "EE AAR System", "EE Pilot Transfer/Filling Switch")
definePotentiometer("P_EE_AAR_L_BRG", 1, 3667, 407, {0, 1}, "EE AAR System", "EE Pilot Aerial Refuelling Light Adjustment Potentiometer")

--ALR-300 control panel
definePushButton("P_EE_ALR300_REC", 1, 3670, 1012, "EE ALR-300", "EE Pilot ALR-300 Threats Parameters Recording")
definePushButton("P_EE_ALR300_AUDIO", 1, 3671, 1013, "EE ALR-300", "EE Pilot ALR-300 Threats Audio Off")
definePushButton("P_EE_ALR300_SEARCH", 1, 3672, 1014, "EE ALR-300", "EE Pilot ALR-300 Search Threats Off")
definePushButton("P_EE_ALR300_5_DANGER", 1, 3673, 1015, "EE ALR-300", "EE Pilot ALR-300 Display 5 most Dangerous Threats")
definePushButton("P_EE_ALR300_INFO", 1, 3674, 1016, "EE ALR-300", "EE Pilot ALR-300 Detailed Threats Info")
definePotentiometer("P_EE_ALR300_BRIGHT", 1, 3675, 1017, {0, 1}, "EE ALR-300", "EE Pilot ALR-300 Display Brightness")
definePushButton("P_EE_ALR300_TEST", 1, 3677, 1018, "EE ALR-300", "EE Pilot ALR-300 Test")

definePushButton("P_EFC_MV_THL_CUT_IDLE", 1, 3035, 234, "COMMON Engine-Fuel Control", "Pilot Move Throttle Cut/Idle")

--Inertial Navigation System (INS)
defineMultipositionSwitch("P_EE_INS_PARA_SEL", 1, 3690, 665, 6, 0.1, "EE INS", "EE Pilot Parameters Selector")
defineMultipositionSwitch("P_EE_INS_MODE_SEL", 1, 3692, 666, 9, 0.125, "EE INS", "EE Pilot Modes Selector")
defineMultipositionSwitch("P_EE_INS_WAY_SEL", 1, 3694, 667, 10, 0.111, "EE INS", "EE Pilot Waypoints Selectorwheel")
defineMultipositionSwitch("P_EE_INS_LIGHTS_SEL", 1, 3696, 668, 3, 0.5, "EE INS", "EE Pilot Lights Test and Brightnes Selector")
definePushButton("P_EE_INS_VD_BTN", 1, 3709, 650, "EE INS", "EE Pilot INS Vertical Designation Button")
definePushButton("P_EE_INS_PV_BTN", 1, 3710, 651, "EE INS", "EE Pilot INS Position Validation Button")
definePushButton("P_EE_INS_DI_BTN", 1, 3711, 652, "EE INS", "EE Pilot INS Data Insertion Button")
definePushButton("P_EE_INS_1_BTN", 1, 3698, 653, "EE INS", "EE Pilot INS - 1 Button")
definePushButton("P_EE_INS_2_BTN", 1, 3699, 654, "EE INS", "EE Pilot INS N 2 Button")
definePushButton("P_EE_INS_3_BTN", 1, 3700, 655, "EE INS", "EE Pilot INS + 3 Button")
definePushButton("P_EE_INS_4_BTN", 1, 3701, 656, "EE INS", "EE Pilot INS W 4 Button")
definePushButton("P_EE_INS_5_BTN", 1, 3702, 657, "EE INS", "EE Pilot INS 5 Button")
definePushButton("P_EE_INS_6_BTN", 1, 3703, 658, "EE INS", "EE Pilot INS 6 E Button")
definePushButton("P_EE_INS_7_BTN", 1, 3704, 659, "EE INS", "EE Pilot INS 7 Button")
definePushButton("P_EE_INS_8_BTN", 1, 3705, 660, "EE INS", "EE Pilot INS 8 S Button")
definePushButton("P_EE_INS_9_BTN", 1, 3706, 661, "EE INS", "EE Pilot INS - 9 Button")
definePushButton("P_EE_INS_AST_BTN", 1, 3708, 662, "EE INS", "EE Pilot INS - * Button")
definePushButton("P_EE_INS_0_BTN", 1, 3697, 663, "EE INS", "EE Pilot INS - 0 Button")
definePushButton("P_EE_INS_CLR_BTN", 1, 3707, 664, "EE INS", "EE Pilot INS - CLR Button")

defineSpringloaded_2PosTumb("P_EE_PIT_INOP", 1, 3715, 3716, 1272, "EE Cockpit", "EE Pilot Inoperative")
definePushButton("P_WL_M_FAIL_R", 1, 3678, 922, "EE Warning Switches", "Pilot Right Master Failure Warning Light Button")
definePushButton("P_WL_ENG_FIRE_WARN", 1, 3679, 936, "EE Warning Switches", "Pilot Fire Warning Light ENG Button")

--BARAX
definePushButton("P_BARAX_L_TEST", 1, 3684, 1260, "EE BARAX", "Pilot BARAX Light Test")
defineTumb("P_BARAX_STATE_SEL", 1, 3682, 1262, 0.5, {0, 1}, nil, false, "EE BARAX", "Pilot BARAX State Selector OFF/ON/TEST")
defineToggleSwitch("P_BARAX_EM_RDY", 1, 3683, 1264, "EE BARAX", "Pilot BARAX Emission Ready Korry")
defineToggleSwitch("P_CANOPY_MIRRORS2", 1, 3181, 2, "COMMON Canopy", "Pilot Mirrors 2")
defineToggleSwitch("P_CANOPY_OPEN2", 1, 3183, 1, "COMMON Canopy", "Pilot Canopy Open/Close 2")

definePotentiometer("P_CANOPY_R_MIRRORS_ADJ", 1, 3166, 2, {0, 1}, "COMMON Canopy", "Pilot Adjust Right Mirrors")
definePotentiometer("P_CANOPY_L_MIRRORS_ADJ", 1, 3168, 2, {0, 1}, "COMMON Canopy", "Pilot Adjust Left Mirrors")

--AN/ALE-40 Programmer
defineToggleSwitch("P_CHAFF_BURST", 1, 3563, 1401, "COMMON ALE-40", "Pilot Chaff Burst Interval Reduction Switch")
defineMultipositionSwitch("P_CHAFF_BURST_INT_SEL", 1, 3565, 1402, 4, 0.1, "COMMON ALE-40", "Pilot Chaff Burst Interval Selector")
defineMultipositionSwitch("P_CHAFF_BURST_CNT_SEL", 1, 3564, 1403, 6, 0.1, "COMMON ALE-40", "Pilot Chaff Burst Count Selector")
defineMultipositionSwitch("P_CHAFF_SALVO_INT_SEL", 1, 3567, 1404, 7, 0.1, "COMMON ALE-40", "Pilot Chaff Salvo Interval Selector")
defineMultipositionSwitch("P_CHAFF_SALVO_CNT_SEL", 1, 3566, 1405, 5, 0.1, "COMMON ALE-40", "Pilot Chaff Salvo Count Selector")
defineMultipositionSwitch("P_FLARE_BURST_INT_SEL", 1, 3569, 1406, 5, 0.1, "COMMON ALE-40", "Pilot Chaff Burst Interval Selector")
defineMultipositionSwitch("P_FLARE_BURST_CNT_SEL", 1, 3568, 1407, 5, 0.1, "COMMON ALE-40", "Pilot Chaff Burst Count Selector")

----F1BE
--Commutation Panel
definePushButton("P_BE_TCN_PRIO", 1, 3796, 434, "BE Commutation FRONT", "BE Pilot TACAN Priority")
definePushButton("P_BE_RAD_PRIO", 1, 3797, 436, "BE Commutation FRONT", "BE Pilot RADAR Priority")
definePushButton("P_BE_UHF_PRIO", 1, 3798, 438, "BE Commutation FRONT", "BE Pilot V/UHF Priority")
definePushButton("P_BE_ILS_PRIO", 1, 3799, 440, "BE Commutation FRONT", "BE Pilot V/ILS Priority")
definePushButton("P_BE_COMMU_TEST", 1, 3800, 442, "BE Commutation FRONT", "BE Pilot Commutation Panel Test")

defineToggleSwitch("BE_STICK_HIDE", 1, 3570, 51, "BE Cockpit", "BE Show/Hide Flight Stick")

--Flight Control System controls
defineToggleSwitch("C_BE_STICK_UNCOUPLE", 1, 3575, 105, "BE Flight Control System REAR", "BE Copilot Stick Uncouple Switch")
defineToggleSwitch("C_BE_STICK_UNCOUPLE_CVR", 1, 3576, 104, "BE Flight Control System REAR", "BE Copilot Stick Uncouple Switch Cover")
defineSpringloaded_3PosTumb("C_BE_RUDDER_TRIM", 1, 3578, 3577, 420, "BE Flight Control System REAR", "BE Copilot Rudder Trim Control")

--Autopilot controls
definePotentiometer("C_BE_AP_INT", 1, 3580, 1011, {0, 1}, "BE Autopilot REAR", "BE Copilot Autopilot Intensity Control")
definePushButton("C_BE_AP_TEST", 1, 3581, 1170, "BE Autopilot REAR", "BE Copilot Autopilot Control and Indicator Unit Test")

-- Engine and fuel controls
definePushButton("C_BE_THROTTLE_CUT", 1, 3583, 246, "BE Engine Controls REAR", "BE Copilot Throttle Cut/Idle Switch")
defineSpringloaded_3PosTumb("C_BE_INFLG_RELIGHT", 1, 3584, 3585, 247, "BE Engine Controls REAR", "BE Copilot In-flight Relight Control")
defineToggleSwitch("C_BE_MAIN_COCK_LP_CVR", 1, 3586, 415, "BE Engine Controls REAR", "BE Copilot LP Main Cock Switch Guard")
defineToggleSwitch("C_BE_MAIN_COCK_LP", 1, 3587, 416, "BE Engine Controls REAR", "BE Copilot LP Main Cock Switch")
defineToggleSwitch("C_BE_MAIN_COCK_AB_CVR", 1, 3588, 413, "BE Engine Controls REAR", "BE Copilot A/B Main Cock Switch Guard")
defineToggleSwitch("C_BE_MAIN_COCK_AB", 1, 3589, 414, "BE Engine Controls REAR", "BE Copilot A/B Main Cock Switch")

-- Jettisoning panel
defineToggleSwitch("C_BE_EMERG_JETT_CVR", 1, 3590, 971, "BE Jettisoning Panel REAR", "BE Copilot Emergency Jettison Button Guard")
defineToggleSwitch("C_BE_EMERG_JETT", 1, 3591, 972, "BE Jettisoning Panel REAR", "BE Copilot Emergency Jettison Button")

--Fuel transfer, refuelling and indication
defineRotary("C_BE_FS_QUANT_RES", 1, 3592, 1175, "BE Fuel System REAR", "BE Copilot Fuel Quantity Reset Thumbwheel")
definePushButton("C_BE_FS_TRANS_IND_TEST", 1, 3593, 1188, "BE Fuel System REAR", "BE Copilot Fuel Transfer Indicator Test")

--Radar control stick
definePushButton("C_BE_RCS_ALT_DIFF", 1, 3598, 269, "BE Radar Control Stick REAR", "BE Copilot Radar Control Stick Elevation/Altitude Difference Button")
defineMultipositionSwitch("C_BE_RCS_SCALE_SEL", 1, 3599, 268, 4, 1/3, "BE Radar Control Stick REAR", "BE Copilot Radar Control Stick Scale Selection")
defineMultipositionSwitch("C_BE_RCS_SCAN_SEL", 1, 3600, 267, 3, 0.5, "BE Radar Control Stick REAR", "BE Copilot Radar Control Stick Scan Selection")

--High-lift devices
defineMultipositionSwitch("C_BE_HLD_FLAP_SLAT", 1, 3603, 249, 3, 0.5, "BE High-Lift Devices REAR", "BE Copilot Slat/Flap Lever")
defineToggleSwitch("C_BE_AIRBRAKE_PRIO_CVR", 1, 3841, 423, "BE High-Lift Devices REAR", "BE Copilot High Lift Devices Priority Switch Guard")
define3PosTumb("C_BE_AIRBRAKE_PRIO", 1, 3842, 424, "BE High-Lift Devices REAR", "BE Copilot High Lift Devices Priority Switch")
defineToggleSwitch("C_BE_AIRBRAKE_PRIO_CVR", 1, 3843, 421, "BE High-Lift Devices REAR", "BE Copilot Airbrake Priority Switch Guard")
defineToggleSwitch("C_BE_AIRBRAKE_PRIO", 1, 3844, 422, "BE High-Lift Devices REAR", "BE Copilot Airbrake Priority Switch")
defineSpringloaded_3PosTumb("C_BE_STBY_OXY_CUT_CVR", 1, 3913, 3912, 156, "BE High-Lift Devices REAR", "BE Copilot Standby Horizon and Oxygen warning cut-off switches cover")

--Radio selector unit 
definePushButton("P_BE_RADIO_MKR_TP_BTN", 1, 3120, 316, "BE Radio Selector Unit FRONT", "BE Pilot Radio MRK/BF/TP Knob (Push)")
definePotentiometer("P_BE_RADIO_MKR_TP_KNB", 1, 3121, 317, {0, 1}, "BE Radio Selector Unit FRONT", "BE Pilot Radio MRK/BF/TP Knob (Turn)")
definePushButton("P_BE_RADIO_TB_APP_BTN", 1, 3123, 319, "BE Radio Selector Unit FRONT", "BE Pilot Radio TB/APP Knob (Push)")
definePotentiometer("P_BE_RADIO_TB_APP_KNB", 1, 3124, 320, {0, 1}, "BE Radio Selector Unit FRONT", "BE Pilot Radio TB/APP Knob (Turn)")

definePotentiometer("C_BE_RADIO_MISS", 1, 3605, 322, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio Selector MISS Potentiometer")
definePotentiometer("C_BE_RADIO_TAC", 1, 3606, 323, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio Selector TAC Potentiometer")
definePotentiometer("C_BE_RADIO_VOR", 1, 3607, 324, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio Selector VOR Potentiometer")
defineToggleSwitch("C_BE_RADIO_AMPLI", 1, 3609, 326, "BE Radio Selector Unit REAR", "BE Copilot Radio AMPLI 2-1 Selector Switch")
definePushButton("C_BE_RADIO_U_V_BTN", 1, 3610, 327, "BE Radio Selector Unit REAR", "BE Copilot Radio U+V Knob (Push)")
definePotentiometer("C_BE_RADIO_U_V_KNB", 1, 3115, 311, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio U+V Knob (Turn)")
definePushButton("C_BE_RADIO_U_BTN", 1, 3611, 329, "BE Radio Selector Unit REAR", "BE Copilot Radio U Knob (Push)")
definePotentiometer("C_BE_RADIO_U_KNB", 1, 3612, 330, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio U Knob (Turn)")
definePushButton("C_BE_RADIO_MKR_TP_BTN", 1, 3613, 332, "BE Radio Selector Unit REAR", "BE Copilot Radio MRK/BF/TP Knob (Push)")
definePotentiometer("C_BE_RADIO_MKR_TP_KNB", 1, 3614, 333, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio MRK/BF/TP Knob (Turn)")
definePushButton("C_BE_RADIO_TB_APP_BTN", 1, 3615, 335, "BE Radio Selector Unit REAR", "BE Copilot Radio TB/APP Knob (Push)")
definePotentiometer("C_BE_RADIO_TB_APP_KNB", 1, 3616, 336, {0, 1}, "BE Radio Selector Unit REAR", "BE Copilot Radio TB/APP Knob (Turn)")

--V/UHF radio control unit (TRT - TRAP 136)
define3PosTumb("C_BE_VUHF_TEST", 1, 3621, 290, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Test Selector Switch")
defineToggleSwitch("C_BE_VUHF_SIL", 1, 3622, 291, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF SIL Switch")
defineSetCommandTumb("C_BE_VUHF_FREQ_100", 1, 3623, 292, 0.1, {0, 0.3}, {"1", "2", "3"}, false, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Frequency Thumbwheel 100")
defineSetCommandTumb("C_BE_VUHF_FREQ_10", 1, 3624, 293, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Frequency Thumbwheel 10")
defineSetCommandTumb("C_BE_VUHF_FREQ_1", 1, 3625, 294, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Frequency Thumbwheel 1")
defineSetCommandTumb("C_BE_VUHF_FREQ_01", 1, 3626, 295, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Frequency Thumbwheel 0.1")
defineSetCommandTumb("C_BE_VUHF_FREQ_0025", 1, 3627, 296, 0.333, {0, 1}, {"00", "25", "50", "75"}, false, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Frequency Thumbwheel 0.025")
defineSetCommandTumb("C_BE_VUHF_FUNC_SEL", 1, 3628, 298, 0.2, {0, 0.8}, nil, true, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Function Selector")
defineToggleSwitch("C_BE_VUHF_25_5_SW", 1, 3629, 299, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF 25W - 5W Switch")
defineMultipositionSwitch("C_BE_VUHF_FREQ_SEL", 1, 3630, 300, 3, 0.5, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Frequency Selector Switch")
defineRadioWheel("C_BE_VUHF_CHAN", 1, 3631, 3631, {-0.05, 0.05}, 303, 0.05, {0, 1}, {" 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", " 1", " 2", " 3", " 4", " 5"}, "BE V/UHF Control Unit REAR", "BE Copilot V/UHF Channel Selector")

--Engine emergency regulation
definePushButton("C_BE_EER_REG_L_BTN", 1, 3637, 364, "BE Engine Emergency Regulation REAR", "BE Copilot Emergency Regulation Light Knob (Push)")
definePotentiometer("C_BE_EER_REG_L_KNB", 1, 3638, 365, {0, 1}, "BE Engine Emergency Regulation REAR", "BE Copilot Emergency Regulation Light Knob (Turn)")
defineSpringloaded_3PosTumb("C_BE_EER_CONTROL", 1, 3640, 3639, 367, "BE Engine Emergency Regulation REAR", "BE Copilot Emergency Regulation Control Lever")
defineToggleSwitch("C_BE_EER_SW_CVR", 1, 3849, 363, "BE Engine Emergency Regulation REAR", "BE Copilot Emergency Regulation Switch Guard")
defineToggleSwitch("C_BE_EER_SW", 1, 3850, 362, "BE Engine Emergency Regulation REAR", "BE Copilot Emergency Regulation Switch")
defineToggleSwitch("C_BE_EER_BRAKE_CHUTE", 1, 3645, 59, "BE Engine Emergency Regulation REAR", "BE Copilot Brake Chute Control")

--Canopy controls
defineToggleSwitch("C_BE_CANOPY_LOCK", 1, 3646, 60, "BE Canopy REAR", "BE Copilot Canopy Lock Control")
definePushButton("C_BE_CANOPY_EMBRITTLE", 1, 3647, 61, "BE Canopy REAR", "BE Copilot Canopy Embrittle Control")
defineToggleSwitch("C_BE_CANOPY_HINGE", 1, 3648, 8, "BE Canopy REAR", "BE Copilot Canopy Hinged Handle")
defineToggleSwitch("C_BE_CANOPY_R_MIRRORS", 1, 3651, 7, "BE Canopy REAR", "BE Copilot Hide Right Mirrors")
defineToggleSwitch("C_BE_CANOPY_L_MIRRORS", 1, 3649, 5, "BE Canopy REAR", "BE Copilot Hide Left Mirrors")
definePotentiometer("C_BE_CANOPY_R_MIRRORS_ADJ", 1, 3652, 7, {0, 1}, "BE Canopy REAR", "BE Copilot Adjust Right Mirrors")
definePotentiometer("C_BE_CANOPY_L_MIRRORS_ADJ", 1, 3650, 5, {0, 1}, "BE Canopy REAR", "BE Copilot Adjust Left Mirrors")
defineToggleSwitch("C_BE_CANOPY_R_OPEN", 1, 3653, 6, "BE Canopy REAR", "BE Copilot Right Canopy Open/Close")
defineToggleSwitch("C_BE_CANOPY_L_OPEN", 1, 3654, 6, "BE Canopy REAR", "BE Copilot Left Canopy Open/Close")

--Undercarriage, nose wheel steering, brake and anti-skid
defineToggleSwitch("C_BE_U_CONTROL_LVR", 1, 3656, 102, "BE Undercarriage NWS Brake REAR", "BE Copilot U/C Control Lever")
definePushButton("C_BE_U_ANTI_RETRAC_OVER", 1, 3657, 103, "BE Undercarriage NWS Brake REAR", "BE Copilot Anti-Retraction Override Button")
defineToggleSwitch("C_BE_U_PARK_EMERG_BRAKE", 1, 3658, 100, "BE Undercarriage NWS Brake REAR", "BE Copilot Emergency/Parking Brake Handle")
defineToggleSwitch("C_BE_U_ANTI_SKID_CVR", 1, 3659, 430, "BE Undercarriage NWS Brake REAR", "BE Copilot Anti-Skid (SPAD) Switch Guard")
defineToggleSwitch("C_BE_U_ANTI_SKID", 1, 3660, 431, "BE Undercarriage NWS Brake REAR", "BE Copilot Anti-Skid (SPAD) Switch")
defineSpringloaded_2PosTumb("C_BE_U_NWS_SENSI", 1, 3661, 3662, 759, "BE Undercarriage NWS Brake REAR", "BE Copilot Nose Wheel Steering High Sensitivity Button")
defineToggleSwitch("C_BE_U_NWS_STEER_CVR", 1, 3663, 417, "BE Undercarriage NWS Brake REAR", "BE Copilot Nose Wheel Steering Switch Guard")
defineToggleSwitch("C_BE_U_NWS_STEER", 1, 3664, 418, "BE Undercarriage NWS Brake REAR", "BE Copilot Nose Wheel Steering Switch")

--Hydraulic System Controls
defineToggleSwitch("C_BE_HSC_PRESS_SEL", 1, 3665, 106, "BE Hydraulic System Controls REAR", "BE Copilot Hydraulic Pressure Selector Switch")

--Clock
definePushButton("C_BE_CLOCK_SET_KNB", 1, 3668, 1370, "BE Clock REAR", "BE Copilot Chronometer Starting Control and Clock Setting Knob")
defineRotary("C_BE_CLOCK_WIND_KNB", 1, 3669, 74, "BE Clock REAR", "BE Copilot Chronometer Starting Control and Clock Winding Knob")
defineToggleSwitch("C_BE_CLOCK_WIND_LVR", 1, 3670, 1369, "BE Clock REAR", "BE Copilot Clock Winding/Setting Lever")

--Incidence indicator
definePotentiometer("C_BE_IL_INCIDENCE_BRT_KNB", 1, 3671, 205, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Incidence Indicator Lighting")

--Air data instrument controls
definePotentiometer("C_BE_ADI_SPEED_KNB", 1, 3672, 1271, {0, 1}, "BE Air Data Instrument Controls REAR", "BE Copilot Mach/Airspeed Indicator Reference Airspeed Knob")
defineRotary("C_BE_ADI_ALT_BARO_SLAVE", 1, 3673, 1064, "BE Air Data Instrument Controls REAR", "BE Copilot Slaved Altimeter Barometric Pressure Setting Knob")
defineRotary("C_BE_ADI_ALT_BARO_STBY", 1, 3674, 1080, "BE Air Data Instrument Controls REAR", "BE Copilot Standby Altimeter Barometric Pressure Setting Knob")

--Heading and vertical reference system and standby horizon controls
defineToggleSwitch("C_BE_FRS_STBY_HORIZON", 1, 3679, 158, "BE Flight Ref System REAR", "BE Copilot Standby Horizon Switch")
definePotentiometer("C_BE_FRS_SPHER_IND_DN", 1, 3680, 1126, {0, 1}, "BE Flight Ref System REAR", "BE Copilot Spherical Indicator Day/Night Selector Switch")
definePushButton("C_BE_FRS_SPHER_IND_MB_BTN", 1, 3681, 202, "BE Flight Ref System REAR", "BE Copilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Push)")
definePotentiometer("C_BE_FRS_SPHER_IND_MB_KNB", 1, 3682, 1127, {0, 1}, "BE Flight Ref System REAR", "BE Copilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Turn)")
defineSpringloaded_3PosTumb("C_BE_FRS_STBY_HORIZON_UNCAGE_BTN", 1, 3683, 3684, 1139, "BE Flight Ref System REAR", "BE Copilot Standby Horizon Uncage and Aircraft Model Control (Push)")
definePotentiometer("C_BE_FRS_STBY_HORIZON_UNCAGE_KNB", 1, 3685, 1140, {0, 1}, "BE Flight Ref System REAR", "BE Copilot Standby Horizon Uncage and Aircraft Model Control (Turn)")

--Warning Light Switches
definePushButton("C_BE_WL_M_FAIL", 1, 3690, 924, "BE Warning Switches REAR", "BE Copilot Master Failure Warning Light Button")
definePushButton("C_BE_WL_C_FLAP_BTN", 1, 3691, 959, "BE Warning Switches REAR", "BE Copilot Combat Flaps Light Button (Push)")
definePotentiometer("C_BE_WL_C_FLAP_KNB", 1, 3691, 960, {0, 1}, "BE Warning Switches REAR", "BE Copilot Combat Flaps Light Knob (Turn)")
definePushButton("C_BE_WL_UC_BTN", 1, 3692, 930, "BE Warning Switches REAR", "BE Copilot U/C Light Button")
definePushButton("C_BE_WL_NWS_BTN", 1, 3693, 953, "BE Warning Switches REAR", "BE Copilot Nose Wheel Steering Light Button (Push)")
definePotentiometer("C_BE_WL_NWS_KNB", 1, 3693, 954, {0, 1}, "BE Warning Switches REAR", "BE Copilot Nose Wheel Steering Light Knob (Turn)")
definePushButton("C_BE_WL_AIR_B_BTN", 1, 3694, 947, "BE Warning Switches REAR", "BE Copilot Airbrake Light Button (Push)")
definePotentiometer("C_BE_WL_AIR_B_KNB", 1, 3694, 948, {0, 1}, "BE Warning Switches REAR", "BE Copilot Airbrake Light Knob (Turn)")
definePushButton("C_BE_WL_LIMIT_WARN", 1, 3695, 934, "BE Warning Switches REAR", "BE Copilot Limit Warning Light Button")
definePushButton("C_BE_WL_AB_FIRE_WARN", 1, 3696, 938, "BE Warning Switches REAR", "Pilot Fire Warning Light (ENG/AB) + Horn Button")
definePushButton("C_BE_WL_AB_INJ", 1, 3697, 1037, "BE Warning Switches REAR", "BE Copilot A/B INJ Light Button")
definePushButton("C_BE_WL_AB_ON", 1, 3698, 1039, "BE Warning Switches REAR", "BE Copilot A/B ON Light Button")
definePushButton("C_BE_WL_AB_SRL", 1, 3699, 1041, "BE Warning Switches REAR", "BE Copilot A/B SRL Light Button")
definePushButton("C_BE_WL_CONFIG_TEST", 1, 3700, 1095, "BE Warning Switches REAR", "BE Copilot Configuration Indicator Test Button")
definePushButton("C_BE_WL_FAIL_T_TEST", 1, 3701, 159, "BE Warning Switches REAR", "BE Copilot Failure Warning Panel T Test Button")
definePushButton("C_BE_WL_FAIL_O2_TEST", 1, 3702, 160, "BE Warning Switches REAR", "BE Copilot Failure Warning Panel O2 Test Button")
defineToggleSwitch("C_BE_WL_WARN_HORN", 1, 3703, 428, "BE Warning Switches REAR", "BE Copilot Warning Horn Switch")
defineToggleSwitch("C_BE_WL_WARN_HORN_CVR", 1, 3854, 427, "BE Warning Switches REAR", "BE Copilot Warning Horn Switch Guard")
definePushButton("C_BE_WL_CAN_HOT_BTN", 1, 3704, 153, "BE Warning Switches REAR", "BE Copilot Cannons too Hot Light Button (Push)")
definePotentiometer("C_BE_WL_CAN_HOT_KNB", 1, 3704, 154, {0, 1}, "BE Warning Switches REAR", "BE Copilot Cannons too Hot Light Knob (Turn)")
definePushButton("C_BE_WL_BIP", 1, 3705, 1094, "BE Warning Switches REAR", "BE Copilot BIP Button")
definePushButton("C_BE_WL_R_LIGHT_BTN", 1, 3859, 1397, "BE Warning Switches REAR", "BE Copilot (C + M or SW) R Light Button (Push)")
definePotentiometer("C_BE_WL_R_LIGHT_KNB", 1, 3859, 630, {0, 1}, "BE Warning Switches REAR", "BE Copilot (C + M or SW) R Light Knob (Turn)")

--Cabin lighting
defineToggleSwitch("C_BE_CL_MISC_L_SW", 1, 3710, 1371, "BE Cabin Lighting REAR", "BE Copilot Miscellaneous Instrument Lighting Switch")
definePotentiometer("C_BE_CL_MAP_BRT_KNB", 1, 3711, 73, {0, 1}, "BE Cabin Lighting REAR", "BE Copilot Map Lighting")
definePotentiometer("C_BE_CL_MISC_BRT_KNB", 1, 3712, 75, {0, 1}, "BE Cabin Lighting REAR", "BE Copilot Miscellaneous Instrument Integral Lighting")

--Lighting control unit
defineToggleSwitch("C_BE_IL_D_N_SEL", 1, 3713, 389, "BE Lighting Control Unit REAR", "BE Copilot Day/Night Selector Switch")
definePotentiometer("C_BE_IL_LIGHT_BRT_KNB", 1, 3714, 390, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Light and Panel Lighting")
definePotentiometer("C_BE_IL_UV_BRT_KNB", 1, 3715, 391, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Ultraviolet Lighting")
definePotentiometer("C_BE_IL_INST_BRT_FLOOD_KNB", 1, 3716, 392, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Dual Instrument Panel Lighting (Flood)")
definePotentiometer("C_BE_IL_INST_BRT_INTEG_KNB", 1, 3717, 393, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Dual Instrument Panel Lighting (Integral)")
definePotentiometer("C_BE_IL_CON_BRT_FLOOD_KNB", 1, 3718, 394, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Dual Console and Pedestal Lighting (Flood)")
definePotentiometer("C_BE_IL_CON_BRT_INTEG_KNB", 1, 3719, 395, {0, 1}, "BE Lighting Control Unit REAR", "BE Copilot Dual Console and Pedestal Lighting (Integral)")

--TACAN
definePushButton("C_BE_TCN_TEST", 1, 3735, 489, "BE TACAN REAR", "BE Copilot TACAN Test Button")
defineToggleSwitch("C_BE_TCN_XY_MODE", 1, 3725, 494, "BE TACAN Control Box REAR", "BE Copilot TACAN X/Y Mode Selector")
defineTumb("C_BE_TCN_FREQ_10100", 1, 3726, 495, 1/13, {0, 0.997}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "0"}, false, "BE TACAN Control Box REAR", "BE Copilot TACAN Frequency Selector 10/100")
defineMultipositionSwitch("C_BE_TCN_MODE", 1, 3727, 496, 4, 0.3333, "BE TACAN Control Box REAR", "BE Copilot TACAN Mode Selector")
defineRadioWheel("C_BE_TCN_FREQ_1", 1, 3729, 497, {-0.1, 0.1}, 488, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "BE TACAN Control Box REAR", "BE Copilot TACAN Frequency Selector 1")

--VOR/ILS control box
defineToggleSwitch("C_BE_VOR_PW_SW", 1, 3730, 512, "BE VOR ILS Control Box REAR", "BE Copilot VOR-ILS Control Unit ON/OFF")
defineRadioWheel("C_BE_VOR_FREQ_MHZ", 1, 3731, 3731, {-0.1, 0.1}, 513, 0.1, {0, 1}, nil, "BE VOR ILS Control Box REAR", "BE Copilot VOR/ILS MHz Frequency Selector")
defineSpringloaded_3PosTumb("C_BE_VOR_TEST", 1, 3733, 3732, 514, "BE VOR ILS Control Box REAR", "BE Copilot VOR/ILS Test Selector")
defineRadioWheel("C_BE_VOR_FREQ_KHZ", 1, 3734, 3734, {-0.1, 0.1}, 515, 0.1, {0, 1}, nil, "BE VOR ILS Control Box REAR", "BE Copilot VOR/ILS kHz Frequency Selector")

--Navigation indicator
defineToggleSwitch("C_BE_NAV_ADD_TARGET", 1, 3910, 1222, "BE Navigation Indicator REAR", "BE Copilot Navigation Additional Target Selector Switch")
defineRotary("C_BE_NAV_BRG_DIST", 1, 3911, 1223, "BE Navigation Indicator REAR", "BE Copilot Navigation Bearing/Distance Selector Knob")

--Oxygen system
definePushButton("C_BE_OXY_TEST", 1, 3740, 521, "BE Oxygen System REAR", "BE Copilot Oxygen Test (T Button)")
defineMultipositionSwitch("C_BE_OXY_N100_EMG", 1, 3741, 1409, 3, 0.5, "BE Oxygen System REAR", "BE Copilot N-100%-EMG Mode Selector Switch")
definePushButton("C_BE_OXY_OVERPRESS", 1, 3742, 1410, "BE Oxygen System REAR", "BE Copilot Oxygen Overpressure Button")
definePushButton("C_BE_OXY_G_CON_CVR", 1, 3743, 1412, "BE Oxygen System REAR", "BE Copilot Anti-G Connection Cover")
definePushButton("C_BE_OXY_G_TEST", 1, 3744, 1413, "BE Oxygen System REAR", "BE Copilot Anti-G Test Button")
defineToggleSwitch("C_BE_OXY_G_VALVE", 1, 3745, 1414, "BE Oxygen System REAR", "BE Copilot Anti-G Valve Cock")
defineToggleSwitch("C_BE_OXY_WARN_CUT", 1, 3858, 157, "BE Oxygen System REAR", "BE Copilot Oxygen Warning Cut-OFF")

--Air conditioning system
defineToggleSwitch("C_BE_AC_M_VALVE_CVR", 1, 3851, 535, "BE Air Conditioning System REAR", "BE Copilot Master Valve Control Switch Guard")
defineToggleSwitch("C_BE_AC_M_VALVE", 1, 3746, 536, "BE Air Conditioning System REAR", "BE Copilot Master Valve Control Switch")
defineToggleSwitch("C_BE_AC_AUTO_MAN_CVR", 1, 3852, 532, "BE Air Conditioning System REAR", "BE Copilot Auto/Manual Selector Switch Guard")
defineToggleSwitch("C_BE_AC_AUTO_MAN", 1, 3747, 533, "BE Air Conditioning System REAR", "BE Copilot Auto/Manual Selector Switch")
defineSpringloaded_3PosTumb("C_BE_AC_HOT_COLD", 1, 3749, 3748, 531, "BE Air Conditioning System REAR", "BE Copilot Hot/Cold Selector Switch")
defineToggleSwitch("C_BE_AC_DEMIST_CVR", 1, 3853, 425, "BE Air Conditioning System REAR", "BE Copilot Demist Switch Guard")
defineToggleSwitch("C_BE_AC_DEMIST", 1, 3750, 426, "BE Air Conditioning System REAR", "BE Copilot Demist Switch")

--Ejection seat
defineSpringloaded_3PosTumb("C_BE_ES_SEAT_HEIGHT", 1, 3756, 3755, 17, "BE Ejection Seat REAR", "BE Copilot Seat Height Adjustment Control")
definePushButton("C_BE_ES_FIRE_HND", 1, 3759, 20, "BE Ejection Seat REAR", "BE Copilot Firing Handle")
definePotentiometer("C_BE_ES_SAFE_PIN", 1, 3794, 1317, {0, 1}, "BE Ejection Seat REAR", "BE Copilot Ejection Handle Safety Pin")

--Accelerometer Reset Button and Rheostat
definePushButton("C_BE_ACCEL_RESET_BTN", 1, 3762, 1400, "BE Accelerometer REAR", "BE Copilot Accelerometer Reset Button (Push)")
definePotentiometer("C_BE_ACCEL_BRT_KNB", 1, 3763, 1399, {0, 1}, "BE Accelerometer REAR", "BE Copilot Accelerometer Rheostat Knob (Turn)")

--Armament Control
defineToggleSwitch("C_BE_ARM_MATRA_JETT_CVR", 1, 3775, 964, "BE Armament Control REAR", "BE Copilot MATRA 550 or Sidewinder Jettison Button Guard")
definePushButton("C_BE_ARM_MATRA_JETT", 1, 3776, 965, "BE Armament Control REAR", "BE Copilot MATRA 550 or Sidewinder Jettison Button")
definePushButton("C_BE_ARM_L_TEST", 1, 3777, 631, "BE Armament Control REAR", "BE Copilot Armament Panel Lights Test")
definePushButton("C_BE_ARM_R_DESELECT", 1, 3635, 419, "BE Armament Control REAR", "BE Copilot (C + M or SW) R Deselection Button")

--Radar
definePushButton("C_BE_RADAR_TEST", 1, 3769, 868, "BE Radar REAR", "BE Copilot Radar Test Button")
definePotentiometer("C_BE_RADAR_SCOPE_INTENT", 1, 3770, 869, {0, 1}, "BE Radar REAR", "BE Copilot Radar Scope Intensity Adjustment")
defineMultipositionSwitch("C_BE_RADAR_FUNC", 1, 3771, 870, 8, 1/7, "BE Radar REAR", "BE Copilot Radar Function Selection")
definePotentiometer("C_BE_RADAR_STORAGE_ADJ", 1, 34772, 871, {0, 1}, "BE Radar REAR", "BE Copilot Radar Storage Adjustment")
definePushButton("C_BE_RADAR_SCOPE_DEL", 1, 3773, 872, "BE Radar REAR", "BE Copilot Radar Scope Erasing")
definePotentiometer("C_BE_RADAR_POLAROID", 1, 3774, 841, {0, 1}, "BE Radar REAR", "BE Copilot Radar Polaroid Screen Adjustment")
definePushButton("C_BE_RADAR_EMERG_TRANS", 1, 3781, 429, "BE Radar REAR", "BE Copilot Radar Emergency Transmission Button")
definePotentiometer("C_BE_RADAR_IND_L_BRT", 1, 3785, 637, {0, 1}, "BE Radar REAR", "BE Copilot Radar Indicator Lights Brightness")
definePotentiometer("C_BE_RADAR_STROBE_BRT", 1, 3786, 638, {0, 1}, "BE Radar REAR", "BE Copilot Radar Strobe Brightness")
definePotentiometer("C_BE_RADAR_DIST_M_BRT", 1, 3787, 639, {0, 1}, "BE Radar REAR", "BE Copilot Radar Distance Markers Brightness")
definePotentiometer("C_BE_RADAR_VEL_M_BRT", 1, 3788, 640, {0, 1}, "BE Radar REAR", "BE Copilot Radar Horizon and Radial Velocity Marker Brightness")
definePotentiometer("C_BE_RADAR_HORIZON_POS", 1, 3789, 641, {0, 1}, "BE Radar REAR", "BE Copilot Radar Horizon Symbol Vertical Position")

--Commutation Panel
definePushButton("C_BE_TCN_PRIO", 1, 3801, 443, "BE Commutation REAR", "BE Copilot TACAN Priority")
definePushButton("C_BE_RAD_PRIO", 1, 3802, 445, "BE Commutation REAR", "BE Copilot RADAR Priority")
definePushButton("C_BE_UHF_PRIO", 1, 3803, 447, "BE Commutation REAR", "BE Copilot V/UHF Priority")
definePushButton("C_BE_ILS_PRIO", 1, 3804, 449, "BE Commutation REAR", "BE Copilot V/ILS Priority")
definePushButton("C_BE_COMMU_TEST", 1, 3805, 451, "BE Commutation REAR", "BE Copilot Commutation Panel Test")

--Sight repeater
defineToggleSwitch("C_BE_SIGHT_REP_PW", 1, 3807, 783, "BE Sight System REAR", "BE Copilot Sight Repeater ON-OFF Switch")
defineToggleSwitch("C_BE_SIGHT_REP_COLOR", 1, 3808, 781, "BE Sight System REAR", "BE Copilot Sight Repeater Color Filter Switch")
defineToggleSwitch("C_BE_SIGHT_REP_DENSE", 1, 3809, 782, "BE Sight System REAR", "BE Copilot Sight Repeater Density Filter Switch")
definePotentiometer("C_BE_SIGHT_REP_BRIGHT", 1, 3810, 779, {0, 1}, "BE Sight System REAR", "BE Copilot Sight Repeater Brightness Adjustment Knob")
definePotentiometer("C_BE_SIGHT_REP_CONTRAST", 1, 3812, 780, {0, 1}, "BE Sight System REAR", "BE Copilot Sight Repeater Contrast Adjustment Knob")

--Recording Camera
defineToggleSwitch("C_BE_REC_CAM_BRIGHT", 1, 3819, 1420, "BE Recording Camera REAR", "BE Copilot Recording Camera DAY/NIGHT Brightness Switch")
definePushButton("C_BE_TIMER_TEST", 1, 3820, 1421, "BE Recording Camera REAR", "BE Copilot Countdown Timer and Camera Operation Test Button")
defineSetCommandTumb("C_BE_REC_CAM_RETARD", 1, 3821, 778, 0.25, {0, 1}, nil, false, "BE V/UHF Control Unit REAR", "BE Copilot Recording Camera Retard Knob")
definePushButton("C_BE_REC_CAM_JETT", 1, 3822, 1422, "BE Recording Camera REAR", "BE Copilot Recording Camera Eject Button")

BIOS.protocol.endModule()