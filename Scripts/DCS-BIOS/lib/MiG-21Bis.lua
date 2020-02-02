BIOS.protocol.beginModule("MiG-21Bis", 0x2200)
BIOS.protocol.setExportModuleAircrafts({"MiG-21Bis"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local defineIndicatorLightInverted = BIOS.util.defineIndicatorLightInverted
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
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--Clickable Controls----------------------------------------------------------------------------

--DC & AC busses and gyro devices
defineToggleSwitch("BAT_PWR", 1, 3001, 165, "Main Power Panel", "Battery On/Off")
defineToggleSwitch("BAT_HTR", 1, 3002, 155, "SRZO/Fuse Panel", "Battery Heat On/Off")
defineToggleSwitch("DC_GEN", 1, 3003, 166, "Main Power Panel", "DC Generator On/Off")
defineToggleSwitch("AC_GEN", 2, 3004, 169, "Main Power Panel", "AC Generator On/Off")
defineToggleSwitch("PO7502", 2, 3005, 154, "SRZO/Fuse Panel", "PO-750 Inverter #2 On/Off")
defineToggleSwitch("PO7501", 2, 3006, 153, "SRZO/Fuse Panel", "PO-750 Inverter #1 On/Off")
defineToggleSwitch("AUX_INV", 2, 3007, 164, "Main Power Panel", "Emergency Inverter On/Off")

--Gyro
defineToggleSwitch("GYRO_1", 21, 3008, 162, "Main Power Panel", "Gyro, NPP, SAU, RLS Signal, KPP Power On/Off")
defineToggleSwitch("GYRO_2", 21, 3009, 163, "Main Power Panel", "DA-200 Signal, Gyro, NPP, RLS, SAU Power On/Off")

--Fuel pumps & fuel system
defineToggleSwitch("PUMP_GR3", 4, 3010, 159, "Main Power Panel", "Fuel Pump Group 3 On/Off")
defineToggleSwitch("PUMP_GR1", 4, 3011, 160, "Main Power Panel", "Fuel Pump Group 1 On/Off")
defineToggleSwitch("DRN_PUMP", 4, 3012, 161, "Main Power Panel", "Drain Fuel Pump On/Off")
definePotentiometer("FUEL_QTY_SEL", 5, 3013, 274, {0, 1}, "Engine Status Panel", "Adjust Fuel Quantity")

--Engine start device
defineToggleSwitch("APU_PWR", 3, 3014, 302, "Left Vertical Mid Panel", "APU On/Off")
defineToggleSwitch("ENG_START_TYPE", 3, 3015, 288, "Left Vertical Aft Panel", "Engine Normal/Cold Start Select")
definePushButton("ENG_START", 3, 3016, 289, "Left Vertical Aft Panel", "Engine Starter")
defineToggleSwitch("ENG_AIR_START", 3, 3017, 301, "Left Vertical Mid Panel", "Engine Air Start")
defineToggleSwitch("ENG_STOP", 3, 3238, 616, "Throttle", "Engine Stop/Throttle Lock")

--ACCELEROMETER
definePushButton("ACC_RESET", 35, 3018, 228, "Accelerometer, AoA Gauge Panel", "Accelerometer Reset")

--Pitot tubes and related things that use DC bus for heating
defineToggleSwitch("PIT_SEL", 27, 3019, 229, "Accelerometer, AoA Gauge Panel", "Pitot Main/Emergency Select")
defineToggleSwitch("PIT_HEAT_MAIN", 27, 3020, 279, "Center Pedestal Panel", "Pitot, Clock, Periscope Heat")
defineToggleSwitch("PIT_HEAT_AUX", 27, 3021, 280, "Center Pedestal Panel", "Secondary Pitot Heat")

--DA-200
definePotentiometer("VARI_SET", 34, 3203, 261, {-1, 1}, "Flight Status/Navigation Panel", "Adjust Variometer")

--ENGINE
defineToggleSwitch("SURGE_DOOR", 6, 3022, 308, "Left Vertical Mid Panel", "Surge Doors Auto/Manual")
defineToggleSwitch("AFB_PWR", 6, 3023, 300, "Left Vertical Mid Panel", "Afterburner On/Off")
defineToggleSwitch("EMR_AFB_PWR", 6, 3024, 320, "Left Horizontal", "Emergency Afterburner")

--Fire extinguisher
defineToggleSwitch("FIRE_EXT_PWR", 53, 3025, 303, "Left Vertical Mid Panel", "Fire Extinguisher On/Off")
defineToggleSwitch("FIRE_EXT_CVR", 53, 3026, 324, "Left Vertical Forward Panel", "Fire Extinguisher Cover")
definePushButton("FIRE_EXT", 53, 3027, 325, "Left Vertical Forward Panel", "Fire Extinguisher")

--Lights
definePotentiometer("TXT_LIGHT", 46, 3231, 612, {0, 1}, "Right Horizontal Aft Panel", "Text Backlights")
definePotentiometer("GAUGE_LIGHT", 46, 3232, 156, {0, 1}, "Right Horizontal Aft Panel", "Gauge Backlights")
definePotentiometer("RED_LIGHT", 46, 3233, 157, {0, 1}, "Right Horizontal Forward Panel", "Red Lights")
definePotentiometer("WHITE_LIGHT", 46, 3234, 222, {0, 1}, "Canopy Frame", "White Lights")
defineTumb("NAV_LIGHTS", 46, 3032, 194, 0.33, {0.0, 0.99}, nil, true, "Avionics Power Panel", "Nav Lights Off/Dim/Med/Bright")
defineTumb("LND_LIGHT", 46, 3033, 323, 0.5, {0.0, 1}, nil, false, "Landing Gear Control", "Landing Lights Land/Taxi/Off/Dim/Med/Bright")

--Warning Lights
definePushButton("FUEL_WARN_LIGHT_TEST", 47, 3034, 369, "Main Warning Lights", "Fuel Warn Lights Test")
defineToggleSwitch("FUEL_WARN_LIGHTS_BRT", 47, 3074, 195, "Main Warning Lights", "Fuel Warn Lights Brightness")
definePushButton("MAIN_WARN_LIGHT_TEST", 47, 3035, 370, "Main Warning Lights", "Main Warn Lights Test")
defineToggleSwitch("MAIN_WARN_LIGHTS_BRT", 47, 3075, 196, "Main Warning Lights", "Main Warn Lights Brightness")
definePushButton("CTR_WARN_LIGHT_TEST", 47, 3036, 371, "Engine Status Panel", "Center Warn Lights Test")
defineToggleSwitch("CTR_WARN_LIGHTS_BRT", 47, 3076, 273, "Engine Status Panel", "Center Warn Lights Brightness")
definePushButton("PYL_EMPTY_WARN_LIGHT_TEST", 47, 3037, 372, "Center Pedestal Panel", "Pylon Empty Warn Lights Test")
defineToggleSwitch("PYL_EMPTY_WARN_LIGHTS_BRT", 47, 3077, 282, "Center Pedestal Panel", "Pylon Empty Warn Lights Brightness")
definePushButton("PYL_LD_WARN_LIGHT_TEST", 47, 3038, 373, "Center Pedestal Panel", "Pylon Loaded Warn Lights Test")
defineToggleSwitch("PYL_LD_WARN_LIGHTS_BRT", 47, 3078, 283, "Center Pedestal Panel", "Pylon Loaded Warn Lights Brightness")
definePushButton("GEAR_WARN_LIGHT_TEST", 47, 3039, 374, "Landing Gear Control", "Gear Warn Lights Test")
defineToggleSwitch("GEAR_WARN_LIGHTS_BRT", 47, 3079, 322, "Landing Gear Control", "Gear Warn Lights Brightness")
definePushButton("MASTER_WARN_LIGHT_TEST", 47, 3040, 255, "Flight Status/Navigation Panel", "Master Warn Light Test/Acknowledge")
defineToggleSwitch("MASTER_WARN_LIGHT_BRT", 47, 3277, 657, "Flight Status/Navigation Panel", "Master Warn Light Brightness")


--RADIO
defineToggleSwitch("RAD_PWR", 22, 3041, 173, "Avionics Power Panel", "Radio On/Off")
defineToggleSwitch("RAD_CPS", 22, 3042, 208, "Radio", "Radio/Compass Audio")
defineToggleSwitch("RAD_SQL", 22, 3043, 209, "Radio", "Radio Squelch")
definePotentiometer("RAD_VOL", 22, 3044, 210, {0, 1}, "Radio", "Radio Volume")
defineTumb("RAD_CHAN", 22, 3045, 211, 0.05, {0.0, 0.95}, nil, true, "Radio", "Radio Channel")
definePushButton("RAD_PTT", 55, 3046, 315, "Throttle", "Radio PTT")

--ARC
defineToggleSwitch("ARC_PWR", 24, 3047, 174, "Avionics Power Panel", "ARC On/Off")
definePotentiometer("ARC_VOL", 24, 3048, 198, {0, 1}, "SOD Panel", "ARC Volume")
definePushButton("ARC_CHG", 24, 3049, 212, "ARC", "ARC Change")
defineTumb("ARC_CHAN", 24, 3050, 213, 0.1, {0.1, 0.9}, nil, true, "ARC", "ARC Channel") --Split up into individual channels?
defineTumb("ARC_ZONE", 24, 3051, 189, 0.14, {0, 0.98}, nil, false, "SRZO/Fuse Panel", "ARC Zones")
defineToggleSwitch("ARC_CMP", 24, 3052, 197, "SOD Panel", "ARC Antenna/Compass")
defineToggleSwitch("ARC_MRK", 24, 3053, 254, "Flight Status/Navigation Panel", "ARC Marker Far/Near")

--RSBN
defineToggleSwitch("RSBN_PWR", 25, 3054, 176, "Avionics Power Panel", "RSBN On/Off")
defineTumb("RSBN_MODE", 25, 3055, 240, 0.5, {0, 1}, nil, false, "ARU/Nosecone Panel", "RSBN Mode")
defineToggleSwitch("RSBN_ARC_SEL", 25, 3056, 340, "Left Vertical Mid Panel", "RSBN/ARC Select")
definePushButton("RSBN_IDENT", 25, 3057, 294, "Left Vertical Mid Panel", "RSBN Identify")
definePushButton("RSBN_TEST", 25, 3080, 347, "Left Vertical Mid Panel", "RSBN Self-Test")

--RSBN Panel
definePotentiometer("RSBN_VOL", 25, 3058, 345, {0, 1}, "RSBN", "RSBN Volume")
defineTumb("RSBN_CHAN", 25, 3059, 351, 0.01, {0, 0.99}, nil, true, "RSBN", "RSBN Channel")
defineTumb("PRMG_CHAN", 25, 3060, 352, 0.01, {0, 0.99}, nil, true, "RSBN", "PRMG Channel")
definePushButton("RSBN_RST", 25, 3061, 366, "RSBN", "RSBN Reset")
defineToggleSwitch("RSBN_BRG", 25, 3062, 367, "RSBN", "RSBN Bearing")
defineToggleSwitch("RSBN_DIST", 25, 3063, 368, "RSBN", "RSBN Distance")

-- SAU
defineToggleSwitch("SAU_PWR", 8, 3064, 179, "Avionics Power Panel", "SAU On/Off")
defineToggleSwitch("SAU_PITCH_PWR", 8, 3065, 180, "Avionics Power Panel", "SAU Pitch On/Off")
definePushButton("SAU_STAB", 8, 3066, 343, "SAU", "SAU Stabilization Mode")
definePushButton("SAU_CANCEL", 8, 3067, 376, "Stick", "SAU Cancel Current Mode")
definePushButton("SAU_RECOVERY", 8, 3068, 377, "Stick", "SAU Recovery Mode")
defineToggleSwitch("SAU_LOW", 8, 3069, 344, "SAU", "SAU Limit Altitude")
definePushButton("SAU_LAND_CMD", 8, 3070, 341, "SAU", "SAU Command Landing Mode")
definePushButton("SAU_LAND_AUTO", 8, 3071, 342, "SAU", "SAU Auto Landing Mode")
definePushButton("SAU_RST", 8, 3072, 348, "SAU", "SAU Reset/Off")

-- SPO
defineToggleSwitch("SPO_PWR", 37, 3083, 202, "SOD Panel", "SPO On/Off")
definePushButton("SPO_TEST", 37, 3084, 226, "SPO RWR", "SPO Test")
defineToggleSwitch("SPO_DAY", 37, 3085, 227, "SPO RWR", "SPO Day/Night")
definePotentiometer("SPO_VOL", 37, 3086, 225, {0, 1}, "SPO RWR", "SPO Volume")

-- SRZO
defineToggleSwitch("SRZO_PWR", 38, 3087, 188, "Avionics Power Panel", "SRZO IFF Coder/Decoder On/Off")
defineTumb("SRZO_CODE", 38, 3088, 192, 0.08, {0.0, 0.88}, nil, true, "SRZO/Fuse Panel", "SRZO Codes")
defineToggleSwitch("SRZO_81_PWR", 38, 3089, 346, "SOD Panel", "SRZO Type 81 On/Off")
defineToggleSwitch("SRZO_EM_TX_CVR", 38, 3210, 190, "SRZO/Fuse Panel", "SRZO Emergency Transmit Cover")
defineToggleSwitch("SRZO_EM_TX", 38, 3211, 191, "SRZO/Fuse Panel", "SRZO Emergency Transmit")
defineToggleSwitch("SRZO_DEST_CVR", 38, 3229, 427, "SRZO/Fuse Panel", "SRZO Self Destruct Cover")
definePushButton("SRZO_DEST", 38, 3230, 428, "SRZO/Fuse Panel", "SRZO Self Destruct")

-- SOD (increase radar signal for ATC radar, most likely won't be implemented)
defineToggleSwitch("SOD_PWR", 39, 3090, 200, "SOD Panel", "SOD IFF On/Off")
definePushButton("SOD_IDENT", 39, 3091, 199, "SOD Panel", "SOD Identify")
defineTumb("SOD_WAVE", 39, 3092, 201, 0.5, {0, 1}, nil, false, "SOD Panel", "SOD Wave Selector 3/1/2")
defineTumb("SOD_MODE", 39, 3093, 204, 0.25, {0, 1}, nil, false, "SOD Panel", "SOD Mode Select")

--RADAR
defineTumb("RADAR_PWR", 40, 3094, 205, 0.5, {0, 1}, nil, false, "RADAR Power", "RADAR On/Standby/Off")
defineTumb("RADAR_LOW_ALT", 40, 3095, 206, 0.5, {0, 1}, nil, false, "RADAR Power", "RADAR Low Altitude Off/Comp/On")
defineToggleSwitch("RADAR_BEAM", 40, 3096, 207, "RADAR Power", "RADAR Fixed Beam On/Off")
definePushButton("RADAR_DISP_RST", 40, 3097, 266, "Flight Status/Navigation Panel", "RADAR Screen Magnetic Reset")
definePushButton("RADAR_CNT", 40, 3098, 330, "RADAR Scope, Interrupts", "RADAR Interferes - Continues")
definePushButton("RADAR_TEMP", 40, 3099, 331, "RADAR Scope, Interrupts", "RADAR Interferes - Temporary")
definePushButton("RADAR_PASS", 40, 3100, 332, "RADAR Scope, Interrupts", "RADAR Interferes - Passive")
definePushButton("RADAR_WX", 40, 3101, 333, "RADAR Scope, Interrupts", "RADAR Interferes - Weather")
definePushButton("RADAR_IFF", 40, 3102, 334, "RADAR Scope, Interrupts", "RADAR Interferes - IFF")
definePushButton("RADAR_LOW", 40, 3103, 335, "RADAR Scope, Interrupts", "RADAR Interferes - Low Speed")
definePushButton("RADAR_TEST", 40, 3104, 336, "RADAR Scope, Interrupts", "RADAR Interferes - Self-Test")
definePushButton("RADAR_RST", 40, 3105, 337, "RADAR Scope, Interrupts", "RADAR Interferes - Reset")
definePushButton("RADAR_LOCK", 40, 3190, 378, "Stick", "RADAR Lock Target")
definePotentiometer("RADAR_FLT", 40, 3239, 623, {0, 1}, "RADAR Scope, Interrupts", "RADAR Polar Filter")

--SPRD/RATO
defineToggleSwitch("SPRD_PWR", 48, 3106, 167, "Main Power Panel", "SPRD On/Off")
defineToggleSwitch("SPRD_DROP_PWR", 48, 3107, 168, "Main Power Panel", "SPRD Drop System On/Off")
defineToggleSwitch("SPRD_START_COVER", 48, 3108, 252, "Flight Status/Navigation Panel", "SPRD Start Cover")
definePushButton("SPRD_START", 48, 3110, 253, "Flight Status/Navigation Panel", "SPRD Start")
defineToggleSwitch("SPRD_DROP_COVER", 48, 3109, 317, "Left Horizontal", "SPRD/Flare Drop Cover")
definePushButton("SPRD_DROP", 48, 3111, 318, "Left Horizontal", "SPRD/Flare Drop")

--SPS
defineToggleSwitch("SPS_PWR", 10, 3112, 293, "Left Vertical Mid Panel", "SPS System On/Off")

--ARU
defineToggleSwitch("ARU_MODE", 11, 3113, 295, "Left Vertical Mid Panel", "ARU Auto/Manual")
defineRockerSwitch("ARU_SPD", 11, 3115, 3115, 3114, 3114, 296, "Left Vertical Mid Panel", "ARU Speed")

--Airbrake
defineToggleSwitch("AIR_BRK", 12, 3116, 316, "Throttle", "Airbrakes")

--Wheelbrakes
defineToggleSwitch("ABS_ON", 13, 3117, 299, "Left Vertical Mid Panel", "ABS On/Off")
defineToggleSwitch("NW_BRK", 13, 3118, 238, "ARU/Nosecone Panel", "Nosegear Brake On/Off")
defineToggleSwitch("EM_BRK", 13, 3119, 237, "Flight Status/Navigation Panel", "Emergency Brake")

--Gear
defineToggleSwitch("GEAR_LOCK", 14, 3120, 326, "Landing Gear Control", "Gear Handle Lock")
defineTumb("GEAR_LVR", 14, 3121, 327, 1, {-1, 1}, nil, false, "Landing Gear Control", "Gear Down/Neutral/Up")
definePotentiometer("EM_GEAR_REL", 14, 3122, 223, {0, 1}, "Canopy Frame", "Emergency Gear Release")
defineToggleSwitch("EM_NOSE_GEAR_REL", 14, 3123, 281, "Center Pedestal Panel", "Emergency Nose Gear Release")

--Flaps
defineToggleSwitch("FLAPS_NEUT", 15, 3124, 311, "Left Horizontal", "Flaps Neutral")
defineToggleSwitch("FLAPS_TO", 15, 3125, 312, "Left Horizontal", "Flaps Take-off")
defineToggleSwitch("FLAPS_LDG", 15, 3126, 313, "Left Horizontal", "Flaps Landing")
definePushButton("FLAPS_RST", 15, 3127, 314, "Left Horizontal", "Flaps Reset")

--Drogue Chute
definePushButton("CHUTE_REL", 16, 3128, 298, "Left Vertical Mid Panel", "Drogue Chute Release")
defineToggleSwitch("CHUTE_DROP_CVR", 16, 3129, 304, "Left Horizontal", "Drogue Chute Drop Cover")
definePushButton("CHUTE_DROP", 16, 3130, 305, "Left Horizontal", "Drogue Chute Drop")

--Trimmer
defineToggleSwitch("TRM_PWR", 9, 3131, 172, "Avionics Power Panel", "Trimmer On/Off")
defineRockerSwitch("TRM_ADJ", 9, 3132, 3132, 3240, 3240, 379, "Stick", "Trimmer")

--Nosecone
defineToggleSwitch("CONE_PWR", 17, 3133, 170, "Avionics Power Panel", "Nosecone On/Off")
defineToggleSwitch("CONE_MODE", 17, 3134, 309, "Left Vertical Mid Panel", "Nosecone Auto/Manual control")
definePotentiometer("CONE_ADJ", 17, 3135, 236, {0, 1}, "ARU/Nosecone Panel", "Nosecone Manual Adjust")

--SOPLO
defineToggleSwitch("NOZ_POS", 18, 3136, 291, "Left Vertical Mid Panel", "Emergency Nozzle Position Control")

--Main and booster hydro
defineToggleSwitch("EMR_HYD_PUMP", 44, 3137, 171, "Avionics Power Panel", "Emergency Main Hydraulic Pump On/Off")
defineToggleSwitch("AIL_BST", 44, 3138, 319, "Left Horizontal", "Aileron Boosters On/Off")

--KPP
defineToggleSwitch("KPP_MAIN_EMR", 28, 3139, 177, "Avionics Power Panel", "KPP Main/Emergency")
definePushButton("KPP_CGE", 28, 3140, 259, "Flight Status/Navigation Panel", "KPP Cage")
definePotentiometer("KPP_SET", 28, 3141, 260, {-1, 1}, "Flight Status/Navigation Panel", "KPP Set Pitch")

--IAS/TAS/KSI (NPP)
defineToggleSwitch("NPP_PWR", 23, 3142, 178, "Avionics Power Panel", "NPP On/Off")
definePushButton("NPP_ADJ", 23, 3143, 258, "Flight Status/Navigation Panel", "NPP Adjust")
defineRotary("NPP_CRS", 23, 3144, 263, "Flight Status/Navigation Panel", "NPP Course Set")

--ALT and RALT
defineToggleSwitch("RALT_PWR", 33, 3145, 175, "Avionics Power Panel", "Radio Altimeter On")
defineTumb("ALT_WARN", 33, 3146, 284, 0.14, {0.0, 0.98}, nil, false, "Center Pedestal Panel", "Altitude Warning Alarm Adjust")
definePotentiometer("ALT_PRESS", 32, 3073, 262, {-1, 1}, "Flight Status/Navigation Panel", "Altimeter Pressure Knob")

--Oxygen System
defineToggleSwitch("HELM_AIR", 19, 3147, 285, "Left Horizontal", "Helmet Air Conditioning On/Off")
defineToggleSwitch("EMR_O2", 19, 3148, 286, "Left Horizontal", "Emergency Oxygen")
defineToggleSwitch("MIX_O2", 19, 3149, 287, "Left Horizontal", "Mixture/Oxygen")

--Canopy
defineToggleSwitch("CAB_PRES", 43, 3150, 328, "Canopy Frame", "Pressurize Canopy")
defineToggleSwitch("CAN_LCK", 43, 3151, 329, "Canopy Frame", "Lock Canopy")
definePushButton("CAN_OPN", 43, 3152, 375, "Canopy Frame", "Open Canopy")
definePushButton("CAN_CLS", 43, 3194, 385, "Canopy Frame", "Close Canopy")
definePushButton("CAN_ANTI_ICE", 43, 3153, 239, "ARU/Nosecone Panel", "Canopy Anti Ice")
defineToggleSwitch("CAN_EMR_REL", 43, 3154, 224, "Canopy Frame", "Canopy Emergency Jettison")
definePotentiometer("CAN_VENT", 43, 3272, 649, {0, 1}, "Seat", "Canopy Ventilation")

--ASP Gunsight
defineToggleSwitch("SIGHT_PWR", 41, 3155, 186, "Avionics Power Panel", "Gunsight On/Off")
defineToggleSwitch("SIGHT_MAN_AUTO", 41, 3156, 241, "ASP Gunsight", "Gunsight Auto/Manual")
defineToggleSwitch("SIGHT_SHT_BMB", 41, 3157, 242, "ASP Gunsight", "Gunsight Shoot/Bombard Select")
defineToggleSwitch("SIGHT_MSL_GUN", 41, 3158, 243, "ASP Gunsight", "Gunsight Gun/Missile Select")
defineToggleSwitch("SIGHT_GYRO_MSL", 41, 3159, 244, "ASP Gunsight", "Gunsight Gyro/Missile Select")
defineToggleSwitch("SIGHT_PPR", 41, 3160, 249, "ASP Gunsight", "Gunsight Pipper On/Off")
defineToggleSwitch("SIGHT_FIX_NET", 41, 3161, 250, "ASP Gunsight", "Gunsight Fixed Net On/Off")
definePotentiometer("TGT_SIZE", 41, 3162, 245, {0, 1}, "ASP Gunsight", "Gunsight Target Size")
definePotentiometer("INT_ANGLE", 41, 3163, 246, {0, 1}, "ASP Gunsight", "Gunsight Intercept Angle")
definePotentiometer("SCL_BRT", 41, 3164, 247, {0, 1}, "ASP Gunsight", "Gunsight Scale Brightness")
definePotentiometer("PPR_BRT", 41, 3165, 248, {0, 1}, "ASP Gunsight", "Gunsight Pipper Brightness")
definePotentiometer("FIX_NET_BRT", 41, 3166, 251, {0, 1}, "ASP Gunsight", "Gunsight Fixed Net Brightness")
definePotentiometer("TDC_RGE_SPAN", 41, 3213, 384, {0, 1}, "Throttle", "TDC Range/Pipper Span")

--Weapon Control
defineToggleSwitch("MSL_HEAT", 42, 3167, 181, "Avionics Power Panel", "Missile/Rocket Heat")
defineToggleSwitch("MSL_LNCH", 42, 3168, 182, "Avionics Power Panel", "Missile/Rocket Launch")
defineToggleSwitch("INB_PYL_PWR", 42, 3169, 183, "Avionics Power Panel", "Pylons 1-2 On/Off")
defineToggleSwitch("OBD_PYL_PWR", 42, 3170, 184, "Avionics Power Panel", "Pylons 3-4 On/Off")
defineToggleSwitch("GUN_PWR", 42, 3171, 185, "Avionics Power Panel", "GS-23 Gun On/Off")
defineToggleSwitch("GUN_CAM", 42, 3172, 187, "Avionics Power Panel", "Gun Camera On/Off")
defineToggleSwitch("BMB_FUZ_CVR", 42, 3173, 277, "Center Pedestal Panel", "Tactical Drop Cover")
defineToggleSwitch("BMB_FUZ", 42, 3174, 278, "Center Pedestal Panel", "Tactical Drop")
defineToggleSwitch("EM_MSL_JET_CVR", 42, 3175, 275, "Center Pedestal Panel", "Emergency Missile/Rocket Launch Cover")
definePushButton("EM_MSL_JET", 42, 3176, 276, "Center Pedestal Panel", "Emergency Missile/Rocket Launch")
defineToggleSwitch("WING_DRP_TKS_CVR", 42, 3177, 256, "Flight Status/Navigation Panel", "Wing Drop Tank Jettison Cover")
definePushButton("WING_DRP_TKS", 42, 3178, 257, "Flight Status/Navigation Panel", "Wing Drop Tank Jettison")
definePushButton("CTR_DRP_TK", 42, 3196, 386, "Stick", "Centerline Drop Tank Jettison")
defineToggleSwitch("OBD_PYL_JET_CVR", 42, 3179, 269, "Engine Status Panel", "Outboard Pylon Jettison Cover")
definePushButton("OBD_PYL_JET", 42, 3180, 270, "Engine Status Panel", "Outboard Pylon Jettison")
defineToggleSwitch("INB_PYL_JET_CVR", 42, 3181, 271, "Engine Status Panel", "Inboard Pylon Jettison Cover")
definePushButton("INB_PYL_JET", 42, 3182, 272, "Engine Status Panel", "Inboard Pylon Jettison")
defineToggleSwitch("MODE_AA_AG", 42, 3183, 230, "Weapon Select Panel", "Weapons AA/AG Mode")
defineTumb("IR_SAR_NEU", 42, 3184, 231, 0.5, {0, 1}, nil, false, "Weapon Select Panel", "IR/Neutral/SAR Missile Mode")
definePushButton("GUN_PYRO_1", 42, 3185, 232, "Weapon Select Panel", "Gun Pyro Charge 1")
definePushButton("GUN_PYRO_2", 42, 3186, 233, "Weapon Select Panel", "Gun Pyro Charge 2")
definePushButton("GUN_PYRO_3", 42, 3187, 234, "Weapon Select Panel", "Gun Pyro Charge 3")
defineTumb("WPN_SEL", 42, 3188, 235, 0.1, {0, 1}, nil, true, "Weapon Select Panel", "Weapon Selector")
definePotentiometer("MSL_VOL", 42, 3189, 297, {0, 1}, "Left Vertical Mid Panel", "IR Missile Seeker Volume")
definePushButton("GUN", 42, 3191, 381, "Stick", "Gun Trigger")
definePushButton("WPN_REL", 42, 3193, 382, "Stick", "Weapons Release")
defineToggleSwitch("WPN_REL_CVR", 42, 3192, 383, "Stick", "Weapons Release Cover")

--Helmet Visor
defineToggleSwitch("HELM_HEAT_MODE", 45, 3205, 306, "Left Vertical Mid Panel", "Helmet Heat Auto/Manual")
definePushButton("HELM_QUICK_HEAT", 45, 3206, 310, "Left Vertical Mid Panel", "Helmet Quick Heat")
defineToggleSwitch("HELM_VSR", 45, 3207, 369, "Left Vertical Mid Panel", "Helmet Visor On/Off")

--Air Conditioning
defineTumb("CPT_AIR_CND", 50, 3208, 292, 0.33, {0, 0.99}, nil, true, "Left Vertical Mid Panel", "Air Conditioning Select")

--SARPP
defineToggleSwitch("FLT_DTA_REC", 49, 3209, 193, "Avionics Power Panel", "Flight Recorder On/Off")

--Clock
defineRockerSwitch("CLK_LEFT_LVR", 26, 3249, 3249, 3250, 3250, 265, "Flight Status/Navigation Panel", "Clock Left Lever Push/Pull")
defineRotary("CLK_LEFT_LVR_ROT", 26, 3251, 264, "Flight Status/Navigation Panel", "Clock Left Lever Rotate")
definePushButton("CLK_RIGHT_LVR", 26, 3252, 268, "Flight Status/Navigation Panel", "Clock Right Lever Push") --Odd behavior from the control reference; Steps out of order??
defineRotary("CLK_RIGHT_LVR_ROT", 26, 3253, 267, "Flight Status/Navigation Panel", "Clock Right Lever Rotate")

--Dummy buttons/switches
defineToggleSwitch("RADAR_EMIS_COVER", 40, 3254, 632, "Flight Status/Navigation Panel", "RADAR Emission Mode Cover")
defineToggleSwitch("RADAR_EMIS", 40,  3255, 633, "Flight Status/Navigation Panel", "RADAR Emission Mode")
definePotentiometer("G_SUIT_VALVE", 51, 3256, 634, {0, 1}, "Left Vertical Aft Panel", "G Suit Min/Max Valve") --Location?
defineToggleSwitch("ELEC_BUS_1_COVER", 51, 3257, 635, "Left Vertical Aft Panel", "Electrical Bus Nr. 1 Cover")
defineToggleSwitch("ELEC_BUS_1", 51, 3258, 636, "Left Vertical Aft Panel", "Electrical Bus Nr. 1")
defineToggleSwitch("ELEC_BUS_2", 51, 3259, 637, "SRZO/Fuse Panel", "Electrical Bus Nr. 2")

defineToggleSwitch("MACH_TEST_CVR", 17, 3260, 638, "Right Horizontal Aft Panel", "Mach Test Button Cover")
definePushButton("MACH_TEST", 17, 3261, 639, "Right Horizontal Aft Panel", "Mach Test")

definePushButton("BU45_SEP", 51, 3262, 640, "Right Horizontal Aft Panel", "BU-45 Separation")
definePushButton("SOD_CTL_PBU_1", 51, 3263, 642, "Right Horizontal Aft Panel", "SOD Control PBU-1")
definePushButton("SOD_CTL_PBU_2", 51, 3264, 641, "Right Horizontal Aft Panel", "SOD Control PBU-2")
definePushButton("EJECT", 51, 3265, 643, "Seat", "Ejection Handle (No effect at this time)")
defineToggleSwitch("UK2M_MIC_AMP_ML", 51, 3267, 645, "Left Horizontal", "UK-2M Mic Amplifier M/L")
defineToggleSwitch("UK2M_MIC_AMP_GSKM", 51, 3268, 646, "Left Horizontal", "UK-2M Mic Amplifier GS/KM")
definePotentiometer("SUIT_VENT", 51, 3269, 647, {0, 1}, "Left Vertical Mid Panel", "Suit Ventilation")
defineToggleSwitch("HRNS_SEP", 51, 3270, 648, "Seat", "Harness Separation")
definePotentiometer("HRNS_LS_TGHT", 51, 3273, 651, {0, 1}, "Seat", "Harness Loose/Tight")
definePotentiometer("THR_FIX", 51, 3274, 651, {0, 1}, "Throttle", "Throttle Fixation")

--IAB PBK-3
defineToggleSwitch("NUK_EMR_JET", 56, 3197, 387, "IAB Nuclear Control Panel", "Nuke Emergency Jettison")
defineToggleSwitch("NUK_EMR_JET_ARM", 56, 3198, 388, "IAB Nuclear Control Panel", "Nuke Emergency Jettison - ARM")
defineToggleSwitch("NUK_TAC_JET", 56, 3199, 389, "IAB Nuclear Control Panel", "Nuke Tactical Drop")
defineToggleSwitch("NUK_WPN_SEL", 56, 3200, 390, "IAB Nuclear Control Panel", "Weapon Select Toggle")
defineToggleSwitch("NUK_BRK_CHT", 56, 3201, 391, "IAB Nuclear Control Panel", "Nuke brake chute")
defineToggleSwitch("NUK_AIR_BRST", 56, 3202, 392, "IAB Nuclear Control Panel", "Nuke Air/Ground Burst")

--SPS 141-100
defineToggleSwitch("SPS141_PWR", 57, 3214, 393, "SPS-141-100 Panel", "SPS-141-100 On/off")
defineToggleSwitch("SPS141_TX", 57, 3215, 394, "SPS-141-100 Panel", "SPS-141-100 Transmit/Receive")
defineToggleSwitch("SPS141_PROG", 57, 3216, 395, "SPS-141-100 Panel", "SPS-141-100 Program I/II")
defineToggleSwitch("SPS141_CONT", 57, 3217, 396, "SPS-141-100 Panel", "SPS-141-100 Continuous/Impulse")
definePushButton("SPS141_TEST", 57, 3218, 397, "SPS-141-100 Panel", "SPS-141-100 Test")
defineToggleSwitch("SPS141_AUTO", 57, 3219, 398, "SPS-141-100 Panel", "SPS-141-100 Auto/Manual")
defineTumb("SPS141_MODE", 57, 3220, 399, 0.5, {0, 1}, nil, false, "SPS-141-100 Panel", "SPS-141-100 Off/Parallel/Full")
defineToggleSwitch("SPS141_CVR", 57, 3221, 400, "SPS-141-100 Panel", "SPS-141-100 Manual Activation Cover")
definePushButton("SPS141_MAN", 57, 3222, 401, "SPS-141-100 Panel", "SPS-141-100 Manual Activation")

--GUV Control Box
defineToggleSwitch("GUV_PWR", 42, 3223, 420, "UPK-23-250-2 Panel", "UPK-23-250-2 On/Off")
defineToggleSwitch("GUV_SEL", 42, 3224, 421, "UPK-23-250-2 Panel", "UPK-23-250-2 Gun Select")
definePushButton("GUV_1", 42, 3225, 422, "UPK-23-250-2 Panel", "UPK-23-250-2 Load 1")
definePushButton("GUV_2", 42, 3226, 425, "UPK-23-250-2 Panel", "UPK-23-250-2 Load 2")
definePushButton("GUV_3", 42, 3227, 424, "UPK-23-250-2 Panel", "UPK-23-250-2 Load 3")

--Indicators, Lights, Gauges---------------------------------------------------------------------------------------------------------

--Compressed Air Gauge
defineFloat("CMP_AIR_MAIN", 413, {0, 1}, "Right Horizontal Forward Panel", "Compressed Air Main")
defineFloat("CMP_AIR_AUX", 414, {0, 1}, "Right Horizontal Forward Panel", "Compressed Air Aux")

--O2 Gauges
defineFloat("O2_VOL", 59, {0, 1}, "Left Vertical Forward Panel", "Oxygen Quantity")
defineIndicatorLight("GEAR_OXY_LUNG", 60, "Left Vertical Forward Panel", "Oxygen Gauge Lungs/Breath Indicator")
defineFloat("O2_PRES", 58, {0, 1}, "Left Vertical Forward Panel", "Oxygen Pressure")

--Gear Lights
defineIndicatorLightInverted("GEAR_NOSE_UP", 9, "Landing Gear Control", "Gear Nose Up Light")
defineIndicatorLight("GEAR_NOSE_DOWN", 12, "Landing Gear Control", "Gear Nose Down Light")
defineIndicatorLightInverted("GEAR_LEFT_UP", 10, "Landing Gear Control", "Gear Left Up Light")
defineIndicatorLight("GEAR_LEFT_DOWN", 13, "Landing Gear Control", "Gear Left Down Light")
defineIndicatorLightInverted("GEAR_RIGHT_UP", 11, "Landing Gear Control", "Gear Right Up Light")
defineIndicatorLight("GEAR_RIGHT_DOWN", 14, "Landing Gear Control", "Gear Right Down Light")

--Airspeed Gauges

defineFloat("IAS_IND", 100, {0, 1}, "Flight Status/Navigation Panel", "Airspeed Gauge IAS")
defineFloat("TAS_IND", 101, {0, 1}, "Flight Status/Navigation Panel", "Airspeed Gauge TAS")
defineFloat("M_IND", 102, {0, 1}, "Flight Status/Navigation Panel", "Airspeed Gauge Mach")

--Barometric Altimeter

defineFloat("BARO_ALT_M", 104, {0, 1}, "Flight Status/Navigation Panel", "Barometric Altimeter Meters")
defineFloat("BARO_ALT_KM", 112, {0, 1}, "Flight Status/Navigation Panel", "Barometric Altimeter Kilometers")

--NPP course indicator, course set needle
defineFloat("NPP_CRS_IND", 111, {0, 1}, "Flight Status/Navigation Panel", "NPP Course Indicator")
defineFloat("NPP_CRS_SET", 68, {0, 1}, "Flight Status/Navigation Panel", "NPP Course Set Needle")

--RSBN lights/indicators

defineIndicatorLight("RSBN_ASM", 548, "RSBN", "RSBN Asimuth Correction Light")
defineIndicatorLight("RSBN_DIST_LGHT", 549, "RSBN", "RSBN Distance Correction Light")
defineFloat("RSBN_DIST_HUND", 355, {0, 1}, "Engine Status Panel", "RSBN Distance Gauge Hundreds")
defineFloat("RSBN_DIST_TENS", 356, {0, 1}, "Engine Status Panel", "RSBN Distance Gauge Tens")
defineFloat("RSBN_DIST_ONES", 357, {0, 1}, "Engine Status Panel", "RSBN Distance Gauge Ones")
defineIndicatorLight("RSBN_CRS_BL", 587, "Flight Status/Navigation Panel", "NPP PRMG Course Guidance Signal Window")
defineIndicatorLight("RSBN_GLD_BL", 588, "Flight Status/Navigation Panel", "NPP PRMG Glideslope Guidance Signal Window")
defineFloat("RSBN_CRS_ND_NPP", 590, {-1, 1}, "Flight Status/Navigation Panel", "NPP PRMG Course Needle")
defineFloat("RSBN_GLD_ND_NPP", 589, {-1, 1}, "Flight Status/Navigation Panel", "NPP PRMG Glideslope Needle")
defineIndicatorLight("RSBN_KR_BL", 567, "Flight Status/Navigation Panel", "KPP 'K' Flag Indicator")
defineIndicatorLight("RSBN_TE_BL", 568, "Flight Status/Navigation Panel", "KPP 'T' Flag Indicator")
defineFloat("RSBN_CRS_ND_KPP", 565, {-1, 1}, "Flight Status/Navigation Panel", "KPP PRMG Course Needle")
defineFloat("RSBN_GLD_ND_KPP", 566, {-1, 1}, "Flight Status/Navigation Panel", "KPP PRMG Glideslope Needle")

--ARC
defineFloat("ARK_RSBN_ND", 36, {0, 1}, "Flight Status/Navigation Panel", "ARC/RSBN Needle")

--Radio Altimeter
defineFloat("RALT_ND", 103, {0, 1}, "Flight Status/Navigation Panel", "Radio Altimeter Needle")
defineIndicatorLight("LOW_ALT_LIGHT", 500, "Flight Status/Navigation Panel", "Low Altitude Warn Light")

--UUA/AOA
defineFloat("AOA_ND", 105, {-0.2857, 1}, "Accelerometer, AoA Gauge Panel", "AOA Gauge")
defineIndicatorLight("AOA_WARN_LGHT", 537, "Canopy Frame", "AOA Warning Lights")

--DA-200 Subgroup
defineFloat("DA200_TURN", 107, {-1, 1}, "Flight Status/Navigation Panel", "DA-200 Turn Needle")
defineFloat("DA200_VVI", 106, {-1, 1}, "Flight Status/Navigation Panel", "DA-200 VVI Needle")
defineFloat("DA200_SLIP", 31, {-1, 1}, "Flight Status/Navigation Panel", "DA-200 Slip Ball") -- Also used for the KPP slip ball
defineIndicatorLight("KPP_ARR_LIGHT", 535, "Flight Status/Navigation Panel", "KPP Cage Light")
defineFloat("KPP_BANK", 108, {-1, 1}, "Flight Status/Navigation Panel", "KPP Bank")
defineFloat("KPP_PITCH", 109, {-1, 1}, "Flight Status/Navigation Panel", "KPP Pitch")

--Accelerometer
defineFloat("ACCEL_ND", 110, {-0.41, 1}, "Accelerometer, AoA Gauge Panel", "Accelerometer Needle")
defineFloat("ACCEL_MAX", 113, {0, 1}, "Accelerometer, AoA Gauge Panel", "Accelerometer Max G Marker")
defineFloat("ACCEL_MIN", 114, {0, 1}, "Accelerometer, AoA Gauge Panel", "Accelerometer Min G Marker")

--Trimmer Light
defineIndicatorLight("TRM_LIGHT", 519, "Engine Status Panel", "Trimmer Light")

--DC Bus
defineFloat("DC_V_NEEDLE", 124, {0, 1}, "Engine Status Panel", "Voltmeter Needle")
defineIndicatorLight("DC_GEN_LIGHT", 510, "Main Warning Lights", "DC Generator Light")
defineFloat("DC_BAT_GAUGE", 55, {0, 1}, "Center Pedestal Panel", "Battery Gauge Needle")

--AC Bus
defineIndicatorLight("AC_GEN_LIGHT", 511, "Main Warning Lights", "AC Generator Light")

--Fuel System
defineFloat("FUEL_QTY", 52, {0, 1}, "Engine Status Panel", "Fuel Qty Needle")

--Fuel Lights
defineIndicatorLight("FUEL_PODC", 505, "Center Pedestal Panel", "Center Drop Tank Empty Light")
defineIndicatorLight("FUEL_1GR", 502, "Main Warning Lights", "Fuel Tank Gr. 1 Empty Light")
defineIndicatorLight("FUEL_450", 503, "Main Warning Lights", "Fuel 450L Warning Light")
defineIndicatorLight("FUEL_3GR", 504, "Main Warning Lights", "Fuel Tank Gr. 3 Empty Light")
defineIndicatorLight("FUEL_PODW", 501, "Main Warning Lights", "Wing Drop Tanks Empty Light")
defineIndicatorLight("FUEL_RASHOD", 506, "Main Warning Lights", "No Fuel Warning Light")

--Engine Start Systems
defineIndicatorLight("ENG_START_LIGHT", 509, "Main Warning Lights", "Engine Start Light")
defineFloat("ENG_OXY_ST", 61, {0, 1}, "Left Vertical Aft Panel", "Engine Oxygen Status")

--Engine and Throttle
defineFloat("ENGINE_RPM", 670, {0, 1}, "Engine Status Panel", "Engine RPM 1 Needle")
defineFloat("ENGINE_RPM2", 50, {0, 1}, "Engine Status Panel", "Engine RPM 2 Needle")
defineFloat("ENGINE_TEMP", 51, {0, 1}, "Engine Status Panel", "EGT Needle")
defineIndicatorLight("FORSAZ_1", 507, "Main Warning Lights", "Afterburner Active Light")
defineIndicatorLight("FORSAZ_2", 508, "Main Warning Lights", "Emergency Afterburner Light")
defineIndicatorLight("NOZZLE_LIGHT", 512, "Main Warning Lights", "Nozzle Open Light")
defineIndicatorLight("KONUS_LIGHT", 517, "Engine Status Panel", "Nosecone Light")
defineIndicatorLight("OIL_LIGHT", 513, "Engine Status Panel", "Oil Pressure Light")
defineFloat("OIL_PRES", 627, {0, 1}, "Center Pedestal Panel", "Oil Pressure Gauge")
defineIndicatorLight("FIRE_LIGHT", 534, "Main Warning Lights", "Fire Warning Light")

--Hydraulics
defineFloat("HYDRO_P", 126, {0, 1}, "Engine Status Panel", "Primary Hydraulics Needle")
defineFloat("HYDRO_S", 125, {0, 1}, "Engine Status Panel", "Secondary Hydraulics Needle")
defineIndicatorLight("HYDR_LIGHT", 515, "Main Warning Lights", "Hydraulic Pressure Light")
defineIndicatorLight("BOOST_LIGHT", 514, "Main Warning Lights", "Booster Pressure Light")

--Warning Lights
defineIndicatorLight("CAN_WARN_LIGHT", 541, "Canopy Frame", "Canopy Warning Light")
defineIndicatorLight("MASTER_CAUTION", 542, "Flight Status/Navigation Panel", "Master Caution/SORC Light")
defineIndicatorLight("MARK_LIGHT", 516, "Engine Status Panel", "Marker Light")
defineIndicatorLight("STAB_LIGHT", 518, "Engine Status Panel", "Stabilizer Light")
defineIndicatorLight("CHK_GEAR_LIGHT", 520, "Landing Gear Control", "Check Gear Light")
defineIndicatorLight("FLAPS_LIGHT", 521, "Landing Gear Control", "Flaps Light")
defineIndicatorLight("AIRBRK_LIGHT", 522, "Landing Gear Control", "Airbrakes Light")
defineIndicatorLight("CENT_PYL_LIGHT", 523, "Center Pedestal Panel", "Central Pylon Light")
defineIndicatorLight("RATO_L_LIGHT", 524, "Center Pedestal Panel", "RATO Left Light")
defineIndicatorLight("RATO_R_LIGHT", 525, "Center Pedestal Panel", "RATO Right Light")
defineIndicatorLight("PYL1_LIGHT", 526, "Center Pedestal Panel", "Pylon 1 On Light")
defineIndicatorLight("PYL2_LIGHT", 527, "Center Pedestal Panel", "Pylon 2 On Light")
defineIndicatorLight("PYL3_LIGHT", 528, "Center Pedestal Panel", "Pylon 3 On Light")
defineIndicatorLight("PYL4_LIGHT", 529, "Center Pedestal Panel", "Pylon 4 On Light")
defineIndicatorLight("PYL1_OFF_LIGHT", 530, "Center Pedestal Panel", "Pylon 1 Off Light")
defineIndicatorLight("PYL2_OFF_LIGHT", 531, "Center Pedestal Panel", "Pylon 2 Off Light")
defineIndicatorLight("PYL3_OFF_LIGHT", 532, "Center Pedestal Panel", "Pylon 3 Off Light")
defineIndicatorLight("PYL4_OFF_LIGHT", 533, "Center Pedestal Panel", "Pylon 4 Off Light")

--Gyro Devices
defineIndicatorLight("GYRO_RST_LIGHT", 536, "Engine Status Panel", "Gyro Reset Light")

--ASP/RADAR/fire control systems
defineIndicatorLight("ASP_LOCK_LIGHT", 539, "ASP Gunsight", "ASP Lock Light")
defineIndicatorLight("ASP_LNCH", 538, "ASP Gunsight", "ASP Launch Light")
defineIndicatorLight("ASP_BRK", 540, "ASP Gunsight", "ASP Break Attack Light")
defineFloat("ASP_DIST", 551, {0, 1}, "ASP Gunsight", "ASP Target Distance Gauge")
defineFloat("ASP_MSL_DIST", 552, {0, 1}, "ASP Gunsight", "ASP Missile Target Distance Needle")
defineIndicatorLight("RADAR_ERR", 553, "RADAR Power", "Radar Error Light")
defineIndicatorLight("RADAR_LOW_LIGHT", 554, "RADAR Power", "Radar Low Light")
defineIndicatorLight("RADAR_FIX_BM_LIGHT", 555, "RADAR Power", "Radar Fixed Beam Light")
defineIndicatorLight("RADAR_LNCH", 558, "RADAR Scope, Interrupts", "Radar Launch Light")
defineIndicatorLight("MSL_HEAD_RDY", 559, "RADAR Scope, Interrupts", "Missile Head Ready Light")
defineIndicatorLight("RADAR_JMD", 560, "RADAR Scope, Interrupts", "Radar Jammed Light")
defineIndicatorLight("RADAR_BRKN", 558, "RADAR Scope, Interrupts", "Radar Broken Light")
defineIndicatorLight("RADAR_DENG", 562, "RADAR Scope, Interrupts", "Radar Disengage Light")
defineIndicatorLight("RADAR_19A_1", 571, "RADAR Scope, Interrupts", "Radar Continuous Interferes Light")
defineIndicatorLight("RADAR_19A_2", 572, "RADAR Scope, Interrupts", "Radar Temporary Interferes Light")
defineIndicatorLight("RADAR_19A_3", 573, "RADAR Scope, Interrupts", "Radar Passive Interferes Light")
defineIndicatorLight("RADAR_19A_4", 574, "RADAR Scope, Interrupts", "Radar Weather Interferes Light")
defineIndicatorLight("RADAR_19A_5", 575, "RADAR Scope, Interrupts", "Radar IFF Light")
defineIndicatorLight("RADAR_19A_6", 576, "RADAR Scope, Interrupts", "Radar Low Speed Light")
defineIndicatorLight("RADAR_19A_7", 577, "RADAR Scope, Interrupts", "Radar Self-Test Light")
defineIndicatorLight("RADAR_19A_8", 578, "RADAR Scope, Interrupts", "Radar Reset Light")
defineIndicatorLight("IAB_1", 581, "IAB Nuclear Control Panel", "Nuke Panel Loaded Light")
defineIndicatorLight("IAB_2", 582, "IAB Nuclear Control Panel", "Nuke Panel Armed Light")
defineIndicatorLight("IAB_3", 583, "IAB Nuclear Control Panel", "Nuke Panel Safe Light")
defineIndicatorLight("MIS_55_1", 584, "Accelerometer, AoA Gauge Panel", "Missile 55-1 Light")
defineIndicatorLight("MIS_55_2", 585, "Accelerometer, AoA Gauge Panel", "Missile 55-2 Light")
defineIndicatorLight("MIS_62", 586, "Accelerometer, AoA Gauge Panel", "Missile 62 Light")
defineIndicatorLight("TAC_DRP_ARM", 63, "Center Pedestal Panel", "Tactical Drop Armed")
defineIndicatorLight("SPS_RDY", 592, "SPS-141-100 Panel", "SPS 141-100 Ready")
defineIndicatorLight("SPS_ILL", 593, "SPS-141-100 Panel", "SPS 141-100 Illuminated")
defineIndicatorLight("SPS_LNCH", 594, "SPS-141-100 Panel", "SPS 141-100 Countermeasures Ready/Launching")
defineIndicatorLight("GUV_PWR_LGHT", 701, "UPK-23-250-2 Panel", "UPK-23-250-2 On Light")

--SAU
defineIndicatorLight("SAU_STAB_LGHT", 546, "SAU", "SAU Stabilization Light")
defineIndicatorLight("SAU_PRIV", 547, "SAU", "SAU Recover Mode Light") 
defineIndicatorLight("SAU_CMD_LND", 544, "SAU", "SAU Command Landing Light")
defineIndicatorLight("SAU_AUTO_LND", 545, "SAU", "SAU Auto Landing Light")

--ARU
defineFloat("ARU_ND", 64, {0, 1}, "ARU/Nosecone Panel", "ARU Needle")

--Nosecone
defineFloat("CONE_ND", 66, {0, 1}, "ARU/Nosecone Panel", "Nosecone Position Needle")

--Gun Arming
defineIndicatorLight("GUN_GOTOVN", 550, "Weapon Select Panel", "Gun Loaded Light")

--SPO Lights
defineIndicatorLight("SPO_LF", 601, "SPO RWR", "SPO RWR Left Front Light")
defineIndicatorLight("SPO_RF", 602, "SPO RWR", "SPO RWR Right Front Light")
defineIndicatorLight("SPO_RB", 603, "SPO RWR", "SPO RWR Right Rear Light")
defineIndicatorLight("SPO_LB", 604, "SPO RWR", "SPO RWR Left Rear Light")
defineIndicatorLight("SPO_MUTE", 605, "SPO RWR", "SPO RWR Mute Light")

--SOD
defineIndicatorLight("SOD_ANS", 606, "SPO RWR", "SOD Answer Light")

--SRZO (labelled as a second SOD category in mainpanel_init)
defineIndicatorLight("SRZO_PWR_LGHT", 607, "Avionics Power Panel", "SRZO Power Light")
defineIndicatorLight("SRZO_CODE", 608, "Avionics Power Panel", "SRZO Code Light")
defineIndicatorLight("SRZO_CIPH", 609, "Avionics Power Panel", "SRZO Cipher Light")
defineIndicatorLight("SRZO_ERR", 611, "SRZO/Fuse Panel", "SOD Error Light")

--Backlights Intensity (Under SRZO category in mainpanel_init)
defineIndicatorLight("ASP_LGHT_ON", 613, "Backlighting", "ASP Backlight On") --When sight is powered off, all ASP lighting shuts off; Unsure if this will be useful
defineFloat("ASP_LGHT_INT", 614, {0, 1}, "Backlighting", "ASP Scale Backlight Intensity")
--defineFloat("PHOS_INT", 618, {0, 1}, "Backlighting", "Phosphor Light") - No apparent effect; May indicate phosphor intensity on toggle switches in the future?
defineFloat("RED_PAN_INT", 152, {0, 1}, "Backlighting", "Red Panel Text Light Intensity")
defineFloat("RED_FLD_INT", 619, {0, 1}, "Backlighting", "Red Flood Light Intensity")
defineFloat("WHT_PAN_INT", 620, {0, 1}, "Backlighting", "White Panel Light Intensity")
defineFloat("INST_LGHT_INT", 621, {0, 1}, "Backlighting", "Instrument Backlight Intensity")
defineFloat("ASP_GLASS_INT", 622, {0, 1}, "Backlighting", "ASP Glass Light Intensity") --Value is tied to both fixed net and reticle; Both increase/decrease it, and value bottoms out at the value of the highest of the two

--Altimeter Triangles (under SRZO category)
defineFloat("H_TRI_KM", 652, {0, 1}, "Flight Status/Navigation Panel", "Altimeter KM Triangle Marker")
defineFloat("H_TRI_M", 658, {0, 1}, "Flight Status/Navigation Panel", "Altimeter M Triangle Marker")

--Cockpit Pressure Gauge
defineFloat("PIT_PRES_ALT", 655, {0, 1}, "Center Pedestal Panel", "Cockpit Pressure Altimeter")
defineFloat("H_TRI_M", 656, {0, 1}, "Center Pedestal Panel", "Cockpit Pressure Gauge")

defineIndicatorLight("WARN_L_CHECK_STAT", 407, "Main Warning Lights", "WARNING LIGHTS CHECK STATE")

--INSTRUMENTS NOT REPRESENTED:
--Baro Alt pressure value window (mechanical?)
--KPP Aux PRMG needles (Driven by NPP PRMG needle guidance values?)
--Airspeed > 1000 kph warn window (may be possible do drive mechanically based on the needle position)
--Clock needles
-- "ARC to landing NDB frequency self adjustment indication light" (User manual page 47, item 96)
--Wheelbrake lever
--Wheelbrake pressure gauge
--Radio channel display
--SRZO channel display
--PRMG/RSBN channel displays
--ARU manual arrow (mechanical?)

--Externals
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

defineIntegerFromGetter("EXT_STROBE", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Strobe Light")


BIOS.protocol.endModule()
