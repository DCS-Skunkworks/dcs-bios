module("OH-58D", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class OH_58D: Module
local OH_58D = Module:new("OH-58D", 0x8A00, { "OH58D" })

local devices = {
	CONTROLS = 1,
	FUEL = 2,
	SENSORS = 3,
	FLIGHT_MODEL = 4,
	ENGINE = 5,
	RADIOALTIMETER = 6,
	ELECTRIC = 7,
	COCKPIT = 8,
	MISSION = 9,
	MPD = 10,
	RMFD = 11,
	SCAS = 12,
	HYDRAULIC = 13,
	MFK = 14,
	COMMON = 15,
	CLOCK = 16,
	FADEC = 17,
	AI = 18,
	PILOT = 19,
	COPILOT = 20,
	WEAPONS = 21,
	MMS = 22,
	LMFD = 23,
	RANGEFINDER = 24,
	IR_SEEKER = 25,
	SOUNDHOLDER = 26,
	RFD = 27,
	CSC_PILOT = 28,
	VFM1 = 29,
	UAM = 30,
	VAM = 31,
	VFM2 = 32,
	WCAS = 33,
	CSC_COPILOT = 34,
	RWR = 35,
	CI = 36,
	CMWS = 37,
	NVG = 38,
	M3P_LASER = 39,
	SYNC_DEVICE = 40,
	SYNC_MACHINE = 41,
	SYNC = 42,
	ODA_LEFT = 43,
	ODA_RIGHT = 44,
	L2_MUMS = 45,
	SYNC_MACHINE2 = 46,
	JVMF = 47,
	PDU = 48,
	AVR2 = 49,
	MACROS = 50,
	KNEEBOARD = 51,
}

-- Center post console (behind crew, between seats)
local CENTER_POST_CONSOLE = "Center Post Console"

-- row 1
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_HF", devices.ELECTRIC, 3008, 268, CENTER_POST_CONSOLE, "HF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM", devices.ELECTRIC, 3118, 640, CENTER_POST_CONSOLE, "FM AMP Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_FM2", devices.ELECTRIC, 3119, 641, CENTER_POST_CONSOLE, "FM2 Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_VHF", devices.ELECTRIC, 3120, 642, CENTER_POST_CONSOLE, "VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_UHF", devices.ELECTRIC, 3121, 643, CENTER_POST_CONSOLE, "UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_RT", devices.ELECTRIC, 3122, 644, CENTER_POST_CONSOLE, "SATCOM R/T Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ENG_ANTI_ICE", devices.ELECTRIC, 3113, 635, CENTER_POST_CONSOLE, "Engine Anti-ice Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_HF", devices.ELECTRIC, 3114, 636, CENTER_POST_CONSOLE, "SCTY HF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_UHF", devices.ELECTRIC, 3115, 637, CENTER_POST_CONSOLE, "SCTY UHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCTY_VHF", devices.ELECTRIC, 3116, 638, CENTER_POST_CONSOLE, "SCTY VHF Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_IFF", devices.ELECTRIC, 3007, 269, CENTER_POST_CONSOLE, "IFF Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IFF_CMPTR", devices.ELECTRIC, 3117, 639, CENTER_POST_CONSOLE, "IFF Computer Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_DETR", devices.ELECTRIC, 3005, 270, CENTER_POST_CONSOLE, "Radar Detector Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_RADAR_WARN", devices.ELECTRIC, 3006, 271, CENTER_POST_CONSOLE, "Radar Warning Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_RADAR_ALT", devices.ELECTRIC, 3110, 632, CENTER_POST_CONSOLE, "Radar Altimeter Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_BLOWER_COMPT", devices.ELECTRIC, 3111, 633, CENTER_POST_CONSOLE, "Blower Computer Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_CABIN_HTR", devices.ELECTRIC, 3112, 634, CENTER_POST_CONSOLE, "Cabin Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_IDM", devices.ELECTRIC, 3105, 627, CENTER_POST_CONSOLE, "IDM Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_ARMT_CONTR", devices.ELECTRIC, 3106, 628, CENTER_POST_CONSOLE, "Armament Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_SIGHT", devices.ELECTRIC, 3107, 629, CENTER_POST_CONSOLE, "Power Sight Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_LGUN", devices.ELECTRIC, 3108, 630, CENTER_POST_CONSOLE, "Power Left Gun Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PWR_RKT", devices.ELECTRIC, 3109, 631, CENTER_POST_CONSOLE, "Power Rocket Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_ARM", devices.ELECTRIC, 3099, 621, CENTER_POST_CONSOLE, "Hellfire Arm Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_CONTR", devices.ELECTRIC, 3100, 622, CENTER_POST_CONSOLE, "Hellfire Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_PWR", devices.ELECTRIC, 3101, 623, CENTER_POST_CONSOLE, "Hellfire Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HELLFIRE_AC", devices.ELECTRIC, 3102, 624, CENTER_POST_CONSOLE, "Hellfire AC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_TAMS", devices.ELECTRIC, 3103, 625, CENTER_POST_CONSOLE, "TAMS Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SATCOM_AMP", devices.ELECTRIC, 3104, 626, CENTER_POST_CONSOLE, "SATCOM AMP Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HUMS_28_VDC", devices.ELECTRIC, 3095, 617, CENTER_POST_CONSOLE, "HUMS 28 VDC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_HDG_HOLD", devices.ELECTRIC, 3096, 618, CENTER_POST_CONSOLE, "Heading Hold Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_EL_LT", devices.ELECTRIC, 3097, 619, CENTER_POST_CONSOLE, "EL LT Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_SW_L2MUM", devices.ELECTRIC, 3004, 272, CENTER_POST_CONSOLE, "L2MUM Power Circuit Breaker Switch")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_26_VAC", devices.ELECTRIC, 3098, 620, CENTER_POST_CONSOLE, "26 VAC Circuit Breaker")

-- row 7
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_SCAS_28_VAC", devices.ELECTRIC, 3092, 614, CENTER_POST_CONSOLE, "SCAS 28 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_STBY_ATT", devices.ELECTRIC, 3093, 615, CENTER_POST_CONSOLE, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MCPU_BLWR", devices.ELECTRIC, 3094, 616, CENTER_POST_CONSOLE, "MCPU Blower Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_PART_SEP", devices.ELECTRIC, 3001, 273, CENTER_POST_CONSOLE, "Particle Separator Circuit Breaker")

-- row 8
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_26_VAC", devices.ELECTRIC, 3088, 610, CENTER_POST_CONSOLE, "MMS 26 VAC Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_PWR", devices.ELECTRIC, 3089, 611, CENTER_POST_CONSOLE, "MMS DC Power Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_DC_CONTR", devices.ELECTRIC, 3090, 612, CENTER_POST_CONSOLE, "MMS DC Control Circuit Breaker")
OH_58D:defineToggleSwitch("POST_CONSOLE_CB_MMS_AC", devices.ELECTRIC, 3091, 613, CENTER_POST_CONSOLE, "MMS AC Circuit Breaker")

-- Overhead console (small detachment above the pilot)
local OVERHEAD_CONSOLE_PILOT = "Overhead Console (Pilot)"

OH_58D:defineToggleSwitch("PLT_OVERHEAD_IR_BEACON", devices.ELECTRIC, 3034, 274, OVERHEAD_CONSOLE_PILOT, "IR Beacon Switch")
OH_58D:definePotentiometer("PLT_OVERHEAD_FORMATION_LIGHTS", devices.ELECTRIC, 3029, 275, { 0, 1 }, OVERHEAD_CONSOLE_PILOT, "Formation Lights Brightness Dial")

OH_58D:defineToggleSwitch("PLT_OVERHEAD_SW_CMWS", devices.ELECTRIC, 3033, 276, OVERHEAD_CONSOLE_PILOT, "CMWS Circuit Breaker Switch")
OH_58D:defineToggleSwitch("PLT_OVERHEAD_CB_FUZZ_BNR", devices.ELECTRIC, 3031, 278, OVERHEAD_CONSOLE_PILOT, "Fuzz Burner Circuit Breaker Switch")
OH_58D:defineToggleSwitch("PLT_OVERHEAD_SW_BATT_CHGR", devices.ELECTRIC, 3032, 277, OVERHEAD_CONSOLE_PILOT, "Battery Charger Circuit Breaker Switch")

-- Overhead console (above crew, towards the rear)
local OVERHEAD_CONSOLE_REAR = "Overhead Console (Rear)"

-- row 1
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_INST_VS", devices.ELECTRIC, 3153, 675, OVERHEAD_CONSOLE_REAR, "INST VS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ENG_XDCR", devices.ELECTRIC, 3154, 676, OVERHEAD_CONSOLE_REAR, "Engine XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_XMSN_XDCR", devices.ELECTRIC, 3155, 677, OVERHEAD_CONSOLE_REAR, "Transmission XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ROTOR_XDCR", devices.ELECTRIC, 3156, 678, OVERHEAD_CONSOLE_REAR, "Rotor XDCR Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FUEL_QTY", devices.ELECTRIC, 3157, 679, OVERHEAD_CONSOLE_REAR, "Fuel Quantity Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MCPU_R", devices.ELECTRIC, 3158, 680, OVERHEAD_CONSOLE_REAR, "MCPU R Circuit Breaker")

-- row 2
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ICS_PLT", devices.ELECTRIC, 3147, 669, OVERHEAD_CONSOLE_REAR, "Pilot ICS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ICS_CPO", devices.ELECTRIC, 3148, 670, OVERHEAD_CONSOLE_REAR, "Copilot ICS Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FM_1", devices.ELECTRIC, 3149, 671, OVERHEAD_CONSOLE_REAR, "FM 1 Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ADU", devices.ELECTRIC, 3150, 672, OVERHEAD_CONSOLE_REAR, "ADU Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_RFD", devices.ELECTRIC, 3151, 673, OVERHEAD_CONSOLE_REAR, "RFD Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MFD_PLT", devices.ELECTRIC, 3152, 674, OVERHEAD_CONSOLE_REAR, "Pilot MFD Circuit Breaker")

-- row 3
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_INV", devices.ELECTRIC, 3141, 663, OVERHEAD_CONSOLE_REAR, "Inverter Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_RECT", devices.ELECTRIC, 3142, 664, OVERHEAD_CONSOLE_REAR, "Rectifier Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DC_GEN_FIELD", devices.ELECTRIC, 3143, 665, OVERHEAD_CONSOLE_REAR, "DC Generator Field Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DC_GEN_RESET", devices.ELECTRIC, 3144, 666, OVERHEAD_CONSOLE_REAR, "DC Generator Reset Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ENG_OIL_BYPASS", devices.ELECTRIC, 3145, 667, OVERHEAD_CONSOLE_REAR, "Engine Oil Bypass Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_PITOT_HTR", devices.ELECTRIC, 3146, 668, OVERHEAD_CONSOLE_REAR, "Pitot Heater Circuit Breaker")

-- row 4
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_STBY_ATT", devices.ELECTRIC, 3135, 657, OVERHEAD_CONSOLE_REAR, "Standby Attitude Indicator Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_NVG_PWR", devices.ELECTRIC, 3136, 658, OVERHEAD_CONSOLE_REAR, "NVG Power Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_CKPT_LT", devices.ELECTRIC, 3137, 659, OVERHEAD_CONSOLE_REAR, "Cockpit Lights Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_POS_LT", devices.ELECTRIC, 3138, 660, OVERHEAD_CONSOLE_REAR, "Position Lights Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SRCH_LT_CONTR", devices.ELECTRIC, 3139, 661, OVERHEAD_CONSOLE_REAR, "Search Light Control Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SRCH_LT_PWR", devices.ELECTRIC, 3140, 662, OVERHEAD_CONSOLE_REAR, "Search Light Power Circuit Breaker")

-- row 5
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_HYD_SYS", devices.ELECTRIC, 3129, 651, OVERHEAD_CONSOLE_REAR, "Hydraulic System Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_DATA_XFER", devices.ELECTRIC, 3130, 652, OVERHEAD_CONSOLE_REAR, "Data Transfer Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_JETT", devices.ELECTRIC, 3131, 653, OVERHEAD_CONSOLE_REAR, "Jettison Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_FORCE_TRIM", devices.ELECTRIC, 3132, 654, OVERHEAD_CONSOLE_REAR, "Force Trim Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_ANTI_COLL_LT", devices.ELECTRIC, 3133, 655, OVERHEAD_CONSOLE_REAR, "Anti-collision Light Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_BUS_INTCON", devices.ELECTRIC, 3134, 656, OVERHEAD_CONSOLE_REAR, "Bus Interconnect Circuit Breaker")

-- row 6
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_SCAS_DC", devices.ELECTRIC, 3123, 645, OVERHEAD_CONSOLE_REAR, "SCAS DC Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_AIR_DATA", devices.ELECTRIC, 3124, 646, OVERHEAD_CONSOLE_REAR, "Air Data Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MAST_TRQ", devices.ELECTRIC, 3125, 647, OVERHEAD_CONSOLE_REAR, "Mast Torque Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_AIRBAG", devices.ELECTRIC, 3126, 648, OVERHEAD_CONSOLE_REAR, "Airbag Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_EGI", devices.ELECTRIC, 3127, 649, OVERHEAD_CONSOLE_REAR, "EGI Circuit Breaker")
OH_58D:defineToggleSwitch("REAR_OVERHEAD_CB_MFD_CPO", devices.ELECTRIC, 3128, 650, OVERHEAD_CONSOLE_REAR, "Copilot MFD Circuit Breaker")

-- Overhead console (above crew, towards the front)
local OVERHEAD_CONSOLE_FRONT = "Overhead Console (Front)"

-- row 1
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_MCPU_L", devices.ELECTRIC, 3159, 681, OVERHEAD_CONSOLE_FRONT, "MCPU L Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_SW_FADEC", devices.ELECTRIC, 3002, 247, OVERHEAD_CONSOLE_FRONT, "FADEC Circuit Breaker Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_FUEL_BOOST", devices.ELECTRIC, 3160, 682, OVERHEAD_CONSOLE_FRONT, "Fuel Boost Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_CB_START", devices.ELECTRIC, 3161, 683, OVERHEAD_CONSOLE_FRONT, "Start Circuit Breaker")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_SW_IGN", devices.ELECTRIC, 3003, 250, OVERHEAD_CONSOLE_FRONT, "Ignition Circuit Breaker Switch")

-- row 2
OH_58D:definePotentiometer("FRONT_OVERHEAD_CONSOLE_BRIGHTNESS", devices.ELECTRIC, 3011, 251, { 0, 0.8 }, OVERHEAD_CONSOLE_FRONT, "Console Lighting Brightness Dial")
OH_58D:definePotentiometer("FRONT_OVERHEAD_INSTRUMENT_BRIGHTNESS", devices.ELECTRIC, 3012, 252, { 0, 0.8 }, OVERHEAD_CONSOLE_FRONT, "Instrument Lighting Brightness Dial")

-- row 3
OH_58D:definePotentiometer("FRONT_OVERHEAD_FLOOD_BRIGHTNESS", devices.ELECTRIC, 3013, 253, { 0, 1 }, OVERHEAD_CONSOLE_FRONT, "Flood Light Brightness Dial")
OH_58D:define3PosTumb("FRONT_OVERHEAD_FLOOD_LIGHTS", devices.ELECTRIC, 3014, 279, OVERHEAD_CONSOLE_FRONT, "Flood Light Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_POSITION_LIGHTS", devices.ELECTRIC, 3010, 280, OVERHEAD_CONSOLE_FRONT, "Position Lights Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ANTI_COLL_LIGHTS", devices.ELECTRIC, 3009, 281, OVERHEAD_CONSOLE_FRONT, "Anti-Collision Lights Switch")

-- row 4
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_PITOT_HEAT", devices.ELECTRIC, 3015, 254, OVERHEAD_CONSOLE_FRONT, "Pitot Heater Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_HEATER", devices.ELECTRIC, 3016, 255, OVERHEAD_CONSOLE_FRONT, "Heater Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_DEFOG_L", devices.ELECTRIC, 3017, 256, OVERHEAD_CONSOLE_FRONT, "Left Defog Blower Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_DEFOG_R", devices.ELECTRIC, 3018, 257, OVERHEAD_CONSOLE_FRONT, "Right Defog Blower Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_COMPARTMENT_BLOWER", devices.ELECTRIC, 3019, 258, OVERHEAD_CONSOLE_FRONT, "Compartment Blower Switch")

-- row 5
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_FUEL_BOOST", devices.ELECTRIC, 3020, 259, OVERHEAD_CONSOLE_FRONT, "Fuel Boost Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ANTI_ICE", devices.ELECTRIC, 3021, 260, OVERHEAD_CONSOLE_FRONT, "Engine Anti Ice Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_OIL_BYPASS", devices.ELECTRIC, 3022, 261, OVERHEAD_CONSOLE_FRONT, "Engine Oil Bypass Switch")

-- row 6
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_ESSENTIAL_BUS", devices.ELECTRIC, 3023, 262, OVERHEAD_CONSOLE_FRONT, "Essential Bus Run/Start Switch")
OH_58D:defineToggleSwitch("FRONT_OVERHEAD_AC_GEN", devices.ELECTRIC, 3024, 263, OVERHEAD_CONSOLE_FRONT, "AC Generator Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_DC_GEN", devices.ELECTRIC, 3025, 264, OVERHEAD_CONSOLE_FRONT, "DC Generator Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_BATT_2", devices.ELECTRIC, 3026, 249, OVERHEAD_CONSOLE_FRONT, "Battery 2 Switch")
OH_58D:define3PosTumb("FRONT_OVERHEAD_BATT_1", devices.ELECTRIC, 3027, 248, OVERHEAD_CONSOLE_FRONT, "Battery 1 Switch")

-- Cyclic (Pilot)
local CYCLIC_PILOT = "Cyclic (Pilot)"

OH_58D:definePushButton("PLT_CYCLIC_FORCE_TRIM_INTERRUPT", devices.SYNC, 3101, 27, CYCLIC_PILOT, "Force Trim - Interrupt")
OH_58D:definePushButton("PLT_CYCLIC_SCAS_RELEASE", devices.SYNC, 3102, 29, CYCLIC_PILOT, "SCAS Release")
OH_58D:definePushButton("PLT_CYCLIC_MISSILE_ACTIVATE", devices.SYNC, 3109, 30, CYCLIC_PILOT, "Missile Activate (ATAS Only)")
OH_58D:definePushButton("PLT_CYCLIC_ODA", devices.SYNC, 3110, 34, CYCLIC_PILOT, "ODA Button")
OH_58D:definePushButton("PLT_CYCLIC_FLARE_DISPENSE", devices.CI, 3007, 41, CYCLIC_PILOT, "Flare Dispenser Button")
OH_58D:definePushButton("PLT_CYCLIC_MISSILE_STEP", devices.WEAPONS, 3013, 42, CYCLIC_PILOT, "Missile Step Button")
OH_58D:definePushButton("PLT_CYCLIC_HOVER_WAYPOINT", devices.SYNC, 3111, 51, CYCLIC_PILOT, "Hover Bob-Up/Wpt Drop Button")
OH_58D:defineToggleSwitch("PLT_CYCLIC_WEAPON_FIRE_COVER", devices.WEAPONS, 3014, 52, CYCLIC_PILOT, "Weapon Fire Cover")
OH_58D:definePushButton("PLT_CYCLIC_WEAPON_FIRE", devices.WEAPONS, 3015, 70, CYCLIC_PILOT, "Weapon Fire Button")
OH_58D:definePushButton("PLT_CYCLIC_ICS", devices.SYNC, 3095, 71, CYCLIC_PILOT, "ICS Radio Button")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_SELECT_UD", devices.RMFD, 3030, 3031, 90, CYCLIC_PILOT, "Weapon Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_SELECT_LR", devices.RMFD, 3032, 3033, 91, CYCLIC_PILOT, "Weapon Select Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_DISPLAY_SELECT_UD", devices.RMFD, 3034, 3035, 92, CYCLIC_PILOT, "Display Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_CYCLIC_DISPLAY_SELECT_LR", devices.RMFD, 3036, 3037, 93, CYCLIC_PILOT, "Display Select Switch Left/Right")

-- Cyclic (Copilot)
local CYCLIC_COPILOT = "Cyclic (Copilot)"

-- OH_58D:definePushButton("CPLT_CYCLIC_AREA_TRACK", devices.MMS, 3022, 32, CYCLIC_COPILOT, "Area Track")
OH_58D:reserveIntValue(1) -- area track not fully clickable
OH_58D:definePushButton("CPLT_CYCLIC_LASER", devices.MMS, 3024, 35, CYCLIC_COPILOT, "Fire Laser")
OH_58D:definePushButton("CPLT_CYCLIC_POINT_TRACK", devices.MMS, 3021, 48, CYCLIC_COPILOT, "Point Track")
-- OH_58D:defineSpringloaded_3PosTumb("CPLT_CYCLIC_NAV_TARGET_DESIGNATE", devices.MMS, 3026, 3026, 43, CYCLIC_COPILOT, "Nav/Target Designate Switch")
OH_58D:reserveIntValue(2) -- nav/target designate not fully working currently

-- Collective (Pilot)
local COLLECTIVE_PILOT = "Collective (Pilot)"

OH_58D:definePushButton("PLT_COLLECTIVE_START", devices.ELECTRIC, 3028, 7, COLLECTIVE_PILOT, "Start Switch")
OH_58D:definePushButton("PLT_COLLECTIVE_THROTTLE_IDLE_RELEASE", devices.FUEL, 3009, 9, COLLECTIVE_PILOT, "Throttle Idle Release Switch")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_ENGINE_RPM_TRIM", devices.ENGINE, 3001, 3002, 15, COLLECTIVE_PILOT, "Engine Rpm Trim")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_CHANNEL_SEL_UD", devices.SYNC, 3070, 3069, 12, COLLECTIVE_PILOT, "Channel Select Switch Up/Down")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_CHANNEL_SEL_LR", devices.SYNC, 3071, 3072, 13, COLLECTIVE_PILOT, "Channel Select Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_13", devices.SYNC, 3075, 3073, 14, COLLECTIVE_PILOT, "Radio Select Switch 1/3")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_24", devices.SYNC, 3074, 3074, 16, COLLECTIVE_PILOT, "Radio Select Switch 2/4")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_RADIO_SEL_5", devices.SYNC, 3076, 3076, 17, COLLECTIVE_PILOT, "Radio Select Switch 5") -- seems like this should just be a push button, but is in game as a 3-position switch
OH_58D:reserveIntValue(1) -- reserve an extra space in case we need to make this a push button in the future
OH_58D:defineToggleSwitch("PLT_COLLECTIVE_EMERGENCY_JETTISON_COVER", devices.CI, 3010, 46, COLLECTIVE_PILOT, "Emergency Jettison Cover")
OH_58D:definePushButton("PLT_COLLECTIVE_EMERGENCY_JETTISON", devices.CI, 3011, 47, COLLECTIVE_PILOT, "Emergency Jettison (Launch All)")
OH_58D:defineToggleSwitch("PLT_COLLECTIVE_SEARCHLIGHT", devices.ELECTRIC, 3036, 98, COLLECTIVE_PILOT, "Searchlight Switch")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_UD", devices.ELECTRIC, 3037, 3038, 94, COLLECTIVE_PILOT, "Searchlight Control Switch Extend/Retract")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_LR", devices.ELECTRIC, 3039, 3040, 95, COLLECTIVE_PILOT, "Searchlight Control Switch Left/Right")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SCAS_ENGAGE", devices.SCAS, 3007, 3008, 96, COLLECTIVE_PILOT, "SCAS Heading Hold Switch Engage/Disengage")
OH_58D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SCAS_TRIM_LR", devices.SCAS, 3009, 3010, 97, COLLECTIVE_PILOT, "SCAS Heading Hold Switch Trim Left/Trim Right")
OH_58D:definePushButton("PLT_COLLECTIVE_IZLID", devices.SYNC, 3046, 49, COLLECTIVE_PILOT, "IZLID (Gun Laser)")

-- Ignition Panel
-- local IGNITION_PANEL = "Ignition Panel"

-- CMWS Panel
-- local CMWS_PANEL = "CMWS Panel"

-- CSC (Pilot)
-- local CSC_PILOT = "CSC (Pilot)"

-- CSC (Copilot)
-- local CSC_COPILOT = "CSC (Copilot)"

-- Remote ICS Panel
-- local REMOTE_ICS_PANEL = "Remote ICS Panel"

-- Armament Control Panel
-- local ARMAMENT_PANEL = "Armament Control Panel"

-- Fuel Control Panel
-- local FUEL_CONTROL_PANEL = "Fuel Control Panel"

-- Multifunction Keyboard (MFK)
-- local MFK = "Multifunction Keyboard"

-- SCAS Control Panel
-- local SCAS_PANEL = "SCAS Control Panel"

-- Multiparameter Display (MPD)
-- local MPD = "MPD"
-- indication 1
-- list_cockpit_params() TRANSOILPRESS_Ladder_vis9:0.500000

-- Air Vent Control
-- local AIR_VENT_CONTROL = "Air Vent Control"

-- Standby Attitude Indicator
-- local SAI = "Standby Attitude Indicator"

-- RPM Vertical Scale Instrument
-- local RPM_SCALE = "RPM Vertical Scale Instrument"
-- indication 2 (also tgt/trq)

-- TGT/TRQ Indicator
-- local TGT_TRQ = "TGT/TRQ Indicator"

-- Pilot MPD
-- local MPD_PILOT = "MPD (Pilot)"

-- Copilot MPD
-- local MPD_COPILOT = "MPD (Copilot)"

-- Pilot MPD Auxiliary Control Panel
-- local MPD_AUX_PANEL_PILOT = "MPD Auxiliary Panel (Pilot)"

-- Copilot MPD Auxiliary Control Panel
-- local MPD_AUX_PANEL_COPILOT = "MPD Auxiliary Panel (Copilot)"

-- Clock
-- local CLOCK = "Clock"
-- indication 7 (unclear how mode is tracked?)

-- Standby Magnetic Compass
-- local STANDBY_COMPASS = "Standby Magnetic Compass"

-- AN/APR-39 Radar Indicator
-- local RWR = "AN/APR-39 Radar Indicator"

-- Standby Altimeter
-- local STANDBY_ALTIMETER = "Standby Altimeter"

-- Standby Airspeed Indicator
-- local STANDBY_AIRSPEED_INDICATOR = "Standby Airspeed Indicator"

-- Remote Frequency Indicator
-- local REMOTE_FREQUENCY_INDICATOR = "Remote Frequency Indicator"
-- indication 8

-- Dashboard Buttons (buttons on the dash without an associated panel)
-- local DASHBOARD_BUTTONS = "Dashboard Buttons"
-- FADEC AUTO/MAN
-- EFB Filter Bypass

-- Channel Select Switch
-- local CHANNEL_SELECT_SWITCH = "Channel Select Switch"

-- MMS Control Panel
-- local MMS_CONTROL_PANEL = "MMS Control Panel"

-- CMWS
-- local CMWS = "CMWS"
-- indication 10

-- Floodlights
-- local FLOODLIGHTS = "Floodlights"

-- Free Air Temperature Gauge
-- local FREE_AIR_TEMP = "Free Air Temperature Gauge"

-- Exterior Lights
-- local EXTERIOR_LIGHTS = "Exterior Lights"

-- Cockpit
-- local COCKPIT = "Cockpit"
-- left/right armor panels

return OH_58D
