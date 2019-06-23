BIOS.protocol.beginModule("A-4E-C", 0x8400)
BIOS.protocol.setExportModuleAircrafts({"A-4E-C"})
--[[
DCS BIOS for A-4E-C


credit to [FSF]Ian for the amazing "DCS DIOS"

	CHANGELOG
		detail version changes here
	
v 1.00	original compile, development version 	Jan 2019		--by Dehuman
v 1.01	beta release	Jan 2019 								--by Dehuman
	-function breaking bugs fixed
	-several other bug fixes and functions redefined/reclassified
v 1.02	updates for 1.3, external Lights 	APR 2019		--by WarLord
v 1.03	updates for 1.3.1, external Lights 	APR 2019		--by WarLord

]]
local inputProcessors = moduleBeingDefined.inputProcessors
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
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter


--Engine gauges
defineFloat("RPM", 520, {0,1}, "Engine Instruments", "Engine RPM")
defineFloat("RPM_DECI", 521, {0,1}, "Engine Instruments", "Engine RPM deci")
defineFloat("EGT_C", 540, {0,1}, "Engine Instruments", "EGT")
defineFloat("D_FUEL_FLOW", 560, {0,1}, "Engine Instruments", "Fuel Flow")
defineFloat("OIL_PRESSURE", 152, {0,1}, "Engine Instruments", "Oil Pressure")
defineFloat("PRESSURE_RATIO", 151, {0,1}, "Engine Instruments", "Pressure Ratio")
defineFloat("D_FUEL", 580, {0,1}, "Engine Instruments", "Fuel Gauge")

--Hook, flaps, gear
defineFloat("D_FLAPS_IND", 23, {0,1}, "Mechanical Systems indicators", "Flaps Indicator")
defineFloat("D_TAIL_HOOK", 10, {0,1}, "Mechanical Systems indicators", "Hook Indicator")
defineFloat("GEAR_NOSE", 20, {0,1}, "Mechanical Systems indicators", "Nose Gear Indicator")
defineFloat("GEAR_LEFT", 21, {0,1}, "Mechanical Systems indicators", "Left Gear Indicator")
defineFloat("GEAR_RIGHT", 22, {0,1}, "Mechanical Systems indicators", "Right Gear Indicator")

--Main Flight Instruments
defineFloat("ATTGYRO_STBY_HORIZ", 665, {-1,1}, "Main Flight Instruments", "SAI horizon")
defineFloat("ATTGYRO_STBY_PITCH", 660, {-1,1}, "Main Flight Instruments", "SAI pitch")
defineFloat("ATTGYRO_STBY_ROLL", 661, {-1,1}, "Main Flight Instruments", "SAI roll")
defineFloat("ATTGYRO_STBY_OFF", 664, {0,1}, "Main Flight Instruments", "SAI off")
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

--Caution light ladder
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
defineFloat("BDHI_DME_xxX", 780, {0,1}, "BDHI", "BDHI nnX")
defineFloat("BDHI_HDG", 783, {0,1}, "BDHI", "BDHI Heading")
defineFloat("BDHI_ILS_GS", 381, {-1,1}, "BDHI", "BDHI ILS GS")
defineFloat("BDHI_ILS_LOC", 382, {-1,1}, "BDHI", "BDHI ILS LOC")

--Warning lamps
defineIndicatorLight("D_RADAR_WARN", 605, "Warning Lamps", "Radar altitude warning")
defineIndicatorLight("D_OIL_LOW", 150, "Warning Lamps", "Oil Low Light")
defineIndicatorLight("D_GLARE_WHEELS", 154, "Warning Lamps", "Glareshield Wheels")
defineIndicatorLight("D_GLARE_LABS", 155, "Warning Lamps", "Glareshield LABS")
defineIndicatorLight("D_RADAR_WARN", 156, "Warning Lamps", "Glareshield LAWS")
defineIndicatorLight("D_GLARE_OBST", 157, "Warning Lamps", "Glareshield OBST")
defineIndicatorLight("D_GLARE_IFF", 158, "Warning Lamps", "Glareshield IFF")
defineIndicatorLight("D_GLARE_FIRE", 159, "Warning Lamps", "Glareshield Fire")
defineIndicatorLight("D_OXYGEN_LOW", 761, "Warning Lamps", "Oxygen low")

--lamps
defineIndicatorLight("GEAR_LIGHT", 27, "Mechanical Systems", "Landing Gear Light")
defineIndicatorLight("AOA_GREEN", 850, "AOA Indicator", "AOA indexer Green")
defineIndicatorLight("AOA_YELLOW", 851, "AOA Indicator", "AoA indexer Yellow")
defineIndicatorLight("AOA_RED", 852, "AOA Indicator", "AoA indexer Red")
defineIndicatorLight("AWRS_POWER", 741, "ArmamentPanel", "AWRS Power indator light")
defineIndicatorLight("APC_LIGHT", 147, "ApproachPowerCompensator", "APC indator light")
defineIndicatorLight("D_ADVISORY_INRANGE", 866, "Advisory lights", "In range advisory")
defineIndicatorLight("D_ADVISORY_SETRANGE", 867, "Advisory lights", "Set range advisory")
defineIndicatorLight("D_ADVISORY_DIVE", 868, "Advisory lights", "Dive advisory")

--Radar Scope 
defineFloat("APG53A-LEFTRANGE", 406, {0,1}, "RadarControlPanel", "Radar Profile Range")
defineFloat("APG53A-BOTTOMRANGE", 407, {0,1}, "RadarControlPanel", "Radar Plan Range")
defineFloat("AFCS_HDG_100s", 167, {0,1}, "AFCS", "AFCS Heading 100's")
defineFloat("AFCS_HDG_10s", 168, {0,1}, "AFCS", "AFCS Heading 10's")
defineFloat("AFCS_HDG_1s", 169, {0,1}, "AFCS", "AFCS Heading 1's")

-- APN-153 Doppler Radar
defineIndicatorLight("APN153-MEMORYLIGHT", 171, "DopplerNav", "Memory light")
defineFloat("APN153-DRIFT-GAUGE", 172, {-1,1}, "DopplerNav", "Drift gauge")
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

-- AN/ARC-51 UHF Radio
defineFloat("ARC51-FREQ-XXxxx", 362, {0,1}, "UHF Radio", "Frequency XXnnn")
defineFloat("ARC51-FREQ-xxXxx", 363, {0,1}, "UHF Radio", "Frequency nnXnn")
defineFloat("ARC51-FREQ-xxxXX", 364, {0,0.95}, "UHF Radio", "Frequency nnnXX")
defineFloat("ARC51-FREQ-PRESET", 371, {0,0.95}, "UHF Radio", "Frequency Preset")

--Cockpit Lights
defineFloat("LIGHTS-FLOOD-WHITE", 111, {0,1}, "Lights", "White flood lights")
defineFloat("LIGHTS-FLOOD-RED", 114, {0,1}, "Lights", "Red flood lights")
defineFloat("LIGHTS-INSTRUMENTS", 117, {0,1}, "Lights", "Instrument lights")
defineFloat("LIGHTS-CONSOLE", 119, {0,1}, "Lights", "Console lights")
defineFloat("APG53A-GLOW", 115, {0,1}, "Lights", "Radar Glow light")

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

-----------------------
------CONTROLS---------
-----------------------

-- RADAR CONTROL PANEL
defineMultipositionSwitch("radar_mode", 7, 3063, 120, 5, 0.10, "RadarControlPanel", "Radar Mode")
defineToggleSwitch("radar_aoacomp", 7, 3064, 121, "RadarControlPanel", "Radar AoA Compensation")
definePotentiometer("radar_angle", 7, 3065, 122, {0,1}, "RadarControlPanel", "Radar Antenna Elevation")
definePotentiometer("radar_volume", 7, 3068, 123, {-1,1}, "RadarControlPanel", "Radar Warning Volume")

-- RADAR SCOPE
definePotentiometer("radar_storage", 7, 3057, 400, {-1,1}, "RadarScope", "Radar Storage")
definePotentiometer("radar_brilliance", 7, 3058, 401, {-1,1}, "RadarScope", "Radar Brilliance")
definePotentiometer("radar_detail", 7, 3059, 402, {-1,1}, "RadarScope", "Radar Detail")
definePotentiometer("radar_gain", 7, 3060, 403, {-1,1}, "RadarScope", "Radar Gain")
definePotentiometer("radar_reticle", 7, 3062, 404, {-1,1}, "RadarScope", "Radar Reticle")
defineToggleSwitch("radar_filter", 7, 3061, 405, "RadarScope", "Radar Filter Plate")

--Gunpods
defineMultipositionSwitch("gunpod_chargeclear", 2, 3012, 390, 3, 1, "Gunpods", "Charge/Off/Clear")
defineToggleSwitch("gunpod_l", 2, 3009, 391, "Gunpods", "Left Enable")
defineToggleSwitch("gunpod_c", 2, 3010, 392, "Gunpods", "Center Enable")
defineToggleSwitch("gunpod_r", 2, 3011, 393, "Gunpods", "Right Enable")

--Countermeasures
defineMultipositionSwitch("cm_bank", 34, 3106, 522, 3, 1, "Countermeasures", "Bank Select")
definePushButton("cm_auto", 34, 3107, 523, "Countermeasures", "Auto Pushbutton")
defineRotary("cm_adj1", 34, 3108, 524, "Countermeasures", "Bank 1 Adjust")
defineRotary("cm_adj2", 34, 3109, 525, "Countermeasures", "Bank 2 Adjust")
defineToggleSwitch("cm_pwr", 34, 3110, 530, "Countermeasures", "Power Toggle")
defineFloat("CM_BANK1_Xx", 526, {0,1}, "Countermeasures", "Bank 1 10's")
defineFloat("CM_BANK1_xX", 527, {0,1}, "Countermeasures", "Bank 1 1's")
defineFloat("CM_BANK2_Xx", 528, {0,1}, "Countermeasures", "Bank 2 10's")
defineFloat("CM_BANK2_xX", 529, {0,1}, "Countermeasures", "Bank 2 1's")

--Armament Panel
defineMultipositionSwitch("arm_emer_sel", 2, 3025, 700, 7, 0.1, "ArmamentPanel", "Emergency release selector")
defineToggleSwitch("arm_gun", 2, 3001, 701, "ArmamentPanel", "Guns switch")
defineTumb("arm_bomb", 2, 3026, 702, 1, {-1,1}, nil, false, "ArmamentPanel", "Bomb arm switch")
defineToggleSwitch("arm_station1", 2, 3003, 703, "ArmamentPanel", "Station 1 select")
defineToggleSwitch("arm_station2", 2, 3004, 704, "ArmamentPanel", "Station 2 select")
defineToggleSwitch("arm_station3", 2, 3005, 705, "ArmamentPanel", "Station 3 select")
defineToggleSwitch("arm_station4", 2, 3006, 706, "ArmamentPanel", "Station 4 select")
defineToggleSwitch("arm_station5", 2, 3007, 707, "ArmamentPanel", "Station 5 select")
defineMultipositionSwitch("arm_func_selector", 2, 3008, 708, 6, 0.1, "ArmamentPanel", "Function selector")
defineMultipositionSwitch("AWRS_quantity", 2, 3031, 740, 12, 0.05, "ArmamentPanel", "AWRS quantity selector")
definePotentiometer("AWRS_drop_interval", 2, 3032, 742, {0,0.9}, "ArmamentPanel", "AWRS drop interval")
defineToggleSwitch("AWRS_multiplier", 2, 3033, 743, "ArmamentPanel", "AWRS multiplier")
defineMultipositionSwitch("AWRS_stepripple", 2, 3034, 744, 6, 0.1, "ArmamentPanel", "AWRS mode")
defineToggleSwitch("arm_master", 3, 3002, 709, "ArmamentPanel", "Master armament")
defineToggleSwitch("radar_planprofile", 7, 3055, 721, "RadarScope", "Radar Plan/Profile")
defineToggleSwitch("radar_range", 7, 3056, 722, "RadarScope", "Radar Long/Short Range")
defineMultipositionSwitch("bdhi_mode", 20, 3044, 724, 3, 1.0, "BDHI", "BDHI mode")
definePotentiometer("shrike_volume", 2, 3126, 726, {0,1}, "ArmamentPanel", "Shrike Volume Knob")

--AFCS Panel
defineToggleSwitch("afcs_standby", 26, 3088, 160, "AFCS", "AFCS standby")
defineToggleSwitch("afcs_engage", 26, 3089, 161, "AFCS", "AFCS engage")
defineToggleSwitch("afcs_hdg_sel", 26, 3090, 162, "AFCS", "AFCS preselect heading")
defineToggleSwitch("afcs_alt", 26, 3091, 163, "AFCS", "AFCS altitude hold")
definePotentiometer("afcs_hdg_set", 26, 3092, 164, {0,1}, "AFCS", "AFCS heading selector")
defineToggleSwitch("afcs_stab_aug", 26, 3093, 165, "AFCS", "AFCS stability aug")
defineToggleSwitch("afcs_ail_trim", 26, 3094, 166, "AFCS", "AFCS aileron trim")

--Approach Power Compensator
defineMultipositionSwitch("apc_engagestbyoff", 26, 3095, 135, 3, 1.0, "ApproachPowerCompensator", "APC Enable/Stby/Off")
defineMultipositionSwitch("apc_hotstdcold", 26, 3096, 136, 3, 1.0, "ApproachPowerCompensator", "APC Cold/Std/Hot")

--Mechanical Systems
defineToggleSwitch("Gear", 12, 3020, 8, "Mechanical Systems", "Landing Gear Handle")
defineToggleSwitch("HOOK_HANDLE", 12, 3021, 10,"Gear" , "Landing Hook Handle")
defineToggleSwitch("spoiler_arm", 13, 3017, 84, "Mechanical Systems", "Spoiler Arm Switch")
defineToggleSwitch("speedbrake", 10, 3024, 85, "Mechanical Systems", "Speedbrake switch")
defineTumb("speedbrake_emer", 10, 3035, 128, 1, {-1,1}, nil, false, "Mechanical Systems", "Speedbrake emergency")
defineToggleSwitch("Canopy", 14, 71, 0, "Mechanical Systems", "Canopy")
defineTumb("flaps", 11, 3015, 132, 1, {-1,1}, nil, false, "Mechanical Systems", "Flaps Lever")
definePotentiometer("rudder_trim", 25, 3085, 82, {-1,1}, "Mechanical Systems", "Rudder trim")
defineTumb("throttle_click", 17, 3087, 0, 1, {-1,1}, nil, true, "Mechanical Systems", "Throttle cutoff/start/idle")
definePushButton("push_starter_switch", 17, 3013, 100, "Mechanical Systems", "Starter Button")
defineToggleSwitch("emer_fuel_shutoff", 17, 3134, 8, "Mechanical Systems", "Emergency Fuel Shutoff Control")

--Avionics
definePushButton("accel_reset", 21, 3111, 139, "Avionics", "Reset Accelerometer")
definePushButton("clock_stopwatch", 5, 3105, 146, "Clock", "Stopwatch start/stop")
definePushButton("radar_alt_switch", 16, 3038, 603, "Avionics", "Radar altitude warning button")
defineRotary("radar_alt_indexer", 16, 3037, 602, "Avionics", "Radar altitude warning knob")
definePushButton("stby_att_index_button", 21, 3042, 663, "Avionics", "Standby attitude horizon button")
defineRotary("stby_att_index_knob", 21, 3043, 662, "Avionics", "Standby attitude horizon knob")
definePushButton("FuelGaugeExtButton", 21, 3018, 720, "Avionics", "Show EXT Fuel")
definePushButton("master_test", 21, 3039, 723, "Avionics", "Master test")
defineRotary("AltPressureKnob", 21, 3019, 827, "Avionics", "Altimeter Setting")
definePushButton("ias_index_button", 21, 3040, 885, "Avionics", "IAS Index button")
definePotentiometer("ias_index_knob", 21, 3041, 884, {0,1}, "Avionics", "IAS Index knob")

--Gunsight
defineRotary("GunsightBrightness", 19, 3030, 895, "Gunsight", "Gunsight brightness")
defineToggleSwitch("GunsightDayNight", 19, 3029, 891, "Gunsight", "Gunsight day/night")
definePotentiometer("GunsightKnob", 19, 3028, 892, {0,1}, "Gunsight", "Gunsight elevation")

--TACAN
defineMultipositionSwitch("tacan_mode", 20, 3069, 900, 4, 0.1, "TACAN", "TACAN Mode")
defineMultipositionSwitch("tacan_ch_major", 20, 3070, 901, 13, 0.05, "TACAN", "TACAN Channel Major")
defineMultipositionSwitch("tacan_ch_minor", 20, 3071, 902, 10, 0.1, "TACAN", "TACAN Channel Minor")
definePotentiometer("tacan_volume", 20, 3072, 903, {-1,1}, "TACAN", "TACAN Volume")

--Doppler Navigation Computer
defineMultipositionSwitch("doppler_select", 20, 3045, 170, 5, 0.1, "DopplerNav", "APN-153 Doppler Radar Mode")
definePushButton("doppler_memory_test", 20, 3046, 247, "DopplerNav", "APN-153 Memory Light Test")
defineMultipositionSwitch("nav_select", 20, 3047, 176, 5, 0.1, "DopplerNav", "ASN-41 Navigation Mode")
defineRotary("ppos_lat", 20, 3051, 177, "DopplerNav Position", "ASN-41 Present Position - Latitude")
defineRotary("ppos_lon", 20, 3052, 183, "DopplerNav Position", "ASN-41 Present Position - Longitude")
defineRotary("dest_lat", 20, 3053, 190, "DopplerNav Destination", "ASN-41 Destination - Latitude")
defineRotary("dest_lon", 20, 3054, 196, "DopplerNav Destination", "ASN-41 Destination - Longitude")
defineRotary("asn41_magvar", 20, 3048, 203, "DopplerNav", "ASN-41 Magnetic Variation")
defineRotary("asn41_windspeed", 20, 3049, 209, "DopplerNav", "ASN-41 Wind Speed")
defineRotary("asn41_winddir", 20, 3050, 213, "DopplerNav", "ASN-41 Wind Bearing")

--Lights
defineMultipositionSwitch("extlight_master", 24, 3073, 83, 3, 1, "Lights", "Master Lighting ON/OFF/Momentary")
defineMultipositionSwitch("extlight_probe", 24, 3074, 217, 3, 1, "Lights", "Probe Light")
defineToggleSwitch("extlight_taxi", 24, 3075, 218, "Lights", "Taxi Light")
defineToggleSwitch("extlight_anticoll", 24, 3076, 219, "Lights", "Anti-Collision Lights")
defineMultipositionSwitch("extlight_fuselage", 24, 3077, 220, 3, 1, "Lights", "Fuselage Lights")
defineToggleSwitch("extlight_flashsteady", 24, 3078, 221, "Lights", "Lighting Flash/Steady mode")
defineMultipositionSwitch("extlight_nav", 24, 3079, 222, 3, 1, "Lights", "Navigation Lights")
defineMultipositionSwitch("extlight_tail", 24, 3080, 223, 3, 1, "Lights", "Tail Light")
definePotentiometer("intlight_instruments", 21, 3082, 106, {0,1}, "Lights", "Instrument Lighting")
definePotentiometer("intlight_console", 21, 3083, 107, {0,1}, "Lights", "Console Lighting")
defineMultipositionSwitch("intlight_brightness", 24, 3084, 108, 3, 1, "Lights", "Console Light Intensity")
definePotentiometer("intlight_whiteflood", 21, 3081, 110, {0,1}, "Lights", "White Floodlight Control")

--UHF Radio
defineMultipositionSwitch("arc51_freq_preset", 27, 3101, 361, 20, 0.05, "UHF Radio", "ARC-51 UHF Preset Channel")
definePotentiometer("arc51_volume", 27, 3099, 365, {0,1}, "UHF Radio", "ARC-51 UHF Volume")
defineMultipositionSwitch("arc51_xmitmode", 27, 3098, 366, 3, 1, "UHF Radio", "ARC-51 UHF Frequency Mode")
defineMultipositionSwitch("arc51_freq_XXxxx", 27, 3102, 367, 18, 0.05, "UHF Radio", "ARC-51 UHF Manual Frequency 10 MHz")
defineMultipositionSwitch("arc51_freq_xxXxx", 27, 3103, 368, 10, 0.1, "UHF Radio", "ARC-51 UHF Manual Frequency 1 MHz")
defineMultipositionSwitch("arc51_freq_xxxXX", 27, 3104, 369, 20, 0.05, "UHF Radio", "ARC-51 UHF Manual Frequency 50 kHz")
defineToggleSwitch("arc51_squelch", 27, 3100, 370, "UHF Radio", "ARC-51 UHF Squelch Disable")
defineMultipositionSwitch("arc51_mode", 27, 3097, 372, 4, 0.1, "UHF Radio", "ARC-51 UHF Mode")

--T Handles
defineToggleSwitch("emer_gear_release", 12, 3036, 1240, "T Handles", "Emergency gear release")
defineToggleSwitch("emer_bomb_release", 2, 3027, 1241, "T Handles", "Emergency bomb release")
defineToggleSwitch("emer_gen_deploy", 3, 3023, 1243, "T Handles", "Emergency generator deploy")
defineToggleSwitch("emer_gen_bypass", 3, 3022, 1061, "T Handles", "Emergency generator bypass")
defineToggleSwitch("man_flight_control", 4, 3136, 1242, "T Handles", "Manual Flight Control")

-- ECM Panel
defineToggleSwitch("ecm_audio", 33, 3115, 503, "ECM Panel", "Audio APR/25 - APR/27")
defineToggleSwitch("ecm_apr25_pw", 33, 3114, 504, "ECM Panel", "APR/25 on/off")
defineToggleSwitch("ecm_apr27_pw", 33, 3116, 501, "ECM Panel", "APR/27 on/off")
definePushButton("ecm_apr27_test", 33, 3117, 507, "ECM Panel", "APR/27 test")
definePushButton("ecm_apr27_light", 33, 3118, 510, "ECM Panel", "APR/27 light")
definePotentiometer("ecm_prf_volume", 33, 3119, 506, {-0.8,0.8}, "ECM Panel", "PRF volume (inner knob)")
definePotentiometer("ecm_msl_volume", 33, 3120, 505, {-0.8,0.8}, "ECM Panel", "MSL volume (outer knob)")
defineMultipositionSwitch("ecm_selector", 33, 3121, 502, 4, 0.33, "ECM Panel", "ECM selector knob")

-- AIR CONDITIONING PANEL
defineToggleSwitch("cabin_pressure", 3, 3131, 224, "Air Condition", "Cabin Pressure Switch")
defineTumb("wind_defrost", 3, 3132, 225, 1, {-1,1}, nil, false, "Air Condition", "Windshield Defrost")
definePotentiometer("cabin_temp", 3, 3133, 226, {0,1}, "Air Condition", "Cabin Temp Knob")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKES", function()
	return math.floor(LoGetAircraftDrawArgumentValue(500)*65535)
end, 65535, "External Aircraft Model", "Speed Brakes")

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")

defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")
defineIntegerFromGetter("EXT_STROBE_BOTTOM", function()
	if LoGetAircraftDrawArgumentValue(199) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Strobe Light")


BIOS.protocol.endModule()