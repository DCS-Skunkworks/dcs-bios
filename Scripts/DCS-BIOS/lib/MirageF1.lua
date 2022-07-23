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
defineToggleSwitch("P_STICK_HIDE", 1, 3001, 34, "Misc", "Pilot Hide Stick Toggle")
defineSpringloaded_3_pos_tumb("P_INCIDENCE_TEST", 1, 3011, 3010, 98, "Misc", "Pilot Incidence Test Switch")
definePushButton("P_ALT_PTT", 1, 3118, 405, "Misc", "Pilot Alternative PTT")

defineFloat("P_SEAT_HEIGHT", 10, {0, 1}, "Misc Gauges ", "Pilot Seat Height")

--Flight Control System controls
definePushButton("P_FC_TEST_RES", 1, 3012, 368, "Flight Control", "Pilot Flight Control Test Restart Button")
defineToggleSwitch("P_FC_TEST_CV", 1, 3013, 369, "Flight Control", "Pilot Flight Control Test Switch Guard")
defineToggleSwitch("P_FC_TEST", 1, 3014, 370, "Flight Control", "Pilot Flight Control Test Switch")
definePushButton("P_FCS_SERVO_RES", 1, 3020, 89, "Flight Control System", "Pilot Servo Reset Button")
defineToggleSwitch("P_FCS_STICK_UNCOUPLE_CV", 1, 3022, 95, "Flight Control System", "Pilot Stick Uncouple Switch Guard")
defineToggleSwitch("P_FCS_STICK_UNCOUPLE", 1, 3021, 97, "Flight Control System", "Pilot Stick Uncouple Switch")
defineToggleSwitch("P_FCS_ARTHUR_SEL_CV", 1, 3023, 94, "Flight Control System", "Pilot ARTHUR Selector Switch Guard")
defineMultipositionSwitch("P_FCS_ARTHUR_SEL", 1, 3024, 96, 3, 0.5, "Flight Control System", "Pilot ARTHUR Selector Switch")
defineMultipositionSwitch("P_FCS_YAW_ANTISLIP", 1, 3025, 90, 3, 0.5, "Flight Control System", "Pilot Yaw/Anti-Slip Switch")
defineToggleSwitch("P_FCS_PITCH_SW", 1, 3026, 91, "Flight Control System", "Pilot Pitch Switch")
defineSpringloaded_3_pos_tumb("P_FCS_RUDDER_TRIM", 1, 3027, 3028, 406, "Flight Control System", "Pilot Rudder Trim Control Switch")
definePushButton("P_FCS_AP_PA_BTN", 1, 3035, 974, "Flight Control System", "Pilot Autopilot PA Button")
definePushButton("P_FCS_AP_ALT_BTN", 1, 3036, 977, "Flight Control System", "Pilot Autopilot ALT Button")
definePushButton("P_FCS_AP_CAP_BTN", 1, 3037, 980, "Flight Control System", "Pilot Autopilot CAP Button")
definePushButton("P_FCS_AP_R_BTN", 1, 3038, 982, "Flight Control System", "Pilot Autopilot R Button")
definePushButton("P_FCS_AP_G_BTN", 1, 3039, 987, "Flight Control System", "Pilot Autopilot G Button")
defineRotary("P_FCS_AP_INT", 1, 3041, 992, "Flight Control System", "Pilot Autopilot Intensity Control")
definePushButton("P_FCS_AP_TEST_BTN", 1, 3042, 973, "Flight Control System", "Pilot Autopilot Control and Indicator Unit Test Button")

--Engine and Fuel Controls
definePushButton("P_EFC_THL_CUT_IDLE", 1, 3051, 239, "Engine-Fuel Control", "Pilot Throttle Cut/Idle Switch")
definePushButton("P_EFC_ENG_RELIGHT", 1, 3052, 240, "Engine-Fuel Control", "Pilot In-flight Relight Control")
define3PosTumb("P_EFC_ING_VENT_SEL", 1, 3053, 376, "Engine-Fuel Control", "Pilot Ignition/Ventilation Selector Switch")
defineToggleSwitch("P_EFC_START_CV", 1, 3054, 374, "Engine-Fuel Control", "Pilot Start Button Cover")
definePushButton("P_EFC_START", 1, 3055, 375, "Engine-Fuel Control", "Pilot Start Button")
defineToggleSwitch("P_EFC_LP_MAIN_CV", 1, 3056, 380, "Engine-Fuel Control", "Pilot LP Main Cock Switch Guard")
defineToggleSwitch("P_EFC_LP_MAIN", 1, 3057, 381, "Engine-Fuel Control", "Pilot LP Main Cock Switch")
defineToggleSwitch("P_EFC_JPT_EMERG", 1, 3062, 396, "Engine-Fuel Control", "Pilot JPT Emergency Regulation Switch")
defineToggleSwitch("P_EFC_AB_MAIN_CV", 1, 3063, 397, "Engine-Fuel Control", "Pilot A/B Main Cock Switch Guard")
defineToggleSwitch("P_EFC_AB_MAIN", 1, 3064, 398, "Engine-Fuel Control", "Pilot A/B Main Cock Switch")
defineToggleSwitch("P_EFC_PUMP_START", 1, 3065, 377, "Engine-Fuel Control", "Pilot Starting Pump Switch")
defineToggleSwitch("P_EFC_PUMP_LP_R", 1, 3066, 378, "Engine-Fuel Control", "Pilot R/H LP Pump Switch")
defineToggleSwitch("P_EFC_PUMP_LP_L", 1, 3067, 379, "Engine-Fuel Control", "Pilot L/H LP Pump Switch")
defineSpringloaded_3_pos_tumb("P_EFC_SHOCK_CONE_MAN", 1, 3069, 3068, 754, "Engine-Fuel Control", "Pilot Shock-Cone Manual Control Switch")
definePushButton("P_EFC_SHOCK_CONE", 1, 3070, 755, "Engine-Fuel Control", "Pilot Shock-Cone Pushbutton")
defineToggleSwitch("P_EFC_FIRE_FUEL_DIP", 1, 3071, 591, "Engine-Fuel Control", "Pilot Firing Fuel Dipper Switch")
defineToggleSwitch("P_EFC_FEEDER_SEL", 1, 3075, 1144, "Engine-Fuel Control", "Pilot Feeder Tank/Fuselage Selector Switch")
definePushButton("P_EFC_FUEL_G_TEST", 1, 3076, 1145, "Engine-Fuel Control", "Pilot Fuel Gauge Test Button")

--Jettison Panel
defineToggleSwitch("P_JETT_EMERG_CV", 1, 3077, 966, "Jettison Panel", "Pilot Emergency Jettison Button Guard")
definePushButton("P_JETT_EMERG", 1, 3078, 967, "Jettison Panel", "Pilot Emergency Jettison Button")
defineToggleSwitch("P_JETT_SEL_CV", 1, 3079, 968, "Jettison Panel", "Pilot Selective Jettison Button Guard")
definePushButton("P_JETT_SEL", 1, 3080, 969, "Jettison Panel", "Pilot Selective Jettison Button")
define3PosTumb("P_JETT_SEL_SW", 1, 3081, 970, "Jettison Panel", "Pilot Jettison Selector Switch")

--Fuel Transfer, Refuelling and Indication
defineRotary("P_FS_QUANT_RES", 1, 3082, 1150, "Fuel System", "Pilot Fuel Quantity Reset Thumbwheel")
defineToggleSwitch("P_FS_CROSSFEED", 1, 3083, 1151, "Fuel System", "Pilot Crossfeed Switch")
defineToggleSwitch("P_FS_EMERG_TRANS", 1, 3084, 1152, "Fuel System", "Pilot Emergency Transfer Switch")
defineToggleSwitch("P_FS_TRANS_SEQ_SEL", 1, 3085, 1153, "Fuel System", "Pilot Fuel Transfer Sequence Selector Switch")
definePushButton("P_FS_TRANS_IND_TEST", 1, 3086, 1166, "Fuel System", "Pilot Fuel Transfer Indicator Test")

--Radar Control Stick
definePushButton("P_RCS_ALT_DIFF", 1, 3100, 259, "Radar Control Stick", "Pilot Radar Control Stick Elevation/Altitude Difference Button")
defineMultipositionSwitch("P_RCS_SCALE_SEL", 1, 3101, 258, 4, 1/3, "Flight Control System", "Pilot Radar Control Stick Scale Selection")
defineMultipositionSwitch("P_RCS_SCAN_SEL", 1, 3102, 257, 3, 0.5, "Flight Control System", "Pilot Radar Control Stick Scan Selection")

--High-Lift Devices
defineMultipositionSwitch("P_HLD_FLAP_SLAT", 1, 3120, 248, 3, 0.5, "High-Lift Devices", "Pilot Slat/Flap lever")
define3PosTumb("P_HLD_SEL", 1, 3121, 399, "High-Lift Devices", "Pilot High-Lift Devices Selector Switch")

--Radio selector unit
definePotentiometer("P_RADIO_MISS", 1, 3122, 306, {0, 1}, "Radio Selector Unit", "Pilot Radio MISS Potentiometer")
definePotentiometer("P_RADIO_TAC", 1, 3123, 307, {0, 1}, "Radio Selector Unit", "Pilot Radio TAC Potentiometer")
definePotentiometer("P_RADIO_VOR", 1, 3124, 308, {0, 1}, "Radio Selector Unit", "Pilot Radio VOR Potentiometer")
defineToggleSwitch("P_RADIO_AMPLI", 1, 3125, 309, "Flight Control", "Pilot Radio AMPLI 2-1 Selector Switch")
definePushButton("P_RADIO_U_V_BTN", 1, 3126, 310, "Radio Selector Unit", "Pilot Radio U+V Knob (Push)")
definePotentiometer("P_RADIO_U_V_KNB", 1, 3127, 311, {0, 1}, "Radio Selector Unit", "Pilot Radio U+V Knob (Turn)")
definePushButton("P_RADIO_U_BTN", 1, 3128, 313, "Radio Selector Unit", "Pilot Radio U Knob (Push)")
definePotentiometer("P_RADIO_U_KNB", 1, 3129, 314, {0, 1}, "Radio Selector Unit", "Pilot Radio U Knob (Turn)")
definePushButton("P_RADIO_RAP_CME_BTN", 1, 3130, 316, "Radio Selector Unit", "Pilot Radio RAP+CME Knob (Push)")
definePotentiometer("P_RADIO_RAP_CME_KNB", 1, 3131, 317, {0, 1}, "Radio Selector Unit", "Pilot Radio RAP+CME Knob (Turn)")
definePushButton("P_RADIO_MKR_TP_BTN", 1, 3132, 319, "Radio Selector Unit", "Pilot Radio MKR+TP Knob (Push)")
definePotentiometer("P_RADIO_MKR_TP_KNB", 1, 3133, 320, {0, 1}, "Radio Selector Unit", "Pilot Radio MKR+TP Knob (Turn)")

--V/UHF radio control unit (TRT - TRAP 136)
define3PosTumb("P_VUHF_TEST", 1, 3136, 272, "V/UHF Control Unit", "Pilot V/UHF Test Selector Switch")
defineToggleSwitch("P_VUHF_SIL", 1, 3137, 273, "V/UHF Control Unit", "Pilot V/UHF SIL Switch")

defineSetCommandTumb("P_VUHF_FREQ_100", 1, 3138, 274, 0.1, {0, 0.3}, {"1", "2", "3"}, false, "V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 100")
defineSetCommandTumb("P_VUHF_FREQ_10", 1, 3139, 275, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 10")
defineSetCommandTumb("P_VUHF_FREQ_1", 1, 3140, 276, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 1")
defineSetCommandTumb("P_VUHF_FREQ_01", 1, 3141, 277, 0.1, {0, 1}, {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "0"}, false, "V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 0.1")
defineSetCommandTumb("P_VUHF_FREQ_0025", 1, 3142, 278, 0.333, {0, 1}, {"00", "25", "50", "75"}, false, "V/UHF Control Unit", "Pilot V/UHF Frequency Thumbwheel 0.025")
defineSetCommandTumb("P_VUHF_FUNC_SEL", 1, 3143, 280, 0.2, {0, 0.8}, nil, true, "V/UHF Control Unit", "Pilot V/UHF Function Selector")
defineToggleSwitch("P_VUHF_25_5_SW", 1, 3144, 281, "V/UHF Control Unit", "Pilot V/UHF 25W - 5W Switch")
defineMultipositionSwitch("P_VUHF_FREQ_SEL", 1, 3145, 282, 3, 0.5, "V/UHF Control Unit", "Pilot V/UHF Frequency Selector Switch")
defineRadioWheel("P_VUHF_CHAN", 1, 3146, 3146, {-0.05, 0.05}, 283, 0.05, {0, 1}, {" 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20", " 1", " 2", " 3", " 4", " 5"}, "V/UHF Control Unit", "Pilot V/UHF Channel Selector")

--Engine Emergency Regulation
definePushButton("P_EER_REG_L_BTN", 1, 3165, 354, "Engine Emergency Regulation", "Pilot Emergency Regulation Light Knob (Push)")
definePotentiometer("P_EER_REG_L_KNB", 1, 3166, 355, {0, 1}, "Engine Emergency Regulation", "Pilot Emergency Regulation Light Knob (Turn)")
defineToggleSwitch("P_EER_SW_CV", 1, 3167, 357, "Engine Emergency Regulation", "Pilot Emergency Regulation Switch Guard")
defineToggleSwitch("P_EER_SW", 1, 3168, 358, "Engine Emergency Regulation", "Pilot Emergency Regulation Switch")
defineSpringloaded_3_pos_tumb("P_EER_CONTROL", 1, 3170, 3169, 359, "Engine Emergency Regulation", "Pilot Emergency Regulation Control Lever")
defineToggleSwitch("P_EER_BRAKE_CHUTE", 1, 3171, 54, "Engine Emergency Regulation", "Pilot Brake Chute Control")

--Canopy controls
defineToggleSwitch("P_CANOPY_LOCK", 1, 3172, 55, "Canopy", "Pilot Canopy Lock Control")
definePushButton("P_CANOPY_EMBRITTLE", 1, 3173, 56, "Canopy", "Pilot Canopy Embrittle Control")
defineToggleSwitch("P_CANOPY_HINGE", 1, 3174, 3, "Canopy", "Pilot Canopy Hinged Handle")
defineToggleSwitch("P_CANOPY_SEAL", 1, 3175, 233, "Canopy", "Pilot Canopy Seal Valve Control Lever")
defineToggleSwitch("P_CANOPY_MIRRORS", 1, 3176, 2, "Canopy", "Pilot Mirrors")
defineToggleSwitch("P_CANOPY_OPEN", 1, 3178, 1, "Canopy", "Pilot Canopy Open/Close")

defineFloat("CANOPY_POS", 1, {0, 1}, "Canopy Gauges", "Canopy Position")

--Undercarriage, nose wheel steering, brake and anti-skid
defineToggleSwitch("P_U_SAFE_LVR", 1, 3190, 85, "Undercarriage NWS Brake", "Pilot U/C Safety Lever")
defineToggleSwitch("P_U_CONTROL_LVR", 1, 3191, 86, "Undercarriage NWS Brake", "Pilot U/C Control Lever")
definePushButton("P_U_ANTI_RETRAC_OVER", 1, 3192, 87, "Undercarriage NWS Brake", "Pilot Anti-Retraction Override Button")
defineToggleSwitch("P_U_PARK_EMERG_BRAKE", 1, 3193, 84, "Undercarriage NWS Brake", "Pilot Emergency/Parking Brake Handle")
defineToggleSwitch("P_U_ANTI_SKID_CV", 1, 3194, 402, "Undercarriage NWS Brake", "Pilot Anti-Skid (SPAD) Switch Guard")
defineToggleSwitch("P_U_ANTI_SKID", 1, 3195, 403, "Undercarriage NWS Brake", "Pilot Anti-Skid (SPAD) Switch")
definePushButton("P_U_NWS_SENSI", 1, 3196, 756, "Undercarriage NWS Brake", "Pilot Nose Wheel Steering High Sensitivity Button")
defineToggleSwitch("P_U_NWS_STEER_CV", 1, 3197, 757, "Undercarriage NWS Brake", "Pilot Nose Wheel Steering Switch Guard")
defineToggleSwitch("P_U_NWS_STEER", 1, 3198, 758, "Undercarriage NWS Brake", "Pilot Nose Wheel Steering Switch")
defineMultipositionSwitch("P_U_EMERG_UC", 1, 3199, 107, 3, 0.5, "Undercarriage NWS Brake", "Pilot Emergency U/C Handle")

--Hydraulic System Controls
defineToggleSwitch("P_HSC_PRESS_SEL", 1, 3200, 88, "Hydraulic System Controls", "Pilot Hydraulic Pressure Selector Switch")
defineToggleSwitch("P_HSC_EL_PUMP", 1, 3201, 475, "Hydraulic System Controls", "Pilot Electro-Pump Switch")

-- Clock
definePushButton("P_CLOCK_SET_KNB", 1, 3202, 232, "Clock", "Pilot Chronometer Starting Control and Clock Setting Knob")
defineRotary("P_CLOCK_WIND_KNB", 1, 3203, 67, "Clock", "Pilot Chronometer Starting Control and Clock Winding Knob")
defineToggleSwitch("P_CLOCK_WIND_LVR", 1, 3204, 231, "Clock", "Pilot Clock Winding/Setting Lever")

--Air Data Instrument Controls
definePotentiometer("P_ADI_SPEED_KNB", 1, 3206, 1270, {0, 1}, "Air Data Instrument Controls", "Pilot Mach/Airspeed Indicator Reference Airspeed Knob")
defineRotary("P_ADI_ALT_BARO_SLAVE", 1, 3207, 1053, "Air Data Instrument Controls", "Pilot Slaved Altimeter Barometric Pressure Setting Knob")
defineRotary("P_ADI_ALT_BARO_STBY", 1, 3208, 1072, "Air Data Instrument Controls", "Pilot Standby Altimeter Barometric Pressure Setting Knob")
defineToggleSwitch("P_ADI_PROBE_HEAT", 1, 3209, 477, "Air Data Instrument Controls", "Pilot Probe Heater Switch")

--Heading and vertical reference system and standby horizon controls
defineToggleSwitch("P_FRS_STBY_HORIZON", 1, 3230, 474, "Flight Ref System", "Pilot Standby Horizon Switch")
definePotentiometer("P_FRS_SPHER_IND_DN", 1, 3231, 1116, {0, 1}, "Flight Ref System", "Pilot Spherical Indicator Day/Night Selector Switch")
definePushButton("P_FRS_SPHER_IND_MB_BTN", 1, 3232, 202, "Flight Ref System", "Pilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Push)")
definePotentiometer("P_FRS_SPHER_IND_MB_KNB", 1, 3233, 1117, {0, 1}, "Flight Ref System", "Pilot Spherical Indicator Pole Setting and Marker Beacon Light Test (Turn)")
definePushButton("P_FRS_STBY_HORIZON_UNCAGE_BTN", 1, 3234, 1132, "Flight Ref System", "Pilot Standby Horizon Uncage and Aircraft Model Control (Push)")
definePotentiometer("P_FRS_STBY_HORIZON_UNCAGE_KNB", 1, 3235, 1133, {0, 1}, "Flight Ref System", "Pilot Standby Horizon Uncage and Aircraft Model Control (Turn)")
defineMultipositionSwitch("P_FRS_HDG_REF_SYS", 1, 3236, 537, 4, 0.3333, "Flight Ref System", "Pilot Heading and Vertical Reference System Control Switch")
defineToggleSwitch("P_FRS_EMERG_GYRO", 1, 3237, 538, "Flight Ref System", "Pilot Emergency Gyromagnetic Compass Switch")
definePushButton("P_FRS_HDG_EREC", 1, 3238, 540, "Flight Ref System", "Pilot Heading Control Unit Erection Button")

--Electrical System Controls

--Circuit Breaker
defineToggleSwitch("P_CB_GYRO_CONTR", 1, 3395, 548, "Circuit Breaker", "Pilot CB Gyro Control Unit Power Supply")
defineToggleSwitch("P_CB_HLIFT_SERVO", 1, 3396, 550, "Circuit Breaker", "Pilot CB High-Lift Device Servo Unit Power Supply")
defineToggleSwitch("P_CB_IND_FAIL", 1, 3397, 552, "Circuit Breaker", "Pilot CB Indicator and Failure Detector Power Supply")
defineToggleSwitch("P_CB_INVERT_TRANS", 1, 3398, 554, "Circuit Breaker", "Pilot CB Inverter Transfer Unit Power Supply and Control")
defineToggleSwitch("P_CB_HYYD_PRESS_G", 1, 3399, 556, "Circuit Breaker", "Pilot CB Dual Hydraulic Pressure Gauge Power Supply")
defineToggleSwitch("P_CB_GUN_TRIG", 1, 3400, 558, "Circuit Breaker", "Pilot CB Gun firing Trigger Power Supply")
defineToggleSwitch("P_CB_LP_COCK", 1, 3401, 560, "Circuit Breaker", "Pilot CB LP Cock Power Supply")
defineToggleSwitch("P_CB_EL_PUMP", 1, 3402, 562, "Circuit Breaker", "Pilot CB Electro-Pump Relay Power Supply")
defineToggleSwitch("P_CB_REFUEL_SYS", 1, 3403, 564, "Circuit Breaker", "Pilot CB Flight Refuelling System Power Supply")
defineToggleSwitch("P_CB_CABIN_PRESS", 1, 3404, 566, "Circuit Breaker", "Pilot CB Cabin Pressurization System Power Supply")
defineToggleSwitch("P_CB_INVERT_28", 1, 3405, 568, "Circuit Breaker", "Pilot CB Inverter 28V Power Supply")
defineToggleSwitch("P_CB_UC_NORM", 1, 3406, 570, "Circuit Breaker", "Pilot CB U/C Normal Operation Power Supply")
defineToggleSwitch("P_CB_VUHF", 1, 3407, 572, "Circuit Breaker", "Pilot CB V/UHF Power Supply")
defineToggleSwitch("P_CB_START_SEQU", 1, 3408, 574, "Circuit Breaker", "Pilot CB Starter and Sequencing System Power Supply")
defineToggleSwitch("P_CB_REFUEL_PROBE", 1, 3409, 576, "Circuit Breaker", "Pilot CB Refuelling Probe Control Power Supply")
defineToggleSwitch("P_CB_TRIM_CONTRL", 1, 3410, 578, "Circuit Breaker", "Pilot CB Manual Trim Control Power Supply")
defineToggleSwitch("P_CB_GROUND_PW", 1, 3411, 580, "Circuit Breaker", "Pilot CB Valve Position Repeater, Control Valve and Ground Mode Power Supply")
defineToggleSwitch("P_CB_WARN_L", 1, 3412, 582, "Circuit Breaker", "Pilot CB Failure Warning Panel and Master Failure Warning Light Power Supply")
defineToggleSwitch("P_CB_UC_WARN_L", 1, 3413, 584, "Circuit Breaker", "Pilot CB Configuration Indicator (U/C section) and U/C Warning Light Power Supply")
defineToggleSwitch("P_CB_IFF", 1, 3414, 586, "Circuit Breaker", "Pilot CB IFF Power Supply")
defineToggleSwitch("P_CB_EMERG_REG", 1, 3415, 588, "Circuit Breaker", "Pilot CB Emergency Regulation System and Control Lever Power Supply")

----F1CE/BE/EE

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