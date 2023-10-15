BIOS.protocol.beginModule("AH-64D", 0x8000)
BIOS.protocol.setExportModuleAircrafts({"AH-64D_BLK_II"})
--v1.2d by WarLord & charliefoxtwo
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineSpringloaded_3PosTumb = BIOS.util.defineSpringloaded_3PosTumb
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter
local define3PosTumb = BIOS.util.define3PosTumb

local TextDisplay = require("Scripts.DCS-BIOS.lib.modules.TextDisplay")
local getDisplayLines = TextDisplay.GetDisplayLines

-- remove Arg# PLT 956; CPG 957

--Functions
local function parse_ku(indicator_id)
	local ku = parse_indication(indicator_id)
	if not ku then
		return "                      " -- 22 characters
	end
	return coerce_nil_to_string(ku.Standby_text)
end

local txt_PLT_KU = ""
local txt_CPG_KU = ""

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	txt_PLT_KU = parse_ku(15)
end

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	txt_CPG_KU = parse_ku(14)
end

--MPD Left
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
definePotentiometer("PLT_MPD_L_BRT", 42, 3032, 18, {0, 1}, "PLT MPD Left", "Pilot Left MPD Brightness Control Knob")
definePotentiometer("PLT_MPD_L_VIDEO", 42, 3033, 19, {0, 1}, "PLT MPD Left", "Pilot Left MPD Video Control Knob")
defineTumb("PLT_MPD_L_MODE", 42, 3034, 26, 0.5, {0, 1}, nil, false, "PLT MPD Left", "Pilot Left MPD Mode Knob, DAY/NIGHT/MONO")

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
definePushButton("CPG_MPD_L_B3", 44, 3016, 108, "CPG MPD Left", "Gunner Left MPD B3 Button")
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
definePotentiometer("CPG_MPD_L_BRT", 44, 3032, 86, {0, 1}, "CPG MPD Left", "Gunner Left MPD Brightness Control Knob")
definePotentiometer("CPG_MPD_L_VIDEO", 44, 3033, 87, {0, 1}, "CPG MPD Left", "Gunner Left MPD Video Control Knob")
defineTumb("CPG_MPD_L_MODE", 44, 3034, 94, 0.5, {0, 1}, nil, false, "CPG MPD Left", "Gunner Left MPD Mode Knob, DAY/NIGHT/MONO")

--MPD Right
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
definePotentiometer("PLT_MPD_R_BRT", 43, 3032, 52, {0, 1}, "PLT MPD Right", "Pilot Right MPD Brightness Control Knob")
definePotentiometer("PLT_MPD_R_VIDEO", 43, 3033, 53, {0, 1}, "PLT MPD Right", "Pilot Right MPD Video Control Knob")
defineTumb("PLT_MPD_R_MODE", 43, 3034, 60, 0.5, {0, 1}, nil, false, "PLT MPD Right", "Pilot Right MPD Mode Knob, DAY/NIGHT/MONO")

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
definePotentiometer("CPG_MPD_R_BRT", 45, 3032, 120, {0, 1}, "CPG MPD Right", "Gunner Right MPD Brightness Control Knob")
definePotentiometer("CPG_MPD_R_VIDEO", 45, 3033, 121, {0, 1}, "CPG MPD Right", "Gunner Right MPD Video Control Knob")
defineTumb("CPG_MPD_R_MODE", 45, 3034, 128, 0.5, {0, 1}, nil, false, "CPG MPD Right", "Gunner Right MPD Mode Knob, DAY/NIGHT/MONO")

--External Light System
define3PosTumb("PLT_EXTL_NAV_L_SW", 10, 3002, 326, "PLT External Light System", "Pilot Navigation Lights Switch, BRT/OFF/DIM")
definePotentiometer("PLT_EXTL_FROMATION_L_KNB", 10, 3001, 329, {0, 1}, "PLT External Light System", "Pilot Formation Lights Control Knob")
define3PosTumb("PLT_EXTL_ACOL_L_SW", 10, 3003, 332, "PLT External Light System", "Pilot Anti-Collision Lights Switch, WHT/OFF/RED")

--Internal Light System
definePushButton("PLT_INTL_MCAUTION_BTN", 11, 3001, 305, "PLT Internal Light System", "Pilot Master Caution Button")
definePushButton("PLT_INTL_MWARN_BTN", 11, 3002, 304, "PLT Internal Light System", "Pilot Master Warning Button")
definePushButton("PLT_INTL_TEST_BTN", 11, 3005, 333, "PLT Internal Light System", "Pilot Light Test Button")
definePotentiometer("PLT_INTL_SIGNAL_L_KNB", 11, 3006, 327, {0, 1}, "PLT Internal Light System", "Pilot Signal Lights Control Knob")
definePotentiometer("PLT_INTL_PRIMARY_L_KNB", 11, 3007, 328, {0, 1}, "PLT Internal Light System", "Pilot Primary Lights Control Knob")
definePotentiometer("PLT_INTL_FLOOD_L_KNB", 11, 3008, 330, {0, 1}, "PLT Internal Light System", "Pilot Flood Lights Control Knob")
definePotentiometer("PLT_INTL_STBYINST_L_KNB", 11, 3009, 331, {0, 1}, "PLT Internal Light System", "Pilot Standby Instrument Lights Control Knob")

definePushButton("CPG_INTL_MCAUTION_BTN", 11, 3003, 807, "CPG Internal Light System", "Gunner Master Caution Button")
definePushButton("CPG_INTL_MWARN_BTN", 11, 3004, 805, "CPG Internal Light System", "Gunner Master Warning Button")
definePushButton("CPG_INTL_TEST_BTN", 11, 3011, 367, "CPG Internal Light System", "Gunner Light Test Button")
definePotentiometer("CPG_INTL_SIGNAL_L_KNB", 11, 3012, 364, {0, 1}, "CPG Internal Light System", "Gunner Signal Lights Control Knob")
definePotentiometer("CPG_INTL_PRIMARY_L_KNB", 11, 3013, 365, {0, 1}, "CPG Internal Light System", "Gunner Primary Lights Control Knob")
definePotentiometer("CPG_INTL_FLOOD_L_KNB", 11, 3014, 366, {0, 1}, "CPG Internal Light System", "Gunner Flood Lights Control Knob")

-- Standby Attitude Indicator
definePushButton("PLT_SAI_CAGE", 13, 3001, 620, "PLT SAI", "Pilot SAI Cage Knob, (LMB) Pull to cage")
defineRotary("PLT_SAI_PITCH_TRIM", 13, 3002, 619, "PLT SAI", "Pilot SAI Cage Knob, (MW) Adjust aircraft reference symbol")

defineFloat("PLT_SAI_PITCH", 622, {-0.95, 0.95}, "PLT SAI Gauges", "Pilot SAI Pitch")
defineFloat("PLT_SAI_BANK", 623, {1, -1}, "PLT SAI Gauges", "Pilot SAI Bank")
defineFloat("PLT_SAI_FLAG", 624, {0, 1}, "PLT SAI Gauges", "Pilot SAI Off Flag")
defineFloat("PLT_SAI_POINTER", 625, {-1, 1}, "PLT SAI Gauges", "Pilot SAI ArrowPointer")
defineFloat("PLT_SAI_BALL", 626, {-1, 1}, "PLT SAI Gauges", "Pilot SAI Slip Ball")
defineFloat("PLT_SAI_TURN", 627, {-1, 1}, "PLT SAI Gauges", "Pilot SAI Turn")

-- Standby Altimeter
defineRotary("PLT_ALT_SET_KNB", 15, 3001, 477, "PLT Altimeter", "Pilot Altimeter Barometric Setting Knob")

defineFloat("PLT_ALT_NEEDLE", 479, {0, 1}, "PLT Altimeter Gauges", "Pilot Altimeter Needle")
defineFloat("PLT_ALT_1000", 605, {0, 1}, "PLT Altimeter Gauges", "Pilot Altimeter 1000 Drum")
defineFloat("PLT_ALT_10000", 606, {0, 1}, "PLT Altimeter Gauges", "Pilot Altimeter 10000 Drum")
defineFloat("PLT_ALT_PRESS_1", 609, {0, 1}, "PLT Altimeter Gauges", "Pilot Altimeter Pressure 0001 Drum")
defineFloat("PLT_ALT_PRESS_10", 608, {0, 1}, "PLT Altimeter Gauges", "Pilot Altimeter Pressure 0010 Drum")
defineFloat("PLT_ALT_PRESS_1100", 607, {0, 1}, "PLT Altimeter Gauges", "Pilot Altimeter Pressure 1100 Drum")

--COMM Panel
definePotentiometer("PLT_COM_VHF_VOL", 63, 3001, 334, {0, 1}, "PLT COMM Panel", "Pilot VHF Volume Control Knob")
defineToggleSwitch("PLT_COM_VHF_PW", 63, 3020, 449, "PLT COMM Panel", "Pilot VHF Disable Knob")
definePotentiometer("PLT_COM_UHF_VOL", 63, 3002, 335, {0, 1}, "PLT COMM Panel", "Pilot UHF Volume Control Knob")
defineToggleSwitch("PLT_COM_UHF_PW", 63, 3021, 450, "PLT COMM Panel", "Pilot UHF Disable Knob")
definePotentiometer("PLT_COM_FM1_VOL", 63, 3003, 336, {0, 1}, "PLT COMM Panel", "Pilot FM1 Volume Control Knob")
defineToggleSwitch("PLT_COM_FM1_PW", 63, 3022, 451, "PLT COMM Panel", "Pilot FM1 Disable Knob")
definePotentiometer("PLT_COM_FM2_VOL", 63, 3004, 337, {0, 1}, "PLT COMM Panel", "Pilot FM2 Volume Control Knob")
defineToggleSwitch("PLT_COM_FM2_PW", 63, 3023, 452, "PLT COMM Panel", "Pilot FM2 Disable Knob")
definePotentiometer("PLT_COM_HF_VOL", 63, 3005, 338, {0, 1}, "PLT COMM Panel", "Pilot HF Volume Control Knob")
defineToggleSwitch("PLT_COM_HF_PW", 63, 3024, 453, "PLT COMM Panel", "Pilot HF Disable Knob")
definePotentiometer("PLT_COM_IFF_VOL", 63, 3006, 348, {0, 1}, "PLT COMM Panel", "Pilot IFF Volume Control Knob")
definePotentiometer("PLT_COM_RLWR_VOL", 63, 3007, 349, {0, 1}, "PLT COMM Panel", "Pilot RLWR Volume Control Knob")
definePotentiometer("PLT_COM_ATA_VOL", 63, 3008, 350, {0, 1}, "PLT COMM Panel", "Pilot ATA Volume Control Knob")
definePotentiometer("PLT_COM_VCR_VOL", 63, 3009, 351, {0, 1}, "PLT COMM Panel", "Pilot VCR Volume Control Knob")
defineToggleSwitch("PLT_COM_VCR_PW", 63, 3028, 457, "PLT COMM Panel", "Pilot VCR Disable Knob")
definePotentiometer("PLT_COM_ADF_VOL", 63, 3010, 352, {0, 1}, "PLT COMM Panel", "Pilot ADF Volume Control Knob")
defineToggleSwitch("PLT_COM_ADF_PW", 63, 3029, 458, "PLT COMM Panel", "Pilot ADF Disable Knob")
definePotentiometer("PLT_COM_MASTER_VOL", 63, 3011, 344, {0, 1}, "PLT COMM Panel", "Pilot MASTER Volume Control Knob")
definePotentiometer("PLT_COM_SENS_KNB", 63, 3012, 345, {0, 1}, "PLT COMM Panel", "Pilot SENS Control Knob")
defineSpringloaded_3PosTumb("PLT_COM_VHF_SQL", 63, 3070, 3013, 339, "PLT COMM Panel", "Pilot VHF Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("PLT_COM_UHF_SQL", 63, 3071, 3014, 340, "PLT COMM Panel", "Pilot UHF Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("PLT_COM_FM1_SQL", 63, 3072, 3015, 341, "PLT COMM Panel", "Pilot FM1 Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("PLT_COM_FM2_SQL", 63, 3073, 3016, 342, "PLT COMM Panel", "Pilot FM2 Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("PLT_COM_HF_SQL", 63, 3074, 3017, 343, "PLT COMM Panel", "Pilot HF Squelch Switch, ON/OFF")
define3PosTumb("PLT_COM_ICS_MODE", 63, 3018, 346, "PLT COMM Panel", "Pilot ICS Mode Switch, HOT MIC/VOX/PTT")
definePushButton("PLT_COM_IDENT_BTN", 63, 3019, 347, "PLT COMM Panel", "Pilot IDENT Button")

definePotentiometer("CPG_COM_VHF_VOL", 62, 3001, 375, {0, 1}, "CPG COMM Panel", "Gunner VHF Volume Control Knob")
defineToggleSwitch("CPG_COM_VHF_PW", 62, 3020, 459, "CPG COMM Panel", "Gunner VHF Disable Knob")
definePotentiometer("CPG_COM_UHF_VOL", 62, 3002, 376, {0, 1}, "CPG COMM Panel", "Gunner UHF Volume Control Knob")
defineToggleSwitch("CPG_COM_UHF_PW", 62, 3021, 460, "CPG COMM Panel", "Gunner UHF Disable Knob")
definePotentiometer("CPG_COM_FM1_VOL", 62, 3003, 377, {0, 1}, "CPG COMM Panel", "Gunner FM1 Volume Control Knob")
defineToggleSwitch("CPG_COM_FM1_PW", 62, 3022, 461, "CPG COMM Panel", "Gunner FM1 Disable Knob")
definePotentiometer("CPG_COM_FM2_VOL", 62, 3004, 378, {0, 1}, "CPG COMM Panel", "Gunner FM2 Volume Control Knob")
defineToggleSwitch("CPG_COM_FM2_PW", 62, 3023, 462, "CPG COMM Panel", "Gunner FM2 Disable Knob")
definePotentiometer("CPG_COM_HF_VOL", 62, 3005, 379, {0, 1}, "CPG COMM Panel", "Gunner HF Volume Control Knob")
defineToggleSwitch("CPG_COM_HF_PW", 62, 3024, 463, "CPG COMM Panel", "Gunner HF Disable Knob")
definePotentiometer("CPG_COM_IFF_VOL", 62, 3006, 389, {0, 1}, "CPG COMM Panel", "Gunner IFF Volume Control Knob")
definePotentiometer("CPG_COM_RLWR_VOL", 62, 3007, 390, {0, 1}, "CPG COMM Panel", "Gunner RLWR Volume Control Knob")
definePotentiometer("CPG_COM_ATA_VOL", 62, 3008, 391, {0, 1}, "CPG COMM Panel", "Gunner ATA Volume Control Knob")
definePotentiometer("CPG_COM_VCR_VOL", 62, 3009, 392, {0, 1}, "CPG COMM Panel", "Gunner VCR Volume Control Knob")
defineToggleSwitch("CPG_COM_VCR_PW", 62, 3028, 467, "CPG COMM Panel", "Gunner VCR Disable Knob")
definePotentiometer("CPG_COM_ADF_VOL", 62, 3010, 393, {0, 1}, "CPG COMM Panel", "Gunner ADF Volume Control Knob")
defineToggleSwitch("CPG_COM_ADF_PW", 62, 3029, 468, "CPG COMM Panel", "Gunner ADF Disable Knob")
definePotentiometer("CPG_COM_MASTER_VOL", 62, 3011, 385, {0, 1}, "CPG COMM Panel", "Gunner MASTER Volume Control Knob")
definePotentiometer("CPG_COM_SENS_KNB", 62, 3012, 386, {0, 1}, "CPG COMM Panel", "Gunner SENS Control Knob")
defineSpringloaded_3PosTumb("CPG_COM_VHF_SQL", 62, 3070, 3013, 380, "CPG COMM Panel", "Gunner VHF Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("CPG_COM_UHF_SQL", 62, 3071, 3014, 381, "CPG COMM Panel", "Gunner UHF Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("CPG_COM_FM1_SQL", 62, 3072, 3015, 382, "CPG COMM Panel", "Gunner FM1 Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("CPG_COM_FM2_SQL", 62, 3073, 3016, 383, "CPG COMM Panel", "Gunner FM2 Squelch Switch, ON/OFF")
defineSpringloaded_3PosTumb("CPG_COM_HF_SQL", 62, 3074, 3017, 384, "CPG COMM Panel", "Gunner HF Squelch Switch, ON/OFF")
define3PosTumb("CPG_COM_ICS_MODE", 62, 3018, 387, "CPG COMM Panel", "Gunner ICS Mode Switch, HOT MIC/VOX/PTT")
definePushButton("CPG_COM_IDENT_BTN", 62, 3019, 388, "CPG COMM Panel", "Gunner IDENT Button")

--Emergency Panel
definePushButton("PLT_EMERG_GUARD_BTN", 56, 3001, 310, "PLT Emergency Panel", "Pilot Guard Button, ON/OFF")
definePushButton("PLT_EMERG_XPNDR_BTN", 56, 3003, 311, "PLT Emergency Panel", "Pilot XPNDR Button, ON/OFF")
defineToggleSwitch("PLT_EMERG_ZERO_SW", 56, 3005, 312, "PLT Emergency Panel", "Pilot Zeroize Switch, ON/OFF")
defineToggleSwitch("PLT_INST_MZERO_CVR", 56, 3008, 803, "PLT Emergency Panel", "Pilot Master Zeroize Switch Cover, OPEN/CLOSE")
defineToggleSwitch("PLT_INST_MZERO_SW", 56, 3007, 804, "PLT Emergency Panel", "Pilot Master Zeroize Switch, ON/OFF")

definePushButton("CPG_EMERG_GUARD_BTN", 56, 3002, 358, "CPG Emergency Panel", "Gunner Guard Button, ON/OFF")
definePushButton("CPG_EMERG_XPNDR_BTN", 56, 3004, 359, "CPG Emergency Panel", "Gunner XPNDR Button, ON/OFF")
defineToggleSwitch("CPG_EMERG_ZERO_SW", 56, 3006, 360, "CPG Emergency Panel", "Gunner Zeroize Switch, ON/OFF")
defineToggleSwitch("CPG_INST_MZERO_CVR", 56, 3010, 801, "CPG Emergency Panel", "Gunner Master Zeroize Switch Cover, OPEN/CLOSE")
defineToggleSwitch("CPG_INST_MZERO_SW", 56, 3009, 802, "CPG Emergency Panel", "Gunner Master Zeroize Switch, ON/OFF")

--Keyboard Unit
definePushButton("PLT_KU_A", 29, 3007, 213, "PLT Keyboard Unit", "Pilot Keyboard Unit A Key")
definePushButton("PLT_KU_B", 29, 3008, 214, "PLT Keyboard Unit", "Pilot Keyboard Unit B Key")
definePushButton("PLT_KU_C", 29, 3009, 215, "PLT Keyboard Unit", "Pilot Keyboard Unit C Key")
definePushButton("PLT_KU_D", 29, 3010, 216, "PLT Keyboard Unit", "Pilot Keyboard Unit D Key")
definePushButton("PLT_KU_E", 29, 3011, 217, "PLT Keyboard Unit", "Pilot Keyboard Unit E Key")
definePushButton("PLT_KU_F", 29, 3012, 218, "PLT Keyboard Unit", "Pilot Keyboard Unit F Key")
definePushButton("PLT_KU_G", 29, 3013, 222, "PLT Keyboard Unit", "Pilot Keyboard Unit G Key")
definePushButton("PLT_KU_H", 29, 3014, 223, "PLT Keyboard Unit", "Pilot Keyboard Unit H Key")
definePushButton("PLT_KU_I", 29, 3015, 224, "PLT Keyboard Unit", "Pilot Keyboard Unit I Key")
definePushButton("PLT_KU_J", 29, 3016, 225, "PLT Keyboard Unit", "Pilot Keyboard Unit J Key")
definePushButton("PLT_KU_K", 29, 3017, 226, "PLT Keyboard Unit", "Pilot Keyboard Unit K Key")
definePushButton("PLT_KU_L", 29, 3018, 227, "PLT Keyboard Unit", "Pilot Keyboard Unit L Key")
definePushButton("PLT_KU_M", 29, 3019, 231, "PLT Keyboard Unit", "Pilot Keyboard Unit M Key")
definePushButton("PLT_KU_N", 29, 3020, 232, "PLT Keyboard Unit", "Pilot Keyboard Unit N Key")
definePushButton("PLT_KU_O", 29, 3021, 233, "PLT Keyboard Unit", "Pilot Keyboard Unit O Key")
definePushButton("PLT_KU_P", 29, 3022, 234, "PLT Keyboard Unit", "Pilot Keyboard Unit P Key")
definePushButton("PLT_KU_Q", 29, 3023, 235, "PLT Keyboard Unit", "Pilot Keyboard Unit Q Key")
definePushButton("PLT_KU_R", 29, 3024, 236, "PLT Keyboard Unit", "Pilot Keyboard Unit R Key")
definePushButton("PLT_KU_S", 29, 3025, 240, "PLT Keyboard Unit", "Pilot Keyboard Unit S Key")
definePushButton("PLT_KU_T", 29, 3026, 241, "PLT Keyboard Unit", "Pilot Keyboard Unit T Key")
definePushButton("PLT_KU_U", 29, 3027, 242, "PLT Keyboard Unit", "Pilot Keyboard Unit U Key")
definePushButton("PLT_KU_V", 29, 3028, 243, "PLT Keyboard Unit", "Pilot Keyboard Unit V Key")
definePushButton("PLT_KU_W", 29, 3029, 244, "PLT Keyboard Unit", "Pilot Keyboard Unit W Key")
definePushButton("PLT_KU_X", 29, 3030, 245, "PLT Keyboard Unit", "Pilot Keyboard Unit X Key")
definePushButton("PLT_KU_Y", 29, 3031, 249, "PLT Keyboard Unit", "Pilot Keyboard Unit Y Key")
definePushButton("PLT_KU_Z", 29, 3032, 250, "PLT Keyboard Unit", "Pilot Keyboard Unit Z Key")
definePushButton("PLT_KU_SLASH", 29, 3045, 251, "PLT Keyboard Unit", "Pilot Keyboard Unit / Key")
definePushButton("PLT_KU_0", 29, 3043, 247, "PLT Keyboard Unit", "Pilot Keyboard Unit 0 Key")
definePushButton("PLT_KU_1", 29, 3033, 219, "PLT Keyboard Unit", "Pilot Keyboard Unit 1 Key")
definePushButton("PLT_KU_2", 29, 3034, 220, "PLT Keyboard Unit", "Pilot Keyboard Unit 2 Key")
definePushButton("PLT_KU_3", 29, 3035, 221, "PLT Keyboard Unit", "Pilot Keyboard Unit 3 Key")
definePushButton("PLT_KU_4", 29, 3036, 228, "PLT Keyboard Unit", "Pilot Keyboard Unit 4 Key")
definePushButton("PLT_KU_5", 29, 3037, 229, "PLT Keyboard Unit", "Pilot Keyboard Unit 5 Key")
definePushButton("PLT_KU_6", 29, 3038, 230, "PLT Keyboard Unit", "Pilot Keyboard Unit 6 Key")
definePushButton("PLT_KU_7", 29, 3039, 237, "PLT Keyboard Unit", "Pilot Keyboard Unit 7 Key")
definePushButton("PLT_KU_8", 29, 3040, 238, "PLT Keyboard Unit", "Pilot Keyboard Unit 8 Key")
definePushButton("PLT_KU_9", 29, 3041, 239, "PLT Keyboard Unit", "Pilot Keyboard Unit 9 Key")
definePushButton("PLT_KU_DOT", 29, 3042, 246, "PLT Keyboard Unit", "Pilot Keyboard Unit . Key")
definePushButton("PLT_KU_SIGN", 29, 3044, 248, "PLT Keyboard Unit", "Pilot Keyboard Unit +/- Key")
definePushButton("PLT_KU_BKS", 29, 3002, 252, "PLT Keyboard Unit", "Pilot Keyboard Unit BKS Key")
definePushButton("PLT_KU_SPC", 29, 3003, 253, "PLT Keyboard Unit", "Pilot Keyboard Unit SPC Key")
definePushButton("PLT_KU_MULTI", 29, 3049, 254, "PLT Keyboard Unit", "Pilot Keyboard Unit * Key")
definePushButton("PLT_KU_DIV", 29, 3048, 255, "PLT Keyboard Unit", "Pilot Keyboard Unit / (divide) Key")
definePushButton("PLT_KU_PLUS", 29, 3046, 256, "PLT Keyboard Unit", "Pilot Keyboard Unit + Key")
definePushButton("PLT_KU_MINUS", 29, 3047, 257, "PLT Keyboard Unit", "Pilot Keyboard Unit - Key")
definePushButton("PLT_KU_CLR", 29, 3001, 258, "PLT Keyboard Unit", "Pilot Keyboard Unit CLR Key")
definePushButton("PLT_KU_LEFT", 29, 3004, 259, "PLT Keyboard Unit", "Pilot Keyboard Unit Left Key")
definePushButton("PLT_KU_RIGHT", 29, 3005, 260, "PLT Keyboard Unit", "Pilot Keyboard Unit Right Key")
definePushButton("PLT_KU_ENT", 29, 3006, 261, "PLT Keyboard Unit", "Pilot Keyboard Unit ENTER Key")
definePotentiometer("PLT_KU_BRT", 29, 3050, 316, {0, 1}, "PLT Keyboard Unit", "Pilot Scratchpad Keyboard Brightness Knob")

defineString("PLT_KU_DISPLAY", function() return txt_PLT_KU end, 22, "PLT Keyboard Unit", "Pilot Keyboard Unit Display")

definePushButton("CPG_KU_A", 30, 3007, 164, "CPG Keyboard Unit", "Gunner Keyboard Unit A Key")
definePushButton("CPG_KU_B", 30, 3008, 165, "CPG Keyboard Unit", "Gunner Keyboard Unit B Key")
definePushButton("CPG_KU_C", 30, 3009, 166, "CPG Keyboard Unit", "Gunner Keyboard Unit C Key")
definePushButton("CPG_KU_D", 30, 3010, 167, "CPG Keyboard Unit", "Gunner Keyboard Unit D Key")
definePushButton("CPG_KU_E", 30, 3011, 168, "CPG Keyboard Unit", "Gunner Keyboard Unit E Key")
definePushButton("CPG_KU_F", 30, 3012, 169, "CPG Keyboard Unit", "Gunner Keyboard Unit F Key")
definePushButton("CPG_KU_G", 30, 3013, 173, "CPG Keyboard Unit", "Gunner Keyboard Unit G Key")
definePushButton("CPG_KU_H", 30, 3014, 174, "CPG Keyboard Unit", "Gunner Keyboard Unit H Key")
definePushButton("CPG_KU_I", 30, 3015, 175, "CPG Keyboard Unit", "Gunner Keyboard Unit I Key")
definePushButton("CPG_KU_J", 30, 3016, 176, "CPG Keyboard Unit", "Gunner Keyboard Unit J Key")
definePushButton("CPG_KU_K", 30, 3017, 177, "CPG Keyboard Unit", "Gunner Keyboard Unit K Key")
definePushButton("CPG_KU_L", 30, 3018, 178, "CPG Keyboard Unit", "Gunner Keyboard Unit L Key")
definePushButton("CPG_KU_M", 30, 3019, 182, "CPG Keyboard Unit", "Gunner Keyboard Unit M Key")
definePushButton("CPG_KU_N", 30, 3020, 183, "CPG Keyboard Unit", "Gunner Keyboard Unit N Key")
definePushButton("CPG_KU_O", 30, 3021, 184, "CPG Keyboard Unit", "Gunner Keyboard Unit O Key")
definePushButton("CPG_KU_P", 30, 3022, 185, "CPG Keyboard Unit", "Gunner Keyboard Unit P Key")
definePushButton("CPG_KU_Q", 30, 3023, 186, "CPG Keyboard Unit", "Gunner Keyboard Unit Q Key")
definePushButton("CPG_KU_R", 30, 3024, 187, "CPG Keyboard Unit", "Gunner Keyboard Unit R Key")
definePushButton("CPG_KU_S", 30, 3025, 191, "CPG Keyboard Unit", "Gunner Keyboard Unit S Key")
definePushButton("CPG_KU_T", 30, 3026, 192, "CPG Keyboard Unit", "Gunner Keyboard Unit T Key")
definePushButton("CPG_KU_U", 30, 3027, 193, "CPG Keyboard Unit", "Gunner Keyboard Unit U Key")
definePushButton("CPG_KU_V", 30, 3028, 194, "CPG Keyboard Unit", "Gunner Keyboard Unit V Key")
definePushButton("CPG_KU_W", 30, 3029, 195, "CPG Keyboard Unit", "Gunner Keyboard Unit W Key")
definePushButton("CPG_KU_X", 30, 3030, 196, "CPG Keyboard Unit", "Gunner Keyboard Unit X Key")
definePushButton("CPG_KU_Y", 30, 3031, 200, "CPG Keyboard Unit", "Gunner Keyboard Unit Y Key")
definePushButton("CPG_KU_Z", 30, 3032, 201, "CPG Keyboard Unit", "Gunner Keyboard Unit Z Key")
definePushButton("CPG_KU_SLASH", 30, 3045, 202, "CPG Keyboard Unit", "Gunner Keyboard Unit / Key")
definePushButton("CPG_KU_0", 30, 3043, 198, "CPG Keyboard Unit", "Gunner Keyboard Unit 0 Key")
definePushButton("CPG_KU_1", 30, 3033, 170, "CPG Keyboard Unit", "Gunner Keyboard Unit 1 Key")
definePushButton("CPG_KU_2", 30, 3034, 171, "CPG Keyboard Unit", "Gunner Keyboard Unit 2 Key")
definePushButton("CPG_KU_3", 30, 3035, 172, "CPG Keyboard Unit", "Gunner Keyboard Unit 3 Key")
definePushButton("CPG_KU_4", 30, 3036, 179, "CPG Keyboard Unit", "Gunner Keyboard Unit 4 Key")
definePushButton("CPG_KU_5", 30, 3037, 180, "CPG Keyboard Unit", "Gunner Keyboard Unit 5 Key")
definePushButton("CPG_KU_6", 30, 3038, 181, "CPG Keyboard Unit", "Gunner Keyboard Unit 6 Key")
definePushButton("CPG_KU_7", 30, 3039, 188, "CPG Keyboard Unit", "Gunner Keyboard Unit 7 Key")
definePushButton("CPG_KU_8", 30, 3040, 189, "CPG Keyboard Unit", "Gunner Keyboard Unit 8 Key")
definePushButton("CPG_KU_9", 30, 3041, 190, "CPG Keyboard Unit", "Gunner Keyboard Unit 9 Key")
definePushButton("CPG_KU_DOT", 30, 3042, 197, "CPG Keyboard Unit", "Gunner Keyboard Unit . Key")
definePushButton("CPG_KU_SIGN", 30, 3044, 199, "CPG Keyboard Unit", "Gunner Keyboard Unit +/- Key")
definePushButton("CPG_KU_BKS", 30, 3002, 203, "CPG Keyboard Unit", "Gunner Keyboard Unit BKS Key")
definePushButton("CPG_KU_SPC", 30, 3003, 204, "CPG Keyboard Unit", "Gunner Keyboard Unit SPC Key")
definePushButton("CPG_KU_MULTI", 30, 3049, 205, "CPG Keyboard Unit", "Gunner Keyboard Unit * Key")
definePushButton("CPG_KU_DIV", 30, 3048, 206, "CPG Keyboard Unit", "Gunner Keyboard Unit / (divide) Key")
definePushButton("CPG_KU_PLUS", 30, 3046, 207, "CPG Keyboard Unit", "Gunner Keyboard Unit + Key")
definePushButton("CPG_KU_MINUS", 30, 3047, 208, "CPG Keyboard Unit", "Gunner Keyboard Unit - Key")
definePushButton("CPG_KU_CLR", 30, 3001, 209, "CPG Keyboard Unit", "Gunner Keyboard Unit CLR Key")
definePushButton("CPG_KU_LEFT", 30, 3004, 210, "CPG Keyboard Unit", "Gunner Keyboard Unit Left Key")
definePushButton("CPG_KU_RIGHT", 30, 3005, 211, "CPG Keyboard Unit", "Gunner Keyboard Unit Right Key")
definePushButton("CPG_KU_ENT", 30, 3006, 212, "CPG Keyboard Unit", "Gunner Keyboard Unit ENTER Key")
definePotentiometer("CPG_KU_BRT", 30, 3050, 621, {0, 1}, "CPG Keyboard Unit", "Gunner Scratchpad Keyboard Brightness Knob")

defineString("CPG_KU_DISPLAY", function() return txt_CPG_KU end, 22, "CPG Keyboard Unit", "Gunner Keyboard Unit Display")

-- Enhanced Up-Front Display
local JSON = BIOS.json
local eufd_indicator_data_file = io.open(lfs.writedir()..[[Scripts/DCS-BIOS/src/json/AH-64D_EUFD.json]], "r")
local eufd_indicator_data
if(eufd_indicator_data_file ~= nil) then
	eufd_indicator_data = JSON:decode(eufd_indicator_data_file:read("*a"))
	eufd_indicator_data_file:close()
end
eufd_indicator_data_file = nil

local LINE_LEN = 56

local function parse_eufd(indicator_id)
	local dcs_eufd = parse_indication(indicator_id)
	-- todo: return different page based on the actual page
	return getDisplayLines(dcs_eufd or {}, LINE_LEN, 14, eufd_indicator_data, function() return "MAIN" end, {})
end

local plt_EUFD = {}
local cpg_EUFD = {}

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	plt_EUFD = parse_eufd(17)
end

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	cpg_EUFD = parse_eufd(18)
end

defineString("PLT_EUFD_LINE1", function() return plt_EUFD[1] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 1")
defineString("PLT_EUFD_LINE2", function() return plt_EUFD[2] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 2")
defineString("PLT_EUFD_LINE3", function() return plt_EUFD[3] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 3")
defineString("PLT_EUFD_LINE4", function() return plt_EUFD[4] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 4")
defineString("PLT_EUFD_LINE5", function() return plt_EUFD[5] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 5")
defineString("PLT_EUFD_LINE6", function() return plt_EUFD[6] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 6")
defineString("PLT_EUFD_LINE7", function() return plt_EUFD[7] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 7")
defineString("PLT_EUFD_LINE8", function() return plt_EUFD[8] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 8")
defineString("PLT_EUFD_LINE9", function() return plt_EUFD[9] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 9")
defineString("PLT_EUFD_LINE10", function() return plt_EUFD[10] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 10")
defineString("PLT_EUFD_LINE11", function() return plt_EUFD[11] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 11")
defineString("PLT_EUFD_LINE12", function() return plt_EUFD[12] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 12")
defineString("PLT_EUFD_LINE13", function() return plt_EUFD[13] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 13")
defineString("PLT_EUFD_LINE14", function() return plt_EUFD[14] end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 14")

defineString("CPG_EUFD_LINE1", function() return cpg_EUFD[1] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 1")
defineString("CPG_EUFD_LINE2", function() return cpg_EUFD[2] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 2")
defineString("CPG_EUFD_LINE3", function() return cpg_EUFD[3] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 3")
defineString("CPG_EUFD_LINE4", function() return cpg_EUFD[4] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 4")
defineString("CPG_EUFD_LINE5", function() return cpg_EUFD[5] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 5")
defineString("CPG_EUFD_LINE6", function() return cpg_EUFD[6] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 6")
defineString("CPG_EUFD_LINE7", function() return cpg_EUFD[7] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 7")
defineString("CPG_EUFD_LINE8", function() return cpg_EUFD[8] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 8")
defineString("CPG_EUFD_LINE9", function() return cpg_EUFD[9] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 9")
defineString("CPG_EUFD_LINE10", function() return cpg_EUFD[10] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 10")
defineString("CPG_EUFD_LINE11", function() return cpg_EUFD[11] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 11")
defineString("CPG_EUFD_LINE12", function() return cpg_EUFD[12] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 12")
defineString("CPG_EUFD_LINE13", function() return cpg_EUFD[13] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 13")
defineString("CPG_EUFD_LINE14", function() return cpg_EUFD[14] end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 14")

defineSpringloaded_3PosTumb("PLT_EUFD_WCA", 48, 3002, 3001, 271, "PLT Up-Front Display", "Pilot Up-Front Display WCA Rocker Switch")
defineSpringloaded_3PosTumb("PLT_EUFD_IDM", 48, 3004, 3003, 270, "PLT Up-Front Display", "Pilot Up-Front Display IDM Rocker Switch")
defineSpringloaded_3PosTumb("PLT_EUFD_RTS", 48, 3006, 3005, 272, "PLT Up-Front Display", "Pilot Up-Front Display RTS Rocker Switch")
definePotentiometer("PLT_EUFD_BRT", 48, 3011, 273, {0, 1}, "PLT Up-Front Display", "Pilot Up-Front Display Brightness Knob")
definePushButton("PLT_EUFD_ENT", 48, 3008, 275, "PLT Up-Front Display", "Pilot Up-Front Display ENTER Button")
definePushButton("PLT_EUFD_SWAP", 48, 3010, 277, "PLT Up-Front Display", "Pilot Up-Front Display Swap Button")
definePushButton("PLT_EUFD_PRESET", 48, 3007, 274, "PLT Up-Front Display", "Pilot Up-Front Display Preset Button")
definePushButton("PLT_EUFD_STOPWATCH", 48, 3009, 276, "PLT Up-Front Display", "Pilot Up-Front Display Stopwatch Button - Press to start/stop, Hold to reset")

defineSpringloaded_3PosTumb("CPG_EUFD_WCA", 49, 3002, 3001, 263, "CPG Up-Front Display", "Gunner Up-Front Display WCA Rocker Switch")
defineSpringloaded_3PosTumb("CPG_EUFD_IDM", 49, 3004, 3003, 262, "CPG Up-Front Display", "Gunner Up-Front Display IDM Rocker Switch")
defineSpringloaded_3PosTumb("CPG_EUFD_RTS", 49, 3006, 3005, 264, "CPG Up-Front Display", "Gunner Up-Front Display RTS Rocker Switch")
definePotentiometer("CPG_EUFD_BRT", 49, 3011, 265, {0, 1}, "CPG Up-Front Display", "Gunner Up-Front Display Brightness Knob")
definePushButton("CPG_EUFD_ENT", 49, 3008, 267, "CPG Up-Front Display", "Gunner Up-Front Display ENTER Button")
definePushButton("CPG_EUFD_SWAP", 49, 3010, 269, "CPG Up-Front Display", "Gunner Up-Front Display Swap Button")
definePushButton("CPG_EUFD_PRESET", 49, 3007, 266, "CPG Up-Front Display", "Gunner Up-Front Display Preset Button")
definePushButton("CPG_EUFD_STOPWATCH", 49, 3009, 268, "CPG Up-Front Display", "Gunner Up-Front Display Stopwatch Button - Press to start/stop, Hold to reset")

-- TEDAC Display
definePushButton("CPG_TEDAC_TAD_SEL", 51, 3005, 150, "CPG TEDAC Display", "Gunner TEDAC Display TAD Video Select Button")
definePushButton("CPG_TEDAC_FCR_SEL", 51, 3006, 151, "CPG TEDAC Display", "Gunner TEDAC Display FCR Video Select Button")
definePushButton("CPG_TEDAC_PNV_SEL", 51, 3007, 152, "CPG TEDAC Display", "Gunner TEDAC Display PNV Video Select Button")
definePushButton("CPG_TEDAC_GS_SEL", 51, 3008, 153, "CPG TEDAC Display", "Gunner TEDAC Display G/S Video Select Button")
defineSpringloaded_3PosTumb("CPG_TEDAC_SYM", 51, 3010, 3009, 155, "CPG TEDAC Display", "Gunner TEDAC Display SYM Rocker Switch")
defineSpringloaded_3PosTumb("CPG_TEDAC_BRT", 51, 3012, 3011, 156, "CPG TEDAC Display", "Gunner TEDAC Display BRT Rocker Switch")
defineSpringloaded_3PosTumb("CPG_TEDAC_CON", 51, 3014, 3013, 157, "CPG TEDAC Display", "Gunner TEDAC Display CON Rocker Switch")
defineSpringloaded_3PosTumb("CPG_TEDAC_RF", 51, 3020, 3019, 147, "CPG TEDAC Display", "Gunner TEDAC Display R/F Rocker Switch")
defineSpringloaded_3PosTumb("CPG_TEDAC_EL", 51, 3018, 3017, 146, "CPG TEDAC Display", "Gunner TEDAC Display EL Rocker Switch")
defineSpringloaded_3PosTumb("CPG_TEDAC_AZ", 51, 3016, 3015, 163, "CPG TEDAC Display", "Gunner TEDAC Display AZ Rocker Switch")
definePushButton("CPG_TEDAC_MULTI", 51, 3004, 158, "CPG TEDAC Display", "Gunner TEDAC Display Asterisk (*) Button")
definePushButton("CPG_TEDAC_BORESIGHT", 51, 3021, 162, "CPG TEDAC Display", "Gunner TEDAC Display AZ/EL Boresight Enable Button")
definePushButton("CPG_TEDAC_ACM", 51, 3022, 161, "CPG TEDAC Display", "Gunner TEDAC Display ACM Button")
definePushButton("CPG_TEDAC_FREEZE", 51, 3023, 160, "CPG TEDAC Display", "Gunner TEDAC Display FREEZE Button")
definePushButton("CPG_TEDAC_FILTER", 51, 3024, 159, "CPG TEDAC Display", "Gunner TEDAC Display FILTER Button")
definePotentiometer("CPG_TEDAC_FLIR_GAIN", 51, 3002, 148, {0, 1}, "CPG TEDAC Display", "Gunner TEDAC Display FLIR GAIN Control Knob")
definePotentiometer("CPG_TEDAC_FLIR_LEV", 51, 3003, 149, {0, 1}, "CPG TEDAC Display", "Gunner TEDAC Display FLIR LEV Control Knob")
defineTumb("CPG_TEDAC_DISP_MODE", 51, 3001, 154, 0.5, {0, 1}, nil, false, "CPG TEDAC Display", "Gunner TEDAC Display Mode Knob, DAY/NT/OFF")

defineSpringloaded_3PosTumb("CPG_LHG_TEDAC_L_IAT", 51, 3031, 3030, 491, "CPG TEDAC Left Handgrip", "Gunner Image AutoTrack/Offset Switch, OFS/IAT")
defineSpringloaded_3PosTumb("CPG_LHG_TADS_FOV_UP_DN", 51, 3033, 3032, 492, "CPG TEDAC Left Handgrip", "Gunner TADS FOV Select Switch, Z (Zoom)/M (Medium)")
defineSpringloaded_3PosTumb("CPG_LHG_TADS_FOV_L_R", 51, 3035, 3034, 49, "CPG TEDAC Left Handgrip", "Gunner TADS FOV Select Switch, N (Narrow)/W (Wide)")
define3PosTumb("CPG_LHG_TADS_SEL", 51, 3092, 494, "CPG TEDAC Left Handgrip", "Gunner TADS Sensor Select Switch, FLIR/TV/DVO")
defineSpringloaded_3PosTumb("CPG_LHG_STORE_UPDATE", 51, 3040, 3039, 495, "CPG TEDAC Left Handgrip", "Gunner STORE/Update Switch, UPDT/STORE")
defineSpringloaded_3PosTumb("CPG_LHG_FCR_SCAN", 51, 3042, 3041, 500, "CPG TEDAC Left Handgrip", "Gunner FCR Scan Switch, C/S")
definePushButton("CPG_LHG_CUED_SEARCH", 51, 3043, 501, "CPG TEDAC Left Handgrip", "Gunner CUED Search Button")
definePushButton("CPG_LHG_LMC", 51, 3044, 496, "CPG TEDAC Left Handgrip", "Gunner Linear Motion Compensation Button")
defineSpringloaded_3PosTumb("CPG_LHG_FCR_UP_DN", 51, 3046, 3045, 498, "CPG TEDAC Left Handgrip", "Gunner FCR Mode Switch, GTM/ATM")
defineSpringloaded_3PosTumb("CPG_LHG_FCR_L_R", 51, 3048, 3047, 499, "CPG TEDAC Left Handgrip", "Gunner FCR Mode Switch, TPM/RMAP")
defineSpringloaded_3PosTumb("CPG_LHG_WPN_UP_DN", 51, 3050, 3049, 502, "CPG TEDAC Left Handgrip", "Gunner Weapons Action Switch, GUN/ATA")
defineSpringloaded_3PosTumb("CPG_LHG_WPN_L_R", 51, 3052, 3051, 503, "CPG TEDAC Left Handgrip", "Gunner Weapons Action Switch, RKT/MSL")
defineSpringloaded_3PosTumb("CPG_LHG_CURSOR_UP_DN", 51, 3054, 3053, 487, "CPG TEDAC Left Handgrip", "Gunner Cursor Controller, Up/Down")
defineSpringloaded_3PosTumb("CPG_LHG_CURSOR_L_R", 51, 3056, 3055, 488, "CPG TEDAC Left Handgrip", "Gunner Cursor Controller, Left/Right")
definePushButton("CPG_LHG_CURSOR_ENT", 51, 3057, 489, "CPG TEDAC Left Handgrip", "Gunner Cursor Controller, Enter")
definePushButton("CPG_LHG_LR_BTN", 51, 3060, 490, "CPG TEDAC Left Handgrip", "Gunner Cursor Display Select (L/R) Button")

defineSpringloaded_3PosTumb("CPG_RHG_SIGHT_UP_DN", 51, 3064, 3063, 508, "CPG TEDAC Right Handgrip", "Gunner Sight Select Switch, HMD/LINK")
defineSpringloaded_3PosTumb("CPG_RHG_SIGHT_L_R", 51, 3066, 3065, 509, "CPG TEDAC Right Handgrip", "Gunner Sight Select Switch, FCR/TADS")
define3PosTumb("CPG_RHG_LASER_TRACK", 51, 3093, 510, "CPG TEDAC Right Handgrip", "Gunner Laser Tracker Mode Switch, A/O/M")
defineSpringloaded_3PosTumb("CPG_RHG_FCR_SCAN_UP_DN", 51, 3071, 3070, 511, "CPG TEDAC Right Handgrip", "Gunner FCR Scan Size Switch, Z (Zoom)/M (Medium)")
defineSpringloaded_3PosTumb("CPG_RHG_FCR_SCAN_L_R", 51, 3073, 3072, 512, "CPG TEDAC Right Handgrip", "Gunner FCR Scan Size Switch, N (Narrow)/W (Wide)")
definePushButton("CPG_RHG_C_SCOPE", 51, 3074, 513, "CPG TEDAC Right Handgrip", "Gunner C-Scope Button")
definePushButton("CPG_RHG_FLIR_POL", 51, 3075, 504, "CPG TEDAC Right Handgrip", "Gunner FLIR Polarity Button")
definePushButton("CPG_RHG_SIGHT_SLAVE", 51, 3076, 514, "CPG TEDAC Right Handgrip", "Gunner Sight Slave Button")
definePushButton("CPG_RHG_DISP_ZOOM", 51, 3077, 517, "CPG TEDAC Right Handgrip", "Gunner Display Zoom Button")
defineSpringloaded_3PosTumb("CPG_RHG_SPARE", 51, 3080, 3079, 519, "CPG TEDAC Right Handgrip", "Gunner Spare Switch, PREVIOUS/NEXT")
definePushButton("CPG_RHG_HDD_SW", 51, 3081, 505, "CPG TEDAC Right Handgrip", "Gunner HDD/HOD Select Button")
definePushButton("CPG_RHG_ENTER", 51, 3082, 518, "CPG TEDAC Right Handgrip", "Gunner Cursor Enter Button")
defineSpringloaded_3PosTumb("CPG_RHG_MAN_TRK_UP_DN", 51, 3084, 3083, 515, "CPG TEDAC Right Handgrip", "Gunner Sight Manual Tracker Controller, Up/Down")
defineSpringloaded_3PosTumb("CPG_RHG_MAN_TRK_L_R", 51, 3086, 3085, 516, "CPG TEDAC Right Handgrip", "Gunner Sight Manual Tracker Controller, Left/Right")
define3PosTumb("CPG_RHG_IAT_POL", 51, 3094, 507, "CPG TEDAC Right Handgrip", "Gunner Image Auto Tracker Polarity Switch, W/A/B")

--Video Control Panel
definePotentiometer("PLT_VIDEO_IHADSS_BRT", 3, 3011, 278, {0, 1}, "PLT Video Control Panel", "Pilot IHADSS BRT Control Knob")
definePotentiometer("PLT_VIDEO_IHADSS_CON", 3, 3010, 279, {0, 1}, "PLT Video Control Panel", "Pilot IHADSS CON Control Knob")
definePotentiometer("PLT_VIDEO_SYM_BRT", 3, 3012, 280, {0, 1}, "PLT Video Control Panel", "Pilot SYM BRT Control Knob")
definePotentiometer("PLT_VIDEO_FLIR_LVL", 3, 3008, 282, {0, 1}, "PLT Video Control Panel", "Pilot FLIR LVL Control Knob")
definePotentiometer("PLT_VIDEO_FLIR_GAIN", 3, 3007, 283, {0, 1}, "PLT Video Control Panel", "Pilot FLIR GAIN Control Knob")
defineToggleSwitch("PLT_VIDEO_AUTO_CON", 3, 3009, 281, "PLT Video Control Panel", "Pilot Automatic Contrast Mode Switch, ACM/OFF")

-- NVS MODE PANEL
define3PosTumb("PLT_NVS_MODE", 3, 3005, 309, "PLT NVS Panel", "Pilot NVS MODE Switch, FIXED/NORM/OFF")
define3PosTumb("CPG_NVS_MODE", 3, 3006, 363, "CPG NVS Panel", "Gunner NVS MODE Switch, FIXED/NORM/OFF")

--Generator Reset PANEL
defineSpringloaded_3PosTumb("PLT_GEN_RESET", 3, 3002, 3001, 355, "PLT Generator Panel", "Pilot Generator Reset Switch, GEN 1/GEN 2")
defineSpringloaded_3PosTumb("PLT_CHK_OSPD_ENG_A", 6, 3008, 3007, 353, "PLT Generator Panel", "Pilot CKT A Check Overspeed Test Switch, ENG 2/ENG 1")
defineSpringloaded_3PosTumb("PLT_CHK_OSPD_ENG_B", 6, 3010, 3009, 354, "PLT Generator Panel", "Pilot CKT B Check Overspeed Test Switch, ENG 2/ENG 1")

--ARMAMENT PANEL
definePushButton("PLT_MASTER_ARM_BTN", 3, 3014, 306, "PLT Armament Panel", "Pilot A/S Pushbutton, ARM/SAFE")
definePushButton("PLT_GROUND_OVERRIDE_BTN", 3, 3013, 307, "PLT Armament Panel", "Pilot GND ORIDE Pushbutton, ON/OFF")
definePushButton("CPG_MASTER_ARM_BTN", 3, 3016, 293, "CPG Armament Panel", "Gunner A/S Pushbutton, ARM/SAFE")
definePushButton("CPG_GROUND_OVERRIDE_BTN", 3, 3015, 294, "CPG Armament Panel", "Gunner GND ORIDE Pushbutton, ON/OFF")

--Left Console
definePushButton("PLT_JETT_STORE_LO", 75, 3001, 319, "PLT Left Console", "Pilot L OUTBD Station Select Pushbutton, ARM/SAFE")
definePushButton("PLT_JETT_STORE_LI", 75, 3002, 320, "PLT Left Console", "Pilot L INBD Station Select Pushbutton, ARM/SAFE")
definePushButton("PLT_JETT_STORE_RI", 75, 3003, 321, "PLT Left Console", "Pilot R INBD Station Select Pushbutton, ARM/SAFE")
definePushButton("PLT_JETT_STORE_RO", 75, 3004, 322, "PLT Left Console", "Pilot R OUTBD Station Select Pushbutton, ARM/SAFE")
definePushButton("PLT_JETT_STORE_LW", 75, 3005, 323, "PLT Left Console", "Pilot L TIP Station Select Pushbutton, ARM/SAFE")
definePushButton("PLT_JETT_STORE_RW", 75, 3006, 325, "PLT Left Console", "Pilot R TIP Station Select Pushbutton, ARM/SAFE")
definePushButton("PLT_JETT_BTN", 75, 3007, 324, "PLT Left Console", "Pilot JETT Pushbutton")
definePushButton("PLT_EMERG_HYD_BTN", 5, 3002, 313, "PLT Left Console", "Pilot EMERG HYD Pushbutton, ON/OFF")
definePushButton("PLT_T_WHEEL_UNLOCK_BTN", 5, 3003, 308, "PLT Left Console", "Pilot TAIL WHEEL Pushbutton, LOCK/UNLOCK")
define3PosTumb("PLT_ROTOR_BRK", 5, 3001, 314, "PLT Left Console", "Pilot Rotor Brake Switch, OFF/BRK/LOCK")
definePushButton("PLT_APU_BTN", 6, 3001, 400, "PLT Left Console", "Pilot APU Pushbutton")
defineToggleSwitch("PLT_APU_BTN_CVR", 6, 3002, 4001, "PLT Left Console", "Pilot APU Pushbutton Cover, OPEN/CLOSE")
definePotentiometer("PLT_PW_LVR_FRIC", 2, 3001, 633, {0, 1}, "PLT Left Console", "Pilot Power Lever Friction Adjustment Lever")
defineSpringloaded_3PosTumb("PLT_ENG1_START", 6, 3004, 3003, 317, "PLT Left Console", "Pilot No.1 Engine Start Switch, IGN ORIDE/START")
defineSpringloaded_3PosTumb("PLT_ENG2_START", 6, 3006, 3005, 318, "PLT Left Console", "Pilot No.2 Engine Start Switch, IGN ORIDE/START")

definePushButton("CPG_JETT_STORE_LO", 75, 3001, 368, "CPG Left Console", "Gunner L OUTBD Station Select Pushbutton, ARM/SAFE")
definePushButton("CPG_JETT_STORE_LI", 75, 3002, 369, "CPG Left Console", "Gunner L INBD Station Select Pushbutton, ARM/SAFE")
definePushButton("CPG_JETT_STORE_RI", 75, 3003, 370, "CPG Left Console", "Gunner R INBD Station Select Pushbutton, ARM/SAFE")
definePushButton("CPG_JETT_STORE_RO", 75, 3004, 371, "CPG Left Console", "Gunner R OUTBD Station Select Pushbutton, ARM/SAFE")
definePushButton("CPG_JETT_STORE_LW", 75, 3005, 372, "CPG Left Console", "Gunner L TIP Station Select Pushbutton, ARM/SAFE")
definePushButton("CPG_JETT_STORE_RW", 75, 3006, 374, "CPG Left Console", "Gunner R TIP Station Select Pushbutton, ARM/SAFE")
definePushButton("CPG_JETT_BTN", 75, 3007, 373, "CPG Left Console", "Gunner JETT Pushbutton")
definePushButton("CPG_EMERG_HYD_BTN", 5, 3004, 361, "CPG Left Console", "Gunner EMERG HYD Pushbutton, ON/OFF")
definePushButton("CPG_T_WHEEL_UNLOCK_BTN", 5, 3005, 362, "CPG Left Console", "Gunner TAIL WHEEL Pushbutton, LOCK/UNLOCK")

--FIRE Control Panel
definePushButton("PLT_FIRE_ENG1_BTN", 6, 3011, 295, "PLT Fire Control Panel", "Pilot ENG 1 Fire Pushbutton")
defineToggleSwitch("PLT_FIRE_ENG1_CVR", 6, 3012, 296, "PLT Fire Control Panel", "Pilot ENG 1 Fire Pushbutton Cover, OPEN/CLOSE")
definePushButton("PLT_FIRE_APU_BTN", 6, 3015, 297, "PLT Fire Control Panel", "Pilot APU Fire Pushbutton")
defineToggleSwitch("PLT_FIRE_APU_CVR", 6, 3016, 298, "PLT Fire Control Panel", "Pilot APU Fire Pushbutton Cover, OPEN/CLOSE")
definePushButton("PLT_FIRE_ENG2_BTN", 6, 3013, 299, "PLT Fire Control Panel", "Pilot ENG 2 Fire Pushbutton")
defineToggleSwitch("PLT_FIRE_ENG2_CVR", 6, 3014, 300, "PLT Fire Control Panel", "Pilot ENG 2 Fire Pushbutton Cover, OPEN/CLOSE")
definePushButton("PLT_FIRE_PRIME_EXT", 6, 3017, 301, "PLT Fire Control Panel", "Pilot Primary Fire Extinguisher Discharge Pushbutton")
definePushButton("PLT_FIRE_RES_EXT", 6, 3018, 303, "PLT Fire Control Panel", "Pilot Reserve Fire Extinguisher Discharge Pushbutton")
defineSpringloaded_3PosTumb("PLT_FIRE_DETECT_TEST", 6, 3019, 3020, 302, "PLT Fire Control Panel", "Pilot Fire Detection Circuit Test Switch")

definePushButton("CPG_FIRE_ENG1_BTN", 6, 3021, 284, "CPG Fire Control Panel", "Gunner ENG 1 Fire Pushbutton")
defineToggleSwitch("CPG_FIRE_ENG1_CVR", 6, 3022, 285, "CPG Fire Control Panel", "Gunner ENG 1 Fire Pushbutton Cover, OPEN/CLOSE")
definePushButton("CPG_FIRE_APU_BTN", 6, 3025, 286, "CPG Fire Control Panel", "Gunner APU Fire Pushbutton")
defineToggleSwitch("CPG_FIRE_APU_CVR", 6, 3026, 287, "CPG Fire Control Panel", "Gunner APU Fire Pushbutton Cover, OPEN/CLOSE")
definePushButton("CPG_FIRE_ENG2_BTN", 6, 3023, 288, "CPG Fire Control Panel", "Gunner ENG 2 Fire Pushbutton")
defineToggleSwitch("CPG_FIRE_ENG2_CVR", 6, 3024, 289, "CPG Fire Control Panel", "Gunner ENG 2 Fire Pushbutton Cover, OPEN/CLOSE")
definePushButton("CPG_FIRE_PRIME_EXT", 6, 3027, 290, "CPG Fire Control Panel", "Gunner Primary Fire Extinguisher Discharge Pushbutton")
definePushButton("CPG_FIRE_RES_EXT", 6, 3028, 292, "CPG Fire Control Panel", "Gunner Reserve Fire Extinguisher Discharge Pushbutton")
defineSpringloaded_3PosTumb("CPG_FIRE_DETECT_TEST", 6, 3029, 3030, 291, "CPG Fire Control Panel", "Gunner Fire Detection Circuit Test Switch")

--Cockpit
defineToggleSwitch("PLT_PARK_BRAKE", 7, 3001, 634, "PLT Cockpit", "Pilot Parking Brake Handle, Pull/Stow")
defineToggleSwitch("PLT_CANOPY", 9, 3005, 796, "PLT Cockpit", "Pilot Canopy, OPEN/CLOSE")
definePushButton("PLT_M4_TRIGGER", 9, 3009, 827, "PLT Cockpit", "Pilot M4 Trigger")
define3PosTumb("PLT_M4_SAVE", 9, 3007, 828, "PLT Cockpit", "Pilot M4 Safety")
definePushButton("PLT_DEFOG_BTN", 9, 3001, 356, "PLT Cockpit", "Pilot Defog Button")
defineTumb("PLT_WIPER_SW", 9, 3002, 357, 0.1, {0, 0.3}, nil, false, "PLT MPD Right", "Pilot Wiper Control Switch, PARK/OFF/LO/HI")
definePotentiometer("PLT_ENG_L_PW_LVR", 6, 3031, 398, {0, 1}, "PLT Cockpit", "Pilot Power Lever Smoothly (Left)")
definePotentiometer("PLT_ENG_R_PW_LVR", 6, 3032, 399, {0, 1}, "PLT Cockpit", "Pilot Power Lever Smoothly (Right)")
defineTumb("PLT_MASTER_IGN_SW", 3, 3003, 315, 0.5, {0, 1}, nil, false, "PLT Cockpit", "Pilot Master Ignition Switch, OFF/BATT/EXT PWR")

defineToggleSwitch("CPG_CANOPY", 9, 3006, 799, "CPG Cockpit", "Gunner Canopy, OPEN/CLOSE")
definePushButton("CPG_M4_TRIGGER", 9, 3010, 825, "CPG Cockpit", "Gunner M4 Trigger")
define3PosTumb("CPG_M4_SAVE", 9, 3008, 826, "CPG Cockpit", "Gunner M4 Safety")
definePushButton("CPG_DEFOG_BTN", 9, 3003, 394, "CPG Cockpit", "Gunner Defog Button")
defineTumb("CPG_WIPER_SW", 9, 3004, 395, 0.1, {0, 0.3}, nil, false, "CPG MPD Right", "Gunner Wiper Control Switch, PARK/OFF/LO/HI")
definePotentiometer("CPG_ENG_L_PW_LVR", 6, 3031, 398, {0, 1}, "CPG Cockpit", "Gunner Power Lever Smoothly (Left)")
definePotentiometer("CPG_ENG_R_PW_LVR", 6, 3032, 399, {0, 1}, "CPG Cockpit", "Gunner Power Lever Smoothly (Right)")
defineToggleSwitch("CPG_STICK_FOLD", 87, 3007, 809, "CPG Cockpit", "Gunner Stick Folding, UP/DOWN")
define3PosTumb("CPG_PROC_SEL_SW", 3, 3004, 397, "CPG Cockpit", "Gunner Processor Select Switch, SP 1/AUTO/SP 2")

defineFloat("PLT_CANOPY_POS", 795, {0, 1}, "Cockpit Gauges", "Pilot Canopy Position")
defineFloat("CPG_CANOPY_POS", 798, {0, 1}, "Cockpit Gauges", "Gunner Canopy Position")

--CMWS
defineTumb("PLT_CMWS_PW", 80, 3001, 610, 1, {-1, 0}, nil, false, "PLT CMWS", "Pilot CMWS PWR Switch, OFF/ON")
definePushButton("PLT_CMWS_PW_TEST", 80, 3002, 610, "PLT CMWS", "Pilot CMWS PWR Switch, TEST")
definePotentiometer("PLT_CMWS_VOL", 80, 3003, 611, {0, 1}, "PLT CMWS", "Pilot CMWS Audio Volume Knob")
definePotentiometer("PLT_CMWS_LAMP", 80, 3004, 612, {0, 1}, "PLT CMWS", "Pilot CMWS Lamp Knob")
defineToggleSwitch("PLT_CMWS_ARM", 80, 3005, 614, "PLT CMWS", "Pilot CMWS Flare Squibs Switch, ARM/SAFE")
defineToggleSwitch("PLT_CMWS_MODE", 80, 3006, 615, "PLT CMWS", "Pilot CMWS Mode Switch, CMWS/NAV")
defineToggleSwitch("PLT_CMWS_BYPASS", 80, 3007, 616, "PLT CMWS", "Pilot CMWS Operation Switch, BYPASS/AUTO")
defineToggleSwitch("PLT_CMWS_JETT_CVR", 80, 3008, 617, "PLT CMWS", "Pilot CMWS Flare Jettison Switch Cover, OPEN/CLOSE")
defineToggleSwitch("PLT_CMWS_JETT", 80, 3009, 618, "PLT CMWS", "Pilot CMWS Flare Jettison Switch")

--Gauges
defineFloat("PLT_IAS_NEEDLE", 469, {0, 1}, "Cockpit Gauges", "Pilot Standby Airspeed Indicator Needle")
defineFloat("PLT_FREE_AIR_TEMP", 636, {0, 1}, "Cockpit Gauges", "Pilot Free Air Temperature Gage")
defineFloat("VIB_SHEET", 820, {0, 1}, "Cockpit Gauges", "Vibration Sheet")
defineFloat("VIB_SUNSHADE", 821, {0, 1}, "Cockpit Gauges", "Vibration SunShade")
defineFloat("VIB_REMOVE", 822, {0, 1}, "Cockpit Gauges", "Vibration Remove Before Flight")
defineFloat("VIB_HOOK_TURN", 823, {0, 1}, "Cockpit Gauges", "Vibration Hook Turning")
defineFloat("VIB_HOOK_SWING", 824, {0, 1}, "Cockpit Gauges", "Vibration Hook Swinging")

-- Internal Lights
defineIndicatorLight("PLT_MASTER_WARNING_L", 424, "PLT Internal Lights", "Pilot Master Warning Indicator (yellow)")
defineIndicatorLight("PLT_MASTER_CAUTION_L", 425, "PLT Internal Lights", "Pilot Master Caution Indicator (green)")
defineIndicatorLight("PLT_ENG_1_FIRE_L", 416, "PLT Internal Lights", "Pilot Engine 1 Fire Indicator (yellow)")
defineIndicatorLight("PLT_APU_FIRE_L", 418, "PLT Internal Lights", "Pilot APU Fire Indicator (yellow)")
defineIndicatorLight("PLT_ENG_2_FIRE_L", 420, "PLT Internal Lights", "Pilot Engine 2 Fire Indicator (yellow)")
defineIndicatorLight("PLT_ENG_1_READY_L", 417, "PLT Internal Lights", "Pilot Engine 1 Ready Indicator (green)")
defineIndicatorLight("PLT_APU_READY_L", 419, "PLT Internal Lights", "Pilot APU Ready Indicator (green)")
defineIndicatorLight("PLT_ENG_2_READY_L", 421, "PLT Internal Lights", "Pilot Engine 2 Ready Indicator (green)")
defineIndicatorLight("PLT_FIRE_EXT_DISCH_PRI_L", 422, "PLT Internal Lights", "Pilot Primary Fire Extinguisher Discharge Indicator (green)")
defineIndicatorLight("PLT_FIRE_EXT_DISCH_RES_L", 423, "PLT Internal Lights", "Pilot Reserve Fire Extinguisher Discharge Indicator (green)")
defineIndicatorLight("PLT_EMERG_GUARD_L", 403, "PLT Internal Lights", "Pilot Emergency Guard Indicator (green)")
defineIndicatorLight("PLT_EMERG_XPNDR_L", 404, "PLT Internal Lights", "Pilot Emergency Transponder Indicator (green)")
defineIndicatorLight("PLT_EMERG_HYD_L", 405, "PLT Internal Lights", "Pilot Emergency Hydraulics Indicator (green)")
defineIndicatorLight("PLT_T_WHEEL_UNLOCK_L", 402, "PLT Internal Lights", "Pilot Tail Wheel Unlock Indicator (green)")
defineIndicatorLight("PLT_JETT_L_TIP_L", 411, "PLT Internal Lights", "Pilot Jettison Left Tip Indicator (green)")
defineIndicatorLight("PLT_JETT_L_OUTBOARD_L", 407, "PLT Internal Lights", "Pilot Jettison Left Outboard Indicator (green)")
defineIndicatorLight("PLT_JETT_L_INBOARD_L", 408, "PLT Internal Lights", "Pilot Jettison Left Inboard Indicator (green)")
defineIndicatorLight("PLT_JETT_R_INBOARD_L", 409, "PLT Internal Lights", "Pilot Jettison Right Inboard Indicator (green)")
defineIndicatorLight("PLT_JETT_R_TIP_L", 412, "PLT Internal Lights", "Pilot Jettison Right Tip Indicator (green)")
defineIndicatorLight("PLT_JETT_R_OUTBOARD_L", 410, "PLT Internal Lights", "Pilot Jettison Right Outboard Indicator (green)")
defineIndicatorLight("PLT_MASTER_ARM_ARM_L", 413, "PLT Internal Lights", "Pilot Master Arm Armed Indicator (yellow)")
defineIndicatorLight("PLT_MASTER_ARM_SAFE_L", 414, "PLT Internal Lights", "Pilot Master Arm Safe Indicator (green)")
defineIndicatorLight("PLT_GROUND_OVERRIDE_L", 415, "PLT Internal Lights", "Pilot Ground Override Indicator (green)")
defineIndicatorLight("PLT_APU_L", 406, "PLT Internal Lights", "Pilot APU On Indicator (green)")
defineFloat("PLT_INT_PANEL_L", 788, {0, 1}, "PLT Internal Lights", "Pilot Panel Lightning (light green)")
defineFloat("PLT_INT_FLOOD_L", 790, {0, 1}, "PLT Internal Lights", "Pilot Flood Lightning (light green)")
defineFloat("PLT_INT_GAUGES_L", 787, {0, 1}, "PLT Internal Lights", "Pilot Gauges Lightning (light green)")
defineFloat("PLT_SIGNAL_L", 793, {0, 1}, "PLT Internal Lights", "Pilot Signal Light (multi color)")

defineIndicatorLight("CPG_MASTER_WARNING_L", 806, "CPG Internal Lights", "Gunner Master Warning Indicator (yellow)")
defineIndicatorLight("CPG_MASTER_CAUTION_L", 808, "CPG Internal Lights", "Gunner Master Caution Indicator (green)")
defineIndicatorLight("CPG_ENG_1_FIRE_L", 441, "CPG Internal Lights", "Gunner Engine 1 Fire Indicator (yellow)")
defineIndicatorLight("CPG_APU_FIRE_L", 443, "CPG Internal Lights", "Gunner APU Fire Indicator (yellow)")
defineIndicatorLight("CPG_ENG_2_FIRE_L", 445, "CPG Internal Lights", "Gunner Engine 2 Fire Indicator (yellow)")
defineIndicatorLight("CPG_ENG_1_READY_L", 442, "CPG Internal Lights", "Gunner Engine 1 Ready Indicator (green)")
defineIndicatorLight("CPG_APU_READY_L", 444, "CPG Internal Lights", "Gunner APU Ready Indicator (green)")
defineIndicatorLight("CPG_ENG_2_READY_L", 446, "CPG Internal Lights", "Gunner Engine 2 Ready Indicator (green)")
defineIndicatorLight("CPG_FIRE_EXT_DISCH_PRI_L", 447, "CPG Internal Lights", "Gunner Primary Fire Extinguisher Discharge Indicator (green)")
defineIndicatorLight("CPG_FIRE_EXT_DISCH_RES_L", 448, "CPG Internal Lights", "Gunner Reserve Fire Extinguisher Discharge Indicator (green)")
defineIndicatorLight("CPG_EMERG_GUARD_L", 427, "CPG Internal Lights", "Gunner Emergency Guard Indicator (green)")
defineIndicatorLight("CPG_EMERG_XPNDR_L", 428, "CPG Internal Lights", "Gunner Emergency Transponder Indicator (green)")
defineIndicatorLight("CPG_EMERG_HYD_L", 429, "CPG Internal Lights", "Gunner Emergency Hydraulics Indicator (green)")
defineIndicatorLight("CPG_T_WHEEL_UNLOCK_L", 426, "CPG Internal Lights", "Gunner Tail Wheel Unlock Indicator (green)")
defineIndicatorLight("CPG_JETT_L_TIP_L", 434, "CPG Internal Lights", "Gunner Jettison Left Tip Indicator (green)")
defineIndicatorLight("CPG_JETT_L_OUTBOARD_L", 430, "CPG Internal Lights", "Gunner Jettison Left Outboard Indicator (green)")
defineIndicatorLight("CPG_JETT_L_INBOARD_L", 431, "CPG Internal Lights", "Gunner Jettison Left Inboard Indicator (green)")
defineIndicatorLight("CPG_JETT_R_INBOARD_L", 432, "CPG Internal Lights", "Gunner Jettison Right Inboard Indicator (green)")
defineIndicatorLight("CPG_JETT_R_TIP_L", 433, "CPG Internal Lights", "Gunner Jettison Right Tip Indicator (green)")
defineIndicatorLight("CPG_JETT_R_OUTBOARD_L", 435, "CPG Internal Lights", "Gunner Jettison Right Outboard Indicator (green)")
defineIndicatorLight("CPG_MASTER_ARM_ARM_L", 438, "CPG Internal Lights", "Gunner Master Arm Armed Indicator (yellow)")
defineIndicatorLight("CPG_MASTER_ARM_SAFE_L", 439, "CPG Internal Lights", "Gunner Master Arm Safe Indicator (green)")
defineIndicatorLight("CPG_GROUND_OVERRIDE_L", 440, "CPG Internal Lights", "Gunner Ground Override Indicator (green)")
defineIndicatorLight("CPG_PROCESSOR_SP_1_L", 436, "CPG Internal Lights", "Gunner Processor Select SP 1 Indicator (green)")
defineIndicatorLight("CPG_PROCESSOR_SP_2_L", 437, "CPG Internal Lights", "Gunner Processor Select SP 2 Indicator (green)")
defineFloat("CPG_INT_PANEL_L", 789, {0, 1}, "CPG Internal Lights", "Gunner Panel Lightning (light green)")
defineFloat("CPG_INT_FLOOD_L", 791, {0, 1}, "CPG Internal Lights", "Gunner Flood Lightning (light green)")
defineFloat("CPG_SIGNAL_L", 794, {0, 1}, "CPG Internal Lights", "Gunner Signal Light (multi color)")

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

defineToggleSwitch("PLT_L_SUNVISOR", 9, 3017, 849, "PLT Cockpit", "Pilot Left Sunvisor")
defineToggleSwitch("PLT_R_SUNVISOR", 9, 3018, 850, "PLT Cockpit", "Pilot Right Sunvisor")

--CMWS Display
local flare_letter = ""
local flare_count = ""
local chaff_letter = ""
local chaff_count = ""
local bit_line_1 = ""
local bit_line_2 = ""
local d_light_bright = 0
local d_light_dim = 0
local r_light_bright = 0
local r_light_dim = 0

local fwd_left_sector_brt = 0
local aft_left_sector_brt = 0
local aft_right_sector_brt = 0
local fwd_right_sector_brt = 0
local fwd_left_sector_dim = 0
local aft_left_sector_dim = 0
local aft_right_sector_dim = 0
local fwd_right_sector_dim = 0

local cmws_page = ""

local function int_for_flag(flag)
	if flag ~= nil then return 1 else return 0 end
end

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local cmws = parse_indication(24)

	flare_letter = ""
	flare_count = ""
	chaff_letter = ""
	chaff_count = ""
	bit_line_1 = ""
	bit_line_2 = ""
	d_light_bright = 0
	d_light_dim = 0
	r_light_bright = 0
	r_light_dim = 0
	fwd_left_sector_brt = 0
	aft_left_sector_brt = 0
	aft_right_sector_brt = 0
	fwd_right_sector_brt = 0
	fwd_left_sector_dim = 0
	aft_left_sector_dim = 0
	aft_right_sector_dim = 0
	fwd_right_sector_dim = 0
	cmws_page = "NONE"

	if cmws == nil then return end

	-- the test page doesn't have numbers these high, and these should always be present on the main page
	-- there doesn't seem to be a good alternative way to verify the page at the moment.
	-- additionally, none of the values for the cmws are actually exported with a name at present, so they
	-- all have to be accessed by this numbering scheme. It's entirely possible this will break in the future.
	local is_test_page = cmws["#83#"] == nil or cmws["#84#"] == nil or cmws["#85#"] == nil or cmws["#86#"] == nil

	if is_test_page then
		cmws_page = "TEST"
		bit_line_1 = coerce_nil_to_string(cmws["#42#"])
		bit_line_2 = coerce_nil_to_string(cmws["#43#"])

		-- these values are all guesses
		d_light_dim = int_for_flag(cmws["#45#"])
		r_light_dim =int_for_flag(cmws["#44#"])
		fwd_left_sector_dim = int_for_flag(cmws["#8#"])
		aft_left_sector_dim = int_for_flag(cmws["#7#"])
		aft_right_sector_dim = int_for_flag(cmws["#6#"])
		fwd_right_sector_dim = int_for_flag(cmws["#9#"])
	else
		cmws_page = "MAIN"
		flare_letter = coerce_nil_to_string(cmws["#83#"])
		chaff_letter = coerce_nil_to_string(cmws["#84#"])
		flare_count = coerce_nil_to_string(cmws["#85#"])
		chaff_count = coerce_nil_to_string(cmws["#86#"])
		d_light_bright = int_for_flag(cmws["#88#"])
		d_light_dim = int_for_flag(cmws["#90#"])
		r_light_bright = int_for_flag(cmws["#87#"])
		r_light_dim = int_for_flag(cmws["#89#"])

		fwd_left_sector_brt = int_for_flag(cmws["#8#"])
		aft_left_sector_brt = int_for_flag(cmws["#7#"])
		aft_right_sector_brt = int_for_flag(cmws["#6#"])
		fwd_right_sector_brt = int_for_flag(cmws["#9#"])
		-- these values are all guesses
		fwd_left_sector_dim = int_for_flag(cmws["#49#"])
		aft_left_sector_dim = int_for_flag(cmws["#48#"])
		aft_right_sector_dim = int_for_flag(cmws["#47#"])
		fwd_right_sector_dim = int_for_flag(cmws["#50#"])
	end
end

-- export the page for utility purposes
defineString("PLT_CMWS_PAGE", function() return cmws_page end, 4, "PLT CMWS", "CMWS Display Page (NONE/MAIN/TEST)")

-- text lines
defineString("PLT_CMWS_FLARE_LETTER", function() return flare_letter end, 1, "PLT CMWS", "Flare Letter (F)")
defineString("PLT_CMWS_FLARE_COUNT", function() return flare_count end, 3, "PLT CMWS", "Flare Count")
defineString("PLT_CMWS_CHAFF_LETTER", function() return chaff_letter end, 1, "PLT CMWS", "Chaff Letter (C)")
defineString("PLT_CMWS_CHAFF_COUNT", function() return chaff_count end, 3, "PLT CMWS", "Chaff Count")
defineString("PLT_CMWS_BIT_LINE_1", function() return bit_line_1 end, 3, "PLT CMWS", "Bit test line 1 ('BIT'/'SYS')")
defineString("PLT_CMWS_BIT_LINE_2", function() return bit_line_2 end, 4, "PLT CMWS", "Bit test line 2 ('I/P'/'PASS')")

-- symbology lights
-- when the display is on the lights are in the DIM state, and when they are indicating they are in the BRT state
defineIntegerFromGetter("PLT_CMWS_R_BRT_L", function() return r_light_bright end, 1, "PLT CMWS", "R light, bright (orange)")
defineIntegerFromGetter("PLT_CMWS_R_DIM_L", function() return r_light_dim end, 1, "PLT CMWS", "R light, dim (orange)")
defineIntegerFromGetter("PLT_CMWS_D_BRT_L", function() return d_light_bright end, 1, "PLT CMWS", "D light, bright (orange)")
defineIntegerFromGetter("PLT_CMWS_D_DIM_L", function() return d_light_dim end, 1, "PLT CMWS", "D light, dim (orange)")
defineIntegerFromGetter("PLT_CMWS_FWD_LEFT_BRT_L", function() return fwd_left_sector_brt end, 1, "PLT CMWS", "Forward left sector lights, bright (orange)")
defineIntegerFromGetter("PLT_CMWS_AFT_LEFT_BRT_L", function() return aft_left_sector_brt end, 1, "PLT CMWS", "Aft left sector lights, bright (orange)")
defineIntegerFromGetter("PLT_CMWS_AFT_RIGHT_BRT_L", function() return aft_right_sector_brt end, 1, "PLT CMWS", "Aft right sector lights, bright (orange)")
defineIntegerFromGetter("PLT_CMWS_FWD_RIGHT_BRT_L", function() return fwd_right_sector_brt end, 1, "PLT CMWS", "Forward right sector lights, bright (orange)")
defineIntegerFromGetter("PLT_CMWS_FWD_LEFT_DIM_L", function() return fwd_left_sector_dim end, 1, "PLT CMWS", "Forward left sector lights, dim (orange)")
defineIntegerFromGetter("PLT_CMWS_AFT_LEFT_DIM_L", function() return aft_left_sector_dim end, 1, "PLT CMWS", "Aft left sector lights, dim (orange)")
defineIntegerFromGetter("PLT_CMWS_AFT_RIGHT_DIM_L", function() return aft_right_sector_dim end, 1, "PLT CMWS", "Aft right sector lights, dim (orange)")
defineIntegerFromGetter("PLT_CMWS_FWD_RIGHT_DIM_L", function() return fwd_right_sector_dim end, 1, "PLT CMWS", "Forward right sector lights, dim (orange)")

BIOS.protocol.endModule()