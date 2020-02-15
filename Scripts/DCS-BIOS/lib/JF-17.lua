BIOS.protocol.beginModule("JF-17", 0x4800)
BIOS.protocol.setExportModuleAircrafts({"JF-17"})

-- Made by WarLord (aka BlackLibrary)
-- v 1.1

local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local define3PosTumb = BIOS.util.define3PosTumb
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

-- Remove Arg: Stick #970 ; 

-- Extra Functions

----------------------------------------- BIOS-Profile

--------------------------Left Console
defineMultipositionSwitch("SAIU_SEL_BAK", 11, 3000, 500, 4, 0.333, "Left Console", "Backup SAIU Knob Selector")
definePushButton("GEAR_LIGH_TEST_BTN", 32, 3001, 501, "Left Console", "Landing Gear Indicator Light Test Button")
defineToggleSwitch("GEAR_OVER_BTN_COVER", 32, 3002, 502, "Left Console", "Landing Gear Override Button Cover")
defineToggleSwitch("GEAR_OVER_BTN", 32, 3003, 503, "Left Console", "Landing Gear Override Button")
definePotentiometer("GEAR_IND_LIGHT_KNOB", 32, 3004, 504, {0, 1}, "Left Console", "Landing Gear Indicator Light Knob")
defineToggleSwitch("GEAR_LEVER", 32, 3005, 505, "Left Console", "Landing Gear Lever")

defineToggleSwitch("GND_JETT_BTN", 16, 3006, 506, "Left Console", "Ground Jettison Button")
defineToggleSwitch("EMERG_JETT_BTN_COVER", 16, 3007, 507, "Left Console", "Emergency Jettison Button Cover")
definePushButton("EMERG_JETT_BTN", 16, 3008, 508, "Left Console", "Emergency Jettison Button")

--MASTER ARM
define3PosTumb("MASTER_ARM_SW", 11, 3009, 509, "Left Console", "Weapon Master Arm Switch")

--LANDING GEAR
define3PosTumb("BRAKE_TEST", 32, 3010, 510, "Left Console", "Brake Test")
defineTumb("BRAKE_PARK_NORM", 32, 3011, 511, 2, {-1,1}, nil, false, "Left Console", "Brake Park/Norm")

define3PosTumb("LND_TAX_LIGHT_SW", 4, 3012, 512, "Left Console", "Light Switch - Land/Off/Taxi")
defineTumb("FLAP_SW", 35, 3013, 513, 2, {-1,1}, nil, false, "Left Console", "TEF Flap Switch - Up/Down")

--FUEL
defineToggleSwitch("FEED_CUT_VALVE_COVER", 33, 3014, 514, "Left Console" , "Feed Cut-off Valve Cover")
defineToggleSwitch("FEED_CUT_VALVE", 33, 3015, 515, "Left Console" , "Feed Cut-off Valve")
defineToggleSwitch("ACT_FUEL_CUT_VALVE_COVER", 33, 3016, 516, "Left Console" , "Active Fuel Cut-off Valve Cover")
defineToggleSwitch("ACT_FUEL_CUT_VALVE", 33, 3017, 517, "Left Console" , "Active Fuel Cut-off Valve")
defineToggleSwitch("FUEL_PUMP_SW", 33, 3018, 518, "Left Console" , "Fuel Pump Switch")

--ENG
defineToggleSwitch("ENG_CONTR_SW", 34, 3019, 519, "Left Console", "Engine Control Switch")
defineToggleSwitch("AIR_START_BTN_COVER", 34, 3061, 561, "Left Console" , "Air Start Button Cover")
defineToggleSwitch("AIR_START_BTN", 34, 3020, 520, "Left Console", "Air Start Button")
definePushButton("GND_START_BTN", 34, 3021, 521, "Left Console", "Ground Start Button")
define3PosTumb("ENG_MODE_SW", 34, 3022, 522, "Left Console", "Engine Mode Switch")
defineToggleSwitch("SEC_EEC_SW", 34, 3023, 523, "Left Console", "SEC EEC Switch")
defineToggleSwitch("AFTERBURN_SW", 34, 3024, 524, "Left Console", "Afterburner Switch")
defineToggleSwitch("ANTI_SURGE_SW", 34, 3025, 525, "Left Console", "Anti-Surge Switch")
define3PosTumb("START_MODE_SEL", 34, 3026, 526, "Left Console", "Start Mode Selector - START/ENG COLD/STARTER COLD")

--FCS
defineToggleSwitch("RECORD_SW", 34, 3027, 527, "Left Console", "Record Switch")
defineToggleSwitch("EFCS_SW", 34, 3028, 528, "Left Console", "EFCS Switch")
defineToggleSwitch("YAW_ROLL_CAS_SW", 34, 3029, 529, "Left Console", "Yaw/Roll CAS Switch")
defineToggleSwitch("DIRECT_MODE_SW", 34, 3030, 530, "Left Console", "Direct Mode Switch")
defineToggleSwitch("BIT_BTN", 34, 3031, 531, "Left Console", "BIT Button")

definePushButton("YAW_TRIM_SW", 34, 3032, 532, "Left Console", "Yaw Trim Switch")
definePushButton("FCS_RESET_BTN", 34, 3044, 544, "Left Console", "FCS Reset Button")
defineToggleSwitch("FLGHT_TEST_1_SW", 34, 3033, 533, "Left Console", "Flight Test Switch 1")
defineToggleSwitch("FLGHT_TEST_2_SW", 34, 3034, 534, "Left Console", "Flight Test Switch 2")
defineToggleSwitch("AG1_AG2_SW", 34, 3035, 535, "Left Console", "AG1/AG2 Switch")
defineToggleSwitch("AA_AG_SW", 34, 3036, 536, "Left Console", "Aa/AG Switch")

--MISC
defineToggleSwitch("FLARE_DISP_BTN_COVER", 16, 3037, 537, "Left Console", "Flare Dispense Button Cover")
definePushButton("FLARE_DISP_BTN", 16, 3038, 538, "Left Console", "Flare Dispense Button")
defineToggleSwitch("EMERG_HYD_PUMP_SW", 34, 3039, 539, "Left Console", "Emergency Hydraulic Pump Switch")
defineToggleSwitch("SHARS_SW", 34, 3040, 540, "Left Console", "SHARS Switch")

defineToggleSwitch("EJECT_SEAT_DESTR_SW", 34, 3041, 541, "Left Console", "Ejection Seat Activate Destruct")
defineToggleSwitch("SELF_DESTR_BTN_COVER", 16, 3042, 542, "Left Console", "Self Destruct Button Cover")
definePushButton("SELF_DESTR_BTN", 16, 3043, 543, "Left Console", "Self Destruct Button")

--THROTTLE
definePotentiometer("THROTTLE_FRIC", 34, 3070, 570, {0, 1}, "Left Console", "Throttle Friction Handle")
definePushButton("THROTTLE_UNCAGE", 34, 3071, 571, "Left Console", "Throttle Uncage: Stop To Idle")
definePushButton("THROTTLE_CAGE", 34, 3072, 572, "Left Console", "Throttle Cage: Idle To Stop")
definePushButton("THROTTLE_EMERG_BTN", 34, 3073, 573, "Left Console", "Throttle Emergency Button")

--------------------------Center Front
-- UFCP
definePushButton("UFCP_BTN_1", 46, 3074, 700, "Center Front", "UFCP Button PFL/1")
definePushButton("UFCP_BTN_2", 46, 3075, 701, "Center Front", "UFCP Button VRC/2")
definePushButton("UFCP_BTN_3", 46, 3076, 702, "Center Front", "UFCP Button 3")
definePushButton("UFCP_BTN_L1", 46, 3077, 703, "Center Front", "UFCP Button L1")
definePushButton("UFCP_BTN_R1", 46, 3078, 704, "Center Front", "UFCP Button R1")
definePushButton("UFCP_BTN_OAP", 46, 3079, 705, "Center Front", "UFCP Button OAP")
definePushButton("UFCP_BTN_MRK", 46, 3080, 706, "Center Front", "UFCP Button MRK")
definePushButton("UFCP_BTN_4", 46, 3081, 707, "Center Front", "UFCP Button DST/4")
definePushButton("UFCP_BTN_5", 46, 3082, 708, "Center Front", "UFCP Button TOT/5")
definePushButton("UFCP_BTN_6", 46, 3083, 709, "Center Front", "UFCP Button TOD/6")
definePushButton("UFCP_BTN_L2", 46, 3084, 710, "Center Front", "UFCP Button L2")
definePushButton("UFCP_BTN_R2", 46, 3085, 711, "Center Front", "UFCP Button R2")
definePushButton("UFCP_BTN_PU", 46, 3086, 712, "Center Front", "UFCP Button P.U")
definePushButton("UFCP_BTN_HNS", 46, 3087, 713, "Center Front", "UFCP Button HNS")
definePushButton("UFCP_BTN_7", 46, 3088, 714, "Center Front", "UFCP Button FUL/7")
definePushButton("UFCP_BTN_8", 46, 3089, 715, "Center Front", "UFCP Button IFF/8")
definePushButton("UFCP_BTN_9", 46, 3090, 716, "Center Front", "UFCP Button 9")
definePushButton("UFCP_BTN_L3", 46, 3091, 717, "Center Front", "UFCP Button L3")
definePushButton("UFCP_BTN_R3", 46, 3092, 718, "Center Front", "UFCP Button R3")
definePushButton("UFCP_BTN_AP", 46, 3093, 719, "Center Front", "UFCP Button A/P")
definePushButton("UFCP_BTN_FPM", 46, 3094, 720, "Center Front", "UFCP Button FPM")
definePushButton("UFCP_BTN_RTN", 46, 3095, 721, "Center Front", "UFCP Button RTN")
definePushButton("UFCP_BTN_0", 46, 3096, 722, "Center Front", "UFCP Button 0")
definePushButton("UFCP_BTN_NA1", 46, 3097, 723, "Center Front", "UFCP Button N/A (1)")
definePushButton("UFCP_BTN_L4", 46, 3098, 724, "Center Front", "UFCP Button L4")
definePushButton("UFCP_BTN_R4", 46, 3099, 725, "Center Front", "UFCP Button R4")
definePushButton("UFCP_BTN_NA2", 46, 3100, 726, "Center Front", "UFCP Button N/A (2)")
definePushButton("UFCP_BTN_NA3", 46, 3101, 727, "Center Front", "UFCP Button N/A (3)")
	
definePotentiometer("HUD_CONTR_KNB", 46, 3102, 728, {0, 1}, "Center Front", "HUD Contrast Knob")
definePotentiometer("HUD_BRIGHT_KNB", 46, 3103, 729, {0, 1}, "Center Front", "HUD Brightness Knob")
define3PosTumb("UFCP_PLUS_MINUS_SW", 46, 3104, 730, "Center Front", "+/,/- Switch")
definePotentiometer("HUD_BAK_RETICLE_KNB", 46, 3105, 731, {0, 1}, "Center Front", "HUD Backup Reticle Knob")
definePotentiometer("UFCP_BRIGHT_KNB", 46, 3106, 732, {0, 1}, "Center Front", "UFCP Brightness Knob")	
define3PosTumb("PARACHUTE_DEPLOY_JETT", 35, 3107, 733, "Center Front", "Deploy/Jettison Parachute")

--Left MFCD
definePushButton("MFCD_L_SYM_PLUS", 47, 3107, 734, "Center Front", "Left MFCD Sym +")
definePushButton("MFCD_L_SYM_MINUS", 47, 3108, 735, "Center Front", "Left MFCD Sym -")
definePushButton("MFCD_L_U1", 47, 3109, 736, "Center Front", "Left MFCD U1")
definePushButton("MFCD_L_U2", 47, 3110, 737, "Center Front", "Left MFCD U2")
definePushButton("MFCD_L_U3", 47, 3111, 738, "Center Front", "Left MFCD U3")
definePushButton("MFCD_L_U4", 47, 3112, 739, "Center Front", "Left MFCD U4")
definePushButton("MFCD_L_U5", 47, 3113, 740, "Center Front", "Left MFCD U5")
definePushButton("MFCD_L_PW", 47, 3114, 741, "Center Front", "Left MFCD Power")
definePushButton("MFCD_L_L1", 47, 3115, 742, "Center Front", "Left MFCD L1")
definePushButton("MFCD_L_L2", 47, 3116, 743, "Center Front", "Left MFCD L2")
definePushButton("MFCD_L_L3", 47, 3117, 744, "Center Front", "Left MFCD L3")
definePushButton("MFCD_L_L4", 47, 3118, 745, "Center Front", "Left MFCD L4")
definePushButton("MFCD_L_L5", 47, 3119, 746, "Center Front", "Left MFCD L5")
definePushButton("MFCD_L_L6", 47, 3120, 747, "Center Front", "Left MFCD L6")
definePushButton("MFCD_L_L7", 47, 3121, 748, "Center Front", "Left MFCD L7")
definePushButton("MFCD_L_L8", 47, 3122, 749, "Center Front", "Left MFCD L8")
definePushButton("MFCD_L_R1", 47, 3123, 750, "Center Front", "Left MFCD R1")
definePushButton("MFCD_L_R2", 47, 3124, 751, "Center Front", "Left MFCD R2")
definePushButton("MFCD_L_R3", 47, 3125, 752, "Center Front", "Left MFCD R3")
definePushButton("MFCD_L_R4", 47, 3126, 753, "Center Front", "Left MFCD R4")
definePushButton("MFCD_L_R5", 47, 3127, 754, "Center Front", "Left MFCD R5")
definePushButton("MFCD_L_R6", 47, 3128, 755, "Center Front", "Left MFCD R6")
definePushButton("MFCD_L_R7", 47, 3129, 756, "Center Front", "Left MFCD R7")
definePushButton("MFCD_L_R8", 47, 3130, 757, "Center Front", "Left MFCD R8")
definePushButton("MFCD_L_CONT_PLUS", 47, 3131, 758, "Center Front", "Left MFCD Cont +")
definePushButton("MFCD_L_CONT_MINUS", 47, 3132, 759, "Center Front", "Left MFCD Cont -")
definePushButton("MFCD_L_D1", 47, 3133, 760, "Center Front", "Left MFCD D1")
definePushButton("MFCD_L_D2", 47, 3134, 761, "Center Front", "Left MFCD D2")
definePushButton("MFCD_L_D3", 47, 3135, 762, "Center Front", "Left MFCD D3")
definePushButton("MFCD_L_D4", 47, 3136, 763, "Center Front", "Left MFCD D4")
definePushButton("MFCD_L_D5", 47, 3137, 764, "Center Front", "Left MFCD D5")
definePushButton("MFCD_L_BRT_PLUS", 47, 3138, 765, "Center Front", "Left MFCD Brt +")
definePushButton("MFCD_L_BRT_MINUS", 47, 3139, 766, "Center Front", "Left MFCD Brt -")

--Center MFCD
definePushButton("MFCD_C_SYM_PLUS", 47, 3140, 767, "Center Front", "Center MFCD Sym +")
definePushButton("MFCD_C_SYM_MINUS", 47, 3141, 768, "Center Front", "Center MFCD Sym -")
definePushButton("MFCD_C_U1", 47, 3142, 769, "Center Front", "Center MFCD U1")
definePushButton("MFCD_C_U2", 47, 3143, 770, "Center Front", "Center MFCD U2")
definePushButton("MFCD_C_U3", 47, 3144, 771, "Center Front", "Center MFCD U3")
definePushButton("MFCD_C_U4", 47, 3145, 772, "Center Front", "Center MFCD U4")
definePushButton("MFCD_C_U5", 47, 3146, 773, "Center Front", "Center MFCD U5")
definePushButton("MFCD_C_PW", 47, 3147, 774, "Center Front", "Center MFCD Power")
definePushButton("MFCD_C_L1", 47, 3148, 775, "Center Front", "Center MFCD L1")
definePushButton("MFCD_C_L2", 47, 3149, 776, "Center Front", "Center MFCD L2")
definePushButton("MFCD_C_L3", 47, 3150, 777, "Center Front", "Center MFCD L3")
definePushButton("MFCD_C_L4", 47, 3151, 778, "Center Front", "Center MFCD L4")
definePushButton("MFCD_C_L5", 47, 3152, 779, "Center Front", "Center MFCD L5")
definePushButton("MFCD_C_L6", 47, 3153, 780, "Center Front", "Center MFCD L6")
definePushButton("MFCD_C_L7", 47, 3154, 781, "Center Front", "Center MFCD L7")
definePushButton("MFCD_C_L8", 47, 3155, 782, "Center Front", "Center MFCD L8")
definePushButton("MFCD_C_R1", 47, 3156, 783, "Center Front", "Center MFCD R1")
definePushButton("MFCD_C_R2", 47, 3157, 784, "Center Front", "Center MFCD R2")
definePushButton("MFCD_C_R3", 47, 3158, 785, "Center Front", "Center MFCD R3")
definePushButton("MFCD_C_R4", 47, 3159, 786, "Center Front", "Center MFCD R4")
definePushButton("MFCD_C_R5", 47, 3160, 787, "Center Front", "Center MFCD R5")
definePushButton("MFCD_C_R6", 47, 3161, 788, "Center Front", "Center MFCD R6")
definePushButton("MFCD_C_R7", 47, 3162, 789, "Center Front", "Center MFCD R7")
definePushButton("MFCD_C_R8", 47, 3163, 790, "Center Front", "Center MFCD R8")
definePushButton("MFCD_C_D1", 47, 3164, 791, "Center Front", "Center MFCD D1")
definePushButton("MFCD_C_D2", 47, 3165, 792, "Center Front", "Center MFCD D2")
definePushButton("MFCD_C_D3", 47, 3166, 793, "Center Front", "Center MFCD D3")
definePushButton("MFCD_C_D4", 47, 3167, 794, "Center Front", "Center MFCD D4")
definePushButton("MFCD_C_D5", 47, 3168, 795, "Center Front", "Center MFCD D5")
definePushButton("MFCD_C_CONT_PLUS", 47, 3169, 796, "Center Front", "Center MFCD Cont +")
definePushButton("MFCD_C_CONT_MINUS", 47, 3170, 797, "Center Front", "Center MFCD Cont -")
definePushButton("MFCD_C_BRT_PLUS", 47, 3171, 798, "Center Front", "Center MFCD Brt +")
definePushButton("MFCD_C_BRT_MINUS", 47, 3172, 799, "Center Front", "Center MFCD Brt -")

-- Right MFCD
definePushButton("MFCD_R_SYM_PLUS", 47, 3173, 800, "Center Front", "Right MFCD Sym +")
definePushButton("MFCD_R_SYM_MINUS", 47, 3174, 801, "Center Front", "Right MFCD Sym -")
definePushButton("MFCD_R_U1", 47, 3175, 802, "Center Front", "Right MFCD U1")
definePushButton("MFCD_R_U2", 47, 3176, 803, "Center Front", "Right MFCD U2")
definePushButton("MFCD_R_U3", 47, 3177, 804, "Center Front", "Right MFCD U3")
definePushButton("MFCD_R_U4", 47, 3178, 805, "Center Front", "Right MFCD U4")
definePushButton("MFCD_R_U5", 47, 3179, 806, "Center Front", "Right MFCD U5")
definePushButton("MFCD_R_PW", 47, 3180, 807, "Center Front", "Right MFCD Power")
definePushButton("MFCD_R_L1", 47, 3181, 808, "Center Front", "Right MFCD L1")
definePushButton("MFCD_R_L2", 47, 3182, 809, "Center Front", "Right MFCD L2")
definePushButton("MFCD_R_L3", 47, 3183, 810, "Center Front", "Right MFCD L3")
definePushButton("MFCD_R_L4", 47, 3184, 811, "Center Front", "Right MFCD L4")
definePushButton("MFCD_R_L5", 47, 3185, 812, "Center Front", "Right MFCD L5")
definePushButton("MFCD_R_L6", 47, 3186, 813, "Center Front", "Right MFCD L6")
definePushButton("MFCD_R_L7", 47, 3187, 814, "Center Front", "Right MFCD L7")
definePushButton("MFCD_R_L8", 47, 3188, 815, "Center Front", "Right MFCD L8")
definePushButton("MFCD_R_R1", 47, 3189, 816, "Center Front", "Right MFCD R1")
definePushButton("MFCD_R_R2", 47, 3190, 817, "Center Front", "Right MFCD R2")
definePushButton("MFCD_R_R3", 47, 3191, 818, "Center Front", "Right MFCD R3")
definePushButton("MFCD_R_R4", 47, 3192, 819, "Center Front", "Right MFCD R4")
definePushButton("MFCD_R_R5", 47, 3193, 820, "Center Front", "Right MFCD R5")
definePushButton("MFCD_R_R6", 47, 3194, 821, "Center Front", "Right MFCD R6")
definePushButton("MFCD_R_R7", 47, 3195, 822, "Center Front", "Right MFCD R7")
definePushButton("MFCD_R_R8", 47, 3196, 823, "Center Front", "Right MFCD R8")
definePushButton("MFCD_R_D1", 47, 3197, 824, "Center Front", "Right MFCD D1")
definePushButton("MFCD_R_D2", 47, 3198, 825, "Center Front", "Right MFCD D2")
definePushButton("MFCD_R_D3", 47, 3199, 826, "Center Front", "Right MFCD D3")
definePushButton("MFCD_R_D4", 47, 3201, 827, "Center Front", "Right MFCD D4")
definePushButton("MFCD_R_D5", 47, 3202, 828, "Center Front", "Right MFCD D5")
definePushButton("MFCD_R_CONT_PLUS", 47, 3203, 829, "Center Front", "Right MFCD Cont +")
definePushButton("MFCD_R_CONT_MINUS", 47, 3204, 830, "Center Front", "Right MFCD Cont -")
definePushButton("MFCD_R_BRT_PLUS", 47, 3205, 831, "Center Front", "Right MFCD Brt +")
definePushButton("MFCD_R_BRT_MINUS", 47, 3206, 832, "Center Front", "Right MFCD Brt -")
	
defineRotary("BARO_ALT_SET_KNB", 8, 3207, 840, "Center Front", "BARO Altitude Setting Knob")
definePotentiometer("EMERG_BRAKE_HANDLE", 32, 3208, 841, {0, 1}, "Center Front", "Emergency Brake Handle")

definePushButton("MASTER_WARN_BTN", 5, 3209, 842, "Center Front", "Master Warning")
definePushButton("FIRE_WARN_BTN", 5, 3210, 843, "Center Front", "Fire Warning")
definePushButton("FCS_WARN_BTN", 5, 3211, 844, "Center Front", "FCS Warning")

--------------------------Right Console
defineToggleSwitch("WARNPANEL_DAY_NIGHT_SW", 5, 3212, 900, "Right Console", "Warning Panel Day/Night Switch")
definePotentiometer("WARNPANEL_BRIGHT_KNB", 5, 3213, 901, {0, 1}, "Right Console", "Warning Panel Brightness Knob")
definePushButton("WARNPANEL_TEST_BTN", 5, 3214, 902, "Right Console", "Warning Panel Test Button")
definePotentiometer("OXY_IND_BRIGHT_KNB", 5, 3214, 903, {0, 1}, "Right Console", "Oxygen Indicator Brightness Knob")

defineToggleSwitch("BATT_SW", 1, 3215, 904, "Right Console", "Battery Switch")
defineToggleSwitch("MAIN_AC_GEN_SW", 1, 3216, 905, "Right Console", "Main AC Gen Switch")
defineToggleSwitch("DC_GEN_SW", 1, 3217, 906, "Right Console", "DC Gen Switch")

defineToggleSwitch("HUD_MFCD_DAY_NIGHT_SW", 7, 3218, 907, "Right Console", "HUD/MFCD Day/Night Switch")

defineMultipositionSwitch("INS_MODE_SEL_KNB", 18, 3219, 908, 4, 0.333, "Right Console", "INS Mode Knob Selector")

--AAP 
definePotentiometer("AAP_BRIGHT_KNB", 7, 3220, 909, {0, 1}, "Right Console", "AAP Brightness Knob")
defineToggleSwitch("HUD_SYMB_REJECT_SW", 7, 3221, 910, "Right Console", "HUD Symbology Reject Switch")
definePushButton("AAP_ACMI_BTN", 7, 3222, 911, "Right Console", "AAP ACMI Button")
definePushButton("AAP_NA1_BTN", 7, 3223, 912, "Right Console", "AAP N/A 1 Button")
definePushButton("AAP_NA2_BTN", 7, 3224, 913, "Right Console", "AAP N/A 2 Button")
definePushButton("AAP_NA3_BTN", 7, 3225, 914, "Right Console", "AAP N/A 3 Button")
definePushButton("AAP_HMD_BTN", 7, 3226, 915, "Right Console", "AAP HMD Button")
definePushButton("AAP_SPJ_BTN", 7, 3227, 916, "Right Console", "AAP SPJ Button")
definePushButton("AAP_CLDP_BTN", 7, 3228, 917, "Right Console", "AAP CLDP Button")
definePushButton("AAP_IRST_BTN", 7, 3229, 918, "Right Console", "AAP IRST Button")
definePushButton("AAP_RDR_BTN", 7, 3230, 919, "Right Console", "AAP RDR Button")
definePushButton("AAP_SLNK_BTN", 7, 3231, 920, "Right Console", "AAP SLNK Button")
definePushButton("AAP_OESP_BTN", 7, 3232, 921, "Right Console", "AAP OESP Button")
definePushButton("AAP_RWR_BTN", 7, 3233, 922, "Right Console", "AAP RWR Button")
definePushButton("AAP_COM1_BTN", 7, 3234, 923, "Right Console", "AAP COM1 Button")
definePushButton("AAP_COM2_BTN", 7, 3235, 924, "Right Console", "AAP COM2 Button")
definePushButton("AAP_NAV_BTN", 7, 3236, 925, "Right Console", "AAP NAV Button")
definePushButton("AAP_IFF_BTN", 7, 3237, 926, "Right Console", "AAP IFF Button")
definePushButton("AAP_INS_BTN", 7, 3238, 927, "Right Console", "AAP INS Button")
definePushButton("AAP_WMMC1_BTN", 7, 3239, 928, "Right Console", "AAP WMMC1 Button")
definePushButton("AAP_WMMC2_BTN", 7, 3240, 929, "Right Console", "AAP WMMC2 Button")
definePushButton("AAP_SAIU_BTN", 7, 3241, 930, "Right Console", "AAP SAIU Button")
definePushButton("AAP_CMBT_BTN", 7, 3242, 931, "Right Console", "AAP CMBT Button")
definePushButton("AAP_TRAIN_BTN", 7, 3243, 932, "Right Console", "AAP TRAIN Button")
definePushButton("AAP_OFF_BTN", 7, 3244, 933, "Right Console", "AAP OFF Button")

-- ACP
definePotentiometer("COM1_VOL_KNB", 29, 3245, 934, {0, 1}, "Right Console", "COM1 Volume Knob")
defineToggleSwitch("INTERCOM_SW", 29, 3246, 935, "Right Console", "Intercom Switch")
defineToggleSwitch("RADIO_ANT_TOP_BOTTOM_SW", 29, 3247, 936, "Right Console", "Radio Top/Bottom Antenna Switch")
defineToggleSwitch("SPEAKER_CHN_ANT_SW", 29, 3248, 937, "Right Console", "Speaker Control Box Channel Antenna Switch")
definePotentiometer("COM2_VOL_KNB", 29, 3249, 938, {0, 1}, "Right Console", "COM2 Volume Knob")
definePotentiometer("TCN_ILS_VOL_KNB", 29, 3250, 939, {0, 1}, "Right Console", "TCN/ILS Volume Knob")
definePotentiometer("MSL_VOL_KNB", 29, 3251, 940, {0, 1}, "Right Console", "MSL Volume Knob")

-- ECS
defineMultipositionSwitch("AIR_TEMP_SEL", 30, 3252, 941, 12, 0.833, "Right Console", "Air Temp Knob Selector")
defineMultipositionSwitch("ECS_MODE_SEL", 30, 3253, 942, 4, 0.333, "Right Console", "ECS Mode Knob Selector")
definePushButton("DEFOG_SW", 30, 3254, 943, "Right Console", "Defog Switch")

-- INT Lights
definePotentiometer("INST_LIGHT_KNB", 4, 3255, 944, {0, 1}, "Right Console", "Instrument Light Knob")
definePotentiometer("CONSOLE_LIGHT_KNB", 4, 3256, 945, {0, 1}, "Right Console", "Console Light Knob")
definePotentiometer("FLOOD_LIGHT_KNB", 4, 3257, 946, {0, 1}, "Right Console", "Flood Light Knob")

-- EXT Lights
define3PosTumb("EXT_LIGHT_MASTER_SW", 4, 3258, 947, "Right Console", "Exterior Light Master Switch")
defineMultipositionSwitch("FORMATION_LIGHT_SEL", 4, 3259, 948, 6, 0.2, "Right Console", "Formation Light Knob Selector")
defineMultipositionSwitch("ANTICOLL_LIGHT_SEL", 4, 3260, 949, 6, 0.2, "Right Console", "Anti-Collision Light Knob Selector")
define3PosTumb("NAV_LIGHT_BRIGHT_SW", 4, 3261, 950, "Right Console", "Navigation Light Switch - Bright/Off/Dim")
defineTumb("NAV_LIGHT_FLASH_SW", 4, 3262, 951, 2, {-1,1}, nil, false, "Right Console", "Navigation Light Switch - Flash/Steady")
define3PosTumb("ANTI_COL_LIGHT_SW", 4, 3263, 952, "Right Console", "Light Switch - Tow/Off/Anti-Collision")

-- DTC
definePushButton("DTC_INSERT", 9, 3264, 953, "Right Console", "DTC Card Insertion")
definePushButton("DTC_EJECT", 9, 3265, 974, "Right Console", "DTC Card Ejection")

-- Emergency LG
defineToggleSwitch("EMERG_GEAR_COVER", 32, 3266, 954, "Right Console", "Emergency Landing Gear Cover")
defineMultipositionSwitch("EMERG_GEAR_HANDLE", 32, 3267, 955, 5, 0.25, "Right Console", "Emergency Landing Gear Handle")

-- Canopy
defineToggleSwitch("CANOPY_SEAL", 35, 3268, 957, "Right Console", "Canopy Seal Handle")
defineMultipositionSwitch("CANOPY_OPEN_CLOSE", 35, 3269, 958, 4, 0.333, "Right Console", "Canopy Open/Close Handle")
defineRotary("CANOPY_OPEN_CLOSE_MAN", 35, 3270, 959, "Right Console", "Canopy Manual Open/Close Crank")

-- Flood light direction
definePotentiometer("FLOOD_LIGHT_DIRECT_1", 4, 3271, 965, {0, 1}, "Right Console", "Flood Light Direction 1")
definePotentiometer("FLOOD_LIGHT_DIRECT_2", 4, 3272, 966, {0, 1}, "Right Console", "Flood Light Direction 2")
definePotentiometer("FLOOD_LIGHT_DIRECT_3", 4, 3273, 967, {0, 1}, "Right Console", "Flood Light Direction 3")
definePotentiometer("FLOOD_LIGHT_DIRECT_4", 4, 3274, 968, {0, 1}, "Right Console", "Flood Light Direction 4")

-- Flash light
defineToggleSwitch("FLASH_LIGHT", 0, 3256, 969, "Right Console", "Flash Light")

-- Stick
defineToggleSwitch("STICK_HIDE", 38, 3275, 970, "Right Console", "Stick Show/Hide")
definePushButton("DTC_INSERT", 6, 10060, 971, "Right Console", "A/P Disengage")

-- Eject Seat
defineToggleSwitch("SEAT_SAFE_HANDLE", 38, 3276, 972, "Right Console", "Eject Seat Safe/Arm Handle")
defineToggleSwitch("SEAT_SAFE_PIN", 38, 3277, 973, "Right Console", "Eject Seat Firing Handle Safety Pin")

-- Oxygen
defineToggleSwitch("OXY_CONNECTOR", 31, 3278, 975, "Right Console", "Oxygen Tube Connector")
defineRotary("OXY_SUPPLY_VALVE", 31, 3279, 976, "Right Console", "Oxygen Supply Valve")
defineToggleSwitch("OXY_O2_100", 31, 3280, 977, "Right Console", "Oxygen 100% O2")
defineToggleSwitch("SEAT_EMERG_O2", 31, 3281, 978, "Right Console", "Eject Seat Emergency O2")

-------------------------------------------------------------------------------------------------------------------------------
-- Warning, Caution and IndicatorLights
defineIndicatorLight("LG_L_TRANS", 100, "Warning, Caution and IndicatorLights", "Landing Gear Transition Light (red)")
defineIndicatorLight("LG_L_LEFT", 101, "Warning, Caution and IndicatorLights", "Landing Gear Left Light (green)")
defineIndicatorLight("LG_L_NOSE", 102, "Warning, Caution and IndicatorLights", "Landing Gear Nose Light (green)")
defineIndicatorLight("LG_L_RIGHT", 103, "Warning, Caution and IndicatorLights", "Landing Gear Right Light (green)")    
defineIndicatorLight("LG_L_S_B", 104, "Warning, Caution and IndicatorLights", "Landing Gear SB Light (green)")
defineIndicatorLight("LG_L_D_CH", 105, "Warning, Caution and IndicatorLights", "Landing Gear D CH Light (red)")
defineIndicatorLight("LG_L_TEF", 106, "Warning, Caution and IndicatorLights", "Landing Gear TEF Light (green)")   

defineIndicatorLight("FCS_RESET_L", 110, "Warning, Caution and IndicatorLights", "FCS Reset Light")     

defineIndicatorLight("CONSOLES_L", 120, "Warning, Caution and IndicatorLights", "Console Lights")
defineIndicatorLight("INST_DISP_L", 121, "Warning, Caution and IndicatorLights", "Instrument Display Lights")
defineIndicatorLight("FLOOD_L", 122, "Warning, Caution and IndicatorLights", "Flood Lights")    
    
defineIndicatorLight("WARN_L_MASTER", 130, "Warning, Caution and IndicatorLights", "Warning Light MASTER WARNING (red)")
defineIndicatorLight("WARN_L_FIRE", 131, "Warning, Caution and IndicatorLights", "Warning Light FIRE (red)")
defineIndicatorLight("WARN_L_FCS", 132, "Warning, Caution and IndicatorLights", "Warning Light FCS (red)")

defineIndicatorLight("UFCP_BTN_L_OAP", 150, "Warning, Caution and IndicatorLights", "UFCP Button Light OAP (green)")
defineIndicatorLight("UFCP_BTN_L_MRK", 151, "Warning, Caution and IndicatorLights", "UFCP Button Light MRK (green)")
defineIndicatorLight("UFCP_BTN_L_PU", 152, "Warning, Caution and IndicatorLights", "UFCP Button Light PU (green)")
defineIndicatorLight("UFCP_BTN_L_HNS", 153, "Warning, Caution and IndicatorLights", "UFCP Button Light HNS (green)")
defineIndicatorLight("UFCP_BTN_L_AP", 154, "Warning, Caution and IndicatorLights", "UFCP Button Light AP (green)")
defineIndicatorLight("UFCP_BTN_L_FPM", 155, "Warning, Caution and IndicatorLights", "UFCP Button Light FPM (green)")
defineIndicatorLight("UFCP_BTN_L_NULL1", 156, "Warning, Caution and IndicatorLights", "UFCP Button Light NULL1 (green)")
defineIndicatorLight("UFCP_BTN_L_NULL2", 157, "Warning, Caution and IndicatorLights", "UFCP Button Light NULL2 (green)")

defineIndicatorLight("STATE_L_PITCH_TRIM", 160, "Warning, Caution and IndicatorLights", "Status Light PITCH TRIM (green)")
defineIndicatorLight("STATE_L_ROLL_TRIM", 161, "Warning, Caution and IndicatorLights", "Status Light ROLL TRIM (green)")
defineIndicatorLight("STATE_L_YAW_TRIM", 162, "Warning, Caution and IndicatorLights", "Status Light YAW TRIM (green)")    
defineIndicatorLight("STATE_L_AA", 163, "Warning, Caution and IndicatorLights", "Status Light AA (green)")
defineIndicatorLight("STATE_L_AG1", 164, "Warning, Caution and IndicatorLights", "Status Light AG1 (green)")
defineIndicatorLight("STATE_L_AG2", 165, "Warning, Caution and IndicatorLights", "Status Light AG2 (green)")
defineIndicatorLight("STATE_L_EFCS", 166, "Warning, Caution and IndicatorLights", "Status Light EFCS (green)") 
defineIndicatorLight("STATE_L_TANK_N3", 167, "Warning, Caution and IndicatorLights", "Status Light No.3 TANK (green)")    
defineIndicatorLight("STATE_L_TANK_N1", 166, "Warning, Caution and IndicatorLights", "Status Light No.1 TANK (green)")
defineIndicatorLight("STATE_L_WING_DT", 169, "Warning, Caution and IndicatorLights", "Status Light WING DT (green)")
defineIndicatorLight("STATE_L_CTR_DT", 170, "Warning, Caution and IndicatorLights", "Status Light CTR DT (green)")
defineIndicatorLight("STATE_L_NULL", 171, "Warning, Caution and IndicatorLights", "Status Light ----- (green)")  
defineIndicatorLight("STATE_L_START", 172, "Warning, Caution and IndicatorLights", "Status Light START (green)") 
defineIndicatorLight("STATE_L_AB", 173, "Warning, Caution and IndicatorLights", "Status Light AB (green)")    
defineIndicatorLight("STATE_L_COMBAT", 174, "Warning, Caution and IndicatorLights", "Status Light COMBAT (green)")
defineIndicatorLight("STATE_L_EMG_HYD", 175, "Warning, Caution and IndicatorLights", "Status Light EMG HYD (green)")
defineIndicatorLight("STATE_L_NWS", 176, "Warning, Caution and IndicatorLights", "Status Light NWS (green)")
defineIndicatorLight("STATE_L_ADVISORY", 177, "Warning, Caution and IndicatorLights", "Status Light ADVISORY (green)")

defineIndicatorLight("WARN_L_NULL", 200, "Warning, Caution and IndicatorLights", "Warning Light ----- (red)")
defineIndicatorLight("WARN_L_OXY_LOW", 201, "Warning, Caution and IndicatorLights", "Warning Light OXY LOW (red)")
defineIndicatorLight("WARN_L_CANOPY", 202, "Warning, Caution and IndicatorLights", "Warning Light CANOPY (red)")
defineIndicatorLight("WARN_L_HYD_LOW", 203, "Warning, Caution and IndicatorLights", "Warning Light HYD LOW (red)")
defineIndicatorLight("WARN_L_AIR_DATA", 204, "Warning, Caution and IndicatorLights", "Warning Light AIR DATA (red)")
defineIndicatorLight("WARN_L_LOW_FUEL", 205, "Warning, Caution and IndicatorLights", "Warning Light LOW FUEL (red)")
defineIndicatorLight("WARN_L_CABIN_PRESS", 206, "Warning, Caution and IndicatorLights", "Warning Light CABIN PRESS (red)")
defineIndicatorLight("WARN_L_REDUCE_RPM", 207, "Warning, Caution and IndicatorLights", "Warning Light REDUCE RPM (red)")
defineIndicatorLight("WARN_L_CONFIG", 208, "Warning, Caution and IndicatorLights", "Warning Light CONFIG (red)")
defineIndicatorLight("WARN_L_FUEL_PUMP", 209, "Warning, Caution and IndicatorLights", "Warning Light FUEL PUMP (red)")
defineIndicatorLight("WARN_L_AC_SYS", 210, "Warning, Caution and IndicatorLights", "Warning Light AC SYS (red)")
defineIndicatorLight("WARN_L_OIL", 211, "Warning, Caution and IndicatorLights", "Warning Light OIL (red)")   
defineIndicatorLight("WARN_L_DL", 212, "Warning, Caution and IndicatorLights", "Warning Light DL (red)")
defineIndicatorLight("WARN_L_START_PUMP", 213, "Warning, Caution and IndicatorLights", "Warning Light START PUMP (red)")
defineIndicatorLight("WARN_L_DC_GEN", 214, "Warning, Caution and IndicatorLights", "Warning Light DC GEN (red)")
defineIndicatorLight("WARN_L_STARTER", 215, "Warning, Caution and IndicatorLights", "Warning Light STARTER (red)")    
defineIndicatorLight("WARN_L_FCS3", 216, "Warning, Caution and IndicatorLights", "Warning Light FCS 3 (red)")
defineIndicatorLight("WARN_L_BRAKE", 217, "Warning, Caution and IndicatorLights", "Warning Light BRAKE (red)")
defineIndicatorLight("WARN_L_BATT", 218, "Warning, Caution and IndicatorLights", "Warning Light BATT (red)")
defineIndicatorLight("WARN_L_ENG_TEMP", 219, "Warning, Caution and IndicatorLights", "Warning Light ENG TEMP (red)")     
defineIndicatorLight("WARN_L_FCS2", 220, "Warning, Caution and IndicatorLights", "Warning Light FCS 2 (yellow)")
defineIndicatorLight("WARN_L_ANTI_SKID", 221, "Warning, Caution and IndicatorLights", "Warning Light ANTI SKID (yellow)")
defineIndicatorLight("WARN_L_TRU", 222, "Warning, Caution and IndicatorLights", "Warning Light TRU (yellow)") 
defineIndicatorLight("WARN_L_ANTI_SURGE", 223, "Warning, Caution and IndicatorLights", "Warning Light ANTI SURGE (yellow)")      
defineIndicatorLight("WARN_L_FCS1", 224, "Warning, Caution and IndicatorLights", "Warning Light FCS 1 (yellow)")
defineIndicatorLight("WARN_L_NWS", 225, "Warning, Caution and IndicatorLights", "Warning Light NWS (yellow)")
defineIndicatorLight("WARN_L_STATIC_INV", 226, "Warning, Caution and IndicatorLights", "Warning Light STATIC_INV (yellow)") 
defineIndicatorLight("WARN_L_ANTI_ICING", 227, "Warning, Caution and IndicatorLights", "Warning Light ANTI ICING (yellow)")    
defineIndicatorLight("WARN_L_ROLL_CAS", 228, "Warning, Caution and IndicatorLights", "Warning Light ROLL CAS (yellow)")
defineIndicatorLight("WARN_L_ECS", 229, "Warning, Caution and IndicatorLights", "Warning Light ECS (yellow)")
defineIndicatorLight("WARN_L_EMMC", 230, "Warning, Caution and IndicatorLights", "Warning Light EMMC (yellow)") 
defineIndicatorLight("WARN_L_SEC", 231, "Warning, Caution and IndicatorLights", "Warning Light SEC (yellow)")
defineIndicatorLight("WARN_L_YAW_CAS", 232, "Warning, Caution and IndicatorLights", "Warning Light YAW CAS (yellow)")
defineIndicatorLight("WARN_L_EQUIP_HOT", 233, "Warning, Caution and IndicatorLights", "Warning Light EQUIP HOT (yellow)")
defineIndicatorLight("WARN_L_LWC", 234, "Warning, Caution and IndicatorLights", "Warning Light LWC (yellow)") 
defineIndicatorLight("WARN_L_EDU", 235, "Warning, Caution and IndicatorLights", "Warning Light EDU (yellow)")    
defineIndicatorLight("WARN_L_AUTOPILOT", 236, "Warning, Caution and IndicatorLights", "Warning Light AUTOPILOT (yellow)") 
defineIndicatorLight("WARN_L_PITOT_HEAT", 237, "Warning, Caution and IndicatorLights", "Warning Light PITOT HEAT (yellow)")
defineIndicatorLight("WARN_L_AVIONS", 238, "Warning, Caution and IndicatorLights", "Warning Light AVIONS (yellow)")
defineIndicatorLight("WARN_L_DEEC", 239, "Warning, Caution and IndicatorLights", "Warning Light DEEC (yellow)")
defineIndicatorLight("WARN_L_EFCS", 240, "Warning, Caution and IndicatorLights", "Warning Light EFCS (yellow)") 
defineIndicatorLight("WARN_L_SEAT", 241, "Warning, Caution and IndicatorLights", "Warning Light SEAT (yellow)")     
defineIndicatorLight("WARN_L_OXY_BLINK", 242, "Warning, Caution and IndicatorLights", "Warning Light OXY BLINK (green)")

defineIndicatorLight("AAP_BTN_L_ACMI", 260, "Warning, Caution and IndicatorLights", "AAP Button Light ACMI (green)")
defineIndicatorLight("AAP_BTN_L_NULL1", 261, "Warning, Caution and IndicatorLights", "AAP Button Light NULL1 (green)")
defineIndicatorLight("AAP_BTN_L_NULL2", 262, "Warning, Caution and IndicatorLights", "AAP Button Light NULL2 (green)")
defineIndicatorLight("AAP_BTN_L_NULL3", 263, "Warning, Caution and IndicatorLights", "AAP Button Light NULL3 (green)")
defineIndicatorLight("AAP_BTN_L_HMD", 264, "Warning, Caution and IndicatorLights", "AAP Button Light HMD (green)")
defineIndicatorLight("AAP_BTN_L_SPJ", 265, "Warning, Caution and IndicatorLights", "AAP Button Light SPJ (green)")
defineIndicatorLight("AAP_BTN_L_CLDP", 266, "Warning, Caution and IndicatorLights", "AAP Button Light CLDP (green)")
defineIndicatorLight("AAP_BTN_L_IRST", 267, "Warning, Caution and IndicatorLights", "AAP Button Light IRST (green)")
defineIndicatorLight("AAP_BTN_L_RDR", 268, "Warning, Caution and IndicatorLights", "AAP Button Light RDR (green)")
defineIndicatorLight("AAP_BTN_L_SLNK", 269, "Warning, Caution and IndicatorLights", "AAP Button Light SLNK (green)")
defineIndicatorLight("AAP_BTN_L_OESP", 270, "Warning, Caution and IndicatorLights", "AAP Button Light OESP (green)")
defineIndicatorLight("AAP_BTN_L_RWR", 271, "Warning, Caution and IndicatorLights", "AAP Button Light RWR (green)")
defineIndicatorLight("AAP_BTN_L_COM1", 272, "Warning, Caution and IndicatorLights", "AAP Button Light COM1 (green)")
defineIndicatorLight("AAP_BTN_L_COM2", 273, "Warning, Caution and IndicatorLights", "AAP Button Light COM2 (green)")
defineIndicatorLight("AAP_BTN_L_NAV", 274, "Warning, Caution and IndicatorLights", "AAP Button Light NAV (green)")
defineIndicatorLight("AAP_BTN_L_IFF", 275, "Warning, Caution and IndicatorLights", "AAP Button Light IFF (green)")
defineIndicatorLight("AAP_BTN_L_INS", 276, "Warning, Caution and IndicatorLights", "AAP Button Light INS (green)")
defineIndicatorLight("AAP_BTN_L_VMMC1", 277, "Warning, Caution and IndicatorLights", "AAP Button Light VMMC1 (green)")
defineIndicatorLight("AAP_BTN_L_VMMC2", 278, "Warning, Caution and IndicatorLights", "AAP Button Light VMMC2 (green)")
defineIndicatorLight("AAP_BTN_L_SAIU", 279, "Warning, Caution and IndicatorLights", "AAP Button Light SAIU (green)")       
defineIndicatorLight("AAP_BTN_L_CMBT", 280, "Warning, Caution and IndicatorLights", "AAP Button Light CMBT (green)")
defineIndicatorLight("AAP_BTN_L_TRAIN", 281, "Warning, Caution and IndicatorLights", "AAP Button Light TRAIN (green)")     

defineIndicatorLight("RADIO_PAD_ERR_L", 295, "Warning, Caution and IndicatorLights", "Radio PAD Error Light")   

defineIndicatorLight("FLASH_LIGHT_L", 969, "Warning, Caution and IndicatorLights", "Flash Light")

-- Gauges
defineFloat("CANOPY_POS", 38, {0, 1}, "Cockpit", "Canopy Position")
defineFloat("MIRROR_RIGHT", 960, {0, 1}, "Cockpit", "Right Mirror")
defineFloat("MIRROR_CENTER", 961, {0, 1}, "Cockpit", "Center Mirror")
defineFloat("MIRROR_LEFT", 962, {0, 1}, "Cockpit", "Left Mirror")

defineFloat("OXYGEN_NEEDLE", 290, {0, 1}, "Gauges", "Oxygen Pressure Indicator")
defineFloat("MAIN_PNEU_IND", 291, {0, 1}, "Gauges", "Main Pneumatic System Pressure Indicator")
defineFloat("EMERG_PNEU_IND", 292, {0, 1}, "Gauges", "Emergency Pneumatic System Pressure Indicator")
defineFloat("MAG_HDG_BAK", 293, {0, 1}, "Gauges", "Backup Magnetic HDG")

--Externals

defineIntegerFromGetter("EXT_BRAKE_CUTE", function()
	if LoGetAircraftDrawArgumentValue(35) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Brake Cute")

defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP_R", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Top Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_TOP_L", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Top Left Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_BTM_R", function()
	return math.floor(LoGetAircraftDrawArgumentValue(186)*65535)
end, 65535, "External Aircraft Model", "Bottom Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_BTM_L", function()
	return math.floor(LoGetAircraftDrawArgumentValue(188)*65535)
end, 65535, "External Aircraft Model", "Bottom Left Speed Brake")

defineIntegerFromGetter("EXT_POSITION_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Position Light")

defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT_B", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Body Position Light (red)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT_B", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Body Position Light (green)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT_W", function()
	if LoGetAircraftDrawArgumentValue(200) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Wing Position Light (red)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT_W", function()
	if LoGetAircraftDrawArgumentValue(201) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Wing Position Light (green)")

BIOS.protocol.endModule()