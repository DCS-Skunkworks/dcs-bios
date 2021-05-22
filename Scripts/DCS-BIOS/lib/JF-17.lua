BIOS.protocol.beginModule("JF-17", 0x4800)
BIOS.protocol.setExportModuleAircrafts({"JF-17"})
-- by WarLord (aka BlackLibrary), Matchstick
-- v 1.5a

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
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local defineString = BIOS.util.defineString

-- Remove Arg: Stick #970 ; 
----------------------------------------- BIOS-Profile
--------------------------Left Console
defineMultipositionSwitch("SAIU_SEL_BAK", 11, 3002, 500, 4, 0.333, "Left Console", "Backup SAIU Knob Selector")
definePushButton("GEAR_LIGH_TEST_BTN", 32, 3003, 501, "Left Console", "Landing Gear Indicator Light Test Button")
defineToggleSwitch("GEAR_OVER_BTN_COVER", 32, 3004, 502, "Left Console", "Landing Gear Override Button Cover")
defineToggleSwitch("GEAR_OVER_BTN", 32, 3005, 503, "Left Console", "Landing Gear Override Button")
definePotentiometer("GEAR_IND_LIGHT_KNOB", 32, 3006, 504, {0, 1}, "Left Console", "Landing Gear Indicator Light Knob")
defineToggleSwitch("GEAR_LEVER", 32, 3007, 505, "Left Console", "Landing Gear Lever")

defineToggleSwitch("GND_JETT_BTN", 16, 3008, 506, "Left Console", "Ground Jettison Button")
defineToggleSwitch("EMERG_JETT_BTN_COVER", 16, 3009, 507, "Left Console", "Emergency Jettison Button Cover")
definePushButton("EMERG_JETT_BTN", 16, 3010, 508, "Left Console", "Emergency Jettison Button")

--MASTER ARM
define3PosTumb("MASTER_ARM_SW", 11, 3011, 509, "Left Console", "Weapon Master Arm Switch")

--LANDING GEAR
define3PosTumb("BRAKE_TEST", 32, 3012, 510, "Gear", "Brake Test")
defineTumb("BRAKE_PARK_NORM", 32, 3013, 511, 2, {-1,1}, nil, false, "Gear", "Brake Park/Norm")

define3PosTumb("LND_TAX_LIGHT_SW", 4, 3014, 512, "Gear", "Light Switch - Land/Off/Taxi")
defineTumb("FLAP_SW", 35, 3015, 513, 2, {-1,1}, nil, false, "Gear", "TEF Flap Switch - Up/Down")

--FUEL
defineToggleSwitch("FEED_CUT_VALVE_COVER", 33, 3016, 514, "Fuel" , "Feed Cut-off Valve Cover")
defineToggleSwitch("FEED_CUT_VALVE", 33, 3017, 515, "Fuel" , "Feed Cut-off Valve")
defineToggleSwitch("ACT_FUEL_CUT_VALVE_COVER", 33, 3018, 516, "Fuel" , "Active Fuel Cut-off Valve Cover")
defineToggleSwitch("ACT_FUEL_CUT_VALVE", 33, 3019, 517, "Fuel" , "Active Fuel Cut-off Valve")
defineToggleSwitch("FUEL_PUMP_SW", 33, 3020, 518, "Fuel" , "Fuel Pump Switch")
define3PosTumb("AAR_SW", 33, 3066, 564, "Fuel", "AAR Switch")

--ENG
defineToggleSwitch("ENG_CONTR_SW", 34, 3021, 519, "Engine", "Engine Control Switch")
defineToggleSwitch("AIR_START_BTN_COVER", 34, 3063, 561, "Engine" , "Air Start Button Cover")
defineToggleSwitch("AIR_START_BTN", 34, 3022, 520, "Engine", "Air Start Button")
definePushButton("GND_START_BTN", 34, 3023, 521, "Engine", "Ground Start Button")
define3PosTumb("ENG_MODE_SW", 34, 3024, 522, "Engine", "Engine Mode Switch")
defineToggleSwitch("SEC_EEC_SW", 34, 3025, 523, "Engine", "SEC EEC Switch")
defineToggleSwitch("AFTERBURN_SW", 34, 3026, 524, "Engine", "Afterburner Switch")
defineToggleSwitch("ANTI_SURGE_SW", 34, 3027, 525, "Engine", "Anti-Surge Switch")
define3PosTumb("START_MODE_SEL", 34, 3028, 526, "Engine", "Start Mode Selector - START/ENG COLD/STARTER COLD")

--FCS
defineToggleSwitch("RECORD_SW", 35, 3029, 527, "FCS", "Record Switch")
defineToggleSwitch("EFCS_SW", 35, 3030, 528, "FCS", "EFCS Switch")
defineToggleSwitch("YAW_ROLL_CAS_SW", 35, 3031, 529, "FCS", "Yaw/Roll CAS Switch")
defineToggleSwitch("DIRECT_MODE_SW", 35, 3032, 530, "FCS", "Direct Mode Switch")
defineToggleSwitch("BIT_BTN", 35, 3033, 531, "FCS", "BIT Button")

define3PosTumb("YAW_TRIM_SW", 35, 3034, 532, "FCS", "Yaw Trim Switch")
definePushButton("FCS_RESET_BTN", 35, 3046, 544, "FCS", "FCS Reset Button")
defineToggleSwitch("FLGHT_TEST_1_SW", 35, 3035, 533, "FCS", "Flight Test Switch 1")
defineToggleSwitch("FLGHT_TEST_2_SW", 35, 3036, 534, "FCS", "Flight Test Switch 2")
defineToggleSwitch("AG1_AG2_SW", 35, 3037, 535, "FCS", "AG1/AG2 Switch")---
defineToggleSwitch("AA_AG_SW", 35, 3038, 536, "FCS", "AA/AG Switch")

--MISC
defineToggleSwitch("FLARE_DISP_BTN_COVER", 28, 3039, 537, "Misc", "Flare Dispense Button Cover")
definePushButton("FLARE_DISP_BTN", 38, 3040, 538, "Misc", "Flare Dispense Button")
defineToggleSwitch("EMERG_HYD_PUMP_SW", 38, 3041, 539, "Misc", "Emergency Hydraulic Pump Switch")
defineToggleSwitch("SHARS_SW", 38, 3042, 540, "Misc", "SHARS Switch")
defineToggleSwitch("PH_TEST_SW", 38, 3065, 563, "Misc", "P.H. Test Switch")
defineToggleSwitch("CSS_SW", 38, 3064, 562, "Misc", "CSS Handle")
defineToggleSwitch("EJECT_SEAT_DESTR_SW", 37, 3043, 541, "Misc", "Ejection Seat Activate Destruct")
defineToggleSwitch("SELF_DESTR_BTN_COVER", 37, 3044, 542, "Misc", "Self Destruct Button Cover")
definePushButton("SELF_DESTR_BTN", 37, 3045, 543, "Misc", "Self Destruct Button")

--RADIO
definePotentiometer("RADIO_VOL", 24, 3047, 545, {0, 1}, "Radio", "Radio Volume Knob")
defineToggleSwitch("RADIO_SQUELCH", 24, 3048, 546, "Radio", "Squelch OFF/SQL/ACKN")
defineMultipositionSwitch("RADIO_MODE_SEL", 24, 3049, 547, 6, 0.2, "Radio", "Radio Mode Selector")    
definePushButton("RADIO_CONT_HANDOVER", 24, 3050, 548, "Radio", "Radio Control Handover")
definePushButton("RADIO_BTN_1", 24, 3051, 549, "Radio", "Radio Button 1/TONE")
definePushButton("RADIO_BTN_2", 24, 3052, 550, "Radio", "Radio Button 2/-")
definePushButton("RADIO_BTN_3", 24, 3053, 551, "Radio", "Radio Button 3/+")
definePushButton("RADIO_BTN_4", 24, 3054, 552, "Radio", "Radio Button 4/H")
definePushButton("RADIO_BTN_5", 24, 3055, 553, "Radio", "Radio Button 5/A")
definePushButton("RADIO_BTN_6", 24, 3056, 554, "Radio", "Radio Button 6/M")
definePushButton("RADIO_BTN_7", 24, 3057, 555, "Radio", "Radio Button 7/P")
definePushButton("RADIO_BTN_8", 24, 3058, 556, "Radio", "Radio Button 8/C")
definePushButton("RADIO_BTN_9", 24, 3059, 557, "Radio", "Radio Button 9/T")
definePushButton("RADIO_BTN_MAN", 24, 3060, 558, "Radio", "Radio Button <-/MAN")
definePushButton("RADIO_BTN_0", 24, 3061, 559, "Radio", "Radio Button 0/PRE")
definePushButton("RADIO_BTN_ENT", 24, 3062, 560, "Radio", "Radio Button ->/ENT")

--THROTTLE
definePotentiometer("THROTTLE_FRIC", 34, 3072, 570, {0, 1}, "Throttle", "Throttle Friction Handle")
definePushButton("THROTTLE_UNCAGE", 34, 3073, 571, "Throttle", "Throttle Uncage: Stop To Idle")
definePushButton("THROTTLE_CAGE", 34, 3074, 572, "Throttle", "Throttle Cage: Idle To Stop")
defineToggleSwitch("THROTTLE_EMERG_BTN", 34, 3075, 573, "Throttle", "Throttle Emergency Button")

--------------------------Center Front
-- UFCP
definePushButton("UFCP_BTN_1", 46, 3202, 700, "UFCP", "UFCP Button PFL/1")
definePushButton("UFCP_BTN_2", 46, 3203, 701, "UFCP", "UFCP Button VRC/2")
definePushButton("UFCP_BTN_3", 46, 3204, 702, "UFCP", "UFCP Button 3")
definePushButton("UFCP_BTN_L1", 46, 3205, 703, "UFCP", "UFCP Button L1")
definePushButton("UFCP_BTN_R1", 46, 3206, 704, "UFCP", "UFCP Button R1")
definePushButton("UFCP_BTN_OAP", 46, 3207, 705, "UFCP", "UFCP Button OAP")
definePushButton("UFCP_BTN_MRK", 46, 3208, 706, "UFCP", "UFCP Button MRK")
definePushButton("UFCP_BTN_4", 46, 3209, 707, "UFCP", "UFCP Button DST/4")
definePushButton("UFCP_BTN_5", 46, 3210, 708, "UFCP", "UFCP Button TOT/5")
definePushButton("UFCP_BTN_6", 46, 3211, 709, "UFCP", "UFCP Button TOD/6")
definePushButton("UFCP_BTN_L2", 46, 3212, 710, "UFCP", "UFCP Button L2")
definePushButton("UFCP_BTN_R2", 46, 3213, 711, "UFCP", "UFCP Button R2")
definePushButton("UFCP_BTN_PU", 46, 3214, 712, "UFCP", "UFCP Button P.U")
definePushButton("UFCP_BTN_HNS", 46, 3215, 713, "UFCP", "UFCP Button HNS")
definePushButton("UFCP_BTN_7", 46, 3216, 714, "UFCP", "UFCP Button FUL/7")
definePushButton("UFCP_BTN_8", 46, 3217, 715, "UFCP", "UFCP Button IFF/8")
definePushButton("UFCP_BTN_9", 46, 3218, 716, "UFCP", "UFCP Button 9")
definePushButton("UFCP_BTN_L3", 46, 3219, 717, "UFCP", "UFCP Button L3")
definePushButton("UFCP_BTN_R3", 46, 3220, 718, "UFCP", "UFCP Button R3")
definePushButton("UFCP_BTN_AP", 46, 3221, 719, "UFCP", "UFCP Button A/P")
definePushButton("UFCP_BTN_FPM", 46, 3222, 720, "UFCP", "UFCP Button FPM")
definePushButton("UFCP_BTN_RTN", 46, 3223, 721, "UFCP", "UFCP Button RTN")
definePushButton("UFCP_BTN_0", 46, 3224, 722, "UFCP", "UFCP Button 0")
definePushButton("UFCP_BTN_NA1", 46, 3225, 723, "UFCP", "UFCP Button N/A (1)")
definePushButton("UFCP_BTN_L4", 46, 3226, 724, "UFCP", "UFCP Button L4")
definePushButton("UFCP_BTN_R4", 46, 3227, 725, "UFCP", "UFCP Button R4")
definePushButton("UFCP_BTN_NA2", 46, 3228, 726, "UFCP", "UFCP Button N/A (2)")
definePushButton("UFCP_BTN_NA3", 46, 3229, 727, "UFCP", "UFCP Button N/A (3)")
	
definePotentiometer("HUD_CONTR_KNB", 46, 3230, 728, {0, 1}, "UFCP", "HUD Contrast Knob")
definePotentiometer("HUD_BRIGHT_KNB", 46, 3231, 729, {0, 1}, "UFCP", "HUD Brightness Knob")
define3PosTumb("UFCP_PLUS_MINUS_SW", 46, 3232, 730, "UFCP", "+/,/- Switch")
definePotentiometer("HUD_BAK_RETICLE_KNB", 46, 3233, 731, {0, 1}, "UFCP", "HUD Backup Reticle Knob")
definePotentiometer("UFCP_BRIGHT_KNB", 46, 3234, 732, {0, 1}, "UFCP", "UFCP Brightness Knob")	
define3PosTumb("PARACHUTE_DEPLOY_JETT", 35, 3235, 733, "UFCP", "Deploy/Jettison Parachute")

--Left MFCD
definePushButton("MFCD_L_SYM_PLUS", 47, 3236, 734, "MFCD Left", "Left MFCD Sym +")
definePushButton("MFCD_L_SYM_MINUS", 47, 3237, 735, "MFCD Left", "Left MFCD Sym -")
definePushButton("MFCD_L_U1", 47, 3238, 736, "MFCD Left", "Left MFCD U1")
definePushButton("MFCD_L_U2", 47, 3239, 737, "MFCD Left", "Left MFCD U2")
definePushButton("MFCD_L_U3", 47, 3240, 738, "MFCD Left", "Left MFCD U3")
definePushButton("MFCD_L_U4", 47, 3241, 739, "MFCD Left", "Left MFCD U4")
definePushButton("MFCD_L_U5", 47, 3242, 740, "MFCD Left", "Left MFCD U5")
definePushButton("MFCD_L_PW", 47, 3243, 741, "MFCD Left", "Left MFCD Power")
definePushButton("MFCD_L_L1", 47, 3244, 742, "MFCD Left", "Left MFCD L1")
definePushButton("MFCD_L_L2", 47, 3245, 743, "MFCD Left", "Left MFCD L2")
definePushButton("MFCD_L_L3", 47, 3246, 744, "MFCD Left", "Left MFCD L3")
definePushButton("MFCD_L_L4", 47, 3247, 745, "MFCD Left", "Left MFCD L4")
definePushButton("MFCD_L_L5", 47, 3248, 746, "MFCD Left", "Left MFCD L5")
definePushButton("MFCD_L_L6", 47, 3249, 747, "MFCD Left", "Left MFCD L6")
definePushButton("MFCD_L_L7", 47, 3250, 748, "MFCD Left", "Left MFCD L7")
definePushButton("MFCD_L_L8", 47, 3251, 749, "MFCD Left", "Left MFCD L8")
definePushButton("MFCD_L_R1", 47, 3252, 750, "MFCD Left", "Left MFCD R1")
definePushButton("MFCD_L_R2", 47, 3253, 751, "MFCD Left", "Left MFCD R2")
definePushButton("MFCD_L_R3", 47, 3254, 752, "MFCD Left", "Left MFCD R3")
definePushButton("MFCD_L_R4", 47, 3255, 753, "MFCD Left", "Left MFCD R4")
definePushButton("MFCD_L_R5", 47, 3256, 754, "MFCD Left", "Left MFCD R5")
definePushButton("MFCD_L_R6", 47, 3257, 755, "MFCD Left", "Left MFCD R6")
definePushButton("MFCD_L_R7", 47, 3258, 756, "MFCD Left", "Left MFCD R7")
definePushButton("MFCD_L_R8", 47, 3259, 757, "MFCD Left", "Left MFCD R8")
definePushButton("MFCD_L_CONT_PLUS", 47, 3260, 758, "MFCD Left", "Left MFCD Cont +")
definePushButton("MFCD_L_CONT_MINUS", 47, 3261, 759, "MFCD Left", "Left MFCD Cont -")
definePushButton("MFCD_L_D1", 47, 3262, 760, "MFCD Left", "Left MFCD D1")
definePushButton("MFCD_L_D2", 47, 3263, 761, "MFCD Left", "Left MFCD D2")
definePushButton("MFCD_L_D3", 47, 3264, 762, "MFCD Left", "Left MFCD D3")
definePushButton("MFCD_L_D4", 47, 3265, 763, "MFCD Left", "Left MFCD D4")
definePushButton("MFCD_L_D5", 47, 3266, 764, "MFCD Left", "Left MFCD D5")
definePushButton("MFCD_L_BRT_PLUS", 47, 3267, 765, "MFCD Left", "Left MFCD Brightness +")
definePushButton("MFCD_L_BRT_MINUS", 47, 3268, 766, "MFCD Left", "Left MFCD Brightness -")

--Center MFCD
definePushButton("MFCD_C_SYM_PLUS", 47, 3269, 767, "MFCD Center", "Center MFCD Sym +")
definePushButton("MFCD_C_SYM_MINUS", 47, 3270, 768, "MFCD Center", "Center MFCD Sym -")
definePushButton("MFCD_C_U1", 47, 3271, 769, "MFCD Center", "Center MFCD U1")
definePushButton("MFCD_C_U2", 47, 3272, 770, "MFCD Center", "Center MFCD U2")
definePushButton("MFCD_C_U3", 47, 3273, 771, "MFCD Center", "Center MFCD U3")
definePushButton("MFCD_C_U4", 47, 3274, 772, "MFCD Center", "Center MFCD U4")
definePushButton("MFCD_C_U5", 47, 3275, 773, "MFCD Center", "Center MFCD U5")
definePushButton("MFCD_C_PW", 47, 3276, 774, "MFCD Center", "Center MFCD Power")
definePushButton("MFCD_C_L1", 47, 3277, 775, "MFCD Center", "Center MFCD L1")
definePushButton("MFCD_C_L2", 47, 3278, 776, "MFCD Center", "Center MFCD L2")
definePushButton("MFCD_C_L3", 47, 3279, 777, "MFCD Center", "Center MFCD L3")
definePushButton("MFCD_C_L4", 47, 3280, 778, "MFCD Center", "Center MFCD L4")
definePushButton("MFCD_C_L5", 47, 3281, 779, "MFCD Center", "Center MFCD L5")
definePushButton("MFCD_C_L6", 47, 3282, 780, "MFCD Center", "Center MFCD L6")
definePushButton("MFCD_C_L7", 47, 3283, 781, "MFCD Center", "Center MFCD L7")
definePushButton("MFCD_C_L8", 47, 3284, 782, "MFCD Center", "Center MFCD L8")
definePushButton("MFCD_C_R1", 47, 3285, 783, "MFCD Center", "Center MFCD R1")
definePushButton("MFCD_C_R2", 47, 3286, 784, "MFCD Center", "Center MFCD R2")
definePushButton("MFCD_C_R3", 47, 3287, 785, "MFCD Center", "Center MFCD R3")
definePushButton("MFCD_C_R4", 47, 3288, 786, "MFCD Center", "Center MFCD R4")
definePushButton("MFCD_C_R5", 47, 3289, 787, "MFCD Center", "Center MFCD R5")
definePushButton("MFCD_C_R6", 47, 3290, 788, "MFCD Center", "Center MFCD R6")
definePushButton("MFCD_C_R7", 47, 3291, 789, "MFCD Center", "Center MFCD R7")
definePushButton("MFCD_C_R8", 47, 3292, 790, "MFCD Center", "Center MFCD R8")
definePushButton("MFCD_C_D1", 47, 3293, 791, "MFCD Center", "Center MFCD D1")
definePushButton("MFCD_C_D2", 47, 3294, 792, "MFCD Center", "Center MFCD D2")
definePushButton("MFCD_C_D3", 47, 3295, 793, "MFCD Center", "Center MFCD D3")
definePushButton("MFCD_C_D4", 47, 3296, 794, "MFCD Center", "Center MFCD D4")
definePushButton("MFCD_C_D5", 47, 3297, 795, "MFCD Center", "Center MFCD D5")
definePushButton("MFCD_C_CONT_PLUS", 47, 3298, 796, "MFCD Center", "Center MFCD Cont +")
definePushButton("MFCD_C_CONT_MINUS", 47, 3299, 797, "MFCD Center", "Center MFCD Cont -")
definePushButton("MFCD_C_BRT_PLUS", 47, 3300, 798, "MFCD Center", "Center MFCD Brightness +")
definePushButton("MFCD_C_BRT_MINUS", 47, 3301, 799, "MFCD Center", "Center MFCD Brightness -")

-- Right MFCD
definePushButton("MFCD_R_SYM_PLUS", 47, 3302, 800, "MFCD Right", "Right MFCD Sym +")
definePushButton("MFCD_R_SYM_MINUS", 47, 3303, 801, "MFCD Right", "Right MFCD Sym -")
definePushButton("MFCD_R_U1", 47, 3304, 802, "MFCD Right", "Right MFCD U1")
definePushButton("MFCD_R_U2", 47, 3305, 803, "MFCD Right", "Right MFCD U2")
definePushButton("MFCD_R_U3", 47, 3306, 804, "MFCD Right", "Right MFCD U3")
definePushButton("MFCD_R_U4", 47, 3307, 805, "MFCD Right", "Right MFCD U4")
definePushButton("MFCD_R_U5", 47, 3308, 806, "MFCD Right", "Right MFCD U5")
definePushButton("MFCD_R_PW", 47, 3309, 807, "MFCD Right", "Right MFCD Power")
definePushButton("MFCD_R_L1", 47, 3310, 808, "MFCD Right", "Right MFCD L1")
definePushButton("MFCD_R_L2", 47, 3311, 809, "MFCD Right", "Right MFCD L2")
definePushButton("MFCD_R_L3", 47, 3312, 810, "MFCD Right", "Right MFCD L3")
definePushButton("MFCD_R_L4", 47, 3313, 811, "MFCD Right", "Right MFCD L4")
definePushButton("MFCD_R_L5", 47, 3314, 812, "MFCD Right", "Right MFCD L5")
definePushButton("MFCD_R_L6", 47, 3315, 813, "MFCD Right", "Right MFCD L6")
definePushButton("MFCD_R_L7", 47, 3316, 814, "MFCD Right", "Right MFCD L7")
definePushButton("MFCD_R_L8", 47, 3317, 815, "MFCD Right", "Right MFCD L8")
definePushButton("MFCD_R_R1", 47, 3318, 816, "MFCD Right", "Right MFCD R1")
definePushButton("MFCD_R_R2", 47, 3319, 817, "MFCD Right", "Right MFCD R2")
definePushButton("MFCD_R_R3", 47, 3320, 818, "MFCD Right", "Right MFCD R3")
definePushButton("MFCD_R_R4", 47, 3321, 819, "MFCD Right", "Right MFCD R4")
definePushButton("MFCD_R_R5", 47, 3322, 820, "MFCD Right", "Right MFCD R5")
definePushButton("MFCD_R_R6", 47, 3323, 821, "MFCD Right", "Right MFCD R6")
definePushButton("MFCD_R_R7", 47, 3324, 822, "MFCD Right", "Right MFCD R7")
definePushButton("MFCD_R_R8", 47, 3325, 823, "MFCD Right", "Right MFCD R8")
definePushButton("MFCD_R_D1", 47, 3326, 824, "MFCD Right", "Right MFCD D1")
definePushButton("MFCD_R_D2", 47, 3327, 825, "MFCD Right", "Right MFCD D2")
definePushButton("MFCD_R_D3", 47, 3328, 826, "MFCD Right", "Right MFCD D3")
definePushButton("MFCD_R_D4", 47, 3329, 827, "MFCD Right", "Right MFCD D4")
definePushButton("MFCD_R_D5", 47, 3330, 828, "MFCD Right", "Right MFCD D5")
definePushButton("MFCD_R_CONT_PLUS", 47, 3331, 829, "MFCD Right", "Right MFCD Cont +")
definePushButton("MFCD_R_CONT_MINUS", 47, 3332, 830, "MFCD Right", "Right MFCD Cont -")
definePushButton("MFCD_R_BRT_PLUS", 47, 3333, 831, "MFCD Right", "Right MFCD Brightness +")
definePushButton("MFCD_R_BRT_MINUS", 47, 3334, 832, "MFCD Right", "Right MFCD Brightness -")
	
defineRotary("BARO_ALT_SET_KNB", 8, 3342, 840, "Center Front", "BARO Altitude Setting Knob")
definePotentiometer("EMERG_BRAKE_HANDLE", 32, 3343, 841, {0, 1}, "Center Front", "Emergency Brake Handle")

definePushButton("MASTER_WARN_BTN", 5, 3344, 842, "Center Front", "Master Warning")
definePushButton("FIRE_WARN_BTN", 5, 3345, 843, "Center Front", "Fire Warning")
definePushButton("FCS_WARN_BTN", 5, 3346, 844, "Center Front", "FCS Warning")

defineToggleSwitch("DIG_CLOCK_SW", 49, 3347, 845, "Clock", "Digital Clock Switch")
definePushButton("DIG_CLOCK_BRT_UP", 49, 3348, 846, "Clock", "Digital Clock Brightness +")
definePushButton("DIG_CLOCK_BRT_DN", 49, 3349, 847, "Clock", "Digital Clock Brightness -")
definePushButton("DIG_CLOCK_UTC", 49, 3350, 848, "Clock", "Digital Clock UTC")
definePushButton("DIG_CLOCK_CHR", 49, 3351, 849, "Clock", "Digital Clock CHR")

--------------------------Right Console
defineToggleSwitch("WARNPANEL_DAY_NIGHT_SW", 5, 3402, 900, "Right Console", "Warning Panel Day/Night Switch")
definePotentiometer("WARNPANEL_BRIGHT_KNB", 5, 3403, 901, {0, 1}, "Right Console", "Warning Panel Brightness Knob")
definePushButton("WARNPANEL_TEST_BTN", 5, 3404, 902, "Right Console", "Warning Panel Test Button")
definePotentiometer("OXY_IND_BRIGHT_KNB", 5, 3405, 903, {0, 1}, "Right Console", "Oxygen Indicator Brightness Knob")

defineToggleSwitch("BATT_SW", 1, 3406, 904, "Right Console", "Battery Switch")
defineToggleSwitch("MAIN_AC_GEN_SW", 1, 3407, 905, "Right Console", "Main AC Gen Switch")
defineToggleSwitch("DC_GEN_SW", 1, 3408, 906, "Right Console", "DC Gen Switch")

defineToggleSwitch("HUD_MFCD_DAY_NIGHT_SW", 7, 3409, 907, "Right Console", "HUD/MFCD Day/Night Switch")

defineMultipositionSwitch("INS_MODE_SEL_KNB", 18, 3410, 908, 4, 0.333, "Right Console", "INS Mode Knob Selector")

--AAP 
definePotentiometer("AAP_BRIGHT_KNB", 7, 3411, 909, {0, 1}, "AAP", "AAP Brightness Knob")
defineToggleSwitch("HUD_SYMB_REJECT_SW", 7, 3412, 910, "AAP", "HUD Symbology Reject Switch")
definePushButton("AAP_ACMI_BTN", 7, 3413, 911, "AAP", "AAP ACMI Button")
definePushButton("AAP_NA1_BTN", 7, 3414, 912, "AAP", "AAP N/A 1 Button")
definePushButton("AAP_NA2_BTN", 7, 3415, 913, "AAP", "AAP N/A 2 Button")
definePushButton("AAP_NA3_BTN", 7, 3416, 914, "AAP", "AAP N/A 3 Button")
definePushButton("AAP_HMD_BTN", 7, 3417, 915, "AAP", "AAP HMD Button")
definePushButton("AAP_SPJ_BTN", 7, 3418, 916, "AAP", "AAP SPJ Button")
definePushButton("AAP_CLDP_BTN", 7, 3419, 917, "AAP", "AAP CLDP Button")
definePushButton("AAP_IRST_BTN", 7, 3420, 918, "AAP", "AAP IRST Button")
definePushButton("AAP_RDR_BTN", 7, 3421, 919, "AAP", "AAP RDR Button")
definePushButton("AAP_SLNK_BTN", 7, 3422, 920, "AAP", "AAP SLNK Button")
definePushButton("AAP_OESP_BTN", 7, 3423, 921, "AAP", "AAP OESP Button")
definePushButton("AAP_RWR_BTN", 7, 3424, 922, "AAP", "AAP RWR Button")
definePushButton("AAP_COM1_BTN", 7, 3425, 923, "AAP", "AAP COM1 Button")
definePushButton("AAP_COM2_BTN", 7, 3426, 924, "AAP", "AAP COM2 Button")
definePushButton("AAP_NAV_BTN", 7, 3427, 925, "AAP", "AAP NAV Button")
definePushButton("AAP_IFF_BTN", 7, 3428, 926, "AAP", "AAP IFF Button")
definePushButton("AAP_INS_BTN", 7, 3429, 927, "AAP", "AAP INS Button")
definePushButton("AAP_WMMC1_BTN", 7, 3430, 928, "AAP", "AAP WMMC1 Button")
definePushButton("AAP_WMMC2_BTN", 7, 3431, 929, "AAP", "AAP WMMC2 Button")
definePushButton("AAP_SAIU_BTN", 7, 3432, 930, "AAP", "AAP SAIU Button")
definePushButton("AAP_CMBT_BTN", 7, 3433, 931, "AAP", "AAP CMBT Button")
definePushButton("AAP_TRAIN_BTN", 7, 3434, 932, "AAP", "AAP TRAIN Button")
definePushButton("AAP_OFF_BTN", 7, 3435, 933, "AAP", "AAP OFF Button")

-- ACP
definePotentiometer("COM1_VOL_KNB", 29, 3436, 934, {0, 1}, "ACP", "COM1 Volume Knob")
defineToggleSwitch("INTERCOM_SW", 29, 3437, 935, "ACP", "Intercom Switch")
defineToggleSwitch("RADIO_ANT_TOP_BOTTOM_SW", 29, 3438, 936, "ACP", "Radio Top/Bottom Antenna Switch")
defineToggleSwitch("SPEAKER_CHN_ANT_SW", 29, 3439, 937, "ACP", "Speaker Control Box Channel Antenna Switch")
definePotentiometer("COM2_VOL_KNB", 29, 3440, 938, {0, 1}, "ACP", "COM2 Volume Knob")
definePotentiometer("TCN_ILS_VOL_KNB", 29, 3441, 939, {0, 1}, "ACP", "TCN/ILS Volume Knob")
definePotentiometer("MSL_VOL_KNB", 29, 3442, 940, {0, 1}, "ACP", "MSL Volume Knob")

-- ECS
defineMultipositionSwitch("AIR_TEMP_SEL", 30, 3443, 941, 12, 0.0833, "ECS", "Air Temp Knob Selector")
defineMultipositionSwitch("ECS_MODE_SEL", 30, 3444, 942, 4, 0.333, "ECS", "ECS Mode Knob Selector")
definePushButton("DEFOG_SW", 30, 3445, 943, "ECS", "Defog Switch")

-- INT Lights
definePotentiometer("INST_LIGHT_KNB", 4, 3446, 944, {0, 1}, "Lights", "Instrument Light Knob")
definePotentiometer("CONSOLE_LIGHT_KNB", 4, 3447, 945, {0, 1}, "Lights", "Console Light Knob")
definePotentiometer("FLOOD_LIGHT_KNB", 4, 3448, 946, {0, 1}, "Lights", "Flood Light Knob")

-- EXT Lights
define3PosTumb("EXT_LIGHT_MASTER_SW", 4, 3449, 947, "Lights", "Exterior Light Master Switch")
defineMultipositionSwitch("FORMATION_LIGHT_SEL", 4, 3450, 948, 5, 0.25, "Lights", "Formation Light Knob Selector")
defineMultipositionSwitch("ANTICOLL_LIGHT_SEL", 4, 3451, 949, 5, 0.25, "Lights", "Anti-Collision Light Knob Selector")
define3PosTumb("NAV_LIGHT_BRIGHT_SW", 4, 3452, 950, "Lights", "Navigation Light Switch - Bright/Off/Dim")
defineTumb("NAV_LIGHT_FLASH_SW", 4, 3453, 951, 2, {-1,1}, nil, false, "Lights", "Navigation Light Switch - Flash/Steady")
define3PosTumb("ANTI_COL_LIGHT_SW", 4, 3454, 952, "Lights", "Light Switch - Tow/Off/Anti-Collision")

defineTumb("AAR_L_SW", 4, 3465, 963, 2, {-1,1}, nil, false, "Lights", "AAR Light Switch")
definePotentiometer("AAR_L_BRT_KNB", 4, 3466, 964, {0, 1}, "Lights", "AAR Light Brightness Knob")

-- DTC
definePushButton("DTC_INSERT", 9, 3455, 953, "Right Console", "DTC Card Insertion")
definePushButton("DTC_EJECT", 9, 3476, 974, "Right Console", "DTC Card Ejection")

-- Emergency LG
defineToggleSwitch("EMERG_GEAR_COVER", 32, 3456, 954, "Gear", "Emergency Landing Gear Cover")
defineMultipositionSwitch("EMERG_GEAR_HANDLE", 32, 3457, 955, 5, 0.25, "Gear", "Emergency Landing Gear Handle")

-- Canopy
defineToggleSwitch("CANOPY_SEAL", 35, 3459, 957, "Canopy", "Canopy Seal Handle")
defineMultipositionSwitch("CANOPY_OPEN_CLOSE", 35, 3460, 958, 4, 0.333, "Canopy", "Canopy Open/Close Handle")
defineRotary("CANOPY_OPEN_CLOSE_MAN", 35, 3461, 959, "Canopy", "Canopy Manual Open/Close Crank")

-- Flood light direction
definePotentiometer("FLOOD_LIGHT_DIRECT_1", 4, 3467, 965, {0, 1}, "Lights", "Flood Light Direction 1")
definePotentiometer("FLOOD_LIGHT_DIRECT_2", 4, 3468, 966, {0, 1}, "Lights", "Flood Light Direction 2")
definePotentiometer("FLOOD_LIGHT_DIRECT_3", 4, 3469, 967, {0, 1}, "Lights", "Flood Light Direction 3")
definePotentiometer("FLOOD_LIGHT_DIRECT_4", 4, 3470, 968, {0, 1}, "Lights", "Flood Light Direction 4")

-- Flash light
defineToggleSwitch("FLASH_LIGHT", 0, 3256, 969, "Lights", "Flash Light")

-- Stick
defineToggleSwitch("STICK_HIDE", 38, 3472, 970, "Right Console", "Stick Show/Hide")
definePushButton("AP_DISENGAGE", 6, 3473, 971, "Right Console", "A/P Disengage")

-- Eject Seat
defineToggleSwitch("SEAT_SAFE_HANDLE", 38, 3474, 972, "Right Console", "Eject Seat Safe/Arm Handle")
defineToggleSwitch("SEAT_SAFE_PIN", 38, 3475, 973, "Right Console", "Eject Seat Firing Handle Safety Pin")
define3PosTumb("SEAT_POS_ADJUST", 38, 3482, 980, "Right Console", "Eject Seat Position Adjust")


-- Oxygen
defineToggleSwitch("OXY_CONNECTOR", 31, 3477, 975, "Right Console", "Oxygen Tube Connector")
defineRotary("OXY_SUPPLY_VALVE", 31, 3478, 976, "Right Console", "Oxygen Supply Valve")
defineToggleSwitch("OXY_O2_100", 31, 3479, 977, "Right Console", "Oxygen 100% O2")
defineToggleSwitch("SEAT_EMERG_O2", 31, 3480, 978, "Right Console", "Eject Seat Emergency O2")
defineToggleSwitch("GSUIT_TUBE", 31, 3481, 979, "Right Console", "G-Suit Connector")


-- Mirrors
defineToggleSwitch("MIRROR_R", 0, 1625, 960, "Canopy", "Right Mirror")
defineToggleSwitch("MIRROR_T", 0, 1625, 961, "Canopy", "Top Mirror")
defineToggleSwitch("MIRROR_L", 0, 1625, 962, "Canopy", "Left Mirror")

-------------------------------------------------------------------------------------------------------------------------------
-- Warning, Caution and IndicatorLights
defineIndicatorLight("LG_L_TRANS", 100, "Warning, Caution and IndicatorLights", "Landing Gear Transition Light (red)")
defineIndicatorLight("LG_L_LEFT", 101, "Warning, Caution and IndicatorLights", "Landing Gear Left Light (green)")
defineIndicatorLight("LG_L_NOSE", 102, "Warning, Caution and IndicatorLights", "Landing Gear Nose Light (green)")
defineIndicatorLight("LG_L_RIGHT", 103, "Warning, Caution and IndicatorLights", "Landing Gear Right Light (green)")    
defineIndicatorLight("LG_L_S_B", 104, "Warning, Caution and IndicatorLights", "Landing Gear SB Light (green)")
defineIndicatorLight("LG_L_D_CH", 105, "Warning, Caution and IndicatorLights", "Landing Gear D CH Light (red)")
defineIndicatorLight("LG_L_TEF", 106, "Warning, Caution and IndicatorLights", "Landing Gear TEF Light (green)")   

defineIndicatorLight("FCS_RESET_L", 110, "Warning, Caution and IndicatorLights", "FCS Reset Light (green)")     

defineIndicatorLight("BACK_CONSOLES_L", 120, "Warning, Caution and IndicatorLights", "Console Backlights (green)")
defineIndicatorLight("BACK_INST_DISP_L", 121, "Warning, Caution and IndicatorLights", "Instrument Display Backlights (green)")
defineIndicatorLight("BACK_CLOCK_L", 122, "Warning, Caution and IndicatorLights", "Clock Backlights") 
defineIndicatorLight("WARN_L_BRT", 123, "Warning, Caution and IndicatorLights", "Warn Lights Brightness") 
defineIndicatorLight("BACK_FLOOD_L", 125, "Warning, Caution and IndicatorLights", "All Flood Backlights (green)")    
    
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

defineIndicatorLight("RADIO_PAD_ERR_L", 295, "Warning, Caution and IndicatorLights", "Radio PAD Error Light (red)")

defineIndicatorLight("AAR_L", 419, "Warning, Caution and IndicatorLights", "AAR Light")    

defineIndicatorLight("FLASH_LIGHT_L", 969, "Warning, Caution and IndicatorLights", "Flash Light")

defineIndicatorLight("MFCD_BACKLIGHT_L", 140, "Warning, Caution and IndicatorLights", "MFCD Backlight Left")
defineIndicatorLight("MFCD_BACKLIGHT_C", 142, "Warning, Caution and IndicatorLights", "MFCD Backlight Center")
defineIndicatorLight("MFCD_BACKLIGHT_R", 144, "Warning, Caution and IndicatorLights", "MFCD Backlight Right")

-- Gauges
defineFloat("CANOPY_POS", 38, {0, 1}, "Cockpit", "Canopy Position")
defineFloat("MIRROR_RIGHT", 960, {0, 1}, "Cockpit", "Right Mirror")
defineFloat("MIRROR_CENTER", 961, {0, 1}, "Cockpit", "Center Mirror")
defineFloat("MIRROR_LEFT", 962, {0, 1}, "Cockpit", "Left Mirror")
defineIndicatorLight("CANOPY_GLASS_DM", 50, "Cockpit", "Canopy Glass Damage")
defineIndicatorLight("WS_GLASS_DM", 51, "Cockpit", "Windscreen Glass Damage")
defineFloat("CANOPY_GLASS_FOG", 52, {0, 1}, "Cockpit", "Canopy Glass Fog")
defineFloat("WS_GLASS_FOG", 53, {0, 1}, "Cockpit", "Windscreen Glass Fog")

defineFloat("OXYGEN_NEEDLE", 290, {0, 1}, "Gauges", "Oxygen Pressure Indicator")
defineFloat("MAIN_PNEU_IND", 291, {0, 1}, "Gauges", "Main Pneumatic System Pressure Indicator")
defineFloat("EMERG_PNEU_IND", 292, {0, 1}, "Gauges", "Emergency Pneumatic System Pressure Indicator")
defineFloat("MAG_HDG_BAK", 293, {0, 1}, "Gauges", "Backup Magnetic HDG")

-------------------------------------------------------------------------------------------------------------------------------
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

defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

local function coerce_nil_to_string(value)
	if value == nil then
		return ""
	else
		return value
	end
end

-------------------------------------------------------------------------------------------------------------------------------
local function processUFCPLine(ufcpLine, lineNum)
	local temp_txt_win    = ufcpLine["txt_win"..lineNum]
	local txt_win_fill    = ufcpLine["txt_win"..lineNum.."_fill"]
	local cur_win      = ufcpLine["cur_win"..lineNum]
	local txt_winr      = ufcpLine["txt_win"..lineNum.."r"]
	local cur_winr      = ufcpLine["cur_win"..lineNum.."r"]
	local UFCPLineLength = 8
	local txt_win
		 
	if temp_txt_win ~= null then
			txt_win = temp_txt_win:gsub(string.char(127),"^")
	 else
		 txt_win = ""
	 end
	
	if txt_win_fill ~= null then
	   local full_txt_win_fill  = txt_win_fill..string.rep(" ",UFCPLineLength - string.len(txt_win_fill))
	   if temp_txt_win ~= null then
		  if cur_win ~= null then
			 if txt_win:find("-") then
				processedUFCPLine = txt_win:sub(1,txt_win:find("-") - cur_win:len()) .. cur_win .. txt_win:sub(txt_win:find("-") + cur_win:len()) .. full_txt_win_fill:sub(txt_win:len()+1)
			 else
				processedUFCPLine = txt_win:sub(1,txt_win:len() - cur_win:len()) .. cur_win .. full_txt_win_fill:sub(txt_win:len()+1)
			 end
		  else
			 processedUFCPLine = txt_win .. full_txt_win_fill:sub(txt_win:len() + 1)
		  end
		else
		  if cur_winr ~= null then
			 processedUFCPLine = full_txt_win_fill:sub(1,UFCPLineLength - txt_winr:len()) .. txt_winr:sub(1,txt_winr:len() - cur_winr:len())..cur_winr
		  else
			 processedUFCPLine = full_txt_win_fill:sub(1,UFCPLineLength - txt_winr:len())..txt_winr
		  end
		end
	elseif txt_win ~= null then
	   processedUFCPLine = txt_win
	else
	   processedUFCPLine = txt_winr
	end
	return processedUFCPLine      
 end

defineString("UFCP_LINE_1",function() return coerce_nil_to_string(processUFCPLine(parse_indication(3), 1)) end,8,"UFCP","UFCP Display Line 1")
defineString("UFCP_LINE_2",function() return coerce_nil_to_string(processUFCPLine(parse_indication(4), 2)) end,8,"UFCP","UFCP Display Line 2")
defineString("UFCP_LINE_3",function() return coerce_nil_to_string(processUFCPLine(parse_indication(5), 3)) end,8,"UFCP","UFCP Display Line 3")
defineString("UFCP_LINE_4",function() return coerce_nil_to_string(processUFCPLine(parse_indication(6), 4)) end,8,"UFCP","UFCP Display Line 4")

local radio_line_1
local radio_line_2
local radio_sql_light
local radio_to_light
local radio_go_light

local function radio_parse_indication(indicator_id)  -- Thanks to [FSF]Ian code
	local ret = {}
	local li = list_indication(indicator_id)
	if li == "" then return nil end
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
		if not name then break end
			-- there's # characters in one of the radio indicator names which break parsing if it isn't replaced
			ret[name:gsub("\#","hash")] = value
		end
	return ret
end

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local radioDisplay = radio_parse_indication(7)
	radio_line_1 = "        "
	radio_line_2 = "        "
	radio_sql_light = 0
	radio_to_light = 0
	radio_go_light= 0
	if not radioDisplay then
		return
	end
	if radioDisplay.radio_sql then
		radio_sql_light = 1;
	end
	if radioDisplay.radio_take then
		radio_to_light = 1;
	end 
	if radioDisplay.radio_go then
		radio_go_light = 1;
	end
	
	-- Radio Display Line 2 uses unprintable characters to display the power symbol - replace these with something printable
	if radioDisplay.radio_disp_l2 then
		local charReplacements = {
			[string.char(29)] = "_",
			[string.char(30)] = "|",
			[string.char(31)] = "^"
		}
		radio_line_2 = radioDisplay.radio_disp_l2:gsub(".",charReplacements)	
	end
	
	-- original name for field is "#3#"" but this is modified in radio_parse_indication to "hash3hash"
	if radioDisplay.hash3hash then
		local tempString
		if radioDisplay.radio_cursor and radioDisplay.radio_cursor:len() > 0 then
			if radioDisplay.radio_disp_l1 and radioDisplay.radio_disp_l1:len() > 1 then
			   tempString = radioDisplay.radio_disp_l1:sub(1,radioDisplay.radio_disp_l1:len() - 1)..radioDisplay.radio_cursor
			else
			   tempString = radioDisplay.radio_cursor
			end 
		else
			tempString = radioDisplay.radio_disp_l1
		end
		radio_line_1 = radioDisplay.hash3hash:sub(1,radioDisplay.hash3hash:len() - tempString:len())..tempString
	else
		radio_line_1 = radioDisplay.radio_disp_l1
	end
end

defineIntegerFromGetter("RADIO_SQL_LIGHT", function() return radio_sql_light end, 1, "Radio", "Radio Squelch Indicator Light")
defineIntegerFromGetter("RADIO_TO_LIGHT", function() return radio_to_light end, 1, "Radio", "Radio Take-Over Indicator Light")
defineIntegerFromGetter("RADIO_GO_LIGHT", function() return radio_go_light end, 1, "Radio", "Radio Go Indicator Light")
defineString("RADIO_LINE_1", function() return coerce_nil_to_string(radio_line_1) end,8,"Radio","Radio Display Line 1")
defineString("RADIO_LINE_2", function() return coerce_nil_to_string(radio_line_2) end,8,"Radio","Radio Display Line 2")
defineIndicatorLight("GEAR_LEVER_L", 107, "Warning, Caution and IndicatorLights", "Landing Gear Lever Light (red)") 

BIOS.protocol.endModule()