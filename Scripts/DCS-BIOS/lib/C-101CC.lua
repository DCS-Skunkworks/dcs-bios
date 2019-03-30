BIOS.protocol.beginModule("C-101CC", 0x3600)
BIOS.protocol.setExportModuleAircrafts({"C-101CC", "C-101EB"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch

-- remove Arg# Pilot 1000 / Instructor 1002

-- Electrical Panel
defineToggleSwitch("FRONT_BATT_MASTER_SW", 2, 3001, 315, "Electrical Panel", "FRONT Battery Master Switch")
defineToggleSwitch("FRONT_L_BATT_ISO_COVER", 2, 3002, 324, "Electrical Panel", "FRONT Left Battery Isolation Cover")
definePushButton("FRONT_L_BATT_ISO_BTN", 2, 3003, 325, "Electrical Panel", "FRONT Left Battery Isolation Button")
defineToggleSwitch("FRONT_R_BATT_ISO_COVER", 2, 3004, 326, "Electrical Panel", "FRONT Right Battery Isolation Cover")
definePushButton("FRONT_R_BATT_ISO_BTN", 2, 3005, 327, "Electrical Panel", "FRONT Right Battery Isolation Button")
defineToggleSwitch("FRONT_DC_BUS_TIE", 2, 3006, 316, "Electrical Panel", "FRONT DC Bus Tie")
defineToggleSwitch("FRONT_ESS_BUS_COVER", 2, 3007, 322, "Electrical Panel", "FRONT ESS BUS Cover")
definePushButton("FRONT_ESS_BUS_BTN", 2, 3008, 323, "Electrical Panel", "FRONT ESS BUS Transfer")
defineToggleSwitch("FRONT_AC_INVERTER", 2, 3009, 319, "Electrical Panel", "FRONT AC Inverter Norm/Alt")
define3PosTumb("FRONT_GEN_SW", 2, 3010, 317, "Electrical Panel", "FRONT Generator ON/OFF/RESET")
define3PosTumb("FRONT_GEN_TEST_SW", 2, 3011, 318, "Electrical Panel", "FRONT Generator GROUND FAULT/OVERVOLTAGE Test")

defineToggleSwitch("BACK_L_BATT_ISO_COVER", 2, 3400, 935, "Electrical Panel", "BACK Left Battery Isolation Cover")
definePushButton("BACK_L_BATT_ISO_BTN", 2, 3401, 936, "Electrical Panel", "BACK Left Battery Isolation Button")
defineToggleSwitch("BACK_R_BATT_ISO_COVER", 2, 3402, 937, "Electrical Panel", "BACK Right Battery Isolation Cover")
definePushButton("BACK_R_BATT_ISO_BTN", 2, 3403, 938, "Electrical Panel", "BACK Right Battery Isolation Button")
defineToggleSwitch("BACK_ESS_BUS_COVER", 2, 3404, 933, "Electrical Panel", "BACK ESS BUS Cover")
definePushButton("BACK_ESS_BUS_BTN", 2, 3405, 934, "Electrical Panel", "BACK ESS BUS Transfer")

-- CAWS Lighting/Test 
defineToggleSwitch("FRONT_CAWS_BRIGHT_DIM", 2, 3012, 320, "CAWS Lighting", "FRONT CAWS Panel Bright/Dim")
definePushButton("FRONT_LAMP_TEST", 2, 3013, 321, "CAWS Lighting", "FRONT Lamp Test")

defineToggleSwitch("BACK_CAWS_BRIGHT_DIM", 2, 3406, 931, "CAWS Lighting", "BACK CAWS Panel Bright/Dim")
definePushButton("BACK_LAMP_TEST", 2, 3407, 932, "CAWS Lighting", "BACK Lamp Test")

-- Primary ADI 
definePushButton("BACK_ATTITUDE_TEST", 2, 3166, 117, "ADI", "BACK ATTITUDE TEST")

definePushButton("BACK_ATTITUDE_TEST", 2, 3688, 995, "ADI", "BACK ATTITUDE TEST")

-- Backup ADI
  
BIOS.protocol.endModule()