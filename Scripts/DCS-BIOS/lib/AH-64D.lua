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

-- MPD PLT Left
definePushButton("PLT_MPD_L_T1", 42, 3001, 20, "PLT MPD Left", "Pilot Left MPD T1 Button")
definePushButton("PLT_MPD_L_T2", 42, 3002, 21, "PLT MPD Left", "Pilot Left MPD T2 Button")
definePushButton("PLT_MPD_L_T3", 42, 3003, 22, "PLT MPD Left", "Pilot Left MPD T3 Button")
definePushButton("PLT_MPD_L_T4", 42, 3004, 23, "PLT MPD Left", "Pilot Left MPD T4 Button")
definePushButton("PLT_MPD_L_T5", 42, 3005, 24, "PLT MPD Left", "Pilot Left MPD T5 Button")
definePushButton("PLT_MPD_L_T6", 42, 3006, 25, "PLT MPD Left", "Pilot Left MPD T6 Button")
definePushButton("PLT_MPD_L_R1", 42, 3007, 28, "PLT MPD Left", "Pilot Left MPD R1 Button")
definePushButton("PLT_MPD_L_R2", 42, 3008, 29, "PLT MPD Left", "Pilot Left MPD R2 Button")
definePushButton("PLT_MPD_L_R3", 42, 3009, 30, "PLT MPD Left", "Pilot Left MPD R3 Button")
definePushButton("PLT_MPD_L_R4", 42, 3010, 31, "PLT MPD Left", "Pilot Left MPD R4 Button")
definePushButton("PLT_MPD_L_R5", 42, 3011, 32, "PLT MPD Left", "Pilot Left MPD R5 Button")
definePushButton("PLT_MPD_L_R6", 42, 3012, 33, "PLT MPD Left", "Pilot Left MPD R6 Button")
definePushButton("PLT_MPD_L_B1", 42, 3018, 42, "PLT MPD Left", "Pilot Left MPD B1/M(Menu) Button")
definePushButton("PLT_MPD_L_B2", 42, 3017, 41, "PLT MPD Left", "Pilot Left MPD B2 Button")
definePushButton("PLT_MPD_L_B3", 42, 3016, 40, "PLT MPD Left", "Pilot Left MPD B3 Button")
definePushButton("PLT_MPD_L_B4", 42, 3015, 39, "PLT MPD Left", "Pilot Left MPD B4 Button")
definePushButton("PLT_MPD_L_B5", 42, 3014, 38, "PLT MPD Left", "Pilot Left MPD B5 Button")
definePushButton("PLT_MPD_L_B6", 42, 3013, 37, "PLT MPD Left", "Pilot Left MPD B6 Button")
definePushButton("PLT_MPD_L_L1", 42, 3024, 17, "PLT MPD Left", "Pilot Left MPD L1 Button")
definePushButton("PLT_MPD_L_L2", 42, 3023, 16, "PLT MPD Left", "Pilot Left MPD L2 Button")
definePushButton("PLT_MPD_L_L3", 42, 3022, 15, "PLT MPD Left", "Pilot Left MPD L3 Button")
definePushButton("PLT_MPD_L_L4", 42, 3021, 14, "PLT MPD Left", "Pilot Left MPD L4 Button")
definePushButton("PLT_MPD_L_L5", 42, 3020, 13, "PLT MPD Left", "Pilot Left MPD L5 Button")
definePushButton("PLT_MPD_L_L6", 42, 3019, 12, "PLT MPD Left", "Pilot Left MPD L6 Button")
definePushButton("PLT_MPD_L_AST", 42, 3025, 27, "PLT MPD Left", "Pilot Left MPD Asterisk Button")
definePushButton("PLT_MPD_L_VID", 42, 3026, 34, "PLT MPD Left", "Pilot Left MPD VID Button")
definePushButton("PLT_MPD_L_COM", 42, 3027, 35, "PLT MPD Left", "Pilot Left MPD COM Button")
definePushButton("PLT_MPD_L_AC", 42, 3028, 36, "PLT MPD Left", "Pilot Left MPD A/C Button")
definePushButton("PLT_MPD_L_TSD", 42, 3029, 43, "PLT MPD Left", "Pilot Left MPD TSD Button")
definePushButton("PLT_MPD_L_WPN", 42, 3030, 10, "PLT MPD Left", "Pilot Left MPD WPN Button")
definePushButton("PLT_MPD_L_FCR", 42, 3031, 11, "PLT MPD Left", "Pilot Left MPD FCR Button")
definePotentiometer("PLT_MPD_L_BRIGHT", 42, 3032, 18, {0, 1}, "PLT MPD Left", "Pilot Left MPD Brightness Control Knob")
definePotentiometer("PLT_MPD_L_VIDEO", 42, 3033, 19, {0, 1}, "PLT MPD Left", "Pilot Left MPD Video Control Knob")
defineTumb("PLT_MPD_L_MODE", 42, 3034, 26, 0.5, {0, 1}, nil, false, "PLT MPD Left", "Pilot Left MPD Mode Knob, DAY/NIGHT/MONO")

-- MPD PLT Right
definePushButton("PLT_MPD_R_T1", 43, 3001, 54, "PLT MPD Right", "Pilot Right MPD T1 Button")
definePushButton("PLT_MPD_R_T2", 43, 3002, 55, "PLT MPD Right", "Pilot Right MPD T2 Button")
definePushButton("PLT_MPD_R_T3", 43, 3003, 56, "PLT MPD Right", "Pilot Right MPD T3 Button")
definePushButton("PLT_MPD_R_T4", 43, 3004, 57, "PLT MPD Right", "Pilot Right MPD T4 Button")
definePushButton("PLT_MPD_R_T5", 43, 3005, 58, "PLT MPD Right", "Pilot Right MPD T5 Button")
definePushButton("PLT_MPD_R_T6", 43, 3006, 59, "PLT MPD Right", "Pilot Right MPD T6 Button")
definePushButton("PLT_MPD_R_R1", 43, 3007, 62, "PLT MPD Right", "Pilot Right MPD R1 Button")
definePushButton("PLT_MPD_R_R2", 43, 3008, 63, "PLT MPD Right", "Pilot Right MPD R2 Button")
definePushButton("PLT_MPD_R_R3", 43, 3009, 64, "PLT MPD Right", "Pilot Right MPD R3 Button")
definePushButton("PLT_MPD_R_R4", 43, 3010, 65, "PLT MPD Right", "Pilot Right MPD R4 Button")
definePushButton("PLT_MPD_R_R5", 43, 3011, 66, "PLT MPD Right", "Pilot Right MPD R5 Button")
definePushButton("PLT_MPD_R_R6", 43, 3012, 67, "PLT MPD Right", "Pilot Right MPD R6 Button")
definePushButton("PLT_MPD_R_B1", 43, 3018, 76, "PLT MPD Right", "Pilot Right MPD B1/M(Menu) Button")
definePushButton("PLT_MPD_R_B2", 43, 3017, 75, "PLT MPD Right", "Pilot Right MPD B2 Button")
definePushButton("PLT_MPD_R_B3", 43, 3016, 74, "PLT MPD Right", "Pilot Right MPD B3 Button")
definePushButton("PLT_MPD_R_B4", 43, 3015, 73, "PLT MPD Right", "Pilot Right MPD B4 Button")
definePushButton("PLT_MPD_R_B5", 43, 3014, 72, "PLT MPD Right", "Pilot Right MPD B5 Button")
definePushButton("PLT_MPD_R_B6", 43, 3013, 71, "PLT MPD Right", "Pilot Right MPD B6 Button")
definePushButton("PLT_MPD_R_L1", 43, 3024, 51, "PLT MPD Right", "Pilot Right MPD L1 Button")
definePushButton("PLT_MPD_R_L2", 43, 3023, 50, "PLT MPD Right", "Pilot Right MPD L2 Button")
definePushButton("PLT_MPD_R_L3", 43, 3022, 49, "PLT MPD Right", "Pilot Right MPD L3 Button")
definePushButton("PLT_MPD_R_L4", 43, 3021, 48, "PLT MPD Right", "Pilot Right MPD L4 Button")
definePushButton("PLT_MPD_R_L5", 43, 3020, 47, "PLT MPD Right", "Pilot Right MPD L5 Button")
definePushButton("PLT_MPD_R_L6", 43, 3019, 46, "PLT MPD Right", "Pilot Right MPD L6 Button")
definePushButton("PLT_MPD_R_AST", 43, 3025, 61, "PLT MPD Right", "Pilot Right MPD Asterisk Button")
definePushButton("PLT_MPD_R_VID", 43, 3026, 68, "PLT MPD Right", "Pilot Right MPD VID Button")
definePushButton("PLT_MPD_R_COM", 43, 3027, 69, "PLT MPD Right", "Pilot Right MPD COM Button")
definePushButton("PLT_MPD_R_AC", 43, 3028, 70, "PLT MPD Right", "Pilot Right MPD A/C Button")
definePushButton("PLT_MPD_R_TSD", 43, 3029, 77, "PLT MPD Right", "Pilot Right MPD TSD Button")
definePushButton("PLT_MPD_R_WPN", 43, 3030, 44, "PLT MPD Right", "Pilot Right MPD WPN Button")
definePushButton("PLT_MPD_R_FCR", 43, 3031, 45, "PLT MPD Right", "Pilot Right MPD FCR Button")
definePotentiometer("PLT_MPD_R_BRIGHT", 43, 3032, 52, {0, 1}, "PLT MPD Right", "Pilot Right MPD Brightness Control Knob")
definePotentiometer("PLT_MPD_R_VIDEO", 43, 3033, 53, {0, 1}, "PLT MPD Right", "Pilot Right MPD Video Control Knob")
defineTumb("PLT_MPD_R_MODE", 43, 3034, 60, 0.5, {0, 1}, nil, false, "PLT MPD Right", "Pilot Right MPD Mode Knob, DAY/NIGHT/MONO")

-- MPD CPG Left
definePushButton("CPG_MPD_L_T1", 44, 3001, 88, "CPG MPD Left", "Gunner Left MPD T1 Button")
definePushButton("CPG_MPD_L_T2", 44, 3002, 89, "CPG MPD Left", "Gunner Left MPD T2 Button")
definePushButton("CPG_MPD_L_T3", 44, 3003, 90, "CPG MPD Left", "Gunner Left MPD T3 Button")
definePushButton("CPG_MPD_L_T4", 44, 3004, 91, "CPG MPD Left", "Gunner Left MPD T4 Button")
definePushButton("CPG_MPD_L_T5", 44, 3005, 92, "CPG MPD Left", "Gunner Left MPD T5 Button")
definePushButton("CPG_MPD_L_T6", 44, 3006, 93, "CPG MPD Left", "Gunner Left MPD T6 Button")
definePushButton("CPG_MPD_L_R1", 44, 3007, 96, "CPG MPD Left", "Gunner Left MPD R1 Button")
definePushButton("CPG_MPD_L_R2", 44, 3008, 97, "CPG MPD Left", "Gunner Left MPD R2 Button")
definePushButton("CPG_MPD_L_R3", 44, 3009, 98, "CPG MPD Left", "Gunner Left MPD R3 Button")
definePushButton("CPG_MPD_L_R4", 44, 3010, 99, "CPG MPD Left", "Gunner Left MPD R4 Button")
definePushButton("CPG_MPD_L_R5", 44, 3011, 100, "CPG MPD Left", "Gunner Left MPD R5 Button")
definePushButton("CPG_MPD_L_R6", 44, 3012, 101, "CPG MPD Left", "Gunner Left MPD R6 Button")
definePushButton("CPG_MPD_L_B1", 44, 3018, 110, "CPG MPD Left", "Gunner Left MPD B1/M(Menu) Button")
definePushButton("CPG_MPD_L_B2", 44, 3017, 109, "CPG MPD Left", "Gunner Left MPD B2 Button")
definePushButton("CPG_MPD_L_B3", 44, 3016, 108 "CPG MPD Left", "Gunner Left MPD B3 Button")
definePushButton("CPG_MPD_L_B4", 44, 3015, 107, "CPG MPD Left", "Gunner Left MPD B4 Button")
definePushButton("CPG_MPD_L_B5", 44, 3014, 106, "CPG MPD Left", "Gunner Left MPD B5 Button")
definePushButton("CPG_MPD_L_B6", 44, 3013, 105, "CPG MPD Left", "Gunner Left MPD B6 Button")
definePushButton("CPG_MPD_L_L1", 44, 3024, 80, "CPG MPD Left", "Gunner Left MPD L1 Button")
definePushButton("CPG_MPD_L_L2", 44, 3023, 81, "CPG MPD Left", "Gunner Left MPD L2 Button")
definePushButton("CPG_MPD_L_L3", 44, 3022, 82, "CPG MPD Left", "Gunner Left MPD L3 Button")
definePushButton("CPG_MPD_L_L4", 44, 3021, 83, "CPG MPD Left", "Gunner Left MPD L4 Button")
definePushButton("CPG_MPD_L_L5", 44, 3020, 84, "CPG MPD Left", "Gunner Left MPD L5 Button")
definePushButton("CPG_MPD_L_L6", 44, 3019, 85, "CPG MPD Left", "Gunner Left MPD L6 Button")
definePushButton("CPG_MPD_L_AST", 44, 3025, 95, "CPG MPD Left", "Gunner Left MPD Asterisk Button")
definePushButton("CPG_MPD_L_VID", 44, 3026, 102, "CPG MPD Left", "Gunner Left MPD VID Button")
definePushButton("CPG_MPD_L_COM", 44, 3027, 103, "CPG MPD Left", "Gunner Left MPD COM Button")
definePushButton("CPG_MPD_L_AC", 44, 3028, 104, "CPG MPD Left", "Gunner Left MPD A/C Button")
definePushButton("CPG_MPD_L_TSD", 44, 3029, 111, "CPG MPD Left", "Gunner Left MPD TSD Button")
definePushButton("CPG_MPD_L_WPN", 44, 3030, 78, "CPG MPD Left", "Gunner Left MPD WPN Button")
definePushButton("CPG_MPD_L_FCR", 44, 3031, 79, "CPG MPD Left", "Gunner Left MPD FCR Button")
definePotentiometer("CPG_MPD_L_BRIGHT", 44, 3032, 86, {0, 1}, "CPG MPD Left", "Gunner Left MPD Brightness Control Knob")
definePotentiometer("CPG_MPD_L_VIDEO", 44, 3033, 87, {0, 1}, "CPG MPD Left", "Gunner Left MPD Video Control Knob")
defineTumb("CPG_MPD_L_MODE", 44, 3034, 94, 0.5, {0, 1}, nil, false, "CPG MPD Left", "Gunner Left MPD Mode Knob, DAY/NIGHT/MONO")
	
-- MPD CPG Right
definePushButton("CPG_MPD_R_T1", 45, 3001, 122, "CPG MPD Right", "Gunner Right MPD T1 Button")
definePushButton("CPG_MPD_R_T2", 45, 3002, 123, "CPG MPD Right", "Gunner Right MPD T2 Button")
definePushButton("CPG_MPD_R_T3", 45, 3003, 124, "CPG MPD Right", "Gunner Right MPD T3 Button")
definePushButton("CPG_MPD_R_T4", 45, 3004, 125, "CPG MPD Right", "Gunner Right MPD T4 Button")
definePushButton("CPG_MPD_R_T5", 45, 3005, 126, "CPG MPD Right", "Gunner Right MPD T5 Button")
definePushButton("CPG_MPD_R_T6", 45, 3006, 127, "CPG MPD Right", "Gunner Right MPD T6 Button")
definePushButton("CPG_MPD_R_R1", 45, 3007, 130, "CPG MPD Right", "Gunner Right MPD R1 Button")
definePushButton("CPG_MPD_R_R2", 45, 3008, 131, "CPG MPD Right", "Gunner Right MPD R2 Button")
definePushButton("CPG_MPD_R_R3", 45, 3009, 132, "CPG MPD Right", "Gunner Right MPD R3 Button")
definePushButton("CPG_MPD_R_R4", 45, 3010, 133, "CPG MPD Right", "Gunner Right MPD R4 Button")
definePushButton("CPG_MPD_R_R5", 45, 3011, 134, "CPG MPD Right", "Gunner Right MPD R5 Button")
definePushButton("CPG_MPD_R_R6", 45, 3012, 135, "CPG MPD Right", "Gunner Right MPD R6 Button")
definePushButton("CPG_MPD_R_B1", 45, 3018, 144, "CPG MPD Right", "Gunner Right MPD B1/M(Menu) Button")
definePushButton("CPG_MPD_R_B2", 45, 3017, 143, "CPG MPD Right", "Gunner Right MPD B2 Button")
definePushButton("CPG_MPD_R_B3", 45, 3016, 142, "CPG MPD Right", "Gunner Right MPD B3 Button")
definePushButton("CPG_MPD_R_B4", 45, 3015, 141, "CPG MPD Right", "Gunner Right MPD B4 Button")
definePushButton("CPG_MPD_R_B5", 45, 3014, 140, "CPG MPD Right", "Gunner Right MPD B5 Button")
definePushButton("CPG_MPD_R_B6", 45, 3013, 139, "CPG MPD Right", "Gunner Right MPD B6 Button")
definePushButton("CPG_MPD_R_L1", 45, 3024, 119, "CPG MPD Right", "Gunner Right MPD L1 Button")
definePushButton("CPG_MPD_R_L2", 45, 3023, 118, "CPG MPD Right", "Gunner Right MPD L2 Button")
definePushButton("CPG_MPD_R_L3", 45, 3022, 117, "CPG MPD Right", "Gunner Right MPD L3 Button")
definePushButton("CPG_MPD_R_L4", 45, 3021, 116, "CPG MPD Right", "Gunner Right MPD L4 Button")
definePushButton("CPG_MPD_R_L5", 45, 3020, 115, "CPG MPD Right", "Gunner Right MPD L5 Button")
definePushButton("CPG_MPD_R_L6", 45, 3019, 114, "CPG MPD Right", "Gunner Right MPD L6 Button")
definePushButton("CPG_MPD_R_AST", 45, 3025, 129, "CPG MPD Right", "Gunner Right MPD Asterisk Button")
definePushButton("CPG_MPD_R_VID", 45, 3026, 136, "CPG MPD Right", "Gunner Right MPD VID Button")
definePushButton("CPG_MPD_R_COM", 45, 3027, 137, "CPG MPD Right", "Gunner Right MPD COM Button")
definePushButton("CPG_MPD_R_AC", 45, 3028, 138, "CPG MPD Right", "Gunner Right MPD A/C Button")
definePushButton("CPG_MPD_R_TSD", 45, 3029, 145, "CPG MPD Right", "Gunner Right MPD TSD Button")
definePushButton("CPG_MPD_R_WPN", 45, 3030, 112, "CPG MPD Right", "Gunner Right MPD WPN Button")
definePushButton("CPG_MPD_R_FCR", 45, 3031, 113, "CPG MPD Right", "Gunner Right MPD FCR Button")
definePotentiometer("CPG_MPD_R_BRIGHT", 45, 3032, 120, {0, 1}, "CPG MPD Right", "Gunner Right MPD Brightness Control Knob")
definePotentiometer("CPG_MPD_R_VIDEO", 45, 3033, 121, {0, 1}, "CPG MPD Right", "Gunner Right MPD Video Control Knob")
defineTumb("CPG_MPD_R_MODE", 45, 3034, 128, 0.5, {0, 1}, nil, false, "CPG MPD Right", "Gunner Right MPD Mode Knob, DAY/NIGHT/MONO")

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