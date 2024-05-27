module("F-4E", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_4E: Module
local F_4E = Module:new("F-4E", 0x2A00, { "F-4E-45MC" })

--- Default limited multiposition tumb for F-4E
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param count integer the number of discrete steps the control has
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineMultipositionRollerLimited(identifier, device_id, command, arg_number, count, category, description)
	self:defineTumb(identifier, device_id, command, arg_number, 1 / (count - 1), { 0, 1 }, nil, false, category, description)
end

--- Adds a 3-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:define3PosTumb0To1(identifier, device_id, command, arg_number, category, description)
	self:defineMultipositionSwitch(identifier, device_id, command, arg_number, 3, 0.5, category, description)
end

--- Defines a 0-65535 output from a 0-1 input
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineFloatFromArg(identifier, arg_number, category, description)
	self:defineFloat(identifier, arg_number, { 0, 1 }, category, description)
end

-- ICS
local ICS_DEVICE_ID = 2

-- Pilot KY-28
local PILOT_KY_28 = "PLT KY-28"

F_4E:definePushButton("PLT_KY_28_P_MODE_TEST", ICS_DEVICE_ID, 3029, 2791, PILOT_KY_28, "KY-28 P Mode Light (push to test)")
F_4E:definePotentiometer("PLT_KY_28_P_MODE_DIM", ICS_DEVICE_ID, 3030, 2790, { 0, 1 }, PILOT_KY_28, "KY-28 P Mode Light (rotate to dim)")
F_4E:defineIndicatorLight("PLT_KY_28_P_MODE", 2554, PILOT_KY_28, "KY-28 P Mode Light")

F_4E:definePushButton("PLT_KY_28_C_MODE_TEST", ICS_DEVICE_ID, 3033, 2793, PILOT_KY_28, "KY-28 C Mode Light (push to test)")
F_4E:definePotentiometer("PLT_KY_28_C_MODE_DIM", ICS_DEVICE_ID, 3034, 2792, { 0, 1 }, PILOT_KY_28, "KY-28 C Mode Light (rotate to dim)")
F_4E:defineIndicatorLight("PLT_KY_28_C_MODE", 2555, PILOT_KY_28, "KY-28 C Mode Light")

-- WSO KY-28
local WSO_KY_28 = "WSO KY-28"

F_4E:definePushButton("WSO_KY_28_P_MODE_TEST", ICS_DEVICE_ID, 3037, 2622, WSO_KY_28, "KY-28 P Mode Light (push to test)")
F_4E:definePotentiometer("WSO_KY_28_P_MODE_DIM", ICS_DEVICE_ID, 3038, 2807, { 0, 1 }, WSO_KY_28, "KY-28 P Mode Light (rotate to dim)")
F_4E:defineIndicatorLight("WSO_KY_28_P_MODE", 2675, WSO_KY_28, "KY-28 P Mode Light")

F_4E:definePushButton("WSO_KY_28_C_MODE_TEST", ICS_DEVICE_ID, 3041, 2623, WSO_KY_28, "KY-28 C Mode Light (push to test)")
F_4E:definePotentiometer("WSO_KY_28_C_MODE_DIM", ICS_DEVICE_ID, 3042, 2808, { 0, 1 }, WSO_KY_28, "KY-28 C Mode Light (rotate to dim)")
F_4E:defineIndicatorLight("WSO_KY_28_C_MODE", 2676, WSO_KY_28, "KY-28 C Mode Light")

F_4E:definePushButton("WSO_KY_28_ERASE", ICS_DEVICE_ID, 3045, 2647, WSO_KY_28, "Erase KY-28 Data")
F_4E:defineToggleSwitch("WSO_KY_28_BAND", ICS_DEVICE_ID, 3047, 2648, WSO_KY_28, "Select KY-28 Mode")
F_4E:defineMultipositionSwitch("WSO_KY_28_MODE", ICS_DEVICE_ID, 3050, 2649, 3, 0.5, WSO_KY_28, "Select KY-28 Power Mode")

-- Pilot ICS
local PILOT_ICS_PANEL = "PLT ICS Panel"

F_4E:definePotentiometer("PLT_ICS_INTERCOM_VOL", ICS_DEVICE_ID, 3003, 76, { 0, 1 }, PILOT_ICS_PANEL, "Change Intercom Volume")
F_4E:defineMultipositionSwitch("PLT_ICS_AMPLIFIER", ICS_DEVICE_ID, 3004, 1409, 3, 0.5, PILOT_ICS_PANEL, "Select Amplifier")
F_4E:defineSpringloaded_3PosTumb("PLT_ICS_MODE", ICS_DEVICE_ID, 3005, 3005, 1378, PILOT_ICS_PANEL, "Set Mode")

-- WSO ICS
local WSO_ICS_PANEL = "WSO ICS Panel"

F_4E:definePotentiometer("WSO_ICS_INTERCOM_VOL", ICS_DEVICE_ID, 3006, 2666, { 0, 1 }, WSO_ICS_PANEL, "Change Intercom Volume")
F_4E:defineMultipositionSwitch("WSO_ICS_AMPLIFIER", ICS_DEVICE_ID, 3007, 2667, 3, 0.5, WSO_ICS_PANEL, "Select Amplifier")
F_4E:defineSpringloaded_3PosTumb("WSO_ICS_MODE", ICS_DEVICE_ID, 3008, 3008, 2668, WSO_ICS_PANEL, "Set Mode")

-- ARC-164
local ARC_164_DEVICE_ID = 3

local function arc_164_argument_display(dev0, arg_number, max_value)
	return Module.round(dev0:get_argument_value(arg_number) * max_value)
end

local function arc_164_freq(dev0, arg_hundreds, arg_tens, arg_ones, arg_tenths, arg_hundredths)
	local hundreds = arc_164_argument_display(dev0, arg_hundreds, 4)
	local hundreds_str = tostring(hundreds)
	if hundreds == 0 then
		hundreds_str = "T"
	elseif hundreds == 1 then
		hundreds_str = "2"
	elseif hundreds == 2 then
		hundreds_str = "3"
	elseif hundreds == 4 then
		hundreds_str = "A"
	end

	return string.format("%s%d%d.%d%02d", hundreds_str, arc_164_argument_display(dev0, arg_tens, 9), arc_164_argument_display(dev0, arg_ones, 9), arc_164_argument_display(dev0, arg_tenths, 9), arc_164_argument_display(dev0, arg_hundredths, 3) * 25)
end

local PILOT_ARC_164 = "PLT ARC-164"

F_4E:defineToggleSwitch("PLT_ARC_164_ANTENNA_SELECTION", ARC_164_DEVICE_ID, 3001, 118, PILOT_ARC_164, "Select Communication Antenna")

F_4E:definePushButton("PLT_ARC_164_TOGGLE_COMM_COMMAND", ARC_164_DEVICE_ID, 3002, 119, PILOT_ARC_164, "Toggle Radio Command")
F_4E:definePotentiometer("PLT_ARC_164_COMM_COMMAND_BRIGHTNESS", ARC_164_DEVICE_ID, 3054, 2768, { 0, 1 }, PILOT_ARC_164, "Change Radio Command Light Brightness")
F_4E:defineIndicatorLight("PLT_ARC_164_COMM_COMMAND_LIGHT", 169, PILOT_ARC_164, "Radio Command Lamp (Green)")
F_4E:definePotentiometer("PLT_ARC_164_VOLUME", ARC_164_DEVICE_ID, 3003, 121, { 0, 1 }, PILOT_ARC_164, "Change UHF Volume")
F_4E:defineToggleSwitch("PLT_ARC_164_SQUELCH", ARC_164_DEVICE_ID, 3024, 1374, PILOT_ARC_164, "UHF Squelch Switch")

F_4E:defineMultipositionRollerLimited("PLT_ARC_164_FREQ_HUNDREDS", ARC_164_DEVICE_ID, 3025, 1375, 4, PILOT_ARC_164, "Set Frequency (hundreds)")
F_4E:defineMultipositionRollerLimited("PLT_ARC_164_FREQ_TENS", ARC_164_DEVICE_ID, 3009, 134, 10, PILOT_ARC_164, "Set Frequency (tens)")
F_4E:defineMultipositionRollerLimited("PLT_ARC_164_FREQ_ONES", ARC_164_DEVICE_ID, 3008, 133, 10, PILOT_ARC_164, "Set Frequency (ones)")
F_4E:defineMultipositionRollerLimited("PLT_ARC_164_FREQ_TENTHS", ARC_164_DEVICE_ID, 3007, 132, 10, PILOT_ARC_164, "Set Frequency (decimal ones)")
F_4E:defineMultipositionRollerLimited("PLT_ARC_164_FREQ_HUNDREDTHS", ARC_164_DEVICE_ID, 3006, 131, 4, PILOT_ARC_164, "Set Frequency (decimal hundreds)")

F_4E:defineString("PLT_ARC_164_FREQ", function(dev0)
	return arc_164_freq(dev0, 1375, 134, 133, 132, 131)
end, 7, PILOT_ARC_164, "ARC-164 Frequency")

F_4E:defineMultipositionRollerLimited("PLT_ARC_164_COMM_CHANNEL", ARC_164_DEVICE_ID, 3005, 123, 18, PILOT_ARC_164, "Set Comm Channel")
F_4E:defineMultipositionRollerLimited("PLT_ARC_164_AUX_CHANNEL", ARC_164_DEVICE_ID, 3011, 136, 20, PILOT_ARC_164, "Set AUX Channel")

F_4E:definePushButton("PLT_ARC_164_LOAD_COMM_CHANNEL", ARC_164_DEVICE_ID, 3010, 135, PILOT_ARC_164, "Load Selected Comm Channel")
F_4E:defineToggleSwitch("PLT_ARC_164_FREQ_MODE", ARC_164_DEVICE_ID, 3026, 1376, PILOT_ARC_164, "Select Frequency Mode")
F_4E:definePushButton("PLT_ARC_164_TONE", ARC_164_DEVICE_ID, 3027, 1377, PILOT_ARC_164, "Tone Button")
F_4E:defineMultipositionRollerLimited("PLT_ARC_164_MODE", ARC_164_DEVICE_ID, 3004, 122, 6, PILOT_ARC_164, "Select Radio Mode")
F_4E:definePotentiometer("PLT_ARC_164_AUX_VOLUME", ARC_164_DEVICE_ID, 3012, 139, { 0, 1 }, PILOT_ARC_164, "Change AUX Volume")

local WSO_ARC_164 = "WSO ARC-164"

F_4E:definePushButton("WSO_ARC_164_TOGGLE_COMMAND", ARC_164_DEVICE_ID, 3013, 144, WSO_ARC_164, "Toggle Radio Command")
F_4E:definePotentiometer("WSO_ARC_164_COMMAND_BRIGHTNESS", ARC_164_DEVICE_ID, 3055, 2772, { 0, 1 }, WSO_ARC_164, "Change Radio Command Light Brightness")
F_4E:defineIndicatorLight("WSO_ARC_164_COMM_COMMAND_LIGHT", 172, WSO_ARC_164, "Radio Command Lamp (Green)")
F_4E:definePotentiometer("WSO_ARC_164_VOLUME", ARC_164_DEVICE_ID, 3014, 146, { 0, 1 }, WSO_ARC_164, "Change UHF Volume")
F_4E:defineToggleSwitch("WSO_ARC_164_SQUELCH", ARC_164_DEVICE_ID, 3028, 2524, WSO_ARC_164, "UHF Squelch Switch")

F_4E:defineMultipositionRollerLimited("WSO_ARC_164_FREQ_HUNDREDS", ARC_164_DEVICE_ID, 3029, 2030, 4, WSO_ARC_164, "Set Frequency (hundreds)")
F_4E:defineMultipositionRollerLimited("WSO_ARC_164_FREQ_TENS", ARC_164_DEVICE_ID, 3020, 159, 10, WSO_ARC_164, "Set Frequency (tens)")
F_4E:defineMultipositionRollerLimited("WSO_ARC_164_FREQ_ONES", ARC_164_DEVICE_ID, 3019, 158, 10, WSO_ARC_164, "Set Frequency (ones)")
F_4E:defineMultipositionRollerLimited("WSO_ARC_164_FREQ_TENTHS", ARC_164_DEVICE_ID, 3018, 157, 10, WSO_ARC_164, "Set Frequency (decimal ones)")
F_4E:defineMultipositionRollerLimited("WSO_ARC_164_FREQ_HUNDREDTHS", ARC_164_DEVICE_ID, 3017, 156, 4, WSO_ARC_164, "Set Frequency (decimal hundreds)")

F_4E:defineString("WSO_ARC_164_FREQ", function(dev0)
	return arc_164_freq(dev0, 2030, 159, 158, 157, 156)
end, 7, WSO_ARC_164, "ARC-164 Frequency")

F_4E:defineMultipositionRollerLimited("WSO_ARC_164_COMM_CHANNEL", ARC_164_DEVICE_ID, 3016, 148, 18, WSO_ARC_164, "Set Comm Channel")
F_4E:defineMultipositionRollerLimited("WSO_ARC_164_AUX_CHANNEL", ARC_164_DEVICE_ID, 3022, 161, 20, WSO_ARC_164, "Set AUX Channel")

F_4E:definePushButton("WSO_ARC_164_LOAD_COMM_CHANNEL", ARC_164_DEVICE_ID, 3021, 160, WSO_ARC_164, "Load Selected Comm Channel")
F_4E:defineToggleSwitch("WSO_ARC_164_FREQ_MODE", ARC_164_DEVICE_ID, 3030, 147, WSO_ARC_164, "Select Frequency Mode")
F_4E:definePushButton("WSO_ARC_164_TONE", ARC_164_DEVICE_ID, 3031, 2523, WSO_ARC_164, "Tone Button")
F_4E:defineMultipositionRollerLimited("WSO_ARC_164_MODE", ARC_164_DEVICE_ID, 3015, 2031, 6, WSO_ARC_164, "Select Radio Mode")
F_4E:definePotentiometer("WSO_ARC_164_AUX_VOLUME", ARC_164_DEVICE_ID, 3023, 164, { 0, 1 }, WSO_ARC_164, "Change AUX Volume")

-- IFF
local IFF_DEVICE_ID = 4

-- pilot iff panel
local PILOT_IFF_PANEL = "PLT IFF Panel"

F_4E:defineMultipositionSwitch("PLT_IFF_CODE", IFF_DEVICE_ID, 3001, 1322, 4, 1 / 3, PILOT_IFF_PANEL, "Select Mode 4 Function")
F_4E:definePushButton("PLT_IFF_REPLY_TEST_BUTTON", IFF_DEVICE_ID, 3064, 2843, PILOT_IFF_PANEL, "IFF Reply Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_REPLY_TEST_DIM", IFF_DEVICE_ID, 3065, 2842, { 0, 1 }, PILOT_IFF_PANEL, "IFF Reply Lamp (rotate to dim)")
F_4E:defineIndicatorLight("PLT_IFF_REPLY_TEST_LIGHT", 2557, PILOT_IFF_PANEL, "IFF Reply Test Light (Blue)")
F_4E:definePushButton("PLT_IFF_TEST_BUTTON", IFF_DEVICE_ID, 3066, 2845, PILOT_IFF_PANEL, "IFF Test Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_TEST_DIM", IFF_DEVICE_ID, 3067, 2844, { 0, 1 }, PILOT_IFF_PANEL, "IFF Test Lamp (rotate to dim)")
F_4E:defineIndicatorLight("PLT_IFF_TEST_LIGHT", 2556, PILOT_IFF_PANEL, "IFF Test Light (Blue)")
F_4E:defineMultipositionSwitch("PLT_IFF_MASTER", IFF_DEVICE_ID, 3005, 1521, 5, 1 / 4, PILOT_IFF_PANEL, "Select Master Mode")
F_4E:define3PosTumb("PLT_IFF_AUDIO_LIGHT_SW", IFF_DEVICE_ID, 3009, 1328, PILOT_IFF_PANEL, "Select Mode 4 Indication")
F_4E:define3PosTumb("PLT_IFF_M1", IFF_DEVICE_ID, 3013, 1323, PILOT_IFF_PANEL, "Mode 1")
F_4E:define3PosTumb("PLT_IFF_M2", IFF_DEVICE_ID, 3017, 1324, PILOT_IFF_PANEL, "Mode 2")
F_4E:define3PosTumb("PLT_IFF_M3", IFF_DEVICE_ID, 3021, 1325, PILOT_IFF_PANEL, "Mode 3A")
F_4E:define3PosTumb("PLT_IFF_MC", IFF_DEVICE_ID, 3025, 1326, PILOT_IFF_PANEL, "Mode C")
F_4E:define3PosTumb("PLT_IFF_RAD", IFF_DEVICE_ID, 3029, 1329, PILOT_IFF_PANEL, "Monitor Radiation")
F_4E:defineToggleSwitch("PLT_IFF_M4", IFF_DEVICE_ID, 3033, 1327, PILOT_IFF_PANEL, "Mode 4")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M1_CODE_TENS", IFF_DEVICE_ID, 3036, 1331, 8, PILOT_IFF_PANEL, "M1 Code (tens)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M1_CODE_ONES", IFF_DEVICE_ID, 3040, 1332, 4, PILOT_IFF_PANEL, "M1 Code (ones)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_THOUSANDS", IFF_DEVICE_ID, 3044, 1333, 8, PILOT_IFF_PANEL, "M3 Code (thousands)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_HUNDREDS", IFF_DEVICE_ID, 3048, 1334, 8, PILOT_IFF_PANEL, "M3 Code (hundreds)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_TENS", IFF_DEVICE_ID, 3052, 1335, 8, PILOT_IFF_PANEL, "M3 Code (tens)")
F_4E:defineMultipositionRollerLimited("PLT_IFF_M3_CODE_ONES", IFF_DEVICE_ID, 3056, 1336, 8, PILOT_IFF_PANEL, "M3 Code (ones)")

local function plt_iff_argument_display(dev0, arg_number, max_value)
	return Module.round(dev0:get_argument_value(arg_number) * max_value)
end

F_4E:defineString("PLT_IFF_M1_CODE", function(dev0)
	return string.format("%d%d", plt_iff_argument_display(dev0, 1331, 7), plt_iff_argument_display(dev0, 1332, 3))
end, 2, PILOT_IFF_PANEL, "M1 Code")

F_4E:defineString("PLT_IFF_M3_CODE", function(dev0)
	return string.format("%d%d%d%d", plt_iff_argument_display(dev0, 1333, 7), plt_iff_argument_display(dev0, 1334, 7), plt_iff_argument_display(dev0, 1335, 7), plt_iff_argument_display(dev0, 1336, 7))
end, 4, PILOT_IFF_PANEL, "M3 Code")

F_4E:define3PosTumb("PLT_IFF_IDENT", IFF_DEVICE_ID, 3060, 1330, PILOT_IFF_PANEL, "Set Position Identification")

-- Countermeasures
local COUNTERMEASURES_DEVICE_ID = 5

-- pilot countermeasures panel
local PILOT_COUNTERMEASURES_PANEL = "PLT Countermeasures Panel"

F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_BURST_COUNT", COUNTERMEASURES_DEVICE_ID, 3014, 1500, 6, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Burst Count")
F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_BURST_INTERVAL", COUNTERMEASURES_DEVICE_ID, 3015, 1501, 4, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Burst Interval")
F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_SALVO_COUNT", COUNTERMEASURES_DEVICE_ID, 3016, 1502, 5, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Salvo Count")
F_4E:defineMultipositionRollerLimited("PLT_CM_CHAFF_SALVO_INTERVAL", COUNTERMEASURES_DEVICE_ID, 3017, 1503, 7, PILOT_COUNTERMEASURES_PANEL, "Select Chaff Salvo Interval")
F_4E:defineMultipositionRollerLimited("PLT_CM_FLARE_BURST_COUNT", COUNTERMEASURES_DEVICE_ID, 3018, 1504, 5, PILOT_COUNTERMEASURES_PANEL, "Select Flare Burst Count")
F_4E:defineMultipositionRollerLimited("PLT_CM_FLARE_BURST_INTERVAL", COUNTERMEASURES_DEVICE_ID, 3019, 1505, 5, PILOT_COUNTERMEASURES_PANEL, "Select Flare Burst Interval")
F_4E:definePushButton("PLT_CM_ON_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3002, 1437, PILOT_COUNTERMEASURES_PANEL, "CMS Indicator (push to test)")
F_4E:definePotentiometer("PLT_CM_ON_DIM", COUNTERMEASURES_DEVICE_ID, 3003, 1438, { 0, 1 }, PILOT_COUNTERMEASURES_PANEL, "CMS Indicator (rotate to dim)")
F_4E:defineIndicatorLight("PLT_CM_ON_LIGHT", 1414, PILOT_COUNTERMEASURES_PANEL, "ALE-40 On Lamp (Green)")
F_4E:definePushButton("PLT_CM_FLARE_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3004, 1439, PILOT_COUNTERMEASURES_PANEL, "Flare Indicator (push to test)")
F_4E:definePotentiometer("PLT_CM_FLARE_DIM", COUNTERMEASURES_DEVICE_ID, 3005, 1440, { 0, 1 }, PILOT_COUNTERMEASURES_PANEL, "Flare Indicator (rotate to dim)")
F_4E:defineIndicatorLight("PLT_CM_FLARE_LIGHT", 1415, PILOT_COUNTERMEASURES_PANEL, "ALE-40 Flares Lamp (Red)")
F_4E:defineToggleSwitch("PLT_CM_FLARE_NORMAL", COUNTERMEASURES_DEVICE_ID, 3001, 1417, PILOT_COUNTERMEASURES_PANEL, "Select Dispense Program")

-- wso countermeasures panel
local WSO_COUNTERMEASURES_PANEL = "WSO Countermeasures Panel"

F_4E:definePushButton("WSO_CM_DISPENSE", COUNTERMEASURES_DEVICE_ID, 3013, 1447, WSO_COUNTERMEASURES_PANEL, "Dispense Countermeasures")
F_4E:defineToggleSwitch("WSO_CM_RIPPLE_COVER", COUNTERMEASURES_DEVICE_ID, 3010, 1446, WSO_COUNTERMEASURES_PANEL, "Ripple Switch Cover")
F_4E:defineToggleSwitch("WSO_CM_RIPPLE", COUNTERMEASURES_DEVICE_ID, 3011, 1445, WSO_COUNTERMEASURES_PANEL, "Toggle Ripple Release")
F_4E:definePushButton("WSO_CM_CHAFF_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3006, 1450, WSO_COUNTERMEASURES_PANEL, "Chaff Indicator (push to test)")
F_4E:definePotentiometer("WSO_CM_CHAFF_DIM", COUNTERMEASURES_DEVICE_ID, 3007, 1448, { 0, 1 }, WSO_COUNTERMEASURES_PANEL, "Chaff Indicator (rotate to dim)")
F_4E:defineIndicatorLight("WSO_CM_CHAFF_LIGHT", 1441, WSO_COUNTERMEASURES_PANEL, "Chaff Lamp (Green)")
F_4E:defineMultipositionRollerLimited("WSO_CM_CHAFF_MODE", COUNTERMEASURES_DEVICE_ID, 3020, 1444, 4, WSO_COUNTERMEASURES_PANEL, "Select Chaff Mode")
F_4E:definePushButton("WSO_CM_FLARE_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3008, 1451, WSO_COUNTERMEASURES_PANEL, "Flare Indicator (push to test)")
F_4E:definePotentiometer("WSO_CM_FLARE_DIM", COUNTERMEASURES_DEVICE_ID, 3009, 1449, { 0, 1 }, WSO_COUNTERMEASURES_PANEL, "Flare Indicator (rotate to dim)")
F_4E:defineIndicatorLight("WSO_CM_FLARE_LIGHT", 1442, WSO_COUNTERMEASURES_PANEL, "Flare Lamp (Red)")
F_4E:defineMultipositionRollerLimited("WSO_CM_FLARE_MODE", COUNTERMEASURES_DEVICE_ID, 3021, 1443, 3, WSO_COUNTERMEASURES_PANEL, "Select Flare Mode")

local function wso_cm_display(dev0, arg_number)
	return Module.round(dev0:get_argument_value(arg_number) * 10) % 10
end

local wso_cm_chaff_hundreds = 0
local wso_cm_chaff_tens = 0
local wso_cm_chaff_ones = 0
local wso_cm_chaff = ""

F_4E:addExportHook(function(dev0)
	wso_cm_chaff_hundreds = Module.round(wso_cm_display(dev0, 1390))
	wso_cm_chaff_tens = Module.round(wso_cm_display(dev0, 1391))
	wso_cm_chaff_ones = Module.round(wso_cm_display(dev0, 1392))
	wso_cm_chaff = string.format("%d%d%d", wso_cm_chaff_hundreds, wso_cm_chaff_tens, wso_cm_chaff_ones)
end)

local wso_cm_flare_hundreds = 0
local wso_cm_flare_tens = 0
local wso_cm_flare_ones = 0
local wso_cm_flare = ""

F_4E:addExportHook(function(dev0)
	wso_cm_flare_hundreds = Module.round(wso_cm_display(dev0, 1393))
	wso_cm_flare_tens = Module.round(wso_cm_display(dev0, 1394))
	wso_cm_flare_ones = Module.round(wso_cm_display(dev0, 1395))
	wso_cm_flare = string.format("%d%d%d", wso_cm_flare_hundreds, wso_cm_flare_tens, wso_cm_flare_ones)
end)

F_4E:defineIntegerFromGetter("WSO_CM_CHAFF_HUNDREDS", function()
	return wso_cm_chaff_hundreds
end, 9, WSO_COUNTERMEASURES_PANEL, "Chaff Counter (hundreds)")
F_4E:defineIntegerFromGetter("WSO_CM_CHAFF_TENS", function()
	return wso_cm_chaff_tens
end, 9, WSO_COUNTERMEASURES_PANEL, "Chaff Counter (tens)")
F_4E:defineIntegerFromGetter("WSO_CM_CHAFF_ONES", function()
	return wso_cm_chaff_ones
end, 9, WSO_COUNTERMEASURES_PANEL, "Chaff Counter (ones)")
F_4E:defineString("WSO_CM_CHAFF", function()
	return wso_cm_chaff
end, 3, WSO_COUNTERMEASURES_PANEL, "Chaff Counter")

F_4E:defineIntegerFromGetter("WSO_CM_FLARE_HUNDREDS", function()
	return wso_cm_flare_hundreds
end, 9, WSO_COUNTERMEASURES_PANEL, "Flare Counter (hundreds)")
F_4E:defineIntegerFromGetter("WSO_CM_FLARE_TENS", function()
	return wso_cm_flare_tens
end, 9, WSO_COUNTERMEASURES_PANEL, "Flare Counter (tens)")
F_4E:defineIntegerFromGetter("WSO_CM_FLARE_ONES", function()
	return wso_cm_flare_ones
end, 9, WSO_COUNTERMEASURES_PANEL, "Flare Counter (ones)")
F_4E:defineString("WSO_CM_FLARE", function()
	return wso_cm_flare
end, 3, WSO_COUNTERMEASURES_PANEL, "Flare Counter")

-- cockpit
local COCKPIT_DEVICE_ID = 7

-- Pilot Cockpit
local PILOT_COCKPIT = "PLT Cockpit"

-- presently, toggling one mirror toggles all mirrors in both cockpits
F_4E:defineToggleSwitch("PLT_COCKPIT_MIRROR_TOP", COCKPIT_DEVICE_ID, 3019, 3061, PILOT_COCKPIT, "Toggle Mirrors C")
F_4E:defineToggleSwitch("PLT_COCKPIT_MIRROR_LEFT", COCKPIT_DEVICE_ID, 3020, 3062, PILOT_COCKPIT, "Toggle Mirrors L")
F_4E:defineToggleSwitch("PLT_COCKPIT_MIRROR_RIGHT", COCKPIT_DEVICE_ID, 3021, 3063, PILOT_COCKPIT, "Toggle Mirrors R")
F_4E:defineToggleSwitch("PLT_COCKPIT_HELMET", COCKPIT_DEVICE_ID, 3028, 1900, PILOT_COCKPIT, "Put On / Take Off Helmet")

-- WSO Cockpit
local WSO_COCKPIT = "WSO Cockpit"

-- 2024-05-25 mirrors intentionally use same arg_number as pilot - this is the way it is in the module lua
F_4E:defineToggleSwitch("WSO_COCKPIT_MIRROR_LEFT", COCKPIT_DEVICE_ID, 3034, 3062, WSO_COCKPIT, "Toggle WSO Mirror Left")
F_4E:defineToggleSwitch("WSO_COCKPIT_MIRROR_RIGHT", COCKPIT_DEVICE_ID, 3035, 3063, WSO_COCKPIT, "Toggle WSO Mirror Right")
F_4E:defineToggleSwitch("WSO_COCKPIT_HELMET", COCKPIT_DEVICE_ID, 3031, 1903, WSO_COCKPIT, "Put On / Take Off Helmet")

-- AFCS
local AFCS_DEVICE_ID = 9

-- Pilot AFCS Panel
local PILOT_AFCS_PANEL = "PLT AFCS Panel"

F_4E:defineToggleSwitch("PLT_AFCS_STAB_AUG_YAW", AFCS_DEVICE_ID, 3010, 1506, PILOT_AFCS_PANEL, "STAB AUG Yaw")
F_4E:defineToggleSwitch("PLT_AFCS_STAB_AUG_ROLL", AFCS_DEVICE_ID, 3012, 1507, PILOT_AFCS_PANEL, "STAB AUG Roll")
F_4E:defineToggleSwitch("PLT_AFCS_STAB_AUG_PITCH", AFCS_DEVICE_ID, 3014, 1508, PILOT_AFCS_PANEL, "STAB AUG Pitch")
F_4E:defineToggleSwitch("PLT_AFCS_AUTOPILOT", AFCS_DEVICE_ID, 3016, 1509, PILOT_AFCS_PANEL, "AFCS Autopilot")
F_4E:defineToggleSwitch("PLT_AFCS_ALT_HOLD", AFCS_DEVICE_ID, 3018, 1510, PILOT_AFCS_PANEL, "Altitude Hold")

-- Clock
local CLOCK_DEVICE_ID = 11

-- Pilot Clock
local PILOT_CLOCK = "PLT Clock"

F_4E:definePushButton("PLT_CLOCK_STOPWATCH", CLOCK_DEVICE_ID, 3003, 808, PILOT_CLOCK, "Start/Stop/Reset Stopwatch")
F_4E:definePushButton("PLT_CLOCK_SET_TIME_PULL", CLOCK_DEVICE_ID, 3001, 812, PILOT_CLOCK, "Set Time (pull)")
F_4E:defineRotary("PLT_CLOCK_SET_TIME_ROTATE", CLOCK_DEVICE_ID, 3002, 809, PILOT_CLOCK, "Set Time (rotate)")

F_4E:defineFloatFromArg("PLT_CLOCK_HOUR_HAND", 800, PILOT_CLOCK, "Clock Hour Hand")
F_4E:defineFloatFromArg("PLT_CLOCK_MINUTE_HAND", 801, PILOT_CLOCK, "Clock Minute Hand")
F_4E:defineFloatFromArg("PLT_CLOCK_STOPWATCH_MINUTE_HAND", 803, PILOT_CLOCK, "Stopwatch Minute Hand")
F_4E:defineFloatFromArg("PLT_CLOCK_STOPWATCH_SECOND_HAND", 802, PILOT_CLOCK, "Stopwatch Second Hand")

-- WSO Clock
local WSO_CLOCK = "WSO Clock"

F_4E:definePushButton("WSO_CLOCK_STOPWATCH", CLOCK_DEVICE_ID, 3006, 810, WSO_CLOCK, "Start/Stop/Reset Stopwatch")
F_4E:definePushButton("WSO_CLOCK_SET_TIME_PULL", CLOCK_DEVICE_ID, 3004, 813, WSO_CLOCK, "Set Time (pull)")
F_4E:defineRotary("WSO_CLOCK_SET_TIME_ROTATE", CLOCK_DEVICE_ID, 3005, 811, WSO_CLOCK, "Set Time (rotate)")

F_4E:defineFloatFromArg("WSO_CLOCK_HOUR_HAND", 804, WSO_CLOCK, "Clock Hour Hand")
F_4E:defineFloatFromArg("WSO_CLOCK_MINUTE_HAND", 805, WSO_CLOCK, "Clock Minute Hand")
F_4E:defineFloatFromArg("WSO_CLOCK_STOPWATCH_MINUTE_HAND", 807, WSO_CLOCK, "Stopwatch Minute Hand")
F_4E:defineFloatFromArg("WSO_CLOCK_STOPWATCH_SECOND_HAND", 806, WSO_CLOCK, "Stopwatch Second Hand")

-- Radar Altimeter
local RADAR_ALTIMETER_DEVICE_ID = 12

-- Pilot Radar Altimeter
local PILOT_RADAR_ALTIMETER = "PLT Radar Altimeter"

F_4E:definePushButton("PLT_RADAR_ALT_PUSH_TEST", RADAR_ALTIMETER_DEVICE_ID, 3001, 84, PILOT_RADAR_ALTIMETER, "Move Bug (push to test)")
F_4E:definePotentiometer("PLT_RADAR_ALT_MOVE_BUG", RADAR_ALTIMETER_DEVICE_ID, 3002, 83, { -0.2, 1 }, PILOT_RADAR_ALTIMETER, "Move Bug (rotate to 0 to turn off)")
F_4E:defineIndicatorLight("PLT_RADAR_ALT_WARN_LIGHT", 85, PILOT_RADAR_ALTIMETER, "Radar Altimeter Low Altitude Lamp (Red)")
F_4E:defineFloatFromArg("PLT_RADAR_ALT_NEEDLE", 73, PILOT_RADAR_ALTIMETER, "Radar Altimeter Needle")
F_4E:defineFloatFromArg("PLT_RADAR_ALT_BUG", 74, PILOT_RADAR_ALTIMETER, "Radar Altimeter Altitude Bug")
F_4E:defineFloatFromArg("PLT_RADAR_ALT_OFF_FLAG", 75, PILOT_RADAR_ALTIMETER, "Radar Altimeter Off Flag")

-- AOA System
local AOA_DEVICE_ID = 13

-- Pilot AoA Indicator
local PILOT_AOA_INDICATOR = "PLT AoA Indicator"

F_4E:definePotentiometer("PLT_AOA_AURAL_TONE", AOA_DEVICE_ID, 3001, 635, { 0, 1 }, PILOT_AOA_INDICATOR, "Aural Tone Volume")
F_4E:definePotentiometer("PLT_AOA_STALL_VOLUME", AOA_DEVICE_ID, 3005, 1372, { 0, 1 }, PILOT_AOA_INDICATOR, "AoA Stall Warning Volume")

F_4E:defineFloatFromArg("PLT_AOA_GAUGE_NEEDLE", 70, PILOT_AOA_INDICATOR, "AoA Gauge Needle")
F_4E:defineFloatFromArg("PLT_AOA_GAUGE_OFF_FLAG", 71, PILOT_AOA_INDICATOR, "AoA Gauge Off Flag")

F_4E:defineFloatFromArg("PLT_AOA_INDEXER_BRIGHTNESS", 2874, PILOT_AOA_INDICATOR, "AoA Indexer Brightness")
F_4E:defineIndicatorLight("PLT_AOA_INDEXER_LEFT_LOW", 77, PILOT_AOA_INDICATOR, "AoA Indexer Low Lamp (Left) (Red)")
F_4E:defineIndicatorLight("PLT_AOA_INDEXER_LEFT_MID", 78, PILOT_AOA_INDICATOR, "AoA Indexer Mid Lamp (Left) (Red)")
F_4E:defineIndicatorLight("PLT_AOA_INDEXER_LEFT_TOP", 79, PILOT_AOA_INDICATOR, "AoA Indexer Upper Lamp (Left) (Red)")
F_4E:defineIndicatorLight("PLT_AOA_INDEXER_RIGHT_LOW", 375, PILOT_AOA_INDICATOR, "AoA Indexer Low Lamp (Right) (Red)")
F_4E:defineIndicatorLight("PLT_AOA_INDEXER_RIGHT_MID", 376, PILOT_AOA_INDICATOR, "AoA Indexer Mid Lamp (Right) (Red)")
F_4E:defineIndicatorLight("PLT_AOA_INDEXER_RIGHT_TOP", 377, PILOT_AOA_INDICATOR, "AoA Indexer Upper Lamp (Right) (Red)")

-- WSO AoA Indicator
local WSO_AOA_INDICATOR = "WSO AoA Indicator"

F_4E:definePotentiometer("WSO_AOA_AURAL_TONE", AOA_DEVICE_ID, 3006, 2822, { 0, 1 }, WSO_AOA_INDICATOR, "Aural Tone Volume")
F_4E:definePotentiometer("WSO_AOA_STALL_VOLUME", AOA_DEVICE_ID, 3003, 636, { 0, 1 }, WSO_AOA_INDICATOR, "AoA Stall Warning Volume")

F_4E:defineFloatFromArg("WSO_AOA_INDEXER_BRIGHTNESS", 2875, WSO_AOA_INDICATOR, "AoA Indexer Brightness")
F_4E:defineIndicatorLight("WSO_AOA_INDEXER_LEFT_LOW", 637, WSO_AOA_INDICATOR, "AoA Indexer Low Lamp (Left) (Red)")
F_4E:defineIndicatorLight("WSO_AOA_INDEXER_LEFT_MID", 638, WSO_AOA_INDICATOR, "AoA Indexer Mid Lamp (Left) (Red)")
F_4E:defineIndicatorLight("WSO_AOA_INDEXER_LEFT_TOP", 639, WSO_AOA_INDICATOR, "AoA Indexer Upper Lamp (Left) (Red)")
F_4E:defineIndicatorLight("WSO_AOA_INDEXER_RIGHT_LOW", 378, WSO_AOA_INDICATOR, "AoA Indexer Low Lamp (Right) (Red)")
F_4E:defineIndicatorLight("WSO_AOA_INDEXER_RIGHT_MID", 379, WSO_AOA_INDICATOR, "AoA Indexer Mid Lamp (Right) (Red)")
F_4E:defineIndicatorLight("WSO_AOA_INDEXER_RIGHT_TOP", 380, WSO_AOA_INDICATOR, "AoA Indexer Upper Lamp (Right) (Red)")

-- INS (AN-ASN-63)
local INS_DEVICE_ID = 14

local WSO_INS_PANEL = "WSO INS Panel"

F_4E:defineToggleSwitch("WSO_INS_ALIGN_MODE_COVER", INS_DEVICE_ID, 3001, 996, WSO_INS_PANEL, "INS Align Mode Cover")
F_4E:defineToggleSwitch("WSO_INS_ALIGN_MODE", INS_DEVICE_ID, 3002, 997, WSO_INS_PANEL, "INS Align Mode Switch")
F_4E:defineMultipositionRollerLimited("WSO_INS_POWER", INS_DEVICE_ID, 3003, 998, 4, WSO_INS_PANEL, "INS Power Knob")
F_4E:definePotentiometer("WSO_INS_ALIGN_DIM", INS_DEVICE_ID, 3007, 2818, { 0, 1 }, WSO_INS_PANEL, "INS Align Lamp (rotate to dim)")
F_4E:defineIndicatorLight("WSO_INS_ALIGN", 999, WSO_INS_PANEL, "WSO INS Align Lamp (Green)")
F_4E:definePotentiometer("WSO_INS_HEAT_DIM", INS_DEVICE_ID, 3008, 2819, { 0, 1 }, WSO_INS_PANEL, "INS Heat Lamp (rotate to dim)")
F_4E:defineIndicatorLight("WSO_INS_HEAT", 1000, WSO_INS_PANEL, "WSO INS Heat Lamp (Red)")

-- Navigation (AN-ASN-46A)
local NAVIGATION_DEVICE_ID = 16

-- Pneumatic Gauge
local PNEUMATIC_GAUGE_DEVICE_ID = 17

-- Hydraulic Gauge
local HYDRAULIC_GAUGE_DEVICE_ID = 18

-- Landing Gear
local LANDING_GEAR_DEVICE_ID = 20

-- Indicators
local INDICATORS_DEVICE_ID = 22

-- Canopy
local CANOPY_DEVICE_ID = 23

-- Engine
local ENGINE_DEVICE_ID = 24

-- Control Surfaces
local CONTROL_SURFACES_DEVICE_ID = 25

-- Oxygen System
local OXYGEN_SYSTEM_DEVICE_ID = 26

local PILOT_O2_SYSTEM = "PLT Oxygen System"

F_4E:definePushButton("PLT_O2_TEST", OXYGEN_SYSTEM_DEVICE_ID, 3001, 232, PILOT_O2_SYSTEM, "Test Oxygen Gauge")
F_4E:defineSpringloaded_3PosTumb("PLT_O2_MODE", OXYGEN_SYSTEM_DEVICE_ID, 3002, 3002, 235, PILOT_O2_SYSTEM, "Select Oxygen Mode")
F_4E:defineToggleSwitch("PLT_O2_MIXTURE", OXYGEN_SYSTEM_DEVICE_ID, 3004, 236, PILOT_O2_SYSTEM, "Select Oxygen Mixture")
F_4E:defineToggleSwitch("PLT_O2_SUPPLY", OXYGEN_SYSTEM_DEVICE_ID, 3006, 237, PILOT_O2_SYSTEM, "Oxygen Supply")

F_4E:defineFloat("PLT_O2_FLOW", 234, { 0, 1 }, PILOT_O2_SYSTEM, "Oxygen Flow Indicator (White)")
F_4E:defineFloat("PLT_O2_PRESSURE", 233, { 0, 1 }, PILOT_O2_SYSTEM, "Oxygen Supply Pressure Gauge")
F_4E:defineFloat("PLT_O2_LITERS", 231, { 0, 1 }, PILOT_O2_SYSTEM, "Oxygen Supply Liters Gauge")

local WSO_O2_SYSTEM = "WSO Oxygen System"

F_4E:reserveIntValue(65535) -- Lamp Cap, not yet implemented

F_4E:defineSpringloaded_3PosTumb("WSO_O2_MODE", OXYGEN_SYSTEM_DEVICE_ID, 3003, 3003, 242, WSO_O2_SYSTEM, "Select Oxygen Mode")
F_4E:defineToggleSwitch("WSO_O2_MIXTURE", OXYGEN_SYSTEM_DEVICE_ID, 3005, 243, WSO_O2_SYSTEM, "Select Oxygen Mixture")
F_4E:defineToggleSwitch("WSO_O2_SUPPLY", OXYGEN_SYSTEM_DEVICE_ID, 3007, 244, WSO_O2_SYSTEM, "Oxygen Supply")

F_4E:defineFloat("WSO_O2_FLOW", 241, { 0, 1 }, WSO_O2_SYSTEM, "Oxygen Flow Indicator (White)")
F_4E:defineFloat("WSO_O2_PRESSURE", 245, { 0, 1 }, WSO_O2_SYSTEM, "Oxygen Supply Pressure Gauge")

-- Weapons
local WEAPONS_DEVICE_ID = 27

-- pilot weapons panel
local PILOT_WEAPONS_PANEL = "PLT Weapons Panel"

F_4E:defineToggleSwitch("PLT_MASTER_ARM_SW", WEAPONS_DEVICE_ID, 3003, 247, PILOT_WEAPONS_PANEL, "PILOT Master Arm switch")

-- Turn/Slip Indicators
local TURN_SLIP_DEVICE_ID = 29

-- HUD (AN-ASG-26)
local HUD_DEVICE_ID = 31

-- Accelerometer
local ACCELEROMETER_DEVICE_ID = 35

-- Pitot/Static System
local PITOT_STATIC_DEVICE_ID = 36

-- CADC
local CADC_DEVICE_ID = 38

-- Speed Indicator
local SPEED_DEVICE_ID = 39

-- Barometric Altimeter
local BARO_ALTIMETER_DEVICE_ID = 40

-- Vertical Velocity Indicator
local VVI_DEVICE_ID = 41

-- TAS Indicator
local TAS_DEVICE_ID = 42

-- ADI (ARU-11-A)
local ADI_DEVICE_ID = 44

-- CNI (AN-ASQ-19A)
local CNI_DEVICE_ID = 45

-- Ground Speed Indicator
local GS_DEVICE_ID = 46

-- Emergency Attitude Indicator
local EMERGENCY_ATTITUDE_DEVICE_ID = 47

-- TACAN (AN-ARN-118)
local TACAN_DEVICE_ID = 48

-- Flight Director Computer
local FLIGHT_DIRECTOR_DEVICE_ID = 49

-- HSI (AF-A24J-1)
local HSI_DEVICE_ID = 50

-- Radar
local RADAR_DEVICE_ID = 52

-- BDHI
local BDHI_DEVICE_ID = 53

-- Compass System
local COMPASS_DEVICE_ID = 54

-- Electric System
local ELECTRICS_DEVICE_ID = 55

-- Attitude Indicator (ARU-13A)
local ATTITUDE_INDICATOR_DEVICE_ID = 56

-- Fuel
local FUEL_DEVICE_ID = 60

-- pilot fuel panel
local PILOT_FUEL_PANEL = "PLT Fuel Panel"

F_4E:defineToggleSwitch("PLT_FUEL_WING_INTERNAL_FEED", FUEL_DEVICE_ID, 3004, 710, PILOT_FUEL_PANEL, "Internal Wing Tanks Feed")
F_4E:defineToggleSwitch("PLT_FUEL_REFUEL_SELECTOR_COVER", FUEL_DEVICE_ID, 3001, 705, PILOT_FUEL_PANEL, "Refuel Tank Selector Cover")
F_4E:defineToggleSwitch("PLT_FUEL_REFUEL_SELECTOR", FUEL_DEVICE_ID, 3002, 706, PILOT_FUEL_PANEL, "Select Tank to Refuel")
F_4E:defineToggleSwitch("PLT_FUEL_AIR_REFUEL", FUEL_DEVICE_ID, 3006, 712, PILOT_FUEL_PANEL, "Air Refuel Switch")
F_4E:defineToggleSwitch("PLT_FUEL_WING_FUEL_DUMP", FUEL_DEVICE_ID, 3003, 709, PILOT_FUEL_PANEL, "Wing Fuel Dump Selector")
F_4E:define3PosTumb("PLT_FUEL_EXTERNAL_TANKS_FEED", FUEL_DEVICE_ID, 3005, 711, PILOT_FUEL_PANEL, "External Tanks Feed")
F_4E:definePushButton("PLT_FUEL_BOOST_PUMP_L_CHECK", FUEL_DEVICE_ID, 3021, 725, PILOT_FUEL_PANEL, "Check Left Boost Pump")
F_4E:definePushButton("PLT_FUEL_BOOST_PUMP_R_CHECK", FUEL_DEVICE_ID, 3022, 726, PILOT_FUEL_PANEL, "Check Right Boost Pump")
F_4E:definePushButton("PLT_FUEL_FEED_TANK_CHECK", FUEL_DEVICE_ID, 3013, 2789, PILOT_FUEL_PANEL, "Check Engine-Feed Tank")

-- Attitude Reference
local ATTITUDE_REFERENCE_DEVICE_ID = 62

-- Aircraft Effects
local AIRCRAFT_EFFECTS_DEVICE_ID = 63

-- Target Designator System (AN-ASQ-153)
local TARGET_DESIGNATOR_DEVICE_ID = 64

-- WSO Front Panel
local WSO_FRONT_PANEL_DEVICE_ID = 65

-- RHAW
local RHAW_DEVICE_ID = 67

-- IFF Interrogator (AN-APX-80A)
local IFF_INTERROGATOR_DEVICE_ID = 68

-- wso iff panel
local WSO_IFF_PANEL = "WSO IFF Panel"

local iff_ones = 0
local iff_tens = 0
local iff_hundreds = 0
local iff_thousands = 0
local iff_code = ""

local function wso_iff_argument_display(dev0, arg_number)
	return Module.round(dev0:get_argument_value(arg_number) * 8) % 8
end

-- WSO IFF display
F_4E:addExportHook(function(dev0)
	iff_ones = wso_iff_argument_display(dev0, 2000)
	iff_tens = wso_iff_argument_display(dev0, 2001)
	iff_hundreds = wso_iff_argument_display(dev0, 2002)
	iff_thousands = wso_iff_argument_display(dev0, 2003)
	iff_code = string.format("%d%d%d%d", iff_thousands, iff_hundreds, iff_tens, iff_ones)
end)

--- @param dev0 CockpitDevice
--- @return string
local function get_iff_mode(dev0)
	local val = Module.round(dev0:get_argument_value(2004) * 5)
	if val == 1 then
		return " 1 "
	elseif val == 2 then
		return " 2 "
	elseif val == 3 then
		return " 3 "
	elseif val == 4 then
		return "4/A"
	elseif val == 5 then
		return "4/B"
	end

	return ""
end

F_4E:defineIntegerFromGetter("WSO_IFF_CODE_ONES", function()
	return iff_ones
end, 8, WSO_IFF_PANEL, "IFF Code (ones)")
F_4E:defineIntegerFromGetter("WSO_IFF_CODE_TENS", function()
	return iff_tens
end, 8, WSO_IFF_PANEL, "IFF Code (tens)")
F_4E:defineIntegerFromGetter("WSO_IFF_CODE_HUNDREDS", function()
	return iff_hundreds
end, 8, WSO_IFF_PANEL, "IFF Code (hundreds)")
F_4E:defineIntegerFromGetter("WSO_IFF_CODE_THOUSANDS", function()
	return iff_thousands
end, 8, WSO_IFF_PANEL, "IFF Code (thousands)")
F_4E:defineString("WSO_IFF_CODE", function()
	return iff_code
end, 4, WSO_IFF_PANEL, "IFF Code")
F_4E:defineString("WSO_IFF_MODE", get_iff_mode, 3, WSO_IFF_PANEL, "IFF Mode")

-- todo: string output
F_4E:definePushButton("WSO_IFF_MODE_INC", IFF_INTERROGATOR_DEVICE_ID, 3001, 2637, WSO_IFF_PANEL, "Increase IFF Mode")
F_4E:definePushButton("WSO_IFF_CODE_INC_THOUSANDS", IFF_INTERROGATOR_DEVICE_ID, 3002, 2635, WSO_IFF_PANEL, "Increase IFF Code (thousands)")
F_4E:definePushButton("WSO_IFF_CODE_INC_HUNDREDS", IFF_INTERROGATOR_DEVICE_ID, 3003, 2633, WSO_IFF_PANEL, "Increase IFF Code (hundreds)")
F_4E:definePushButton("WSO_IFF_CODE_INC_TENS", IFF_INTERROGATOR_DEVICE_ID, 3004, 2631, WSO_IFF_PANEL, "Increase IFF Code (tens)")
F_4E:definePushButton("WSO_IFF_CODE_INC_ONES", IFF_INTERROGATOR_DEVICE_ID, 3005, 2629, WSO_IFF_PANEL, "Increase IFF Code (ones)")
F_4E:definePushButton("WSO_IFF_MODE_DEC", IFF_INTERROGATOR_DEVICE_ID, 3006, 2638, WSO_IFF_PANEL, "Decrease IFF Mode")
F_4E:definePushButton("WSO_IFF_MODE_DEC_THOUSANDS", IFF_INTERROGATOR_DEVICE_ID, 3007, 2636, WSO_IFF_PANEL, "Decrease IFF Code (thousands)")
F_4E:definePushButton("WSO_IFF_MODE_DEC_HUNDREDS", IFF_INTERROGATOR_DEVICE_ID, 3008, 2634, WSO_IFF_PANEL, "Decrease IFF Code (hundreds)")
F_4E:definePushButton("WSO_IFF_MODE_DEC_TENS", IFF_INTERROGATOR_DEVICE_ID, 3009, 2632, WSO_IFF_PANEL, "Decrease IFF Code (tens)")
F_4E:definePushButton("WSO_IFF_MODE_DEC_ONES", IFF_INTERROGATOR_DEVICE_ID, 3010, 2630, WSO_IFF_PANEL, "Decrease IFF Code (ones)")

-- todo: output good, input bad (button + potentiometer). commands seem correct, unclear what is wrong
F_4E:definePushButton("WSO_IFF_CHALLENGE_TEST_BUTTON", IFF_DEVICE_ID, 3015, 2646, WSO_IFF_PANEL, "Challenge Light (push to test)")
F_4E:definePotentiometer("WSO_IFF_CHALLENGE_DIM", IFF_DEVICE_ID, 3016, 2811, { 0, 1 }, WSO_IFF_PANEL, "Challenge Light (rotate to dim)")
F_4E:defineIndicatorLight("WSO_IFF_CHALLENGE_LIGHT", 2695, WSO_IFF_PANEL, "IFF Challenge Light (Blue)")

F_4E:defineSpringloaded_3PosTumb("WSO_IFF_TEST_CHALLENGE", IFF_INTERROGATOR_DEVICE_ID, 3013, 3013, 2645, WSO_IFF_PANEL, "Test/Challenge Code Switch")

F_4E:reserveIntValue(1) -- Anti-Jam, not yet implemented

-- todo: output good, input bad (button + potentiometer). commands seem correct, unclear what is wrong
F_4E:definePushButton("WSO_IFF_COMBAT_TREE_CHALLENGE_TEST_BUTTON", IFF_DEVICE_ID, 3018, 2640, WSO_IFF_PANEL, "Combat-Tree Challenge Light (push to test) (not simulated)")
F_4E:definePotentiometer("WSO_IFF_COMBAT_TREE_CHALLENGE_DIM", IFF_DEVICE_ID, 3019, 2812, { 0, 1 }, WSO_IFF_PANEL, "Combat-Tree Challenge Light (rotate to dim) (not simulated)")
F_4E:defineIndicatorLight("WSO_IFF_COMBAT_TREE_CHALLENGE_TEST_LIGHT", 2696, WSO_IFF_PANEL, "Combat-Tree Challenge Light (Blue)")

F_4E:definePushButton("WSO_IFF_COMBAT_TREE_TEST", IFF_INTERROGATOR_DEVICE_ID, 3021, 2641, WSO_IFF_PANEL, "Test Combat-Tree")
F_4E:define3PosTumb("WSO_IFF_COMBAT_TREE_MODE_2", IFF_INTERROGATOR_DEVICE_ID, 3022, 2642, WSO_IFF_PANEL, "Set Combat-Tree Type 2 Mode")
F_4E:define3PosTumb("WSO_IFF_COMBAT_TREE_MODE_3", IFF_INTERROGATOR_DEVICE_ID, 3025, 2643, WSO_IFF_PANEL, "Set Combat-Tree Type 3 Mode")

F_4E:reserveIntValue(2) -- Mode 4 Alarm/Override, not yet implemented

-- Exterior Lights
local EXTERIOR_LIGHTS_DEVICE_ID = 69

-- Pilot Exterior Lights panel
local PILOT_EXTERIOR_LIGHTS_PANEL = "PLT Exterior Lights Panel"

F_4E:define3PosTumb0To1("PLT_EXT_LIGHT_ANTI_COLL", EXTERIOR_LIGHTS_DEVICE_ID, 3004, 1355, PILOT_EXTERIOR_LIGHTS_PANEL, "Set Fuselage & Anti-Collision Light Brightness")
F_4E:define3PosTumb0To1("PLT_EXT_LIGHT_FLASH_MODE", EXTERIOR_LIGHTS_DEVICE_ID, 3005, 1356, PILOT_EXTERIOR_LIGHTS_PANEL, "Set Flasher Mode (only Tail/Anti-Col/Fus)")
F_4E:define3PosTumb0To1("PLT_EXT_LIGHT_TAIL_BRIGHTNESS", EXTERIOR_LIGHTS_DEVICE_ID, 3006, 1357, PILOT_EXTERIOR_LIGHTS_PANEL, "Set Tail-Position Light Brightness")
F_4E:define3PosTumb0To1("PLT_EXT_LIGHT_WING_BRIGHTNESS", EXTERIOR_LIGHTS_DEVICE_ID, 3007, 1358, PILOT_EXTERIOR_LIGHTS_PANEL, "Set Wing-Position & Join-Up Light Brightness")

-- Exterior Lights
local EXTERIOR_LIGHTS = "Exterior Lights"

F_4E:defineFloatFromDrawArgument("EXT_LIGHT_BEACON", 83, EXTERIOR_LIGHTS, "Beacon Light (Red)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_POSITION_WING", 190, EXTERIOR_LIGHTS, "Wing Position Lights (Red/Green)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_POSITION_TAIL", 193, EXTERIOR_LIGHTS, "Tail Position Light (White)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_WING_JOIN_UP", 191, EXTERIOR_LIGHTS, "Wing Join-Up Lights (Red/Green)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_BEACON_FLASH", 192, EXTERIOR_LIGHTS, "Flashing Beacon Light (Red)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_FORMATION", 88, EXTERIOR_LIGHTS, "Formation Lights (Green)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_LANDING", 51, EXTERIOR_LIGHTS, "Landing Light (White)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_TAXI", 208, EXTERIOR_LIGHTS, "Taxi Light (White)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_BELLY", 196, EXTERIOR_LIGHTS, "Belly Lights L/R (White)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_FUSELAGE_TOP", 209, EXTERIOR_LIGHTS, "Fuselage Top Light (White)")
F_4E:defineFloatFromDrawArgument("EXT_LIGHT_AAR", 210, EXTERIOR_LIGHTS, "AAR Receptacle Light (White)")

-- VOR/ILS
local VOR_ILS_DEVICE_ID = 70

-- Ejection Seat
local EJECTION_SEAT_DEVICE_ID = 71

-- Interior Lights
local INTERIOR_LIGHTS_DEVICE_ID = 72

-- Airborne Video Tape Recorder
local RECORDER_DEVICE_ID = 73

-- Pilot Front Panel
local PILOT_FRONT_PANEL_DEVICE_ID = 74

-- WSO Course Indicator
local WSO_COURSE_INDICATOR_DEVICE_ID = 76

-- Jester Wheel
local JESTER_WHEEL_DEVICE_ID = 78

-- Grease Pencil
local GREASE_PENCIL_DEVICE_ID = 82

-- Circuit Breakers
local CIRCUIT_BREAKERS_DEVICE_ID = 84

-- Seat
local SEAT_DEVICE_ID = 85

-- ECM
local ECM_DEVICE_ID = 91

-- Pilot Stick
local PILOT_STICK = "PLT Stick"

F_4E:definePushButton("PLT_AFCS_EMERGENCY_RELEASE", AFCS_DEVICE_ID, 3020, 2782, PILOT_STICK, "Emergency Quick Release")

-- WSO Stick
local WSO_STICK = "WSO Stick"

F_4E:definePushButton("WSO_AFCS_EMERGENCY_RELEASE", AFCS_DEVICE_ID, 3021, 2788, WSO_STICK, "Emergency Quick Release")

-- Pilot Throttle
local PILOT_THROTTLE = "PLT Throttle"

F_4E:defineSpringloaded_3PosTumb("PLT_THROTTLE_MIC", ICS_DEVICE_ID, 3001, 3001, 2609, PILOT_THROTTLE, "Mic Switch")
F_4E:definePushButton("PLT_THROTTLE_CM_DISPENSE", COUNTERMEASURES_DEVICE_ID, 3012, 1436, PILOT_THROTTLE, "Dispense Countermeasures")

-- WSO Throttle
local WSO_THROTTLE = "WSO Throttle"

F_4E:defineSpringloaded_3PosTumb("WSO_THROTTLE_MIC", ICS_DEVICE_ID, 3002, 3002, 2671, WSO_THROTTLE, "Mic Switch")

-- Pilot Left Subpanel
local PILOT_LEFT_SUB_PANEL = "PLT Left Subpanel"

F_4E:define3PosTumb0To1("PLT_EXT_LIGHT_TAXI_LAND", EXTERIOR_LIGHTS_DEVICE_ID, 3001, 1416, PILOT_LEFT_SUB_PANEL, "Taxi/Landing Light")

-- Pilot Right Console
local PILOT_RIGHT_CONSOLE = "PLT Right Console"

F_4E:definePushButton("PLT_COCKPIT_PRESSURE_EMERGENCY_RELEASE", OXYGEN_SYSTEM_DEVICE_ID, 3012, 2879, PILOT_RIGHT_CONSOLE, "Emergency Release Cockpit Pressure")

-- Pilot Right Wall
local PILOT_RIGHT_WALL = "PLT Right Wall"

F_4E:defineSpringloaded_3PosTumbWithRange("PLT_EXT_LIGHT_FORMATION_MODE", EXTERIOR_LIGHTS_DEVICE_ID, 3003, 3003, 1367, { 0, 1 }, PILOT_RIGHT_WALL, "Set Formation Lights Mode")
F_4E:definePotentiometer("PLT_EXT_LIGHT_FORMATION_BRIGHTNESS", EXTERIOR_LIGHTS_DEVICE_ID, 3002, 1368, { 0, 1 }, PILOT_RIGHT_WALL, "Change Formation Lights Brightness")

return F_4E
