module("OH-58D", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class OH_58D: Module
local OH_58D = Module:new("OH-58D", 0x8A00, { "OH58D" })

local CONTROLS_DEVICE_ID = 1
local FUEL_DEVICE_ID = 2
local SENSORS_DEVICE_ID = 3
local FLIGHT_MODEL_DEVICE_ID = 4
local ENGINE_DEVICE_ID = 5
local RADIOALTIMETER_DEVICE_ID = 6
local ELECTRIC_DEVICE_ID = 7
local COCKPIT_DEVICE_ID = 8
local MISSION_DEVICE_ID = 9
local MPD_DEVICE_ID = 10
local RMFD_DEVICE_ID = 11
local SCAS_DEVICE_ID = 12
local HYDRAULIC_DEVICE_ID = 13
local MFK_DEVICE_ID = 14
local COMMON_DEVICE_ID = 15
local CLOCK_DEVICE_ID = 16
local FADEC_DEVICE_ID = 17
local AI_DEVICE_ID = 18
local PILOT_DEVICE_ID = 19
local COPILOT_DEVICE_ID = 20
local WEAPONS_DEVICE_ID = 21
local MMS_DEVICE_ID = 22
local LMFD_DEVICE_ID = 23
local RANGEFINDER_DEVICE_ID = 24
local IR_SEEKER_DEVICE_ID = 25
local SOUNDHOLDER_DEVICE_ID = 26
local RFD_DEVICE_ID = 27
local CSC_PILOT_DEVICE_ID = 28
local VFM1_DEVICE_ID = 29
local UAM_DEVICE_ID = 30
local VAM_DEVICE_ID = 31
local VFM2_DEVICE_ID = 32
local WCAS_DEVICE_ID = 33
local CSC_COPILOT_DEVICE_ID = 34
local RWR_DEVICE_ID = 35
local CI_DEVICE_ID = 36
local CMWS_DEVICE_ID = 37
local NVG_DEVICE_ID = 38
local M3P_LASER_DEVICE_ID = 39
local SYNC_DEVICE_DEVICE_ID = 40
local SYNC_MACHINE_DEVICE_ID = 41
local SYNC_CONTROLS_DEVICE_ID = 42
local ODA_LEFT_DEVICE_ID = 43
local ODA_RIGHT_DEVICE_ID = 44
local L2_MUMS_DEVICE_ID = 45
local SYNC_MACHINE2_DEVICE_ID = 46
local JVMF_DEVICE_ID = 47
local PDU_DEVICE_ID = 48
local AVR2_DEVICE_ID = 49
local MACROS_DEVICE_ID = 50
local KNEEBOARD_DEVICE_ID = 51

-- Center post console (behind crew, between seats)
local CENTER_POST_CONSOLE = "Center Post Console"

-- row 1
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_HF", ELECTRIC_DEVICE_ID, 3008, 268, CENTER_POST_CONSOLE, "HF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM", ELECTRIC_DEVICE_ID, 3118, 640, CENTER_POST_CONSOLE, "FM AMP Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM2", ELECTRIC_DEVICE_ID, 3119, 641, CENTER_POST_CONSOLE, "FM2 Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_VHF", ELECTRIC_DEVICE_ID, 3120, 642, CENTER_POST_CONSOLE, "VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_UHF", ELECTRIC_DEVICE_ID, 3121, 643, CENTER_POST_CONSOLE, "UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_RT", ELECTRIC_DEVICE_ID, 3122, 644, CENTER_POST_CONSOLE, "SATCOM R/T Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ENG_ANTI_ICE", ELECTRIC_DEVICE_ID, 3113, 635, CENTER_POST_CONSOLE, "Engine Anti-ice Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_HF", ELECTRIC_DEVICE_ID, 3114, 636, CENTER_POST_CONSOLE, "SCTY HF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_UHF", ELECTRIC_DEVICE_ID, 3115, 637, CENTER_POST_CONSOLE, "SCTY UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_VHF", ELECTRIC_DEVICE_ID, 3116, 638, CENTER_POST_CONSOLE, "SCTY VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_IFF", ELECTRIC_DEVICE_ID, 3007, 269, CENTER_POST_CONSOLE, "IFF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IFF_CMPTR", ELECTRIC_DEVICE_ID, 3117, 639, CENTER_POST_CONSOLE, "IFF Computer Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_DETR", ELECTRIC_DEVICE_ID, 3005, 270, CENTER_POST_CONSOLE, "Radar Detector Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_WARN", ELECTRIC_DEVICE_ID, 3006, 271, CENTER_POST_CONSOLE, "Radar Warning Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_RADAR_ALT", ELECTRIC_DEVICE_ID, 3110, 632, CENTER_POST_CONSOLE, "Radar Altimeter Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_BLOWER_COMPT", ELECTRIC_DEVICE_ID, 3111, 633, CENTER_POST_CONSOLE, "Blower Computer Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_CABIN_HTR", ELECTRIC_DEVICE_ID, 3112, 634, CENTER_POST_CONSOLE, "Cabin Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IDM", ELECTRIC_DEVICE_ID, 3105, 627, CENTER_POST_CONSOLE, "IDM Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ARMT_CONTR", ELECTRIC_DEVICE_ID, 3106, 628, CENTER_POST_CONSOLE, "Armament Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_SIGHT", ELECTRIC_DEVICE_ID, 3107, 629, CENTER_POST_CONSOLE, "Power Sight Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_LGUN", ELECTRIC_DEVICE_ID, 3108, 630, CENTER_POST_CONSOLE, "Power Left Gun Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_RKT", ELECTRIC_DEVICE_ID, 3109, 631, CENTER_POST_CONSOLE, "Power Rocket Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_ARM", ELECTRIC_DEVICE_ID, 3099, 621, CENTER_POST_CONSOLE, "Hellfire Arm Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_CONTR", ELECTRIC_DEVICE_ID, 3100, 622, CENTER_POST_CONSOLE, "Hellfire Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_PWR", ELECTRIC_DEVICE_ID, 3101, 623, CENTER_POST_CONSOLE, "Hellfire Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_AC", ELECTRIC_DEVICE_ID, 3102, 624, CENTER_POST_CONSOLE, "Hellfire AC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_TAMS", ELECTRIC_DEVICE_ID, 3103, 625, CENTER_POST_CONSOLE, "TAMS Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_AMP", ELECTRIC_DEVICE_ID, 3104, 626, CENTER_POST_CONSOLE, "SATCOM AMP Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HUMS_28_VDC", ELECTRIC_DEVICE_ID, 3095, 617, CENTER_POST_CONSOLE, "HUMS 28 VDC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HDG_HOLD", ELECTRIC_DEVICE_ID, 3096, 618, CENTER_POST_CONSOLE, "Heading Hold Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_EL_LT", ELECTRIC_DEVICE_ID, 3097, 619, CENTER_POST_CONSOLE, "EL LT Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_L2MUM", ELECTRIC_DEVICE_ID, 3004, 272, CENTER_POST_CONSOLE, "L2MUM Power Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_26_VAC", ELECTRIC_DEVICE_ID, 3098, 620, CENTER_POST_CONSOLE, "26 VAC Circuit Breaker")

-- row 7
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCAS_28_VAC", ELECTRIC_DEVICE_ID, 3092, 614, CENTER_POST_CONSOLE, "SCAS 28 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_STBY_ATT", ELECTRIC_DEVICE_ID, 3093, 615, CENTER_POST_CONSOLE, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MCPU_BLWR", ELECTRIC_DEVICE_ID, 3094, 616, CENTER_POST_CONSOLE, "MCPU Blower Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PART_SEP", ELECTRIC_DEVICE_ID, 3001, 273, CENTER_POST_CONSOLE, "Particle Separator Circuit Breaker")

-- row 8
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_26_VAC", ELECTRIC_DEVICE_ID, 3088, 610, CENTER_POST_CONSOLE, "MMS 26 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_PWR", ELECTRIC_DEVICE_ID, 3089, 611, CENTER_POST_CONSOLE, "MMS DC Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_CONTR", ELECTRIC_DEVICE_ID, 3090, 612, CENTER_POST_CONSOLE, "MMS DC Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_AC", ELECTRIC_DEVICE_ID, 3091, 613, CENTER_POST_CONSOLE, "MMS AC Circuit Breaker")

-- Overhead console (small detachment above the pilot)
local OVERHEAD_CONSOLE_PILOT = "Overhead Console (Pilot)"

OH_58D:defineToggleSwitch("PLT_OVERHEAD_IR_BEACON", ELECTRIC_DEVICE_ID, 3034, 274, OVERHEAD_CONSOLE_PILOT, "IR Beacon Switch")
OH_58D:definePotentiometer("PLT_OVERHEAD_FORMATION_LIGHTS", ELECTRIC_DEVICE_ID, 3029, 275, { 0, 1 }, OVERHEAD_CONSOLE_PILOT, "Formation Lights Brightness Dial")

OH_58D:defineToggleSwitch("PLT_OVERHEAD_SW_CMWS", ELECTRIC_DEVICE_ID, 3033, 276, OVERHEAD_CONSOLE_PILOT, "CMWS Circuit Breaker Switch")
OH_58D:defineToggleSwitch("PLT_OVERHEAD_CB_FUZZ_BNR", ELECTRIC_DEVICE_ID, 3031, 278, OVERHEAD_CONSOLE_PILOT, "Fuzz Burner Circuit Breaker Switch")
OH_58D:defineToggleSwitch("PLT_OVERHEAD_SW_BATT_CHGR", ELECTRIC_DEVICE_ID, 3032, 277, OVERHEAD_CONSOLE_PILOT, "Battery Charger Circuit Breaker Switch")

-- Overhead console (above crew, towards the rear)
local OVERHEAD_CONSOLE_REAR = "Overhead Console (Rear)"

-- row 1
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_INST_VS", ELECTRIC_DEVICE_ID, 3153, 675, OVERHEAD_CONSOLE_REAR, "INST VS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ENG_XDCR", ELECTRIC_DEVICE_ID, 3154, 676, OVERHEAD_CONSOLE_REAR, "Engine XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_XMSN_XDCR", ELECTRIC_DEVICE_ID, 3155, 677, OVERHEAD_CONSOLE_REAR, "Transmission XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ROTOR_XDCR", ELECTRIC_DEVICE_ID, 3156, 678, OVERHEAD_CONSOLE_REAR, "Rotor XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FUEL_QTY", ELECTRIC_DEVICE_ID, 3157, 679, OVERHEAD_CONSOLE_REAR, "Fuel Quantity Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MCPU_R", ELECTRIC_DEVICE_ID, 3158, 680, OVERHEAD_CONSOLE_REAR, "MCPU R Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ICS_PLT", ELECTRIC_DEVICE_ID, 3147, 669, OVERHEAD_CONSOLE_REAR, "Pilot ICS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ICS_CPO", ELECTRIC_DEVICE_ID, 3148, 670, OVERHEAD_CONSOLE_REAR, "Copilot ICS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FM_1", ELECTRIC_DEVICE_ID, 3149, 671, OVERHEAD_CONSOLE_REAR, "FM 1 Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ADU", ELECTRIC_DEVICE_ID, 3150, 672, OVERHEAD_CONSOLE_REAR, "ADU Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_RFD", ELECTRIC_DEVICE_ID, 3151, 673, OVERHEAD_CONSOLE_REAR, "RFD Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MFD_PLT", ELECTRIC_DEVICE_ID, 3152, 674, OVERHEAD_CONSOLE_REAR, "Pilot MFD Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_INV", ELECTRIC_DEVICE_ID, 3141, 663, OVERHEAD_CONSOLE_REAR, "Inverter Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_RECT", ELECTRIC_DEVICE_ID, 3142, 664, OVERHEAD_CONSOLE_REAR, "Rectifier Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DC_GEN_FIELD", ELECTRIC_DEVICE_ID, 3143, 665, OVERHEAD_CONSOLE_REAR, "DC Generator Field Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DC_GEN_RESET", ELECTRIC_DEVICE_ID, 3144, 666, OVERHEAD_CONSOLE_REAR, "DC Generator Reset Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ENG_OIL_BYPASS", ELECTRIC_DEVICE_ID, 3145, 667, OVERHEAD_CONSOLE_REAR, "Engine Oil Bypass Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_PITOT_HTR", ELECTRIC_DEVICE_ID, 3146, 668, OVERHEAD_CONSOLE_REAR, "Pitot Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_STBY_ATT", ELECTRIC_DEVICE_ID, 3135, 657, OVERHEAD_CONSOLE_REAR, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_NVG_PWR", ELECTRIC_DEVICE_ID, 3136, 658, OVERHEAD_CONSOLE_REAR, "NVG Power Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_CKPT_LT", ELECTRIC_DEVICE_ID, 3137, 659, OVERHEAD_CONSOLE_REAR, "Cockpit Lights Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_POS_LT", ELECTRIC_DEVICE_ID, 3138, 660, OVERHEAD_CONSOLE_REAR, "Position Lights Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SRCH_LT_CONTR", ELECTRIC_DEVICE_ID, 3139, 661, OVERHEAD_CONSOLE_REAR, "Search Light Control Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SRCH_LT_PWR", ELECTRIC_DEVICE_ID, 3140, 662, OVERHEAD_CONSOLE_REAR, "Search Light Power Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_HYD_SYS", ELECTRIC_DEVICE_ID, 3129, 651, OVERHEAD_CONSOLE_REAR, "Hydraulic System Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DATA_XFER", ELECTRIC_DEVICE_ID, 3130, 652, OVERHEAD_CONSOLE_REAR, "Data Transfer Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_JETT", ELECTRIC_DEVICE_ID, 3131, 653, OVERHEAD_CONSOLE_REAR, "Jettison Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FORCE_TRIM", ELECTRIC_DEVICE_ID, 3132, 654, OVERHEAD_CONSOLE_REAR, "Force Trim Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ANTI_COLL_LT", ELECTRIC_DEVICE_ID, 3133, 655, OVERHEAD_CONSOLE_REAR, "Anti-collision Light Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_BUS_INTCON", ELECTRIC_DEVICE_ID, 3134, 656, OVERHEAD_CONSOLE_REAR, "Bus Interconnect Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SCAS_DC", ELECTRIC_DEVICE_ID, 3123, 645, OVERHEAD_CONSOLE_REAR, "SCAS DC Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_AIR_DATA", ELECTRIC_DEVICE_ID, 3124, 646, OVERHEAD_CONSOLE_REAR, "Air Data Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MAST_TRQ", ELECTRIC_DEVICE_ID, 3125, 647, OVERHEAD_CONSOLE_REAR, "Mast Torque Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_AIRBAG", ELECTRIC_DEVICE_ID, 3126, 648, OVERHEAD_CONSOLE_REAR, "Airbag Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_EGI", ELECTRIC_DEVICE_ID, 3127, 649, OVERHEAD_CONSOLE_REAR, "EGI Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MFD_CPO", ELECTRIC_DEVICE_ID, 3128, 650, OVERHEAD_CONSOLE_REAR, "Copilot MFD Circuit Breaker")

-- Overhead console (above crew, towards the front)
local OVERHEAD_CONSOLE_FRONT = "Overhead Console (Front)"

-- row 1
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_MCPU_L", ELECTRIC_DEVICE_ID, 3159, 681, OVERHEAD_CONSOLE_FRONT, "MCPU L Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_SW_FADEC", ELECTRIC_DEVICE_ID, 3002, 247, OVERHEAD_CONSOLE_FRONT, "FADEC Circuit Breaker Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_FUEL_BOOST", ELECTRIC_DEVICE_ID, 3160, 682, OVERHEAD_CONSOLE_FRONT, "Fuel Boost Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_START", ELECTRIC_DEVICE_ID, 3161, 683, OVERHEAD_CONSOLE_FRONT, "Start Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_SW_IGN", ELECTRIC_DEVICE_ID, 3003, 250, OVERHEAD_CONSOLE_FRONT, "Ignition Circuit Breaker Switch")

-- row 2
OH_58D:definePotentiometer("FRONT_OVERHEAD_CONSOLE_BRIGHTNESS", ELECTRIC_DEVICE_ID, 3011, 251, { 0, 0.8 }, OVERHEAD_CONSOLE_FRONT, "Console Lighting Brightness Dial")
OH_58D:definePotentiometer("FRONT_OVERHEAD_INSTRUMENT_BRIGHTNESS", ELECTRIC_DEVICE_ID, 3012, 252, { 0, 0.8 }, OVERHEAD_CONSOLE_FRONT, "Instrument Lighting Brightness Dial")

-- row 3
OH_58D:definePotentiometer("FRONT_OVERHEAD_FLOOD_BRIGHTNESS", ELECTRIC_DEVICE_ID, 3013, 253, { 0, 1 }, OVERHEAD_CONSOLE_FRONT, "Flood Light Brightness Dial")
OH_58D:define3PosTumb("FRONT_OVERHEAD_FLOOD_LIGHTS", ELECTRIC_DEVICE_ID, 3014, 279, OVERHEAD_CONSOLE_FRONT, "Flood Light Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_POSITION_LIGHTS", ELECTRIC_DEVICE_ID, 3010, 280, OVERHEAD_CONSOLE_FRONT, "Position Lights Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ANTI_COLL_LIGHTS", ELECTRIC_DEVICE_ID, 3009, 281, OVERHEAD_CONSOLE_FRONT, "Anti-Collision Lights Switch")

-- row 4
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_PITOT_HEAT", ELECTRIC_DEVICE_ID, 3015, 254, OVERHEAD_CONSOLE_FRONT, "Pitot Heater Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_HEATER", ELECTRIC_DEVICE_ID, 3016, 255, OVERHEAD_CONSOLE_FRONT, "Heater Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_DEFOG_L", ELECTRIC_DEVICE_ID, 3017, 256, OVERHEAD_CONSOLE_FRONT, "Left Defog Blower Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_DEFOG_R", ELECTRIC_DEVICE_ID, 3018, 257, OVERHEAD_CONSOLE_FRONT, "Right Defog Blower Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_COMPARTMENT_BLOWER", ELECTRIC_DEVICE_ID, 3019, 258, OVERHEAD_CONSOLE_FRONT, "Compartment Blower Switch")

-- row 5
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_FUEL_BOOST", ELECTRIC_DEVICE_ID, 3020, 259, OVERHEAD_CONSOLE_FRONT, "Fuel Boost Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ANTI_ICE", ELECTRIC_DEVICE_ID, 3021, 260, OVERHEAD_CONSOLE_FRONT, "Engine Anti Ice Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_OIL_BYPASS", ELECTRIC_DEVICE_ID, 3022, 261, OVERHEAD_CONSOLE_FRONT, "Engine Oil Bypass Switch")

-- row 6
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ESSENTIAL_BUS", ELECTRIC_DEVICE_ID, 3023, 262, OVERHEAD_CONSOLE_FRONT, "Essential Bus Run/Start Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_AC_GEN", ELECTRIC_DEVICE_ID, 3024, 263, OVERHEAD_CONSOLE_FRONT, "AC Generator Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_DC_GEN", ELECTRIC_DEVICE_ID, 3025, 264, OVERHEAD_CONSOLE_FRONT, "DC Generator Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_BATT_2", ELECTRIC_DEVICE_ID, 3026, 249, OVERHEAD_CONSOLE_FRONT, "Battery 2 Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_BATT_1", ELECTRIC_DEVICE_ID, 3027, 248, OVERHEAD_CONSOLE_FRONT, "Battery 1 Switch")

-- Cyclic (Pilot)
local CYCLIC_PILOT = "Cyclic (Pilot)"

OH_58D:definePushButton("PLT_CYCLIC_FORCE_TRIM_INTERRUPT", SYNC_CONTROLS_DEVICE_ID, 3101, 27, CYCLIC_PILOT, "Force Trim - Interrupt")
OH_58D:definePushButton("PLT_CYCLIC_SCAS_RELEASE", SYNC_CONTROLS_DEVICE_ID, 3102, 29, CYCLIC_PILOT, "SCAS Release")
OH_58D:definePushButton("PLT_CYCLIC_MISSILE_ACTIVATE", SYNC_CONTROLS_DEVICE_ID, 3109, 30, CYCLIC_PILOT, "Missile Activate (ATAS Only)")
OH_58D:definePushButton("PLT_CYCLIC_ODA", SYNC_CONTROLS_DEVICE_ID, 3110, 34, CYCLIC_PILOT, "ODA Button")
OH_58D:definePushButton("PLT_CYCLIC_FLARE_DISPENSE", CI_DEVICE_ID, 3007, 41, CYCLIC_PILOT, "Flare Dispenser Button")
OH_58D:definePushButton("PLT_CYCLIC_MISSILE_STEP", WEAPONS_DEVICE_ID, 3013, 42, CYCLIC_PILOT, "Missile Step Button")
OH_58D:definePushButton("PLT_CYCLIC_HOVER_WAYPOINT", SYNC_CONTROLS_DEVICE_ID, 3111, 51, CYCLIC_PILOT, "Hover Bob-Up/Wpt Drop Button")
OH_58D:defineToggleSwitch("PLT_CYCLIC_WEAPON_FIRE_COVER", WEAPONS_DEVICE_ID, 3014, 52, CYCLIC_PILOT, "Weapon Fire Cover")
OH_58D:definePushButton("PLT_CYCLIC_WEAPON_FIRE", WEAPONS_DEVICE_ID, 3015, 70, CYCLIC_PILOT, "Weapon Fire Button")
OH_58D:definePushButton("PLT_CYCLIC_ICS", SYNC_CONTROLS_DEVICE_ID, 3095, 71, CYCLIC_PILOT, "ICS Radio Button")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_SELECT_UD", RMFD_DEVICE_ID, 3030, 3031, 90, CYCLIC_PILOT, "Weapon Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_SELECT_LR", RMFD_DEVICE_ID, 3032, 3033, 91, CYCLIC_PILOT, "Weapon Select Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_DISPLAY_SELECT_UD", RMFD_DEVICE_ID, 3034, 3035, 92, CYCLIC_PILOT, "Display Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_DISPLAY_SELECT_LR", RMFD_DEVICE_ID, 3036, 3037, 93, CYCLIC_PILOT, "Display Select Switch Left/Right")

-- Cyclic (Copilot)
local CYCLIC_COPILOT = "Cyclic (Copilot)"

-- OH_58D:definePushButton("CPLT_CYCLIC_AREA_TRACK", MMS_DEVICE_ID, 3022, 32, CYCLIC_COPILOT, "Area Track")
OH_58D:reserveIntValue(1) -- area track not fully clickable
OH_58D:definePushButton("CPLT_CYCLIC_LASER", MMS_DEVICE_ID, 3024, 35, CYCLIC_COPILOT, "Fire Laser")
OH_58D:definePushButton("CPLT_CYCLIC_POINT_TRACK", MMS_DEVICE_ID, 3021, 48, CYCLIC_COPILOT, "Point Track")
-- OH_58D:defineSpringloaded_3PosTumb("CPLT_CYCLIC_NAV_TARGET_DESIGNATE", MMS_DEVICE_ID, 3026, 3026, 43, CYCLIC_COPILOT, "Nav/Target Designate Switch")
OH_58D:reserveIntValue(2) -- nav/target designate not fully working currently

-- Collective (Pilot)
local COLLECTIVE_PILOT = "Collective (Pilot)"

OH_58D:definePushButton("PLT_COLLECTIVE_START", ELECTRIC_DEVICE_ID, 3028, 7, COLLECTIVE_PILOT, "Start Switch")
OH_58D:definePushButton("PLT_COLLECTIVE_THROTTLE_IDLE_RELEASE", FUEL_DEVICE_ID, 3009, 9, COLLECTIVE_PILOT, "Throttle Idle Release Switch")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_ENGINE_RPM_TRIM", ENGINE_DEVICE_ID, 3001, 3002, 15, COLLECTIVE_PILOT, "Engine Rpm Trim")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_CHANNEL_SEL_UD", SYNC_CONTROLS_DEVICE_ID, 3070, 3069, 12, COLLECTIVE_PILOT, "Channel Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_CHANNEL_SEL_LR", SYNC_CONTROLS_DEVICE_ID, 3071, 3072, 13, COLLECTIVE_PILOT, "Channel Select Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_13", SYNC_CONTROLS_DEVICE_ID, 3075, 3073, 14, COLLECTIVE_PILOT, "Radio Select Switch 1/3")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_24", SYNC_CONTROLS_DEVICE_ID, 3074, 3074, 16, COLLECTIVE_PILOT, "Radio Select Switch 2/4")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_5", SYNC_CONTROLS_DEVICE_ID, 3076, 3076, 17, COLLECTIVE_PILOT, "Radio Select Switch 5") -- seems like this should just be a push button, but is in game as a 3-position switch
OH_58D:reserveIntValue(1) -- reserve an extra space in case we need to make this a push button in the future
OH_58D:defineToggleSwitch("PLT_COLLECTIVE_EMERGENCY_JETTISON_COVER", CI_DEVICE_ID, 3010, 46, COLLECTIVE_PILOT, "Emergency Jettison Cover")
OH_58D:definePushButton("PLT_COLLECTIVE_EMERGENCY_JETTISON", CI_DEVICE_ID, 3011, 47, COLLECTIVE_PILOT, "Emergency Jettison (Launch All)")
OH_58D:defineToggleSwitch("PLT_COLLECTIVE_SEARCHLIGHT", ELECTRIC_DEVICE_ID, 3036, 98, COLLECTIVE_PILOT, "Searchlight Switch")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_UD", ELECTRIC_DEVICE_ID, 3037, 3038, 94, COLLECTIVE_PILOT, "Searchlight Control Switch Extend/Retract")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_LR", ELECTRIC_DEVICE_ID, 3039, 3040, 95, COLLECTIVE_PILOT, "Searchlight Control Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SCAS_ENGAGE", SCAS_DEVICE_ID, 3007, 3008, 96, COLLECTIVE_PILOT, "SCAS Heading Hold Switch Engage/Disengage")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SCAS_TRIM_LR", SCAS_DEVICE_ID, 3009, 3010, 97, COLLECTIVE_PILOT, "SCAS Heading Hold Switch Trim Left/Trim Right")
OH_58D:definePushButton("PLT_COLLECTIVE_IZLID", SYNC_CONTROLS_DEVICE_ID, 3046, 49, COLLECTIVE_PILOT, "IZLID (Gun Laser)")

-- Ignition Panel
local IGNITION_PANEL = "Ignition Panel"

-- CMWS Panel
local CMWS_PANEL = "CMWS Panel"

-- CSC (Pilot)
local CSC_PILOT = "CSC (Pilot)"

-- CSC (Copilot)
local CSC_COPILOT = "CSC (Copilot)"

-- Remote ICS Panel
local REMOTE_ICS_PANEL = "Remote ICS Panel"

-- Armament Control Panel
local ARMAMENT_PANEL = "Armament Control Panel"

-- Fuel Control Panel
local FUEL_CONTROL_PANEL = "Fuel Control Panel"

-- Multifunction Keyboard (MFK)
local MFK = "Multifunction Keyboard"

-- SCAS Control Panel
local SCAS_PANEL = "SCAS Control Panel"

-- Multiparameter Display (MPD)
local MPD = "MPD"
-- indication 1
-- list_cockpit_params() TRANSOILPRESS_Ladder_vis9:0.500000

-- Air Vent Control
local AIR_VENT_CONTROL = "Air Vent Control"

-- Standby Attitude Indicator
local SAI = "Standby Attitude Indicator"

-- RPM Vertical Scale Instrument
local RPM_SCALE = "RPM Vertical Scale Instrument"
-- indication 2 (also tgt/trq)

-- TGT/TRQ Indicator
local TGT_TRQ = "TGT/TRQ Indicator"

-- Pilot MPD
local MPD_PILOT = "MPD (Pilot)"

-- Copilot MPD
local MPD_COPILOT = "MPD (Copilot)"

-- Pilot MPD Auxiliary Control Panel
local MPD_AUX_PANEL_PILOT = "MPD Auxiliary Panel (Pilot)"

-- Copilot MPD Auxiliary Control Panel
local MPD_AUX_PANEL_COPILOT = "MPD Auxiliary Panel (Copilot)"

-- Clock
local CLOCK = "Clock"
-- indication 7 (unclear how mode is tracked?)

-- Standby Magnetic Compass
local STANDBY_COMPASS = "Standby Magnetic Compass"

-- AN/APR-39 Radar Indicator
local RWR = "AN/APR-39 Radar Indicator"

-- Standby Altimeter
local STANDBY_ALTIMETER = "Standby Altimeter"

-- Standby Airspeed Indicator
local STANDBY_AIRSPEED_INDICATOR = "Standby Airspeed Indicator"

-- Remote Frequency Indicator
local REMOTE_FREQUENCY_INDICATOR = "Remote Frequency Indicator"
-- indication 8

-- Dashboard Buttons (buttons on the dash without an associated panel)
local DASHBOARD_BUTTONS = "Dashboard Buttons"
-- FADEC AUTO/MAN
-- EFB Filter Bypass

-- Channel Select Switch
local CHANNEL_SELECT_SWITCH = "Channel Select Switch"

-- MMS Control Panel
local MMS_CONTROL_PANEL = "MMS Control Panel"

-- CMWS
local CMWS = "CMWS"
-- indication 10

-- Floodlights
local FLOODLIGHTS = "Floodlights"

-- Free Air Temperature Gauge
local FREE_AIR_TEMP = "Free Air Temperature Gauge"

-- Exterior Lights
local EXTERIOR_LIGHTS = "Exterior Lights"

-- Cockpit
local COCKPIT = "Cockpit"
-- left/right armor panels

return OH_58D
