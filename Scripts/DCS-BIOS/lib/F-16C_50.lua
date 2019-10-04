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
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
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