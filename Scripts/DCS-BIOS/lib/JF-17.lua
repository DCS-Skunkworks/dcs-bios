BIOS.protocol.beginModule("JF-17", 0x4800)
BIOS.protocol.setExportModuleAircrafts({"JF-17"})

-- Made by WarLord (aka BlackLibrary)
-- v 0.1

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

defineToggleSwitch("GND_JETT_BTN", 12, 3006, 506, "Left Console", "Ground Jettison Button")
defineToggleSwitch("EMERG_JETT_BTN_COVER", 12, 3007, 507, "Left Console", "Emergency Jettison Button Cover")
definePushButton("EMERG_JETT_BTN", 12, 3008, 508, "Left Console", "Emergency Jettison Button")

--MASTER ARM
define3PosTumb("MASTER_ARM_SW", 11, 3009, 509, "Left Console", "Weapon Master Arm Switch")

--LANDING GEAR
define3PosTumb("BRAKE_TEST", 32, 3010, 510, "Left Console", "Brake Test")
defineTumb("BRAKE_PARK_NORM", 32, 3011, 511, 2, {-1,1}, nil, false, "Left Console", "Brake Park/Norm")

define3PosTumb("LIGHT_SW", 4, 3012, 512, "Left Console", "Light Switch - Land/Off/Taxi")
define3PosTumb("FLAP_SW", 35, 3013, 513, "Left Console", "TEF Flap Switch - Up/Down")

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
defineToggleSwitch("FLARE_DISP_BTN_COVER", 12, 3037, 537, "Left Console", "Flare Dispense Button Cover")
definePushButton("FLARE_DISP_BTN", 12, 3038, 538, "Left Console", "Flare Dispense Button")
defineToggleSwitch("EMERG_HYD_PUMP_SW", 34, 3039, 539, "Left Console", "Emergency Hydraulic Pump Switch")
defineToggleSwitch("SHARS_SW", 34, 3040, 540, "Left Console", "SHARS Switch")

defineToggleSwitch("EJECT_SEAT_DESTR_SW", 34, 3041, 541, "Left Console", "Ejection Seat Activate Destruct")
defineToggleSwitch("SELF_DESTR_BTN_COVER", 12, 3042, 542, "Left Console", "Self Destruct Button Cover")
definePushButton("SELF_DESTR_BTN", 12, 3043, 543, "Left Console", "Self Destruct Button")

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
definePushButton("MFCD_C_U5", 47, 3145, 772, "Center Front", "Center MFCD U5")
definePushButton("MFCD_C_U4", 47, 3146, 773, "Center Front", "Center MFCD U4")
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
	
defineRotary("BARO_ALT_SET_KNB", 7, 3207, 840, "Center Front", "BARO Altitude Setting Knob")
definePotentiometer("EMERG_BRAKE_HANDLE", 32, 3208, 841, {0, 1}, "Center Front", "Emergency Brake Handle")

definePushButton("MASTER_WARN_BTN", 5, 3209, 842, "Center Front", "Master Warning")
definePushButton("FIRE_WARN_BTN", 5, 3210, 843, "Center Front", "Fire Warning")
definePushButton("FCS_WARN_BTN", 5, 3211, 844, "Center Front", "FCS Warning")

--------------------------Right Console
defineToggleSwitch("WARNPANEL_DAY_NIGHT_SW", 5, 3212, 900, "Right Console", "Warning Panel Day/Night Switch")

-------------------------------------------------------------------------------------------------------------------------------
-- Warning, Caution and IndicatorLights
defineIndicatorLight("FLASH_LIGHT", 969, "Warning, Caution and IndicatorLights", "Flash Light")

-- Gauges
defineFloat("CANOPY_POS", 38, {0, 1}, "Cockpit", "Canopy Position")
defineFloat("MIRROR_RIGHT", 960, {0, 1}, "Cockpit", "Right Mirror")
defineFloat("MIRROR_CENTER", 961, {0, 1}, "Cockpit", "Center Mirror")
defineFloat("MIRROR_LEFT", 962, {0, 1}, "Cockpit", "Left Mirror")

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