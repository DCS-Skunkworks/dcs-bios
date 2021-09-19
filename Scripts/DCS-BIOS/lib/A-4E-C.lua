BIOS.protocol.beginModule("A-4E-C", 0x8400)
BIOS.protocol.setExportModuleAircrafts({"A-4E-C"})
--v 2.1 by WarLord (aka BlackLibrary) (v1.0 by Dehuman)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineRotary = BIOS.util.defineRotary
local define3PosTumb = BIOS.util.define3PosTumb
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--Engine gauges
defineFloat("RPM", 520, {0,1}, "Engine Instruments", "Engine RPM")
defineFloat("RPM_DECI", 521, {0,1}, "Engine Instruments", "Engine RPM DECI")
defineFloat("EGT_C", 540, {0,1}, "Engine Instruments", "EGT")
defineFloat("D_FUEL_FLOW", 560, {0,1}, "Engine Instruments", "Fuel Flow")
defineFloat("OIL_PRESSURE", 152, {0,1}, "Engine Instruments", "Oil Pressure")
defineFloat("PRESSURE_RATIO", 151, {0,1}, "Engine Instruments", "Pressure Ratio")
defineFloat("D_FUEL", 580, {0,1}, "Engine Instruments", "Fuel Gauge")

--Hook, flaps, gear
defineFloat("D_FLAPS_IND", 23, {0,1}, "Mechanical Systems Indicators", "Flaps Indicator")
defineFloat("D_TAIL_HOOK", 10, {0,1}, "Mechanical Systems Indicators", "Hook Indicator")
defineFloat("GEAR_NOSE", 20, {0,1}, "Mechanical Systems Indicators", "Nose Gear Indicator")
defineFloat("GEAR_LEFT", 21, {0,1}, "Mechanical Systems Indicators", "Left Gear Indicator")
defineFloat("GEAR_RIGHT", 22, {0,1}, "Mechanical Systems Indicators", "Right Gear Indicator")

--Main Flight Instruments
defineFloat("ATTGYRO_STBY_HORIZ", 665, {-1,1}, "Main Flight Instruments", "SAI Horizon")
defineFloat("ATTGYRO_STBY_PITCH", 660, {-1,1}, "Main Flight Instruments", "SAI Pitch")
defineFloat("ATTGYRO_STBY_ROLL", 661, {-1,1}, "Main Flight Instruments", "SAI Roll")
defineFloat("ATTGYRO_STBY_OFF", 664, {0,1}, "Main Flight Instruments", "SAI Off")
defineFloat("D_IAS_DEG", 880, {0,1}, "Main Flight Instruments", "IAS")
defineFloat("D_IAS_MACH_DEG", 881, {0,1}, "Main Flight Instruments", "Mach Disc")
defineFloat("D_IAS_IDX", 882, {0,1}, "Main Flight Instruments", "IAS Index")
defineFloat("D_MACH_IDX", 883, {0,1}, "Main Flight Instruments", "Mach Index")
defineFloat("D_RADAR_ALT", 600, {0,1}, "Main Flight Instruments", "Radar Altimeter")
defineFloat("D_RADAR_IDX", 601, {0,1}, "Main Flight Instruments", "Radar ALtimeter Indexer")
defineFloat("D_RADAR_OFF", 604, {0,1}, "Main Flight Instruments", "Radar Altimeter Off flag")
defineFloat("D_ALT_NEEDLE", 820, {0,1}, "Main Flight Instruments", "Altimeter needle")
defineFloat("D_ALT_10K", 821, {0,1}, "Main Flight Instruments", "Altimeter 10k")
defineFloat("D_ALT_1K", 822, {0,1}, "Main Flight Instruments", "Altimeter 1k")
defineFloat("D_ALT_100S", 823, {0,1}, "Main Flight Instruments", "Altimeter 100s")
defineFloat("ALT_ADJ_NNxx", 824, {0,1}, "Main Flight Instruments", "Altimeter Adjustment NNxx")
defineFloat("ALT_ADJ_xxNx", 825, {0,1}, "Main Flight Instruments", "Altimeter Adjustment xxNx")
defineFloat("ALT_ADJ_xxxN", 826, {0,1}, "Main Flight Instruments", "Altimeter Adjustment xxxN")
defineFloat("CABIN_ALT", 710, {0,1}, "Main Flight Instruments", "Cabin Altitude")
defineFloat("LIQUID_O2", 760, {0,1}, "Main Flight Instruments", "Liquid Oxygen")
defineFloat("D_OXYGEN_OFF", 762, {0,1}, "Main Flight Instruments", "Oxygen off flag")
defineFloat("ACCEL_CUR", 360, {-1,1}, "Main Flight Instruments", "Accelerometer")
defineFloat("ACCEL_MAX", 137, {-1,1}, "Main Flight Instruments", "Accelerometer Max")
defineFloat("ACCEL_MIN", 138, {-1,1}, "Main Flight Instruments", "Accelerometer Min")
defineFloat("VVI", 800, {-1,1}, "Main Flight Instruments", "Variometer")
defineFloat("ADI_PITCH", 383, {-1,1}, "Main Flight Instruments", "ADI Pitch")
defineFloat("ADI_ROLL", 384, {-1,1}, "Main Flight Instruments", "ADI Roll")
defineFloat("ADI_HDG", 385, {-1,1}, "Main Flight Instruments", "ADI Heading")
defineFloat("ADI_OFF", 387, {0,1}, "Main Flight Instruments", "ADI Off")
defineFloat("ADI_SLIP", 388, {-1,1}, "Main Flight Instruments", "ADI Slip")
defineFloat("ADI_TURN", 389, {-1,1}, "Main Flight Instruments", "ADI Turn")
defineFloat("COMPASS_HDG", 148, {-1,1}, "Main Flight Instruments", "Backup Compass")
defineFloat("AngleOfAttack", 840, {0,1}, "Main Flight Instruments", "Angle Of Attack")

--Gunsight
defineFloat("D_GUNSIGHT_REFLECTOR", 894, {0,1}, "Gunsight", "Gunsight Reflector Elevation")

--Caution Light ladder
defineIndicatorLight("D_FUELBOOST_CAUTION", 860, "Warning Lamps", "Fuel Boost-Caution Ladder")
defineIndicatorLight("D_CONTHYD_CAUTION", 861, "Warning Lamps", "Control Hydraulics-Caution Ladder")
defineIndicatorLight("D_UTILHYD_CAUTION", 862, "Warning Lamps", "Utility Hydraulics-Caution Ladder")
defineIndicatorLight("D_FUELTRANS_CAUTION", 863, "Warning Lamps", "Fuel Transfer-Caution Ladder")
defineIndicatorLight("D_SPDBRK_CAUTION", 864, "Warning Lamps", "Speed Break-Caution Ladder")
defineIndicatorLight("D_SPOILER_CAUTION", 865, "Warning Lamps", "Spoiler-Caution Ladder")

--BDHI
defineFloat("BDHI_HDG", 780, {0,1}, "BDHI", "BDHI Heading")
defineFloat("BDHI_NEEDLE1", 781, {0,1}, "BDHI", "BDHI Needle 1")
defineFloat("BDHI_NEEDLE2", 782, {0,1}, "BDHI", "BDHI Needle 2")
defineFloat("BDHI_DME_FLAG", 786, {0,1}, "BDHI", "BDHI Flag")	
defineFloat("BDHI_DME_Xxx", 785, {0,1}, "BDHI", "BDHI Xnn")
defineFloat("BDHI_DME_xXx", 784, {0,1}, "BDHI", "BDHI nXn")
defineFloat("BDHI_DME_xxX", 783, {0,1}, "BDHI", "BDHI nnX")
defineFloat("BDHI_ILS_GS", 381, {-1,1}, "BDHI", "BDHI ILS GS")
defineFloat("BDHI_ILS_LOC", 382, {-1,1}, "BDHI", "BDHI ILS LOC")

--WARN LAMPS
defineIndicatorLight("D_RADAR_WARN", 605, "Warning Lamps", "Radar altitude warning")
defineIndicatorLight("D_OIL_LOW", 150, "Warning Lamps", "Oil Low Light")
defineIndicatorLight("D_GLARE_WHEELS", 154, "Warning Lamps", "Glareshield Wheels")
defineIndicatorLight("D_GLARE_LABS", 155, "Warning Lamps", "Glareshield LABS")
defineIndicatorLight("D_RADAR_WARN", 156, "Warning Lamps", "Glareshield LAWS")
defineIndicatorLight("D_GLARE_OBST", 157, "Warning Lamps", "Glareshield OBST")
defineIndicatorLight("D_GLARE_IFF", 158, "Warning Lamps", "Glareshield IFF")
defineIndicatorLight("D_GLARE_FIRE", 159, "Warning Lamps", "Glareshield Fire")
defineIndicatorLight("D_OXYGEN_LOW", 761, "Warning Lamps", "Oxygen low")

--LAMPS
defineIndicatorLight("GEAR_LIGHT", 27, "Mechanical Systems", "Landing Gear Light")
defineIndicatorLight("AOA_GREEN", 850, "AOA Indicator", "AOA indexer Green")
defineIndicatorLight("AOA_YELLOW", 851, "AOA Indicator", "AoA indexer Yellow")
defineIndicatorLight("AOA_RED", 852, "AOA Indicator", "AoA indexer Red")
defineIndicatorLight("AWRS_POWER", 741, "ArmamentPanel", "AWRS Power Indicator Light")
defineIndicatorLight("APC_LIGHT", 147, "ApproachPowerCompensator", "APC Indicator Light")
defineIndicatorLight("D_ADVISORY_INRANGE", 866, "Advisory Lights", "In Range Advisory")
defineIndicatorLight("D_ADVISORY_SETRANGE", 867, "Advisory Lights", "Set Range Advisory")
defineIndicatorLight("D_ADVISORY_DIVE", 868, "Advisory Lights", "Dive Advisory")

--Radar Scope 
defineFloat("APG53A-LEFTRANGE", 406, {0,1}, "RadarControlPanel", "Radar Profile Range")
defineFloat("APG53A-BOTTOMRANGE", 407, {0,1}, "RadarControlPanel", "Radar Plan Range")
defineFloat("AFCS_HDG_100s", 167, {0,1}, "AFCS", "AFCS Heading 100's")
defineFloat("AFCS_HDG_10s", 168, {0,1}, "AFCS", "AFCS Heading 10's")
defineFloat("AFCS_HDG_1s", 169, {0,1}, "AFCS", "AFCS Heading 1's")

-- APN-153 Doppler Radar
defineIndicatorLight("APN153-MEMORYLIGHT", 171, "DopplerNav", "Memory Light")
defineFloat("APN153-DRIFT-GAUGE", 172, {-1,1}, "DopplerNav", "Drift Gauge")
defineFloat("APN153-SPEED-Xnn", 173, {0,1}, "DopplerNav", "Speed Xnn")
defineFloat("APN153-SPEED-nXn", 174, {0,1}, "DopplerNav", "Speed nXn")
defineFloat("APN153-SPEED-nnX", 175, {0,1}, "DopplerNav", "Speed nnX")
defineFloat("NAV_CURPOS_LAT_Xnnnn", 178, {0,1}, "DopplerNav Position", "Current Latitude Xnnnn")
defineFloat("NAV_CURPOS_LAT_nXnnn", 179, {0,1}, "DopplerNav Position", "Current Latitude nXnnn")
defineFloat("NAV_CURPOS_LAT_nnXnn", 180, {0,1}, "DopplerNav Position", "Current Latitude nnXnn")
defineFloat("NAV_CURPOS_LAT_nnnXn", 181, {0,1}, "DopplerNav Position", "Current Latitude nnnXn")
defineFloat("NAV_CURPOS_LAT_nnnnX", 182, {0,1}, "DopplerNav Position", "Current Latitude nnnnX")
defineFloat("NAV_CURPOS_LON_Xnnnnn", 184, {0,1}, "DopplerNav Position", "Current Longitude Xnnnnn")
defineFloat("NAV_CURPOS_LON_nXnnnn", 185, {0,1}, "DopplerNav Position", "Current Longitude nXnnnn")
defineFloat("NAV_CURPOS_LON_nnXnnn", 186, {0,1}, "DopplerNav Position", "Current Longitude nnXnnn")
defineFloat("NAV_CURPOS_LON_nnnXnn", 187, {0,1}, "DopplerNav Position", "Current Longitude nnnXnn")
defineFloat("NAV_CURPOS_LON_nnnnXn", 188, {0,1}, "DopplerNav Position", "Current Longitude nnnnXn")
defineFloat("NAV_CURPOS_LON_nnnnnX", 189, {0,1}, "DopplerNav Position", "Current Longitude nnnnnX")

defineFloat("NAV_DEST_LAT_Xnnnn", 191, {0,1}, "DopplerNav Destination", "Destination Latitude Xnnnn")
defineFloat("NAV_DEST_LAT_nXnnn", 192, {0,1}, "DopplerNav Destination", "Destination Latitude nXnnn")
defineFloat("NAV_DEST_LAT_nnXnn", 193, {0,1}, "DopplerNav Destination", "Destination Latitude nnXnn")
defineFloat("NAV_DEST_LAT_nnnXn", 194, {0,1}, "DopplerNav Destination", "Destination Latitude nnnXn")
defineFloat("NAV_DEST_LAT_nnnnX", 195, {0,1}, "DopplerNav Destination", "Destination Latitude nnnnX")
defineFloat("NAV_DEST_LON_Xnnnnn", 197, {0,1}, "DopplerNav Destination", "Destination Longitude Xnnnnn")
defineFloat("NAV_DEST_LON_nXnnnn", 198, {0,1}, "DopplerNav Destination", "Destination Longitude nXnnnn")
defineFloat("NAV_DEST_LON_nnXnnn", 199, {0,1}, "DopplerNav Destination", "Destination Longitude nnXnnn")
defineFloat("NAV_DEST_LON_nnnXnn", 200, {0,1}, "DopplerNav Destination", "Destination Longitude nnnXnn")
defineFloat("NAV_DEST_LON_nnnnXn", 201, {0,1}, "DopplerNav Destination", "Destination Longitude nnnnXn")
defineFloat("NAV_DEST_LON_nnnnnX", 202, {0,1}, "DopplerNav Destination", "Destination Longitude nnnnnX")

defineFloat("ASN41-WINDSPEED-Xxx", 210, {0,1}, "DopplerNav", "Windspeed Xnn")
defineFloat("ASN41-WINDSPEED-xXx", 211, {0,1}, "DopplerNav", "Windspeed nXn")
defineFloat("ASN41-WINDSPEED-xxX", 212, {0,1}, "DopplerNav", "Windspeed nnX")
defineFloat("ASN41-WINDDIR-Xxx", 214, {0,1}, "DopplerNav", "Wind Direction Xnn")
defineFloat("ASN41-WINDDIR-xXx", 215, {0,1}, "DopplerNav", "Wind Direction nXn")
defineFloat("ASN41-WINDDIR-xxX", 216, {0,1}, "DopplerNav", "Wind Direction nnX")
defineFloat("ASN41-MAGVAR-Xxxxx", 204, {0,1}, "DopplerNav", "MagVar Xnnnn")
defineFloat("ASN41-MAGVAR-xXxxx", 205, {0,1}, "DopplerNav", "MagVar nXnnn")
defineFloat("ASN41-MAGVAR-xxXxx", 206, {0,1}, "DopplerNav", "MagVar nnXnn")
defineFloat("ASN41-MAGVAR-xxxXx", 207, {0,1}, "DopplerNav", "MagVar nnnXn")
defineFloat("ASN41-MAGVAR-xxxxX", 208, {0,1}, "DopplerNav", "MagVar nnnnX")

-- COUNTERMEASURES
defineFloat("CM_BANK1_Xx", 526, {0,1}, "Countermeasures", "CM Bank 1 10's")
defineFloat("CM_BANK1_xX", 527, {0,1}, "Countermeasures", "CM Bank 1 1's")
defineFloat("CM_BANK2_Xx", 528, {0,1}, "Countermeasures", "CM Bank 2 10's")
defineFloat("CM_BANK2_xX", 529, {0,1}, "Countermeasures", "CM Bank 2 1's")

-- AN/ARC-51 UHF Radio
defineFloat("ARC51-FREQ-XXxxx", 362, {0,1}, "UHF Radio", "Frequency XXnnn")
defineFloat("ARC51-FREQ-xxXxx", 363, {0,1}, "UHF Radio", "Frequency nnXnn")
defineFloat("ARC51-FREQ-xxxXX", 364, {0,0.95}, "UHF Radio", "Frequency nnnXX")
defineFloat("ARC51-FREQ-PRESET", 371, {0,0.95}, "UHF Radio", "Frequency Preset")

--Cockpit Lights
defineFloat("LIGHTS-FLOOD-WHITE", 111, {0,0.75}, "Lights", "White flood Lights")
defineFloat("LIGHTS-FLOOD-RED", 114, {0,1}, "Lights", "Red flood Lights")
defineFloat("LIGHTS-INSTRUMENTS", 117, {0,1}, "Lights", "Instrument Lights")
defineFloat("LIGHTS-CONSOLE", 119, {0,1}, "Lights", "Console Lights")
defineFloat("APG53A-GLOW", 115, {0,1}, "Lights", "Radar Glow Light")

--Clock
defineFloat("CURRTIME_HOURS", 440, {0,1}, "Clock", "Current Hours")
defineFloat("CURRTIME_MINS", 441, {0,1}, "Clock", "Current Minutes")
defineFloat("CURRTIME_SECS", 442, {0,1}, "Clock", "Current Seconds")
defineFloat("STOPWATCH_MINS", 144, {0,1}, "Clock", "Stopwatch Minutes")
defineFloat("STOPWATCH_SECS", 145, {0,1}, "Clock", "Stopwatch Seconds")

--ECM Panel
defineIndicatorLight("RWR_LIGHT", 373, "ECM Panel", "Glareshield RWR Light")
defineIndicatorLight("ECM_TEST_LIGHT", 514, "ECM Panel", "ECM Test Light")
defineIndicatorLight("ECM_GO_LIGHT", 515, "ECM Panel", "ECM GO Light")
defineIndicatorLight("ECM_NOGO_LIGHT", 516, "ECM Panel", "ECM NO GO Light")
defineIndicatorLight("ECM_SAM_LIGHT", 517, "ECM Panel", "ECM SAM Light")
defineIndicatorLight("ECM_RPT_LIGHT", 518, "ECM Panel", "ECM RPT Light")
defineIndicatorLight("ECM_STBY_LIGHT", 519, "ECM Panel", "ECM STBY Light")
defineIndicatorLight("ECM_REC_LIGHT", 500, "ECM Panel", "ECM REC Light")

defineFloat("CANOPY_VALUE", 26, {0.0, 1.0}, "Cockpit Mechanics", "Canopy Position")

------CONTROLS---------
-- RADAR CONTROL PANEL
defineMultipositionSwitch("RADAR_MODE", 9, 3063, 120, 5, 0.10, "RadarControlPanel", "Radar Mode")
defineToggleSwitch("RADAR_AOACOMP", 9, 3064, 121, "RadarControlPanel", "Radar AoA Compensation")
definePotentiometer("RADAR_ANGLE", 9, 3065, 122, {0,1}, "RadarControlPanel", "Radar Antenna Tilt")
definePotentiometer("RADAR_VOL", 9, 3068, 123, {-1,1}, "RadarControlPanel", "Radar Obstacle Tone Volume")

-- RADAR SCOPE
definePotentiometer("RADAR_STORAGE", 9, 3057, 400, {-1,1}, "RadarScope", "Radar Storage")
definePotentiometer("RADAR_BRILLIANCE", 9, 3058, 401, {-1,1}, "RadarScope", "Radar Brilliance")
definePotentiometer("RADAR_DETAIL", 9, 3059, 402, {-1,1}, "RadarScope", "Radar Detail")
definePotentiometer("RADAR_GAIN", 9, 3060, 403, {-1,1}, "RadarScope", "Radar Gain")
definePotentiometer("RADAR_RETICLE", 9, 3062, 404, {-1,1}, "RadarScope", "Radar Reticle")
defineToggleSwitch("RADAR_FILTER", 9, 3061, 405, "RadarScope", "Radar Filter Plate")

--Gunpods
defineMultipositionSwitch("GUNPOD_CLEAR", 5, 3012, 390, 3, 1, "Gunpods", "Charge/Off/Clear")
defineToggleSwitch("GUNPOD_L", 5, 3009, 391, "Gunpods", "Left Enable")
defineToggleSwitch("GUNPOD_C", 5, 3010, 392, "Gunpods", "Center Enable")
defineToggleSwitch("GUNPOD_R", 5, 3012, 393, "Gunpods", "Right Enable")

--Countermeasures
defineMultipositionSwitch("CM_BANK", 33, 3106, 522, 3, 1, "Countermeasures", "CM Bank Select")
definePushButton("CM_AUTO", 33, 3107, 523, "Countermeasures", "CM Auto Pushbutton")
defineRotary("CM_ADJ1", 33, 3108, 524, "Countermeasures", "CM Bank 1 Adjust")
defineRotary("CM_ADJ2", 33, 3109, 525, "Countermeasures", "CM Bank 2 Adjust")
defineToggleSwitch("CM_PWR", 33, 3110, 530, "Countermeasures", "CM Power Toggle")

--Armament Panel
defineMultipositionSwitch("ARM_EMERG_SEL", 5, 3025, 700, 7, 0.1, "ArmamentPanel", "Emergency Release Selector")
defineToggleSwitch("ARM_GUN", 5, 3001, 701, "ArmamentPanel", "Guns Switch")
defineTumb("ARM_BOMB", 5, 3026, 702, 1, {-1,1}, nil, false, "ArmamentPanel", "Bomb arm switch")
defineToggleSwitch("ARM_STATION1", 5, 3003, 703, "ArmamentPanel", "Station 1 select")
defineToggleSwitch("ARM_STATION2", 5, 3004, 704, "ArmamentPanel", "Station 2 select")
defineToggleSwitch("ARM_STATION3", 5, 3005, 705, "ArmamentPanel", "Station 3 select")
defineToggleSwitch("ARM_STATION4", 5, 3006, 706, "ArmamentPanel", "Station 4 select")
defineToggleSwitch("ARM_STATION5", 5, 3007, 707, "ArmamentPanel", "Station 5 select")
defineMultipositionSwitch("ARM_FUNC_SEL", 5, 3008, 708, 7, 0.1, "ArmamentPanel", "Function Selector")
defineMultipositionSwitch("AWRS_QUANT", 5, 3031, 740, 12, 0.05, "ArmamentPanel", "AWRS Quantity Selector")
definePotentiometer("AWRS_DROP_INT", 5, 3032, 742, {0,0.9}, "ArmamentPanel", "AWRS Drop Interval")
defineToggleSwitch("AWRS_MULTI", 5, 3033, 743, "ArmamentPanel", "AWRS Multiplier")
defineMultipositionSwitch("AWRS_MODE", 5, 3034, 744, 6, 0.1, "ArmamentPanel", "AWRS mode")
defineToggleSwitch("ARM_MASTER", 2, 3002, 709, "ArmamentPanel", "Master Armament")
defineToggleSwitch("RADAR_PROFILE", 9, 3055, 721, "RadarScope", "Radar Plan/Profile")
defineToggleSwitch("RADAR_RANGE", 9, 3056, 722, "RadarScope", "Radar Long/Short Range")
defineMultipositionSwitch("BDHI_MODE", 22, 3044, 724, 3, 1.0, "BDHI", "BDHI mode")
defineMultipositionSwitch("SHRIKE_SEL_KNB", 5, 3137, 725, 5, 0.1, "ArmamentPanel", "Shrike Selector Knob")
definePotentiometer("MISSILE_VOL", 5, 3125, 726, {-1,1}, "ArmamentPanel", "Missile Volume Knob")

--AFCS Panel
defineToggleSwitch("AFCS_STBY", 27, 3088, 160, "AFCS", "AFCS Standby")
defineToggleSwitch("AFCS_ENGAGE", 27, 3089, 161, "AFCS", "AFCS Engage")
defineToggleSwitch("AFCS_HDG_SEL", 27, 3090, 162, "AFCS", "AFCS Preselect Heading")
defineToggleSwitch("AFCS_ALT", 27, 3091, 163, "AFCS", "AFCS Altitude Hold")
definePotentiometer("AFCS_HDG_SET", 27, 3092, 164, {0,1}, "AFCS", "AFCS Heading Selector")
defineToggleSwitch("AFCS_STAB_AUG", 27, 3093, 165, "AFCS", "AFCS Stability Aug")
defineToggleSwitch("AFCS_AIL_TRIM", 27, 3094, 166, "AFCS", "AFCS Aileron Trim")

--Approach Power Compensator
defineMultipositionSwitch("APC_ENABLE", 27, 3095, 135, 3, 1.0, "ApproachPowerCompensator", "APC Enable/Stby/Off")
defineMultipositionSwitch("APS_COLD_STD_HOT", 27, 3096, 136, 3, 1.0, "ApproachPowerCompensator", "APC Cold/Std/Hot")

--Mechanical Systems
defineToggleSwitch("GEAR_HANDLE", 14, 3020, 8, "Mechanical Systems", "Landing Gear Handle")
defineToggleSwitch("HOOK_HANDLE", 14, 3021, 10, "Gear", "Landing Hook Handle")
defineToggleSwitch("SPOILER_ARM", 15, 3017, 84, "Mechanical Systems", "Spoiler Arm Switch")
defineToggleSwitch("SPEEDBRAKE", 12, 3024, 85, "Mechanical Systems", "Speedbrake Switch")
defineTumb("SPEEDBRAKE_EMERG", 12, 3035, 128, 1, {-1,1}, nil, false, "Mechanical Systems", "Speedbrake Emergency")
defineToggleSwitch("Canopy", 16, 71, 0, "Mechanical Systems", "Canopy")
defineTumb("FLAPS", 13, 3015, 132, 1, {-1,1}, nil, false, "Mechanical Systems", "Flaps Lever")
definePotentiometer("RUDDER_TRIM", 26, 3085, 82, {-1,1}, "Mechanical Systems", "Rudder Trim")
defineTumb("THROTTLE_CLICK", 19, 3087, 0, 1, {-1,1}, nil, true, "Mechanical Systems", "Throttle Cutoff/Start/Idle")
definePushButton("STARTER_BTN", 19, 3013, 100, "Mechanical Systems", "Starter Button")
defineToggleSwitch("JATO_ARM", 1, 3158, 133, "Mechanical Systems", "JATO ARM-OFF Switch")
defineToggleSwitch("JATO_JETT_SAFE", 1, 3159, 134, "Mechanical Systems", "JATO JETTISON-SAFE Switch")
defineToggleSwitch("HIDE_STICK_SW", 16, 10141, 153, "Mechanical Systems", "Hide Stick Toggle")

--Fuel Systems
defineTumb("DROP_PRESS_REFUEL", 19, 3144, 101, 1, {-1,1}, nil, false, "Fuel Systems", "Drop Tanks Pressurization and Flight Refuel Switch")
defineTumb("EMERG_TRANS_FUEL_DUMP", 19, 3143, 103, 1, {-1,1}, nil, false, "Fuel Systems", "Emergency Transfer and Wing Fuel Dump Switch")
defineToggleSwitch("FUEL_CONTROL", 19, 3145, 104, "Fuel Systems", "Fuel Control Switch")
defineToggleSwitch("MAN_FUEL_OFF_LV", 19, 3146, 130, "Fuel Systems", "Manual Fuel Shutoff Lever")
defineToggleSwitch("MAN_FUEL_OFF_CATCH", 19, 3147, 131, "Fuel Systems", "Manual Fuel Shutoff Catch")

-- OXYGEN and ANTI-G PANEL
defineToggleSwitch("OXY_SW", 1, 3138, 125, "Avionics", "Oxygen Switch")

--Avionics
definePushButton("ACCEL_RESET", 1, 3111, 139, "Avionics", "Reset Accelerometer")
definePushButton("STOPWATCH", 7, 3105, 146, "Clock", "Stopwatch Start/Stop")
definePushButton("RADAR_ALT_SW", 18, 3038, 603, "Avionics", "Radar Altimeter Warning Button")
defineRotary("RADAR_ALT_INDEX", 18, 3037, 602, "Avionics", "Radar Altimeter Warning Knob")
definePushButton("STBY_ATT_INDEX_BTN", 1, 3042, 663, "Avionics", "Standby Attitude Horizon Button")
defineRotary("STBY_ATT_INDEX_KNB", 1, 3043, 662, "Avionics", "Standby Attitude Horizon Knob")
definePushButton("FUEL_EXT_BTN", 1, 3018, 720, "Avionics", "Show EXT Fuel")
definePushButton("MASTER_TEST", 1, 3039, 723, "Avionics", "Master Test")
defineRotary("ALT_PRESS_KNB", 1, 3019, 827, "Avionics", "Altimeter Setting")
definePushButton("IAS_INDEX_BTN", 1, 3040, 885, "Avionics", "IAS Index Button")
definePotentiometer("IAS_INDEX_KNB", 1, 3041, 884, {0,1}, "Avionics", "IAS Index Knob")
definePotentiometer("AOA_INDEX_DIM", 1, 3164, 853, {-1,1}, "Avionics", "AOA Indexer Dimming Wheel")

--Gunsight
defineRotary("GUNSIGHT_BRIGHT", 21, 3030, 895, "Gunsight", "Gunsight Light Control")
defineToggleSwitch("GUNSIGHT_DAY_NIGHT", 21, 3029, 891, "Gunsight", "Gunsight Day/Night Switch")
definePotentiometer("GUNSIGHT_KNB", 21, 3028, 892, {0,1}, "Gunsight", "Gunsight Elevation Control")

--TACAN
defineMultipositionSwitch("TACAN_MODE", 22, 3069, 900, 4, 0.1, "TACAN", "TACAN Mode")
defineMultipositionSwitch("TACAN_CHAN_MAJ", 22, 3070, 901, 13, 0.05, "TACAN", "TACAN Channel Major")
defineMultipositionSwitch("TACAN_CHAN_MIN", 22, 3071, 902, 10, 0.1, "TACAN", "TACAN Channel Minor")
definePotentiometer("TACAN_VOL", 22, 3072, 903, {-1,1}, "TACAN", "TACAN Volume")

--Doppler Navigation Computer
defineMultipositionSwitch("DOPPLER_SEL", 22, 3045, 170, 5, 0.1, "DopplerNav", "APN-153 Doppler Radar Mode")
definePushButton("DOPPLER_MEM_TEST", 22, 3046, 247, "DopplerNav", "APN-153 Memory Light Test")
defineMultipositionSwitch("NAV_SEL", 22, 3047, 176, 5, 0.1, "DopplerNav", "ASN-41 Function Selector Switch")
defineRotary("PPOS_LAT_KNB", 22, 3051, 177, "DopplerNav", "ASN-41 Present Position - Latitude Knob")
definePushButton("PPOS_LAT_BTN", 22, 3150, 236, "DopplerNav", "ASN-41 Present Position - Latitude Button")
defineRotary("PPOS_LON_KNB", 22, 3052, 183, "DopplerNav", "ASN-41 Present Position - Longitude Knob")
definePushButton("PPOS_LON_BTN", 22, 3151, 237, "DopplerNav", "ASN-41 Present Position - Longitude Button")
defineRotary("DEST_LAT_KNB", 22, 3053, 190, "DopplerNav", "ASN-41 Destination - Latitude Knob")
definePushButton("DEST_LAT_BTN", 22, 3152, 238, "DopplerNav", "ASN-41 Destination - Latitude Button")
defineRotary("DEST_LON_KNB", 22, 3054, 196, "DopplerNav", "ASN-41 Destination - Longitude Knob")
definePushButton("DEST_LON_BTN", 22, 3153, 239, "DopplerNav", "ASN-41 Destination - Longitude Button")
defineRotary("ASN41_MAGVAR_KNB", 22, 3048, 203, "DopplerNav", "ASN-41 Magnetic Variation Knob")
definePushButton("ASN41_MAGVAR_BTN", 22, 3154, 240, "DopplerNav", "ASN-41 Magnetic Variation Button")
defineRotary("ASN41_WINDSPEED_KNB", 22, 3049, 209, "DopplerNav", "ASN-41 Wind Speed Knob")
definePushButton("ASN41_WINDSPEED_BTN", 22, 3155, 241, "DopplerNav", "ASN-41 Wind Speed Button")
defineRotary("ASN41_WINDDIR_KNB", 22, 3050, 213, "DopplerNav", "ASN-41 Wind Direction Knob")
definePushButton("ASN41_WINDDIR_BTN", 22, 3156, 242, "DopplerNav", "ASN-41 Wind Bearing Button")

--Lights
defineMultipositionSwitch("LIGHT_EXT_MASTER", 25, 3073, 83, 3, 1, "Lights", "Master Lighting ON/OFF/Momentary")
defineMultipositionSwitch("LIGHT_EXT_PROBE", 25, 3074, 217, 3, 1, "Lights", "Probe Light")
defineToggleSwitch("LIGHT_EXT_TAXI", 25, 3075, 218, "Lights", "Taxi Light")
defineToggleSwitch("LIGHT_EXT_ANTICOLL", 25, 3076, 219, "Lights", "Anti-Collision Lights")
defineMultipositionSwitch("LIGHT_EXT_FUSELAGE", 25, 3077, 220, 3, 1, "Lights", "Fuselage Lights")
defineToggleSwitch("LIGHT_EXT_FLASH_MODE", 25, 3078, 221, "Lights", "Lighting Flash/Steady Mode")
defineMultipositionSwitch("LIGHT_EXT_NAV", 25, 3079, 222, 3, 1, "Lights", "Navigation Lights")
defineMultipositionSwitch("LIGHT_EXT_TAIL", 25, 3080, 223, 3, 1, "Lights", "Tail Light")
definePotentiometer("LIGHT_INT_INSTR", 1, 3082, 106, {0,1}, "Lights", "Instrument Lighting")
definePotentiometer("LIGHT_INT_CONSOLE", 1, 3083, 107, {0,1}, "Lights", "Console Lighting")
defineMultipositionSwitch("LIGHT_INT_BRIGHT", 25, 3084, 108, 3, 1, "Lights", "Console Light Intensity")
definePotentiometer("LIGHT_INT_FLOOD_WHT", 1, 3081, 110, {0,1}, "Lights", "White FloodLight Control")

--UHF Radio
defineMultipositionSwitch("ARC51_FREQ_PRE", 28, 3101, 361, 20, 0.05, "UHF Radio", "ARC-51 UHF Preset Channel")
definePotentiometer("ARC51_VOL", 28, 3099, 365, {0,1}, "UHF Radio", "ARC-51 UHF Volume")
defineMultipositionSwitch("ARC51_XMIT_MODE", 28, 3098, 366, 3, 1, "UHF Radio", "ARC-51 UHF Frequency Mode")
defineMultipositionSwitch("ARC51_FREQ_10MHZ", 28, 3102, 367, 18, 0.05, "UHF Radio", "ARC-51 UHF Manual Frequency 10 MHz")
defineMultipositionSwitch("ARC51_FREQ_1MHZ", 28, 3103, 368, 10, 0.1, "UHF Radio", "ARC-51 UHF Manual Frequency 1 MHz")
defineMultipositionSwitch("ARC51_FREQ_50KHZ", 28, 3104, 369, 20, 0.05, "UHF Radio", "ARC-51 UHF Manual Frequency 50 kHz")
defineToggleSwitch("ARC51_SQUELCH", 28, 3100, 370, "UHF Radio", "ARC-51 UHF Squelch Disable")
defineMultipositionSwitch("ARC51_MODE", 28, 3097, 372, 4, 0.1, "UHF Radio", "ARC-51 UHF Mode")

--T Handles
defineToggleSwitch("EMERG_GEAR_REL", 14, 3036, 1240, "T Handles", "Emergency Gear Release")
defineToggleSwitch("EMERG_BOMB_REL", 5, 3027, 1241, "T Handles", "Emergency Bomb Release")
defineToggleSwitch("EMERG_GEN_DEPLOY", 2, 3023, 1243, "T Handles", "Emergency Generator Deploy")
defineToggleSwitch("EMERG_GEN_BYPASS", 2, 3022, 252, "T Handles", "Emergency Generator Bypass/Normal")
defineToggleSwitch("MAN_FLIGHT_CONTROL", 6, 3136, 1242, "T Handles", "Manual Flight Control Override")

--COMPASS CONTROLLER
--defineRotary("COMP_LAT_KNB", XX, 3142, 509, "Compass", "Compass Latitude Knob")
--defineTumb("COMP_SET_HDG", XX, 3139, 511, 1, {-1,1}, nil, false, "Compass", "Compass Heading Set Knob")
--defineToggleSwitch("COMP_FREE_SLAVE_SW", XX, 3141, 512, "Compass", "Compass Free/Slaved Mode Switch")
--definePushButton("COMP_SYNC", XX, 3140, 513, "Compass", "Compass Push to Sync")

--ECM Panel
defineToggleSwitch("ECM_AUDIO", 31, 3114, 503, "ECM Panel", "Audio APR/25 - APR/27")
defineToggleSwitch("ECM_APR25_PW", 31, 3113, 504, "ECM Panel", "APR/25 On/Off")
defineToggleSwitch("ECM_APR27_PW", 31, 3115, 501, "ECM Panel", "APR/27 On/Off")
definePushButton("ECM_APR27_TEST", 31, 3116, 507, "ECM Panel", "APR/27 Test")
definePushButton("ECM_APR27_LIGHT", 31, 3117, 510, "ECM Panel", "APR/27 Light")
definePotentiometer("ECM_PRF_VOL", 31, 3118, 506, {-0.8,0.8}, "ECM Panel", "PRF Volume (Inner Knob)")
definePotentiometer("ECM_MSL_VOL", 31, 3119, 505, {-0.8,0.8}, "ECM Panel", "MSL Volume (Outer Knob)")
defineMultipositionSwitch("ECM_SEL", 31, 3120, 502, 4, 0.33, "ECM Panel", "ECM Selector Knob")

--AIR CONDITIONING PANEL
defineToggleSwitch("CABIN_PRESS", 2, 3133, 224, "Air Condition", "Cabin Pressure Switch")
defineTumb("WINDSHLD_DEFROST", 2, 3134, 225, 1, {-1,1}, nil, false, "Air Condition", "Windshield Defrost")
definePotentiometer("CABIN_TEMP", 2, 3135, 226, {0,1}, "Air Condition", "Cabin Temp Knob")

--EJECTION SEAT
defineToggleSwitch("HARNESS_REEL_CONTR", 1, 3148, 24, "Ejection Seat", "Shoulder Harness Inertia Reel Control")
defineToggleSwitch("SEC_EJECT_HANDLE", 1, 3149, 25, "Ejection Seat", "Secondary Ejection Handle")

define3PosTumb("ASN41_LAT_SLEW", 22, 3165, 248, "DopplerNav", "ASN-41 Destination - Latitude Slew")
define3PosTumb("ASN41_LON_SLEW", 22, 3166, 249, "DopplerNav", "ASN-41 Destination - Longitude Slew")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKES", function()
	return math.floor(LoGetAircraftDrawArgumentValue(500)*65535)
end, 65535, "External Aircraft Model", "Speed Brakes")
defineIntegerFromGetter("EXT_HOOK", function()
	return math.floor(LoGetAircraftDrawArgumentValue(25)*65535)
end, 65535, "External Aircraft Model", "Hook")
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_STROBE_TOP", function()
	if LoGetAircraftDrawArgumentValue(198) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Strobe Light (red)")
defineIntegerFromGetter("EXT_STROBE_BOTTOM", function()
	if LoGetAircraftDrawArgumentValue(199) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Strobe Light (red)")
defineIntegerFromGetter("EXT_TAXI_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(208) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Taxi Light (white)")
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineFloat("AFCS_ROLL", 260, {-1,1}, "AFCS", "AFCS Roll Gauge")
defineFloat("AFCS_YAW", 261, {-1,1}, "AFCS", "AFCS Yaw Gauge")
defineFloat("AFCS_PITCH", 262, {-1,1}, "AFCS", "AFCS Pitch Gauge")
defineToggleSwitch("AFCS_1N2_COVER", 28, 3169, 258, "AFCS", "AFCS 1-N-2 Guard")
define3PosTumb("AFCS_1N2", 28, 3170, 259, "AFCS", "AFCS 1-N-2 Guard")
defineMultipositionSwitch("MCL_CHAN_SEL", 38, 3167, 250, 20, 0.05, "MCL", "MCL Channel Selector")
define3PosTumb("MCL_PWR", 38, 3168, 253, "MCL", "MCL Power")
define3PosTumb("SEAT_ADJ", 3, 3174, 251, "Cockpit Mechanics", "Seat Adjustment")
define3PosTumb("TACAN_ANT_CONT", 22, 3171, 254, "TACAN", "TACAN Antenna Control")
defineToggleSwitch("NAV_DEAD", 22, 3173, 255, "DopplerNav", "Navigation Dead Reckoning/Doppler")
defineToggleSwitch("FUEL_TRANS", 21, 3175, 256, "Fuel Systems", "Fuel Transfer Bypass/Normal")
defineToggleSwitch("RAIN_REMOVE", 3, 3172, 257, "Avionics", "Rain Removal")

BIOS.protocol.endModule()