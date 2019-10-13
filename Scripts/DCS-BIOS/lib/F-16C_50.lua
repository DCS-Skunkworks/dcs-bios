-- V1.0c by Warlord (aka BlackLibrary)
-- Initial version of outputs from mainpanel_init.lua by Matchstick
-- Tested and fixed by BuzzKillington

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
local defineDoubleCommandButton = BIOS.util.defineDoubleCommandButton

function defineMissionComputerSwitch(msg, device_id, mc1_off_command, mc2_off_command, arg_number, category, description)
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
		control_type = "mission_computer_switch",
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
			  description = "switch position -- 0 = emergency, 1 = parking"
			}
		}
	}
	moduleBeingDefined.inputProcessors[msg] = function(toState)
		local dev = GetDevice(device_id)
		dev:performClickableAction(mc1_off_command, 0) 
		dev:performClickableAction(mc2_off_command, 0) 
		if toState == "0" then
			dev:performClickableAction(mc2_off_command, -1) 
		elseif toState == "2" then
			dev:performClickableAction(mc1_off_command, 1) 
		end
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
defineRotary("ROLL_TRIM", 2, 3007, 560, "Control Interface", "ROLL TRIM Wheel")
defineRotary("PITCH_TRIM", 2, 3008, 562, "Control Interface", "PITCH TRIM Wheel")
defineRotary("YAW_TRIM", 2, 3009, 565, "Control Interface", "YAW TRIM Knob")
defineToggleSwitch("MANUAL_PITCH_SW", 2, 3010, 425, "Control Interface", "MANUAL PITCH Override Switch, OVRD/NORM")
defineToggleSwitch("STORES_CONFIG_SW", 2, 3011, 358, "Control Interface", "STORES CONFIG Switch, CAT III/CAT I")
defineDoubleCommandButton("AP_PITCH_SW", 2, 3012, 3013, 109, "Control Interface", "Autopilot PITCH Switch, ATT HOLD/ A/P OFF/ ALT HOLD")
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
defineDoubleCommandButton("MAL_IND_LTS_BRT_SW", 12, 3008, 3009, 691, "External Lights", "MAL & IND LTS Switch, BRT/Center/DIM")

--Electric System
define3PosTumb("MAIN_PWR_SW", 3, 3001, 510, "Electric System", "MAIN PWR Switch, MAIN PWR/BATT/OFF")
definePushButton("ELEC_CAUTION", 3, 3002, 511, "Electric System", "ELEC CAUTION RESET Button - Push to reset")
defineToggleSwitch("EPU_GEN_TEST_SW", 3, 3005, 579, "Electric System", "EPU/GEN Test Switch, EPU/GEN /OFF")
defineDoubleCommandButton("PROBE_HEAT_SW", 3, 3006, 3007, 578, "Electric System", "PROBE HEAT Switch, PROBE HEAT/OFF/TEST")
defineDoubleCommandButton("FLCS_PWR_TEST_SW", 3, 3003, 3004, 585, "External Lights", "FLCS PWR TEST Switch, MAINT/NORM/TEST")

--Fuel System
defineToggleSwitch("FUEL_MASTER_SW", 4, 3001, 559, "Fuel System", "FUEL MASTER Switch, MASTER/OFF")
defineToggleSwitch("FUEL_MASTER_CV", 4, 3002, 558, "Fuel System", "FUEL MASTER Switch Cover, OPEN/CLOSE")
defineToggleSwitch("TANK_INTERTING_SW", 4, 3007, 557, "Fuel System", "TANK INERTING Switch, TANK INERTING /OFF")
defineTumb("ENGINE_FEED_KNB", 4, 3004, 556, 0.1, {0, 0.3}, nil, true, "External Lights", "ENGINE FEED Knob, OFF/NORM/AFT/FWD")
defineToggleSwitch("AIR_REFUEL_SW", 4, 3008, 555, "Fuel System", "AIR REFUEL Switch, OPEN/CLOSE")
defineToggleSwitch("EXT_FUEL_TRANS_SW", 4, 3003, 159, "Fuel System", "External Fuel Transfer Switch, NORM/ WING FIRST")
defineTumb("FUEL_QTY_SEL_KNB", 4, 3005, 158, 0.1, {0, 0.5}, nil, true, "Fuel System", "FUEL QTY SEL Knob, TEST/NORM/RSVR/INT WING/EXT WING/EXT CTR") --WIP

--Gear System
defineToggleSwitch("GEAR_HANDLE", 7, 3001, 362, "Gear System", "LG Handle, UP/DN")
definePushButton("DN_LOCK_BTN", 7, 3002, 361, "Gear System", "DN LOCK REL Button - Push to reset")
defineToggleSwitch("HOOK_SW", 7, 3006, 354, "Gear System", "HOOK Switch, UP/DN")
definePushButton("HORN_SILENCE_BTN", 7, 3007, 359, "Gear System", "HORN SILENCER Button - Push to reset")
defineToggleSwitch("BRAKE_CHAN_SW", 7, 3005, 356, "Gear System", "BRAKES Channel Switch, CHAN 1/CHAN 2")
defineMissionComputerSwitch("ANTI_SKID_SW", 7, 3003, 3004, 357, "Gear System", "ANTI-SKID Switch, PARKING BRAKE/ANTI-SKID/OFF")

--ECS
defineTumb("TEMP_KNB", 13, 3002, 692, 0.1, {-0.3,0.3}, nil, true, "ECS", "TEMP Knob")
defineTumb("AIR_SOURCE_KNB", 13, 3001, 693, 0.1, {0, 0.4}, nil, true, "ECS", "AIR SOURCE Knob, OFF/NORM/DUMP/RAM")
definePotentiometer("DEFOG_LEVER", 13, 3003, 602, nil, "ECS", "DEFOG Lever")

--EPU
defineToggleSwitch("EPU_SW_COVER_ON", 6, 3001, 527, "EPU", "EPU Switch Cover for ON, OPEN/CLOSE")
defineToggleSwitch("EPU_SW_COVER_OFF", 6, 3002, 529, "EPU", "EPU Switch Cover for OFF, OPEN/CLOSE")
define3PosTumb("EPU_SW", 6, 3003, 528, "EPU", "EPU Switch, ON/NORM/OFF")

--Engine
define3PosTumb("ENG_ANTI_ICE", 6, 3004, 710, "Engine", "Engine ANTI ICE Switch, ON/AUTO/OFF")
defineDoubleCommandButton("JFS_SW", 6, 3005, 3006, 447, "Engine", "JFS Switch, START 1/OFF/START 2")
defineToggleSwitch("ENG_CONT_SW_COVER", 6, 3007, 448, "Engine", "ENG CONT Switch Cover, OPEN/CLOSE")
defineToggleSwitch("ENG_CONT_SW", 6, 3008, 449, "Engine", "ENG CONT Switch, PRI/SEC")
defineToggleSwitch("MAX_PWR_SW", 6, 3009, 451, "Engine", "MAX POWER Switch, MAX POWER/OFF")
defineDoubleCommandButton("AB_RESET_SW", 6, 3010, 3011, 450, "Engine", "AB RESET Switch, AB RESET/NORM/ENG DATA")
definePushButton("FIRE_OHEAT_DETECT_BTN", 6, 3012, 575, "Engine", "FIRE & OHEAT DETECT Test Button - Push to test")

--Oxygen System
define3PosTumb("OXY_SUPPLY_LVR", 8, 3001, 728, "Oxygen System", "Supply Lever, PBG/ON/OFF")
defineToggleSwitch("OXY_DILUTER_LVR", 8, 3002, 727, "Oxygen System", "Diluter Lever, 100 percent/NORM")
defineDoubleCommandButton("OXY_EMERG_LVR", 8, 3003, 3004, 726, "Oxygen System", "Emergency Lever, EMERGENCY/NORMAL/TEST MASK")--WIP

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
defineTumb("MIDS_LVT_KNB", 41, 3001, 723, 0.1, {0.0,0.2}, nil, true, "Avionic Panel", "MIDS LVT Knob, ZERO/OFF/ON")
defineTumb("INS_KNB", 14, 3001, 719, 0.1, {0.0,0.6}, nil, true, "Avionic Panel", "INS Knob, OFF/STOR HDG/NORM/NAV/CAL/INFLT ALIGN/ATT")

--WIP:
defineToggleSwitch("MAP_SW", 3, 3101, 722, "WIP", "MAP Switch, MAP/OFF")
defineToggleSwitch("GPS_SW", 3, 3102, 720, "WIP", "GPS Switch, GPS/OFF")
defineToggleSwitch("DL_SW", 3, 3103, 721, "WIP", "DL Switch, DL/OFF")

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
defineRockerSwitch("ICP_DED_SW", 3, 3030, 3030, 3031, 3031, 183, "UFC", "ICP DED Increment/Decrement Switch")
defineRockerSwitch("ICP_FLIR_SW", 3, 3025, 3025, 3026, 3026, 188, "UFC", "ICP FLIR Increment/Decrement Switch")
define3PosTumb("ICP_DRIFT_SW", 17, 3029, 186, "UFC", "ICP DRIFT CUTOUT/WARN RESET Switch, DRIFT C/O /NORM/WARN RESET")
defineTumb("ICP_DATA_RTN_SW", 17, 3032, 184, 1, {-1, 0}, nil, true, "UFC", "ICP Data Control Switch, RTN")
defineToggleSwitch("ICP_DATA_SEQ_SW", 17, 3033, 184, "UFC", "ICP Data Control Switch, SEQ")
defineToggleSwitch("ICP_DATA_UP_SW", 17, 3034, 185, "UFC", "ICP Data Control Switch, UP")
defineTumb("ICP_DATA_DN_SW", 17, 3035, 185, 1, {-1, 0}, nil, true, "UFC", "ICP Data Control Switch, DN")
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
defineMultipositionSwitch("UHF_FREQ_100_KNB", 37, 3002, 411, 3, 0.1,"UHF" ,"UHF Manual Frequency Knob 100 MHz")
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
defineDoubleCommandButton("ALT_MODE_LV", 45, 3001, 3002, 60, "Altimeter", "Altimeter Mode Lever, ELEC/OFF/PNEU")

--SAI
definePushButton("SAI_CAGE", 47, 3002, 67, "SAI", "SAI Cage Knob, (LMB) Pull to cage")
defineRotary("SAI_PITCH_TRIM", 47, 3003, 66, "SAI", "SAI Cage Knob, (MW) Adjust aircraft reference symbol")

--ADI
defineRotary("ADI_PITCH_TRIM", 50, 3001, 22, "ADI", "ADI Pitch Trim Knob")

--EHSI
definePushButton("EHSI_CRS_SET", 28, 3005, 43,"EHSI" , "EHSI CRS Set")
definePotentiometer("EHSI_BRT_KNOB", 28, 3004, 44, nil, "EHSI", "EHSI Brightness Control Knob - Rotate to adjust brightness")
definePushButton("EHSI_HDG_SET_BTN", 28, 3003, 42,"EHSI" , "EHSI HDG Set Button")
defineRotary("EHSI_HDG_SET_KNB", 28, 3002, 45, "EHSI", "EHSI HDG Set Knob")
definePushButton("EHSI_MODE", 28, 3001, 46,"EHSI" , "EHSI Mode (M) Button")

--Clock
defineRotary("CLOCK_WIND", 51, 3002, 625, "Clock", "Clock Wind")
definePushButton("CLOCK_SET", 51, 3001, 626, "Clock", "Clock Setting Knob")
definePushButton("CLOCK_ELAPSED", 51, 3003, 628, "Clock", "Clock Elapsed Time Knob")

--Cockpit Mechanics
defineToggleSwitch("CANOPY_HANDLE", 10, 3004, 600,"Cockpit Mechanics" ,"Canopy Handle, UP/DOWN")
defineDoubleCommandButton("SEAT_ADJ", 10, 3013, 3014, 786, "Cockpit Mechanics", "SEAT ADJ Switch, UP/OFF/DOWN")
defineToggleSwitch("CANOPY_JETT_THANDLE", 10, 3005, 601,"Cockpit Mechanics" ,"CANOPY JETTISON T-Handle, PULL/STOW")
defineToggleSwitch("SEAT_EJECT_SAFE", 10, 3009, 785,"Cockpit Mechanics" ,"Ejection Safety Lever, ARMED/LOCKED")
defineDoubleCommandButton("CANOPY_SW", 10, 3002, 3003, 606, "Cockpit Mechanics", "Canopy Switch, OPEN/HOLD/CLOSE")--WIP

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
--AOA				
defineFloat("AOA_VALUE", 15, {-1.0, -0.807, 0.0, 1.0}, "AoA", "AoA Value")

--Altimeter AAU-34/A
defineFloat("ALT_100_FT_PTR", 51, {0, 1}, "Altimeter", "Altimeter 100 ft pointer")
defineFloat("ALT_10000_FT_CNT", 52, {0, 1}, "Altimeter", "Altimeter 10000 ft count")
defineFloat("ALT_1000_FT_CNT", 53, {0, 1}, "Altimeter", "Altimeter 1000 ft count")
defineFloat("ALT_100_FT_CNT", 54, {0, 1}, "Altimeter", "Altimeter 100 ft count")
defineFloat("ALT_PRESSURE_DRUM_0_CNT", 59, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 0")
defineFloat("ALT_PRESSURE_DRUM_1_CNT", 58, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 1")
defineFloat("ALT_PRESSURE_DRUM_2_CNT", 57, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 2")
defineFloat("ALT_PRESSURE_DRUM_3_CNT", 56, {0, 1}, "Altimeter", "Altimeter Pressure Setting Drum 3")
defineFloat("ALT_PNEU_FLAG", 9, {0, 1}, "Altimeter", "Altimeter PNEU Flag")

--AirSpeed/Mach Indicator
defineFloat("AIRSPEED", 48, {0.0, 0.042, 0.152, 0.182, 0.199, 0.255, 0.303, 0.355, 0.402, 0.455, 0.653, 0.698, 0.750, 0.797, 0.850}, "Airspeed Indicator", "Airspeed Indicator")
defineFloat("MAX_AIRSPEED", 47, {0.0, 0.045, 0.1, 0.153, 0.2, 0.256, 0.302, 0.355, 0.402, 0.852}, "Airspeed Indicator", "Max Airspeed")
defineFloat("SET_AIRSPEED", 70, {0, 1}, "Airspeed Indicator", "Set Airspeed")
defineFloat("MACH_INDICATOR", 49, {1.0, 0.958, 0.921, 0.902, 0.885, 0.848, 0.812, 0.775, 0.741, 0.704, 0.668, 0.632, 0.596, 0.562, 0.528, 0.493, 0.459, 0.422, 0.387}, "Airspeed Indicator", "Mach Indicator")

--Standby Attitude Indicator
defineFloat("SAI_PITCH", 63, {-1.0, -0.902, -0.793, -0.687, -0.576, -0.450, -0.339, -0.225, -0.115, 0.0, 0.114, 0.225, 0.336, 0.445, 0.569, 0.679, 0.784, 0.893, 0.995}, "SAI", " SAI Pitch")
defineFloat("SAI_BANK", 64, {1.0, -1.0}, "SAI", "SAI Bank")
defineFloat("SAI_OFF_FLAG", 65, {0, 1}, "SAI", "SAI Off Flag")
defineFloat("SAI_AIRCRAFTREFERENCESYMBOL", 68, {-1, 1}, "SAI", "SAI Aircraft Reference Symbol")

--Vertical Velocity Indicator
defineFloat("VVI", 16, {-1.0, -0.77, 0.0, 1.0}, "Vertical Velocity Indicator", "VVI")

--Attitude Director Indicator (ADI)
defineFloat("ADI_PITCH", 17, {-1, 1}, "ADI", "ADI Pitch")
defineFloat("ADI_BANK", 18, {-1, 1}, "ADI", "ADI Bank")
defineFloat("ADI_OFF_FLAG", 25, {0.0, 1.0}, "ADI", "ADI Off Flag")
defineFloat("ADI_LOC_FLAG", 13, {0.0, 1.0}, "ADI", "ADI LOC Flag")
defineFloat("ADI_AUX_FLAG", 14, {0.0, 1.0}, "ADI", "ADI AUX Flag")
defineFloat("ADI_GS_FLAG", 26, {0.0, 1.0},"ADI", "ADI GS Flag")
defineFloat("ADI_LOC_BAR", 20, {-1, 1}, "ADI", "ADI LOC Bar")
defineFloat("ADI_GS_BAR", 21, {-1, 1}, "ADI", "ADI GS Bar")
defineFloat("ADI_TURNRATE", 23, {-1, 1}, "ADI", "ADI TurnRate")
defineFloat("ADI_GS_POINTER", 27, {-1, 1}, "ADI", "ADI GS Pointer")
defineFloat("ADI_BUBBLE", 24, {-1, 1}, "ADI", "ADI Bubble")

--Trim Indicators
defineFloat("ROLLTRIMIND", 561, {-1, 1}, "Trim Indicators", "Roll Trim Indicator")
defineFloat("PITCHTRIMIND", 563, {-1, 1}, "Trim Indicators", "Pitch Trim Indicator")

--Speed brake indicator
defineFloat("SPEEDBRAKE_INDICATOR", 363, {-1.0, 1.0}, "Speed Brake", "Speed Brake Indicator")

--Hydraulic Pressure Indicators
defineFloat("SYSA_PRESSURE", 615, {0.0, 0.170, 0.302, 0.496, 0.694, 0.828, 1.0}, "Hydraulic Pressure Indicators", "System A Pressure")
defineFloat("SYSB_PRESSURE", 616, {0.0, 0.170, 0.302, 0.496, 0.694, 0.828, 1.0}, "Hydraulic Pressure Indicators", "System B Pressure")

--Engine Indicators
--Oil Pressure
defineFloat("ENGINE_OIL_PRESSURE", 93, {0, 1}, "Engine", "Oil Pressure Indicator")
--Nozzle Position Indicators
defineFloat("ENGINE_NOZZLE_POSITION", 94, {0.0, 1.0}, "Engine", "Engine Nozzle Position Indicator")
--Engine Tachometers
defineFloat("ENGINE_TACHOMETER", 95, {0.0, 0.114, 0.233, 0.346, 0.377, 0.437, 0.57, 0.705, 0.855, 1.0}, "Engine", "Engine Tachometer Indicator")
--FTIT
defineFloat("ENGINE_FTIT", 96, {0.0, 0.026, 0.341, 0.530, 0.708, 0.882, 0.940, 1.0}, "Engine", "Engine FTIT Indicator")

--Hydrazin Volume
defineFloat("HYDRAZIN_VOLUME", 617, {0.0, 0.258, 0.416,	0.573, 0.731, 1.0}, "EPU", "Hydrazin Volume Indicator")

--Fuel Flow Indicator Counter
defineFloat("FUELFLOWCOUNTER_10K", 88, {0, 1}, "Fuel System", "Fuel Flow Counter 10k")
defineFloat("FUELFLOWCOUNTER_1K", 89, {0, 1}, "Fuel System", "Fuel Flow Counter 1k")
defineFloat("FUELFLOWCOUNTER_100", 90, {0, 1}, "Fuel System", "Fuel Flow Counter 100")

--Fuel Quantity Indicator (Dual)
defineFloat("FUEL_AL", 613, {0.0, 1.0}, "Fuel System", "Fuel Quantity Indicator AL")
defineFloat("FUEL_FR", 614, {0.0, 0.1}, "Fuel System", "Fuel Quantity Indicator FR")
defineFloat("FUELTOTALIZER_10K", 730, {0, 1}, "Fuel System", "Fuel Totalizer Counter 10K")
defineFloat("FUELTOTALIZER_1K", 731, {0, 1}, "Fuel System", "Fuel Totalizer Counter 1K")
defineFloat("FUELTOTALIZER_100", 732, {0, 1}, "Fuel System", "Fuel Totalizer Counter 100")

--ECS Cabin Pressure Altimeter
defineFloat("COCKPIT_ALITITUDE", 618, {0.0,	0.094, 0.194, 0.294, 0.394,	0.496, 0.597, 0.698, 0.798,	0.899, 1.0}, "Oxygen System", "Cabin Pressure Altimeter")

--Oxygen Pressure Indicator
defineFloat("OXYGEN_PRESSURE", 729, {0.0, 0.107, 0.217,	0.326,	0.435,	0.544, 0.611, 0.717, 0.829,	0.940, 1.0}, "Oxygen System", "Oxygen Pressure")
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

------------------------------------------------------------------Externals-----------------------------------------------------------------------------------------
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")

defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")

-- defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	-- return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
-- end, 65535, "External Aircraft Model", "Formation Lights")

-- defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Left Position Light (red)")
-- defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Right Position Light (green)")

-- defineIntegerFromGetter("EXT_STROBE_TAIL", function()
	-- if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Tail Strobe Light")
-- defineIntegerFromGetter("EXT_STROBE_LEFT", function()
	-- if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Left Strobe Light")
-- defineIntegerFromGetter("EXT_STROBE_RIGHT", function()
	-- if LoGetAircraftDrawArgumentValue(196) > 0 then return 1 else return 0 end
-- end, 1, "External Aircraft Model", "Right Strobe Light")


BIOS.protocol.endModule()