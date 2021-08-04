-- V1.8b by Warlord (aka BlackLibrary)
-- Added HARM,VIP,VRP pages by Matchstick
-- Tested and fixes by BuzzKillington & afewyards
-- DED Display,MAGV,INS,UHF,CMDS,HARM,VIP & VRP by Matchstick

BIOS.protocol.beginModule("F-16C_50", 0x4400)
BIOS.protocol.setExportModuleAircrafts({"F-16C_50"})


local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document
local parse_indication = BIOS.util.parse_indication


local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineFloat = BIOS.util.defineFloat
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3Pos2CommandSwitch = BIOS.util.define3Pos2CommandSwitch

--Functions
local function defineSpringloaded_3_pos_tumb(msg, device_id, downSwitch, upSwitch, arg_number, category, description)
	local alloc = moduleBeingDefined.memoryMap:allocateInt{ maxValue = 2 }
	moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
	    local val = dev0:get_argument_value(arg_number)
		if val == -1 then
			alloc:setValue(0)
		elseif val == 0 then
			alloc:setValue(1)
		elseif val == 1 then
			alloc:setValue(2)
		end
	end
	
	document {
		identifier = msg,
		category = category,
		description = description,
		control_type = "3Pos_2Command_Switch_OpenClose",
		inputs = {
			{ interface = "set_state", max_value = 2, description = "set the switch position" }
		},
		outputs = {
			{ ["type"] = "integer",
			  suffix = "",
			  address = alloc.address,
			  mask = alloc.mask,
			  shift_by = alloc.shiftBy,
			  max_value = 2,
			  description = "switch position -- 0 = Down, 1 = Mid ,  2 = UP"
			}
		}
	}

	moduleBeingDefined.inputProcessors[msg] = function(toState)
		local dev = GetDevice(device_id)
		if toState == "0" then --downSwitch
			dev:performClickableAction(downSwitch, 0)
			dev:performClickableAction(upSwitch, 0) 
			dev:performClickableAction(downSwitch, -1)		
	    elseif toState == "1" then --Stop
			dev:performClickableAction(downSwitch, 0)
			dev:performClickableAction(upSwitch, 0) 		
		elseif toState == "2" then --upSwitch
			dev:performClickableAction(downSwitch, 0)
			dev:performClickableAction(upSwitch, 0) 
			dev:performClickableAction(upSwitch, 1)
		end
	end
end

local function coerce_nil_to_string(value)
	if value == nil then
		return ""
	else
		return value
	end
end

------------------------------------------------------------------Switches, Buttons---------------------------------------------------------------------------------
--Control Interface
defineToggleSwitch("DIGI_BAK_SW", 2, 3001, 566, "Control Interface", "DIGITAL BACKUP Switch, OFF/BACKUP")
defineToggleSwitch("ALT_FLAPS_SW", 2, 3002, 567, "Control Interface", "ALT FLAPS Switch, NORM/EXTEND")
defineToggleSwitch("BIT_SW", 2, 3003, 574, "Control Interface", "BIT Switch, OFF/BIT")
defineToggleSwitch("FLCS_RESET_SW", 2, 3004, 573, "Control Interface", "FLCS RESET Switch, OFF/RESET")
defineToggleSwitch("LE_FLAPS_SW", 2, 3005, 572, "Control Interface", "LE FLAPS Switch, AUTO/LOCK")
defineToggleSwitch("TRIM_AP_DISC_SW", 2, 3006, 564, "Control Interface", "TRIM/AP DISC Switch, DISC/NORM")
definePotentiometer("ROLL_TRIM", 2, 3007, 560, {-1, 1}, "Control Interface", "ROLL TRIM Wheel")
definePotentiometer("PITCH_TRIM", 2, 3008, 562, {-1, 1}, "Control Interface", "PITCH TRIM Wheel")
definePotentiometer("YAW_TRIM", 2, 3009, 565, {-1, 1}, "Control Interface", "YAW TRIM Knob")
defineToggleSwitch("MANUAL_PITCH_SW", 2, 3010, 425, "Control Interface", "MANUAL PITCH Override Switch, OVRD/NORM")
defineToggleSwitch("STORES_CONFIG_SW", 2, 3011, 358, "Control Interface", "STORES CONFIG Switch, CAT III/CAT I")
defineSpringloaded_3_pos_tumb("AP_PITCH_SW", 2, 3012, 3013, 109, "Control Interface", "Autopilot PITCH Switch, ATT HOLD/ A/P OFF/ ALT HOLD")
define3PosTumb("AP_ROLL_SW", 2, 3014, 108, "Control Interface", "Autopilot ROLL Switch, STRG SEL/ATT HOLD/HDG SEL")
defineToggleSwitch("ADV_MODE_SW", 2, 3015, 97, "Control Interface", "ADV MODE Switch")
defineToggleSwitch("MAN_TF_FLYUP_SW", 2, 3016, 568, "Control Interface", "MANUAL TF FLYUP Switch, ENABLE/DISABLE")

--External Lights
defineTumb("ANTI_COLL_LIGHT_KNB", 11, 3001, 531, 0.1, {0, 0.7}, nil, true, "External Lights", "ANTI-COLL Knob, OFF/1/2/3/4/A/B/C")
defineToggleSwitch("POS_FLASH_LIGHT_SW", 11, 3002, 532, "External Lights", "FLASH STEADY Light Switch, FLASH/STEADY")
define3PosTumb("POS_WING_TAIL_LIGHT_SW", 11, 3003, 533, "External Lights", "WING/TAIL Light Switch, BRT/OFF/DIM")
define3PosTumb("POS_FUSELAGE_LIGHT_SW", 11, 3004, 534, "External Lights", "FUSELAGE Light Switch, BRT/OFF/DIM")
definePotentiometer("FORM_LIGHT_KNB", 11, 3005, 535, nil, "External Lights", "FORM Light Knob")
defineTumb("MASTER_LIGHT_SW", 11, 3006, 536, 0.1, {0, 0.4}, nil, true, "External Lights", "MASTER Light Switch, OFF/ALL/A-C/FORM/NORM")
definePotentiometer("AIR_REFUEL_LIGHT_KNB", 11, 3007, 537, nil, "External Lights", "AERIAL REFUELING Light Knob")
define3PosTumb("LAND_TAXI_LIGHT_SW", 11, 3008, 360, "External Lights", "LANDING TAXI LIGHTS Switch, LANDING/OFF/TAXI")

--Interior Lights
definePushButton("MASTER_CAUTION", 12, 3001, 116, "Interior Lights", "Master Caution Button - Push to reset")
definePushButton("MAL_IND_LTS_TEST", 12, 3002, 577, "Interior Lights", "MAL & IND LTS Test Button - Push to test")
definePotentiometer("PRI_CONSOLES_BRT_KNB", 12, 3003, 685, nil, "Interior Lights", "PRIMARY CONSOLES BRT Knob")
definePotentiometer("PRI_INST_PNL_BRT_KNB", 12, 3004, 686, nil, "Interior Lights", "PRIMARY INST PNL BRT Knob")
definePotentiometer("PRI_DATA_DISPLAY_BRT_KNB", 12, 3005, 687, nil, "Interior Lights", "PRIMARY DATA ENTRY DISPLAY BRT Knob")
definePotentiometer("FLOOD_CONSOLES_BRT_KNB", 12, 3006, 688, nil, "Interior Lights", "FLOOD CONSOLES BRT Knob")
definePotentiometer("FLOOD_INST_PNL_BRT_KNB", 12, 3007, 690, nil, "Interior Lights", "FLOOD INST PNL BRT Knob")
defineSpringloaded_3_pos_tumb("MAL_IND_LTS_BRT_SW", 12, 3009, 3008, 691, "External Lights", "MAL & IND LTS Switch, BRT/Center/DIM")
definePotentiometer("AOA_INDEX_BRT_KNB", 12, 3010, 794, nil, "Interior Lights", "AOA Indexer Dimming Lever")
definePotentiometer("AR_STATUS_BRT_KNB", 12, 3011, 795, nil, "Interior Lights", "AR Status Indicator Dimming Lever")

--Electric System
define3PosTumb("MAIN_PWR_SW", 3, 3001, 510, "Electric System", "MAIN PWR Switch, MAIN PWR/BATT/OFF")
definePushButton("ELEC_CAUTION", 3, 3002, 511, "Electric System", "ELEC CAUTION RESET Button - Push to reset")
defineToggleSwitch("EPU_GEN_TEST_SW", 3, 3005, 579, "Electric System", "EPU/GEN Test Switch, EPU/GEN /OFF")
defineSpringloaded_3_pos_tumb("PROBE_HEAT_SW", 3, 3007, 3006, 578, "Electric System", "PROBE HEAT Switch, PROBE HEAT/OFF/TEST")
defineSpringloaded_3_pos_tumb("FLCS_PWR_TEST_SW", 3, 3003, 3004, 585, "Electric System", "FLCS PWR TEST Switch, MAINT/NORM/TEST")

--Fuel System
defineToggleSwitch("FUEL_MASTER_SW", 4, 3001, 559, "Fuel System", "FUEL MASTER Switch, MASTER/OFF")
defineToggleSwitch("FUEL_MASTER_CV", 4, 3002, 558, "Fuel System", "FUEL MASTER Switch Cover, OPEN/CLOSE")
defineToggleSwitch("TANK_INTERTING_SW", 4, 3007, 557, "Fuel System", "TANK INERTING Switch, TANK INERTING /OFF")
defineTumb("ENGINE_FEED_KNB", 4, 3004, 556, 0.1, {0, 0.3}, nil, true, "External Lights", "ENGINE FEED Knob, OFF/NORM/AFT/FWD")
defineToggleSwitch("AIR_REFUEL_SW", 4, 3008, 555, "Fuel System", "AIR REFUEL Switch, OPEN/CLOSE")
defineToggleSwitch("EXT_FUEL_TRANS_SW", 4, 3003, 159, "Fuel System", "External Fuel Transfer Switch, NORM/ WING FIRST")
defineTumb("FUEL_QTY_SEL_KNB", 4, 3005, 158, 0.1, {0, 0.5}, nil, true, "Fuel System", "FUEL QTY SEL Knob, TEST/NORM/RSVR/INT WING/EXT WING/EXT CTR")

--Gear System
defineToggleSwitch("GEAR_HANDLE", 7, 3001, 362, "Gear System", "LG Handle, UP/DN")
definePushButton("DN_LOCK_BTN", 7, 3002, 361, "Gear System", "DN LOCK REL Button - Push to reset")
defineToggleSwitch("HOOK_SW", 7, 3006, 354, "Gear System", "HOOK Switch, UP/DN")
definePushButton("HORN_SILENCE_BTN", 7, 3007, 359, "Gear System", "HORN SILENCER Button - Push to reset")
defineToggleSwitch("BRAKE_CHAN_SW", 7, 3005, 356, "Gear System", "BRAKES Channel Switch, CHAN 1/CHAN 2")
define3Pos2CommandSwitch("ANTI_SKID_SW", 7, 3010, 3004, 357, "Gear System", "ANTI-SKID Switch, PARKING BRAKE/ANTI-SKID/OFF")

--ECS
defineTumb("TEMP_KNB", 13, 3002, 692, 0.1, {-0.3,0.3}, nil, true, "ECS", "TEMP Knob")
defineTumb("AIR_SOURCE_KNB", 13, 3001, 693, 0.1, {0.0, 0.4}, nil, true, "ECS", "AIR SOURCE Knob, OFF/NORM/DUMP/RAM")
defineToggleSwitch("DEFOG_LEVER", 13, 3003, 602, "ECS", "DEFOG Lever")

--EPU
defineToggleSwitch("EPU_SW_COVER_ON", 6, 3001, 527, "EPU", "EPU Switch Cover for ON, OPEN/CLOSE")
defineToggleSwitch("EPU_SW_COVER_OFF", 6, 3002, 529, "EPU", "EPU Switch Cover for OFF, OPEN/CLOSE")
define3PosTumb("EPU_SW", 6, 3003, 528, "EPU", "EPU Switch, ON/NORM/OFF")

--Engine
define3PosTumb("ENG_ANTI_ICE", 6, 3004, 710, "Engine", "Engine ANTI ICE Switch, ON/AUTO/OFF")
defineSpringloaded_3_pos_tumb("JFS_SW", 6, 3006, 3005, 447, "Engine", "JFS Switch, START 1/OFF/START 2")
defineToggleSwitch("ENG_CONT_SW_COVER", 6, 3007, 448, "Engine", "ENG CONT Switch Cover, OPEN/CLOSE")
defineToggleSwitch("ENG_CONT_SW", 6, 3008, 449, "Engine", "ENG CONT Switch, PRI/SEC")
defineToggleSwitch("MAX_PWR_SW", 6, 3009, 451, "Engine", "MAX POWER Switch, MAX POWER/OFF")
defineSpringloaded_3_pos_tumb("AB_RESET_SW", 6, 3011, 3010, 450, "Engine", "AB RESET Switch, AB RESET/NORM/ENG DATA")
definePushButton("FIRE_OHEAT_DETECT_BTN", 6, 3012, 575, "Engine", "FIRE & OHEAT DETECT Test Button - Push to test")

--Oxygen System
defineTumb("OXY_SUPPLY_LVR", 8, 3001, 728, 0.5, {0.0, 1.0}, nil, true,"Oxygen System", "Supply Lever, PBG/ON/OFF")
defineToggleSwitch("OXY_DILUTER_LVR", 8, 3002, 727, "Oxygen System", "Diluter Lever, 100 percent/NORM")
defineSpringloaded_3_pos_tumb("OXY_EMERG_LVR", 8, 3004, 3003, 726, "Oxygen System", "Emergency Lever, EMERGENCY/NORMAL/TEST MASK")
defineToggleSwitch("OBOGS_SW", 8, 3005, 576, "Oxygen System", "OBOGS BIT Switch, BIT/OFF")

--Sensor Power Control Panel
defineToggleSwitch("HDPT_SW_L", 22, 3002, 670, "Sensor Panel", "LEFT HDPT Switch, ON/OFF")
defineToggleSwitch("HDPT_SW_R", 22, 3003, 671, "Sensor Panel", "RIGHT HDPT Switch, ON/OFF")
defineToggleSwitch("FCR_PWR_SW", 31, 3001, 672, "Sensor Panel", "FCR Switch, FCR/OFF")
define3PosTumb("RDR_ALT_PWR_SW", 15, 3001, 673, "Sensor Panel", "RDR ALT Switch, RDR ALT/STBY/OFF")

--Avionic Power Panel
defineToggleSwitch("MMC_PWR_SW", 19, 3001, 715, "Avionic Panel", "MMC Switch, MMC/OFF")
defineToggleSwitch("ST_STA_SW", 22, 3001, 716, "Avionic Panel", "ST STA Switch, ST STA/OFF")
defineToggleSwitch("MFD_SW", 19, 3014, 717, "Avionic Panel", "MFD Switch, MFD/OFF")
defineToggleSwitch("UFC_SW", 17, 3001, 718, "Avionic Panel", "UFC Switch, UFC/OFF")
defineToggleSwitch("GPS_SW", 59, 3001, 720, "Avionic Panel", "GPS Switch, GPS/OFF")
defineTumb("MIDS_LVT_KNB", 41, 3001, 723, 0.1, {0.0,0.2}, nil, true, "Avionic Panel", "MIDS LVT Knob, ZERO/OFF/ON")
defineTumb("INS_KNB", 14, 3001, 719, 0.1, {0.0,0.6}, nil, true, "Avionic Panel", "INS Knob, OFF/STOR HDG/NORM/NAV/CAL/INFLT ALIGN/ATT")
defineToggleSwitch("MAP_SW", 61, 3001, 722, "Avionic Panel", "MAP Switch, MAP/OFF")
defineToggleSwitch("DL_SW", 60, 3001, 721, "Avionic Panel", "DL Switch, DL/OFF")

--Modular Mission Computer (MMC)
define3PosTumb("MASTER_ARM_SW", 19, 3002, 105, "MMC", "MASTER ARM Switch, MASTER ARM/OFF/SIMULATE")
definePushButton("EMERG_STRORE_JETT", 19, 3003, 353, "MMC", "EMER STORES JETTISON Button - Push to jettison")
defineToggleSwitch("GND_JETT_ENABLE_SW", 19, 3004, 355, "MMC", "GND JETT ENABLE Switch, ENABLE/OFF")
definePushButton("ALT_REL_BTN", 19, 3005, 104, "MMC", "ALT REL Button - Push to release")
defineToggleSwitch("LASER_ARM_SW", 22, 3004, 103, "MMC", "LASER ARM Switch, ARM/OFF")

--Integrated Control Panel (ICP) of Upfront Controls (UFC)
definePushButton("ICP_BTN_1", 17, 3003, 171, "UFC", "ICP Priority Function Button, 1(T-ILS)")
definePushButton("ICP_BTN_2", 17, 3004, 172, "UFC", "ICP Priority Function Button, 2/N(ALOW)")
definePushButton("ICP_BTN_3", 17, 3005, 173, "UFC", "ICP Priority Function Button, 3")
definePushButton("ICP_BTN_4", 17, 3006, 175, "UFC", "ICP Priority Function Button, 4/W(STPT)")
definePushButton("ICP_BTN_5", 17, 3007, 176, "UFC", "ICP Priority Function Button, 5(CRUS)")
definePushButton("ICP_BTN_6", 17, 3008, 177, "UFC", "ICP Priority Function Button, 6/E(TIME)")
definePushButton("ICP_BTN_7", 17, 3009, 179, "UFC", "ICP Priority Function Button, 7(MARK)")
definePushButton("ICP_BTN_8", 17, 3010, 180, "UFC", "ICP Priority Function Button, 8/S(FIX)")
definePushButton("ICP_BTN_9", 17, 3011, 181, "UFC", "ICP Priority Function Button, 9(A-CAL)")
definePushButton("ICP_BTN_0", 17, 3002, 182, "UFC", "ICP Priority Function Button, 0(M-SEL)")
definePushButton("ICP_COM1_BTN", 17, 3012, 165, "UFC", "ICP COM Override Button, COM1(UHF)")
definePushButton("ICP_COM2_BTN", 17, 3013, 166, "UFC", "ICP COM Override Button, COM2(VHF)")
definePushButton("ICP_IFF_BTN", 17, 3014, 167, "UFC", "ICP IFF Override Button, IFF")
definePushButton("ICP_LIST_BTN", 17, 3015, 168, "UFC", "ICP LIST Override Button, LIST")
definePushButton("ICP_AA_MODE_BTN", 17, 3018, 169, "UFC", "ICP Master Mode Button, A-A")
definePushButton("ICP_AG_MODE_BTN", 17, 3019, 170, "UFC", "ICP Master Mode Button, A-G")
definePushButton("ICP_RCL_BTN", 17, 3017, 174, "UFC", "ICP Recall Button, RCL")
definePushButton("ICP_ENTR_BTN", 17, 3016, 178, "UFC", "ICP Enter Button, ENTR")
definePotentiometer("ICP_RETICLE_DEPRESS_KNB", 17, 3020, 192, nil, "UFC", "ICP Reticle Depression Control Knob")
definePotentiometer("ICP_RASTER_CONTR_KNB", 17, 3021, 193, nil, "UFC", "ICP Raster Contrast Knob")
definePotentiometer("ICP_RASTER_BRT_KNB", 17, 3023, 191, nil, "UFC", "ICP Raster Intensity Knob")
definePotentiometer("ICP_HUD_BRT_KNB", 17, 3022, 190, nil, "UFC", "ICP HUD Symbology Intensity Knob")
definePushButton("ICP_WX_BTN", 17, 3024, 187, "UFC", "ICP FLIR Polarity Button, Wx")
define3PosTumb("ICP_FLIR_GAIN_SW", 17, 3027, 189, "UFC", "ICP FLIR GAIN/LEVEL Switch, GAIN/LVL/AUTO")
defineSpringloaded_3_pos_tumb("ICP_DED_SW", 17, 3031, 3030, 183, "UFC", "ICP DED Increment/Decrement Switch")
defineSpringloaded_3_pos_tumb("ICP_FLIR_SW", 17, 3026, 3025, 188, "UFC", "ICP FLIR Increment/Decrement Switch")
defineSpringloaded_3_pos_tumb("ICP_DRIFT_SW", 17, 3029, 3028, 186, "UFC", "ICP DRIFT CUTOUT/WARN RESET Switch, DRIFT C/O /NORM/WARN RESET")
defineSpringloaded_3_pos_tumb("ICP_DATA_RTN_SEQ_SW", 17, 3032, 3033, 184, "UFC", "ICP Data Control Switch, RTN-SEQ")
defineSpringloaded_3_pos_tumb("ICP_DATA_UP_DN_SW", 17, 3035, 3034, 185, "UFC", "ICP Data Control Switch, UP-DN")
definePushButton("F_ACK_BTN", 17, 3036, 122, "UFC", "F-ACK Button")
definePushButton("IFF_ID_BTN", 17, 3037, 125, "UFC", "IFF IDENT Button")
define3PosTumb("RF_SW", 17, 3038, 100, "UFC", "RF Switch, SILENT/QUIET/NORM")

--HUD Remote Control Panel
define3PosTumb("HUD_SCALES_SW", 19, 3006, 675, "HUD Control Panel", "HUD Scales Switch, VV/VAH / VAH / OFF")
define3PosTumb("HUD_FP_MARKER_SW", 19, 3007, 676, "HUD Control Panel", "HUD Flightpath Marker Switch, ATT/FPM / FPM / OFF")
define3PosTumb("HUD_DED_DATA_SW", 19, 3008, 677, "HUD Control Panel", "HUD DED/PFLD Data Switch, DED / PFL / OFF")
define3PosTumb("HUD_DEPRESS_RET_SW", 19, 3009, 678, "HUD Control Panel", "HUD Depressible Reticle Switch, STBY / PRI / OFF")
define3PosTumb("HUD_SPEED_SW", 19, 3010, 679, "HUD Control Panel", "HUD Velocity Switch, CAS / TAS / GND SPD")
define3PosTumb("HUD_ALT_SW", 19, 3011, 680, "HUD Control Panel", "HUD Altitude Switch, RADAR / BARO / AUTO")
define3PosTumb("HUD_BRT_SW", 19, 3012, 681, "HUD Control Panel", "HUD Brightness Control Switch, DAY / AUTO BRT / NIGHT")
define3PosTumb("HUD_TEST_SW", 19, 3013, 682, "HUD Control Panel", "HUD TEST Switch, STEP / ON / OFF")

--Audio Control Panels
defineTumb("COMM1_MODE_KNB", 39, 3002, 434, 0.5, {0,1}, nil, true, "Audio Panel", "COMM 1 (UHF) Mode Knob")
defineTumb("COMM2_MODE_KNB", 39, 3004, 435, 0.5, {0,1}, nil, true, "Audio Panel", "COMM 2 (VHF) Mode Knob")
definePotentiometer("COMM1_PWR_KNB", 39, 3001, 430, nil, "Audio Panel", "COMM 1 Power Knob")
definePotentiometer("COMM2_PWR_KNB", 39, 3003, 431, nil, "Audio Panel", "COMM 2 Power Knob")
definePotentiometer("SEC_VOICE_KNB", 39, 3005, 432, nil, "Audio Panel", "SECURE VOICE Knob")
definePotentiometer("MSL_KNB", 39, 3006, 433, nil, "Audio Panel", "MSL Tone Knob")
definePotentiometer("TF_KNB", 39, 3007, 436, nil, "Audio Panel", "TF Tone Knob Knob")
definePotentiometer("THREAT_KNB", 39, 3008, 437, nil, "Audio Panel", "THREAT Tone Knob")
definePotentiometer("INTERCOM_KNB", 39, 3011, 440, nil, "Audio Panel", "INTERCOM Knob")
definePotentiometer("TACAN_KNB", 39, 3010, 441, nil, "Audio Panel", "TACAN Knob")
definePotentiometer("ILS_PWR_KNB", 39, 3009, 442, nil, "Audio Panel", "ILS Power Knob")
define3PosTumb("HOT_MIC_SW", 39, 3012, 443, "Audio Panel", "HOT MIC CIPHER Switch, HOT MIC / OFF / CIPHER")
defineToggleSwitch("VMS_INHIBIT_SW", 39, 3015, 696, "Audio Panel", "Voice Message Inhibit Switch, VOICE MESSAGE/INHIBIT")
define3PosTumb("IFF_ANT_SEL_SW", 39, 3013, 711, "Audio Panel", "IFF ANT SEL Switch, LOWER/NORM/UPPER")
define3PosTumb("UHF_ANT_SEL_SW", 39, 3014, 712, "Audio Panel", "UHF ANT SEL Switch, LOWER/NORM/UPPER")

--UHF Backup Control Panel
defineMultipositionSwitch("UHF_CHAN_KNB", 37, 3001, 410, 20, 0.05,"UHF" ,"UHF CHAN Knob")
defineTumb("UHF_FREQ_100_KNB", 37, 3002, 411, 0.1, {0.1,0.3}, nil, false,"UHF" ,"UHF Manual Frequency Knob 100 MHz")
defineMultipositionSwitch("UHF_FREQ_10_KNB", 37, 3003, 412, 10, 0.1,"UHF" ,"UHF Manual Frequency Knob 10 MHz")
defineMultipositionSwitch("UHF_FREQ_1_KNB", 37, 3004, 413, 10, 0.1,"UHF" ,"UHF Manual Frequency Knob 1 MHz")
defineMultipositionSwitch("UHF_FREQ_01_KNB", 37, 3005, 414, 10, 0.1,"UHF" ,"UHF Manual Frequency Knob 0.1 MHz")
defineMultipositionSwitch("UHF_FREQ_0025_KNB", 37, 3006, 415, 4, 0.25,"UHF" ,"UHF Manual Frequency Knob 0.025 MHz")
defineMultipositionSwitch("UHF_FUNC_KNB", 37, 3008, 417, 4, 0.1,"UHF" ,"UHF Function Knob")
defineMultipositionSwitch("UHF_MODE_KNB", 37, 3007, 416, 3, 0.1,"UHF" ,"UHF Mode Knob")
definePushButton("UHF_TONE_BTN", 37, 3009, 418, "UHF", "UHF Tone Button")
defineToggleSwitch("UHF_SQUELCH_SW", 37, 3010, 419, "UHF", "UHF SQUELCH Switch")
definePotentiometer("UHF_VOL_KNB", 37, 3011, 420, nil, "UHF", "UHF VOL Knob")
definePushButton("UHF_TEST_BTN", 37, 3012, 421, "UHF", "UHF TEST DISPLAY Button")
definePushButton("UHF_STATUS_BTN", 37, 3013, 422, "UHF", "UHF STATUS Button")
defineToggleSwitch("UHF_DOOR", 37, 3014, 734, "UHF", "UHF Access Door, OPEN/CLOSE")

--IFF Control Panel
defineToggleSwitch("IFF_C_I_KNB", 35, 3001, 542,"IFF" ,"IFF C & I Knob, UFC/BACKUP")
defineMultipositionSwitch("IFF_MASTER_KNB", 35, 3002, 540, 5, 0.1,"IFF" ,"IFF MASTER Knob, OFF/STBY/LOW/NORM/EMER")
define3PosTumb("IFF_M4_CODE_SW", 35, 3003, 541, "IFF", "IFF M-4 CODE Switch, HOLD/ A/B /ZERO")
define3PosTumb("IFF_M4_REPLY_SW", 35, 3004, 543, "IFF", "IFF MODE 4 REPLY Switch, OUT/A/B")
defineToggleSwitch("IFF_M4_MONITOR_SW", 35, 3005, 544,"IFF" ,"IFF MODE 4 MONITOR Switch, OUT/AUDIO")
define3PosTumb("IFF_ENABLE_SW", 35, 3006, 553, "IFF", "IFF ENABLE Switch, M1/M3 /OFF/ M3/MS")
defineRockerSwitch("IFF_M1_SEL_1", 35, 3007, 3007, 3008, 3008, 545, "IFF", "IFF MODE 1 Selector Lever, DIGIT 1")
defineRockerSwitch("IFF_M1_SEL_2", 35, 3009, 3009, 3010, 3010, 547, "IFF", "IFF MODE 1 Selector Lever, DIGIT 2")
defineRockerSwitch("IFF_M3_SEL_1", 35, 3011, 3011, 3012, 3012, 549, "IFF", "IFF MODE 3 Selector Lever, DIGIT 1")
defineRockerSwitch("IFF_M3_SEL_2", 35, 3013, 3013, 3014, 3014, 551, "IFF", "IFF MODE 3 Selector Lever, DIGIT 2")

--KY-58
defineMultipositionSwitch("KY58_MODE_KNB", 42, 3001, 705, 4, 0.1,"KY-58" ,"KY-58 MODE Knob, P/C/LD/RV")
definePotentiometer("KY58_VOL_KNB", 42, 3005, 708, nil, "KY-58", "KY-58 VOLUME Knob")
defineMultipositionSwitch("KY58_FILL_KNB", 42, 3002, 706, 8, 0.1,"KY-58" ,"KY-58 FILL Knob, Z 1-5/1/2/3/4/5/6/Z ALL")
defineMultipositionSwitch("KY58_PWR_KNB", 42, 3004, 707, 3, 0.5,"KY-58" ,"KY-58 Power Knob, OFF/ON/TD")
define3PosTumb("PLAIN_CIPHER_SW", 39, 3016, 701, "KY-58", "PLAIN Cipher Switch, CRAD 1/PLAIN/CRAD 2")
defineToggleSwitch("ZEROIZE_SW_COVER", 39, 3017, 694,"KY-58" ,"ZEROIZE Switch Cover, OPEN/CLOSE")
define3PosTumb("ZEROIZE_SW", 39, 3018, 695, "KY-58", "ZEROIZE Switch, OFP/OFF/DATA")

--HMCS
definePotentiometer("HMCS_INT_KNB", 30, 3001, 392, nil, "HMCS", "HMCS SYMBOLOGY INT Knob")

--RWR
definePotentiometer("RWR_INTENS_KNB", 33, 3001, 140, nil, "RWR", "RWR Intensity Knob - Rotate to adjust brightness")
definePushButton("RWR_HANDOFF_BTN", 33, 3002, 141, "RWR", "RWR Indicator Control HANDOFF Button")
definePushButton("RWR_LAUNCH_BTN", 33, 3003, 143, "RWR", "RWR Indicator Control LAUNCH Button")
definePushButton("RWR_MODE_BTN", 33, 3004, 145, "RWR", "RWR Indicator Control MODE Button")
definePushButton("RWR_UNKNOWN_SHIP_BTN", 33, 3005, 147, "RWR", "RWR Indicator Control UNKNOWN SHIP Button")
definePushButton("RWR_SYS_TEST_BTN", 33, 3006, 149, "RWR", "RWR Indicator Control SYS TEST Button")
definePushButton("RWR_T_BTN", 33, 3007, 151, "RWR", "RWR Indicator Control T Button")
definePotentiometer("RWR_IND_DIM_KNB", 33, 3008, 404, nil, "RWR", "RWR Indicator Control DIM Knob - Rotate to adjust brightness")
definePushButton("RWR_SEARCH_BTN", 33, 3009, 395, "RWR", "RWR Indicator Control SEARCH Button")
definePushButton("RWR_ACT_PWR_BTN", 33, 3010, 397, "RWR", "RWR Indicator Control ACT/PWR Button")
definePushButton("RWR_ALT_BTN", 33, 3012, 399, "RWR", "RWR Indicator Control ALTITUDE Button")
defineToggleSwitch("RWR_PWR_BTN", 33, 3011, 401, "RWR", "RWR Indicator Control POWER Button")

--CMDS
definePushButton("CMDS_DISPENSE_BTN", 32, 3011, 604, "CMDS", "CHAFF/FLARE Dispense Button - Push to dispense")
defineToggleSwitch("CMDS_PWR_SOURCHE_SW", 32, 3001, 375, "CMDS", "CMDS RWR Source Switch, ON/OFF")
defineToggleSwitch("CMDS_JMR_SOURCHE_SW", 32, 3002, 374, "CMDS", "CMDS JMR Source Switch, ON/OFF")
defineToggleSwitch("CMDS_MWS_SOURCHE_SW", 32, 3003, 373, "CMDS", "CMDS MWS Source Switch, ON/OFF")
defineToggleSwitch("CMDS_JETT_SW", 32, 3004, 371, "CMDS", "Jettison Switch, JETT/OFF")
defineToggleSwitch("CMDS_01_EXP_CAT_SW", 32, 3005, 365, "CMDS", "CMDS O1 Expendable Category Switch, ON/OFF")
defineToggleSwitch("CMDS_02_EXP_CAT_SW", 32, 3006, 366, "CMDS", "CMDS O2 Expendable Category Switch, ON/OFF")
defineToggleSwitch("CMDS_CH_EXP_CAT_SW", 32, 3007, 367, "CMDS", "CMDS CH Expendable Category Switch, ON/OFF")
defineToggleSwitch("CMDS_FL_EXP_CAT_SW", 32, 3008, 368, "CMDS", "CMDS FL Expendable Category Switch, ON/OFF")
defineMultipositionSwitch("CMDS_PROG_KNB", 32, 3009, 377, 5, 0.1,"CMDS" ,"CMDS PROGRAM Knob, BIT/1/2/3/4")
defineMultipositionSwitch("CMDS_MODE_KNB", 32, 3010, 378, 6, 0.1,"CMDS" ,"CMDS MODE Knob, OFF/STBY/MAN/SEMI/AUTO/BYP")

--MFD Left
definePushButton("MFD_L_1", 24, 3001, 300,"MFD Left" , "MFD Left Button 1")
definePushButton("MFD_L_2", 24, 3002, 301,"MFD Left" , "MFD Left Button 2")
definePushButton("MFD_L_3", 24, 3003, 302,"MFD Left" , "MFD Left Button 3")
definePushButton("MFD_L_4", 24, 3004, 303,"MFD Left" , "MFD Left Button 4")
definePushButton("MFD_L_5", 24, 3005, 304,"MFD Left" , "MFD Left Button 5")
definePushButton("MFD_L_6", 24, 3006, 305,"MFD Left" , "MFD Left Button 6")
definePushButton("MFD_L_7", 24, 3007, 306,"MFD Left" , "MFD Left Button 7")
definePushButton("MFD_L_8", 24, 3008, 307,"MFD Left" , "MFD Left Button 8")
definePushButton("MFD_L_9", 24, 3009, 308,"MFD Left" , "MFD Left Button 9")
definePushButton("MFD_L_10", 24, 3010, 309,"MFD Left" , "MFD Left Button 10")
definePushButton("MFD_L_11", 24, 3011, 310,"MFD Left" , "MFD Left Button 11")
definePushButton("MFD_L_12", 24, 3012, 311,"MFD Left" , "MFD Left Button 12")
definePushButton("MFD_L_13", 24, 3013, 312,"MFD Left" , "MFD Left Button 13")
definePushButton("MFD_L_14", 24, 3014, 313,"MFD Left" , "MFD Left Button 14")
definePushButton("MFD_L_15", 24, 3015, 314,"MFD Left" , "MFD Left Button 15")
definePushButton("MFD_L_16", 24, 3016, 315,"MFD Left" , "MFD Left Button 16")
definePushButton("MFD_L_17", 24, 3017, 316,"MFD Left" , "MFD Left Button 17")
definePushButton("MFD_L_18", 24, 3018, 317,"MFD Left" , "MFD Left Button 18")
definePushButton("MFD_L_19", 24, 3019, 318,"MFD Left" , "MFD Left Button 19")
definePushButton("MFD_L_20", 24, 3020, 319,"MFD Left" , "MFD Left Button 20")
defineRockerSwitch("MFD_L_GAIN_SW", 24, 3021, 3021, 3022, 3022, 320, "MFD Left", "MFD Left GAIN Rocker Switch")
defineRockerSwitch("MFD_L_SYM_SW", 24, 3023, 3023, 3024, 3024, 321, "MFD Left", "MFD Left SYM Rocker Switch")
defineRockerSwitch("MFD_L_CON_SW", 24, 3025, 3025, 3026, 3026, 322, "MFD Left", "MFD Left CON Rocker Switch")
defineRockerSwitch("MFD_L_BRT_SW", 24, 3027, 3027, 3028, 3028, 323, "MFD Left", "MFD Left BRT Rocker Switch")

--MFD Right
definePushButton("MFD_R_1", 25, 3001, 326,"MFD Right" , "MFD Right Button 1")
definePushButton("MFD_R_2", 25, 3002, 327,"MFD Right" , "MFD Right Button 2")
definePushButton("MFD_R_3", 25, 3003, 328,"MFD Right" , "MFD Right Button 3")
definePushButton("MFD_R_4", 25, 3004, 329,"MFD Right" , "MFD Right Button 4")
definePushButton("MFD_R_5", 25, 3005, 330,"MFD Right" , "MFD Right Button 5")
definePushButton("MFD_R_6", 25, 3006, 331,"MFD Right" , "MFD Right Button 6")
definePushButton("MFD_R_7", 25, 3007, 332,"MFD Right" , "MFD Right Button 7")
definePushButton("MFD_R_8", 25, 3008, 333,"MFD Right" , "MFD Right Button 8")
definePushButton("MFD_R_9", 25, 3009, 334,"MFD Right" , "MFD Right Button 9")
definePushButton("MFD_R_10", 25, 3010, 335,"MFD Right" , "MFD Right Button 10")
definePushButton("MFD_R_11", 25, 3011, 336,"MFD Right" , "MFD Right Button 11")
definePushButton("MFD_R_12", 25, 3012, 337,"MFD Right" , "MFD Right Button 12")
definePushButton("MFD_R_13", 25, 3013, 338,"MFD Right" , "MFD Right Button 13")
definePushButton("MFD_R_14", 25, 3014, 339,"MFD Right" , "MFD Right Button 14")
definePushButton("MFD_R_15", 25, 3015, 340,"MFD Right" , "MFD Right Button 15")
definePushButton("MFD_R_16", 25, 3016, 341,"MFD Right" , "MFD Right Button 16")
definePushButton("MFD_R_17", 25, 3017, 342,"MFD Right" , "MFD Right Button 17")
definePushButton("MFD_R_18", 25, 3018, 343,"MFD Right" , "MFD Right Button 18")
definePushButton("MFD_R_19", 25, 3019, 344,"MFD Right" , "MFD Right Button 19")
definePushButton("MFD_R_20", 25, 3020, 345,"MFD Right" , "MFD Right Button 20")
defineRockerSwitch("MFD_R_GAIN_SW", 25, 3021, 3021, 3022, 3022, 346, "MFD Right", "MFD Right GAIN Rocker Switch")
defineRockerSwitch("MFD_R_SYM_SW", 25, 3023, 3023, 3024, 3024, 347, "MFD Right", "MFD Right SYM Rocker Switch")
defineRockerSwitch("MFD_R_CON_SW", 25, 3025, 3025, 3026, 3026, 348, "MFD Right", "MFD Right CON Rocker Switch")
defineRockerSwitch("MFD_R_BRT_SW", 25, 3027, 3027, 3028, 3028, 349, "MFD Right", "MFD Right BRT Rocker Switch")

--Airspeed/Mach Indicator
defineRotary("AIRSPEED_SET_KNB", 46, 3001, 71, "Airspeed Indicator", "SET INDEX Knob")

--Altimeter
defineRotary("ALT_BARO_SET_KNB", 45, 3003, 62, "Altimeter", "Altimeter Barometric Setting Knob")
defineSpringloaded_3_pos_tumb("ALT_MODE_LV", 45, 3002, 3001, 60, "Altimeter", "Altimeter Mode Lever, ELEC/OFF/PNEU")

--SAI ARU-42/A-2
definePushButton("SAI_CAGE", 47, 3002, 67, "SAI", "SAI Cage Knob, (LMB) Pull to cage")
defineRotary("SAI_PITCH_TRIM", 47, 3003, 66, "SAI", "SAI Cage Knob, (MW) Adjust aircraft reference symbol")

--ADI
defineRotary("ADI_PITCH_TRIM", 50, 3001, 22, "ADI", "ADI Pitch Trim Knob")

--EHSI
definePushButton("EHSI_CRS_SET", 28, 3005, 43,"EHSI" , "EHSI CRS Set")
defineRotary("EHSI_CRS_SET_KNB", 28, 3004, 43, "EHSI", "EHSI CRS Set Knob")
definePushButton("EHSI_HDG_SET_BTN", 28, 3003, 42,"EHSI" , "EHSI HDG Set Button")
defineRotary("EHSI_HDG_SET_KNB", 28, 3002, 44, "EHSI", "EHSI HDG Set Knob")
definePushButton("EHSI_MODE", 28, 3001, 46,"EHSI" , "EHSI Mode (M) Button")

--Clock
defineRotary("CLOCK_WIND", 51, 3002, 625, "Clock", "Clock Wind")
definePushButton("CLOCK_SET", 51, 3001, 626, "Clock", "Clock Setting Knob")
definePushButton("CLOCK_ELAPSED", 51, 3003, 628, "Clock", "Clock Elapsed Time Knob")

--Cockpit Mechanics
defineToggleSwitch("CANOPY_HANDLE", 10, 3004, 600,"Cockpit Mechanics" ,"Canopy Handle, UP/DOWN")
defineSpringloaded_3_pos_tumb("SEAT_ADJ", 10, 3014, 3013, 786, "Cockpit Mechanics", "SEAT ADJ Switch, UP/OFF/DOWN")
defineToggleSwitch("CANOPY_JETT_THANDLE", 10, 3005, 601,"Cockpit Mechanics" ,"CANOPY JETTISON T-Handle, PULL/STOW")
defineToggleSwitch("SEAT_EJECT_SAFE", 10, 3009, 785,"Cockpit Mechanics" ,"Ejection Safety Lever, ARMED/LOCKED")
defineSpringloaded_3_pos_tumb("CANOPY_SW", 10, 3003, 3002, 606, "Cockpit Mechanics", "Canopy Switch, OPEN/HOLD/CLOSE")
defineToggleSwitch("SEAT_EJECT_SAFE", 10, 3009, 785,"Cockpit Mechanics" ,"Ejection Safety Lever, ARMED/LOCKED")
defineToggleSwitch("HIDE_STICK", 10, 3015, 796,"Cockpit Mechanics" ,"Hide Stick toggle")
------------------------------------------------------------------Warning, Caution and Indicator Lights-------------------------------------------------------------

--Caution Light Panel
defineIndicatorLight("LIGHT_FLCS_FAULT", 630, "Warning, Caution and IndicatorLights","FLCS FAULT Light (yellow)")
defineIndicatorLight("LIGHT_ENGINE_FAULT", 631, "Warning, Caution and IndicatorLights","ENGINE FAULT Light (yellow)")
defineIndicatorLight("LIGHT_AVIONICS_FAULT", 632, "Warning, Caution and IndicatorLights","AVIONICS FAULT Light (yellow)")
defineIndicatorLight("LIGHT_SEAT_NOT", 633, "Warning, Caution and IndicatorLights","SEAT NOT ARMED Light (yellow)")
defineIndicatorLight("LIGHT_ELEC_SYS", 634, "Warning, Caution and IndicatorLights","ELEC SYS Light (yellow)")
defineIndicatorLight("LIGHT_SEC", 635, "Warning, Caution and IndicatorLights","SEC Light (yellow)")
defineIndicatorLight("LIGHT_EQUIP_HOT", 636, "Warning, Caution and IndicatorLights","EQUIP HOT Light (yellow)")
defineIndicatorLight("LIGHT_NWS_FAIL", 637, "Warning, Caution and IndicatorLights","NWS FAIL Light (yellow)")
defineIndicatorLight("LIGHT_PROBE_HEAT", 638, "Warning, Caution and IndicatorLights","PROBE HEAT Light (yellow)")
defineIndicatorLight("LIGHT_FUEL_OIL_HOT", 639, "Warning, Caution and IndicatorLights","FUEL OIL HOT Light (yellow)")
defineIndicatorLight("LIGHT_RADAR_ALT", 640, "Warning, Caution and IndicatorLights","RADAR ALT Light (yellow)")
defineIndicatorLight("LIGHT_ANTI_SKID", 641, "Warning, Caution and IndicatorLights","ANTI SKID Light (yellow)")
defineIndicatorLight("LIGHT_CADC", 642, "Warning, Caution and IndicatorLights","CADC Light (yellow)")
defineIndicatorLight("LIGHT_INLET_ICING", 643, "Warning, Caution and IndicatorLights","INLET ICING Light (yellow)")
defineIndicatorLight("LIGHT_IFF", 644, "Warning, Caution and IndicatorLights","IFF Light (yellow)")
defineIndicatorLight("LIGHT_HOOK", 645, "Warning, Caution and IndicatorLights","HOOK Light (yellow)")
defineIndicatorLight("LIGHT_STORES_CONFIG", 646, "Warning, Caution and IndicatorLights","STORES CONFIG Light (yellow)")
defineIndicatorLight("LIGHT_OVERHEAT", 647, "Warning, Caution and IndicatorLights","OVERHEAT Light (yellow)")
defineIndicatorLight("LIGHT_NUCLEAR", 648, "Warning, Caution and IndicatorLights","NUCLEAR Light (yellow)")
defineIndicatorLight("LIGHT_OBOGS", 649, "Warning, Caution and IndicatorLights","OBOGS Light (yellow)")
defineIndicatorLight("LIGHT_ATF_NOT", 650, "Warning, Caution and IndicatorLights","ATF NOT ENGAGED Light (yellow)")
defineIndicatorLight("LIGHT_EEC", 651, "Warning, Caution and IndicatorLights","EEC Light (yellow)")
defineIndicatorLight("LIGHT_CAUTION_1", 652, "Warning, Caution and IndicatorLights","1. Caution - Light (yellow)")
defineIndicatorLight("LIGHT_CABIN_PRESS", 653, "Warning, Caution and IndicatorLights","CABIN PRESS Light (yellow)")
defineIndicatorLight("LIGHT_FWD_FUEL_LOW", 654, "Warning, Caution and IndicatorLights","FWD FUEL LOW Light (yellow)")
defineIndicatorLight("LIGHT_BUC", 655, "Warning, Caution and IndicatorLights","BUC Light (yellow)")
defineIndicatorLight("LIGHT_CAUTION_2", 656, "Warning, Caution and IndicatorLights","2. Caution - Light (yellow)")
defineIndicatorLight("LIGHT_CAUTION_3", 657, "Warning, Caution and IndicatorLights","3. Caution - Light (yellow)")
defineIndicatorLight("LIGHT_AFT_FUEL_LOW", 658, "Warning, Caution and IndicatorLights","AFT FUEL LOW Light (yellow)")
defineIndicatorLight("LIGHT_CAUTION_4", 659, "Warning, Caution and IndicatorLights","4. Caution - Light (yellow)")
defineIndicatorLight("LIGHT_CAUTION_5", 660, "Warning, Caution and IndicatorLights","5. Caution - Light (yellow)")
defineIndicatorLight("LIGHT_CAUTION_6", 661, "Warning, Caution and IndicatorLights","6. Caution - Light  (yellow)")

--Edge of glareshield
defineIndicatorLight("LIGHT_MASTER_CAUTION", 117, "Warning, Caution and IndicatorLights","MASTER CAUTION Light (yellow)")
defineIndicatorLight("LIGHT_EDGE", 119, "Warning, Caution and IndicatorLights","Edge - Light (red)")
defineIndicatorLight("LIGHT_TF_FAIL", 121, "Warning, Caution and IndicatorLights","TF FAIL Light (red)")
defineIndicatorLight("LIGHT_ENG_FIRE", 126, "Warning, Caution and IndicatorLights","ENG FIRE Light (red)")
defineIndicatorLight("LIGHT_ENGINE", 127, "Warning, Caution and IndicatorLights","ENGINE Light (red)")
defineIndicatorLight("LIGHT_HYD_OIL_PRESS", 129, "Warning, Caution and IndicatorLights","HYD_OIL_PRESS Light (red)")
defineIndicatorLight("LIGHT_FLCS", 130, "Warning, Caution and IndicatorLights","FLCS Light (red)")
defineIndicatorLight("LIGHT_DBU_ON", 131, "Warning, Caution and IndicatorLights","DBU ON Light (red)")
defineIndicatorLight("LIGHT_TO_LDG_CONFIG", 133, "Warning, Caution and IndicatorLights","TO LDG CONFIG Light (red)")
defineIndicatorLight("LIGHT_CANOPY", 134, "Warning, Caution and IndicatorLights","CANOPY Light (red)")
defineIndicatorLight("LIGHT_OXY_LOW", 135, "Warning, Caution and IndicatorLights","OXY LOW Light (red)")

--AOA Indexer
defineIndicatorLight("LIGHT_AOA_UP", 110, "Warning, Caution and IndicatorLights","AoA Light up (red)")
defineIndicatorLight("LIGHT_AOA_MID", 111, "Warning, Caution and IndicatorLights","AoA Light mid (green)")
defineIndicatorLight("LIGHT_AOA_DN", 112, "Warning, Caution and IndicatorLights","AoA Light down (yellow)")

--LG Control Panel
defineIndicatorLight("LIGHT_GEAR_N", 350, "Warning, Caution and IndicatorLights","Nose Gear Light (green)")
defineIndicatorLight("LIGHT_GEAR_L", 351, "Warning, Caution and IndicatorLights","Left Gear Light (green)")
defineIndicatorLight("LIGHT_GEAR_R", 352, "Warning, Caution and IndicatorLights","Right Gear Light (green)")
defineIndicatorLight("LIGHT_GEAR_WARN", 369, "Warning, Caution and IndicatorLights","Gear Warning Light (red)")

--AR Status/NWS Indicator
defineIndicatorLight("LIGHT_RDY", 113, "Warning, Caution and IndicatorLights","RDY Light (blue)")
defineIndicatorLight("LIGHT_AR_NWS", 114, "Warning, Caution and IndicatorLights","AR NWS Light (green)")
defineIndicatorLight("LIGHT_DISC", 115, "Warning, Caution and IndicatorLights","DISC Light (red)")

--Eng Control Panel
defineIndicatorLight("LIGHT_JFS_RUN", 446, "Warning, Caution and IndicatorLights","JFS RUN Light (green)")

--EPU Control Panel
defineIndicatorLight("LIGHT_HYDRAZN", 524, "Warning, Caution and IndicatorLights","HYDRAZN Light (yellow)")
defineIndicatorLight("LIGHT_AIR", 523, "Warning, Caution and IndicatorLights","AIR Light (yellow)")
defineIndicatorLight("LIGHT_EPU", 526, "Warning, Caution and IndicatorLights","EPU Light (green)")

--Elec Control Panel
defineIndicatorLight("LIGHT_FLCS_PMG", 513, "Warning, Caution and IndicatorLights","FLCS PMG Light (yellow)")
defineIndicatorLight("LIGHT_MAIN_GEN", 512, "Warning, Caution and IndicatorLights","MAIN GEN Light (yellow)")
defineIndicatorLight("LIGHT_STBY_GEN", 515, "Warning, Caution and IndicatorLights","STBY GEN Light (yellow)")
defineIndicatorLight("LIGHT_ELEC", 514, "Warning, Caution and IndicatorLights","Elec - Light (red)")
defineIndicatorLight("LIGHT_EPU_GEN", 517, "Warning, Caution and IndicatorLights","EPU GEN Light (yellow)")
defineIndicatorLight("LIGHT_EPU_PMG", 516, "Warning, Caution and IndicatorLights","EPU PMG Light (yellow)")
defineIndicatorLight("LIGHT_TO_FLCS", 519, "Warning, Caution and IndicatorLights","TO FLCS Light (yellow)")
defineIndicatorLight("LIGHT_FLCS_RLY", 518, "Warning, Caution and IndicatorLights","FLCS RLY Light (yellow)")
defineIndicatorLight("LIGHT_ACFT_BATT_FAIL", 521, "Warning, Caution and IndicatorLights","ACFT BATT FAIL Light (yellow)")

--Advance Mode Switch
defineIndicatorLight("LIGHT_ACTIVE", 106, "Warning, Caution and IndicatorLights","ACTIVE Light (green)")
defineIndicatorLight("LIGHT_STBY", 107, "Warning, Caution and IndicatorLights","STBY Light (yellow)")

--FLCP
defineIndicatorLight("LIGHT_FL_RUN", 570, "Warning, Caution and IndicatorLights","FL RUN Light (green)")
defineIndicatorLight("LIGHT_FL_FAIL", 571, "Warning, Caution and IndicatorLights","FL FAIL Light (red)")

--Test Switch Panel
defineIndicatorLight("LIGHT_FLCS_PWR_A", 581, "Warning, Caution and IndicatorLights","FLCS PWR A Light (green)")
defineIndicatorLight("LIGHT_FLCS_PWR_B", 582, "Warning, Caution and IndicatorLights","FLCS PWR B Light (green)")
defineIndicatorLight("LIGHT_FLCS_PWR_C", 583, "Warning, Caution and IndicatorLights","FLCS PWR C Light (green)")
defineIndicatorLight("LIGHT_FLCS_PWR_D", 584, "Warning, Caution and IndicatorLights","FLCS PWR D Light (green)")

--RWR button lights
defineIndicatorLight("LIGHT_RWR_SEARCH", 396, "Warning, Caution and IndicatorLights","RWR SEARCH Light (green)")
defineIndicatorLight("LIGHT_RWR_ACTIVITY", 398, "Warning, Caution and IndicatorLights","RWR ACTIVITY Light (yellow)")
defineIndicatorLight("LIGHT_RWR_ACT_POWER", 423, "Warning, Caution and IndicatorLights","RWR ACT POWER Light (green)")
defineIndicatorLight("LIGHT_RWR_ALT_LOW", 400, "Warning, Caution and IndicatorLights","RWR ALT LOW Light (yellow)")
defineIndicatorLight("LIGHT_RWR_ALT", 424, "Warning, Caution and IndicatorLights","RWR ALT Light (green)")
defineIndicatorLight("LIGHT_RWR_POWER", 402, "Warning, Caution and IndicatorLights","RWR POWER Light (green)")
defineIndicatorLight("LIGHT_RWR_HANDOFF_UP", 142, "Warning, Caution and IndicatorLights","RWR HANDOFF UP Light (green)")
defineIndicatorLight("LIGHT_RWR_HANDOFF_H", 136, "Warning, Caution and IndicatorLights","RWR HANDOFF H Light (green)")
defineIndicatorLight("LIGHT_RWR_MSL_LAUNCH", 144, "Warning, Caution and IndicatorLights","RWR MSL_LAUNCH Light (red)")
defineIndicatorLight("LIGHT_RWR_MODE_PRI", 146, "Warning, Caution and IndicatorLights","RWR MODE PRI Light (green)")
defineIndicatorLight("LIGHT_RWR_MODE_OPEN", 137, "Warning, Caution and IndicatorLights","RWR MODE OPEN Light (green)")
defineIndicatorLight("LIGHT_RWR_SHIP_UNK", 148, "Warning, Caution and IndicatorLights","RWR SHIP UNKNOWN Light (green)")
defineIndicatorLight("LIGHT_RWR_SYSTEST", 150, "Warning, Caution and IndicatorLights","RWR SYSTEST Light (green)")
defineIndicatorLight("LIGHT_RWR_TGTSEP_UP", 152, "Warning, Caution and IndicatorLights","RWR TGTSEP UP Light (green)")
defineIndicatorLight("LIGHT_RWR_TGTSEP_DN", 138, "Warning, Caution and IndicatorLights","RWR TGTSEP DOWN Light (green)")

--CMDS lights
defineIndicatorLight("LIGHT_CMDS_NO_GO", 370, "Warning, Caution and IndicatorLights","CMDS NO GO Light (green)")
defineIndicatorLight("LIGHT_CMDS_GO", 372, "Warning, Caution and IndicatorLights","CMDS GO Light (green)")
defineIndicatorLight("LIGHT_CMDS_DISP", 376, "Warning, Caution and IndicatorLights","CMDS DISP Light (green)")
defineIndicatorLight("LIGHT_CMDS_RDY", 379, "Warning, Caution and IndicatorLights","CMDS RDY Light (green)")

--Interior lighting
defineIndicatorLight("LIGHT_CONSLES", 788, "Warning, Caution and IndicatorLights","Consoles Lightning (green)")
defineIndicatorLight("LIGHT_INST_PNL", 787, "Warning, Caution and IndicatorLights","Instrumen Panel Lightning (green)")
defineIndicatorLight("LIGHT_CONSLES_FLOOD", 790, "Warning, Caution and IndicatorLights","Consoles Flood Lightning (green)")
defineIndicatorLight("LIGHT_INST_PNL_FLOOD", 791, "Warning, Caution and IndicatorLights","Instrumen Panel Flood Lightning (green)")

--ECM
defineIndicatorLight("LIGHT_ECM_1_S", 461, "Warning, Caution and IndicatorLights","ECM Button 1 S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_1_A", 462, "Warning, Caution and IndicatorLights","ECM Button 1 A Light (green)")
defineIndicatorLight("LIGHT_ECM_1_F", 463, "Warning, Caution and IndicatorLights","ECM Button 1 F Light (red)")
defineIndicatorLight("LIGHT_ECM_1_T", 464, "Warning, Caution and IndicatorLights","ECM Button 1 T Light (blue)")
defineIndicatorLight("LIGHT_ECM_2_S", 466, "Warning, Caution and IndicatorLights","ECM Button 2 S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_2_A", 467, "Warning, Caution and IndicatorLights","ECM Button 2 A Light (green)")
defineIndicatorLight("LIGHT_ECM_2_F", 468, "Warning, Caution and IndicatorLights","ECM Button 2 F Light (red)")
defineIndicatorLight("LIGHT_ECM_2_T", 469, "Warning, Caution and IndicatorLights","ECM Button 2 T Light (blue)")
defineIndicatorLight("LIGHT_ECM_3_S", 471, "Warning, Caution and IndicatorLights","ECM Button 3 S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_3_A", 472, "Warning, Caution and IndicatorLights","ECM Button 3 A Light (green)")
defineIndicatorLight("LIGHT_ECM_3_F", 473, "Warning, Caution and IndicatorLights","ECM Button 3 F Light (red)")
defineIndicatorLight("LIGHT_ECM_3_T", 474, "Warning, Caution and IndicatorLights","ECM Button 3 T Light (blue)")
defineIndicatorLight("LIGHT_ECM_4_S", 476, "Warning, Caution and IndicatorLights","ECM Button 4 S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_4_A", 477, "Warning, Caution and IndicatorLights","ECM Button 4 A Light (green)")
defineIndicatorLight("LIGHT_ECM_4_F", 478, "Warning, Caution and IndicatorLights","ECM Button 4 F Light (red)")
defineIndicatorLight("LIGHT_ECM_4_T", 479, "Warning, Caution and IndicatorLights","ECM Button 4 T Light (blue)")
defineIndicatorLight("LIGHT_ECM_5_S", 481, "Warning, Caution and IndicatorLights","ECM Button 5 S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_5_A", 482, "Warning, Caution and IndicatorLights","ECM Button 5 A Light (green)")
defineIndicatorLight("LIGHT_ECM_5_F", 483, "Warning, Caution and IndicatorLights","ECM Button 5 F Light (red)")
defineIndicatorLight("LIGHT_ECM_5_T", 484, "Warning, Caution and IndicatorLights","ECM Button 5 T Light (blue)")
defineIndicatorLight("LIGHT_ECM_S", 486, "Warning, Caution and IndicatorLights","ECM Button S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_A", 487, "Warning, Caution and IndicatorLights","ECM Button A Light (green)")
defineIndicatorLight("LIGHT_ECM_F", 488, "Warning, Caution and IndicatorLights","ECM Button F Light (red)")
defineIndicatorLight("LIGHT_ECM_T", 489, "Warning, Caution and IndicatorLights","ECM Button T Light (blue)")
defineIndicatorLight("LIGHT_ECM_FRM_S", 491, "Warning, Caution and IndicatorLights","ECM Button FRM S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_FRM_A", 492, "Warning, Caution and IndicatorLights","ECM Button FRM A Light (green)")
defineIndicatorLight("LIGHT_ECM_FRM_F", 493, "Warning, Caution and IndicatorLights","ECM Button FRM F Light (red)")
defineIndicatorLight("LIGHT_ECM_FRM_T", 494, "Warning, Caution and IndicatorLights","ECM Button FRM T Light (blue)")
defineIndicatorLight("LIGHT_ECM_SPL_S", 496, "Warning, Caution and IndicatorLights","ECM Button SPL S Light (yellow)")
defineIndicatorLight("LIGHT_ECM_SPL_A", 497, "Warning, Caution and IndicatorLights","ECM Button SPL A Light (green)")
defineIndicatorLight("LIGHT_ECM_SPL_F", 498, "Warning, Caution and IndicatorLights","ECM Button SPL F Light (red)")
defineIndicatorLight("LIGHT_ECM_SPL_T", 499, "Warning, Caution and IndicatorLights","ECM Button SPL T Light (blue)")

--Div
defineIndicatorLight("LIGHT_MARKER_BEACON", 157, "Warning, Caution and IndicatorLights","MARKER BEACON Light (green)")

------------------------------------------------------------------Gauges--------------------------------------------------------------------------------------------
defineFloat("CANOPY_VALUE", 7, {0.0, 1.0}, "Cockpit Mechanics", "Canopy Position")
defineFloat("SEAT_HEIGHT", 783, {-1.0, 1.0}, "Cockpit Mechanics", "Seat Height")

--AOA				
defineFloat("AOA_VALUE", 15, {-1.0, 1.0}, "AoA", "AoA Value")

--Altimeter AAU-34/A
defineFloat("ALT_100_FT_PTR", 51, {0, 1}, "Altimeter", "Altimeter 100 ft pointer")
defineFloat("ALT_10000_FT_CNT", 52, {0, 1}, "Altimeter", "Altimeter 10000 ft count")
defineFloat("ALT_1000_FT_CNT", 53, {0, 1}, "Altimeter", "Altimeter 1000 ft count")
defineFloat("ALT_100_FT_CNT", 54, {0, 1}, "Altimeter", "Altimeter 100 ft count")
defineFloat("ALT_PRESSURE_DRUM_0_CNT", 59, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 0")
defineFloat("ALT_PRESSURE_DRUM_1_CNT", 58, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 1")
defineFloat("ALT_PRESSURE_DRUM_2_CNT", 57, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 2")
defineFloat("ALT_PRESSURE_DRUM_3_CNT", 56, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 3")
defineFloat("ALT_PNEU_FLAG", 61, {0, 1}, "Altimeter", "Altimeter PNEU Flag")

--AirSpeed/Mach Indicator
defineFloat("AIRSPEED", 48, {0.0, 1.0}, "Airspeed Indicator", "Airspeed Indicator")
defineFloat("MAX_AIRSPEED", 47, {0.0, 1.0}, "Airspeed Indicator", "Max Airspeed")
defineFloat("SET_AIRSPEED", 70, {0, 1}, "Airspeed Indicator", "Set Airspeed")
defineFloat("MACH_INDICATOR", 49, {0.0, 1.0}, "Airspeed Indicator", "Mach Indicator")

--Standby Attitude Indicator
defineFloat("SAI_PITCH", 63, {-1.0, -0.902, -0.793, -0.687, -0.576, -0.450, -0.339, -0.225, -0.115, 0.0, 0.114, 0.225, 0.336, 0.445, 0.569, 0.679, 0.784, 0.893, 0.995}, "SAI", " SAI Pitch")
defineFloat("SAI_BANK", 64, {1.0, -1.0}, "SAI", "SAI Bank")
defineFloat("SAI_OFF_FLAG", 65, {0, 1}, "SAI", "SAI Off Flag")
defineFloat("SAI_AIRCRAFTREFERENCESYMBOL", 68, {-1, 1}, "SAI", "SAI Aircraft Reference Symbol")
defineFloat("SAI_KNB_ARROW", 69, {-1, 1}, "SAI", "SAI Knob Arrow")

--Vertical Velocity Indicator
defineFloat("VVI", 16, {-1.0, 1.0}, "Vertical Velocity Indicator", "VVI")

--Attitude Director Indicator (ADI)
defineFloat("ADI_PITCH", 17, {-1, 1}, "ADI", "ADI Pitch")
defineFloat("ADI_BANK", 18, {-1, 1}, "ADI", "ADI Bank")
defineFloat("ADI_OFF_FLAG", 25, {0.0, 1.0}, "ADI", "ADI Off Flag")
defineFloat("ADI_LOC_FLAG", 13, {0.0, 1.0}, "ADI", "ADI LOC Flag")
defineFloat("ADI_AUX_FLAG", 14, {0.0, 1.0}, "ADI", "ADI AUX Flag")
defineFloat("ADI_GS_FLAG", 26, {0.0, 1.0},"ADI", "ADI GS Flag")
defineFloat("ADI_LOC_BAR", 20, {-1, 1}, "ADI", "ADI LOC Bar")
defineFloat("ADI_GS_BAR", 21, {-1, 1}, "ADI", "ADI GS Bar")
defineFloat("ADI_TURNRATE", 23, {-3, 3}, "ADI", "ADI TurnRate")
defineFloat("ADI_GS_POINTER", 27, {-1, 1}, "ADI", "ADI GS Pointer")
defineFloat("ADI_BUBBLE", 24, {-1, 1}, "ADI", "ADI Bubble")

--Trim Indicators
defineFloat("ROLLTRIMIND", 561, {-1, 1}, "Trim Indicators", "Roll Trim Indicator")
defineFloat("PITCHTRIMIND", 563, {-1, 1}, "Trim Indicators", "Pitch Trim Indicator")

--Speed brake indicator
defineFloat("SPEEDBRAKE_INDICATOR", 363, {-1.0, 1.0}, "Speed Brake", "Speed Brake Indicator")

--Hydraulic Pressure Indicators
defineFloat("SYSA_PRESSURE", 615, {0.0, 1.0}, "Hydraulic Pressure Indicators", "System A Pressure")
defineFloat("SYSB_PRESSURE", 616, {0.0, 1.0}, "Hydraulic Pressure Indicators", "System B Pressure")

--Engine Indicators
defineFloat("ENGINE_OIL_PRESSURE", 93, {0, 1}, "Engine", "Oil Pressure Indicator")
defineFloat("ENGINE_NOZZLE_POSITION", 94, {0.0, 1.0}, "Engine", "Engine Nozzle Position Indicator")
defineFloat("ENGINE_TACHOMETER", 95, {0.0, 1.0}, "Engine", "Engine Tachometer Indicator")
defineFloat("ENGINE_FTIT", 96, {0.0, 1.0}, "Engine", "Engine FTIT Indicator")

--Hydrazin Volume
defineFloat("HYDRAZIN_VOLUME", 617, {0.0, 1.0}, "EPU", "Hydrazin Volume Indicator")

--Fuel Flow Indicator Counter
defineFloat("FUELFLOWCOUNTER_10K", 88, {0, 1}, "Fuel System", "Fuel Flow Counter 10k")
defineFloat("FUELFLOWCOUNTER_1K", 89, {0, 1}, "Fuel System", "Fuel Flow Counter 1k")
defineFloat("FUELFLOWCOUNTER_100", 90, {0, 1}, "Fuel System", "Fuel Flow Counter 100")

--Fuel Quantity Indicator (Dual)
defineFloat("FUEL_AL", 613, {0.0, 1.0}, "Fuel System", "Fuel Quantity Indicator AL")
defineFloat("FUEL_FR", 614, {0.0, 1.0}, "Fuel System", "Fuel Quantity Indicator FR")
defineFloat("FUELTOTALIZER_10K", 730, {0, 1}, "Fuel System", "Fuel Totalizer Counter 10K")
defineFloat("FUELTOTALIZER_1K", 731, {0, 1}, "Fuel System", "Fuel Totalizer Counter 1K")
defineFloat("FUELTOTALIZER_100", 732, {0, 1}, "Fuel System", "Fuel Totalizer Counter 100")

--ECS Cabin Pressure Altimeter
defineFloat("COCKPIT_ALITITUDE", 618, {0.0,	0.094, 0.194, 0.294, 0.394,	0.496, 0.597, 0.698, 0.798,	0.899, 1.0}, "Oxygen System", "Cabin Pressure Altimeter")

--Oxygen Pressure Indicator
defineFloat("OXYGEN_PRESSURE", 729, {0.0, 1.0}, "Oxygen System", "Oxygen Pressure")
defineFloat("FLOW_INDICATOR", 725, {0, 1}, "Oxygen System", "Flow Indicator Gauge")
defineIndicatorLight("FLOW_INDICATOR_LIGHT", 725, "Oxygen System", "Flow Indicator Light")

--IFF
defineFloat("IFF_CODE_DRUM_DIGIT_1", 546, {0, 1}, "IFF", "IFF Code Digit 1")
defineFloat("IFF_CODE_DRUM_DIGIT_2", 548, {0, 1}, "IFF", "IFF Code Digit 2")
defineFloat("IFF_CODE_DRUM_DIGIT_3", 550, {0, 1}, "IFF", "IFF Code Digit 3")
defineFloat("IFF_CODE_DRUM_DIGIT_4", 552, {0, 1}, "IFF", "IFF Code Digit 4")

--Clock
defineFloat("CLOCK_CURRTIME_H", 621, {0, 1}, "Clock", "Current Time Hours")
defineFloat("CLOCK_CURRTIME_MS", 622, {0, 1}, "Clock", "Current Time Minutes")
defineFloat("CLOCK_ELAPSED_TIME_M", 623, {0, 1}, "Clock", "Elapsed Time Minutes")
defineFloat("CLOCK_ELAPSED_TIME_SEC", 624, {0, 1}, "Clock", "Elapsed Time Seconds")

------------------------------------------------------------------DED Display by Matchstick ------------------------------------------------------------------------
------------------------------------------------------------------DED Layout Information----------------------------------------------------------------------------
local DEDLayout_l1={}
local DEDLayout_l2={}
local DEDLayout_l3={}
local DEDLayout_l4={}
local DEDLayout_l5={}

--CNI
DEDLayout_l1["UHF Mode Rotary"]={1,3}
DEDLayout_l1["UHF IncDecSymbol"]={5,1}
DEDLayout_l1["Selected UHF Frequency"]={6,6}
DEDLayout_l1["Steerpoint Use"]={14,4}
DEDLayout_l1["WPT IncDecSymbol"]={19,1}
DEDLayout_l1["Selected Steerpoint"] = {20,3}
--COM
DEDLayout_l1["Secure Voice"] = {1,3}
DEDLayout_l1["COM 1 Mode"] = {5,3}
DEDLayout_l1["Receiver Mode"] = {13,4}
DEDLayout_l1["COM 1 Power Status"] = {13,2}
DEDLayout_l1["COM 2 Mode"] = {9,3}
DEDLayout_l1["COM 2 Mode Voice"] = {8,3}
DEDLayout_l1["Receiver Power Status"] = {15,2}
DEDLayout_l1["GUARD VHF Label"] = {8,3}
DEDLayout_l1["GUARD COM 2 Receiver Mode"] = {13,2}
--IFF
DEDLayout_l1["STAT IFF label"] = {1,3}
DEDLayout_l1["STAT IFF Power Status"] = {5,3}
DEDLayout_l1["STAT Mode label"] = {12,3}
DEDLayout_l1["STAT Event Occured"] = {18,3}
DEDLayout_l1["POS IFF label"] = {1,3}
DEDLayout_l1["POS IFF Power Status"] = {5,3,0,"","I"}
DEDLayout_l1["POS Event Occured"] = {18,3,0,"","I"}
DEDLayout_l1["POS Mode Group State"] = {22,1}
DEDLayout_l1["POS IncDec Symbol"] = {23,1}
DEDLayout_l1["TIM IFF label"] = {1,3}
DEDLayout_l1["TIM IFF Power Status"] = {5,3}
DEDLayout_l1["TIM Event Occured"] = {18,3,0,"","I"}
DEDLayout_l1["TIM Code Group State"] = {22,1}
DEDLayout_l1["TIM IncDec Symbol"] = {23,1}
DEDLayout_l1["IFF label"] = {8,3}
DEDLayout_l1["IFF Status"] = {12,4}
--List
DEDLayout_l1["LIST Label"] = {10,4}
--T-ILS
DEDLayout_l1["TCN Label"]={1,3}
DEDLayout_l1["TCN Mode"]={5,3}
DEDLayout_l1["TCN BIG OFF Label"]={5,3,0,"","B","OFF"}
DEDLayout_l1["ILS Label"]={13,3}
DEDLayout_l1["ILS Mode"]={18,3}
--ALOW
DEDLayout_l1["ALOW ALOW label"] = {10,4}
DEDLayout_l1["ALOW Selected Steerpoint"] = {19,2}
DEDLayout_l1["ALOW WPT IncDecSymbol"] = {23,1}
--STPT
DEDLayout_l1["STEERPOINT LABEL"] = {6,4}
DEDLayout_l1["STEERPOINT NUMBER"] = {12,2,0,"_inv","I"}
DEDLayout_l1["STEERPOINT IncDecSymbol"] = {16,1}
DEDLayout_l1["STEERPOINT SEQUENCE"] = {18,4}
DEDLayout_l1["STEERPOINT NUMBER Asteriscs_both"] = {11,1,15,"","I"}
--TIME
DEDLayout_l1["TIME_label"] = {9,4}
--BINGO
DEDLayout_l1["BINGO label"] = {9,5}
DEDLayout_l1["BINGO STPT Num"] = {20,2}
DEDLayout_l1["BINGO IncDecSymbol"] = {23,1}
--NAV
DEDLayout_l1["NAV STATUS NAV Status lbl"] = {7,10}
DEDLayout_l1["NAV COMMANDS NAV Status lbl"] = {6,12}
DEDLayout_l1["NAV STATUS INS_SelectedSteerpoint"] = {20,2}
DEDLayout_l1["NAV STATUS INS_STPT_IncDecSymbol"] = {23,1}
DEDLayout_l1["NAV COMMANDS INS_SelectedSteerpoint"] = {20,2}
DEDLayout_l1["NAV COMMANDS INS_STPT_IncDecSymbol"] = {23,1}
--MAN
DEDLayout_l1["MAN Label"] = {10,3}
DEDLayout_l1["MAN STPT Num"] = {20,2}
DEDLayout_l1["MAN IncDecSymbol"] = {23,1}
--INS
DEDLayout_l1["INS_SelectedSteerpoint"] = {20,2}
DEDLayout_l1["INS_STPT_IncDecSymbol"] = {23,1}
DEDLayout_l1["INS_lbl"] = {2,3}
DEDLayout_l1["INS_AlignTime"] = {7,4}
DEDLayout_l1["INS_AlignSlash"] = {11,1}
DEDLayout_l1["INS_AlignStatusCode"] = {12,2}
DEDLayout_l1["INS_Ready"] = {15,3}
DEDLayout_l1["INFLT ALGN INS_SelectedSteerpoint"] = {20,2}
DEDLayout_l1["INFLT ALGN INS_STPT_IncDecSymbol"] = {23,1}
DEDLayout_l1["INFLT ALGN INS_lbl"] = {4,3}
DEDLayout_l1["INFLT ALGN INS_INFLT_ALGN_lbl"] = {8,10}
--CMDS
DEDLayout_l1["CMDS_Prog_label"] = {15,4}
DEDLayout_l1["CMDS_Selected_Program"] = {21,2}
DEDLayout_l1["CMDS_Prog_IncDecSymbol"] = {23,1}
DEDLayout_l1["BINGO CMDS_BINGO_label"] = {5,11}
DEDLayout_l1["BINGO Selected Steerpoint"] = {19,2}
DEDLayout_l1["BINGO WPT IncDecSymbol"] = {23,1}
DEDLayout_l1["CMDS_CHAFF_label"] = {2,9}
DEDLayout_l1["CMDS_FLARE_label"] = {2,9}
DEDLayout_l1["CMDS_OTHER1_label"] = {2,10}
DEDLayout_l1["CMDS_OTHER2_label"] = {2,10}
--Mode
DEDLayout_l1["Master_mode_label"] = {4,4}
DEDLayout_l1["Master_mode"] = {10,3,0,"_inv","I"}
DEDLayout_l1["Master_mode_ast_both"] = {9, 1, 13,"","I"}
-- DLNK
DEDLayout_l1["LINK16 lbl"] = {7,6}
DEDLayout_l1["LINK16 STN lbl"] = {5,11}
DEDLayout_l1["NET STATUS lbl"] = {5,10}
DEDLayout_l1["AG DL lbl"] = {7,6}
DEDLayout_l1["NET STATUS lbl"] = {5,10}
DEDLayout_l1["INTRAFLIGHT INTRAFLIGHT lbl"] = {7,11}
--Misc
DEDLayout_l1["MISC Label"] = {10,4}
--MAGV
DEDLayout_l1["MAGV lbl"] = {7,4}
DEDLayout_l1["MAGV Mode"] = {13,4}
DEDLayout_l1["Asterisks_on_MAGV_Mode_both"] = {12,1,17,"","I"}
--LASER
DEDLayout_l1["LASR LABEL"] = {11,4}
--INTG
DEDLayout_l1["INTG INTG label"] = {13,4}
DEDLayout_l1["INTG INTG Mode"] = {8,4}
DEDLayout_l1["INTG TIM Event"] = {20,3}
--HARM
DEDLayout_l1["HARM"] = {1,4}
DEDLayout_l1["TblNum"] = {6,4}
DEDLayout_l1["Angles"] = {10,1}
DEDLayout_l1["T1"] = {14,2}
DEDLayout_l1["T1_code"] = {18,3,0,"_inv","I"}
DEDLayout_l1["Asterisks_T1_both"] = {17,1,21,"","I"}
-- VIP
DEDLayout_l1["Visual initial point to TGT Label"] = {4,10}
DEDLayout_l1["VIP to TGT Label Asteriscs_both"] = {3,1,14,"","I"}
-- VRP
DEDLayout_l1["Target to VRP Label"] = {4,10}
DEDLayout_l1["Target to VRP Label Asteriscs_both"] = {3,1,14,"","I"}
--DEDLayout_l1[""] = {,}

--TODO
DEDLayout_l2["TODO remove lbl"]={4,20}
--CNI
DEDLayout_l2["UHF Status"]={1,1}
DEDLayout_l2["Default Value Indication"]={11,1}
DEDLayout_l2["Wind Magnetic Direction"]={16,2}
DEDLayout_l2["Wind Speed"]={20,2}
--COM
DEDLayout_l2["Active Frequency or Channel"]={2,6}
DEDLayout_l2["Active Frequency or Channe"]={2,6}
--IFF
DEDLayout_l2["STAT Mode Asterisks_both"]={17,1,23,"","I"}
DEDLayout_l2["STAT Mode Scratchpad"]={18,5,0,"_inv","I"}
--List
DEDLayout_l2["List Item 1 Number"]={0,1,0,"","I"}
DEDLayout_l2["List Item 1 Name"]={1,4}
DEDLayout_l2["List Item 2 Number"]={6,1,0,"","I"}
DEDLayout_l2["List Item 2 Name"]={7,4}
DEDLayout_l2["List Item 3 Number"]={12,1,0,"","I"}
DEDLayout_l2["List Item 3 Name"]={13,4}
DEDLayout_l2["List Item R Number"]={18,1,0,"","I"}
DEDLayout_l2["List Item R Name"]={19,4}
--STPT
DEDLayout_l2["STEERPOINT Latitude"] = {3,3}
DEDLayout_l2["STEERPOINT Latitude Value"] = {8,12,0,"_inv","I"}
DEDLayout_l2["STEERPOINT Latitude Asteriscs_both"] = {7,1,20,"","I"}
--TIME
DEDLayout_l2["SYSTEM_label"]={4,6}
DEDLayout_l2["GPS_SYSTEM_label"]={0,10}
DEDLayout_l2["SYSTEM_value"]={13,8,0,"_inv","I"}
DEDLayout_l2["Asterisks_on_SYSTEM_both"]= {12,1,21,"","I"}
--NAV
DEDLayout_l2["NAV STATUS SYS ACCURACY label"] = {3,9}
DEDLayout_l2["NAV STATUS SYS ACCURACY value"] = {14,4}
--MAN
DEDLayout_l2["WSPAN Label"] = {6,5}
DEDLayout_l2["WSPAN DATA"] =  {13,5,0,"_inv","I"}
DEDLayout_l2["WSPAN Asteriscs_both"] = {12,1,18,"","I"}
--INS
DEDLayout_l2["INS_LAT_lbl"] = {2,3}
DEDLayout_l2["INS_LAT_Scratchpad"] = {7,10,0,"_inv","I"}
DEDLayout_l2["Asterisks_on_LAT_Scratchpad_both"] = {6,1,17,"","I"}
--CMDS
DEDLayout_l2["CMDS_BQ_lbl"] = {6,2}
DEDLayout_l2["CMDS_BQ_Scratchpad"] = {10,2,0,"_inv","I"}
DEDLayout_l2["CMDS_BQ_Asterisks_both"] = {9,1,12,"","I"}
DEDLayout_l2["CMDS_CH_lbl"] = {1,2}
DEDLayout_l2["CMDS_CH_Scratchpad"] = {7,2,0,"_inv","I"}
DEDLayout_l2["CMDS_CH_Asterisks_both"] = {6,1,9,"","I"}
-- DLNK
DEDLayout_l2["FC lbl"] = {3,2}
DEDLayout_l2["FC value"] = {6,3,0,"_inv","I"}
DEDLayout_l2["Asterisks on FC_both"] = {15,1,20,"","I"}
DEDLayout_l2["CallSign Name char1"] = {11,1,0,"_inv","I"}
DEDLayout_l2["CallSign Name char2"] = {12,1,0,"_inv","I"}
DEDLayout_l2["Asterisks on CS Name_both"] = {10,1,13,"","I"}
DEDLayout_l2["VCS IncDecSymbol"] = {14,1}
DEDLayout_l2["CallSign Number"] = {16,2,0,"_inv","I"}
DEDLayout_l2["Asterisks on CS Number_both"] = {15,1,18,"","I"}
DEDLayout_l2["STN id lbl1"] = {0,2}
DEDLayout_l2["STN value1"] = {3,5}
DEDLayout_l2["STN id lbl5"] = {9,2}
DEDLayout_l2["STN value5"] = {12,5}
DEDLayout_l2["OWN lbl"] = {18,3}
DEDLayout_l2["GPS TIME lbl"] = {0,8}
DEDLayout_l2["GPS TIME status"] = {9,3,0,"_inv","I"}
DEDLayout_l2["Asterisks on ETR_both"] = {8,1,12,"","I"}
DEDLayout_l2["IPF Reset lbl"] = {14,9,0,"_inv","I"}
DEDLayout_l2["Asterisks on IPF_both"] = {13,1,23,"","I"}
DEDLayout_l2["A-G DL XMT lbl"] = {3,3}
DEDLayout_l2["A-G DL XMT value"] = {7,2}
DEDLayout_l2["A-G DL COMM lbl"] = {12,4}
DEDLayout_l2["A-G DL COMM status"] = {17,3}
DEDLayout_l2["INTRAFLIGHT STN id lbl1"] = {1,2}
DEDLayout_l2["INTRAFLIGHT STN value1"] = {4,5}
DEDLayout_l2["INTRAFLIGHT STN id lbl5"] = {7,2}
DEDLayout_l2["INTRAFLIGHT STN value5"] = {10,5}
DEDLayout_l2["INTRAFLIGHT COMM lbl"] = {13,4}
DEDLayout_l2["INTRAFLIGHT COMM status"] = {18,3}
--Misc
DEDLayout_l2["Misc Item 1 Number"]={0,1,0,"","I"}
DEDLayout_l2["Misc Item 1 Name"]={1,4}
DEDLayout_l2["Misc Item 2 Number"]={6,1,0,"","I"}
DEDLayout_l2["Misc Item 2 Name"]={7,4}
DEDLayout_l2["Misc Item 3 Number"]={12,1,0,"","I"}
DEDLayout_l2["Misc Item 3 Name"]={13,4}
DEDLayout_l2["Misc Item R Number"]={18,1,0,"","I"}
DEDLayout_l2["Misc Item R Name"]={19,4}
--LASER
DEDLayout_l2["TGP CODE LABEL"] = {1,8}
DEDLayout_l2["TGP CODE VALUE"] = {13,4,0,"_inv","I"}
DEDLayout_l2["TGP CODE Asteriscs_both"] = {12,1,17,"","I"}
--HARM
DEDLayout_l2["T2"] = {14,2}
DEDLayout_l2["T2_code"] = {18,3,0,"_inv","I"}
DEDLayout_l2["Asterisks_T2_both"] = {17,1,21,"","I"}
-- VIP
DEDLayout_l2["Visual initial point number"] = {4,3}
DEDLayout_l2["VIP number value"] = {9,3,0,"_inv","I"}
DEDLayout_l2["VIP number up down arrows"] = {13,1}
DEDLayout_l2["VIP number Asteriscs_both"] = {8,1,12,"","I"}
-- VRP
DEDLayout_l2["Target number"] = {4,3}
DEDLayout_l2["Target number value"] = {9,3,0,"_inv","I"}
DEDLayout_l2["Target number up down arrows"] = {13,1}
DEDLayout_l2["Target number Asteriscs_both"] = {8,1,12,"","I"}

--DEDLayout_l2[""] = {,}

--CNI
DEDLayout_l3["VHF Label"]={1,3}
DEDLayout_l3["VHF IncDecSymbol"]={5,1}
DEDLayout_l3["Selected VHF Frequency"]={6,6}
DEDLayout_l3["System Time"]={15,8}
--COM
DEDLayout_l3["Scratchpad"]={14,6,0,"_inv","I"}
DEDLayout_l3["Asterisks on Scratchpad_both"]={13,1,20,"","I"}
DEDLayout_l3["Guard or Backup Status"]={9,5}
DEDLayout_l3["GUARD COM 2 Receiver Band"]={8,2}
DEDLayout_l3["GUARD Guard Label"]={12,5}
--IFF
DEDLayout_l3["STAT M1 Mode"]={0,2,0,"_inv","I"}
DEDLayout_l3["STAT M1 Lockout Status"]={3,1}
DEDLayout_l3["STAT M1 Code"]={4,2}
DEDLayout_l3["STAT M4 Mode"]={8,2,0,"_inv","I"}
DEDLayout_l3["STAT M4 Code"]={12,1}
DEDLayout_l3["STAT M4 Key"]={14,3}
DEDLayout_l3["STAT POS EVENT - Side"]={19,1}
DEDLayout_l3["STAT POS EVENT - OF"]={20,2}
DEDLayout_l3["STAT POS EVENT - Number"]={22,1}
DEDLayout_l3["POS M1 Mode"]={1,2,0,"_inv","I"}
DEDLayout_l3["POS M1 Lockout Status"]={3,1}
DEDLayout_l3["POS M1 Code"]={4,5}
DEDLayout_l3["POS M4 Mode"]={9,2,0,"_inv","I"}
DEDLayout_l3["POS M4 Code"]={13,1}
DEDLayout_l3["POS M4 Key"]={14,2}
DEDLayout_l3["POS Mode Asterisks_both"]={18,1,23,"","I"}
DEDLayout_l3["POS Mode Scratchpad"]={14,5,0,"_inv","I"}
DEDLayout_l3["TIM M1 Mode"]={1,2,0,"_inv","I"}
DEDLayout_l3["TIM M1 Lockout Status"]={3,1}
DEDLayout_l3["TIM M1 Code"]={4,5}
DEDLayout_l3["TIM M4 Mode"]={9,2,0,"_inv","I"}
DEDLayout_l3["TIM M4 Code"]={13,1}
DEDLayout_l3["TIM M4 Key"]={14,2}
DEDLayout_l3["TIM Mode Asterisks_both"]={18,1,23,"","I"}
DEDLayout_l3["TIM Mode Scratchpad"]={14,5,0,"_inv","I"}
DEDLayout_l3["BACKUP label"]={9,6}
--List
DEDLayout_l3["List Item 4 Number"]={0,1,0,"","I"}
DEDLayout_l3["List Item 4 Name"]={1,4}
DEDLayout_l3["List Item 5 Number"]={6,1,0,"","I"}
DEDLayout_l3["List Item 5 Name"]={7,4}
DEDLayout_l3["List Item 6 Number"]={12,1,0,"","I"}
DEDLayout_l3["List Item 6 Name"]={13,4}
DEDLayout_l3["List Item E Number"]={18,1,0,"","I"}
DEDLayout_l3["List Item E Name"]={19,4}
--T-ILS
DEDLayout_l3["TILS Scratchpad"]={8,6,0,"_inv","I"}
DEDLayout_l3["TILS Asterisks_both"]={7,1,14,"",'INV'}
DEDLayout_l3["ILS CMD STRG"]={15,8}
DEDLayout_l3["TCN BCN Label"] = {0,3}
DEDLayout_l3["TCN BCN ID"] = {4,3}
--ALOW
DEDLayout_l3["CARA ALOW label"] = {3,9}
DEDLayout_l3["CARA ALOW Scratchpad"] = {15,7,0,"_inv","I"}
DEDLayout_l3["CARA ALOW Asterisks_both"] = {14,1,22,"","I"}
--STPT
DEDLayout_l3["STEERPOINT Longitude"] = {3,3}
DEDLayout_l3["STEERPOINT Longitude Value"] = {8,12,0,"_inv","I"}
DEDLayout_l3["STEERPOINT Longitude Asteriscs_both"] = {7,1,20,"","I"}
--TIME
DEDLayout_l3["HACK_label"] = {6,4}
DEDLayout_l3["HACK_value"] = {13,8,0,"_inv","I"}
DEDLayout_l3["Asterisks_on_HACK_both"] = {12,1,21,"","I"}
DEDLayout_l3["HACK_IncDecSymbol"] = {23,1}
--BINGO
DEDLayout_l3["SET label"] = {6,3}
DEDLayout_l3["BINGO Asterisks_both"] = {10,1,19,"","I"}
DEDLayout_l3["BINGO Scratchpad"] = {11,8,0,"_inv","I"}
--NAV
DEDLayout_l3["NAV STATUS GPS ACCURACY label"] = {3,9}
DEDLayout_l3["NAV STATUS GPS ACCURACY value"] = {14,5}
DEDLayout_l3["NAV COMMANDS FILTER MODE label"] = {3,11}
DEDLayout_l3["NAV COMMANDS FILTER MODE value"] = {16,4}
DEDLayout_l3["NAV COMMANDS Asterisks_both"] = {15,1,20,"","I"}
--MAN
DEDLayout_l3["MBAL Label"] = {10,4}
--INS
DEDLayout_l3["INS_LNG_lbl"] = {2,3}
DEDLayout_l3["INS_LNG_Scratchpad"] = {7,10,0,"_inv","I"}
DEDLayout_l3["Asterisks_on_LNG_Scratchpad_both"] = {6,1,17,"","I"}
DEDLayout_l3["INFLT ALGN INS_COMPASS_HDG_lbl"] = {3,11}
DEDLayout_l3["INFLT ALGN INS_CompassHdgScratchpad"] = {16,4,0,"_inv","I"}
DEDLayout_l3["INFLT ALGN Asterisks on Scratchpad_both"] = {15,1,20,"","I"}
--CMDS
DEDLayout_l3["CMDS_BI_lbl"] = {6,2}
DEDLayout_l3["CMDS_BI_Scratchpad"] = {10,6,0,"_inv","I"}
DEDLayout_l3["CMDS_BI_Asterisks_both"] = {9,1,16,"","I"}
DEDLayout_l3["CMDS_FL_lbl"] = {2,2}
DEDLayout_l3["CMDS_FL_Scratchpad"] = {7,2,0,"_inv","I"}
DEDLayout_l3["CMDS_FL_Asterisks_both"] = {6,1,9,"","I"}
DEDLayout_l3["CMDS_FDBK_lbl"] = {11,4}
DEDLayout_l3["CMDS_FDBK_value"] = {19,3,0,"_inv","I"}
DEDLayout_l3["CMDS_FDBK_Asterisks_both"] = {18,1,22,"","I"}
-- DLNK
DEDLayout_l3["MC lbl"] = {3,2}
DEDLayout_l3["MC value"] = {6,3,0,"_inv","I"}
DEDLayout_l3["Asterisks on MC_both"] = {5,1,9,"","I"}
DEDLayout_l3["FL lbl"] = {12,2}
DEDLayout_l3["FL status"] = {16,3,0,"_inv","I"}
DEDLayout_l3["Asterisks on FL_both"] = {15,1,19,"","I"}
DEDLayout_l3["NUM lbl"] = {18,1}
DEDLayout_l3["Own num value"] = {20,1}
DEDLayout_l3["TIME lbl"] = {4,4}
DEDLayout_l3["TIME value"] = {9,8,0,"_inv","I"}
DEDLayout_l3["Asterisks on TIME_both"] = {8,1,17,"","I"}
DEDLayout_l3["STN id lbl2"] = {0,2}
DEDLayout_l3["STN value2"] = {3,5}
DEDLayout_l3["STN id lbl6"] = {9,2}
DEDLayout_l3["STN value6"] = {12,5}
DEDLayout_l3["OWN lbl"] = {3,3}
DEDLayout_l3["OWN value"] = {7,2}
DEDLayout_l3["DATA lbl"] = {12,4}
DEDLayout_l3["DATA value"] = {7,3}
DEDLayout_l3["INTRAFLIGHT STN id lbl2"] = {1,2}
DEDLayout_l3["INTRAFLIGHT STN value2"] = {4,5}
DEDLayout_l3["INTRAFLIGHT STN id lbl6"] = {7,2}
DEDLayout_l3["INTRAFLIGHT STN value6"] = {10,5}
DEDLayout_l3["INTRAFLIGHT DATA lbl"] = {13,4}
DEDLayout_l3["INTRAFLIGHT DATA value"] = {18,3}
--Misc
DEDLayout_l3["Misc Item 4 Number"]={0,1,0,"","I"}
DEDLayout_l3["Misc Item 4 Name"]={1,4}
DEDLayout_l3["Misc Item 5 Number"]={6,1,0,"","I"}
DEDLayout_l3["Misc Item 5 Name"]={7,4}
DEDLayout_l3["Misc Item 6 Number"]={12,1,0,"","I"}
DEDLayout_l3["Misc Item 6 Name"]={13,4}
DEDLayout_l3["Misc Item E Number"]={18,1,0,"","I"}
DEDLayout_l3["Misc Item E Name"]={19,4}
--MAGV
DEDLayout_l3["INS_MAGV_Scratchpad"] = {9,6,0,"_inv","I"}
DEDLayout_l3["Asterisks_on_MAGV_Scratchpad_both"] = {8,1,15,"","I"}
--LASER
DEDLayout_l3["LST CODE LABEL"] = {1,8}
DEDLayout_l3["LST CODE VALUE"] = {13,4,0,"_inv","I"}
DEDLayout_l3["LST CODE Asteriscs_both"] = {12,1,17,"","I"}
--INTG
DEDLayout_l3["INTG M1 Mode"] = {0,2,0,"_inv","I"}
DEDLayout_l3["INTG M1 Decoupled Status"] = {3,1}
DEDLayout_l3["INTG M1 Code"] = {4,2}
DEDLayout_l3["INTG M4 Mode"] = {16,2,0,"_inv","I"}
DEDLayout_l3["INTG M4 Decoupled Status"] = {19,1}
DEDLayout_l3["INTG M4 Code"] = {20,1,0,"_inv","I"}
DEDLayout_l3["INTG M4 Key"] = {21,3}
--HARM
DEDLayout_l3["T3"] = {14,2}
DEDLayout_l3["T3_code"] = {18,3,0,"_inv","I"}
DEDLayout_l3["Asterisks_T3_both"] = {17,1,21,"","I"}
-- VIP
DEDLayout_l3["VIP bearing"] = {3,4}
DEDLayout_l3["VIP bearing value"] = {9,6,0,"_inv","I"}
DEDLayout_l3["VIP bearing Asteriscs_both"] = {8,1,15,"","I"}
-- VRP
DEDLayout_l3["Target bearing"] = {3,4}
DEDLayout_l3["Target bearing value"] = {9,6,0,"_inv","I"}
DEDLayout_l3["Target bearing Asteriscs_both"] = {8,1,15,"","I"}

--DEDLayout_l3[""] = {,}

--TODO
DEDLayout_l4["TODO remove label"] = {4,20}
--CNI
DEDLayout_l4["VHF Status"]={1,1}
DEDLayout_l4["Hack Time"]={15,8}
--COM
DEDLayout_l4["Preset Label"]={2,9}
DEDLayout_l4["Preset Number"]={7,2,0,"_inv","I"}
DEDLayout_l4["Asterisks on PresetChannel_both"]={6,1,9,"","I"}
DEDLayout_l4["TOD Label"]={17,3}
--IFF
DEDLayout_l4["STAT M2 Mode"]={0,2,0,"_inv","I"}
DEDLayout_l4["STAT M2 Lockout Status"]={3,1}
DEDLayout_l4["STAT M2 Code"]={4,4}
DEDLayout_l4["STAT MC Mode"]={9,2,0,"_inv","I"}
DEDLayout_l4["STAT MC Code"]={12,1}
DEDLayout_l4["STAT MC Key"]={14,3}
DEDLayout_l4["STAT M2 Mode"]={0,2,0,"_inv","I"}
DEDLayout_l4["STAT M2 Lockout Status"]={3,1}
DEDLayout_l4["STAT M2 Code"]={4,4}
DEDLayout_l4["STAT MC Mode"]={9,2,0,"_inv","I"}
DEDLayout_l4["STAT MC Code"]={12,1}
DEDLayout_l4["STAT MC Key"]={14,3}
DEDLayout_l4["STAT TIM EVENT - Time"]={18,5}
DEDLayout_l4["POS M2 Mode"]={1,2,0,"_inv","I"}
DEDLayout_l4["POS M2 Lockout Status"]={3,1}
DEDLayout_l4["POS M2 Code"]={4,4,0,"_inv","I"}
DEDLayout_l4["POS MC Mode"]={9,2}
DEDLayout_l4["POS MC Code"]={12,1}
DEDLayout_l4["POS MC Key"]={14,3}
DEDLayout_l4["POS POS EVENT - Side"]={19,1}
DEDLayout_l4["POS POS EVENT - OF"]={20,2}
DEDLayout_l4["POS POS EVENT - Number"]={22,1}
DEDLayout_l4["TIM M2 Mode"]={1,2,0,"_inv","I"}
DEDLayout_l4["TIM M2 Lockout Status"]={3,1}
DEDLayout_l4["TIM M2 Lockout Status"]={4,4}
DEDLayout_l4["TIM MC Mode"]={9,2}
DEDLayout_l4["TIM MC Code"]={12,1}
DEDLayout_l4["TIM MC Key"]={14,3}
DEDLayout_l4["TIM EVENT - Time"]={18,5}
--List
DEDLayout_l4["List Item 7 Number"]={0,1,0,"","I"}
DEDLayout_l4["List Item 7 Name"]={1,4}
DEDLayout_l4["List Item 8 Number"]={6,1,0,"","I"}
DEDLayout_l4["List Item 8 Name"]={7,4}
DEDLayout_l4["List Item 9 Number"]={12,1,0,"","I"}
DEDLayout_l4["List Item 9 Name"]={13,4}
DEDLayout_l4["List Item 0 Number"]={18,1,0,"","I"}
DEDLayout_l4["List Item 0 Name"]={19,4}
--T-ILS
DEDLayout_l4["ILS FRQ Label"]={12,3}
DEDLayout_l4["ILS FRQ Scratchpad"]={17,6,0,"_inv","I"}
DEDLayout_l4["ILS FRQ Asterisks_both"]={16,1,23,"","I"}
DEDLayout_l4["TCN CHAN Label"] = {0,4}
DEDLayout_l4["TCN CHAN Scratchpad"]={5,3,0,"_inv","I"}
DEDLayout_l4["TCN CHAN Asterisks_both"]={4,1,8,"","I"}
DEDLayout_l4["BACKUP lbl"] = {2,6}
--ALOW
DEDLayout_l4["MSL FLOOR label"] = {3,9}
DEDLayout_l4["MSL FLOOR Scratchpad"] = {15,7,0,"_inv","I"}
DEDLayout_l4["MSL FLOOR Asterisks_both"] = {14,1,22,"","I"}
--STPT
DEDLayout_l4["STEERPOINT Elevation"] = {2,3}
DEDLayout_l4["STEERPOINT Elevation Value"] = {8,8,0,"_inv","I"}
DEDLayout_l4["STEERPOINT Elevation Asteriscs_both"] = {7,1,16,"","I"}
--TIME
DEDLayout_l4["DELTA_TOS_label"] = {1,9}
DEDLayout_l4["DELTA_TOS_value"] = {12,9,0,"_inv","I"}
DEDLayout_l4["Asterisks_on_DELTA_TOS_both"] = {11,1,21,"","I"}
--BINGO
DEDLayout_l4["TOTAL label"] = {4,5}
DEDLayout_l4["TOTAL value"] = {11,5}
DEDLayout_l4["TOTAL LBS label"] = {16,3}
--NAV
DEDLayout_l4["NAV STATUS MSN DUR label"] = {3,7}
DEDLayout_l4["NAV STATUS DAYS label"] = {16,4}
DEDLayout_l4["NAV STATUS Scratchpad"] = {12,2,0,"_inv","I"}
DEDLayout_l4["NAV STATUS Asterisks on Scratchpad_both"] = {11,1,14,"","I"}
DEDLayout_l4["NAV COMMANDS RESET GPS label"] = {6,11}
DEDLayout_l4["NAV COMMANDS Asterisks on RESET_both"] = {5,1,17,"","I"}
--MAN
DEDLayout_l4["RNG Label"] = {8,3}
DEDLayout_l4["RNG Data"] = {11,7}
DEDLayout_l4["RNG FT"] = {18,2}
--INS
DEDLayout_l4["INS_SALT_lbl"] = {1,4}
DEDLayout_l4["INS_SALT_Scratchpad"] = {8,7,0,"_inv","I"}
DEDLayout_l4["Asterisks_on_SALT_Scratchpad_both"] = {7,1,15,"","I"}
DEDLayout_l4["INS_FIX_NECESSARY_lbl"] = {3,17}
--CMDS
DEDLayout_l4["CMDS_SQ_lbl"] = {6,2}
DEDLayout_l4["CMDS_SQ_Scratchpad"] = {10,2,0,"_inv","I"}
DEDLayout_l4["CMDS_SQ_Asterisks_both"] = {9,1,13,"","I"}
DEDLayout_l4["CMDS_O1_lbl"] = {2,2}
DEDLayout_l4["CMDS_O1_Scratchpad"] = {7,2,0,"_inv","I"}
DEDLayout_l4["CMDS_O1_Asterisks_both"] = {6,1,9,"","I"}
DEDLayout_l4["CMDS_REQCTR_lbl"] = {11,6}
DEDLayout_l4["CMDS_REQCTR_value"] = {19,3,0,"_inv","I"}
DEDLayout_l4["CMDS_REQCTR_Asterisks_both"] = {18,1,22,"","I"}
-- DLNK
DEDLayout_l4["SC lbl"] = {3,2}
DEDLayout_l4["SC value"] = {6,3,0,"_inv","I"}
DEDLayout_l4["Asterisks on SC_both"] = {5,1,9,"","I"}
DEDLayout_l4["XMT lbl"] = {11,3}
DEDLayout_l4["XMT status"] = {16,2,0,"_inv","I"}
DEDLayout_l4["Asterisks on XMT_both"] = {15,1,18,"","I"}
DEDLayout_l4["NTR lbl"] = {5,3}
DEDLayout_l4["NTR status"] = {9,3,0,"_inv","I"}
DEDLayout_l4["Asterisks on NTR_both"] = {8,1,12,"","I"}
DEDLayout_l4["STN id lbl3"] = {0,2}
DEDLayout_l4["STN value3"] = {3,5}
DEDLayout_l4["STN id lbl7"] = {9,2}
DEDLayout_l4["STN value7"] = {12,5}
DEDLayout_l4["FILL lbl"] = {2,4}
DEDLayout_l4["FILL status"] = {7,3}
DEDLayout_l4["PRTL lbl"] = {12,4}
DEDLayout_l4["PRTL status"] = {17,5}
DEDLayout_l4["INTRAFLIGHT STN id lbl3"] = {1,2}
DEDLayout_l4["INTRAFLIGHT STN value3"] = {4,5}
DEDLayout_l4["INTRAFLIGHT STN id lbl7"] = {7,2}
DEDLayout_l4["INTRAFLIGHT STN value7"] = {10,5}
DEDLayout_l4["INTRAFLIGHT OWN lbl"] = {14,4}
DEDLayout_l4["INTRAFLIGHT Own value"] = {18,2}
--Misc
DEDLayout_l4["Misc Item 7 Number"]={0,1,0,"","I"}
DEDLayout_l4["Misc Item 7 Name"]={1,4}
DEDLayout_l4["Misc Item 8 Number"]={6,1,0,"","I"}
DEDLayout_l4["Misc Item 8 Name"]={7,4}
DEDLayout_l4["Misc Item 9 Number"]={12,1,0,"","I"}
DEDLayout_l4["Misc Item 9 Name"]={13,4}
DEDLayout_l4["Misc Item 0 Number"]={18,1,0,"","I"}
DEDLayout_l4["Misc Item 0 Name"]={19,4}
--INTG
DEDLayout_l4["INTG M2 Mode"] = {0,2}
DEDLayout_l4["INTG M2 Decoupled Status"] = {3,1}
DEDLayout_l4["INTG M2 Code"] = {4,4}
DEDLayout_l4["INTG IJAM Mode"] = {15,4}
DEDLayout_l4["INTG IJAM Key"] = {20,3}
--HARM
DEDLayout_l4["T4"] = {14,2}
DEDLayout_l4["T4_code"] = {18,3,0,"_inv","I"}
DEDLayout_l4["Asterisks_T4_both"] = {17,1,21,"","I"}
-- VIP & VRP
DEDLayout_l4["Range"] = {4,3}
DEDLayout_l4["Range value"] = {11,4,0,"_inv","I"}
DEDLayout_l4["Range Asteriscs_both"] = {10,1,15,"","I"}
DEDLayout_l4["Range NM"] = {16,2}

--DEDLayout_l4[""] = {,}

--CNI
DEDLayout_l5["IFF Modes Label"]={1,1}
DEDLayout_l5["IFF Modes Enabled"]={2,6}
DEDLayout_l5["Active Mode 3 Code"]={9,4}
DEDLayout_l5["IFF Switching"]={14,1}
DEDLayout_l5["TACAN Label"]={19,1}
DEDLayout_l5["TACAN Channel"]={20,3}
DEDLayout_l5["TACAN Band"]={23,1}
DEDLayout_l5["TACAN A-A Distance"]={19,5}
--COM
DEDLayout_l5["Preset Frequency"]={5,6,0,"_inv","I"}
DEDLayout_l5["Asterisks on PresetFrequency_both"]={4,11,11,"","I"}
DEDLayout_l5["Bandwidth"]={18,2,0,"_inv","I"}
DEDLayout_l5["Asterisks on Band_both"]={17,1,20,"","I"}
DEDLayout_l5["Preset Channel Number"]={20,2}
DEDLayout_l5["Guard or Backup Frequency"]={10,6}
--IFF
DEDLayout_l5["STAT M3 Mode"] = {0,2,0,"_inv","I"}
DEDLayout_l5["STAT M3 Lockout Status"] = {3,1}
DEDLayout_l5["STAT M3 Code"] = {4,4}
DEDLayout_l5["STAT M4 Monitoring"] = {9,3}
DEDLayout_l5["STAT M4 Monitoring Key"] = {14,3}
DEDLayout_l5["STAT MS Mode"] = {18,2,0,"_inv","I"}
DEDLayout_l5["STAT MS Code"] = {20,1}
DEDLayout_l5["STAT MS Key"] = {21,3}
DEDLayout_l5["POS M3 Mode"] = {1,2,0,"_inv","I"}
DEDLayout_l5["POS M3 Lockout Status"] = {3,1}
DEDLayout_l5["POS M3 Code"] = {4,4}
DEDLayout_l5["POS M4 Monitoring"] = {9,3}
DEDLayout_l5["POS M4 Monitoring Key"] = {14,3}
DEDLayout_l5["POS MS Mode"] = {18,2,0,"_inv","I"}
DEDLayout_l5["POS MS Code"] = {20,1}
DEDLayout_l5["POS MS Key"] = {21,3}
DEDLayout_l5["TIM M3 Mode"] = {1,2,0,"_inv","I"}
DEDLayout_l5["TIM M3 Lockout Status"] = {3,1}
DEDLayout_l5["TIM M3 Code"] = {4,4}
DEDLayout_l5["TIM M4 Monitoring"] = {9,3}
DEDLayout_l5["TIM M4 Monitoring Key"] = {14,3}
DEDLayout_l5["TIM MS Mode"] = {18,2,0,"_inv","I"}
DEDLayout_l5["TIM MS Code"] = {20,1}
DEDLayout_l5["TIM MS Key"] = {21,3}
--T-ILS
DEDLayout_l5["ILS CRS Label"]={12,3}
DEDLayout_l5["ILS CRS Scratchpad"]={17,4,0,"_inv","I"}
DEDLayout_l5["ILS CRS Asterisks_both"]={16,1,21,"","I"}
DEDLayout_l5["TCN BAND Label"] = {0,4}
DEDLayout_l5["TCN BAND XY"] = {5,1}
DEDLayout_l5["TCN BAND Key"] = {6,3}
--STPT
DEDLayout_l5["STEERPOINT Time over current STP"] = {3,3}
DEDLayout_l5["STEERPOINT TOS Value"] = {8,8,0,"_inv","I"}
DEDLayout_l5["STEERPOINT TOS Asteriscs_both"] = {7,1,16,"","I"}
--TIME
DEDLayout_l5["DATE_FORMAT_label"] = {2,8}
DEDLayout_l5["DATE_value"] = {13,8,0,"_inv","I"}
DEDLayout_l5["Asterisks_on_DATE_both"] = {12,1,21,"","I"}
--NAV
DEDLayout_l5["NAV STATUS Keys Msg"] = {3,18}
DEDLayout_l5["NAV COMMANDS ZEROIZE GPS label"] = {6,11}
DEDLayout_l5["NAV COMMANDS Asterisks on ZEROIZE_both"] = {5,1,17,"","I"}
--MAN
DEDLayout_l5["TOF Label"] = {8,3}
DEDLayout_l5["TOF Data"] = {11,6}
DEDLayout_l5["TOF SEC"]	= {17,3}
--INS
DEDLayout_l5["INS_THDG_lbl"] = {1,4}
DEDLayout_l5["INS_THDG_Scratchpad"] = {7,6,0,"_inv","I"}
DEDLayout_l5["Asterisks_on_THDG_Scratchpad"] = {6,1,13,"","I"}
DEDLayout_l5["INS_GS_lbl"] = {16,3}
DEDLayout_l5["INS_GS_value"] = {20,3}
--CMDS
DEDLayout_l5["CMDS_SI_lbl"] = {6,2}
DEDLayout_l5["CMDS_SI_Scratchpad"] = {10,6,0,"_inv","I"}
DEDLayout_l5["CMDS_SI_Asterisks_both"] = {9,1,16,"","I"}
DEDLayout_l5["CMDS_O2_lbl"] = {2,2}
DEDLayout_l5["CMDS_O2_Scratchpad"] = {7,2,0,"_inv","I"}
DEDLayout_l5["CMDS_O2_Asterisks_both"] = {6,1,9,"","I"}
DEDLayout_l5["CMDS_BINGO_lbl"] = {11,5}
DEDLayout_l5["CMDS_BINGO_value"] = {19,3,0,"_inv","I"}
DEDLayout_l5["CMDS_BINGO_Asterisks_both"] = {18,1,22,"","I"}
-- DLNK
DEDLayout_l5["P2 lbl"] = {21,3}
DEDLayout_l5["P3 lbl"] = {21,3}
DEDLayout_l5["SYNC lbl"] = {4,4}
DEDLayout_l5["SYNC status"] = {9,4,0,"_inv","I"}
DEDLayout_l5["Asterisks on SYNC_both"] = {8,1,13,"","I"}
DEDLayout_l5["P1 lbl"] = {21,3}
DEDLayout_l5["STN id lbl4"] = {0,2}
DEDLayout_l5["STN value4"] = {3,5}
DEDLayout_l5["STN id lbl8"] = {9,2}
DEDLayout_l5["STN value8"] = {12,5}
DEDLayout_l5["P5 lbl"] = {21,3}
DEDLayout_l5["INTRAFLIGHT STN id lbl4"] = {1,2}
DEDLayout_l5["INTRAFLIGHT STN value4"] = {4,5}
DEDLayout_l5["INTRAFLIGHT STN id lbl8"] = {7,2}
DEDLayout_l5["INTRAFLIGHT STN value8"] = {10,5}
DEDLayout_l5["INTRAFLIGHT LAST lbl"] = {13,4}
DEDLayout_l5["INTRAFLIGHT LAST value"] = {18,2}
DEDLayout_l5["INTRAFLIGHT P6 lbl"] = {21,3}
--LASER
DEDLayout_l5["Laser ST Time LABEL"] = {1,13}
DEDLayout_l5["Laser ST Time VALUE"] = {17,2,0,"_inv","I"}
DEDLayout_l5["Laser ST Time Asteriscs_both"] = {16,1,19,"","I"}
--INTG
DEDLayout_l5["INTG M3 Mode"] = {0,2,0,"_inv","I"}
DEDLayout_l5["INTG M3 Decoupled Status"] = {3,1}
DEDLayout_l5["INTG M3 Code"] = {4,4}
DEDLayout_l5["INTG Asterisks_both"] = {9,1,16,"","I"}
DEDLayout_l5["INTG Scratchpad"] = {10,5,0,"_inv","I"}
DEDLayout_l5["INTG COUPLE Mode"] = {16,4,0,"_inv","I"}
DEDLayout_l5["INTG COUPLE Key"] = {20,3}
--HARM
DEDLayout_l5["T5"] = {14,2}
DEDLayout_l5["T5_code"] = {18,3,0,"_inv","I"}
DEDLayout_l5["Asterisks_T5_both"] = {17,1,21,"","I"}
-- VIP & VRP
DEDLayout_l5["Elevation"] = {3,4}
DEDLayout_l5["Elevation value"] = {9,6,0,"_inv","I"}
DEDLayout_l5["Elevation Asteriscs_both"] = {8,1,17,"","I"}

--DEDLayout_l5[""] = {,}

DEDLayout = {DEDLayout_l1, DEDLayout_l2, DEDLayout_l3, DEDLayout_l4, DEDLayout_l5}

------------------------------------------------------------------DED Display Utility Functions---------------------------------------------------------------------
function parse_indication(indicator_id)  -- Thanks to [FSF]Ian code
	local t = {}
	local li = list_indication(indicator_id)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
    	local name, value = m()
    	if not name then break end
   			t[name]=value
	end
	return t
end

local function mergeString(original_string, new_data, location)
	local new_data_length = string.len(new_data)
	local before = string.sub(original_string,1,location)
	local after = string.sub(original_string,location+new_data_length+1)
	local base = string.sub(original_string,location+1, location+new_data_length)
	local merged = {}

	for i = 1, new_data_length
	do
		local curr_base = string.sub(base,i, i)
		if curr_base  ~= " " then
			merged[i]=curr_base
		else
			merged[i]=string.sub(new_data,i, i)
		end
	end
	return before..table.concat(merged)..after
end
------------------------------------------------------------------DED Display Main Function-------------------------------------------------------------------------
local function buildDEDLine(line)
-- Get Layout Information for line being built
	local DEDLayoutLine = DEDLayout[line]
-- Get Exported DED Objects
	local DED_fields = parse_indication(6)
	local layout
	local label
	local value

-- Base Output String
	local dataLine ="                         "

-- Check for present of Objects that indicate Duplicate Key Names that need resolving
	local guard = DED_fields["Guard Label"]
	local mode = DED_fields["Mode label"]
	local event = DED_fields["Event Occured"]
	local alow =  DED_fields["ALOW label"]
	local bingo = DED_fields["CMDS_BINGO_lbl"]
	local inflt_algn = DED_fields["INS_INFLT_ALGN_lbl"]
	local intraflight = DED_fields["INTRAFLIGHT lbl"]
	local dlnk_A_G = DED_fields["A-G DL lbl"]
	local nav_status = DED_fields["NAV Status lbl"]
--Loop through Exported DED Objects
	for k,v in pairs(DED_fields) do
-- Handle Duplicate Key Names on COM2 Guard page items        
		if guard ~= nil then
			label = guard.." "..k
-- Handle Duplicate Key Names on IFF STAT page items
		elseif mode ~= nil then
			label = mode.." "..k
-- Handle Duplicate Key Names on IFF POS & TIM page items
		elseif event ~= nil then
			label = event.." "..k
-- Handle Duplicate Key Names on ALOW page Line 1 items
		elseif alow ~= nil and line == 1 then
			label = alow.." "..k
-- Handle Duplicate Key Names on CMDS Bingo page Line 1 items
		elseif bingo ~= nil and line == 1 then
			label = bingo.." "..k
-- Handle Duplicate Key Names on INS INFL ALGN page Lines 1 & 3 items
		elseif inflt_algn ~= nil and (line == 1 or line==3) then
			label = inflt_algn.." "..k
-- Handle Duplicate Key Names on DLNK INTRAFLIGHT page
		elseif intraflight ~= nil then
			label = intraflight.." "..k
-- Handle Duplicate Key Names on DLNK A-G page Line 2 items
		elseif dlnk_A_G ~= nil and line == 2 then
			label = dlnk_A_G.." "..k
-- Handle Duplicate Key Names on NAV page		
		elseif nav_status ~= nil then
			label = nav_status.." "..k
		else
			label = k
		end
--Get layout data associated with current key
		layout = DEDLayoutLine[label:gsub("_inv","",1):gsub("_lhs","_both",1)]
		if layout ~= nil then
--If layout value 6 is present then use this value to override the value returned from DCS
			if layout[6] ~= nil then
				value = layout[6]
			else
				value = v
			end
			
-- Add Value to dataLine using mergeString because some values are are supposed to fit within others
			dataLine = mergeString(dataLine, value, layout[1])

--If layout value 3 > 0 we need to duplicate this item at position specific in value 3 (this is for "*"s marking enterable fields
			if layout[3] ~= nil and layout[3] > 0 then
				dataLine = mergeString(dataLine, value, layout[3])
			end
		end
	end
    return dataLine
end

local DEDLine1 = ""
local DEDLine2 = ""
local DEDLine3 = ""
local DEDLine4 = ""
local DEDLine5 = ""

-- Build DED Display Lines
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	DEDLine1 = buildDEDLine(1);
	DEDLine2 = buildDEDLine(2);
	DEDLine3 = buildDEDLine(3);
	DEDLine4 = buildDEDLine(4);
	DEDLine5 = buildDEDLine(5);
end

-- Add DED Display Lines to data sent across
defineString("DED_LINE_1", function() return DEDLine1 end, 25, "DED Output Data", "DED Display Line 1")
defineString("DED_LINE_2", function() return DEDLine2 end, 25, "DED Output Data", "DED Display Line 2")
defineString("DED_LINE_3", function() return DEDLine3 end, 25, "DED Output Data", "DED Display Line 3")
defineString("DED_LINE_4", function() return DEDLine4 end, 25, "DED Output Data", "DED Display Line 4")
defineString("DED_LINE_5", function() return DEDLine5 end, 25, "DED Output Data", "DED Display Line 5")

------------------------------------------------------------------CMDS Display--------------------------------------------------------------------------------------
local CMDS_O1_Amount
local CMDS_O2_Amount
local CMDS_CH_Amount
local CMDS_FL_Amount

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local cmds = parse_indication(16)
	CMDS_O1_Amount = "    "
	CMDS_O2_Amount = "    "
	CMDS_CH_Amount = "    "
	CMDS_FL_Amount = "    "
	if not cmds then
		return
	end
	CMDS_O1_Amount 				= coerce_nil_to_string(cmds.CMDS_O1_Amount)
	CMDS_O2_Amount 				= coerce_nil_to_string(cmds.CMDS_O2_Amount)
	CMDS_CH_Amount 				= coerce_nil_to_string(cmds.CMDS_CH_Amount)
	CMDS_FL_Amount 				= coerce_nil_to_string(cmds.CMDS_FL_Amount)
end

defineString("CMDS_O1_Amount", function() return CMDS_O1_Amount end, 4, "CMDS", "CMDS O1 Amount Display")
defineString("CMDS_O2_Amount", function() return CMDS_O2_Amount end, 4, "CMDS", "CMDS O2 Amount Display")
defineString("CMDS_CH_Amount", function() return CMDS_CH_Amount end, 4, "CMDS", "CMDS CH Amount Display")
defineString("CMDS_FL_Amount", function() return CMDS_FL_Amount end, 4, "CMDS", "CMDS FL Amount Display")

------------------------------------------------------------------UHF Display---------------------------------------------------------------------------------------
local function get_UHF_CHAN()
    local UHF = parse_indication(10)
	if UHF and UHF.txtPresetChannel then
		return coerce_nil_to_string(UHF.txtPresetChannel)
	else
		return "  "
	end
end

defineString("UHF_CHAN_DISP", get_UHF_CHAN, 2, "UHF", "UHF CHAN Display")

local function get_UHF_FREQUENCY()
    local UHF = parse_indication(11)
    if UHF and UHF.txtFreqStatus then
        local UHF_Freq = UHF.txtFreqStatus
        local UHF_dot =  UHF.txtDot
        return UHF_Freq:sub(1,3)..UHF_dot..UHF_Freq:sub(4,6)
    else
        return "       "
    end
end

defineString("UHF_FREQ_DISP", get_UHF_FREQUENCY, 7, "UHF", "UHF Manual Frequency Display")  

defineFloat("SAI_BANK_ARROW", 72, {-1, 1}, "SAI", "SAI Bank Arrow")	   

defineToggleSwitch("SEAT_EJECT_HANDLE", 10, 3006, 0,"Cockpit Mechanics" ,"Ejection Handle, PULL/STOW")
------------------------------------------------------------------Externals-----------------------------------------------------------------------------------------
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights")

defineIntegerFromGetter("EXT_TAIL_LIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(202)*65535)
end, 65535, "External Aircraft Model", "Tail Lights")

defineIntegerFromGetter("EXT_POSITION_LIGHTS_WING", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Wing Position Lights (L-red; R-green)")

defineIntegerFromGetter("EXT_POSITION_LIGHT_FUSELAGE", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Fuselage Position Lights (L-red; R-green;Back-white)")

defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Strobe Light")

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