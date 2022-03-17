BIOS.protocol.beginModule("AH-64D", 0x8000)
BIOS.protocol.setExportModuleAircrafts({"AH-64D_BLK_II"})
--v1.0 by WarLord (aka BlackLibrary)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document  

local parse_indication = BIOS.util.parse_indication

local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3Pos2CommandSwitch = BIOS.util.define3Pos2CommandSwitch
local define3PosTumb = BIOS.util.define3PosTumb

-- MFD PLT Left
definePushButton("PLT_MFD_L_T1", 42, 3001, 20, "PLT MFD Left", "Pilot Left MFD T1 Button")
definePushButton("PLT_MFD_L_T2", 42, 3002, 21, "PLT MFD Left", "Pilot Left MFD T2 Button")
definePushButton("PLT_MFD_L_T3", 42, 3003, 22, "PLT MFD Left", "Pilot Left MFD T3 Button")
definePushButton("PLT_MFD_L_T4", 42, 3004, 23, "PLT MFD Left", "Pilot Left MFD T4 Button")
definePushButton("PLT_MFD_L_T5", 42, 3005, 24, "PLT MFD Left", "Pilot Left MFD T5 Button")
definePushButton("PLT_MFD_L_T6", 42, 3006, 25, "PLT MFD Left", "Pilot Left MFD T6 Button")
definePushButton("PLT_MFD_L_R1", 42, 3007, 28, "PLT MFD Left", "Pilot Left MFD R1 Button")
definePushButton("PLT_MFD_L_R2", 42, 3008, 29, "PLT MFD Left", "Pilot Left MFD R2 Button")
definePushButton("PLT_MFD_L_R3", 42, 3009, 30, "PLT MFD Left", "Pilot Left MFD R3 Button")
definePushButton("PLT_MFD_L_R4", 42, 3010, 31, "PLT MFD Left", "Pilot Left MFD R4 Button")
definePushButton("PLT_MFD_L_R5", 42, 3011, 32, "PLT MFD Left", "Pilot Left MFD R5 Button")
definePushButton("PLT_MFD_L_R6", 42, 3012, 33, "PLT MFD Left", "Pilot Left MFD R6 Button")
definePushButton("PLT_MFD_L_B1", 42, 3018, 42, "PLT MFD Left", "Pilot Left MFD B1/M(Menu) Button")
definePushButton("PLT_MFD_L_B2", 42, 3017, 41, "PLT MFD Left", "Pilot Left MFD B2 Button")
definePushButton("PLT_MFD_L_B3", 42, 3016, 40, "PLT MFD Left", "Pilot Left MFD B3 Button")
definePushButton("PLT_MFD_L_B4", 42, 3015, 39, "PLT MFD Left", "Pilot Left MFD B4 Button")
definePushButton("PLT_MFD_L_B5", 42, 3014, 38, "PLT MFD Left", "Pilot Left MFD B5 Button")
definePushButton("PLT_MFD_L_B6", 42, 3013, 37, "PLT MFD Left", "Pilot Left MFD B6 Button")
definePushButton("PLT_MFD_L_L1", 42, 3024, 17, "PLT MFD Left", "Pilot Left MFD L1 Button")
definePushButton("PLT_MFD_L_L2", 42, 3023, 16, "PLT MFD Left", "Pilot Left MFD L2 Button")
definePushButton("PLT_MFD_L_L3", 42, 3022, 15, "PLT MFD Left", "Pilot Left MFD L3 Button")
definePushButton("PLT_MFD_L_L4", 42, 3021, 14, "PLT MFD Left", "Pilot Left MFD L4 Button")
definePushButton("PLT_MFD_L_L5", 42, 3020, 13, "PLT MFD Left", "Pilot Left MFD L5 Button")
definePushButton("PLT_MFD_L_L6", 42, 3019, 12, "PLT MFD Left", "Pilot Left MFD L6 Button")

-- MFD PLT Right
definePushButton("PLT_MFD_R_T1", 43, 3001, 54, "PLT MFD Right", "Pilot Right MFD T1 Button")
definePushButton("PLT_MFD_R_T2", 43, 3002, 55, "PLT MFD Right", "Pilot Right MFD T2 Button")
definePushButton("PLT_MFD_R_T3", 43, 3003, 56, "PLT MFD Right", "Pilot Right MFD T3 Button")
definePushButton("PLT_MFD_R_T4", 43, 3004, 57, "PLT MFD Right", "Pilot Right MFD T4 Button")
definePushButton("PLT_MFD_R_T5", 43, 3005, 58, "PLT MFD Right", "Pilot Right MFD T5 Button")
definePushButton("PLT_MFD_R_T6", 43, 3006, 59, "PLT MFD Right", "Pilot Right MFD T6 Button")
definePushButton("PLT_MFD_R_R1", 43, 3007, 62, "PLT MFD Right", "Pilot Right MFD R1 Button")
definePushButton("PLT_MFD_R_R2", 43, 3008, 63, "PLT MFD Right", "Pilot Right MFD R2 Button")
definePushButton("PLT_MFD_R_R3", 43, 3009, 64, "PLT MFD Right", "Pilot Right MFD R3 Button")
definePushButton("PLT_MFD_R_R4", 43, 3010, 65, "PLT MFD Right", "Pilot Right MFD R4 Button")
definePushButton("PLT_MFD_R_R5", 43, 3011, 66, "PLT MFD Right", "Pilot Right MFD R5 Button")
definePushButton("PLT_MFD_R_R6", 43, 3012, 67, "PLT MFD Right", "Pilot Right MFD R6 Button")
definePushButton("PLT_MFD_R_B1", 43, 3018, 76, "PLT MFD Right", "Pilot Right MFD B1/M(Menu) Button")
definePushButton("PLT_MFD_R_B2", 43, 3017, 75, "PLT MFD Right", "Pilot Right MFD B2 Button")
definePushButton("PLT_MFD_R_B3", 43, 3016, 74, "PLT MFD Right", "Pilot Right MFD B3 Button")
definePushButton("PLT_MFD_R_B4", 43, 3015, 73, "PLT MFD Right", "Pilot Right MFD B4 Button")
definePushButton("PLT_MFD_R_B5", 43, 3014, 72, "PLT MFD Right", "Pilot Right MFD B5 Button")
definePushButton("PLT_MFD_R_B6", 43, 3013, 71, "PLT MFD Right", "Pilot Right MFD B6 Button")
definePushButton("PLT_MFD_R_L1", 43, 3024, 51, "PLT MFD Right", "Pilot Right MFD L1 Button")
definePushButton("PLT_MFD_R_L2", 43, 3023, 50, "PLT MFD Right", "Pilot Right MFD L2 Button")
definePushButton("PLT_MFD_R_L3", 43, 3022, 49, "PLT MFD Right", "Pilot Right MFD L3 Button")
definePushButton("PLT_MFD_R_L4", 43, 3021, 48, "PLT MFD Right", "Pilot Right MFD L4 Button")
definePushButton("PLT_MFD_R_L5", 43, 3020, 47, "PLT MFD Right", "Pilot Right MFD L5 Button")
definePushButton("PLT_MFD_R_L6", 43, 3019, 46, "PLT MFD Right", "Pilot Right MFD L6 Button")

-- Gauges
defineFloat("PLT_DOOR_POS", 795, {0, 1}, "Cockpit", "Pilot Door Position")
defineFloat("CPG_DOOR_POS", 798, {0, 1}, "Cockpit", "Gunner Door Position")

--Externals

defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(191) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_LIGHT_TAIL", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Tail Light (white)")
defineIntegerFromGetter("EXT_STROBE_L", function()
	if LoGetAircraftDrawArgumentValue(193) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Strobe Light (red)")
defineIntegerFromGetter("EXT_STROBE_R", function()
	if LoGetAircraftDrawArgumentValue(194) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Strobe Light (red)")
defineIntegerFromGetter("EXT_LIGHT_L", function()
	if LoGetAircraftDrawArgumentValue(195) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Light (white)")
defineIntegerFromGetter("EXT_LIGHT_R", function()
	if LoGetAircraftDrawArgumentValue(196) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Light (white)")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Formation Lights (yellow green)")
defineIntegerFromGetter("EXT_LAND_LIGHT", function()
	if LoGetAircraftDrawArgumentValue(209) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Landing Light (white)")
defineIntegerFromGetter("EXT_WIPER_PLT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(13)*65535)
end, 65535, "External Aircraft Model", "Wiper Pilot")
defineIntegerFromGetter("EXT_WIPER_CPG", function()
	return math.floor(LoGetAircraftDrawArgumentValue(14)*65535)
end, 65535, "External Aircraft Model", "Wiper Gunner")
defineIntegerFromGetter("EXT_WOW_TAIL", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")
defineIntegerFromGetter("EXT_ROTOR", function()
	return math.floor(LoGetAircraftDrawArgumentValue(40)*65535)
end, 65535, "External Aircraft Model", "Rotor Move")

BIOS.protocol.endModule()