local success1 = pcall(dofile, lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/devices.lua")
local success2 = pcall(dofile, lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/command_defs.lua")
if success1 and success2 then -- only define module if Mig-21 is installed

BIOS.protocol.beginModule("MiG-21Bis", 0x2200)
BIOS.protocol.setExportModuleAircrafts({"MiG-21Bis"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch

dofile(lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/devices.lua")
dofile(lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/command_defs.lua")

--DC & AC busses and gyro devices
defineToggleSwitch("BAT_PWR", 1, 3001, 165, "Right Horizontal", "Battery On/Off")
defineToggleSwitch("BAT_HTR", 1, 3002, 155, "Right Vertical", "Battery Heat On/Off")
defineToggleSwitch("DC_GEN", 1, 3003, 166, "Right Horizontal", "DC Generator On/Off")
defineToggleSwitch("AC_GEN", 2, 3004, 169, "Right Horizontal", "AC Generator On/Off")
defineToggleSwitch("PO7502", 2, 3005, 154, "Right Vertical", "PO-750 Inverter #2 On/Off")
defineToggleSwitch("PO7501", 2, 3006, 153, "Right Vertical", "PO-750 Inverter #1 On/Off")
defineToggleSwitch("AUX_INV", 2, 3007, 164, "Right Horizontal", "Emergency Inverter On/Off")

--Gyro
defineToggleSwitch("GYRO_1", 21, 3008, 162, "Right Horizontal", "Gyro, NPP, SAU, RLS Signal, KPP Power On/Off")
defineToggleSwitch("GYRO_2", 21, 3009, 163, "Right Horizontal", "DA-200 Signal, Gyro, NPP, RLS, SAU Power On/Off")

--Fuel pumps & fuel system
defineToggleSwitch("PUMP_GR3", 4, 3010, 159, "Right Horizontal", "Fuel Pump Group 3 On/Off")
defineToggleSwitch("PUMP_GR1", 4, 3011, 160, "Right Horizontal", "Fuel Pump Group 1 On/Off")
defineToggleSwitch("DRN_PUMP", 4, 3012, 161, "Right Horizontal", "Drain Fuel Pump On/Off")
definePotentiometer("FUEL_QTY_SEL", 5, 3013, 274, {0, 1}, "Center Middle", "Adjust Fuel Quantity")

--Engine start device
defineToggleSwitch("APU_PWR", 3, 3014, 302, "Left Vertical", "APU On/Off")
defineToggleSwitch("ENG_START_TYPE", 3, 3015, 288, "Left Vertical", "Engine Normal/Cold Start Select")
definePushButton("ENG_START", 3, 3016, 289, "Left Vertical", "Engine Starter")
defineToggleSwitch("ENG_AIR_START", 3, 3017, 301, "Left Vertical", "Engine Air Start")
defineToggleSwitch("ENG_STOP", 3, 3238, 616, "Left Horizontal", "Engine Stop/Throttle Lock")

--ACCELEROMETER
definePushButton("ACC_RESET", 35, 3018, 228, "Center Upper", "Accelerometer Reset")

--Pitot tubes and related things that use DC bus for heating
defineToggleSwitch("PIT_SEL", 27, 3019, 229, "Center Upper", "Pitot Main/Emergency Select")
defineToggleSwitch("PIT_HEAT_MAIN", 27, 3020, 279, "Center Lower", "Pitot, Clock, Periscope Heat")
defineToggleSwitch("PIT_HEAT_AUX", 27, 3021, 280, "Center Lower", "Secondary Pitot Heat")

--DA-200
definePotentiometer("VARI_SET", 34, 3203, 261, {-1, 1}, "Center Middle", "Adjust Variometer")

--ENGINE
defineToggleSwitch("SURGE_DOOR", 6, 3022, 308, "Left Vertical", "Surge Doors Auto/Manual")
defineToggleSwitch("AFB_PWR", 6, 3023, 300, "Left Vertical", "Afterburner On/Off")
defineToggleSwitch("EMR_AFB_PWR", 6, 3024, 320, "Left Horizontal", "Emergency Afterburner")

--Fire extinguisher
defineToggleSwitch("FIRE_EXT_PWR", 53, 3025, 303, "Left Vertical", "Fire Extinguisher On/Off")
defineToggleSwitch("FIRE_EXT_CVR", 53, 3026, 324, "Left Vertical", "Fire Extinguisher Cover")
definePushButton("FIRE_EXT", 53, 3027, 325, "Left Vertical", "Fire Extinguisher")

--Lights
definePotentiometer("TXT_LIGHT", 46, 3231, 612, {0, 1}, "Right Horizontal", "Text Backlights")
definePotentiometer("GAUGE_LIGHT", 46, 3232, 156, {0, 1}, "Right Horizontal", "Gauge Backlights")
definePotentiometer("RED_LIGHT", 46, 3233, 157, {0, 1}, "Right Horizontal", "Red Lights")
definePotentiometer("WHITE_LIGHT", 46, 3234, 222, {0, 1}, "Right Vertical", "White Lights")
defineTumb("NAV_LIGHTS", 46, 3032, 194, 0.33, {0.0, 0.99}, nil, true, "Right Vertical", "Nav Lights Off/Dim/Med/Bright")
defineTumb("LND_LIGHT", 46, 3033, 323, 0.5, {0.0, 1}, nil, false, "Left Vertical", "Landing Lights Land/Taxi/Off/Dim/Med/Bright")

--Warning Lights
definePushButton("FUEL_WARN_LIGHT_TEST", 47, 3034, 369, "Right Vertical", "Fuel Warn Lights Test")
defineToggleSwitch("FUEL_WARN_LIGHTS_BRT", 47, 3074, 195, "Right Vertical", "Fuel Warn Lights Brightness")
definePushButton("MAIN_WARN_LIGHT_TEST", 47, 3035, 370, "Right Vertical", "Main Warn Lights Test")
defineToggleSwitch("MAIN_WARN_LIGHTS_BRT", 47, 3075, 196, "Right Vertical", "Main Warn Lights Brightness")
definePushButton("CTR_WARN_LIGHT_TEST", 47, 3036, 371, "Center Middle", "Center Warn Lights Test")
defineToggleSwitch("CTR_WARN_LIGHTS_BRT", 47, 3076, 273, "Center Middle", "Center Warn Lights Brightness")
definePushButton("PYL_EMPTY_WARN_LIGHT_TEST", 47, 3037, 372, "Center Lower", "Pylon Empty Warn Lights Test")
defineToggleSwitch("PYL_EMPTY_WARN_LIGHTS_BRT", 47, 3077, 282, "Center Lower", "Pylon Empty Warn Lights Brightness")
definePushButton("PYL_LD_WARN_LIGHT_TEST", 47, 3038, 373, "Center Lower", "Pylon Loaded Warn Lights Test")
defineToggleSwitch("PYL_LD_WARN_LIGHTS_BRT", 47, 3078, 283, "Center Lower", "Pylon Loaded Warn Lights Brightness")
definePushButton("GEAR_WARN_LIGHT_TEST", 47, 3039, 374, "Left Vertical", "Gear Warn Lights Test")
defineToggleSwitch("GEAR_WARN_LIGHTS_BRT", 47, 3079, 322, "Left Vertical", "Gear Warn Lights Brightness")
definePushButton("MASTER_WARN_LIGHT_TEST", 47, 3040, 255, "Center Middle", "Master Warn Light Test/Acknowledge")
defineToggleSwitch("MASTER_WARN_LIGHT_BRT", 47, 3277, 657, "Center Middle", "Master Warn Light Brightness")


--RADIO
defineToggleSwitch("RAD_PWR", 22, 3041, 173, "Right Vertical", "Radio On/Off")
defineToggleSwitch("RAD_CPS", 22, 3042, 208, "Right Vertical", "Radio/Compass Audio")
defineToggleSwitch("RAD_SQL", 22, 3043, 209, "Right Vertical", "Radio Squelch")
definePotentiometer("RAD_VOL", 22, 3044, 210, {0, 1}, "Right Vertical", "Radio Volume")
defineTumb("RAD_CHAN", 22, 3045, 211, 0.05, {0.0, 0.95}, nil, true, "Right Vertical", "Radio Channel") --May be a better way to do this?
definePushButton("RAD_PTT", 55, 3046, 315, "Left Horizontal", "Radio PTT")

--ARC
defineToggleSwitch("ARC_PWR", 24, 3047, 174, "Right Vertical", "ARC On/Off")
definePotentiometer("ARC_VOL", 24, 3048, 198, {0, 1}, "Right Vertical", "ARC Volume")
definePushButton("ARC_CHG", 24, 3049, 212, "Right Vertical", "ARC Change")
defineTumb("ARC_CHAN", 24, 3050, 213, 0.1, {0.1, 0.9}, nil, true, "Right Vertical", "ARC Channel") --Split up into individual channels?
defineTumb("ARC_ZONE", 24, 3051, 189, 0.14, {0, 0.98}, nil, false, "Right Vertical", "ARC Zones")
defineToggleSwitch("ARC_CMP", 24, 3052, 197, "Right Vertical", "ARC Antenna/Compass")
defineToggleSwitch("ARC_MRK", 24, 3053, 254, "Center Middle", "ARC Marker Far/Near")

--RSBN
defineToggleSwitch("RSBN_PWR", 25, 3054, 176, "Right Vertical", "RSBN On/Off")
defineTumb("RSBN_MODE", 25, 3055, 240, 0.5, {0, 1}, nil, false, "Center Upper", "RSBN Mode")
defineToggleSwitch("RSBN_ARC_SEL", 25, 3056, 340, "Left Vertical", "RSBN/ARC Select")
definePushButton("RSBN_IDENT", 25, 3057, 294, "Left Vertical", "RSBN Identify")
definePushButton("RSBN_Test", 25, 3080, 347, "Left Vertical", "RSBN Self-Test")

--RSBN Panel
definePotentiometer("RSBN_VOL", 25, 3058, 345, {0, 1}, "Left Vertical", "RSBN Volume")
defineTumb("RSBN_CHAN", 25, 3059, 351, 0.01, {0, 0.99}, nil, true, "Left Vertical", "RSBN Channel")
defineTumb("PRMG_CHAN", 25, 3060, 352, 0.01, {0, 0.99}, nil, true, "Left Vertical", "PRMG Channel")
definePushButton("RSBN_RST", 25, 3061, 366, "Left Vertical", "RSBN Reset")
defineToggleSwitch("RSBN_BRG", 25, 3062, 367, "Left Vertical", "RSBN Bearing")
defineToggleSwitch("RSBN_DIST", 25, 3063, 368, "Left Vertical", "RSBN Distance")

-- SAU
defineToggleSwitch("SAU_PWR", 8, 3064, 179, "Right Vertical", "SAU On/Off")
defineToggleSwitch("SAU_PITCH_PWR", 8, 3065, 180, "Right Vertical", "SAU Pitch On/Off")
definePushButton("SAU_STAB", 8, 3066, 343, "Left Vertical", "SAU Stabilization Mode")
definePushButton("SAU_CANCEL", 8, 3067, 376, "Stick", "SAU Cancel Current Mode")
definePushButton("SAU_RECOVERY", 8, 3068, 377, "Stick", "SAU Recovery Mode")
defineToggleSwitch("SAU_LOW", 8, 3069, 344, "Left Vertical", "SAU Limit Altitude")
definePushButton("SAU_LAND_CMD", 8, 3070, 341, "Left Vertical", "SAU Command Landing Mode")
definePushButton("SAU_LAND_AUTO", 8, 3071, 342, "Left Vertical", "SAU Auto Landing Mode")
definePushButton("SAU_RST", 8, 3072, 348, "Left Vertical", "SAU Reset/Off")

-- SPO
defineToggleSwitch("SPO_PWR", 37, 3083, 202, "Right Vertical", "SPO On/Off")
definePushButton("SPO_TEST", 37, 3084, 226, "Center Upper", "SPO Test")
defineToggleSwitch("SPO_DAY", 37, 3085, 227, "Center Upper", "SPO Day/Night")
definePotentiometer("SPO_VOL", 37, 3086, 225, {0, 1}, "Center Upper", "SPO Volume")

-- SRZO
defineToggleSwitch("SRZO_PWR", 38, 3087, 188, "Right Vertical", "SRZO IFF Coder/Decoder On/Off")
defineTumb("SRZO_CODE", 38, 3088, 192, 0.08, {0.0, 0.88}, nil, true, "Right Vertical", "SRZO Codes")
defineToggleSwitch("SRZO_81_PWR", 38, 3089, 346, "Right Vertical", "SRZO Type 81 On/Off")
defineToggleSwitch("SRZO_EM_TX_CVR", 38, 3210, 190, "Right Vertical", "SRZO Emergency Transmit Cover")
defineToggleSwitch("SRZO_EM_TX", 38, 3211, 191, "Right Vertical", "SRZO Emergency Transmit")
defineToggleSwitch("SRZO_DEST_CVR", 38, 3229, 427, "Right Vertical", "SRZO Self Destruct Cover")
definePushButton("SRZO_DEST", 38, 3230, 428, "Right Vertical", "SRZO Self Destruct")

-- SOD (increase radar signal for ATC radar, most likely won't be implemented)
defineToggleSwitch("SOD_PWR", 39, 3090, 200, "Right Vertical", "SOD IFF On/Off")
definePushButton("SOD_IDENT", 39, 3091, 199, "Right Vertical", "SOD Identify")
defineTumb("SOD_WAVE", 39, 3092, 201, 0.5, {0, 1}, nil, false, "Right Vertical", "SOD Wave Selector 3/1/2")
defineTumb("SOD_MODE", 39, 3093, 204, .25, {0, 1}, nil, false, "Right Vertical", "SOD Mode Select")

--RADAR
defineTumb("RADAR_PWR", 40, 3094, 205, 0.5, {0, 1}, nil, false, "Right Vertical", "RADAR On/Standby/Off")
defineTumb("RADAR_LOW_ALT", 40, 3095, 206, 0.5, {0, 1}, nil, false, "Right Vertical", "RADAR Low Altitude Off/Comp/On")
defineToggleSwitch("RADAR_BEAM", 40, 3096, 207, "Right Vertical", "RADAR Fixed Beam On/Off")
definePushButton("RADAR_DISP_RST", 40, 3097, 266, "Center Middle", "RADAR Screen Magnetic Reset")
definePushButton("RADAR_CNT", 40, 3098, 330, "Center Middle", "RADAR Interferes - Continues")
definePushButton("RADAR_TEMP", 40, 3099, 331, "Center Middle", "RADAR Interferes - Temporary")
definePushButton("RADAR_PASS", 40, 3100, 332, "Center Middle", "RADAR Interferes - Passive")
definePushButton("RADAR_WX", 40, 3101, 333, "Center Middle", "RADAR Interferes - Weather")
definePushButton("RADAR_IFF", 40, 3102, 334, "Center Middle", "RADAR Interferes - IFF")
definePushButton("RADAR_LOW", 40, 3103, 335, "Center Middle", "RADAR Interferes - Low Speed")
definePushButton("RADAR_TEST", 40, 3104, 336, "Center Middle", "RADAR Interferes - Self-Test")
definePushButton("RADAR_RST", 40, 3105, 337, "Center Middle", "RADAR Interferes - Reset")
definePushButton("RADAR_LOCK", 40, 3190, 378, "Stick", "RADAR Lock Target")
definePotentiometer("RADAR_FLT", 40, 3239, 623, {0, 1}, "Center Middle", "RADAR Polar Filter")

--SPRD/RATO
defineToggleSwitch("SPRD_PWR", 48, 3106, 167, "Right Horizontal", "SPRD On/Off")
defineToggleSwitch("SPRD_DROP_PWR", 48, 3107, 168, "Right Horizontal", "SPRD Drop System On/Off")
defineToggleSwitch("SPRD_START_COVER", 48, 3108, 252, "Center Middle", "SPRD Start Cover")
definePushButton("SPRD_START", 48, 3110, 253, "Center Middle", "SPRD Start")
defineToggleSwitch("SPRD_DROP_COVER", 48, 3109, 317, "Left Horizontal", "SPRD/Flare Drop Cover")
definePushButton("SPRD_DROP", 48, 3111, 318, "Left Horizontal", "SPRD/Flare Drop")

--SPS
defineToggleSwitch("SPS_PWR", 10, 3112, 293, "Left Vertical", "SPS System On/Off")

--ARU
defineToggleSwitch("ARU_MODE", 11, 3113, 295, "Left Vertical", "ARU Auto/Manual")
defineRockerSwitch("ARU_SPD", 11, 3115, 3115, 3114, 3114, 296, "Left Vertical", "ARU Speed")

--Airbrake
defineToggleSwitch("AIR_BRK", 12, 3116, 316, "Left Horizontal", "Airbrakes")

--Wheelbrakes
defineToggleSwitch("ABS_ON", 13, 3117, 299, "Left Vertical", "ABS On/Off")
defineToggleSwitch("NW_BRK", 13, 3118, 238, "Center Upper", "Nosegear Brake On/Off")
defineToggleSwitch("EM_BRK", 13, 3119, 237, "Center Middle", "Emergency Brake")

--Gear
defineToggleSwitch("GEAR_LOCK", 14, 3120, 326, "Left Vertical", "Gear Handle Lock")
defineTumb("GEAR_LVR", 14, 3121, 327, 1, {-1, 1}, nil, false, "Left Vertical", "Gear Down/Neutral/Up")
definePotentiometer("EM_GEAR_REL", 14, 3122, 223, {0, 1}, "Right Vertical", "Emergency Gear Release")
defineToggleSwitch("EM_NOSE_GEAR_REL", 14, 3123, 281, "Center Lower", "Emergency Nose Gear Release")

--Flaps
defineToggleSwitch("FLAPS_NEUT", 15, 3124, 311, "Left Horizontal", "Flaps Neutral")
defineToggleSwitch("FLAPS_TO", 15, 3125, 312, "Left Horizontal", "Flaps Take-off")
defineToggleSwitch("FLAPS_LDG", 15, 3126, 313, "Left Horizontal", "Flaps Landing")
definePushButton("FLAPS_RST", 15, 3127, 314, "Left Horizontal", "Flaps Reset")

--Drogue Chute
definePushButton("CHUTE_REL", 16, 3128, 298, "Left Vertical", "Drogue Chute Release")
defineToggleSwitch("CHUTE_DROP_CVR", 16, 3129, 304, "Left Horizontal", "Drogue Chute Drop Cover")
definePushButton("CHUTE_DROP", 16, 3130, 305, "Left Horizontal", "Drogue Chute Drop")

--Trimmer
defineToggleSwitch("TRM_PWR", 9, 3131, 172, "Right Vertical", "Trimmer On/Off")
defineRockerSwitch("TRM_ADJ", 9, 3132, 3132, 3240, 3240, 379, "Stick", "Trimmer")

--Nosecone
defineToggleSwitch("CONE_PWR", 17, 3133, 170, "Right Vertical", "Nosecone On/Off")
defineToggleSwitch("CONE_MODE", 17, 3134, 309, "Left Vertical", "Nosecone Auto/Manual control")
definePotentiometer("CONE_ADJ", 17, 3135, 236, {0, 1}, "Center Upper", "Nosecone Manual Adjust")

--SOPLO
defineToggleSwitch("NOZ_POS", 18, 3136, 291, "Left Vertical", "Emergency Nozzle Position Control")

--Main and buster hydro
defineToggleSwitch("EMR_HYD_PUMP", 44, 3137, 171, "Right Vertical", "Emergency Main Hydraulic Pump On/Off")
defineToggleSwitch("AIL_BST", 44, 3138, 319, "Left Horizontal", "Aileron Boosters On/Off")

--KPP
defineToggleSwitch("KPP_MAIN_EMR", 28, 3139, 177, "Right Vertical", "KPP Main/Emergency")
definePushButton("KPP_CGE", 28, 3140, 259, "Center Middle", "KPP Cage")
definePotentiometer("KPP_SET", 28, 3141, 260, {-1, 1}, "Center Middle", "KPP Set Pitch")

--IAS/TAS/KSI (NPP)
defineToggleSwitch("NPP_PWR", 23, 3142, 178, "Right Vertical", "NPP On/Off")
definePushButton("NPP_ADJ", 23, 3143, 258, "Center Middle", "NPP Adjust")
defineRotary("NPP_CRS", 23, 3144, 263, "Center Middle", "NPP Course Set")

--ALT and RALT
defineToggleSwitch("RALT_PWR", 33, 3145, 175, "Right Vertical", "Radio Altimeter On")
defineTumb("ALT_WARN", 33, 3146, 284, 0.14, {0.0, 0.98}, nil, false, "Center Lower", "Altitude Warning Alarm Adjust")
definePotentiometer("ALT_PRESS", 32, 3275, 262, {-1, 1}, "Center Middle", "Altimeter Pressure Knob")

--Oxygen System
defineToggleSwitch("HELM_AIR", 19, 3147, 285, "Left Horizontal", "Helmet Air Conditioning On/Off")
defineToggleSwitch("EMR_O2", 19, 3148, 286, "Left Horizontal", "Emergency Oxygen")
defineToggleSwitch("MIX_O2", 19, 3149, 287, "Left Horizontal", "Mixture/Oxygen")

--Canopy
defineToggleSwitch("CAB_PRES", 43, 3150, 328, "Left Vertical", "Pressurize Canopy")
defineToggleSwitch("CAN_LCK", 43, 3151, 329, "Left Vertical", "Lock Canopy")
definePushButton("CAN_OPN", 43, 3152, 375, "Left Vertical", "Open Canopy")
definePushButton("CAN_CLS", 43, 3194, 385, "Center Upper", "Close Canopy")
definePushButton("CAN_ANTI_ICE", 43, 3153, 239, "Center Upper", "Canopy Anti Ice")
defineToggleSwitch("CAN_EMR_REL", 43, 3154, 224, "Right Vertical", "Canopy Emergency Jettison")
definePotentiometer("CAN_VENT", 43, 3272, 649, {0, 1}, "Right Vertical", "Canopy Ventilation")

--ASP Gunsight
defineToggleSwitch("SIGHT_PWR", 41, 3155, 186, "Right Vertical", "Gunsight On/Off")
defineToggleSwitch("SIGHT_MAN_AUTO", 41, 3156, 241, "Gunsight", "Gunsight Auto/Manual")
defineToggleSwitch("SIGHT_SHT_BMB", 41, 3157, 242, "Gunsight", "Gunsight Shoot/Bomb Select")
defineToggleSwitch("SIGHT_MSL_GUN", 41, 3158, 243, "Gunsight", "Gunsight gun/missile Select")
defineToggleSwitch("SIGHT_GYRO_MSL", 41, 3159, 244, "Gunsight", "Gunsight Gyro/Missile Select")
defineToggleSwitch("SIGHT_PPR", 41, 3160, 249, "Gunsight", "Gunsight Pipper On/Off")
defineToggleSwitch("SIGHT_FIX_NET", 41, 3161, 250, "Gunsight", "Gunsight Fixed Net On/Off")
definePotentiometer("TGT_SIZE", 41, 3162, 245, {0, 1}, "Gunsight", "Gunsight Target Range")
definePotentiometer("INT_ANGLE", 41, 3163, 246, {0, 1}, "Gunsight", "Gunsight Intercept Angle")
definePotentiometer("SCL_BRT", 41, 3164, 247, {0, 1}, "Gunsight", "Gunsight Scale Brightness")
definePotentiometer("PPR_BRT", 41, 3165, 248, {0, 1}, "Gunsight", "Gunsight Pipper Brightness")
definePotentiometer("FIX_NET_BRT", 41, 3166, 251, {0, 1}, "Gunsight", "Gunsight Fixed Net Brightness")
definePotentiometer("TDC_RGE_SPAN", 41, 3213, 384, {0, 1}, "Left Horizontal", "TDC Range/Pipper Span")

--Weapon Control
defineToggleSwitch("MSL_HEAT", 42, 3167, 181, "Right Vertical", "Missile/Rocket Heat")
defineToggleSwitch("MSL_LNCH", 42, 3168, 182, "Right Vertical", "Missile/Rocket Launch")
defineToggleSwitch("INB_PYL_PWR", 42, 3169, 183, "Right Vertical", "Pylons 1-2 On/Off")
defineToggleSwitch("OBD_PYL_PWR", 42, 3170, 184, "Right Vertical", "Pylons 3-4 On/Off")
defineToggleSwitch("GUN_PWR", 42, 3171, 185, "Right Vertical", "GS-23 Gun On/Off")
defineToggleSwitch("GUN_CAM", 42, 3172, 187, "Right Vertical", "Gun Camera On/Off")
defineToggleSwitch("BMB_FUZ_CVR", 42, 3173, 277, "Center Lower", "Tactical Drop Cover")
defineToggleSwitch("BMB_FUZ", 42, 3174, 278, "Center Lower", "Tactical Drop")
defineToggleSwitch("EM_MSL_JET_CVR", 42, 3175, 275, "Center Lower", "Emergency Missile/Rocket Launch Cover")
definePushButton("EM_MSL_JET", 42, 3176, 276, "Center Lower", "Emergency Missile/Rocket Launch")
defineToggleSwitch("WING_DRP_TKS_CVR", 42, 3177, 256, "Center Middle", "Wing Drop Tank Jettison Cover")
definePushButton("WING_DRP_TKS", 42, 3178, 257, "Center Middle", "Wing Drop Tank Jettison")
definePushButton("CTR_DRP_TK", 42, 3196, 386, "Stick", "Centerline Drop Tank Jettison")
defineToggleSwitch("OBD_PYL_JET_CVR", 42, 3179, 269, "Center Middle", "Outboard Pylon Jettison Cover")
definePushButton("OBD_PYL_JET", 42, 3180, 270, "Center Middle", "Outboard Pylon Jettison")
defineToggleSwitch("INB_PYL_JET_CVR", 42, 3181, 271, "Center Middle", "Inboard Pylon Jettison Cover")
definePushButton("INB_PYL_JET", 42, 3182, 272, "Center Middle", "Inboard Pylon Jettison")
defineToggleSwitch("MODE_AA_AG", 42, 3183, 230, "Center Upper", "Weapons AA/AG Mode")
defineTumb("IR_SAR_NEU", 42, 3184, 231, 0.5, {0, 1}, nil, false, "Center Upper", "IR/Neutral/SAR Missile Mode")
definePushButton("GUN_PYRO_1", 42, 3185, 232, "Center Upper", "Gun Pyro Charge 1")
definePushButton("GUN_PYRO_2", 42, 3186, 233, "Center Upper", "Gun Pyro Charge 2")
definePushButton("GUN_PYRO_3", 42, 3187, 234, "Center Upper", "Gun Pyro Charge 3")
defineTumb("WPN_SEL", 42, 3188, 235, .1, {0, 1}, nil, true, "Center Upper", "Weapon Selector")
definePotentiometer("MSL_VOL", 42, 3189, 297, {0, 1}, "Left Vertical", "IR Missile Seeker Volume")
definePushButton("GUN", 42, 3191, 381, "Stick", "Gun Trigger")
definePushButton("WPN_REL", 42, 3193, 382, "Stick", "Weapons Release")
defineToggleSwitch("WPN_REL_CVR", 42, 3192, 383, "Stick", "Weapons Release Cover")

--Helmet Visor
defineToggleSwitch("HELM_HEAT_MODE", 45, 3205, 306, "Left Vertical", "Helmet Heat Auto/Manual")
definePushButton("HELM_QUICK_HEAT", 45, 3206, 310, "Left Vertical", "Helmet Quick Heat")
defineToggleSwitch("HELM_VSR", 45, 3207, 369, "Left Vertical", "Helmet Visor On/Off")

--Air Conditioning
defineTumb("CPT_AIR_CND", 50, 3208, 292, 0.33, {0, 0.99}, nil, true, "Left Vertical", "Air Conditioning Select")

--SARPP
defineToggleSwitch("FLT_DTA_REC", 49, 3209, 193, "Right Vertical", "Flight Recorder On/Off")

--Clock
defineRockerSwitch("CLK_LEFT_LVR", 26, 3249, 3249, 3250, 3250, 265, "Center Middle", "Clock Left Lever Push/Pull")
defineRotary("CLK_LEFT_LVR_ROT", 26, 3251, 264, "Center Middle", "Clock Left Lever Rotate")
definePushButton("CLK_RIGHT_LVR", 26, 3252, 268, "Center Middle", "Clock Right Lever Push") --Odd behavior from the control reference; Steps out of order??
defineRotary("CLK_RIGHT_LVR_ROT", 26, 3253, 267, "Center Middle", "Clock Right Lever Rotate")

--Dummy buttons/switches
defineToggleSwitch("RADAR_EMIS_COVER", 40, 3254, 632, "Center Middle", "RADAR Emission Mode Cover")
defineToggleSwitch("RADAR_EMIS", 40,  3255, 633, "Center Middle", "RADAR Emission Mode")
definePotentiometer("G_SUIT_VALVE", 51, 3256, 634, {0, 1}, "Seat", "G Suit Min/Max Valve") --Location?
defineToggleSwitch("ELEC_BUS_1_COVER", 51, 3257, 635, "Left Vertical", "Electrical Bus Nr. 1 Cover")
defineToggleSwitch("ELEC_BUS_1", 51, 3258, 636, "Left Vertical", "Electrical Bus Nr. 1")
defineToggleSwitch("ELEC_BUS_2", 51, 3259, 637, "Right Horizontal", "Electrical Bus Nr. 2")

defineToggleSwitch("MACH_TEST_CVR", 17, 3260, 638, "Right Horizontal", "Mach Test Button Cover")
definePushButton("MACH_TEST", 17, 3261, 639, "Right Horizontal", "Mach Test")

definePushButton("BU45_SEP", 51, 3262, 640, "Right Horizontal", "BU-45 Separation")
definePushButton("SOD_CTL_PBU_1", 51, 3263, 642, "Right Horizontal", "SOD Control PBU-1")
definePushButton("SOD_CTL_PBU_2", 51, 3264, 641, "Right Horizontal", "SOD Control PBU-2")
definePushButton("EJECT", 51, 3265, 643, "Seat", "Ejection Handle (No effect at this time)")
defineToggleSwitch("UK2M_MIC_AMP_ML", 51, 3267, 645, "Left Horizontal", "UK-2M Mic Amplifier M/L")
defineToggleSwitch("UK2M_MIC_AMP_GSKM", 51, 3268, 646, "Left Horizontal", "UK-2M Mic Amplifier GS/KM")
definePotentiometer("SUIT_VENT", 51, 3269, 647, {0, 1}, "Left Vertical", "Suit Ventilation")
defineToggleSwitch("HRNS_SEP", 51, 3270, 648, "Seat", "Harness Separation")
definePotentiometer("HRNS_LS_TGHT", 51, 3273, 651, {0, 1}, "Seat", "Harness Loose/Tight")
definePotentiometer("THR_FIX", 51, 3274, 651, {0, 1}, "Left Horizontal", "Throttle Fixation")

--IAB PBK-3
defineToggleSwitch("NUK_EMR_JET", 56, 3197, 387, "Gunsight Nuke Panel", "Nuke Emergency Jettison")
defineToggleSwitch("NUK_EMR_JET_ARM", 56, 3198, 388, "Gunsight Nuke Panel", "Nuke Emergency Jettison - ARM")
defineToggleSwitch("NUK_TAC_JET", 56, 3199, 389, "Gunsight Nuke Panel", "Nuke Tactical Drop")
defineToggleSwitch("NUK_WPN_SEL", 56, 3200, 390, "Gunsight Nuke Panel", "Weapon Select Toggle")
defineToggleSwitch("NUK_BRK_CHT", 56, 3201, 391, "Gunsight Nuke Panel", "Nuke brake chute")
defineToggleSwitch("NUK_AIR_BRST", 56, 3202, 392, "Gunsight Nuke Panel", "Nuke Air/Ground Burst")

--SPS 141-100
defineToggleSwitch("SPS141_PWR", 57, 3214, 393, "Gunsight SPS-141-100 Panel", "SPS-141-100 On/off")
defineToggleSwitch("SPS141_TX", 57, 3215, 394, "Gunsight SPS-141-100 Panel", "SPS-141-100 Transmit/Receive")
defineToggleSwitch("SPS141_PROG", 57, 3216, 395, "Gunsight SPS-141-100 Panel", "SPS-141-100 Program I/II")
defineToggleSwitch("SPS141_CONT", 57, 3217, 396, "Gunsight SPS-141-100 Panel", "SPS-141-100 Continuous/Impulse")
definePushButton("SPS141_TEST", 57, 3218, 397, "Gunsight SPS-141-100 Panel", "SPS-141-100 Test")
defineToggleSwitch("SPS141_AUTO", 57, 3219, 398, "Gunsight SPS-141-100 Panel", "SPS-141-100 Auto/Manual")
defineTumb("SPS141_MODE", 57, 3220, 399, 0.5, {0, 1}, nil, false, "Gunsight SPS-141-100 Panel", "SPS-141-100 Off/Parallel/Full")
defineToggleSwitch("SPS141_CVR", 57, 3221, 400, "Gunsight SPS-141-100 Panel", "SPS-141-100 Manual Activation Cover")
definePushButton("SPS141_MAN", 57, 3222, 401, "Gunsight SPS-141-100 Panel", "SPS-141-100 Manual Activation")

--GUV Control Box
defineToggleSwitch("GUV_PWR", 42, 3223, 420, "Gunsight UPK-23-250-2 Panel", "UPK-23-250-2 On/Off")
defineToggleSwitch("GUV_SEL", 42, 3224, 421, "Gunsight UPK-23-250-2 Panel", "UPK-23-250-2 Gun Select")
definePushButton("GUV_1", 42, 3225, 422, "Gunsight UPK-23-250-2 Panel", "UPK-23-250-2 Load 1")
definePushButton("GUV_2", 42, 3226, 425, "Gunsight UPK-23-250-2 Panel", "UPK-23-250-2 Load 2")
definePushButton("GUV_3", 42, 3227, 424, "Gunsight UPK-23-250-2 Panel", "UPK-23-250-2 Load 3")

devices = nil
device_commands = nil

BIOS.protocol.endModule()
end
