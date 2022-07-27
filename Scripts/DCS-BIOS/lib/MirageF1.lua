BIOS.protocol.beginModule("MirageF1", 0x8600)
BIOS.protocol.setExportModuleAircrafts({"Mirage-F1CE"})
--by WarLord (aka BlackLibrary) v1.0
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local define3PosTumb = BIOS.util.define3PosTumb
local defineSpringloaded_3_pos_tumb = BIOS.util.defineSpringloaded_3_pos_tumb
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineRadioWheel = BIOS.util.defineRadioWheel

----Common
defineToggleSwitch("P_STICK_HIDE", 1, 3001, 34, "COMMON Misc", "Pilot Hide Stick Toggle")
defineSpringloaded_3_pos_tumb("P_INCIDENCE_TEST", 1, 3011, 3010, 98, "COMMON Misc", "Pilot Incidence Test Switch")
definePushButton("P_ALT_PTT", 1, 3118, 405, "Misc", "COMMON Pilot Alternative PTT")

--Flight Control System controls
definePushButton("P_FC_TEST_RES", 1, 3012, 368, "COMMON Flight Control System", "Pilot Flight Control Test Restart Button")
defineToggleSwitch("P_FC_TEST_CV", 1, 3013, 369, "COMMON Flight Control System", "Pilot Flight Control Test Switch Guard")
defineToggleSwitch("P_FC_TEST", 1, 3014, 370, "COMMON Flight Control System", "Pilot Flight Control Test Switch")
definePushButton("P_FCS_SERVO_RES", 1, 3020, 89, "COMMON Flight Control System", "Pilot Servo Reset Button")
defineToggleSwitch("P_FCS_STICK_UNCOUPLE_CV", 1, 3022, 95, "COMMON Flight Control System", "Pilot Stick Uncouple Switch Guard")
defineToggleSwitch("P_FCS_STICK_UNCOUPLE", 1, 3021, 97, "COMMON Flight Control System", "Pilot Stick Uncouple Switch")
defineToggleSwitch("P_FCS_ARTHUR_SEL_CV", 1, 3023, 94, "COMMON Flight Control System", "Pilot ARTHUR Selector Switch Guard")
defineMultipositionSwitch("P_FCS_ARTHUR_SEL", 1, 3024, 96, 3, 0.5, "COMMON Flight Control System", "Pilot ARTHUR Selector Switch")
defineMultipositionSwitch("P_FCS_YAW_ANTISLIP", 1, 3025, 90, 3, 0.5, "COMMON Flight Control System", "Pilot Yaw/Anti-Slip Switch")
defineToggleSwitch("P_FCS_PITCH_SW", 1, 3026, 91, "COMMON Flight Control System", "Pilot Pitch Switch")
defineSpringloaded_3_pos_tumb("P_FCS_RUDDER_TRIM", 1, 3027, 3028, 406, "COMMON Flight Control System", "Pilot Rudder Trim Control Switch")
definePushButton("P_FCS_AP_PA_BTN", 1, 3035, 974, "COMMON Flight Control System", "Pilot Autopilot PA Button")
definePushButton("P_FCS_AP_ALT_BTN", 1, 3036, 977, "COMMON Flight Control System", "Pilot Autopilot ALT Button")
definePushButton("P_FCS_AP_CAP_BTN", 1, 3037, 980, "COMMON Flight Control System", "Pilot Autopilot CAP Button")
definePushButton("P_FCS_AP_R_BTN", 1, 3038, 982, "COMMON Flight Control System", "Pilot Autopilot R Button")
definePushButton("P_FCS_AP_G_BTN", 1, 3039, 987, "COMMON Flight Control System", "Pilot Autopilot G Button")
defineRotary("P_FCS_AP_INT", 1, 3041, 992, "COMMON Flight Control System", "Pilot Autopilot Intensity Control")
definePushButton("P_FCS_AP_TEST_BTN", 1, 3042, 973, "COMMON Flight Control System", "Pilot Autopilot Control and Indicator Unit Test Button")

--Engine and Fuel Controls
definePushButton("P_EFC_THL_CUT_IDLE", 1, 3051, 239, "COMMON Engine-Fuel Control", "Pilot Throttle Cut/Idle Switch")
definePushButton("P_EFC_ENG_RELIGHT", 1, 3052, 240, "COMMON Engine-Fuel Control", "Pilot In-flight Relight Control")
define3PosTumb("P_EFC_ING_VENT_SEL", 1, 3053, 376, "COMMON Engine-Fuel Control", "Pilot Ignition/Ventilation Selector Switch")
defineToggleSwitch("P_EFC_START_CV", 1, 3054, 374, "COMMON Engine-Fuel Control", "Pilot Start Button Cover")
definePushButton("P_EFC_START", 1, 3055, 375, "COMMON Engine-Fuel Control", "Pilot Start Button")
defineToggleSwitch("P_EFC_LP_MAIN_CV", 1, 3056, 380, "COMMON Engine-Fuel Control", "Pilot LP Main Cock Switch Guard")
defineToggleSwitch("P_EFC_LP_MAIN", 1, 3057, 381, "COMMON Engine-Fuel Control", "Pilot LP Main Cock Switch")
defineToggleSwitch("P_EFC_JPT_EMERG", 1, 3062, 396, "COMMON Engine-Fuel Control", "Pilot JPT Emergency Regulation Switch")
defineToggleSwitch("P_EFC_AB_MAIN_CV", 1, 3063, 397, "COMMON Engine-Fuel Control", "Pilot A/B Main Cock Switch Guard")
defineToggleSwitch("P_EFC_AB_MAIN", 1, 3064, 398, "COMMON Engine-Fuel Control", "Pilot A/B Main Cock Switch")
defineToggleSwitch("P_EFC_PUMP_START", 1, 3065, 377, "COMMON Engine-Fuel Control", "Pilot Starting Pump Switch")
defineToggleSwitch("P_EFC_PUMP_LP_R", 1, 3066, 378, "COMMON Engine-Fuel Control", "Pilot R/H LP Pump Switch")
defineToggleSwitch("P_EFC_PUMP_LP_L", 1, 3067, 379, "COMMON Engine-Fuel Control", "Pilot L/H LP Pump Switch")
defineSpringloaded_3_pos_tumb("P_EFC_SHOCK_CONE_MAN", 1, 3069, 3068, 754, "COMMON Engine-Fuel Control", "Pilot Shock-Cone Manual Control Switch")
definePushButton("P_EFC_SHOCK_CONE", 1, 3070, 755, "COMMON Engine-Fuel Control", "Pilot Shock-Cone Pushbutton")
defineToggleSwitch("P_EFC_FIRE_FUEL_DIP", 1, 3071, 591, "COMMON Engine-Fuel Control", "Pilot Firing Fuel Dipper Switch")
defineToggleSwitch("P_EFC_FEEDER_SEL", 1, 3075, 1144, "COMMON Engine-Fuel Control", "Pilot Feeder Tank/Fuselage Selector Switch")
definePushButton("P_EFC_FUEL_G_TEST", 1, 3076, 1145, "COMMON Engine-Fuel Control", "Pilot Fuel Gauge Test Button")

--Jettison Panel
defineToggleSwitch("P_JETT_EMERG_CV", 1, 3077, 966, "COMMON Jettison Panel", "Pilot Emergency Jettison Button Guard")
definePushButton("P_JETT_EMERG", 1, 3078, 967, "COMMON Jettison Panel", "Pilot Emergency Jettison Button")
defineToggleSwitch("P_JETT_SEL_CV", 1, 3079, 968, "COMMON Jettison Panel", "Pilot Selective Jettison Button Guard")
definePushButton("P_JETT_SEL", 1, 3080, 969, "COMMON Jettison Panel", "Pilot Selective Jettison Button")
define3PosTumb("P_JETT_SEL_SW", 1, 3081, 970, "COMMON Jettison Panel", "Pilot Jettison Selector Switch")

--Fuel Transfer, Refuelling and Indication
defineRotary("P_FS_QUANT_RES", 1, 3082, 1150, "COMMON Fuel System", "Pilot Fuel Quantity Reset Thumbwheel")
defineToggleSwitch("P_FS_CROSSFEED", 1, 3083, 1151, "COMMON Fuel System", "Pilot Crossfeed Switch")
defineToggleSwitch("P_FS_EMERG_TRANS", 1, 3084, 1152, "COMMON Fuel System", "Pilot Emergency Transfer Switch")
defineToggleSwitch("P_FS_TRANS_SEQ_SEL", 1, 3085, 1153, "COMMON Fuel System", "Pilot Fuel Transfer Sequence Selector Switch")
definePushButton("P_FS_TRANS_IND_TEST", 1, 3086, 1166, "COMMON Fuel System", "Pilot Fuel Transfer Indicator Test")

--Radar Control Stick
definePushButton("P_RCS_ALT_DIFF", 1, 3100, 259, "COMMON Radar Control Stick", "Pilot Radar Control Stick Elevation/Altitude Difference Button")
defineMultipositionSwitch("P_RCS_SCALE_SEL", 1, 3101, 258, 4, 1/3, "COMMON Radar Control Stick", "Pilot Radar Control Stick Scale Selection")
defineMultipositionSwitch("P_RCS_SCAN_SEL", 1, 3102, 257, 3, 0.5, "COMMON Radar Control Stick", "Pilot Radar Control Stick Scan Selection")

--High-Lift Devices
defineMultipositionSwitch("P_HLD_FLAP_SLAT", 1, 3120, 248, 3, 0.5, "COMMON High-Lift Devices", "Pilot Slat/Flap Lever")
define3PosTumb("P_HLD_SEL", 1, 3121, 399, "COMMON High-Lift Devices", "Pilot High-Lift Devices Selector Switch")

defineIndicatorLight("P_L_SLAT_G_L", 1083, "COMMON High-Lift Devices Lights", "Pilot Slats Light (green)")
defineIndicatorLight("P_L_SLAT_Y_L", 1084, "COMMON High-Lift Devices Lights", "Pilot Slats Light (yellow)")
defineIndicatorLight("P_L_SLAT_R_L", 1085, "COMMON High-Lift Devices Lights", "Pilot Slats Light (red)")
defineIndicatorLight("P_L_FLAP_R_L", 1086, "COMMON High-Lift Devices Lights", "Pilot Flaps Light (red)")
defineIndicatorLight("P_L_FLAP_Y_L", 1087, "COMMON High-Lift Devices Lights", "Pilot Flaps Light (yellow)")
defineIndicatorLight("P_L_FLAP_G_L", 1088, "COMMON High-Lift Devices Lights", "Pilot Flaps Light (green)")
defineIndicatorLight("P_L_FREIN_L", 1089, "COMMON High-Lift Devices Lights", "Pilot FREIN Light (yellow)")

--Radio selector unit
definePotentiometer("P_RADIO_MISS", 1, 3122, 306, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio MISS Potentiometer")
definePotentiometer("P_RADIO_TAC", 1, 3123, 307, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio TAC Potentiometer")
definePotentiometer("P_RADIO_VOR", 1, 3124, 308, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio VOR Potentiometer")
defineToggleSwitch("P_RADIO_AMPLI", 1, 3125, 309, "COMMON Radio Selector Unit", "Pilot Radio AMPLI 2-1 Selector Switch")
definePushButton("P_RADIO_U_V_BTN", 1, 3126, 310, "COMMON Radio Selector Unit", "Pilot Radio U+V Knob (Push)")
definePotentiometer("P_RADIO_U_V_KNB", 1, 3127, 311, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio U+V Knob (Turn)")
definePushButton("P_RADIO_U_BTN", 1, 3128, 313, "COMMON Radio Selector Unit", "Pilot Radio U Knob (Push)")
definePotentiometer("P_RADIO_U_KNB", 1, 3129, 314, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio U Knob (Turn)")
definePushButton("P_RADIO_RAP_CME_BTN", 1, 3130, 316, "COMMON Radio Selector Unit", "Pilot Radio RAP+CME Knob (Push)")
definePotentiometer("P_RADIO_RAP_CME_KNB", 1, 3131, 317, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio RAP+CME Knob (Turn)")
definePushButton("P_RADIO_MKR_TP_BTN", 1, 3132, 319, "COMMON Radio Selector Unit", "Pilot Radio MKR+TP Knob (Push)")
definePotentiometer("P_RADIO_MKR_TP_KNB", 1, 3133, 320, {0, 1}, "COMMON Radio Selector Unit", "Pilot Radio MKR+TP Knob (Turn)")

--V/UHF radio control unit (TRT - TRAP 136)
define3PosTumb("P_VUHF_TEST", 1, 3136, 272, "COMMON V/UHF Control Unit", "Pilot V/UHF Test Selector Switch")
defineToggleSwitch("P_VUHF_SIL", 1, 3137, 273, "COMMON V/UHF Control Unit", "Pilot V/UHF SIL Switch")
defineSetCommandTumb("P_VUHF_FREQ_100", 1, 3138, 274, 0.1, {0, 0.3}, {"1", "2", "3"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 100")
defineSetCommandTumb("P_VUHF_FREQ_10", 1, 3139, 275, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 10")
defineSetCommandTumb("P_VUHF_FREQ_1", 1, 3140, 276, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 1")
defineSetCommandTumb("P_VUHF_FREQ_01", 1, 3141, 277, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 0.1")
defineSetCommandTumb("P_VUHF_FREQ_0025", 1, 3142, 278, 0.333, {0, 1}, {"00", "25", "50", "75"}, false, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 0.025")
defineSetCommandTumb("P_VUHF_FUNC_SEL", 1, 3143, 280, 0.2, {0, 0.8}, nil, true, "COMMON V/UHF Control Unit", "Pilot V/UHF Function Selector")
defineToggleSwitch("P_VUHF_25_5_SW", 1, 3144, 281, "COMMON V/UHF Control Unit", "Pilot V/UHF 25W - 5W Switch")
defineMultipositionSwitch("P_VUHF_FREQ_SEL", 1, 3145, 282, 3, 0.5, "COMMON V/UHF Control Unit", "Pilot V/UHF Frequency Selector Switch")
defineRadioWheel("P_VUHF_CHAN", 1, 3146, 3146, {-0.05, 0.05}, 283, 0.05, {0, 1}, {" 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", " 1", " 2", " 3", " 4", " 5"}, "COMMON V/UHF Control Unit", "Pilot V/UHF Channel Selector")

--Engine Emergency Regulation
definePushButton("P_EER_REG_L_BTN", 1, 3165, 354, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Light Knob (Push)")
definePotentiometer("P_EER_REG_L_KNB", 1, 3166, 355, {0, 1}, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Light Knob (Turn)")
defineToggleSwitch("P_EER_SW_CV", 1, 3167, 357, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Switch Guard")
defineToggleSwitch("P_EER_SW", 1, 3168, 358, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Switch")
defineSpringloaded_3_pos_tumb("P_EER_CONTROL", 1, 3170, 3169, 359, "COMMON Engine Emergency Regulation", "Pilot Emergency Regulation Control Lever")
defineToggleSwitch("P_EER_BRAKE_CHUTE", 1, 3171, 54, "COMMON Engine Emergency Regulation", "Pilot Brake Chute Control")

--Canopy controls
defineToggleSwitch("P_CANOPY_LOCK", 1, 3172, 55, "COMMON Canopy", "Pilot Canopy Lock Control")
definePushButton("P_CANOPY_EMBRITTLE", 1, 3173, 56, "COMMON Canopy", "Pilot Canopy Embrittle Control")
defineToggleSwitch("P_CANOPY_HINGE", 1, 3174, 3, "COMMON Canopy", "Pilot Canopy Hinged Handle")
defineToggleSwitch("P_CANOPY_SEAL", 1, 3175, 233, "COMMON Canopy", "Pilot Canopy Seal Valve Control Lever")
defineToggleSwitch("P_CANOPY_MIRRORS", 1, 3176, 2, "COMMON Canopy", "Pilot Mirrors")
defineToggleSwitch("P_CANOPY_OPEN", 1, 3178, 1, "COMMON Canopy", "Pilot Canopy Open/Close")

defineFloat("CANOPY_POS", 1, {0, 1}, "COMMON Canopy Gauges", "Canopy Position")

--Undercarriage, nose wheel steering, brake and anti-skid
defineToggleSwitch("P_U_SAFE_LVR", 1, 3190, 85, "COMMON Undercarriage NWS Brake", "Pilot U/C Safety Lever")
defineToggleSwitch("P_U_CONTROL_LVR", 1, 3191, 86, "COMMON Undercarriage NWS Brake", "Pilot U/C Control Lever")
definePushButton("P_U_ANTI_RETRAC_OVER", 1, 3192, 87, "COMMON Undercarriage NWS Brake", "Pilot Anti-Retraction Override Button")
defineToggleSwitch("P_U_PARK_EMERG_BRAKE", 1, 3193, 84, "COMMON Undercarriage NWS Brake", "Pilot Emergency/Parking Brake Handle")
defineToggleSwitch("P_U_ANTI_SKID_CV", 1, 3194, 402, "COMMON Undercarriage NWS Brake", "Pilot Anti-Skid (SPAD) Switch Guard")
defineToggleSwitch("P_U_ANTI_SKID", 1, 3195, 403, "COMMON Undercarriage NWS Brake", "Pilot Anti-Skid (SPAD) Switch")
definePushButton("P_U_NWS_SENSI", 1, 3196, 756, "COMMON Undercarriage NWS Brake", "Pilot Nose Wheel Steering High Sensitivity Button")
defineToggleSwitch("P_U_NWS_STEER_CV", 1, 3197, 757, "COMMON Undercarriage NWS Brake", "Pilot Nose Wheel Steering Switch Guard")
defineToggleSwitch("P_U_NWS_STEER", 1, 3198, 758, "COMMON Undercarriage NWS Brake", "Pilot Nose Wheel Steering Switch")
defineMultipositionSwitch("P_U_EMERG_UC", 1, 3199, 107, 3, 0.5, "COMMON Undercarriage NWS Brake", "Pilot Emergency U/C Handle")

--Hydraulic System Controls
defineToggleSwitch("P_HSC_PRESS_SEL", 1, 3200, 88, "COMMON Hydraulic System Controls", "Pilot Hydraulic Pressure Selector Switch")
defineToggleSwitch("P_HSC_EL_PUMP", 1, 3201, 475, "COMMON Hydraulic System Controls", "Pilot Electro-Pump Switch")

-- Clock
definePushButton("P_CLOCK_SET_KNB", 1, 3202, 232, "COMMON Clock", "Pilot Chronometer Starting Control and Clock Setting Knob")
defineRotary("P_CLOCK_WIND_KNB", 1, 3203, 67, "COMMON Clock", "Pilot Chronometer Starting Control and Clock Winding Knob")
defineToggleSwitch("P_CLOCK_WIND_LVR", 1, 3204, 231, "COMMON Clock", "Pilot Clock Winding/Setting Lever")

--Air Data Instrument Controls
definePotentiometer("P_ADI_SPEED_KNB", 1, 3206, 1270, {0, 1}, "COMMON Air Data Instrument Controls", "Pilot Mach/Airspeed Indicator Reference Airspeed Knob")
defineRotary("P_ADI_ALT_BARO_SLAVE", 1, 3207, 1053, "COMMON Air Data Instrument Controls", "Pilot Slaved Altimeter Barometric Pressure Setting Knob")
defineRotary("P_ADI_ALT_BARO_STBY", 1, 3208, 1072, "COMMON Air Data Instrument Controls", "Pilot Standby Altimeter Barometric Pressure Setting Knob")
defineToggleSwitch("P_ADI_PROBE_HEAT", 1, 3209, 477, "COMMON Air Data Instrument Controls", "Pilot Probe Heater Switch")

--Heading and vertical reference system and standby horizon controls
defineToggleSwitch("P_FRS_STBY_HORIZON", 1, 3230, 474, "COMMON Flight Ref System", "Pilot Standby Horizon Switch")
definePotentiometer("P_FRS_SPHER_IND_DN", 1, 3231, 1116, {0, 1}, "COMMON Flight Ref System", "Pilot Spherical Indicator Day/Night Selector Switch")
definePushButton("P_FRS_SPHER_IND_MB_BTN", 1, 3232, 202, "COMMON Flight Ref System", "Pilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Push)")
definePotentiometer("P_FRS_SPHER_IND_MB_KNB", 1, 3233, 1117, {0, 1}, "COMMON Flight Ref System", "Pilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Turn)")
definePushButton("P_FRS_STBY_HORIZON_UNCAGE_BTN", 1, 3234, 1132, "COMMON Flight Ref System", "Pilot Standby Horizon Uncage and Aircraft Model Control (Push)")
definePotentiometer("P_FRS_STBY_HORIZON_UNCAGE_KNB", 1, 3235, 1133, {0, 1}, "COMMON Flight Ref System", "Pilot Standby Horizon Uncage and Aircraft Model Control (Turn)")
defineMultipositionSwitch("P_FRS_HDG_REF_SYS", 1, 3236, 537, 4, 0.3333, "COMMON Flight Ref System", "Pilot Heading and Vertical Reference System Control Switch")
defineToggleSwitch("P_FRS_EMERG_GYRO", 1, 3237, 538, "COMMON Flight Ref System", "Pilot Emergency Gyromagnetic Compass Switch")
definePushButton("P_FRS_HDG_EREC", 1, 3238, 540, "COMMON Flight Ref System", "Pilot Heading Control Unit Erection Button")

defineIndicatorLight("P_FRS_SPHER_IND_DN_L", 1279, "COMMON Flight Ref System Lights", "Pilot Spherical Indicator Day/Night Light (yellow)")

--Electrical System Controls
defineToggleSwitch("P_EL_BATT", 1, 3250, 113, "COMMON Electrical System Controls", "Pilot Battery Switch")
defineToggleSwitch("P_EL_GEN1", 1, 3251, 114, "COMMON Electrical System Controls", "Pilot Alternator 1 Switch")
defineToggleSwitch("P_EL_GEN2", 1, 3252, 115, "COMMON Electrical System Controls", "Pilot Alternator 2 Switch")
definePushButton("P_EL_TR_RESET", 1, 3253, 116, "COMMON Electrical System Controls", "Pilot TR Reset Button")
defineSpringloaded_3_pos_tumb("P_EL_INVERT_SEL", 1, 3255, 3254, 117, "COMMON Electrical System Controls", "Pilot Inverter Selector Switch")

--Warning Light Switches
definePushButton("P_WL_M_FAIL", 1, 3265, 920, "COMMON Warning Switches", "Pilot Master Failure Warning Light Button")
definePushButton("P_WL_C_FLAP_BTN", 1, 3266, 956, "COMMON Warning Switches", "Pilot Combat Flaps Light Button (Push)")
definePotentiometer("P_WL_C_FLAP_KNB", 1, 3267, 957, {0, 1}, "COMMON Warning Switches", "Pilot Combat Flaps Light Knob (Turn)")
definePushButton("P_WL_UC_BTN", 1, 3265, 920, "COMMON Warning Switches", "Pilot U/C Light Button")
definePushButton("P_WL_NWS_BTN", 1, 3269, 950, "COMMON Warning Switches", "Pilot Nose Wheel Steering Light Button (Push)")
definePotentiometer("P_WL_NWS_KNB", 1, 3270, 951, {0, 1}, "COMMON Warning Switches", "Pilot Nose Wheel Steering Light Knob (Turn)")
definePushButton("P_WL_AIR_B_BTN", 1, 3271, 944, "COMMON Warning Switches", "Pilot Airbrake Light Button (Push)")
definePotentiometer("P_WL_AIR_B_KNB", 1, 3272, 945, {0, 1}, "COMMON Warning Switches", "Pilot Airbrake Light Knob (Turn)")
definePushButton("P_WL_LIMIT_WARN", 1, 3273, 932, "COMMON Warning Switches", "Pilot Limit Warning Light Button")
definePushButton("P_WL_FIRE_WARN", 1, 3274, 940, "COMMON Warning Switches", "Pilot Fire Warning Light (ENG/AB) Button")
definePushButton("P_WL_AB_INJ", 1, 3275, 1029, "COMMON Warning Switches", "Pilot A/B INJ Light Button")
definePushButton("P_WL_AB_ON", 1, 3276, 1031, "COMMON Warning Switches", "Pilot A/B ON Light Button")
definePushButton("P_WL_AB_SRL", 1, 3277, 1033, "COMMON Warning Switches", "Pilot A/B SRL Light Button")
definePushButton("P_WL_STBY_RECEPT_BTN", 1, 3278, 92, "COMMON Warning Switches", "Pilot Standby Receptacle Light Button (Push)")
definePotentiometer("P_WL_STBY_RECEPT_KNB", 1, 3279, 93, {0, 1}, "COMMON Warning Switches", "Pilot Standby Receptacle Light Knob (Turn)")
definePushButton("P_WL_BIP", 1, 3290, 1081, "COMMON Warning Switches", "Pilot BIP Button")
definePushButton("P_WL_CONFIG_TEST", 1, 3280, 1082, "COMMON Warning Switches", "Pilot Configuration Indicator Test Button")
definePushButton("P_WL_FAIL_T_TEST", 1, 3281, 118, "COMMON Warning Switches", "Pilot Failure Warning Panel T Test Button")
definePushButton("P_WL_FAIL_O2_TEST", 1, 3282, 119, "COMMON Warning Switches", "Pilot Failure Warning Panel O2 Test Button")
defineToggleSwitch("P_WL_WARN_HORN", 1, 3283, 476, "COMMON Warning Switches", "Pilot Warning Horn Switch")
definePushButton("P_WL_JAMMER_BTN", 1, 3284, 194, "COMMON Warning Switches", "Pilot Jammer Detection Light Button (Push)")
definePotentiometer("P_WL_JAMMER_KNB", 1, 3285, 194, {0, 1}, "COMMON Warning Switches", "Pilot Jammer Detection Light Knob (Turn)")
definePushButton("P_WL_R_LIGHT_BTN", 1, 3286, 197, "COMMON Warning Switches", "Pilot (C + M or SW) R Light Button (Push)")
definePotentiometer("P_WL_R_LIGHT_KNB", 1, 3287, 198, {0, 1}, "COMMON Warning Switches", "Pilot (C + M or SW) R Light Knob (Turn)")
definePushButton("P_WL_CAN_HOT_BTN", 1, 3288, 108, "COMMON Warning Switches", "Pilot Cannons too Hot Light Button (Push)")
definePotentiometer("P_WL_CAN_HOT_KNB", 1, 3289, 109, {0, 1}, "COMMON Warning Switches", "Pilot Cannons too Hot Light Knob (Turn)")

defineIndicatorLight("P_WL_M_FAIL_L_L", 921, "COMMON Warning Switches Lights", "Pilot Master Failure PANNE Light Left (red)")
defineIndicatorLight("P_WL_M_FAIL_R_L", 921, "COMMON Warning Switches Lights", "Pilot Master Failure PANNE Light Right (yellow)")
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
defineMultipositionSwitch("P_EXL_LAND_CTRL", 1, 3305, 353, 3, 0.5, "COMMON Exterior Lighting", "Pilot Landing Light Control")
defineMultipositionSwitch("P_EXL_FORM_CTRL", 1, 3306, 112, 3, 0.5, "COMMON Exterior Lighting", "Pilot Formation Light Control")
defineMultipositionSwitch("P_EXL_NAV_CTRL", 1, 3307, 111, 3, 0.5, "COMMON Exterior Lighting", "Pilot Navigation Light Control")
defineToggleSwitch("P_EXL_SEARCH_CTRL", 1, 3308, 479, "COMMON Exterior Lighting", "Pilot Search Light Control")

--Cabin lighting
defineToggleSwitch("P_CL_MISC_L_SW", 1, 3309, 470, "COMMON Cabin Lighting", "Pilot Miscellaneous Instrument Lighting Switch")
definePotentiometer("P_CL_MAP_BRT_KNB", 1, 3310, 66, {0, 1}, "COMMON Cabin Lighting", "Pilot Map Lighting")
definePotentiometer("P_CL_MISC_BRT_KNB", 1, 3311, 68, {0, 1}, "COMMON Cabin Lighting", "Pilot Miscellaneous Instrument Integral Lighting")

--Lighting Control Unit
defineToggleSwitch("P_IL_D_N_SEL", 1, 3312, 382, "COMMON Lighting Control Unit", "Pilot Day/Night Selector Switch")
definePotentiometer("P_IL_LIGHT_BRT_KNB", 1, 3313, 383, {0, 1}, "COMMON Lighting Control Unit", "Pilot Light and Panel Lighting")
definePotentiometer("P_IL_UV_BRT_KNB", 1, 3314, 384, {0, 1}, "COMMON Lighting Control Unit", "Pilot Ultraviolet Lighting")
definePotentiometer("P_IL_INST_BRT_FLOOD_KNB", 1, 3315, 385, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Instrument Panel Lighting (Flood)")
definePotentiometer("P_IL_INST_BRT_INTEG_KNB", 1, 3316, 386, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Instrument Panel Lighting (Integral)")
definePotentiometer("P_IL_CON_BRT_FLOOD_KNB", 1, 3317, 387, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Console and Pedestal Lighting (Flood)")
definePotentiometer("P_IL_CON_BRT_INTEG_KNB", 1, 3318, 388, {0, 1}, "COMMON Lighting Control Unit", "Pilot Dual Console and Pedestal Lighting (Integral)")
definePotentiometer("P_IL_INCIDENCE_BRT_KNB", 1, 3205, 201, {0, 1}, "COMMON Lighting Control Unit", "Pilot Incidence Indicator Lighting")

defineFloat("P_IL_UV_L", 1294, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Ultraviolet Lights (white)")
defineFloat("P_IL_MISC_INSTR_L", 1295, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Misc Instrument Lights (red)")
defineFloat("P_IL_INST_L", 1296, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Instrument Lights (red)")
defineFloat("P_IL_CONSOLE_L", 1297, {0, 1}, "COMMON Lighting Control Unit Lights", "Pilot Console Lights (red)")

--TACAN Control Box
definePushButton("P_TCN_TEST", 1, 3347, 480, "COMMON TACAN Control Box", "Pilot TACAN Test Button")
defineToggleSwitch("P_TCN_XY_MODE", 1, 3335, 485, "COMMON TACAN Control Box", "Pilot TACAN X/Y Mode Selector")
defineTumb("P_TCN_FREQ_10100", 1, 3336, 486, 1/13, {0, 0.997}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "0"}, false, "COMMON TACAN Control Box", "Pilot TACAN Frequency Selector 10/100")
defineMultipositionSwitch("P_TCN_MODE", 1, 3337, 487, 4, 0.3333, "COMMON TACAN Control Box", "Pilot TACAN Mode Selector")
defineRadioWheel("P_TCN_FREQ_1", 1, 3338, 3338, {-0.1, 0.1}, 488, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9"}, "COMMON TACAN Control Box", "Pilot TACAN Frequency Selector 1")

defineFloat("P_TCN_XY_G", 481, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN X/Y Gauge")
defineFloat("P_TCN_100_G", 482, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN 100 Gauge")
defineFloat("P_TCN_10_G", 483, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN 10 Gauge")
defineFloat("P_TCN_1_G", 484, {0, 1}, "COMMON TACAN Gauges", "Pilot TACAN 1 Gauge")

defineIndicatorLight("P_TCN_WARN_L", 1312, "COMMON TACAN Lights", "Pilot TACAN WARN Light (red)")
defineIndicatorLight("P_TCN_GO_L", 1313, "COMMON TACAN Lights", "Pilot TACAN GO Light (green)")

--VOR/ILS Control Box
defineToggleSwitch("P_VOR_PW_SW", 1, 3339, 503, "COMMON VOR ILS Control Box", "Pilot VOR-ILS Control Unit ON/OFF")
defineRadioWheel("P_VOR_FREQ_MHZ", 1, 3340, 3340, {-0.1, 0.1}, 504, 0.1, {0, 1}, nil, "COMMON VOR ILS Control Box", "Pilot VOR/ILS MHz Frequency Selector")
defineSpringloaded_3_pos_tumb("P_VOR_TEST", 1, 3342, 3341, 505, "COMMON VOR ILS Control Box", "Pilot VOR/ILS Test Selector")
defineRadioWheel("P_VOR_FREQ_KHZ", 1, 3343, 3343, {-0.1, 0.1}, 506, 0.1, {0, 1}, nil, "COMMON VOR ILS Control Box", "Pilot VOR/ILS kHz Frequency Selector")
definePotentiometer("P_VOR_OMNI_SEL", 1, 3344, 545, {0, 1}, "COMMON VOR ILS Control Box", "Pilot Omnibearing Selector")
defineMultipositionSwitch("P_VOR_MODE", 1, 3345, 544, 3, 0.5, "COMMON VOR ILS Control Box", "Pilot VOR/ILS/OFF/TACAN Selector")
defineRotary("P_VOR_HDG_SEL", 1, 3346, 547, "COMMON VOR ILS Control Box", "Pilot Heading Selector Knob")

--Oxygen System
definePushButton("P_OXY_TEST", 1, 3360, 517, "COMMON Oxygen System", "Pilot Oxygen Test (T Button)")
definePushButton("P_OXY_TEST_P", 1, 3361, 519, "COMMON Oxygen System", "Pilot Oxygen Test Button")
definePushButton("P_OXY_OVERPRESS", 1, 3363, 710, "COMMON Oxygen System", "Pilot Oxygen Overpressure Button")
defineMultipositionSwitch("P_OXY_N100_EMG", 1, 3362, 709, 3, 0.5, "COMMON Oxygen System", "Pilot N-100%-EMG Mode Selector Switch")
definePushButton("P_OXY_G_CON_CVR", 1, 3364, 712, "COMMON Oxygen System", "Pilot Anti-G Connection Cover")
definePushButton("P_OXY_G_TEST", 1, 3365, 713, "COMMON Oxygen System", "Pilot Anti-G Test Button")
defineToggleSwitch("P_OXY_G_VALVE", 1, 3366, 714, "COMMON Oxygen System", "Pilot Anti-G Valve Cock")

--Air Conditioning System
defineToggleSwitch("P_AC_EMERG_COLD", 1, 3375, 524, "COMMON Air Conditioning System", "Pilot Emergency Cold Switch")
defineToggleSwitch("P_AC_M_VALVE", 1, 3376, 525, "COMMON Air Conditioning System", "Pilot Master Valve Control Switch")
definePotentiometer("P_AC_TEMP", 1, 3377, 527, {0, 1}, "COMMON Air Conditioning System", "Pilot Temperature Control Rheostat")
defineToggleSwitch("P_AC_AUTO_MAN", 1, 3378, 529, "COMMON Air Conditioning System", "Pilot Auto/Manual Selector Switch")
defineSpringloaded_3_pos_tumb("P_AC_HOT_COLD", 1, 3380, 3379, 530, "COMMON Air Conditioning System", "Pilot Hot/Cold Selector Switch")
defineToggleSwitch("P_AC_RAM_AIR_CV", 1, 3381, 410, "COMMON Air Conditioning System", "Pilot Ram Air Switch Guard")
defineToggleSwitch("P_AC_RAM_AIR", 1, 3382, 411, "COMMON Air Conditioning System", "Pilot Ram Air Switch")
defineToggleSwitch("P_AC_DEMIST", 1, 3383, 412, "COMMON Air Conditioning System", "Pilot Demist Switch")

--Circuit Breaker
defineToggleSwitch("P_CB_GYRO_CONTR", 1, 3395, 548, "COMMON Circuit Breaker", "Pilot CB Gyro Control Unit Power Supply")
defineToggleSwitch("P_CB_HLIFT_SERVO", 1, 3396, 550, "COMMON Circuit Breaker", "Pilot CB High-Lift Device Servo Unit Power Supply")
defineToggleSwitch("P_CB_IND_FAIL", 1, 3397, 552, "COMMON Circuit Breaker", "Pilot CB Indicator and Failure Detector Power Supply")
defineToggleSwitch("P_CB_INVERT_TRANS", 1, 3398, 554, "COMMON Circuit Breaker", "Pilot CB Inverter Transfer Unit Power Supply and Control")
defineToggleSwitch("P_CB_HYYD_PRESS_G", 1, 3399, 556, "COMMON Circuit Breaker", "Pilot CB Dual Hydraulic Pressure Gauge Power Supply")
defineToggleSwitch("P_CB_GUN_TRIG", 1, 3400, 558, "COMMON Circuit Breaker", "Pilot CB Gun firing Trigger Power Supply")
defineToggleSwitch("P_CB_LP_COCK", 1, 3401, 560, "COMMON Circuit Breaker", "Pilot CB LP Cock Power Supply")
defineToggleSwitch("P_CB_EL_PUMP", 1, 3402, 562, "COMMON Circuit Breaker", "Pilot CB Electro-Pump Relay Power Supply")
defineToggleSwitch("P_CB_REFUEL_SYS", 1, 3403, 564, "COMMON Circuit Breaker", "Pilot CB Flight Refuelling System Power Supply")
defineToggleSwitch("P_CB_CABIN_PRESS", 1, 3404, 566, "COMMON Circuit Breaker", "Pilot CB Cabin Pressurization System Power Supply")
defineToggleSwitch("P_CB_INVERT_28", 1, 3405, 568, "COMMON Circuit Breaker", "Pilot CB Inverter 28V Power Supply")
defineToggleSwitch("P_CB_UC_NORM", 1, 3406, 570, "COMMON Circuit Breaker", "Pilot CB U/C Normal Operation Power Supply")
defineToggleSwitch("P_CB_VUHF", 1, 3407, 572, "COMMON Circuit Breaker", "Pilot CB V/UHF Power Supply")
defineToggleSwitch("P_CB_START_SEQU", 1, 3408, 574, "COMMON Circuit Breaker", "Pilot CB Starter and Sequencing System Power Supply")
defineToggleSwitch("P_CB_REFUEL_PROBE", 1, 3409, 576, "COMMON Circuit Breaker", "Pilot CB Refuelling Probe Control Power Supply")
defineToggleSwitch("P_CB_TRIM_CONTRL", 1, 3410, 578, "COMMON Circuit Breaker", "Pilot CB Manual Trim Control Power Supply")
defineToggleSwitch("P_CB_GROUND_PW", 1, 3411, 580, "COMMON Circuit Breaker", "Pilot CB Valve Position Repeater, Control Valve and Ground Mode Power Supply")
defineToggleSwitch("P_CB_WARN_L", 1, 3412, 582, "COMMON Circuit Breaker", "Pilot CB Failure Warning Panel and Master Failure Warning Light Power Supply")
defineToggleSwitch("P_CB_UC_WARN_L", 1, 3413, 584, "COMMON Circuit Breaker", "Pilot CB Configuration Indicator (U/C section) and U/C Warning Light Power Supply")
defineToggleSwitch("P_CB_IFF", 1, 3414, 586, "COMMON Circuit Breaker", "Pilot CB IFF Power Supply")
defineToggleSwitch("P_CB_EMERG_REG", 1, 3415, 588, "COMMON Circuit Breaker", "Pilot CB Emergency Regulation System and Control Lever Power Supply")

--Ejection Seat
defineSpringloaded_3_pos_tumb("P_ES_SEAT_HEIGHT", 1, 3431, 3430, 11, "COMMON Ejection Seat", "Pilot Seat Height Adjustment Control")
definePushButton("P_ES_FIRE_HND_BLIND", 1, 3432, 13, "COMMON Ejection Seat", "Pilot Face Blind Firing Handle")
definePushButton("P_ES_FIRE_HND_ALT", 1, 3434, 14, "COMMON Ejection Seat", "Pilot Alternative Firing Handle")
definePotentiometer("P_ES_SAFE_PIN", 1, 3650, 1316, {0, 1}, "COMMON Ejection Seat", "Pilot Ejection Handle Safety Pin")

defineFloat("P_ES_SEAT_HEIGHT_G", 10, {0, 1}, "COMMON Ejection Seat Gauges ", "Pilot Seat Height")

--Chaff and flares dispenser ALE 40 control unit
defineMultipositionSwitch("P_C_CHAFF_FLARE_SEL", 1, 3437, 208, 3, 0.5, "COMMON Countermeassures", "Pilot Chaff/Flares Selector Switch")
defineMultipositionSwitch("P_C_PROG_SEL", 1, 3438, 209, 4, 0.3333, "COMMON Countermeassures", "Pilot Program Selector Switch")
definePushButton("P_C_COUNTRES_CHAFF", 1, 3439, 212, "COMMON Countermeassures", "Pilot Chaff Counter Reset Button")
definePushButton("P_C_COUNTRES_FLARE", 1, 3440, 215, "COMMON Countermeassures", "Pilot Flares Counter Reset Button")
defineToggleSwitch("P_C_EMERG_JETT", 1, 3441, 216, "COMMON Countermeassures", "Pilot Emergency Jettisoning Switch")
definePushButton("P_C_CHAFF_FLARE_REL", 1, 3443, 708, "COMMON Countermeassures", "Pilot Chaff/Flares Release Button")
defineToggleSwitch("P_C_RADAR_DETECOR", 1, 3442, 478, "COMMON Countermeassures", "Radar Detector Switch")

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

----F1CE/BE/EE
--Navigation indicator
defineMultipositionSwitch("P_CE_NAV_MODE", 1, 3555, 1204, 4, 0.3333, "CE/BE/EE Navigation Indicator", "CE/BE/EE Pilot Navigation Mode Selector Switch")
defineToggleSwitch("P_CE_NAV_NORM_ADD_VEC", 1, 3556, 1205, "CE/BE/EE Navigation Indicator", "CE/BE/EE Pilot Navigation Normal/Additional Vector Switch")
defineToggleSwitch("P_CE_NAV_ADD_TARGET", 1, 3557, 1206, "CE/BE/EE Navigation Indicator", "CE/BE/EE Pilot Navigation Additional Target Selector Switch")
defineRotary("P_CE_NAV_BRG_DIST", 1, 3558, 1207, "CE/BE/EE Navigation Indicator", "CE/BE/EE Pilot Navigation Bearing/Distance Selector Knob")
definePushButton("P_CE_NAV_TEST", 1, 3559, 1208, "CE/BE/EE Navigation Indicator", "CE/BE/EE Pilot Navigation Test Button")

--Radar Detector indicator
definePushButton("P_CE_RD_L_BRT_BTN", 1, 3565, 1290, "CE/BE/EE Radar Detector", "CE/BE/EE Pilot 'T' Test Button (Push)")
definePotentiometer("P_CE_RD_L_BRT_KNB", 1, 3566, 1237, {0, 1}, "CE/BE/EE Radar Detector", "CE/BE/EE Pilot Indicator Light Intensity Adjusting Knob (Turn)")
defineSpringloaded_3_pos_tumb("P_CE_RD_TEST", 1, 3568, 3567, 1238, "CE/BE/EE Radar Detector", "CE/BE/EE Pilot Radar Detector Indicator Test Selector")

--Armament Control

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

BIOS.protocol.endModule()