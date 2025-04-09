module("AH-64D", package.seeall)

local AH_64D_EUFD = require("Scripts.DCS-BIOS.lib.modules.displays.AH_64D_EUFD")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local TextDisplay = require("Scripts.DCS-BIOS.lib.modules.TextDisplay")

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class AH_64D: Module
local AH_64D = Module:new("AH-64D", 0x8000, { "AH-64D_BLK_II" })

--v1.2d by WarLord & charliefoxtwo

-- remove Arg# PLT 956; CPG 957

local devices = {
	CONTROL_INTERFACE = 2,
	HOTAS_INPUT = 25,
	EUFD_PLT = 48,
	EUFD_CPG = 49,
}

--Functions
--- Parses keyboard unit data
local function parse_ku(indicator_id)
	local ku = AH_64D.parse_indication(indicator_id)
	return Functions.coerce_nil_to_string(ku.Standby_text)
end

--MPD Left
AH_64D:definePushButton("PLT_MPD_L_T1", 42, 3001, 20, "PLT MPD Left", "Pilot Left MPD T1 Button")
AH_64D:definePushButton("PLT_MPD_L_T2", 42, 3002, 21, "PLT MPD Left", "Pilot Left MPD T2 Button")
AH_64D:definePushButton("PLT_MPD_L_T3", 42, 3003, 22, "PLT MPD Left", "Pilot Left MPD T3 Button")
AH_64D:definePushButton("PLT_MPD_L_T4", 42, 3004, 23, "PLT MPD Left", "Pilot Left MPD T4 Button")
AH_64D:definePushButton("PLT_MPD_L_T5", 42, 3005, 24, "PLT MPD Left", "Pilot Left MPD T5 Button")
AH_64D:definePushButton("PLT_MPD_L_T6", 42, 3006, 25, "PLT MPD Left", "Pilot Left MPD T6 Button")
AH_64D:definePushButton("PLT_MPD_L_R1", 42, 3007, 28, "PLT MPD Left", "Pilot Left MPD R1 Button")
AH_64D:definePushButton("PLT_MPD_L_R2", 42, 3008, 29, "PLT MPD Left", "Pilot Left MPD R2 Button")
AH_64D:definePushButton("PLT_MPD_L_R3", 42, 3009, 30, "PLT MPD Left", "Pilot Left MPD R3 Button")
AH_64D:definePushButton("PLT_MPD_L_R4", 42, 3010, 31, "PLT MPD Left", "Pilot Left MPD R4 Button")
AH_64D:definePushButton("PLT_MPD_L_R5", 42, 3011, 32, "PLT MPD Left", "Pilot Left MPD R5 Button")
AH_64D:definePushButton("PLT_MPD_L_R6", 42, 3012, 33, "PLT MPD Left", "Pilot Left MPD R6 Button")
AH_64D:definePushButton("PLT_MPD_L_B1", 42, 3018, 42, "PLT MPD Left", "Pilot Left MPD B1/M(Menu) Button")
AH_64D:definePushButton("PLT_MPD_L_B2", 42, 3017, 41, "PLT MPD Left", "Pilot Left MPD B2 Button")
AH_64D:definePushButton("PLT_MPD_L_B3", 42, 3016, 40, "PLT MPD Left", "Pilot Left MPD B3 Button")
AH_64D:definePushButton("PLT_MPD_L_B4", 42, 3015, 39, "PLT MPD Left", "Pilot Left MPD B4 Button")
AH_64D:definePushButton("PLT_MPD_L_B5", 42, 3014, 38, "PLT MPD Left", "Pilot Left MPD B5 Button")
AH_64D:definePushButton("PLT_MPD_L_B6", 42, 3013, 37, "PLT MPD Left", "Pilot Left MPD B6 Button")
AH_64D:definePushButton("PLT_MPD_L_L1", 42, 3024, 17, "PLT MPD Left", "Pilot Left MPD L1 Button")
AH_64D:definePushButton("PLT_MPD_L_L2", 42, 3023, 16, "PLT MPD Left", "Pilot Left MPD L2 Button")
AH_64D:definePushButton("PLT_MPD_L_L3", 42, 3022, 15, "PLT MPD Left", "Pilot Left MPD L3 Button")
AH_64D:definePushButton("PLT_MPD_L_L4", 42, 3021, 14, "PLT MPD Left", "Pilot Left MPD L4 Button")
AH_64D:definePushButton("PLT_MPD_L_L5", 42, 3020, 13, "PLT MPD Left", "Pilot Left MPD L5 Button")
AH_64D:definePushButton("PLT_MPD_L_L6", 42, 3019, 12, "PLT MPD Left", "Pilot Left MPD L6 Button")
AH_64D:definePushButton("PLT_MPD_L_AST", 42, 3025, 27, "PLT MPD Left", "Pilot Left MPD Asterisk Button")
AH_64D:definePushButton("PLT_MPD_L_VID", 42, 3026, 34, "PLT MPD Left", "Pilot Left MPD VID Button")
AH_64D:definePushButton("PLT_MPD_L_COM", 42, 3027, 35, "PLT MPD Left", "Pilot Left MPD COM Button")
AH_64D:definePushButton("PLT_MPD_L_AC", 42, 3028, 36, "PLT MPD Left", "Pilot Left MPD A/C Button")
AH_64D:definePushButton("PLT_MPD_L_TSD", 42, 3029, 43, "PLT MPD Left", "Pilot Left MPD TSD Button")
AH_64D:definePushButton("PLT_MPD_L_WPN", 42, 3030, 10, "PLT MPD Left", "Pilot Left MPD WPN Button")
AH_64D:definePushButton("PLT_MPD_L_FCR", 42, 3031, 11, "PLT MPD Left", "Pilot Left MPD FCR Button")
AH_64D:definePotentiometer("PLT_MPD_L_BRT", 42, 3032, 18, { 0, 1 }, "PLT MPD Left", "Pilot Left MPD Brightness Control Knob")
AH_64D:definePotentiometer("PLT_MPD_L_VIDEO", 42, 3033, 19, { 0, 1 }, "PLT MPD Left", "Pilot Left MPD Video Control Knob")
AH_64D:defineTumb("PLT_MPD_L_MODE", 42, 3034, 26, 0.5, { 0, 1 }, nil, false, "PLT MPD Left", "Pilot Left MPD Mode Knob, DAY/NIGHT/MONO")

AH_64D:definePushButton("CPG_MPD_L_T1", 44, 3001, 88, "CPG MPD Left", "Gunner Left MPD T1 Button")
AH_64D:definePushButton("CPG_MPD_L_T2", 44, 3002, 89, "CPG MPD Left", "Gunner Left MPD T2 Button")
AH_64D:definePushButton("CPG_MPD_L_T3", 44, 3003, 90, "CPG MPD Left", "Gunner Left MPD T3 Button")
AH_64D:definePushButton("CPG_MPD_L_T4", 44, 3004, 91, "CPG MPD Left", "Gunner Left MPD T4 Button")
AH_64D:definePushButton("CPG_MPD_L_T5", 44, 3005, 92, "CPG MPD Left", "Gunner Left MPD T5 Button")
AH_64D:definePushButton("CPG_MPD_L_T6", 44, 3006, 93, "CPG MPD Left", "Gunner Left MPD T6 Button")
AH_64D:definePushButton("CPG_MPD_L_R1", 44, 3007, 96, "CPG MPD Left", "Gunner Left MPD R1 Button")
AH_64D:definePushButton("CPG_MPD_L_R2", 44, 3008, 97, "CPG MPD Left", "Gunner Left MPD R2 Button")
AH_64D:definePushButton("CPG_MPD_L_R3", 44, 3009, 98, "CPG MPD Left", "Gunner Left MPD R3 Button")
AH_64D:definePushButton("CPG_MPD_L_R4", 44, 3010, 99, "CPG MPD Left", "Gunner Left MPD R4 Button")
AH_64D:definePushButton("CPG_MPD_L_R5", 44, 3011, 100, "CPG MPD Left", "Gunner Left MPD R5 Button")
AH_64D:definePushButton("CPG_MPD_L_R6", 44, 3012, 101, "CPG MPD Left", "Gunner Left MPD R6 Button")
AH_64D:definePushButton("CPG_MPD_L_B1", 44, 3018, 110, "CPG MPD Left", "Gunner Left MPD B1/M(Menu) Button")
AH_64D:definePushButton("CPG_MPD_L_B2", 44, 3017, 109, "CPG MPD Left", "Gunner Left MPD B2 Button")
AH_64D:definePushButton("CPG_MPD_L_B3", 44, 3016, 108, "CPG MPD Left", "Gunner Left MPD B3 Button")
AH_64D:definePushButton("CPG_MPD_L_B4", 44, 3015, 107, "CPG MPD Left", "Gunner Left MPD B4 Button")
AH_64D:definePushButton("CPG_MPD_L_B5", 44, 3014, 106, "CPG MPD Left", "Gunner Left MPD B5 Button")
AH_64D:definePushButton("CPG_MPD_L_B6", 44, 3013, 105, "CPG MPD Left", "Gunner Left MPD B6 Button")
AH_64D:definePushButton("CPG_MPD_L_L1", 44, 3024, 80, "CPG MPD Left", "Gunner Left MPD L1 Button")
AH_64D:definePushButton("CPG_MPD_L_L2", 44, 3023, 81, "CPG MPD Left", "Gunner Left MPD L2 Button")
AH_64D:definePushButton("CPG_MPD_L_L3", 44, 3022, 82, "CPG MPD Left", "Gunner Left MPD L3 Button")
AH_64D:definePushButton("CPG_MPD_L_L4", 44, 3021, 83, "CPG MPD Left", "Gunner Left MPD L4 Button")
AH_64D:definePushButton("CPG_MPD_L_L5", 44, 3020, 84, "CPG MPD Left", "Gunner Left MPD L5 Button")
AH_64D:definePushButton("CPG_MPD_L_L6", 44, 3019, 85, "CPG MPD Left", "Gunner Left MPD L6 Button")
AH_64D:definePushButton("CPG_MPD_L_AST", 44, 3025, 95, "CPG MPD Left", "Gunner Left MPD Asterisk Button")
AH_64D:definePushButton("CPG_MPD_L_VID", 44, 3026, 102, "CPG MPD Left", "Gunner Left MPD VID Button")
AH_64D:definePushButton("CPG_MPD_L_COM", 44, 3027, 103, "CPG MPD Left", "Gunner Left MPD COM Button")
AH_64D:definePushButton("CPG_MPD_L_AC", 44, 3028, 104, "CPG MPD Left", "Gunner Left MPD A/C Button")
AH_64D:definePushButton("CPG_MPD_L_TSD", 44, 3029, 111, "CPG MPD Left", "Gunner Left MPD TSD Button")
AH_64D:definePushButton("CPG_MPD_L_WPN", 44, 3030, 78, "CPG MPD Left", "Gunner Left MPD WPN Button")
AH_64D:definePushButton("CPG_MPD_L_FCR", 44, 3031, 79, "CPG MPD Left", "Gunner Left MPD FCR Button")
AH_64D:definePotentiometer("CPG_MPD_L_BRT", 44, 3032, 86, { 0, 1 }, "CPG MPD Left", "Gunner Left MPD Brightness Control Knob")
AH_64D:definePotentiometer("CPG_MPD_L_VIDEO", 44, 3033, 87, { 0, 1 }, "CPG MPD Left", "Gunner Left MPD Video Control Knob")
AH_64D:defineTumb("CPG_MPD_L_MODE", 44, 3034, 94, 0.5, { 0, 1 }, nil, false, "CPG MPD Left", "Gunner Left MPD Mode Knob, DAY/NIGHT/MONO")

--MPD Right
AH_64D:definePushButton("PLT_MPD_R_T1", 43, 3001, 54, "PLT MPD Right", "Pilot Right MPD T1 Button")
AH_64D:definePushButton("PLT_MPD_R_T2", 43, 3002, 55, "PLT MPD Right", "Pilot Right MPD T2 Button")
AH_64D:definePushButton("PLT_MPD_R_T3", 43, 3003, 56, "PLT MPD Right", "Pilot Right MPD T3 Button")
AH_64D:definePushButton("PLT_MPD_R_T4", 43, 3004, 57, "PLT MPD Right", "Pilot Right MPD T4 Button")
AH_64D:definePushButton("PLT_MPD_R_T5", 43, 3005, 58, "PLT MPD Right", "Pilot Right MPD T5 Button")
AH_64D:definePushButton("PLT_MPD_R_T6", 43, 3006, 59, "PLT MPD Right", "Pilot Right MPD T6 Button")
AH_64D:definePushButton("PLT_MPD_R_R1", 43, 3007, 62, "PLT MPD Right", "Pilot Right MPD R1 Button")
AH_64D:definePushButton("PLT_MPD_R_R2", 43, 3008, 63, "PLT MPD Right", "Pilot Right MPD R2 Button")
AH_64D:definePushButton("PLT_MPD_R_R3", 43, 3009, 64, "PLT MPD Right", "Pilot Right MPD R3 Button")
AH_64D:definePushButton("PLT_MPD_R_R4", 43, 3010, 65, "PLT MPD Right", "Pilot Right MPD R4 Button")
AH_64D:definePushButton("PLT_MPD_R_R5", 43, 3011, 66, "PLT MPD Right", "Pilot Right MPD R5 Button")
AH_64D:definePushButton("PLT_MPD_R_R6", 43, 3012, 67, "PLT MPD Right", "Pilot Right MPD R6 Button")
AH_64D:definePushButton("PLT_MPD_R_B1", 43, 3018, 76, "PLT MPD Right", "Pilot Right MPD B1/M(Menu) Button")
AH_64D:definePushButton("PLT_MPD_R_B2", 43, 3017, 75, "PLT MPD Right", "Pilot Right MPD B2 Button")
AH_64D:definePushButton("PLT_MPD_R_B3", 43, 3016, 74, "PLT MPD Right", "Pilot Right MPD B3 Button")
AH_64D:definePushButton("PLT_MPD_R_B4", 43, 3015, 73, "PLT MPD Right", "Pilot Right MPD B4 Button")
AH_64D:definePushButton("PLT_MPD_R_B5", 43, 3014, 72, "PLT MPD Right", "Pilot Right MPD B5 Button")
AH_64D:definePushButton("PLT_MPD_R_B6", 43, 3013, 71, "PLT MPD Right", "Pilot Right MPD B6 Button")
AH_64D:definePushButton("PLT_MPD_R_L1", 43, 3024, 51, "PLT MPD Right", "Pilot Right MPD L1 Button")
AH_64D:definePushButton("PLT_MPD_R_L2", 43, 3023, 50, "PLT MPD Right", "Pilot Right MPD L2 Button")
AH_64D:definePushButton("PLT_MPD_R_L3", 43, 3022, 49, "PLT MPD Right", "Pilot Right MPD L3 Button")
AH_64D:definePushButton("PLT_MPD_R_L4", 43, 3021, 48, "PLT MPD Right", "Pilot Right MPD L4 Button")
AH_64D:definePushButton("PLT_MPD_R_L5", 43, 3020, 47, "PLT MPD Right", "Pilot Right MPD L5 Button")
AH_64D:definePushButton("PLT_MPD_R_L6", 43, 3019, 46, "PLT MPD Right", "Pilot Right MPD L6 Button")
AH_64D:definePushButton("PLT_MPD_R_AST", 43, 3025, 61, "PLT MPD Right", "Pilot Right MPD Asterisk Button")
AH_64D:definePushButton("PLT_MPD_R_VID", 43, 3026, 68, "PLT MPD Right", "Pilot Right MPD VID Button")
AH_64D:definePushButton("PLT_MPD_R_COM", 43, 3027, 69, "PLT MPD Right", "Pilot Right MPD COM Button")
AH_64D:definePushButton("PLT_MPD_R_AC", 43, 3028, 70, "PLT MPD Right", "Pilot Right MPD A/C Button")
AH_64D:definePushButton("PLT_MPD_R_TSD", 43, 3029, 77, "PLT MPD Right", "Pilot Right MPD TSD Button")
AH_64D:definePushButton("PLT_MPD_R_WPN", 43, 3030, 44, "PLT MPD Right", "Pilot Right MPD WPN Button")
AH_64D:definePushButton("PLT_MPD_R_FCR", 43, 3031, 45, "PLT MPD Right", "Pilot Right MPD FCR Button")
AH_64D:definePotentiometer("PLT_MPD_R_BRT", 43, 3032, 52, { 0, 1 }, "PLT MPD Right", "Pilot Right MPD Brightness Control Knob")
AH_64D:definePotentiometer("PLT_MPD_R_VIDEO", 43, 3033, 53, { 0, 1 }, "PLT MPD Right", "Pilot Right MPD Video Control Knob")
AH_64D:defineTumb("PLT_MPD_R_MODE", 43, 3034, 60, 0.5, { 0, 1 }, nil, false, "PLT MPD Right", "Pilot Right MPD Mode Knob, DAY/NIGHT/MONO")

AH_64D:definePushButton("CPG_MPD_R_T1", 45, 3001, 122, "CPG MPD Right", "Gunner Right MPD T1 Button")
AH_64D:definePushButton("CPG_MPD_R_T2", 45, 3002, 123, "CPG MPD Right", "Gunner Right MPD T2 Button")
AH_64D:definePushButton("CPG_MPD_R_T3", 45, 3003, 124, "CPG MPD Right", "Gunner Right MPD T3 Button")
AH_64D:definePushButton("CPG_MPD_R_T4", 45, 3004, 125, "CPG MPD Right", "Gunner Right MPD T4 Button")
AH_64D:definePushButton("CPG_MPD_R_T5", 45, 3005, 126, "CPG MPD Right", "Gunner Right MPD T5 Button")
AH_64D:definePushButton("CPG_MPD_R_T6", 45, 3006, 127, "CPG MPD Right", "Gunner Right MPD T6 Button")
AH_64D:definePushButton("CPG_MPD_R_R1", 45, 3007, 130, "CPG MPD Right", "Gunner Right MPD R1 Button")
AH_64D:definePushButton("CPG_MPD_R_R2", 45, 3008, 131, "CPG MPD Right", "Gunner Right MPD R2 Button")
AH_64D:definePushButton("CPG_MPD_R_R3", 45, 3009, 132, "CPG MPD Right", "Gunner Right MPD R3 Button")
AH_64D:definePushButton("CPG_MPD_R_R4", 45, 3010, 133, "CPG MPD Right", "Gunner Right MPD R4 Button")
AH_64D:definePushButton("CPG_MPD_R_R5", 45, 3011, 134, "CPG MPD Right", "Gunner Right MPD R5 Button")
AH_64D:definePushButton("CPG_MPD_R_R6", 45, 3012, 135, "CPG MPD Right", "Gunner Right MPD R6 Button")
AH_64D:definePushButton("CPG_MPD_R_B1", 45, 3018, 144, "CPG MPD Right", "Gunner Right MPD B1/M(Menu) Button")
AH_64D:definePushButton("CPG_MPD_R_B2", 45, 3017, 143, "CPG MPD Right", "Gunner Right MPD B2 Button")
AH_64D:definePushButton("CPG_MPD_R_B3", 45, 3016, 142, "CPG MPD Right", "Gunner Right MPD B3 Button")
AH_64D:definePushButton("CPG_MPD_R_B4", 45, 3015, 141, "CPG MPD Right", "Gunner Right MPD B4 Button")
AH_64D:definePushButton("CPG_MPD_R_B5", 45, 3014, 140, "CPG MPD Right", "Gunner Right MPD B5 Button")
AH_64D:definePushButton("CPG_MPD_R_B6", 45, 3013, 139, "CPG MPD Right", "Gunner Right MPD B6 Button")
AH_64D:definePushButton("CPG_MPD_R_L1", 45, 3024, 119, "CPG MPD Right", "Gunner Right MPD L1 Button")
AH_64D:definePushButton("CPG_MPD_R_L2", 45, 3023, 118, "CPG MPD Right", "Gunner Right MPD L2 Button")
AH_64D:definePushButton("CPG_MPD_R_L3", 45, 3022, 117, "CPG MPD Right", "Gunner Right MPD L3 Button")
AH_64D:definePushButton("CPG_MPD_R_L4", 45, 3021, 116, "CPG MPD Right", "Gunner Right MPD L4 Button")
AH_64D:definePushButton("CPG_MPD_R_L5", 45, 3020, 115, "CPG MPD Right", "Gunner Right MPD L5 Button")
AH_64D:definePushButton("CPG_MPD_R_L6", 45, 3019, 114, "CPG MPD Right", "Gunner Right MPD L6 Button")
AH_64D:definePushButton("CPG_MPD_R_AST", 45, 3025, 129, "CPG MPD Right", "Gunner Right MPD Asterisk Button")
AH_64D:definePushButton("CPG_MPD_R_VID", 45, 3026, 136, "CPG MPD Right", "Gunner Right MPD VID Button")
AH_64D:definePushButton("CPG_MPD_R_COM", 45, 3027, 137, "CPG MPD Right", "Gunner Right MPD COM Button")
AH_64D:definePushButton("CPG_MPD_R_AC", 45, 3028, 138, "CPG MPD Right", "Gunner Right MPD A/C Button")
AH_64D:definePushButton("CPG_MPD_R_TSD", 45, 3029, 145, "CPG MPD Right", "Gunner Right MPD TSD Button")
AH_64D:definePushButton("CPG_MPD_R_WPN", 45, 3030, 112, "CPG MPD Right", "Gunner Right MPD WPN Button")
AH_64D:definePushButton("CPG_MPD_R_FCR", 45, 3031, 113, "CPG MPD Right", "Gunner Right MPD FCR Button")
AH_64D:definePotentiometer("CPG_MPD_R_BRT", 45, 3032, 120, { 0, 1 }, "CPG MPD Right", "Gunner Right MPD Brightness Control Knob")
AH_64D:definePotentiometer("CPG_MPD_R_VIDEO", 45, 3033, 121, { 0, 1 }, "CPG MPD Right", "Gunner Right MPD Video Control Knob")
AH_64D:defineTumb("CPG_MPD_R_MODE", 45, 3034, 128, 0.5, { 0, 1 }, nil, false, "CPG MPD Right", "Gunner Right MPD Mode Knob, DAY/NIGHT/MONO")

--External Light System
AH_64D:define3PosTumb("PLT_EXTL_NAV_L_SW", 10, 3002, 326, "PLT External Light System", "Pilot Navigation Lights Switch, BRT/OFF/DIM")
AH_64D:definePotentiometer("PLT_EXTL_FROMATION_L_KNB", 10, 3001, 329, { 0, 1 }, "PLT External Light System", "Pilot Formation Lights Control Knob")
AH_64D:define3PosTumb("PLT_EXTL_ACOL_L_SW", 10, 3003, 332, "PLT External Light System", "Pilot Anti-Collision Lights Switch, WHT/OFF/RED")

--Internal Light System
AH_64D:definePushButton("PLT_INTL_MCAUTION_BTN", 11, 3001, 305, "PLT Internal Light System", "Pilot Master Caution Button")
AH_64D:definePushButton("PLT_INTL_MWARN_BTN", 11, 3002, 304, "PLT Internal Light System", "Pilot Master Warning Button")
AH_64D:definePushButton("PLT_INTL_TEST_BTN", 11, 3005, 333, "PLT Internal Light System", "Pilot Light Test Button")
AH_64D:definePotentiometer("PLT_INTL_SIGNAL_L_KNB", 11, 3006, 327, { 0, 1 }, "PLT Internal Light System", "Pilot Signal Lights Control Knob")
AH_64D:definePotentiometer("PLT_INTL_PRIMARY_L_KNB", 11, 3007, 328, { 0, 1 }, "PLT Internal Light System", "Pilot Primary Lights Control Knob")
AH_64D:definePotentiometer("PLT_INTL_FLOOD_L_KNB", 11, 3008, 330, { 0, 1 }, "PLT Internal Light System", "Pilot Flood Lights Control Knob")
AH_64D:definePotentiometer("PLT_INTL_STBYINST_L_KNB", 11, 3009, 331, { 0, 1 }, "PLT Internal Light System", "Pilot Standby Instrument Lights Control Knob")

AH_64D:definePushButton("CPG_INTL_MCAUTION_BTN", 11, 3003, 807, "CPG Internal Light System", "Gunner Master Caution Button")
AH_64D:definePushButton("CPG_INTL_MWARN_BTN", 11, 3004, 805, "CPG Internal Light System", "Gunner Master Warning Button")
AH_64D:definePushButton("CPG_INTL_TEST_BTN", 11, 3012, 367, "CPG Internal Light System", "Gunner Light Test Button")
AH_64D:definePotentiometer("CPG_INTL_SIGNAL_L_KNB", 11, 3013, 364, { 0, 1 }, "CPG Internal Light System", "Gunner Signal Lights Control Knob")
AH_64D:definePotentiometer("CPG_INTL_PRIMARY_L_KNB", 11, 3014, 365, { 0, 1 }, "CPG Internal Light System", "Gunner Primary Lights Control Knob")
AH_64D:definePotentiometer("CPG_INTL_FLOOD_L_KNB", 11, 3015, 366, { 0, 1 }, "CPG Internal Light System", "Gunner Flood Lights Control Knob")

-- Standby Attitude Indicator
AH_64D:definePushButton("PLT_SAI_CAGE", 13, 3001, 620, "PLT SAI", "Pilot SAI Cage Knob, (LMB) Pull to cage")
-- See https://github.com/DCS-Skunkworks/dcs-bios/pull/550
-- Command 3002 stopped working, testing showed 3004 works. ???  05 March 2024
AH_64D:defineRotary("PLT_SAI_PITCH_TRIM", 13, 3004, 619, "PLT SAI", "Pilot SAI Cage Knob, (MW) Adjust aircraft reference symbol")

AH_64D:defineFloat("PLT_SAI_PITCH", 622, { -0.95, 0.95 }, "PLT SAI Gauges", "Pilot SAI Pitch")
AH_64D:defineFloat("PLT_SAI_BANK", 623, { 1, -1 }, "PLT SAI Gauges", "Pilot SAI Bank")
AH_64D:defineFloat("PLT_SAI_FLAG", 624, { 0, 1 }, "PLT SAI Gauges", "Pilot SAI Off Flag")
AH_64D:defineFloat("PLT_SAI_POINTER", 625, { -1, 1 }, "PLT SAI Gauges", "Pilot SAI ArrowPointer")
AH_64D:defineFloat("PLT_SAI_BALL", 626, { -1, 1 }, "PLT SAI Gauges", "Pilot SAI Slip Ball")
AH_64D:defineFloat("PLT_SAI_TURN", 627, { -1, 1 }, "PLT SAI Gauges", "Pilot SAI Turn")

-- Standby Altimeter
AH_64D:definePotentiometer("PLT_ALT_SET_KNB", 15, 3001, 477, { 0, 1 }, "PLT Altimeter", "Pilot Altimeter Barometric Setting Knob")

AH_64D:defineFloat("PLT_ALT_NEEDLE", 479, { 0, 1 }, "PLT Altimeter Gauges", "Pilot Altimeter Needle")
AH_64D:defineFloat("PLT_ALT_1000", 605, { 0, 1 }, "PLT Altimeter Gauges", "Pilot Altimeter 1000 Drum")
AH_64D:defineFloat("PLT_ALT_10000", 606, { 0, 1 }, "PLT Altimeter Gauges", "Pilot Altimeter 10000 Drum")
AH_64D:defineFloat("PLT_ALT_PRESS_1", 609, { 0, 1 }, "PLT Altimeter Gauges", "Pilot Altimeter Pressure 0001 Drum")
AH_64D:defineFloat("PLT_ALT_PRESS_10", 608, { 0, 1 }, "PLT Altimeter Gauges", "Pilot Altimeter Pressure 0010 Drum")
AH_64D:defineFloat("PLT_ALT_PRESS_1100", 607, { 0, 1 }, "PLT Altimeter Gauges", "Pilot Altimeter Pressure 1100 Drum")

--COMM Panel
AH_64D:definePotentiometer("PLT_COM_VHF_VOL", 63, 3001, 334, { 0, 1 }, "PLT COMM Panel", "Pilot VHF Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_VHF_PW", 63, 3020, 449, "PLT COMM Panel", "Pilot VHF Disable Knob")
AH_64D:definePotentiometer("PLT_COM_UHF_VOL", 63, 3002, 335, { 0, 1 }, "PLT COMM Panel", "Pilot UHF Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_UHF_PW", 63, 3021, 450, "PLT COMM Panel", "Pilot UHF Disable Knob")
AH_64D:definePotentiometer("PLT_COM_FM1_VOL", 63, 3003, 336, { 0, 1 }, "PLT COMM Panel", "Pilot FM1 Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_FM1_PW", 63, 3022, 451, "PLT COMM Panel", "Pilot FM1 Disable Knob")
AH_64D:definePotentiometer("PLT_COM_FM2_VOL", 63, 3004, 337, { 0, 1 }, "PLT COMM Panel", "Pilot FM2 Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_FM2_PW", 63, 3023, 452, "PLT COMM Panel", "Pilot FM2 Disable Knob")
AH_64D:definePotentiometer("PLT_COM_HF_VOL", 63, 3005, 338, { 0, 1 }, "PLT COMM Panel", "Pilot HF Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_HF_PW", 63, 3024, 453, "PLT COMM Panel", "Pilot HF Disable Knob")
AH_64D:definePotentiometer("PLT_COM_IFF_VOL", 63, 3006, 348, { 0, 1 }, "PLT COMM Panel", "Pilot IFF Volume Control Knob")
AH_64D:definePotentiometer("PLT_COM_RLWR_VOL", 63, 3007, 349, { 0, 1 }, "PLT COMM Panel", "Pilot RLWR Volume Control Knob")
AH_64D:definePotentiometer("PLT_COM_ATA_VOL", 63, 3008, 350, { 0, 1 }, "PLT COMM Panel", "Pilot ATA Volume Control Knob")
AH_64D:definePotentiometer("PLT_COM_VCR_VOL", 63, 3009, 351, { 0, 1 }, "PLT COMM Panel", "Pilot VCR Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_VCR_PW", 63, 3028, 457, "PLT COMM Panel", "Pilot VCR Disable Knob")
AH_64D:definePotentiometer("PLT_COM_ADF_VOL", 63, 3010, 352, { 0, 1 }, "PLT COMM Panel", "Pilot ADF Volume Control Knob")
AH_64D:defineToggleSwitch("PLT_COM_ADF_PW", 63, 3029, 458, "PLT COMM Panel", "Pilot ADF Disable Knob")
AH_64D:definePotentiometer("PLT_COM_MASTER_VOL", 63, 3011, 344, { 0, 1 }, "PLT COMM Panel", "Pilot MASTER Volume Control Knob")
AH_64D:definePotentiometer("PLT_COM_SENS_KNB", 63, 3012, 345, { 0, 1 }, "PLT COMM Panel", "Pilot SENS Control Knob")
AH_64D:defineSpringloaded_3PosTumb("PLT_COM_VHF_SQL", 63, 3070, 3013, 339, "PLT COMM Panel", "Pilot VHF Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("PLT_COM_UHF_SQL", 63, 3071, 3014, 340, "PLT COMM Panel", "Pilot UHF Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("PLT_COM_FM1_SQL", 63, 3072, 3015, 341, "PLT COMM Panel", "Pilot FM1 Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("PLT_COM_FM2_SQL", 63, 3073, 3016, 342, "PLT COMM Panel", "Pilot FM2 Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("PLT_COM_HF_SQL", 63, 3074, 3017, 343, "PLT COMM Panel", "Pilot HF Squelch Switch, ON/OFF")
AH_64D:define3PosTumb("PLT_COM_ICS_MODE", 63, 3018, 346, "PLT COMM Panel", "Pilot ICS Mode Switch, HOT MIC/VOX/PTT")
AH_64D:definePushButton("PLT_COM_IDENT_BTN", 63, 3019, 347, "PLT COMM Panel", "Pilot IDENT Button")

AH_64D:definePotentiometer("CPG_COM_VHF_VOL", 62, 3001, 375, { 0, 1 }, "CPG COMM Panel", "Gunner VHF Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_VHF_PW", 62, 3020, 459, "CPG COMM Panel", "Gunner VHF Disable Knob")
AH_64D:definePotentiometer("CPG_COM_UHF_VOL", 62, 3002, 376, { 0, 1 }, "CPG COMM Panel", "Gunner UHF Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_UHF_PW", 62, 3021, 460, "CPG COMM Panel", "Gunner UHF Disable Knob")
AH_64D:definePotentiometer("CPG_COM_FM1_VOL", 62, 3003, 377, { 0, 1 }, "CPG COMM Panel", "Gunner FM1 Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_FM1_PW", 62, 3022, 461, "CPG COMM Panel", "Gunner FM1 Disable Knob")
AH_64D:definePotentiometer("CPG_COM_FM2_VOL", 62, 3004, 378, { 0, 1 }, "CPG COMM Panel", "Gunner FM2 Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_FM2_PW", 62, 3023, 462, "CPG COMM Panel", "Gunner FM2 Disable Knob")
AH_64D:definePotentiometer("CPG_COM_HF_VOL", 62, 3005, 379, { 0, 1 }, "CPG COMM Panel", "Gunner HF Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_HF_PW", 62, 3024, 463, "CPG COMM Panel", "Gunner HF Disable Knob")
AH_64D:definePotentiometer("CPG_COM_IFF_VOL", 62, 3006, 389, { 0, 1 }, "CPG COMM Panel", "Gunner IFF Volume Control Knob")
AH_64D:definePotentiometer("CPG_COM_RLWR_VOL", 62, 3007, 390, { 0, 1 }, "CPG COMM Panel", "Gunner RLWR Volume Control Knob")
AH_64D:definePotentiometer("CPG_COM_ATA_VOL", 62, 3008, 391, { 0, 1 }, "CPG COMM Panel", "Gunner ATA Volume Control Knob")
AH_64D:definePotentiometer("CPG_COM_VCR_VOL", 62, 3009, 392, { 0, 1 }, "CPG COMM Panel", "Gunner VCR Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_VCR_PW", 62, 3028, 467, "CPG COMM Panel", "Gunner VCR Disable Knob")
AH_64D:definePotentiometer("CPG_COM_ADF_VOL", 62, 3010, 393, { 0, 1 }, "CPG COMM Panel", "Gunner ADF Volume Control Knob")
AH_64D:defineToggleSwitch("CPG_COM_ADF_PW", 62, 3029, 468, "CPG COMM Panel", "Gunner ADF Disable Knob")
AH_64D:definePotentiometer("CPG_COM_MASTER_VOL", 62, 3011, 385, { 0, 1 }, "CPG COMM Panel", "Gunner MASTER Volume Control Knob")
AH_64D:definePotentiometer("CPG_COM_SENS_KNB", 62, 3012, 386, { 0, 1 }, "CPG COMM Panel", "Gunner SENS Control Knob")
AH_64D:defineSpringloaded_3PosTumb("CPG_COM_VHF_SQL", 62, 3070, 3013, 380, "CPG COMM Panel", "Gunner VHF Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("CPG_COM_UHF_SQL", 62, 3071, 3014, 381, "CPG COMM Panel", "Gunner UHF Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("CPG_COM_FM1_SQL", 62, 3072, 3015, 382, "CPG COMM Panel", "Gunner FM1 Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("CPG_COM_FM2_SQL", 62, 3073, 3016, 383, "CPG COMM Panel", "Gunner FM2 Squelch Switch, ON/OFF")
AH_64D:defineSpringloaded_3PosTumb("CPG_COM_HF_SQL", 62, 3074, 3017, 384, "CPG COMM Panel", "Gunner HF Squelch Switch, ON/OFF")
AH_64D:define3PosTumb("CPG_COM_ICS_MODE", 62, 3018, 387, "CPG COMM Panel", "Gunner ICS Mode Switch, HOT MIC/VOX/PTT")
AH_64D:definePushButton("CPG_COM_IDENT_BTN", 62, 3019, 388, "CPG COMM Panel", "Gunner IDENT Button")

--Emergency Panel
AH_64D:definePushButton("PLT_EMERG_GUARD_BTN", 56, 3001, 310, "PLT Emergency Panel", "Pilot Guard Button, ON/OFF")
AH_64D:definePushButton("PLT_EMERG_XPNDR_BTN", 56, 3003, 311, "PLT Emergency Panel", "Pilot XPNDR Button, ON/OFF")
AH_64D:defineToggleSwitch("PLT_EMERG_ZERO_SW", 56, 3005, 312, "PLT Emergency Panel", "Pilot Zeroize Switch, ON/OFF")
AH_64D:defineToggleSwitch("PLT_INST_MZERO_CVR", 56, 3008, 803, "PLT Emergency Panel", "Pilot Master Zeroize Switch Cover, OPEN/CLOSE")
AH_64D:defineToggleSwitch("PLT_INST_MZERO_SW", 56, 3007, 804, "PLT Emergency Panel", "Pilot Master Zeroize Switch, ON/OFF")

AH_64D:definePushButton("CPG_EMERG_GUARD_BTN", 56, 3002, 358, "CPG Emergency Panel", "Gunner Guard Button, ON/OFF")
AH_64D:definePushButton("CPG_EMERG_XPNDR_BTN", 56, 3004, 359, "CPG Emergency Panel", "Gunner XPNDR Button, ON/OFF")
AH_64D:defineToggleSwitch("CPG_EMERG_ZERO_SW", 56, 3006, 360, "CPG Emergency Panel", "Gunner Zeroize Switch, ON/OFF")
AH_64D:defineToggleSwitch("CPG_INST_MZERO_CVR", 56, 3010, 801, "CPG Emergency Panel", "Gunner Master Zeroize Switch Cover, OPEN/CLOSE")
AH_64D:defineToggleSwitch("CPG_INST_MZERO_SW", 56, 3009, 802, "CPG Emergency Panel", "Gunner Master Zeroize Switch, ON/OFF")

--Keyboard Unit
AH_64D:definePushButton("PLT_KU_A", 29, 3007, 213, "PLT Keyboard Unit", "Pilot Keyboard Unit A Key")
AH_64D:definePushButton("PLT_KU_B", 29, 3008, 214, "PLT Keyboard Unit", "Pilot Keyboard Unit B Key")
AH_64D:definePushButton("PLT_KU_C", 29, 3009, 215, "PLT Keyboard Unit", "Pilot Keyboard Unit C Key")
AH_64D:definePushButton("PLT_KU_D", 29, 3010, 216, "PLT Keyboard Unit", "Pilot Keyboard Unit D Key")
AH_64D:definePushButton("PLT_KU_E", 29, 3011, 217, "PLT Keyboard Unit", "Pilot Keyboard Unit E Key")
AH_64D:definePushButton("PLT_KU_F", 29, 3012, 218, "PLT Keyboard Unit", "Pilot Keyboard Unit F Key")
AH_64D:definePushButton("PLT_KU_G", 29, 3013, 222, "PLT Keyboard Unit", "Pilot Keyboard Unit G Key")
AH_64D:definePushButton("PLT_KU_H", 29, 3014, 223, "PLT Keyboard Unit", "Pilot Keyboard Unit H Key")
AH_64D:definePushButton("PLT_KU_I", 29, 3015, 224, "PLT Keyboard Unit", "Pilot Keyboard Unit I Key")
AH_64D:definePushButton("PLT_KU_J", 29, 3016, 225, "PLT Keyboard Unit", "Pilot Keyboard Unit J Key")
AH_64D:definePushButton("PLT_KU_K", 29, 3017, 226, "PLT Keyboard Unit", "Pilot Keyboard Unit K Key")
AH_64D:definePushButton("PLT_KU_L", 29, 3018, 227, "PLT Keyboard Unit", "Pilot Keyboard Unit L Key")
AH_64D:definePushButton("PLT_KU_M", 29, 3019, 231, "PLT Keyboard Unit", "Pilot Keyboard Unit M Key")
AH_64D:definePushButton("PLT_KU_N", 29, 3020, 232, "PLT Keyboard Unit", "Pilot Keyboard Unit N Key")
AH_64D:definePushButton("PLT_KU_O", 29, 3021, 233, "PLT Keyboard Unit", "Pilot Keyboard Unit O Key")
AH_64D:definePushButton("PLT_KU_P", 29, 3022, 234, "PLT Keyboard Unit", "Pilot Keyboard Unit P Key")
AH_64D:definePushButton("PLT_KU_Q", 29, 3023, 235, "PLT Keyboard Unit", "Pilot Keyboard Unit Q Key")
AH_64D:definePushButton("PLT_KU_R", 29, 3024, 236, "PLT Keyboard Unit", "Pilot Keyboard Unit R Key")
AH_64D:definePushButton("PLT_KU_S", 29, 3025, 240, "PLT Keyboard Unit", "Pilot Keyboard Unit S Key")
AH_64D:definePushButton("PLT_KU_T", 29, 3026, 241, "PLT Keyboard Unit", "Pilot Keyboard Unit T Key")
AH_64D:definePushButton("PLT_KU_U", 29, 3027, 242, "PLT Keyboard Unit", "Pilot Keyboard Unit U Key")
AH_64D:definePushButton("PLT_KU_V", 29, 3028, 243, "PLT Keyboard Unit", "Pilot Keyboard Unit V Key")
AH_64D:definePushButton("PLT_KU_W", 29, 3029, 244, "PLT Keyboard Unit", "Pilot Keyboard Unit W Key")
AH_64D:definePushButton("PLT_KU_X", 29, 3030, 245, "PLT Keyboard Unit", "Pilot Keyboard Unit X Key")
AH_64D:definePushButton("PLT_KU_Y", 29, 3031, 249, "PLT Keyboard Unit", "Pilot Keyboard Unit Y Key")
AH_64D:definePushButton("PLT_KU_Z", 29, 3032, 250, "PLT Keyboard Unit", "Pilot Keyboard Unit Z Key")
AH_64D:definePushButton("PLT_KU_SLASH", 29, 3045, 251, "PLT Keyboard Unit", "Pilot Keyboard Unit / Key")
AH_64D:definePushButton("PLT_KU_0", 29, 3043, 247, "PLT Keyboard Unit", "Pilot Keyboard Unit 0 Key")
AH_64D:definePushButton("PLT_KU_1", 29, 3033, 219, "PLT Keyboard Unit", "Pilot Keyboard Unit 1 Key")
AH_64D:definePushButton("PLT_KU_2", 29, 3034, 220, "PLT Keyboard Unit", "Pilot Keyboard Unit 2 Key")
AH_64D:definePushButton("PLT_KU_3", 29, 3035, 221, "PLT Keyboard Unit", "Pilot Keyboard Unit 3 Key")
AH_64D:definePushButton("PLT_KU_4", 29, 3036, 228, "PLT Keyboard Unit", "Pilot Keyboard Unit 4 Key")
AH_64D:definePushButton("PLT_KU_5", 29, 3037, 229, "PLT Keyboard Unit", "Pilot Keyboard Unit 5 Key")
AH_64D:definePushButton("PLT_KU_6", 29, 3038, 230, "PLT Keyboard Unit", "Pilot Keyboard Unit 6 Key")
AH_64D:definePushButton("PLT_KU_7", 29, 3039, 237, "PLT Keyboard Unit", "Pilot Keyboard Unit 7 Key")
AH_64D:definePushButton("PLT_KU_8", 29, 3040, 238, "PLT Keyboard Unit", "Pilot Keyboard Unit 8 Key")
AH_64D:definePushButton("PLT_KU_9", 29, 3041, 239, "PLT Keyboard Unit", "Pilot Keyboard Unit 9 Key")
AH_64D:definePushButton("PLT_KU_DOT", 29, 3042, 246, "PLT Keyboard Unit", "Pilot Keyboard Unit . Key")
AH_64D:definePushButton("PLT_KU_SIGN", 29, 3044, 248, "PLT Keyboard Unit", "Pilot Keyboard Unit +/- Key")
AH_64D:definePushButton("PLT_KU_BKS", 29, 3002, 252, "PLT Keyboard Unit", "Pilot Keyboard Unit BKS Key")
AH_64D:definePushButton("PLT_KU_SPC", 29, 3003, 253, "PLT Keyboard Unit", "Pilot Keyboard Unit SPC Key")
AH_64D:definePushButton("PLT_KU_MULTI", 29, 3049, 254, "PLT Keyboard Unit", "Pilot Keyboard Unit * Key")
AH_64D:definePushButton("PLT_KU_DIV", 29, 3048, 255, "PLT Keyboard Unit", "Pilot Keyboard Unit / (divide) Key")
AH_64D:definePushButton("PLT_KU_PLUS", 29, 3046, 256, "PLT Keyboard Unit", "Pilot Keyboard Unit + Key")
AH_64D:definePushButton("PLT_KU_MINUS", 29, 3047, 257, "PLT Keyboard Unit", "Pilot Keyboard Unit - Key")
AH_64D:definePushButton("PLT_KU_CLR", 29, 3001, 258, "PLT Keyboard Unit", "Pilot Keyboard Unit CLR Key")
AH_64D:definePushButton("PLT_KU_LEFT", 29, 3004, 259, "PLT Keyboard Unit", "Pilot Keyboard Unit Left Key")
AH_64D:definePushButton("PLT_KU_RIGHT", 29, 3005, 260, "PLT Keyboard Unit", "Pilot Keyboard Unit Right Key")
AH_64D:definePushButton("PLT_KU_ENT", 29, 3006, 261, "PLT Keyboard Unit", "Pilot Keyboard Unit ENTER Key")
AH_64D:definePotentiometer("PLT_KU_BRT", 29, 3050, 316, { 0, 1 }, "PLT Keyboard Unit", "Pilot Scratchpad Keyboard Brightness Knob")

AH_64D:defineString("PLT_KU_DISPLAY", function()
	return parse_ku(16)
end, 22, "PLT Keyboard Unit", "Pilot Keyboard Unit Display")

AH_64D:definePushButton("CPG_KU_A", 30, 3007, 164, "CPG Keyboard Unit", "Gunner Keyboard Unit A Key")
AH_64D:definePushButton("CPG_KU_B", 30, 3008, 165, "CPG Keyboard Unit", "Gunner Keyboard Unit B Key")
AH_64D:definePushButton("CPG_KU_C", 30, 3009, 166, "CPG Keyboard Unit", "Gunner Keyboard Unit C Key")
AH_64D:definePushButton("CPG_KU_D", 30, 3010, 167, "CPG Keyboard Unit", "Gunner Keyboard Unit D Key")
AH_64D:definePushButton("CPG_KU_E", 30, 3011, 168, "CPG Keyboard Unit", "Gunner Keyboard Unit E Key")
AH_64D:definePushButton("CPG_KU_F", 30, 3012, 169, "CPG Keyboard Unit", "Gunner Keyboard Unit F Key")
AH_64D:definePushButton("CPG_KU_G", 30, 3013, 173, "CPG Keyboard Unit", "Gunner Keyboard Unit G Key")
AH_64D:definePushButton("CPG_KU_H", 30, 3014, 174, "CPG Keyboard Unit", "Gunner Keyboard Unit H Key")
AH_64D:definePushButton("CPG_KU_I", 30, 3015, 175, "CPG Keyboard Unit", "Gunner Keyboard Unit I Key")
AH_64D:definePushButton("CPG_KU_J", 30, 3016, 176, "CPG Keyboard Unit", "Gunner Keyboard Unit J Key")
AH_64D:definePushButton("CPG_KU_K", 30, 3017, 177, "CPG Keyboard Unit", "Gunner Keyboard Unit K Key")
AH_64D:definePushButton("CPG_KU_L", 30, 3018, 178, "CPG Keyboard Unit", "Gunner Keyboard Unit L Key")
AH_64D:definePushButton("CPG_KU_M", 30, 3019, 182, "CPG Keyboard Unit", "Gunner Keyboard Unit M Key")
AH_64D:definePushButton("CPG_KU_N", 30, 3020, 183, "CPG Keyboard Unit", "Gunner Keyboard Unit N Key")
AH_64D:definePushButton("CPG_KU_O", 30, 3021, 184, "CPG Keyboard Unit", "Gunner Keyboard Unit O Key")
AH_64D:definePushButton("CPG_KU_P", 30, 3022, 185, "CPG Keyboard Unit", "Gunner Keyboard Unit P Key")
AH_64D:definePushButton("CPG_KU_Q", 30, 3023, 186, "CPG Keyboard Unit", "Gunner Keyboard Unit Q Key")
AH_64D:definePushButton("CPG_KU_R", 30, 3024, 187, "CPG Keyboard Unit", "Gunner Keyboard Unit R Key")
AH_64D:definePushButton("CPG_KU_S", 30, 3025, 191, "CPG Keyboard Unit", "Gunner Keyboard Unit S Key")
AH_64D:definePushButton("CPG_KU_T", 30, 3026, 192, "CPG Keyboard Unit", "Gunner Keyboard Unit T Key")
AH_64D:definePushButton("CPG_KU_U", 30, 3027, 193, "CPG Keyboard Unit", "Gunner Keyboard Unit U Key")
AH_64D:definePushButton("CPG_KU_V", 30, 3028, 194, "CPG Keyboard Unit", "Gunner Keyboard Unit V Key")
AH_64D:definePushButton("CPG_KU_W", 30, 3029, 195, "CPG Keyboard Unit", "Gunner Keyboard Unit W Key")
AH_64D:definePushButton("CPG_KU_X", 30, 3030, 196, "CPG Keyboard Unit", "Gunner Keyboard Unit X Key")
AH_64D:definePushButton("CPG_KU_Y", 30, 3031, 200, "CPG Keyboard Unit", "Gunner Keyboard Unit Y Key")
AH_64D:definePushButton("CPG_KU_Z", 30, 3032, 201, "CPG Keyboard Unit", "Gunner Keyboard Unit Z Key")
AH_64D:definePushButton("CPG_KU_SLASH", 30, 3045, 202, "CPG Keyboard Unit", "Gunner Keyboard Unit / Key")
AH_64D:definePushButton("CPG_KU_0", 30, 3043, 198, "CPG Keyboard Unit", "Gunner Keyboard Unit 0 Key")
AH_64D:definePushButton("CPG_KU_1", 30, 3033, 170, "CPG Keyboard Unit", "Gunner Keyboard Unit 1 Key")
AH_64D:definePushButton("CPG_KU_2", 30, 3034, 171, "CPG Keyboard Unit", "Gunner Keyboard Unit 2 Key")
AH_64D:definePushButton("CPG_KU_3", 30, 3035, 172, "CPG Keyboard Unit", "Gunner Keyboard Unit 3 Key")
AH_64D:definePushButton("CPG_KU_4", 30, 3036, 179, "CPG Keyboard Unit", "Gunner Keyboard Unit 4 Key")
AH_64D:definePushButton("CPG_KU_5", 30, 3037, 180, "CPG Keyboard Unit", "Gunner Keyboard Unit 5 Key")
AH_64D:definePushButton("CPG_KU_6", 30, 3038, 181, "CPG Keyboard Unit", "Gunner Keyboard Unit 6 Key")
AH_64D:definePushButton("CPG_KU_7", 30, 3039, 188, "CPG Keyboard Unit", "Gunner Keyboard Unit 7 Key")
AH_64D:definePushButton("CPG_KU_8", 30, 3040, 189, "CPG Keyboard Unit", "Gunner Keyboard Unit 8 Key")
AH_64D:definePushButton("CPG_KU_9", 30, 3041, 190, "CPG Keyboard Unit", "Gunner Keyboard Unit 9 Key")
AH_64D:definePushButton("CPG_KU_DOT", 30, 3042, 197, "CPG Keyboard Unit", "Gunner Keyboard Unit . Key")
AH_64D:definePushButton("CPG_KU_SIGN", 30, 3044, 199, "CPG Keyboard Unit", "Gunner Keyboard Unit +/- Key")
AH_64D:definePushButton("CPG_KU_BKS", 30, 3002, 203, "CPG Keyboard Unit", "Gunner Keyboard Unit BKS Key")
AH_64D:definePushButton("CPG_KU_SPC", 30, 3003, 204, "CPG Keyboard Unit", "Gunner Keyboard Unit SPC Key")
AH_64D:definePushButton("CPG_KU_MULTI", 30, 3049, 205, "CPG Keyboard Unit", "Gunner Keyboard Unit * Key")
AH_64D:definePushButton("CPG_KU_DIV", 30, 3048, 206, "CPG Keyboard Unit", "Gunner Keyboard Unit / (divide) Key")
AH_64D:definePushButton("CPG_KU_PLUS", 30, 3046, 207, "CPG Keyboard Unit", "Gunner Keyboard Unit + Key")
AH_64D:definePushButton("CPG_KU_MINUS", 30, 3047, 208, "CPG Keyboard Unit", "Gunner Keyboard Unit - Key")
AH_64D:definePushButton("CPG_KU_CLR", 30, 3001, 209, "CPG Keyboard Unit", "Gunner Keyboard Unit CLR Key")
AH_64D:definePushButton("CPG_KU_LEFT", 30, 3004, 210, "CPG Keyboard Unit", "Gunner Keyboard Unit Left Key")
AH_64D:definePushButton("CPG_KU_RIGHT", 30, 3005, 211, "CPG Keyboard Unit", "Gunner Keyboard Unit Right Key")
AH_64D:definePushButton("CPG_KU_ENT", 30, 3006, 212, "CPG Keyboard Unit", "Gunner Keyboard Unit ENTER Key")
AH_64D:definePotentiometer("CPG_KU_BRT", 30, 3050, 621, { 0, 1 }, "CPG Keyboard Unit", "Gunner Scratchpad Keyboard Brightness Knob")

AH_64D:defineString("CPG_KU_DISPLAY", function()
	return parse_ku(15)
end, 22, "CPG Keyboard Unit", "Gunner Keyboard Unit Display")

-- Enhanced Up-Front Display
local eufd_indicator_data = AH_64D_EUFD
local LINE_LEN = 56

local function parse_eufd(indicator_id)
	local dcs_eufd = AH_64D.parse_indication(indicator_id)

	-- the module doesn't seem to give us any obvious way to identify the page we're on, but this should suffice
	local display_page = dcs_eufd["Preset_NAME"] and "PRESET" or "MAIN"

	return TextDisplay.GetDisplayLines(dcs_eufd, LINE_LEN, 14, eufd_indicator_data, display_page, {}, nil, true)
end

local plt_EUFD = {}
local cpg_EUFD = {}

AH_64D:addExportHook(function()
	plt_EUFD = parse_eufd(18)
end)

AH_64D:addExportHook(function()
	cpg_EUFD = parse_eufd(19)
end)

AH_64D:defineString("PLT_EUFD_LINE1", function()
	return plt_EUFD[1]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 1")
AH_64D:defineString("PLT_EUFD_LINE2", function()
	return plt_EUFD[2]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 2")
AH_64D:defineString("PLT_EUFD_LINE3", function()
	return plt_EUFD[3]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 3")
AH_64D:defineString("PLT_EUFD_LINE4", function()
	return plt_EUFD[4]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 4")
AH_64D:defineString("PLT_EUFD_LINE5", function()
	return plt_EUFD[5]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 5")
AH_64D:defineString("PLT_EUFD_LINE6", function()
	return plt_EUFD[6]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 6")
AH_64D:defineString("PLT_EUFD_LINE7", function()
	return plt_EUFD[7]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 7")
AH_64D:defineString("PLT_EUFD_LINE8", function()
	return plt_EUFD[8]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 8")
AH_64D:defineString("PLT_EUFD_LINE9", function()
	return plt_EUFD[9]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 9")
AH_64D:defineString("PLT_EUFD_LINE10", function()
	return plt_EUFD[10]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 10")
AH_64D:defineString("PLT_EUFD_LINE11", function()
	return plt_EUFD[11]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 11")
AH_64D:defineString("PLT_EUFD_LINE12", function()
	return plt_EUFD[12]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 12")
AH_64D:defineString("PLT_EUFD_LINE13", function()
	return plt_EUFD[13]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 13")
AH_64D:defineString("PLT_EUFD_LINE14", function()
	return plt_EUFD[14]
end, LINE_LEN, "PLT Up-Front Display", "Pilot Up-Front Display Line 14")

AH_64D:defineString("CPG_EUFD_LINE1", function()
	return cpg_EUFD[1]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 1")
AH_64D:defineString("CPG_EUFD_LINE2", function()
	return cpg_EUFD[2]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 2")
AH_64D:defineString("CPG_EUFD_LINE3", function()
	return cpg_EUFD[3]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 3")
AH_64D:defineString("CPG_EUFD_LINE4", function()
	return cpg_EUFD[4]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 4")
AH_64D:defineString("CPG_EUFD_LINE5", function()
	return cpg_EUFD[5]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 5")
AH_64D:defineString("CPG_EUFD_LINE6", function()
	return cpg_EUFD[6]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 6")
AH_64D:defineString("CPG_EUFD_LINE7", function()
	return cpg_EUFD[7]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 7")
AH_64D:defineString("CPG_EUFD_LINE8", function()
	return cpg_EUFD[8]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 8")
AH_64D:defineString("CPG_EUFD_LINE9", function()
	return cpg_EUFD[9]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 9")
AH_64D:defineString("CPG_EUFD_LINE10", function()
	return cpg_EUFD[10]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 10")
AH_64D:defineString("CPG_EUFD_LINE11", function()
	return cpg_EUFD[11]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 11")
AH_64D:defineString("CPG_EUFD_LINE12", function()
	return cpg_EUFD[12]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 12")
AH_64D:defineString("CPG_EUFD_LINE13", function()
	return cpg_EUFD[13]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 13")
AH_64D:defineString("CPG_EUFD_LINE14", function()
	return cpg_EUFD[14]
end, LINE_LEN, "CPG Up-Front Display", "Gunner Up-Front Display Line 14")

-- Pilot EUFD
local PILOT_EUFD = "PLT Up-Front Display"

AH_64D:defineRockerSwitch("PLT_EUFD_WCA", devices.EUFD_PLT, 3001, 3001, 3002, 3002, 271, PILOT_EUFD, "Pilot Up-Front Display WCA Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("PLT_EUFD_IDM", devices.EUFD_PLT, 3004, 3003, 270, PILOT_EUFD, "Pilot Up-Front Display IDM Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("PLT_EUFD_RTS", devices.EUFD_PLT, 3006, 3005, 272, PILOT_EUFD, "Pilot Up-Front Display RTS Rocker Switch")
AH_64D:definePotentiometer("PLT_EUFD_BRT", devices.EUFD_PLT, 3011, 273, { 0, 1 }, PILOT_EUFD, "Pilot Up-Front Display Brightness Knob")
AH_64D:definePushButton("PLT_EUFD_ENT", devices.EUFD_PLT, 3008, 275, PILOT_EUFD, "Pilot Up-Front Display ENTER Button")
AH_64D:definePushButton("PLT_EUFD_SWAP", devices.EUFD_PLT, 3010, 277, PILOT_EUFD, "Pilot Up-Front Display Swap Button")
AH_64D:definePushButton("PLT_EUFD_PRESET", devices.EUFD_PLT, 3007, 274, PILOT_EUFD, "Pilot Up-Front Display Preset Button")
AH_64D:definePushButton("PLT_EUFD_STOPWATCH", devices.EUFD_PLT, 3009, 276, PILOT_EUFD, "Pilot Up-Front Display Stopwatch Button - Press to start/stop, Hold to reset")

-- CP/G EUFD
local CPG_EUFD = "CPG Up-Front Display"

AH_64D:defineRockerSwitch("CPG_EUFD_WCA", devices.EUFD_CPG, 3001, 3001, 3002, 3002, 263, CPG_EUFD, "Gunner Up-Front Display WCA Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_EUFD_IDM", devices.EUFD_CPG, 3004, 3003, 262, CPG_EUFD, "Gunner Up-Front Display IDM Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_EUFD_RTS", devices.EUFD_CPG, 3006, 3005, 264, CPG_EUFD, "Gunner Up-Front Display RTS Rocker Switch")
AH_64D:definePotentiometer("CPG_EUFD_BRT", devices.EUFD_CPG, 3011, 265, { 0, 1 }, CPG_EUFD, "Gunner Up-Front Display Brightness Knob")
AH_64D:definePushButton("CPG_EUFD_ENT", devices.EUFD_CPG, 3008, 267, CPG_EUFD, "Gunner Up-Front Display ENTER Button")
AH_64D:definePushButton("CPG_EUFD_SWAP", devices.EUFD_CPG, 3010, 269, CPG_EUFD, "Gunner Up-Front Display Swap Button")
AH_64D:definePushButton("CPG_EUFD_PRESET", devices.EUFD_CPG, 3007, 266, CPG_EUFD, "Gunner Up-Front Display Preset Button")
AH_64D:definePushButton("CPG_EUFD_STOPWATCH", devices.EUFD_CPG, 3009, 268, CPG_EUFD, "Gunner Up-Front Display Stopwatch Button - Press to start/stop, Hold to reset")

-- TEDAC Display
AH_64D:definePushButton("CPG_TEDAC_TAD_SEL", 51, 3005, 150, "CPG TEDAC Display", "Gunner TEDAC Display TAD Video Select Button")
AH_64D:definePushButton("CPG_TEDAC_FCR_SEL", 51, 3006, 151, "CPG TEDAC Display", "Gunner TEDAC Display FCR Video Select Button")
AH_64D:definePushButton("CPG_TEDAC_PNV_SEL", 51, 3007, 152, "CPG TEDAC Display", "Gunner TEDAC Display PNV Video Select Button")
AH_64D:definePushButton("CPG_TEDAC_GS_SEL", 51, 3008, 153, "CPG TEDAC Display", "Gunner TEDAC Display G/S Video Select Button")
AH_64D:defineSpringloaded_3PosTumb("CPG_TEDAC_SYM", 51, 3010, 3009, 155, "CPG TEDAC Display", "Gunner TEDAC Display SYM Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_TEDAC_BRT", 51, 3012, 3011, 156, "CPG TEDAC Display", "Gunner TEDAC Display BRT Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_TEDAC_CON", 51, 3014, 3013, 157, "CPG TEDAC Display", "Gunner TEDAC Display CON Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_TEDAC_RF", 51, 3020, 3019, 147, "CPG TEDAC Display", "Gunner TEDAC Display R/F Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_TEDAC_EL", 51, 3018, 3017, 146, "CPG TEDAC Display", "Gunner TEDAC Display EL Rocker Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_TEDAC_AZ", 51, 3016, 3015, 163, "CPG TEDAC Display", "Gunner TEDAC Display AZ Rocker Switch")
AH_64D:definePushButton("CPG_TEDAC_MULTI", 51, 3004, 158, "CPG TEDAC Display", "Gunner TEDAC Display Asterisk (*) Button")
AH_64D:definePushButton("CPG_TEDAC_BORESIGHT", 51, 3021, 162, "CPG TEDAC Display", "Gunner TEDAC Display AZ/EL Boresight Enable Button")
AH_64D:definePushButton("CPG_TEDAC_ACM", 51, 3022, 161, "CPG TEDAC Display", "Gunner TEDAC Display ACM Button")
AH_64D:definePushButton("CPG_TEDAC_FREEZE", 51, 3023, 160, "CPG TEDAC Display", "Gunner TEDAC Display FREEZE Button")
AH_64D:definePushButton("CPG_TEDAC_FILTER", 51, 3024, 159, "CPG TEDAC Display", "Gunner TEDAC Display FILTER Button")
AH_64D:definePotentiometer("CPG_TEDAC_FLIR_GAIN", 51, 3002, 148, { 0, 1 }, "CPG TEDAC Display", "Gunner TEDAC Display FLIR GAIN Control Knob")
AH_64D:definePotentiometer("CPG_TEDAC_FLIR_LEV", 51, 3003, 149, { 0, 1 }, "CPG TEDAC Display", "Gunner TEDAC Display FLIR LEV Control Knob")
AH_64D:defineTumb("CPG_TEDAC_DISP_MODE", 51, 3001, 154, 0.5, { 0, 1 }, nil, false, "CPG TEDAC Display", "Gunner TEDAC Display Mode Knob, DAY/NT/OFF")

AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_TEDAC_L_IAT", 51, 3031, 3030, 491, "CPG TEDAC Left Handgrip", "Gunner Image AutoTrack/Offset Switch, OFS/IAT")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_TADS_FOV_UP_DN", 51, 3033, 3032, 492, "CPG TEDAC Left Handgrip", "Gunner TADS FOV Select Switch, Z (Zoom)/M (Medium)")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_TADS_FOV_L_R", 51, 3035, 3034, 49, "CPG TEDAC Left Handgrip", "Gunner TADS FOV Select Switch, N (Narrow)/W (Wide)")
AH_64D:define3PosTumb("CPG_LHG_TADS_SEL", 51, 3092, 494, "CPG TEDAC Left Handgrip", "Gunner TADS Sensor Select Switch, FLIR/TV/DVO")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_STORE_UPDATE", 51, 3040, 3039, 495, "CPG TEDAC Left Handgrip", "Gunner STORE/Update Switch, UPDT/STORE")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_FCR_SCAN", 51, 3042, 3041, 500, "CPG TEDAC Left Handgrip", "Gunner FCR Scan Switch, C/S")
AH_64D:definePushButton("CPG_LHG_CUED_SEARCH", 51, 3043, 501, "CPG TEDAC Left Handgrip", "Gunner CUED Search Button")
AH_64D:definePushButton("CPG_LHG_LMC", 51, 3044, 496, "CPG TEDAC Left Handgrip", "Gunner Linear Motion Compensation Button")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_FCR_UP_DN", 51, 3046, 3045, 498, "CPG TEDAC Left Handgrip", "Gunner FCR Mode Switch, GTM/ATM")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_FCR_L_R", 51, 3048, 3047, 499, "CPG TEDAC Left Handgrip", "Gunner FCR Mode Switch, TPM/RMAP")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_WPN_UP_DN", 51, 3050, 3049, 502, "CPG TEDAC Left Handgrip", "Gunner Weapons Action Switch, GUN/ATA")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_WPN_L_R", 51, 3052, 3051, 503, "CPG TEDAC Left Handgrip", "Gunner Weapons Action Switch, RKT/MSL")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_CURSOR_UP_DN", 51, 3054, 3053, 487, "CPG TEDAC Left Handgrip", "Gunner Cursor Controller, Up/Down")
AH_64D:defineSpringloaded_3PosTumb("CPG_LHG_CURSOR_L_R", 51, 3056, 3055, 488, "CPG TEDAC Left Handgrip", "Gunner Cursor Controller, Left/Right")
AH_64D:definePushButton("CPG_LHG_CURSOR_ENT", 51, 3057, 489, "CPG TEDAC Left Handgrip", "Gunner Cursor Controller, Enter")
AH_64D:definePushButton("CPG_LHG_LR_BTN", 51, 3060, 490, "CPG TEDAC Left Handgrip", "Gunner Cursor Display Select (L/R) Button")

AH_64D:defineSpringloaded_3PosTumb("CPG_RHG_SIGHT_UP_DN", 51, 3064, 3063, 508, "CPG TEDAC Right Handgrip", "Gunner Sight Select Switch, HMD/LINK")
AH_64D:defineSpringloaded_3PosTumb("CPG_RHG_SIGHT_L_R", 51, 3066, 3065, 509, "CPG TEDAC Right Handgrip", "Gunner Sight Select Switch, FCR/TADS")
AH_64D:define3PosTumb("CPG_RHG_LASER_TRACK", 51, 3093, 510, "CPG TEDAC Right Handgrip", "Gunner Laser Tracker Mode Switch, A/O/M")
AH_64D:defineSpringloaded_3PosTumb("CPG_RHG_FCR_SCAN_UP_DN", 51, 3071, 3070, 511, "CPG TEDAC Right Handgrip", "Gunner FCR Scan Size Switch, Z (Zoom)/M (Medium)")
AH_64D:defineSpringloaded_3PosTumb("CPG_RHG_FCR_SCAN_L_R", 51, 3073, 3072, 512, "CPG TEDAC Right Handgrip", "Gunner FCR Scan Size Switch, N (Narrow)/W (Wide)")
AH_64D:definePushButton("CPG_RHG_C_SCOPE", 51, 3074, 513, "CPG TEDAC Right Handgrip", "Gunner C-Scope Button")
AH_64D:definePushButton("CPG_RHG_FLIR_POL", 51, 3075, 504, "CPG TEDAC Right Handgrip", "Gunner FLIR Polarity Button")
AH_64D:definePushButton("CPG_RHG_SIGHT_SLAVE", 51, 3076, 514, "CPG TEDAC Right Handgrip", "Gunner Sight Slave Button")
AH_64D:definePushButton("CPG_RHG_DISP_ZOOM", 51, 3077, 517, "CPG TEDAC Right Handgrip", "Gunner Display Zoom Button")
AH_64D:defineSpringloaded_3PosTumb("CPG_RHG_SPARE", 51, 3080, 3079, 519, "CPG TEDAC Right Handgrip", "Gunner Spare Switch, PREVIOUS/NEXT")
AH_64D:definePushButton("CPG_RHG_HDD_SW", 51, 3081, 505, "CPG TEDAC Right Handgrip", "Gunner HDD/HOD Select Button")
AH_64D:definePushButton("CPG_RHG_ENTER", 51, 3082, 518, "CPG TEDAC Right Handgrip", "Gunner Cursor Enter Button")
AH_64D:defineSpringloaded_3PosTumb("CPG_RHG_MAN_TRK_UP_DN", 51, 3084, 3083, 515, "CPG TEDAC Right Handgrip", "Gunner Sight Manual Tracker Controller, Up/Down")
AH_64D:defineRockerSwitch("CPG_RHG_MAN_TRK_L_R", 51, 3086, 3086, 3085, 3085, 516, "CPG TEDAC Right Handgrip", "Gunner Sight Manual Tracker Controller, Left/Right") -- for some reason, needs to be different from U/D
AH_64D:define3PosTumb("CPG_RHG_IAT_POL", 51, 3094, 507, "CPG TEDAC Right Handgrip", "Gunner Image Auto Tracker Polarity Switch, W/A/B")

--Video Control Panel
AH_64D:definePotentiometer("PLT_VIDEO_IHADSS_BRT", 3, 3011, 278, { 0, 1 }, "PLT Video Control Panel", "Pilot IHADSS BRT Control Knob")
AH_64D:definePotentiometer("PLT_VIDEO_IHADSS_CON", 3, 3010, 279, { 0, 1 }, "PLT Video Control Panel", "Pilot IHADSS CON Control Knob")
AH_64D:definePotentiometer("PLT_VIDEO_SYM_BRT", 3, 3012, 280, { 0, 1 }, "PLT Video Control Panel", "Pilot SYM BRT Control Knob")
AH_64D:definePotentiometer("PLT_VIDEO_FLIR_LVL", 3, 3008, 282, { 0, 1 }, "PLT Video Control Panel", "Pilot FLIR LVL Control Knob")
AH_64D:definePotentiometer("PLT_VIDEO_FLIR_GAIN", 3, 3007, 283, { 0, 1 }, "PLT Video Control Panel", "Pilot FLIR GAIN Control Knob")
AH_64D:defineToggleSwitch("PLT_VIDEO_AUTO_CON", 3, 3009, 281, "PLT Video Control Panel", "Pilot Automatic Contrast Mode Switch, ACM/OFF")

-- NVS MODE PANEL
AH_64D:define3PosTumb("PLT_NVS_MODE", 3, 3005, 309, "PLT NVS Panel", "Pilot NVS MODE Switch, FIXED/NORM/OFF")
AH_64D:define3PosTumb("CPG_NVS_MODE", 3, 3006, 363, "CPG NVS Panel", "Gunner NVS MODE Switch, FIXED/NORM/OFF")

--Generator Reset PANEL
AH_64D:defineSpringloaded_3PosTumb("PLT_GEN_RESET", 3, 3017, 3018, 355, "PLT Generator Panel", "Pilot Generator Reset Switch, GEN 1/GEN 2")
AH_64D:defineSpringloaded_3PosTumb("PLT_CHK_OSPD_ENG_A", 6, 3008, 3007, 353, "PLT Generator Panel", "Pilot CKT A Check Overspeed Test Switch, ENG 2/ENG 1")
AH_64D:defineSpringloaded_3PosTumb("PLT_CHK_OSPD_ENG_B", 6, 3010, 3009, 354, "PLT Generator Panel", "Pilot CKT B Check Overspeed Test Switch, ENG 2/ENG 1")

--ARMAMENT PANEL
AH_64D:definePushButton("PLT_MASTER_ARM_BTN", 3, 3014, 306, "PLT Armament Panel", "Pilot A/S Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_GROUND_OVERRIDE_BTN", 3, 3013, 307, "PLT Armament Panel", "Pilot GND ORIDE Pushbutton, ON/OFF")
AH_64D:definePushButton("CPG_MASTER_ARM_BTN", 3, 3016, 293, "CPG Armament Panel", "Gunner A/S Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_GROUND_OVERRIDE_BTN", 3, 3015, 294, "CPG Armament Panel", "Gunner GND ORIDE Pushbutton, ON/OFF")

--Left Console
AH_64D:definePushButton("PLT_JETT_STORE_LO", 75, 3001, 319, "PLT Left Console", "Pilot L OUTBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_JETT_STORE_LI", 75, 3002, 320, "PLT Left Console", "Pilot L INBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_JETT_STORE_RI", 75, 3003, 321, "PLT Left Console", "Pilot R INBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_JETT_STORE_RO", 75, 3004, 322, "PLT Left Console", "Pilot R OUTBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_JETT_STORE_LW", 75, 3005, 323, "PLT Left Console", "Pilot L TIP Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_JETT_STORE_RW", 75, 3006, 325, "PLT Left Console", "Pilot R TIP Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("PLT_JETT_BTN", 75, 3007, 324, "PLT Left Console", "Pilot JETT Pushbutton")
AH_64D:definePushButton("PLT_EMERG_HYD_BTN", 5, 3002, 313, "PLT Left Console", "Pilot EMERG HYD Pushbutton, ON/OFF")
AH_64D:definePushButton("PLT_T_WHEEL_UNLOCK_BTN", 5, 3003, 308, "PLT Left Console", "Pilot TAIL WHEEL Pushbutton, LOCK/UNLOCK")
AH_64D:define3PosTumb("PLT_ROTOR_BRK", 5, 3001, 314, "PLT Left Console", "Pilot Rotor Brake Switch, OFF/BRK/LOCK")
AH_64D:definePushButton("PLT_APU_BTN", 6, 3001, 400, "PLT Left Console", "Pilot APU Pushbutton")
AH_64D:defineToggleSwitch("PLT_APU_BTN_CVR", 6, 3002, 401, "PLT Left Console", "Pilot APU Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePotentiometer("PLT_PW_LVR_FRIC", devices.CONTROL_INTERFACE, 3001, 633, { 0, 1 }, "PLT Left Console", "Pilot Power Lever Friction Adjustment Lever")
AH_64D:defineSpringloaded_3PosTumb("PLT_ENG1_START", 6, 3004, 3003, 317, "PLT Left Console", "Pilot No.1 Engine Start Switch, IGN ORIDE/START")
AH_64D:defineSpringloaded_3PosTumb("PLT_ENG2_START", 6, 3006, 3005, 318, "PLT Left Console", "Pilot No.2 Engine Start Switch, IGN ORIDE/START")

AH_64D:definePushButton("CPG_JETT_STORE_LO", 75, 3001, 368, "CPG Left Console", "Gunner L OUTBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_JETT_STORE_LI", 75, 3002, 369, "CPG Left Console", "Gunner L INBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_JETT_STORE_RI", 75, 3003, 370, "CPG Left Console", "Gunner R INBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_JETT_STORE_RO", 75, 3004, 371, "CPG Left Console", "Gunner R OUTBD Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_JETT_STORE_LW", 75, 3005, 372, "CPG Left Console", "Gunner L TIP Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_JETT_STORE_RW", 75, 3006, 374, "CPG Left Console", "Gunner R TIP Station Select Pushbutton, ARM/SAFE")
AH_64D:definePushButton("CPG_JETT_BTN", 75, 3007, 373, "CPG Left Console", "Gunner JETT Pushbutton")
AH_64D:definePushButton("CPG_EMERG_HYD_BTN", 5, 3004, 361, "CPG Left Console", "Gunner EMERG HYD Pushbutton, ON/OFF")
AH_64D:definePushButton("CPG_T_WHEEL_UNLOCK_BTN", 5, 3005, 362, "CPG Left Console", "Gunner TAIL WHEEL Pushbutton, LOCK/UNLOCK")

--FIRE Control Panel
AH_64D:definePushButton("PLT_FIRE_ENG1_BTN", 6, 3011, 295, "PLT Fire Control Panel", "Pilot ENG 1 Fire Pushbutton")
AH_64D:defineToggleSwitch("PLT_FIRE_ENG1_CVR", 6, 3012, 296, "PLT Fire Control Panel", "Pilot ENG 1 Fire Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePushButton("PLT_FIRE_APU_BTN", 6, 3015, 297, "PLT Fire Control Panel", "Pilot APU Fire Pushbutton")
AH_64D:defineToggleSwitch("PLT_FIRE_APU_CVR", 6, 3016, 298, "PLT Fire Control Panel", "Pilot APU Fire Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePushButton("PLT_FIRE_ENG2_BTN", 6, 3013, 299, "PLT Fire Control Panel", "Pilot ENG 2 Fire Pushbutton")
AH_64D:defineToggleSwitch("PLT_FIRE_ENG2_CVR", 6, 3014, 300, "PLT Fire Control Panel", "Pilot ENG 2 Fire Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePushButton("PLT_FIRE_PRIME_EXT", 6, 3017, 301, "PLT Fire Control Panel", "Pilot Primary Fire Extinguisher Discharge Pushbutton")
AH_64D:definePushButton("PLT_FIRE_RES_EXT", 6, 3018, 303, "PLT Fire Control Panel", "Pilot Reserve Fire Extinguisher Discharge Pushbutton")
AH_64D:defineSpringloaded_3PosTumb("PLT_FIRE_DETECT_TEST", 6, 3019, 3020, 302, "PLT Fire Control Panel", "Pilot Fire Detection Circuit Test Switch")

AH_64D:definePushButton("CPG_FIRE_ENG1_BTN", 6, 3021, 284, "CPG Fire Control Panel", "Gunner ENG 1 Fire Pushbutton")
AH_64D:defineToggleSwitch("CPG_FIRE_ENG1_CVR", 6, 3022, 285, "CPG Fire Control Panel", "Gunner ENG 1 Fire Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePushButton("CPG_FIRE_APU_BTN", 6, 3025, 286, "CPG Fire Control Panel", "Gunner APU Fire Pushbutton")
AH_64D:defineToggleSwitch("CPG_FIRE_APU_CVR", 6, 3026, 287, "CPG Fire Control Panel", "Gunner APU Fire Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePushButton("CPG_FIRE_ENG2_BTN", 6, 3023, 288, "CPG Fire Control Panel", "Gunner ENG 2 Fire Pushbutton")
AH_64D:defineToggleSwitch("CPG_FIRE_ENG2_CVR", 6, 3024, 289, "CPG Fire Control Panel", "Gunner ENG 2 Fire Pushbutton Cover, OPEN/CLOSE")
AH_64D:definePushButton("CPG_FIRE_PRIME_EXT", 6, 3027, 290, "CPG Fire Control Panel", "Gunner Primary Fire Extinguisher Discharge Pushbutton")
AH_64D:definePushButton("CPG_FIRE_RES_EXT", 6, 3028, 292, "CPG Fire Control Panel", "Gunner Reserve Fire Extinguisher Discharge Pushbutton")
AH_64D:defineSpringloaded_3PosTumb("CPG_FIRE_DETECT_TEST", 6, 3029, 3030, 291, "CPG Fire Control Panel", "Gunner Fire Detection Circuit Test Switch")

--Cockpit
AH_64D:defineToggleSwitch("PLT_PARK_BRAKE", 7, 3001, 634, "PLT Cockpit", "Pilot Parking Brake Handle, Pull/Stow")
AH_64D:defineToggleSwitch("PLT_CANOPY", 9, 3005, 796, "PLT Cockpit", "Pilot Canopy, OPEN/CLOSE")
AH_64D:definePushButton("PLT_M4_TRIGGER", 9, 3009, 827, "PLT Cockpit", "Pilot M4 Trigger")
AH_64D:define3PosTumb("PLT_M4_SAVE", 9, 3007, 828, "PLT Cockpit", "Pilot M4 Safety")
AH_64D:definePushButton("PLT_DEFOG_BTN", 9, 3001, 356, "PLT Cockpit", "Pilot Defog Button")
AH_64D:defineTumb("PLT_WIPER_SW", 9, 3002, 357, 0.1, { -0.1, 0.2 }, nil, false, "PLT Cockpit", "Pilot Wiper Control Switch, PARK/OFF/LO/HI")
AH_64D:definePotentiometer("PLT_ENG_L_PW_LVR", 6, 3031, 398, { 0, 1 }, "PLT Left Console", "Pilot Power Lever Smoothly (Left)")
AH_64D:definePotentiometer("PLT_ENG_R_PW_LVR", 6, 3032, 399, { 0, 1 }, "PLT Left Console", "Pilot Power Lever Smoothly (Right)")
AH_64D:defineTumb("PLT_MASTER_IGN_SW", 3, 3003, 315, 0.5, { 0, 1 }, nil, false, "PLT Cockpit", "Pilot Master Ignition Switch, OFF/BATT/EXT PWR")

AH_64D:defineToggleSwitch("CPG_CANOPY", 9, 3006, 799, "CPG Cockpit", "Gunner Canopy, OPEN/CLOSE")
AH_64D:definePushButton("CPG_M4_TRIGGER", 9, 3010, 825, "CPG Cockpit", "Gunner M4 Trigger")
AH_64D:define3PosTumb("CPG_M4_SAVE", 9, 3008, 826, "CPG Cockpit", "Gunner M4 Safety")
AH_64D:definePushButton("CPG_DEFOG_BTN", 9, 3003, 394, "CPG Cockpit", "Gunner Defog Button")
AH_64D:defineTumb("CPG_WIPER_SW", 9, 3004, 395, 0.1, { -0.1, 0.2 }, nil, false, "CPG Cockpit", "Gunner Wiper Control Switch, PARK/OFF/LO/HI")
AH_64D:definePotentiometer("CPG_ENG_L_PW_LVR", 6, 3031, 398, { 0, 1 }, "CPG Left Console", "Gunner Power Lever Smoothly (Left)")
AH_64D:definePotentiometer("CPG_ENG_R_PW_LVR", 6, 3032, 399, { 0, 1 }, "CPG Left Console", "Gunner Power Lever Smoothly (Right)")
AH_64D:defineToggleSwitch("CPG_STICK_FOLD", 87, 3007, 809, "CPG Cockpit", "Gunner Stick Folding, UP/DOWN")
AH_64D:define3PosTumb("CPG_PROC_SEL_SW", 3, 3004, 397, "CPG Cockpit", "Gunner Processor Select Switch, SP 1/AUTO/SP 2")

AH_64D:defineFloat("PLT_CANOPY_POS", 795, { 0, 1 }, "Cockpit Gauges", "Pilot Canopy Position")
AH_64D:defineFloat("CPG_CANOPY_POS", 798, { 0, 1 }, "Cockpit Gauges", "Gunner Canopy Position")

--CMWS
AH_64D:reserveIntValue(1) -- PLT_CMWS_PW updated from a 2-position to 3-position switch
AH_64D:reserveIntValue(1) -- AH_64D:definePushButton("PLT_CMWS_PW_TEST", 80, 3002, 610, "PLT CMWS", "Pilot CMWS PWR Switch, TEST")
AH_64D:definePotentiometer("PLT_CMWS_VOL", 80, 3003, 611, { 0, 1 }, "PLT CMWS", "Pilot CMWS Audio Volume Knob")
AH_64D:definePotentiometer("PLT_CMWS_LAMP", 80, 3004, 612, { 0, 1 }, "PLT CMWS", "Pilot CMWS Lamp Knob")
AH_64D:defineToggleSwitch("PLT_CMWS_ARM", 80, 3005, 614, "PLT CMWS", "Pilot CMWS Flare Squibs Switch, ARM/SAFE")
AH_64D:defineToggleSwitch("PLT_CMWS_MODE", 80, 3006, 615, "PLT CMWS", "Pilot CMWS Mode Switch, CMWS/NAV")
AH_64D:defineToggleSwitch("PLT_CMWS_BYPASS", 80, 3007, 616, "PLT CMWS", "Pilot CMWS Operation Switch, BYPASS/AUTO")
AH_64D:defineToggleSwitch("PLT_CMWS_JETT_CVR", 80, 3008, 617, "PLT CMWS", "Pilot CMWS Flare Jettison Switch Cover, OPEN/CLOSE")
AH_64D:defineToggleSwitch("PLT_CMWS_JETT", 80, 3009, 618, "PLT CMWS", "Pilot CMWS Flare Jettison Switch")

--Gauges
AH_64D:defineFloat("PLT_IAS_NEEDLE", 469, { 0, 1 }, "Cockpit Gauges", "Pilot Standby Airspeed Indicator Needle")
AH_64D:defineFloat("PLT_FREE_AIR_TEMP", 636, { 0, 1 }, "Cockpit Gauges", "Pilot Free Air Temperature Gage")
AH_64D:defineFloat("VIB_SHEET", 820, { -1, 1 }, "Cockpit Gauges", "Vibration Sheet")
AH_64D:defineFloat("VIB_SUNSHADE", 821, { -1, 1 }, "Cockpit Gauges", "Vibration SunShade")
AH_64D:defineFloat("VIB_REMOVE", 822, { -1, 1 }, "Cockpit Gauges", "Vibration Remove Before Flight")
AH_64D:defineFloat("VIB_HOOK_TURN", 823, { -1, 1 }, "Cockpit Gauges", "Vibration Hook Turning")
AH_64D:defineFloat("VIB_HOOK_SWING", 824, { -1, 1 }, "Cockpit Gauges", "Vibration Hook Swinging")

-- Internal Lights
AH_64D:defineIndicatorLight("PLT_MASTER_WARNING_L", 424, "PLT Internal Lights", "Pilot Master Warning Indicator (yellow)")
AH_64D:defineIndicatorLight("PLT_MASTER_CAUTION_L", 425, "PLT Internal Lights", "Pilot Master Caution Indicator (green)")
AH_64D:defineIndicatorLight("PLT_ENG_1_FIRE_L", 416, "PLT Internal Lights", "Pilot Engine 1 Fire Indicator (yellow)")
AH_64D:defineIndicatorLight("PLT_APU_FIRE_L", 418, "PLT Internal Lights", "Pilot APU Fire Indicator (yellow)")
AH_64D:defineIndicatorLight("PLT_ENG_2_FIRE_L", 420, "PLT Internal Lights", "Pilot Engine 2 Fire Indicator (yellow)")
AH_64D:defineIndicatorLight("PLT_ENG_1_READY_L", 417, "PLT Internal Lights", "Pilot Engine 1 Ready Indicator (green)")
AH_64D:defineIndicatorLight("PLT_APU_READY_L", 419, "PLT Internal Lights", "Pilot APU Ready Indicator (green)")
AH_64D:defineIndicatorLight("PLT_ENG_2_READY_L", 421, "PLT Internal Lights", "Pilot Engine 2 Ready Indicator (green)")
AH_64D:defineIndicatorLight("PLT_FIRE_EXT_DISCH_PRI_L", 422, "PLT Internal Lights", "Pilot Primary Fire Extinguisher Discharge Indicator (green)")
AH_64D:defineIndicatorLight("PLT_FIRE_EXT_DISCH_RES_L", 423, "PLT Internal Lights", "Pilot Reserve Fire Extinguisher Discharge Indicator (green)")
AH_64D:defineIndicatorLight("PLT_EMERG_GUARD_L", 403, "PLT Internal Lights", "Pilot Emergency Guard Indicator (green)")
AH_64D:defineIndicatorLight("PLT_EMERG_XPNDR_L", 404, "PLT Internal Lights", "Pilot Emergency Transponder Indicator (green)")
AH_64D:defineIndicatorLight("PLT_EMERG_HYD_L", 405, "PLT Internal Lights", "Pilot Emergency Hydraulics Indicator (green)")
AH_64D:defineIndicatorLight("PLT_T_WHEEL_UNLOCK_L", 402, "PLT Internal Lights", "Pilot Tail Wheel Unlock Indicator (green)")
AH_64D:defineIndicatorLight("PLT_JETT_L_TIP_L", 411, "PLT Internal Lights", "Pilot Jettison Left Tip Indicator (green)")
AH_64D:defineIndicatorLight("PLT_JETT_L_OUTBOARD_L", 407, "PLT Internal Lights", "Pilot Jettison Left Outboard Indicator (green)")
AH_64D:defineIndicatorLight("PLT_JETT_L_INBOARD_L", 408, "PLT Internal Lights", "Pilot Jettison Left Inboard Indicator (green)")
AH_64D:defineIndicatorLight("PLT_JETT_R_INBOARD_L", 409, "PLT Internal Lights", "Pilot Jettison Right Inboard Indicator (green)")
AH_64D:defineIndicatorLight("PLT_JETT_R_TIP_L", 412, "PLT Internal Lights", "Pilot Jettison Right Tip Indicator (green)")
AH_64D:defineIndicatorLight("PLT_JETT_R_OUTBOARD_L", 410, "PLT Internal Lights", "Pilot Jettison Right Outboard Indicator (green)")
AH_64D:defineIndicatorLight("PLT_MASTER_ARM_ARM_L", 413, "PLT Internal Lights", "Pilot Master Arm Armed Indicator (yellow)")
AH_64D:defineIndicatorLight("PLT_MASTER_ARM_SAFE_L", 414, "PLT Internal Lights", "Pilot Master Arm Safe Indicator (green)")
AH_64D:defineIndicatorLight("PLT_GROUND_OVERRIDE_L", 415, "PLT Internal Lights", "Pilot Ground Override Indicator (green)")
AH_64D:defineIndicatorLight("PLT_APU_L", 406, "PLT Internal Lights", "Pilot APU On Indicator (green)")
AH_64D:defineFloat("PLT_INT_PANEL_L", 788, { 0, 1 }, "PLT Internal Lights", "Pilot Panel Lightning (light green)")
AH_64D:defineFloat("PLT_INT_FLOOD_L", 790, { 0, 1 }, "PLT Internal Lights", "Pilot Flood Lightning (light green)")
AH_64D:defineFloat("PLT_INT_GAUGES_L", 787, { 0, 1 }, "PLT Internal Lights", "Pilot Gauges Lightning (light green)")
AH_64D:defineFloat("PLT_SIGNAL_L", 793, { 0, 1 }, "PLT Internal Lights", "Pilot Signal Light (multi color)")

AH_64D:defineIndicatorLight("CPG_MASTER_WARNING_L", 806, "CPG Internal Lights", "Gunner Master Warning Indicator (yellow)")
AH_64D:defineIndicatorLight("CPG_MASTER_CAUTION_L", 808, "CPG Internal Lights", "Gunner Master Caution Indicator (green)")
AH_64D:defineIndicatorLight("CPG_ENG_1_FIRE_L", 441, "CPG Internal Lights", "Gunner Engine 1 Fire Indicator (yellow)")
AH_64D:defineIndicatorLight("CPG_APU_FIRE_L", 443, "CPG Internal Lights", "Gunner APU Fire Indicator (yellow)")
AH_64D:defineIndicatorLight("CPG_ENG_2_FIRE_L", 445, "CPG Internal Lights", "Gunner Engine 2 Fire Indicator (yellow)")
AH_64D:defineIndicatorLight("CPG_ENG_1_READY_L", 442, "CPG Internal Lights", "Gunner Engine 1 Ready Indicator (green)")
AH_64D:defineIndicatorLight("CPG_APU_READY_L", 444, "CPG Internal Lights", "Gunner APU Ready Indicator (green)")
AH_64D:defineIndicatorLight("CPG_ENG_2_READY_L", 446, "CPG Internal Lights", "Gunner Engine 2 Ready Indicator (green)")
AH_64D:defineIndicatorLight("CPG_FIRE_EXT_DISCH_PRI_L", 447, "CPG Internal Lights", "Gunner Primary Fire Extinguisher Discharge Indicator (green)")
AH_64D:defineIndicatorLight("CPG_FIRE_EXT_DISCH_RES_L", 448, "CPG Internal Lights", "Gunner Reserve Fire Extinguisher Discharge Indicator (green)")
AH_64D:defineIndicatorLight("CPG_EMERG_GUARD_L", 427, "CPG Internal Lights", "Gunner Emergency Guard Indicator (green)")
AH_64D:defineIndicatorLight("CPG_EMERG_XPNDR_L", 428, "CPG Internal Lights", "Gunner Emergency Transponder Indicator (green)")
AH_64D:defineIndicatorLight("CPG_EMERG_HYD_L", 429, "CPG Internal Lights", "Gunner Emergency Hydraulics Indicator (green)")
AH_64D:defineIndicatorLight("CPG_T_WHEEL_UNLOCK_L", 426, "CPG Internal Lights", "Gunner Tail Wheel Unlock Indicator (green)")
AH_64D:defineIndicatorLight("CPG_JETT_L_TIP_L", 434, "CPG Internal Lights", "Gunner Jettison Left Tip Indicator (green)")
AH_64D:defineIndicatorLight("CPG_JETT_L_OUTBOARD_L", 430, "CPG Internal Lights", "Gunner Jettison Left Outboard Indicator (green)")
AH_64D:defineIndicatorLight("CPG_JETT_L_INBOARD_L", 431, "CPG Internal Lights", "Gunner Jettison Left Inboard Indicator (green)")
AH_64D:defineIndicatorLight("CPG_JETT_R_INBOARD_L", 432, "CPG Internal Lights", "Gunner Jettison Right Inboard Indicator (green)")
AH_64D:defineIndicatorLight("CPG_JETT_R_TIP_L", 433, "CPG Internal Lights", "Gunner Jettison Right Tip Indicator (green)")
AH_64D:defineIndicatorLight("CPG_JETT_R_OUTBOARD_L", 435, "CPG Internal Lights", "Gunner Jettison Right Outboard Indicator (green)")
AH_64D:defineIndicatorLight("CPG_MASTER_ARM_ARM_L", 438, "CPG Internal Lights", "Gunner Master Arm Armed Indicator (yellow)")
AH_64D:defineIndicatorLight("CPG_MASTER_ARM_SAFE_L", 439, "CPG Internal Lights", "Gunner Master Arm Safe Indicator (green)")
AH_64D:defineIndicatorLight("CPG_GROUND_OVERRIDE_L", 440, "CPG Internal Lights", "Gunner Ground Override Indicator (green)")
AH_64D:defineIndicatorLight("CPG_PROCESSOR_SP_1_L", 436, "CPG Internal Lights", "Gunner Processor Select SP 1 Indicator (green)")
AH_64D:defineIndicatorLight("CPG_PROCESSOR_SP_2_L", 437, "CPG Internal Lights", "Gunner Processor Select SP 2 Indicator (green)")
AH_64D:defineFloat("CPG_INT_PANEL_L", 789, { 0, 1 }, "CPG Internal Lights", "Gunner Panel Lightning (light green)")
AH_64D:defineFloat("CPG_INT_FLOOD_L", 791, { 0, 1 }, "CPG Internal Lights", "Gunner Flood Lightning (light green)")
AH_64D:defineFloat("CPG_SIGNAL_L", 794, { 0, 1 }, "CPG Internal Lights", "Gunner Signal Light (multi color)")

--Externals
AH_64D:defineBitFromDrawArgument("EXT_POSITION_LIGHT_LEFT", 190, "External Aircraft Model", "Left Position Light (red)")
AH_64D:defineBitFromDrawArgument("EXT_POSITION_LIGHT_RIGHT", 191, "External Aircraft Model", "Right Position Light (green)")
AH_64D:defineBitFromDrawArgument("EXT_LIGHT_TAIL", 192, "External Aircraft Model", "Tail Light (white)")
AH_64D:defineBitFromDrawArgument("EXT_STROBE_L", 193, "External Aircraft Model", "Left Strobe Light (red)")
AH_64D:defineBitFromDrawArgument("EXT_STROBE_R", 194, "External Aircraft Model", "Right Strobe Light (red)")
AH_64D:defineBitFromDrawArgument("EXT_LIGHT_L", 195, "External Aircraft Model", "Left Light (white)")
AH_64D:defineBitFromDrawArgument("EXT_LIGHT_R", 196, "External Aircraft Model", "Right Light (white)")
AH_64D:defineFloatFromDrawArgument("EXT_FORMATION_LIGHTS", 200, "External Aircraft Model", "Formation Lights (yellow green)")
AH_64D:defineBitFromDrawArgument("EXT_LAND_LIGHT", 209, "External Aircraft Model", "Landing Light (white)")
AH_64D:defineFloatFromDrawArgument("EXT_WIPER_PLT", 13, "External Aircraft Model", "Wiper Pilot")
AH_64D:defineFloatFromDrawArgument("EXT_WIPER_CPG", 14, "External Aircraft Model", "Wiper Gunner")
AH_64D:defineBitFromDrawArgument("EXT_WOW_TAIL", 1, "External Aircraft Model", "Weight ON Wheels Tail Gear")
AH_64D:defineBitFromDrawArgument("EXT_WOW_RIGHT", 4, "External Aircraft Model", "Weight ON Wheels Right Gear")
AH_64D:defineBitFromDrawArgument("EXT_WOW_LEFT", 6, "External Aircraft Model", "Weight ON Wheels Left Gear")
AH_64D:defineFullRangeFloatFromExternalDrawArgument("EXT_ROTOR", 40, "External Aircraft Model", "Rotor Move")

AH_64D:defineToggleSwitch("PLT_L_SUNVISOR", 9, 3017, 849, "PLT Cockpit", "Pilot Left Sunvisor")
AH_64D:defineToggleSwitch("PLT_R_SUNVISOR", 9, 3018, 850, "PLT Cockpit", "Pilot Right Sunvisor")

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

AH_64D:addExportHook(function()
	local cmws = AH_64D.parse_indication(25)

	flare_letter = ""
	flare_count = ""
	chaff_letter = ""
	chaff_count = ""
	bit_line_1 = ""
	bit_line_2 = ""
	d_light_bright = 0
	r_light_bright = 0
	fwd_left_sector_brt = 0
	aft_left_sector_brt = 0
	aft_right_sector_brt = 0
	fwd_right_sector_brt = 0
	cmws_page = "NONE"

	-- the test page doesn't have numbers these high, and these should always be present on the main page
	-- there doesn't seem to be a good alternative way to verify the page at the moment.
	-- additionally, none of the values for the cmws are actually exported with a name at present, so they
	-- all have to be accessed by this numbering scheme. It's entirely possible this will break in the future.
	local is_test_page = cmws["#83#"] == nil or cmws["#84#"] == nil or cmws["#85#"] == nil or cmws["#86#"] == nil

	if is_test_page then
		cmws_page = "TEST"
		bit_line_1 = Functions.coerce_nil_to_string(cmws["#42#"])
		bit_line_2 = Functions.coerce_nil_to_string(cmws["#43#"])

		-- these values are all guesses
		d_light_dim = Functions.nil_state_to_int_flag(cmws["#45#"])
		r_light_dim = Functions.nil_state_to_int_flag(cmws["#44#"])
		fwd_left_sector_dim = Functions.nil_state_to_int_flag(cmws["#8#"])
		aft_left_sector_dim = Functions.nil_state_to_int_flag(cmws["#7#"])
		aft_right_sector_dim = Functions.nil_state_to_int_flag(cmws["#6#"])
		fwd_right_sector_dim = Functions.nil_state_to_int_flag(cmws["#9#"])
	else
		cmws_page = "MAIN"
		flare_letter = Functions.coerce_nil_to_string(cmws["#83#"])
		chaff_letter = Functions.coerce_nil_to_string(cmws["#84#"])
		flare_count = Functions.coerce_nil_to_string(cmws["#85#"])
		chaff_count = Functions.coerce_nil_to_string(cmws["#86#"])
		d_light_bright = Functions.nil_state_to_int_flag(cmws["#88#"])
		d_light_dim = Functions.nil_state_to_int_flag(cmws["#90#"])
		r_light_bright = Functions.nil_state_to_int_flag(cmws["#87#"])
		r_light_dim = Functions.nil_state_to_int_flag(cmws["#89#"])

		fwd_left_sector_brt = Functions.nil_state_to_int_flag(cmws["#8#"])
		aft_left_sector_brt = Functions.nil_state_to_int_flag(cmws["#7#"])
		aft_right_sector_brt = Functions.nil_state_to_int_flag(cmws["#6#"])
		fwd_right_sector_brt = Functions.nil_state_to_int_flag(cmws["#9#"])
		-- these values are all guesses
		fwd_left_sector_dim = Functions.nil_state_to_int_flag(cmws["#49#"])
		aft_left_sector_dim = Functions.nil_state_to_int_flag(cmws["#48#"])
		aft_right_sector_dim = Functions.nil_state_to_int_flag(cmws["#47#"])
		fwd_right_sector_dim = Functions.nil_state_to_int_flag(cmws["#50#"])
	end
end)

-- export the page for utility purposes
AH_64D:defineString("PLT_CMWS_PAGE", function()
	return cmws_page
end, 4, "PLT CMWS", "CMWS Display Page (NONE/MAIN/TEST)")

-- text lines
AH_64D:defineString("PLT_CMWS_FLARE_LETTER", function()
	return flare_letter
end, 1, "PLT CMWS", "Flare Letter (F)")
AH_64D:defineString("PLT_CMWS_FLARE_COUNT", function()
	return flare_count
end, 3, "PLT CMWS", "Flare Count")
AH_64D:defineString("PLT_CMWS_CHAFF_LETTER", function()
	return chaff_letter
end, 1, "PLT CMWS", "Chaff Letter (C)")
AH_64D:defineString("PLT_CMWS_CHAFF_COUNT", function()
	return chaff_count
end, 3, "PLT CMWS", "Chaff Count")
AH_64D:defineString("PLT_CMWS_BIT_LINE_1", function()
	return bit_line_1
end, 3, "PLT CMWS", "Bit test line 1 ('BIT'/'SYS')")
AH_64D:defineString("PLT_CMWS_BIT_LINE_2", function()
	return bit_line_2
end, 4, "PLT CMWS", "Bit test line 2 ('I/P'/'PASS')")

-- symbology lights
-- when the display is on the lights are in the DIM state, and when they are indicating they are in the BRT state
AH_64D:defineIntegerFromGetter("PLT_CMWS_R_BRT_L", function()
	return r_light_bright
end, 1, "PLT CMWS", "R light, bright (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_R_DIM_L", function()
	return r_light_dim
end, 1, "PLT CMWS", "R light, dim (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_D_BRT_L", function()
	return d_light_bright
end, 1, "PLT CMWS", "D light, bright (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_D_DIM_L", function()
	return d_light_dim
end, 1, "PLT CMWS", "D light, dim (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_FWD_LEFT_BRT_L", function()
	return fwd_left_sector_brt
end, 1, "PLT CMWS", "Forward left sector lights, bright (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_AFT_LEFT_BRT_L", function()
	return aft_left_sector_brt
end, 1, "PLT CMWS", "Aft left sector lights, bright (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_AFT_RIGHT_BRT_L", function()
	return aft_right_sector_brt
end, 1, "PLT CMWS", "Aft right sector lights, bright (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_FWD_RIGHT_BRT_L", function()
	return fwd_right_sector_brt
end, 1, "PLT CMWS", "Forward right sector lights, bright (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_FWD_LEFT_DIM_L", function()
	return fwd_left_sector_dim
end, 1, "PLT CMWS", "Forward left sector lights, dim (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_AFT_LEFT_DIM_L", function()
	return aft_left_sector_dim
end, 1, "PLT CMWS", "Aft left sector lights, dim (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_AFT_RIGHT_DIM_L", function()
	return aft_right_sector_dim
end, 1, "PLT CMWS", "Aft right sector lights, dim (orange)")
AH_64D:defineIntegerFromGetter("PLT_CMWS_FWD_RIGHT_DIM_L", function()
	return fwd_right_sector_dim
end, 1, "PLT CMWS", "Forward right sector lights, dim (orange)")

AH_64D:defineReadWriteRadio("UHF_RADIO", 57, 7, 3, 1000, "UHF Radio")
AH_64D:defineReadWriteRadio("VHF_AM_RADIO", 58, 7, 3, 1000, "VHF AM Radio")
AH_64D:defineReadWriteRadio("FM1_RADIO", 59, 6, 3, 1000, "FM1 Radio")
AH_64D:defineReadWriteRadio("FM2_RADIO", 60, 6, 3, 1000, "FM2 Radio")
AH_64D:defineReadWriteRadio("HF_RADIO", 61, 6, 4, 100, "HF Radio")
AH_64D:reserveIntValue(1)
AH_64D:reserveIntValue(1)
AH_64D:defineSpringloaded_3PosTumb("PLT_CMWS_PW", 80, 3001, 3002, 610, "PLT CMWS", "Pilot CMWS PWR Switch, OFF/ON/TEST")

AH_64D:defineSeatPosition("SEAT", 2, "Player's current seat position (0 = Pilot, 1 = CP/G)")

-- Pilot Collective

-- mission grip
local COLLECTIVE_MISSION_PILOT = "PLT Collective (Mission Grip)"

AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_FCR_SCAN_SIZE_UD", devices.HOTAS_INPUT, 3025, 3024, 535, COLLECTIVE_MISSION_PILOT, "FCR Scan Size Switch U/D (0=M/Down, 2=Z/Up)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_FCR_SCAN_SIZE_LR", devices.HOTAS_INPUT, 3026, 3027, 536, COLLECTIVE_MISSION_PILOT, "FCR Scan Size Switch L/R (0=N/Left, 2=W/Right)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SIGHT_SELECT_UD", devices.HOTAS_INPUT, 3029, 3028, 537, COLLECTIVE_MISSION_PILOT, "Sight Select Switch U/D (0=LINK/Down, 2=HMD/Up)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SIGHT_SELECT_LR", devices.HOTAS_INPUT, 3030, 3031, 538, COLLECTIVE_MISSION_PILOT, "Sight Select Switch L/R (0=FCR/Left, 2=TADS/Right)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_FCR_MODE_UD", devices.HOTAS_INPUT, 3033, 3032, 539, COLLECTIVE_MISSION_PILOT, "FCR Mode Switch U/D (0=ATM/Down, 2=GTM/Up)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_FCR_MODE_LR", devices.HOTAS_INPUT, 3034, 3035, 540, COLLECTIVE_MISSION_PILOT, "FCR Mode Switch L/R (0=TPM/Left, 2=RMAP/Right)")
AH_64D:definePotentiometer("PLT_COLLECTIVE_CURSOR_UD", devices.HOTAS_INPUT, 3043, 541, { -1, 1 }, COLLECTIVE_MISSION_PILOT, "Cursor Controller U/D")
AH_64D:definePotentiometer("PLT_COLLECTIVE_CURSOR_LR", devices.HOTAS_INPUT, 3042, 542, { -1, 1 }, COLLECTIVE_MISSION_PILOT, "Cursor Controller L/R")
AH_64D:definePushButton("PLT_COLLECTIVE_CURSOR_ENTER", devices.HOTAS_INPUT, 3040, 543, COLLECTIVE_MISSION_PILOT, "Cursor Enter")
AH_64D:definePushButton("PLT_COLLECTIVE_ALT_CURSOR_ENTER", devices.HOTAS_INPUT, 3041, 544, COLLECTIVE_MISSION_PILOT, "Alternate Cursor Enter")
AH_64D:definePushButton("PLT_COLLECTIVE_CURSOR_DISPLAY", devices.HOTAS_INPUT, 3044, 545, COLLECTIVE_MISSION_PILOT, "Cursor Display Select Button")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_FCR_SCAN", devices.HOTAS_INPUT, 3046, 3045, 546, COLLECTIVE_MISSION_PILOT, "FCR Scan Switch (0=Continuous, 2=Single)")
AH_64D:definePushButton("PLT_COLLECTIVE_CUED_SEARCH", devices.HOTAS_INPUT, 3047, 547, COLLECTIVE_MISSION_PILOT, "CUED Search Switch")
AH_64D:definePushButton("PLT_COLLECTIVE_MISSILE_ADVANCE", devices.HOTAS_INPUT, 3048, 548, COLLECTIVE_MISSION_PILOT, "Missile Advance Switch")

-- flight grip
local COLLECTIVE_FLIGHT_PILOT = "PLT Collective (Flight Grip)"

AH_64D:defineToggleSwitch("PLT_COLLECTIVE_JETTISON_COVER", devices.HOTAS_INPUT, 3049, 549, COLLECTIVE_FLIGHT_PILOT, "Emergency Jettison Guard")
AH_64D:definePushButton("PLT_COLLECTIVE_JETTISON", devices.HOTAS_INPUT, 3050, 550, COLLECTIVE_FLIGHT_PILOT, "Emergency Jettison Switch")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_NVS_SELECT", devices.HOTAS_INPUT, 3052, 3051, 551, COLLECTIVE_FLIGHT_PILOT, "NVS Select Switch (0=PNVS, 2=TADS)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_BS_PLRT", devices.HOTAS_INPUT, 3053, 3054, 552, COLLECTIVE_FLIGHT_PILOT, "Boresight/Polarity Switch (0=B/S, 2=PLRT)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_STAB_CONTROL", devices.HOTAS_INPUT, 3055, 3056, 553, COLLECTIVE_FLIGHT_PILOT, "Stabilator Control Switch (0=NU, 2=ND)")
AH_64D:definePushButton("PLT_COLLECTIVE_STAB_RESET", devices.HOTAS_INPUT, 3057, 554, COLLECTIVE_FLIGHT_PILOT, "Stabilator Control Switch - Reset")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT", devices.HOTAS_INPUT, 3059, 3058, 555, COLLECTIVE_FLIGHT_PILOT, "Searchlight (0=STOW, 1=OFF, 2=ON)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_UD", devices.HOTAS_INPUT, 3061, 3060, 556, COLLECTIVE_FLIGHT_PILOT, "Searchlight Position U/D (0=RET/Down, 2=EXT/Up)")
AH_64D:defineSpringloaded_3PosTumb("PLT_COLLECTIVE_SEARCHLIGHT_LR", devices.HOTAS_INPUT, 3062, 3063, 557, COLLECTIVE_FLIGHT_PILOT, "Searchlight Position L/R (0=L/Left, 2=R/Right)")
AH_64D:defineToggleSwitch("PLT_COLLECTIVE_CHOP_COVER", devices.HOTAS_INPUT, 3064, 558, COLLECTIVE_FLIGHT_PILOT, "CHOP Button Guard")
AH_64D:definePushButton("PLT_COLLECTIVE_CHOP", devices.HOTAS_INPUT, 3065, 559, COLLECTIVE_FLIGHT_PILOT, "CHOP Button")
AH_64D:definePushButton("PLT_COLLECTIVE_TAIL_WHEEL", devices.HOTAS_INPUT, 3066, 560, COLLECTIVE_FLIGHT_PILOT, "Tail Wheel Lock/Unlock")
AH_64D:defineToggleSwitch("PLT_COLLECTIVE_BUCS_COVER", devices.HOTAS_INPUT, 3067, 561, COLLECTIVE_FLIGHT_PILOT, "BUCS Trigger Guard")
AH_64D:definePushButton("PLT_COLLECTIVE_BUCS", devices.HOTAS_INPUT, 3068, 562, COLLECTIVE_FLIGHT_PILOT, "BUCS Trigger")

-- CP/G Collective

-- mission grip
local COLLECTIVE_MISSION_CPG = "CPG Collective (Mission Grip)"

AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_FCR_SCAN_SIZE_UD", devices.HOTAS_INPUT, 3025, 3024, 577, COLLECTIVE_MISSION_CPG, "FCR Scan Size Switch U/D (0=M/Down, 2=Z/Up)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_FCR_SCAN_SIZE_LR", devices.HOTAS_INPUT, 3026, 3027, 578, COLLECTIVE_MISSION_CPG, "FCR Scan Size Switch L/R (0=N/Left, 2=W/Right)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_SIGHT_SELECT_UD", devices.HOTAS_INPUT, 3029, 3028, 579, COLLECTIVE_MISSION_CPG, "Sight Select Switch U/D (0=LINK/Down, 2=HMD/Up)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_SIGHT_SELECT_LR", devices.HOTAS_INPUT, 3030, 3031, 580, COLLECTIVE_MISSION_CPG, "Sight Select Switch L/R (0=FCR/Left, 2=TADS/Right)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_FCR_MODE_UD", devices.HOTAS_INPUT, 3033, 3032, 581, COLLECTIVE_MISSION_CPG, "FCR Mode Switch U/D (0=ATM/Down, 2=GTM/Up)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_FCR_MODE_LR", devices.HOTAS_INPUT, 3034, 3035, 582, COLLECTIVE_MISSION_CPG, "FCR Mode Switch L/R (0=TPM/Left, 2=RMAP/Right)")
AH_64D:definePotentiometer("CPG_COLLECTIVE_CURSOR_UD", devices.HOTAS_INPUT, 3043, 583, { -1, 1 }, COLLECTIVE_MISSION_CPG, "Cursor Controller U/D")
AH_64D:definePotentiometer("CPG_COLLECTIVE_CURSOR_LR", devices.HOTAS_INPUT, 3042, 584, { -1, 1 }, COLLECTIVE_MISSION_CPG, "Cursor Controller L/R")
AH_64D:definePushButton("CPG_COLLECTIVE_CURSOR_ENTER", devices.HOTAS_INPUT, 3040, 585, COLLECTIVE_MISSION_CPG, "Cursor Enter")
AH_64D:definePushButton("CPG_COLLECTIVE_ALT_CURSOR_ENTER", devices.HOTAS_INPUT, 3041, 586, COLLECTIVE_MISSION_CPG, "Alternate Cursor Enter")
AH_64D:definePushButton("CPG_COLLECTIVE_CURSOR_DISPLAY", devices.HOTAS_INPUT, 3044, 587, COLLECTIVE_MISSION_CPG, "Cursor Display Select Button")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_FCR_SCAN", devices.HOTAS_INPUT, 3046, 3045, 588, COLLECTIVE_MISSION_CPG, "FCR Scan Switch (0=Continuous, 2=Single)")
AH_64D:definePushButton("CPG_COLLECTIVE_CUED_SEARCH", devices.HOTAS_INPUT, 3047, 589, COLLECTIVE_MISSION_CPG, "CUED Search Switch")
AH_64D:definePushButton("CPG_COLLECTIVE_MISSILE_ADVANCE", devices.HOTAS_INPUT, 3048, 590, COLLECTIVE_MISSION_CPG, "Missile Advance Switch")

-- flight grip
local COLLECTIVE_FLIGHT_CPG = "CPG Collective (Flight Grip)"

AH_64D:defineToggleSwitch("CPG_COLLECTIVE_JETTISON_COVER", devices.HOTAS_INPUT, 3049, 591, COLLECTIVE_FLIGHT_CPG, "Emergency Jettison Guard")
AH_64D:definePushButton("CPG_COLLECTIVE_JETTISON", devices.HOTAS_INPUT, 3050, 592, COLLECTIVE_FLIGHT_CPG, "Emergency Jettison Switch")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_NVS_SELECT", devices.HOTAS_INPUT, 3052, 3051, 593, COLLECTIVE_FLIGHT_CPG, "NVS Select Switch (0=PNVS, 2=TADS)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_BS_PLRT", devices.HOTAS_INPUT, 3053, 3054, 594, COLLECTIVE_FLIGHT_CPG, "Boresight/Polarity Switch (0=B/S, 2=PLRT)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_STAB_CONTROL", devices.HOTAS_INPUT, 3055, 3056, 595, COLLECTIVE_FLIGHT_CPG, "Stabilator Control Switch (0=NU, 2=ND)")
AH_64D:definePushButton("CPG_COLLECTIVE_STAB_RESET", devices.HOTAS_INPUT, 3057, 596, COLLECTIVE_FLIGHT_CPG, "Stabilator Control Switch - Reset")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_SEARCHLIGHT", devices.HOTAS_INPUT, 3059, 3058, 597, COLLECTIVE_FLIGHT_CPG, "Searchlight (0=STOW, 1=OFF, 2=ON)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_SEARCHLIGHT_UD", devices.HOTAS_INPUT, 3061, 3060, 598, COLLECTIVE_FLIGHT_CPG, "Searchlight Position U/D (0=RET/Down, 2=EXT/Up)")
AH_64D:defineSpringloaded_3PosTumb("CPG_COLLECTIVE_SEARCHLIGHT_LR", devices.HOTAS_INPUT, 3062, 3063, 599, COLLECTIVE_FLIGHT_CPG, "Searchlight Position L/R (0=L/Left, 2=R/Right)")
AH_64D:defineToggleSwitch("CPG_COLLECTIVE_CHOP_COVER", devices.HOTAS_INPUT, 3064, 600, COLLECTIVE_FLIGHT_CPG, "CHOP Button Guard")
AH_64D:definePushButton("CPG_COLLECTIVE_CHOP", devices.HOTAS_INPUT, 3065, 601, COLLECTIVE_FLIGHT_CPG, "CHOP Button")
AH_64D:definePushButton("CPG_COLLECTIVE_TAIL_WHEEL", devices.HOTAS_INPUT, 3066, 602, COLLECTIVE_FLIGHT_CPG, "Tail Wheel Lock/Unlock")
AH_64D:defineToggleSwitch("CPG_COLLECTIVE_BUCS_COVER", devices.HOTAS_INPUT, 3067, 603, COLLECTIVE_FLIGHT_CPG, "BUCS Trigger Guard")
AH_64D:definePushButton("CPG_COLLECTIVE_BUCS", devices.HOTAS_INPUT, 3068, 604, COLLECTIVE_FLIGHT_CPG, "BUCS Trigger")

-- Pilot Cyclic
local CYCLIC_PILOT = "PLT Cyclic"

AH_64D:defineToggleSwitch("PLT_CYCLIC_TRIGGER_COVER", devices.HOTAS_INPUT, 3001, 522, CYCLIC_PILOT, "Weapons Trigger Guard")
AH_64D:defineSpringloaded_3PosTumbWithRange("PLT_CYCLIC_TRIGGER", devices.HOTAS_INPUT, 3002, 3003, 523, { 0, 1 }, CYCLIC_PILOT, "Weapons Trigger")
AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_TRIM_UD", devices.HOTAS_INPUT, 3005, 3004, 524, CYCLIC_PILOT, "Force Trim/Hold Mode Switch U/D (0=D/Down, 2=R/Up)")
AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_TRIM_LR", devices.HOTAS_INPUT, 3006, 3007, 525, CYCLIC_PILOT, "Force Trim/Hold Mode Switch L/R (0=AT/Left, 2=A/Right)")
AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_UD", devices.HOTAS_INPUT, 3009, 3008, 526, CYCLIC_PILOT, "Weapons Action Switch U/D (0=A/Down, 2=G/Up)")
AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_WEAPON_LR", devices.HOTAS_INPUT, 3010, 3011, 527, CYCLIC_PILOT, "Weapons Action Switch L/R (0=M/Left, 2=R/Right)")
AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_SYMBOLOGY", devices.HOTAS_INPUT, 3013, 3012, 528, CYCLIC_PILOT, "Symbology Select Switch (0=HB/Down, 2=CT/Up)")
AH_64D:definePushButton("PLT_CYCLIC_SYMBOLOGY_PRESS", devices.HOTAS_INPUT, 3014, 530, CYCLIC_PILOT, "Symbology Select Switch - Depress")
-- AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_CMDS", devices.HOTAS_INPUT, 3016, 3015, 0, CYCLIC_PILOT, "CMDS Switch (0=Down, 2=Up)") -- appears to just trigger chaff/flare buttons
AH_64D:defineSpringloaded_3PosTumb("PLT_CYCLIC_RTS", devices.HOTAS_INPUT, 3017, 3018, 531, CYCLIC_PILOT, "PTT/RTS Switch - (0=RADIO/Left, 2=ICS/Right)")
AH_64D:defineInputOnlyPushButton("PLT_CYCLIC_RTS_PRESS", devices.HOTAS_INPUT, 3019, CYCLIC_PILOT, "PTT/RTS Switch - Depress") -- no arg present
AH_64D:reserveIntValue(1) -- in case RTS press gets a draw arg
AH_64D:definePushButton("PLT_CYCLIC_FMC_RELEASE", devices.HOTAS_INPUT, 3020, 534, CYCLIC_PILOT, "FMC Release Button")
AH_64D:definePushButton("PLT_CYCLIC_CHAFF", devices.HOTAS_INPUT, 3021, 533, CYCLIC_PILOT, "Chaff Dispense")
AH_64D:definePushButton("PLT_CYCLIC_FLARE", devices.HOTAS_INPUT, 3022, 529, CYCLIC_PILOT, "Flare Dispense")
AH_64D:definePushButton("PLT_CYCLIC_ATA_CAGE", devices.HOTAS_INPUT, 3023, 532, CYCLIC_PILOT, "ATA Missile Cage/Uncage Button")

-- CP/G Cyclic
local CYCLIC_CPG = "CPG Cyclic"

AH_64D:defineToggleSwitch("CPG_CYCLIC_TRIGGER_COVER", devices.HOTAS_INPUT, 3001, 563, CYCLIC_CPG, "Weapons Trigger Guard")
AH_64D:defineSpringloaded_3PosTumbWithRange("CPG_CYCLIC_TRIGGER", devices.HOTAS_INPUT, 3002, 3003, 564, { 0, 1 }, CYCLIC_CPG, "Weapons Trigger")
AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_TRIM_UD", devices.HOTAS_INPUT, 3005, 3004, 565, CYCLIC_CPG, "Force Trim/Hold Mode Switch U/D (0=D/Down, 2=R/Up)")
AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_TRIM_LR", devices.HOTAS_INPUT, 3006, 3007, 566, CYCLIC_CPG, "Force Trim/Hold Mode Switch L/R (0=AT/Left, 2=A/Right)")
AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_WEAPON_UD", devices.HOTAS_INPUT, 3009, 3008, 567, CYCLIC_CPG, "Weapons Action Switch U/D (0=A/Down, 2=G/Up)")
AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_WEAPON_LR", devices.HOTAS_INPUT, 3010, 3011, 568, CYCLIC_CPG, "Weapons Action Switch L/R (0=M/Left, 2=R/Right)")
AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_SYMBOLOGY", devices.HOTAS_INPUT, 3013, 3012, 569, CYCLIC_CPG, "Symbology Select Switch (0=HB/Down, 2=CT/Up)")
AH_64D:definePushButton("CPG_CYCLIC_SYMBOLOGY_PRESS", devices.HOTAS_INPUT, 3014, 570, CYCLIC_CPG, "Symbology Select Switch - Depress")
-- AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_CMDS", devices.HOTAS_INPUT, 3016, 3015, 0, CYCLIC_PILOT, "CMDS Switch (0=Down, 2=Up)") -- appears to just trigger chaff/flare buttons
AH_64D:defineSpringloaded_3PosTumb("CPG_CYCLIC_RTS", devices.HOTAS_INPUT, 3017, 3018, 573, CYCLIC_CPG, "PTT/RTS Switch - (0=RADIO/Left, 2=ICS/Right)")
AH_64D:defineInputOnlyPushButton("CPG_CYCLIC_RTS_PRESS", devices.HOTAS_INPUT, 3019, CYCLIC_CPG, "PTT/RTS Switch - Depress") -- no arg present
AH_64D:reserveIntValue(1) -- in case RTS press gets a draw arg
AH_64D:definePushButton("CPG_CYCLIC_FMC_RELEASE", devices.HOTAS_INPUT, 3020, 574, CYCLIC_CPG, "FMC Release Button")
AH_64D:definePushButton("CPG_CYCLIC_CHAFF", devices.HOTAS_INPUT, 3021, 575, CYCLIC_CPG, "Chaff Dispense")
AH_64D:definePushButton("CPG_CYCLIC_FLARE", devices.HOTAS_INPUT, 3022, 572, CYCLIC_CPG, "Flare Dispense")
AH_64D:definePushButton("CPG_CYCLIC_ATA_CAGE", devices.HOTAS_INPUT, 3023, 576, CYCLIC_CPG, "ATA Missile Cage/Uncage Button")

-- additional throttle lever controls (these don't seem to work for the CP/G)
AH_64D:defineInputOnlySetStatePushButton("PLT_ENG_L_PW_LVR_LIFT", devices.CONTROL_INTERFACE, 3011, "PLT Left Console", "Power Lever Finger Lift (Left)")
AH_64D:defineInputOnlySetStatePushButton("PLT_ENG_R_PW_LVR_LIFT", devices.CONTROL_INTERFACE, 3012, "PLT Left Console", "Power Lever Finger Lift (Right)")
AH_64D:defineLoSetCommand2Pos("PLT_ENG_L_PW_LVR_IDLE", ICommand.left_engine_stop, ICommand.left_engine_start, "PLT Left Console", "Power Lever Idle/Off (Left)")
AH_64D:defineLoSetCommand2Pos("PLT_ENG_R_PW_LVR_IDLE", ICommand.right_engine_stop, ICommand.right_engine_start, "PLT Left Console", "Power Lever Idle/Off (Right)")

return AH_64D
