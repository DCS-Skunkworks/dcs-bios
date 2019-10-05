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


--Control Interface
defineToggleSwitch("DIGI_BAK_SW", 2, 3001, 566, "Control Interface", "DIGITAL BACKUP Switch, OFF/BACKUP")
defineToggleSwitch("ALT_FLAPS_SW", 2, 3002, 567, "Control Interface", "ALT FLAPS Switch, NORM/EXTEND")
defineToggleSwitch("BIT_SW", 2, 3003, 574, "Control Interface", "BIT Switch, OFF/BIT")
defineToggleSwitch("FLCS_RESET_SW", 2, 3004, 573, "Control Interface", "FLCS RESET Switch, OFF/RESET")
defineToggleSwitch("LE_FLAPS_SW", 2, 3005, 572, "Control Interface", "LE FLAPS Switch, AUTO/LOCK")
defineToggleSwitch("TRIM_AP_DISC_SW", 2, 3006, 564, "Control Interface", "TRIM/AP DISC Switch, DISC/NORM")
definePotentiometer("ROLL_TRIM", 2, 3007, 560, nil, "Control Interface", "ROLL TRIM Wheel")
definePotentiometer("PITCH_TRIM", 2, 3008, 562, nil, "Control Interface", "PITCH TRIM Wheel")
definePotentiometer("YAW_TRIM", 2, 3009, 565, nil, "Control Interface", "YAW TRIM Knob")
defineToggleSwitch("MANUAL_PITCH_SW", 2, 3010, 425, "Control Interface", "MANUAL PITCH Override Switch, OVRD/NORM")
defineToggleSwitch("STORES_CONFIG_SW", 2, 3011, 358, "Control Interface", "STORES CONFIG Switch, CAT III/CAT I")
define3PosTumb("AP_PITCH_SW", 2, 3012, 109, "Control Interface", "Autopilot PITCH Switch, ATT HOLD/ A/P OFF/ ALT HOLD")
define3PosTumb("AP_ROLL_SW", 2, 3013, 108, "Control Interface", "Autopilot ROLL Switch, STRG SEL/ATT HOLD/HDG SEL")
defineToggleSwitch("ADV_MODE_SW", 2, 3014, 97, "Control Interface", "ADV MODE Switch")
defineToggleSwitch("MAN_TF_FLYUP_SW", 2, 3015, 568, "Control Interface", "MANUAL TF FLYUP Switch, ENABLE/DISABLE")

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
define3PosTumb("MAL_IND_LTS_BRT_SW", 12, 3008, 691, "External Lights", "MAL & IND LTS Switch, BRT/Center/DIM")

--Electric System
define3PosTumb("MAIN_PWR_SW", 3, 3001, 510, "Electric System", "MAIN PWR Switch, MAIN PWR/BATT/OFF")
definePushButton("ELEC_CAUTION", 3, 3002, 511, "Electric System", "ELEC CAUTION RESET Button - Push to reset")
defineToggleSwitch("EPU_GEN_TEST_SW", 3, 3005, 579, "Electric System", "EPU/GEN Test Switch, EPU/GEN /OFF")
define3PosTumb("PROBE_HEAT_SW", 3, 3006, 578, "Electric System", "PROBE HEAT Switch, PROBE HEAT/OFF/HEAT")
define3PosTumb("FLCS_PWR_TEST_SW", 3, 3004, 585, "External Lights", "FLCS PWR TEST Switch, MAINT/NORM/TEST") --WIP

-- Fuel System
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
define3PosTumb("ANTI_SKID_SW", 7, 3004, 357, "Gear System", "ANTI-SKID Switch, PARKING BRAKE/ANTI-SKID/OFF")

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
define3PosTumb("JFS_SW", 6, 3005, 447, "Engine", "JFS Switch, START 1/OFF/START 2")
defineToggleSwitch("ENG_CONT_SW_COVER", 6, 3007, 448, "Engine", "ENG CONT Switch Cover, OPEN/CLOSE")
defineToggleSwitch("ENG_CONT_SW", 6, 3008, 449, "Engine", "ENG CONT Switch, PRI/SEC")
defineToggleSwitch("MAX_PWR_SW", 6, 3009, 451, "Engine", "MAX POWER Switch, MAX POWER/OFF")
define3PosTumb("AB_RESET_SW", 6, 3010, 450, "Engine", "AB RESET Switch, AB RESET/NORM/ENG DATA")
definePushButton("FIRE_OHEAT_DETECT_BTN", 6, 3012, 575, "Engine", "FIRE & OHEAT DETECT Test Button - Push to test")

--Oxygen System
define3PosTumb("OXY_SUPPLY_LVR", 8, 3001, 728, "Oxygen System", "Supply Lever, PBG/ON/OFF")
defineToggleSwitch("OXY_DILUTER_LVR", 8, 3002, 727, "Oxygen System", "Diluter Lever, 100 percent/NORM")
define3PosTumb("OXY_EMERG_LVR", 8, 3003, 726, "Oxygen System", "Emergency Lever, EMERGENCY/NORMAL/TEST MASK")

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
--UHF Backup Control Panel
--IFF Control Panel
--KY-58
--HMCS
--RWR
--CMDS

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
defineRockerSwitch("MFD_R_GAIN_SW", 24, 3021, 3021, 3022, 3022, 346, "MFD Right", "MFD Left Right Rocker Switch")
defineRockerSwitch("MFD_R_SYM_SW", 24, 3023, 3023, 3024, 3024, 347, "MFD Right", "MFD Left Right Rocker Switch")
defineRockerSwitch("MFD_R_CON_SW", 24, 3025, 3025, 3026, 3026, 348, "MFD Right", "MFD Left Right Rocker Switch")
defineRockerSwitch("MFD_R_BRT_SW", 24, 3027, 3027, 3028, 3028, 349, "MFD Right", "MFD Left Right Rocker Switch")


--Externals
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