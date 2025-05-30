module("F-4E", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_4E: Module
local F_4E = Module:new("F-4E", 0x2A00, { "F-4E-45MC" })

-- helper control definitions

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

--- Adds an n-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param positions integer the number of switch positions
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineMultipositionSwitch0To1(identifier, device_id, command, arg_number, positions, category, description)
	self:defineMultipositionSwitch(identifier, device_id, command, arg_number, positions, 1 / (positions - 1), category, description)
end

--- Adds a 3-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:define3PosTumb0To1(identifier, device_id, command, arg_number, category, description)
	self:defineMultipositionSwitch0To1(identifier, device_id, command, arg_number, 3, category, description)
end

--- Defines a 0-65535 output from a 0-1 input
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:definePositiveFloat(identifier, arg_number, category, description)
	self:defineFloat(identifier, arg_number, { 0, 1 }, category, description)
end

--- Defines a 0-65535 output from a -1 to 1 input
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineFullRangeFloat(identifier, arg_number, category, description)
	self:defineFloat(identifier, arg_number, { -1, 1 }, category, description)
end

--- Defines a 0-max_value output from a 0-1 input
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineIntegerFromArg(identifier, arg_number, max_value, category, description)
	self:defineIntegerFromGetter(identifier, function(dev0)
		return Module.round(dev0:get_argument_value(arg_number) * max_value)
	end, max_value, category, description)
end

--- Adds a 3-position switch with a spring-loaded return
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command to move the switch up or down
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineSpringloaded3PosTumb(identifier, device_id, command, arg_number, category, description)
	self:defineSpringloaded_3PosTumb(identifier, device_id, command, command, arg_number, category, description)
end

--- Adds a dimmable indicator light
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function F_4E:defineDimmableIndicatorLight(identifier, arg_number, category, description)
	self:definePositiveFloat(identifier, arg_number, category, description)
end

-- helper functions

--- Returns an integer value for a drum-based numeric indicator
--- @param dev0 CockpitDevice
--- @param arg_number integer the dcs argument number from which to fetch the data
--- @param invert boolean? whether the input should be inverted - default false
--- @param max_value integer? the exclusive upper bound of the output - default 10
--- @return integer value the integer displayed on the drum
local function drum_value(dev0, arg_number, invert, max_value)
	max_value = max_value or 10
	invert = invert or false
	local val = Module.round(dev0:get_argument_value(arg_number) * max_value)
	if invert then
		val = max_value - val
	end
	return val % max_value
end

--- Returns the string value of a regular drum
--- @param dev0 CockpitDevice
--- @param ... integer the dcs argument numbers for each drum wheel, left to right
--- @return string value
local function drum_set(dev0, ...)
	local drum_arg_numbers = { ... }
	local vals = {}

	for i, arg_number in ipairs(drum_arg_numbers) do
		vals[i] = drum_value(dev0, arg_number)
	end

	return string.format(string.rep("%d", #vals), unpack(vals))
end

-- ICS
local ICS_DEVICE_ID = 2

-- Pilot KY-28
local PILOT_KY_28 = "PLT KY-28"

F_4E:definePushButton("PLT_KY_28_P_MODE_TEST", ICS_DEVICE_ID, 3029, 2791, PILOT_KY_28, "KY-28 P Mode Light (push to test)")
F_4E:definePotentiometer("PLT_KY_28_P_MODE_DIM", ICS_DEVICE_ID, 3030, 2790, { 0, 1 }, PILOT_KY_28, "KY-28 P Mode Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_KY_28_P_MODE", 2554, PILOT_KY_28, "KY-28 P Mode Light")

F_4E:definePushButton("PLT_KY_28_C_MODE_TEST", ICS_DEVICE_ID, 3033, 2793, PILOT_KY_28, "KY-28 C Mode Light (push to test)")
F_4E:definePotentiometer("PLT_KY_28_C_MODE_DIM", ICS_DEVICE_ID, 3034, 2792, { 0, 1 }, PILOT_KY_28, "KY-28 C Mode Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_KY_28_C_MODE", 2555, PILOT_KY_28, "KY-28 C Mode Light")

-- WSO KY-28
local WSO_KY_28 = "WSO KY-28"

F_4E:definePushButton("WSO_KY_28_P_MODE_TEST", ICS_DEVICE_ID, 3037, 2622, WSO_KY_28, "KY-28 P Mode Light (push to test)")
F_4E:definePotentiometer("WSO_KY_28_P_MODE_DIM", ICS_DEVICE_ID, 3038, 2807, { 0, 1 }, WSO_KY_28, "KY-28 P Mode Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_KY_28_P_MODE", 2675, WSO_KY_28, "KY-28 P Mode Light")

F_4E:definePushButton("WSO_KY_28_C_MODE_TEST", ICS_DEVICE_ID, 3041, 2623, WSO_KY_28, "KY-28 C Mode Light (push to test)")
F_4E:definePotentiometer("WSO_KY_28_C_MODE_DIM", ICS_DEVICE_ID, 3042, 2808, { 0, 1 }, WSO_KY_28, "KY-28 C Mode Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_KY_28_C_MODE", 2676, WSO_KY_28, "KY-28 C Mode Light")

F_4E:definePushButton("WSO_KY_28_ERASE", ICS_DEVICE_ID, 3045, 2647, WSO_KY_28, "Erase KY-28 Data")
F_4E:defineToggleSwitch("WSO_KY_28_BAND", ICS_DEVICE_ID, 3047, 2648, WSO_KY_28, "Select KY-28 Mode")
F_4E:define3PosTumb0To1("WSO_KY_28_MODE", ICS_DEVICE_ID, 3050, 2649, WSO_KY_28, "Select KY-28 Power Mode")

-- Pilot ICS
local PILOT_ICS_PANEL = "PLT ICS Panel"

F_4E:definePotentiometer("PLT_ICS_INTERCOM_VOL", ICS_DEVICE_ID, 3003, 76, { 0, 1 }, PILOT_ICS_PANEL, "Change Intercom Volume")
F_4E:define3PosTumb0To1("PLT_ICS_AMPLIFIER", ICS_DEVICE_ID, 3004, 1409, PILOT_ICS_PANEL, "Select Amplifier")
F_4E:defineSpringloaded3PosTumb("PLT_ICS_MODE", ICS_DEVICE_ID, 3005, 1378, PILOT_ICS_PANEL, "Set Mode")

-- WSO ICS
local WSO_ICS_PANEL = "WSO ICS Panel"

F_4E:definePotentiometer("WSO_ICS_INTERCOM_VOL", ICS_DEVICE_ID, 3006, 2666, { 0, 1 }, WSO_ICS_PANEL, "Change Intercom Volume")
F_4E:define3PosTumb0To1("WSO_ICS_AMPLIFIER", ICS_DEVICE_ID, 3007, 2667, WSO_ICS_PANEL, "Select Amplifier")
F_4E:defineSpringloaded3PosTumb("WSO_ICS_MODE", ICS_DEVICE_ID, 3008, 2668, WSO_ICS_PANEL, "Set Mode")

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
F_4E:defineDimmableIndicatorLight("PLT_ARC_164_COMM_COMMAND_LIGHT", 169, PILOT_ARC_164, "Radio Command Lamp (Green)")
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

F_4E:defineString("PLT_ARC_164_CHANNEL_DISPLAY", function(_)
	return Module.parse_indication(9)["freq_foreground"]
end, 2, PILOT_ARC_164, "UHF Channel Display")

local WSO_ARC_164 = "WSO ARC-164"

F_4E:definePushButton("WSO_ARC_164_TOGGLE_COMMAND", ARC_164_DEVICE_ID, 3013, 144, WSO_ARC_164, "Toggle Radio Command")
F_4E:definePotentiometer("WSO_ARC_164_COMMAND_BRIGHTNESS", ARC_164_DEVICE_ID, 3055, 2772, { 0, 1 }, WSO_ARC_164, "Change Radio Command Light Brightness")
F_4E:defineDimmableIndicatorLight("WSO_ARC_164_COMM_COMMAND_LIGHT", 172, WSO_ARC_164, "Radio Command Lamp (Green)")
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

F_4E:defineString("WSO_ARC_164_CHANNEL_DISPLAY", function(_)
	return Module.parse_indication(10)["freq_foreground"]
end, 2, WSO_ARC_164, "UHF Channel Display")

-- IFF
local IFF_DEVICE_ID = 4

-- pilot iff panel
local PILOT_IFF_PANEL = "PLT IFF Panel"

F_4E:defineMultipositionSwitch0To1("PLT_IFF_CODE", IFF_DEVICE_ID, 3001, 1322, 4, PILOT_IFF_PANEL, "Select Mode 4 Function")
F_4E:definePushButton("PLT_IFF_REPLY_TEST_BUTTON", IFF_DEVICE_ID, 3064, 2843, PILOT_IFF_PANEL, "IFF Reply Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_REPLY_TEST_DIM", IFF_DEVICE_ID, 3065, 2842, { 0, 1 }, PILOT_IFF_PANEL, "IFF Reply Lamp (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_IFF_REPLY_TEST_LIGHT", 2557, PILOT_IFF_PANEL, "IFF Reply Test Light (Blue)")
F_4E:definePushButton("PLT_IFF_TEST_BUTTON", IFF_DEVICE_ID, 3066, 2845, PILOT_IFF_PANEL, "IFF Test Lamp (push to test)")
F_4E:definePotentiometer("PLT_IFF_TEST_DIM", IFF_DEVICE_ID, 3067, 2844, { 0, 1 }, PILOT_IFF_PANEL, "IFF Test Lamp (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_IFF_TEST_LIGHT", 2556, PILOT_IFF_PANEL, "IFF Test Light (Blue)")
F_4E:defineMultipositionSwitch0To1("PLT_IFF_MASTER", IFF_DEVICE_ID, 3005, 1521, 5, PILOT_IFF_PANEL, "Select Master Mode")
F_4E:define3PosTumb("PLT_IFF_AUDIO_LIGHT_SW", IFF_DEVICE_ID, 3009, 1328, PILOT_IFF_PANEL, "Select Mode 4 Indication")
F_4E:defineSpringloaded3PosTumb("PLT_IFF_M1", IFF_DEVICE_ID, 3013, 1323, PILOT_IFF_PANEL, "Mode 1")
F_4E:defineSpringloaded3PosTumb("PLT_IFF_M2", IFF_DEVICE_ID, 3017, 1324, PILOT_IFF_PANEL, "Mode 2")
F_4E:defineSpringloaded3PosTumb("PLT_IFF_M3", IFF_DEVICE_ID, 3021, 1325, PILOT_IFF_PANEL, "Mode 3A")
F_4E:defineSpringloaded3PosTumb("PLT_IFF_MC", IFF_DEVICE_ID, 3025, 1326, PILOT_IFF_PANEL, "Mode C")
F_4E:defineSpringloaded3PosTumb("PLT_IFF_RAD", IFF_DEVICE_ID, 3029, 1329, PILOT_IFF_PANEL, "Monitor Radiation")
F_4E:defineToggleSwitch("PLT_IFF_M4", IFF_DEVICE_ID, 3033, 1327, PILOT_IFF_PANEL, "Mode 4")
F_4E:defineMultipositionSwitchWithCycle("PLT_IFF_M1_CODE_TENS", IFF_DEVICE_ID, 3036, 1331, 8, 1 / 8, true, PILOT_IFF_PANEL, "M1 Code (tens)")
F_4E:defineMultipositionSwitchWithCycle("PLT_IFF_M1_CODE_ONES", IFF_DEVICE_ID, 3040, 1332, 4, 1 / 8, true, PILOT_IFF_PANEL, "M1 Code (ones)")
F_4E:defineMultipositionSwitchWithCycle("PLT_IFF_M3_CODE_THOUSANDS", IFF_DEVICE_ID, 3044, 1333, 8, 1 / 8, true, PILOT_IFF_PANEL, "M3 Code (thousands)")
F_4E:defineMultipositionSwitchWithCycle("PLT_IFF_M3_CODE_HUNDREDS", IFF_DEVICE_ID, 3048, 1334, 8, 1 / 8, true, PILOT_IFF_PANEL, "M3 Code (hundreds)")
F_4E:defineMultipositionSwitchWithCycle("PLT_IFF_M3_CODE_TENS", IFF_DEVICE_ID, 3052, 1335, 8, 1 / 8, true, PILOT_IFF_PANEL, "M3 Code (tens)")
F_4E:defineMultipositionSwitchWithCycle("PLT_IFF_M3_CODE_ONES", IFF_DEVICE_ID, 3056, 1336, 8, 1 / 8, true, PILOT_IFF_PANEL, "M3 Code (ones)")

local function plt_iff_argument_display(dev0, arg_number, max_value)
	return Module.round(dev0:get_argument_value(arg_number) * max_value)
end

F_4E:defineString("PLT_IFF_M1_CODE", function(dev0)
	return string.format("%d%d", plt_iff_argument_display(dev0, 1331, 7), plt_iff_argument_display(dev0, 1332, 3))
end, 2, PILOT_IFF_PANEL, "M1 Code")

F_4E:defineString("PLT_IFF_M3_CODE", function(dev0)
	return string.format("%d%d%d%d", plt_iff_argument_display(dev0, 1333, 7), plt_iff_argument_display(dev0, 1334, 7), plt_iff_argument_display(dev0, 1335, 7), plt_iff_argument_display(dev0, 1336, 7))
end, 4, PILOT_IFF_PANEL, "M3 Code")

F_4E:defineSpringloaded3PosTumb("PLT_IFF_IDENT", IFF_DEVICE_ID, 3060, 1330, PILOT_IFF_PANEL, "Set Position Identification")

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
F_4E:defineDimmableIndicatorLight("PLT_CM_ON_LIGHT", 1414, PILOT_COUNTERMEASURES_PANEL, "ALE-40 On Lamp (Green)")
F_4E:definePushButton("PLT_CM_FLARE_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3004, 1439, PILOT_COUNTERMEASURES_PANEL, "Flare Indicator (push to test)")
F_4E:definePotentiometer("PLT_CM_FLARE_DIM", COUNTERMEASURES_DEVICE_ID, 3005, 1440, { 0, 1 }, PILOT_COUNTERMEASURES_PANEL, "Flare Indicator (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_CM_FLARE_LIGHT", 1415, PILOT_COUNTERMEASURES_PANEL, "ALE-40 Flares Lamp (Red)")
F_4E:defineToggleSwitch("PLT_CM_FLARE_NORMAL", COUNTERMEASURES_DEVICE_ID, 3001, 1417, PILOT_COUNTERMEASURES_PANEL, "Select Dispense Program")

-- wso countermeasures panel
local WSO_COUNTERMEASURES_PANEL = "WSO Countermeasures Panel"

F_4E:definePushButton("WSO_CM_DISPENSE", COUNTERMEASURES_DEVICE_ID, 3013, 1447, WSO_COUNTERMEASURES_PANEL, "Dispense Countermeasures")
F_4E:defineToggleSwitch("WSO_CM_RIPPLE_COVER", COUNTERMEASURES_DEVICE_ID, 3010, 1446, WSO_COUNTERMEASURES_PANEL, "Ripple Switch Cover")
F_4E:defineToggleSwitch("WSO_CM_RIPPLE", COUNTERMEASURES_DEVICE_ID, 3011, 1445, WSO_COUNTERMEASURES_PANEL, "Toggle Ripple Release")
F_4E:definePushButton("WSO_CM_CHAFF_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3006, 1450, WSO_COUNTERMEASURES_PANEL, "Chaff Indicator (push to test)")
F_4E:definePotentiometer("WSO_CM_CHAFF_DIM", COUNTERMEASURES_DEVICE_ID, 3007, 1448, { 0, 1 }, WSO_COUNTERMEASURES_PANEL, "Chaff Indicator (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_CM_CHAFF_LIGHT", 1441, WSO_COUNTERMEASURES_PANEL, "Chaff Lamp (Green)")
F_4E:defineMultipositionRollerLimited("WSO_CM_CHAFF_MODE", COUNTERMEASURES_DEVICE_ID, 3020, 1444, 4, WSO_COUNTERMEASURES_PANEL, "Select Chaff Mode")
F_4E:definePushButton("WSO_CM_FLARE_TEST_BUTTON", COUNTERMEASURES_DEVICE_ID, 3008, 1451, WSO_COUNTERMEASURES_PANEL, "Flare Indicator (push to test)")
F_4E:definePotentiometer("WSO_CM_FLARE_DIM", COUNTERMEASURES_DEVICE_ID, 3009, 1449, { 0, 1 }, WSO_COUNTERMEASURES_PANEL, "Flare Indicator (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_CM_FLARE_LIGHT", 1442, WSO_COUNTERMEASURES_PANEL, "Flare Lamp (Red)")
F_4E:defineMultipositionRollerLimited("WSO_CM_FLARE_MODE", COUNTERMEASURES_DEVICE_ID, 3021, 1443, 3, WSO_COUNTERMEASURES_PANEL, "Select Flare Mode")

local wso_cm_chaff_hundreds = 0
local wso_cm_chaff_tens = 0
local wso_cm_chaff_ones = 0
local wso_cm_chaff = ""

F_4E:addExportHook(function(dev0)
	wso_cm_chaff_hundreds = Module.round(drum_value(dev0, 1390))
	wso_cm_chaff_tens = Module.round(drum_value(dev0, 1391))
	wso_cm_chaff_ones = Module.round(drum_value(dev0, 1392))
	wso_cm_chaff = string.format("%d%d%d", wso_cm_chaff_hundreds, wso_cm_chaff_tens, wso_cm_chaff_ones)
end)

local wso_cm_flare_hundreds = 0
local wso_cm_flare_tens = 0
local wso_cm_flare_ones = 0
local wso_cm_flare = ""

F_4E:addExportHook(function(dev0)
	wso_cm_flare_hundreds = Module.round(drum_value(dev0, 1393))
	wso_cm_flare_tens = Module.round(drum_value(dev0, 1394))
	wso_cm_flare_ones = Module.round(drum_value(dev0, 1395))
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

F_4E:definePositiveFloat("PLT_CLOCK_HOUR_HAND", 800, PILOT_CLOCK, "Clock Hour Hand")
F_4E:definePositiveFloat("PLT_CLOCK_MINUTE_HAND", 801, PILOT_CLOCK, "Clock Minute Hand")
F_4E:definePositiveFloat("PLT_CLOCK_STOPWATCH_MINUTE_HAND", 803, PILOT_CLOCK, "Stopwatch Minute Hand")
F_4E:definePositiveFloat("PLT_CLOCK_STOPWATCH_SECOND_HAND", 802, PILOT_CLOCK, "Stopwatch Second Hand")

-- WSO Clock
local WSO_CLOCK = "WSO Clock"

F_4E:definePushButton("WSO_CLOCK_STOPWATCH", CLOCK_DEVICE_ID, 3006, 810, WSO_CLOCK, "Start/Stop/Reset Stopwatch")
F_4E:definePushButton("WSO_CLOCK_SET_TIME_PULL", CLOCK_DEVICE_ID, 3004, 813, WSO_CLOCK, "Set Time (pull)")
F_4E:defineRotary("WSO_CLOCK_SET_TIME_ROTATE", CLOCK_DEVICE_ID, 3005, 811, WSO_CLOCK, "Set Time (rotate)")

F_4E:definePositiveFloat("WSO_CLOCK_HOUR_HAND", 804, WSO_CLOCK, "Clock Hour Hand")
F_4E:definePositiveFloat("WSO_CLOCK_MINUTE_HAND", 805, WSO_CLOCK, "Clock Minute Hand")
F_4E:definePositiveFloat("WSO_CLOCK_STOPWATCH_MINUTE_HAND", 807, WSO_CLOCK, "Stopwatch Minute Hand")
F_4E:definePositiveFloat("WSO_CLOCK_STOPWATCH_SECOND_HAND", 806, WSO_CLOCK, "Stopwatch Second Hand")

-- Radar Altimeter
local RADAR_ALTIMETER_DEVICE_ID = 12

-- Pilot Radar Altimeter
local PILOT_RADAR_ALTIMETER = "PLT Radar Altimeter"

F_4E:definePushButton("PLT_RADAR_ALT_PUSH_TEST", RADAR_ALTIMETER_DEVICE_ID, 3001, 84, PILOT_RADAR_ALTIMETER, "Move Bug (push to test)")
F_4E:definePotentiometer("PLT_RADAR_ALT_MOVE_BUG", RADAR_ALTIMETER_DEVICE_ID, 3002, 83, { -0.2, 1 }, PILOT_RADAR_ALTIMETER, "Move Bug (rotate to 0 to turn off)")
F_4E:defineIndicatorLight("PLT_RADAR_ALT_WARN_LIGHT", 85, PILOT_RADAR_ALTIMETER, "Radar Altimeter Low Altitude Lamp (Red)")
F_4E:defineFullRangeFloat("PLT_RADAR_ALT_NEEDLE", 73, PILOT_RADAR_ALTIMETER, "Radar Altimeter Needle")
F_4E:definePositiveFloat("PLT_RADAR_ALT_BUG", 74, PILOT_RADAR_ALTIMETER, "Radar Altimeter Altitude Bug")
F_4E:definePositiveFloat("PLT_RADAR_ALT_OFF_FLAG", 75, PILOT_RADAR_ALTIMETER, "Radar Altimeter Off Flag")

-- AOA System
local AOA_DEVICE_ID = 13

-- Pilot AoA Indicator
local PILOT_AOA_INDICATOR = "PLT AoA Indicator"

F_4E:definePotentiometer("PLT_AOA_AURAL_TONE", AOA_DEVICE_ID, 3001, 635, { 0, 1 }, PILOT_AOA_INDICATOR, "Aural Tone Volume")
F_4E:definePotentiometer("PLT_AOA_STALL_VOLUME", AOA_DEVICE_ID, 3005, 1372, { 0, 1 }, PILOT_AOA_INDICATOR, "AoA Stall Warning Volume")

F_4E:definePositiveFloat("PLT_AOA_GAUGE_NEEDLE", 70, PILOT_AOA_INDICATOR, "AoA Gauge Needle")
F_4E:definePositiveFloat("PLT_AOA_GAUGE_OFF_FLAG", 71, PILOT_AOA_INDICATOR, "AoA Gauge Off Flag")

F_4E:definePositiveFloat("PLT_AOA_INDEXER_BRIGHTNESS", 2874, PILOT_AOA_INDICATOR, "AoA Indexer Brightness")
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

F_4E:definePositiveFloat("WSO_AOA_INDEXER_BRIGHTNESS", 2875, WSO_AOA_INDICATOR, "AoA Indexer Brightness")
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
F_4E:definePushButton("WSO_INS_ALIGN_TEST", INS_DEVICE_ID, 3017, 2505, WSO_INS_PANEL, "INS Align Lamp (push to test)")
F_4E:definePotentiometer("WSO_INS_ALIGN_DIM", INS_DEVICE_ID, 3007, 2818, { 0, 1 }, WSO_INS_PANEL, "INS Align Lamp (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_INS_ALIGN", 999, WSO_INS_PANEL, "WSO INS Align Lamp (Green)")
F_4E:definePotentiometer("WSO_INS_HEAT_DIM", INS_DEVICE_ID, 3008, 2819, { 0, 1 }, WSO_INS_PANEL, "INS Heat Lamp (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_INS_HEAT", 1000, WSO_INS_PANEL, "WSO INS Heat Lamp (Red)")

-- Navigation (AN-ASN-46A)
local NAVIGATION_DEVICE_ID = 16

local WSO_NAVIGATION_PANEL = "WSO Navigation Panel"

F_4E:defineSpringloaded_3PosTumbWithRange("WSO_NAV_POSITION_UPDATE_MODE", NAVIGATION_DEVICE_ID, 3002, 3002, 940, { 0, 1 }, WSO_NAVIGATION_PANEL, "Set Position Update Mode")
F_4E:definePushButton("WSO_NAV_MAG_VAR_PUSH", NAVIGATION_DEVICE_ID, 3012, 946, WSO_NAVIGATION_PANEL, "Set Magnetic Variation (push to enable turning)")
F_4E:defineRotary("WSO_NAV_MAG_VAR_TURN", NAVIGATION_DEVICE_ID, 3007, 909, WSO_NAVIGATION_PANEL, "Set Magnetic Variation (must be pushed)")
F_4E:definePotentiometer("WSO_NAV_WIND_DIRECTION", NAVIGATION_DEVICE_ID, 3005, 905, { 0, 1 }, WSO_NAVIGATION_PANEL, "Set Wind Direction (degrees)")
F_4E:definePotentiometer("WSO_NAV_WIND_STRENGTH", NAVIGATION_DEVICE_ID, 3006, 901, { 0, 1 }, WSO_NAVIGATION_PANEL, "Set Wind Strength (knots)")
F_4E:defineMultipositionRollerLimited("WSO_NAV_MODE", NAVIGATION_DEVICE_ID, 3001, 900, 5, WSO_NAVIGATION_PANEL, "Select Navigation Computer Mode")
F_4E:definePushButton("WSO_NAV_LATITUDE_PUSH", NAVIGATION_DEVICE_ID, 3010, 947, WSO_NAVIGATION_PANEL, "Set Position (N/S Lat) (push to enable turning)")
F_4E:defineRotary("WSO_NAV_LATITUE_TURN", NAVIGATION_DEVICE_ID, 3003, 914, WSO_NAVIGATION_PANEL, "Set Position (N/S Lat) (must be pushed)")
F_4E:definePushButton("WSO_NAV_LONGITUDE_PUSH", NAVIGATION_DEVICE_ID, 3011, 948, WSO_NAVIGATION_PANEL, "Set Position (E/W Long) (push to enable turning)")
F_4E:defineRotary("WSO_NAV_LONGITUDE_TURN", NAVIGATION_DEVICE_ID, 3004, 920, WSO_NAVIGATION_PANEL, "Set Position (E/W Long) (must be pushed)")
F_4E:defineRotary("WSO_NAV_TARGET_LATITUDE", NAVIGATION_DEVICE_ID, 3008, 927, WSO_NAVIGATION_PANEL, "Set Target Position (N/S Lat)")
F_4E:defineRotary("WSO_NAV_TARGET_LONGITUDE", NAVIGATION_DEVICE_ID, 3009, 933, WSO_NAVIGATION_PANEL, "Set Target Position (E/W Long)")

F_4E:defineIndicatorLight("WSO_NAV_TEST_CAP_OFF", 942, WSO_NAVIGATION_PANEL, "Test Cap Off Lamp")
F_4E:defineIndicatorLight("WSO_NAV_LATITUDE_SYNC", 943, WSO_NAVIGATION_PANEL, "Latitude Sync Lamp (Blue)")
F_4E:defineIndicatorLight("WSO_NAV_LONGITUDE_SYNC", 944, WSO_NAVIGATION_PANEL, "Longitude Sync Lamp (Blue)")
F_4E:defineIndicatorLight("WSO_NAV_AIR_DATA_MODE", 945, WSO_NAVIGATION_PANEL, "Air Data Mode Lamp (Yellow)")

F_4E:defineFullRangeFloat("WSO_NAV_VAR_SYNC_METER", 941, WSO_NAVIGATION_PANEL, "Position/Navigation Sync Meter")

F_4E:defineString("WSO_NAV_MAG_VAR_VALUE", function(dev0)
	local west = dev0:get_argument_value(910) > 0.5

	local ones = drum_value(dev0, 911, west)
	local tens = drum_value(dev0, 912, west)
	local hundreds = drum_value(dev0, 913, west)

	if west then
		return string.format("%d%d%dWEST", hundreds, tens, ones)
	end

	return string.format("EAST%d%d%d", hundreds, tens, ones)
end, 7, WSO_NAVIGATION_PANEL, "Magnetic Variation")

-- wind

F_4E:defineString("WSO_NAV_WIND_DIRECTION_VALUE", function(dev0)
	return drum_set(dev0, 908, 907, 906)
end, 3, WSO_NAVIGATION_PANEL, "Wind Direction")

F_4E:defineString("WSO_NAV_WIND_STRENGTH_VALUE", function(dev0)
	return drum_set(dev0, 904, 903, 902)
end, 3, WSO_NAVIGATION_PANEL, "Wind Strength")

-- lat/longs

local function latitude_value(dev0, flag_arg, minutes_tens_arg, minutes_ones_arg, seconds_tens_arg, seconds_ones_arg)
	local south = dev0:get_argument_value(flag_arg) > 0.5

	local minutes_tens = drum_value(dev0, minutes_tens_arg, south)
	local minutes_ones = drum_value(dev0, minutes_ones_arg, south)
	local seconds_tens = drum_value(dev0, seconds_tens_arg, south, 6)
	local seconds_ones = drum_value(dev0, seconds_ones_arg, south)

	if south then
		return string.format("%d%d%d%d SOUTH", minutes_tens, minutes_ones, seconds_tens, seconds_ones)
	end

	return string.format("NORTH %d%d%d%d", minutes_tens, minutes_ones, seconds_tens, seconds_ones)
end

local function longitude_value(dev0, flag_arg, minutes_hundreds_arg, minutes_tens_arg, minutes_ones_arg, seconds_tens_arg, seconds_ones_arg)
	local west = dev0:get_argument_value(flag_arg) > 0.5

	local minutes_hundreds_val = drum_value(dev0, minutes_hundreds_arg, west)
	local minutes_hundreds = minutes_hundreds_val == 0 and " " or tostring(minutes_hundreds_val)
	local minutes_tens_val = drum_value(dev0, minutes_tens_arg, west)
	local minutes_tens = minutes_tens_val == 0 and " " or tostring(minutes_tens_val)
	local minutes_ones = drum_value(dev0, minutes_ones_arg, west)
	local seconds_tens = drum_value(dev0, seconds_tens_arg, west, 6)
	local seconds_ones = drum_value(dev0, seconds_ones_arg, west)

	return string.format("%s%s%d%d%d%s", minutes_hundreds, minutes_tens, minutes_ones, seconds_tens, seconds_ones, west and "W" or "E")
end

F_4E:defineString("WSO_NAV_LATITUDE_VALUE", function(dev0)
	return latitude_value(dev0, 919, 918, 917, 916, 915)
end, 10, WSO_NAVIGATION_PANEL, "Position Latitude")

F_4E:defineString("WSO_NAV_LONGITUDE_VALUE", function(dev0)
	return longitude_value(dev0, 921, 926, 925, 924, 923, 922)
end, 6, WSO_NAVIGATION_PANEL, "Position Longitude")

F_4E:defineString("WSO_NAV_TARGET_LATITUDE_VALUE", function(dev0)
	return latitude_value(dev0, 932, 931, 930, 929, 928)
end, 10, WSO_NAVIGATION_PANEL, "Target Position Latitude")

F_4E:defineString("WSO_NAV_TARGET_LONGITUDE_VALUE", function(dev0)
	return longitude_value(dev0, 934, 939, 938, 937, 936, 935)
end, 6, WSO_NAVIGATION_PANEL, "Target Position Longitude")

-- Pneumatic Gauge
-- local PNEUMATIC_GAUGE_DEVICE_ID = 17

-- Pilot Pneumatic Gauge
local PILOT_PNEUMATIC_GAUGE = "PLT Pneumatic Gauge"

F_4E:definePositiveFloat("PLT_PNEUMATIC_GAUGE", 86, PILOT_PNEUMATIC_GAUGE, "Pneumatic Pressure Gauge")

-- Hydraulic Gauge
-- local HYDRAULIC_GAUGE_DEVICE_ID = 18

-- Pilot Hydraulic Gauges
local PILOT_HYDRAULIC_GAUGES = "PLT Hydraulic Gauges"

F_4E:definePositiveFloat("PLT_HYDRAULIC_PC1", 212, PILOT_HYDRAULIC_GAUGES, "PC1 Hydraulic Pressure Gauge")
F_4E:definePositiveFloat("PLT_HYDRAULIC_PC2", 210, PILOT_HYDRAULIC_GAUGES, "PC2 Hydraulic Pressure Gauge")
F_4E:definePositiveFloat("PLT_HYDRAULIC_UTILITY", 211, PILOT_HYDRAULIC_GAUGES, "Utility Hydraulic Pressure Gauge")

-- Landing Gear
local LANDING_GEAR_DEVICE_ID = 20

-- Pilot Landing Gear Controls
local PILOT_LANDING_GEAR = "PLT Landing Gear Controls"

F_4E:defineToggleSwitch("PLT_GEAR_LEVER", LANDING_GEAR_DEVICE_ID, 3001, 5, PILOT_LANDING_GEAR, "Landing Gear Lever")
F_4E:defineToggleSwitch("PLT_GEAR_LEVER_EMERGENCY", LANDING_GEAR_DEVICE_ID, 3013, 3045, PILOT_LANDING_GEAR, "Landing Gear Lever (Pull Out for Emergency)")
F_4E:defineIndicatorLight("PLT_GEAR_LEVER_LIGHT", 66, PILOT_LANDING_GEAR, "Landing Gear Lever Light (Red)")
F_4E:defineIndicatorLight("PLT_GEAR_WHEELS_LIGHT", 65, PILOT_LANDING_GEAR, "WHEELS Lamp (Red)")
F_4E:defineToggleSwitch("PLT_GEAR_ANTI_SKID", LANDING_GEAR_DEVICE_ID, 3002, 63, PILOT_LANDING_GEAR, "Anti-Skid Toggle")
F_4E:defineIndicatorLight("PLT_GEAR_ANTI_SKID_INOP", 64, PILOT_LANDING_GEAR, "Anti-Skid Inoperative Lamp (Yellow)")
F_4E:definePotentiometer("PLT_GEAR_BRAKES_EMERGENCY", LANDING_GEAR_DEVICE_ID, 3004, 343, { 0, 1 }, PILOT_LANDING_GEAR, "Emergency Wheel Brake (Pull)")
F_4E:defineToggleSwitch("PLT_GEAR_DRAG_CHUTE", LANDING_GEAR_DEVICE_ID, 3009, 2767, PILOT_LANDING_GEAR, "Drag-Parachute (Pull to Deploy)")
F_4E:defineToggleSwitch("PLT_GEAR_DRAG_CHUTE_RELEASE", LANDING_GEAR_DEVICE_ID, 3010, 1516, PILOT_LANDING_GEAR, "Release Drag-Parachute (only while deployed)")
F_4E:defineToggleSwitch("PLT_GEAR_ARRESTING_HOOK", LANDING_GEAR_DEVICE_ID, 3021, 974, PILOT_LANDING_GEAR, "Arresting Hook Handle")

F_4E:defineIntegerFromArg("PLT_GEAR_INDICATOR_LEFT", 52, 2, PILOT_LANDING_GEAR, "Landing Gear Up/Down Indicator (Left)")
F_4E:defineIntegerFromArg("PLT_GEAR_INDICATOR_NOSE", 51, 2, PILOT_LANDING_GEAR, "Landing Gear Up/Down Indicator (Nose)")
F_4E:defineIntegerFromArg("PLT_GEAR_INDICATOR_RIGHT", 50, 2, PILOT_LANDING_GEAR, "Landing Gear Up/Down Indicator (Right)")

-- WSO Landing Gear Controls
local WSO_LANDING_GEAR = "WSO Landing Gear Controls"

F_4E:definePotentiometer("WSO_GEAR_HANDLE_EMERGENCY", LANDING_GEAR_DEVICE_ID, 3008, 983, { 0, 1 }, WSO_LANDING_GEAR, "Emergency Gear Handle (Pull to Release)")
F_4E:definePotentiometer("WSO_GEAR_BRAKES_EMERGENCY", LANDING_GEAR_DEVICE_ID, 3005, 344, { 0, 1 }, WSO_LANDING_GEAR, "Emergency Wheel Brake (Pull)")

F_4E:defineIntegerFromArg("WSO_GEAR_INDICATOR_LEFT", 984, 2, WSO_LANDING_GEAR, "Landing Gear Up/Down Indicator (Left)")
F_4E:defineIntegerFromArg("WSO_GEAR_INDICATOR_NOSE", 986, 2, WSO_LANDING_GEAR, "Landing Gear Up/Down Indicator (Nose)")
F_4E:defineIntegerFromArg("WSO_GEAR_INDICATOR_RIGHT", 988, 2, WSO_LANDING_GEAR, "Landing Gear Up/Down Indicator (Right)")

-- Indicators
local INDICATORS_DEVICE_ID = 22

-- Pilot Warning Indicators
local PILOT_WARNING_INDICATORS = "PLT Warning Indicators"

F_4E:defineSpringloaded3PosTumb("PLT_WCA_WARN_LIGHT_TEST", INDICATORS_DEVICE_ID, 3002, 1354, PILOT_WARNING_INDICATORS, "Test Warning Lights/Standby Compass Light")
F_4E:definePushButton("PLT_WCA_MASTER_CAUTION_RESET", INDICATORS_DEVICE_ID, 3001, 221, PILOT_WARNING_INDICATORS, "Reset Master Caution")

F_4E:defineIndicatorLight("PLT_WCA_MASTER_CAUTION", 218, PILOT_WARNING_INDICATORS, "Master Caution Lamp (Yellow)")

F_4E:defineIndicatorLight("PLT_WCA_FIRE_L", 2547, PILOT_WARNING_INDICATORS, "Engine Fire Left Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_FIRE_R", 2548, PILOT_WARNING_INDICATORS, "Engine Fire Right Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_OVERHEAT_L", 2549, PILOT_WARNING_INDICATORS, "Engine Overheat Left Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_OVERHEAT_R", 2550, PILOT_WARNING_INDICATORS, "Engine Overheat Right Lamp (Red)")

F_4E:defineIndicatorLight("PLT_WCA_BUS_TIE_OPEN", 199, PILOT_WARNING_INDICATORS, "Bus Tie Open Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_GEN_OUT_L", 2551, PILOT_WARNING_INDICATORS, "Left Generator Out Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_GEN_OUT_R", 2552, PILOT_WARNING_INDICATORS, "Right Generator Out Lamp (Red)")

F_4E:defineIndicatorLight("PLT_WCA_ALT_ENCODER_OUT", 115, PILOT_WARNING_INDICATORS, "Alt Encoder Out Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_IFF", 2568, PILOT_WARNING_INDICATORS, "IFF Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_DC_BUS", 2577, PILOT_WARNING_INDICATORS, "DC Bus Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_CANOPY_UNLOCKED", 208, PILOT_WARNING_INDICATORS, "Canopy Unlocked Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_HOOK_DOWN", 2578, PILOT_WARNING_INDICATORS, "Hook Down Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_AUTOPILOT_PITCH_DISENGAGE", 2569, PILOT_WARNING_INDICATORS, "Autopilot Pitch Trim Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_AUTOPILOT_DISENGAGE", 2579, PILOT_WARNING_INDICATORS, "Autopilot Disengage Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_EXT_FUEL_L", 2570, PILOT_WARNING_INDICATORS, "Left Ext Fuel Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WCA_EXT_FUEL_C", 2580, PILOT_WARNING_INDICATORS, "Center Ext Fuel Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WCA_EXT_FUEL_R", 2587, PILOT_WARNING_INDICATORS, "Right Ext Fuel Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WCA_FUEL_LOW", 2571, PILOT_WARNING_INDICATORS, "Fuel Level Low Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WCA_FUEL_FILTER_CHECK", 2581, PILOT_WARNING_INDICATORS, "Check Fuel Filters Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_RADAR_ON_COOL_OFF", 2588, PILOT_WARNING_INDICATORS, "Radar On Cool Off Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_FIRE_SYS", 2591, PILOT_WARNING_INDICATORS, "Fire Sys Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_ANTI_ICE_L", 2572, PILOT_WARNING_INDICATORS, "L Anti-Ice On Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_ANTI_ICE_R", 2582, PILOT_WARNING_INDICATORS, "R Anti-Ice On Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_STATIC_CORR", 114, PILOT_WARNING_INDICATORS, "Static Corr Off Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_AUX_AIR_L", 2573, PILOT_WARNING_INDICATORS, "L Aux Air Door Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_AUX_AIR_R", 2583, PILOT_WARNING_INDICATORS, "R Aux Air Door Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_SPEEDBRAKE_OUT", 2589, PILOT_WARNING_INDICATORS, "Speedbrake Out Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_WINDSHIELD_TEMP", 2574, PILOT_WARNING_INDICATORS, "Windshield Temp High Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_DUCT_TEMP", 2584, PILOT_WARNING_INDICATORS, "Duct Temp High Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_HYD_GAUGES", 220, PILOT_WARNING_INDICATORS, "Check Hyd Gauges Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_SLATS_IN", 2575, PILOT_WARNING_INDICATORS, "Slats In Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_PITCH_AUG_OFF", 2585, PILOT_WARNING_INDICATORS, "Pitch Aug Off Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_CABIN_TURB_OVERSPEED", 2590, PILOT_WARNING_INDICATORS, "Cabin Turb Overspeed Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_INS_OUT", 2576, PILOT_WARNING_INDICATORS, "Inertial Nav Sys Out Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WCA_TANK_7_FULL", 2586, PILOT_WARNING_INDICATORS, "Tank 7 Full Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WCA_OXYGEN_LOW", 238, PILOT_WARNING_INDICATORS, "Oxygen Low Lamp (Yellow)")

F_4E:defineIndicatorLight("PLT_WCA_SPARE", 2883, PILOT_WARNING_INDICATORS, "Spare Warning Lamps (Yellow)")

-- WSO Warning Indicators
local WSO_WARNING_INDICATORS = "WSO Warning Indicators"

F_4E:definePushButton("WSO_WCA_WARN_LIGHT_TEST", INDICATORS_DEVICE_ID, 3004, 2513, WSO_WARNING_INDICATORS, "Test Warning Lights")

F_4E:defineIndicatorLight("WSO_WCA_MASTER_CAUTION", 219, WSO_WARNING_INDICATORS, "Master Caution Lamp (Yellow)")

F_4E:defineIndicatorLight("WSO_WCA_CANOPY_UNLOCKED", 209, WSO_WARNING_INDICATORS, "Canopy Unlocked Lamp (Red)")
F_4E:defineIndicatorLight("WSO_WCA_INS_OUT", 2688, WSO_WARNING_INDICATORS, "Inertial Nav Sys Out Lamp (Yellow)")
F_4E:defineIndicatorLight("WSO_WCA_RADAR_CNI_COOL_OFF", 2689, WSO_WARNING_INDICATORS, "Radar CNI Cool Off Lamp (Yellow)")

-- Canopy
local CANOPY_DEVICE_ID = 23

-- Pilot Canopy
local PILOT_CANOPY = "PLT Canopy"

F_4E:defineToggleSwitch("PLT_CANOPY_CONTROL", CANOPY_DEVICE_ID, 3001, 200, PILOT_CANOPY, "Canopy Control (Open/Close)")
F_4E:defineToggleSwitch("PLT_CANOPY_MANUAL_UNLOCK", CANOPY_DEVICE_ID, 3002, 204, PILOT_CANOPY, "Manual Canopy Unlock")
F_4E:defineToggleSwitch("PLT_CANOPY_EMERGENCY_RELEASE", CANOPY_DEVICE_ID, 3003, 202, PILOT_CANOPY, "Canopy Emergency Release")
F_4E:definePositiveFloat("PLT_CANOPY", 87, PILOT_CANOPY, "Canopy Opened/Closed")

-- WSO Canopy
local WSO_CANOPY = "WSO Canopy"

F_4E:defineToggleSwitch("WSO_CANOPY_CONTROL", CANOPY_DEVICE_ID, 3004, 201, WSO_CANOPY, "Canopy Control (Open/Close)")
F_4E:defineToggleSwitch("WSO_CANOPY_MANUAL_UNLOCK", CANOPY_DEVICE_ID, 3005, 205, WSO_CANOPY, "Manual Canopy Unlock")
F_4E:defineToggleSwitch("WSO_CANOPY_EMERGENCY_RELEASE", CANOPY_DEVICE_ID, 3006, 203, WSO_CANOPY, "Canopy Emergency Release")
F_4E:definePositiveFloat("WSO_CANOPY", 88, WSO_CANOPY, "Canopy Opened/Closed")

-- Engine
local ENGINE_DEVICE_ID = 24

-- Pilot Engine Controls
local PILOT_ENGINE_CONTROLS = "PLT Engine Controls"

F_4E:defineSpringloaded3PosTumb("PLT_ENGINE_START", ENGINE_DEVICE_ID, 3003, 294, PILOT_ENGINE_CONTROLS, "Start Engine Switch")
F_4E:defineToggleSwitch("PLT_ENGINE_MASTER_L", ENGINE_DEVICE_ID, 3001, 292, PILOT_ENGINE_CONTROLS, "Left Engine Master Switch")
F_4E:defineToggleSwitch("PLT_ENGINE_MASTER_R", ENGINE_DEVICE_ID, 3002, 293, PILOT_ENGINE_CONTROLS, "Right Engine Master Switch")
F_4E:definePushButton("PLT_ENGINE_FIRE_TEST", ENGINE_DEVICE_ID, 3012, 978, PILOT_ENGINE_CONTROLS, "Test Fire System")

-- tachometer
F_4E:definePositiveFloat("PLT_ENGINE_TACH_L_LARGE", 299, PILOT_ENGINE_CONTROLS, "Left Tachometer Large Needle")
F_4E:definePositiveFloat("PLT_ENGINE_TACH_L_SMALL", 2517, PILOT_ENGINE_CONTROLS, "Left Tachometer Small Needle")
F_4E:definePositiveFloat("PLT_ENGINE_TACH_R_LARGE", 300, PILOT_ENGINE_CONTROLS, "Right Tachometer Large Needle")
F_4E:definePositiveFloat("PLT_ENGINE_TACH_R_SMALL", 2518, PILOT_ENGINE_CONTROLS, "Right Tachometer Small Needle")

-- exhaust temp
F_4E:definePositiveFloat("PLT_ENGINE_EXHAUST_L_LARGE", 301, PILOT_ENGINE_CONTROLS, "Left Exhaust Temperature Large Needle")
F_4E:reserveIntValue(65535) -- no draw arg for small needle?
-- F_4E:defineFloatFromArg("PLT_ENGINE_EXHAUST_L_SMALL", 0, PILOT_ENGINE_CONTROLS, "Left Exhaust Temperature Small Needle")
F_4E:definePositiveFloat("PLT_ENGINE_EXHAUST_L_OFF", 2727, PILOT_ENGINE_CONTROLS, "Left Exhaust Temperature Off Flag")
F_4E:definePositiveFloat("PLT_ENGINE_EXHAUST_R_LARGE", 302, PILOT_ENGINE_CONTROLS, "Right Exhaust Temperature Large Needle")
F_4E:reserveIntValue(65535) -- no draw arg for small needle?
-- F_4E:defineFloatFromArg("PLT_ENGINE_EXHAUST_R_SMALL", 0, PILOT_ENGINE_CONTROLS, "Right Exhaust Temperature Small Needle")
F_4E:definePositiveFloat("PLT_ENGINE_EXHAUST_R_OFF", 2728, PILOT_ENGINE_CONTROLS, "Right Exhaust Temperature Off Flag")

-- nozzle position
F_4E:definePositiveFloat("PLT_ENGINE_NOZZLE_L", 303, PILOT_ENGINE_CONTROLS, "Left Nozzle Position Gauge")
F_4E:definePositiveFloat("PLT_ENGINE_NOZZLE_R", 304, PILOT_ENGINE_CONTROLS, "Right Nozzle Position Gauge")

-- oil pressure
F_4E:definePositiveFloat("PLT_ENGINE_OIL_PRESSURE_L", 717, PILOT_ENGINE_CONTROLS, "Left Engine Oil Pressure")
F_4E:definePositiveFloat("PLT_ENGINE_OIL_PRESSURE_R", 718, PILOT_ENGINE_CONTROLS, "Right Engine Oil Pressure")

-- WSO Engine Controls
local WSO_ENGINE_CONTROLS = "WSO Engine Controls"

-- tachometer
F_4E:definePositiveFloat("WSO_ENGINE_TACH_L_LARGE", 715, WSO_ENGINE_CONTROLS, "Left Tachometer Large Needle")
F_4E:definePositiveFloat("WSO_ENGINE_TACH_L_SMALL", 2723, WSO_ENGINE_CONTROLS, "Left Tachometer Small Needle")
F_4E:definePositiveFloat("WSO_ENGINE_TACH_R_LARGE", 716, WSO_ENGINE_CONTROLS, "Right Tachometer Large Needle")
F_4E:definePositiveFloat("WSO_ENGINE_TACH_R_SMALL", 2724, WSO_ENGINE_CONTROLS, "Right Tachometer Small Needle")

-- Control Surfaces
local CONTROL_SURFACES_DEVICE_ID = 25

-- Pilot Control Surfaces
local PILOT_CONTROL_SURFACES = "PLT Control Surfaces"

F_4E:define3PosTumb("PLT_CONTROLS_FLAPS_SLATS", CONTROL_SURFACES_DEVICE_ID, 3005, 222, PILOT_CONTROL_SURFACES, "Flaps/Slats")
F_4E:definePotentiometer("PLT_CONTROLS_FLAPS_SLATS_EMERGENCY", CONTROL_SURFACES_DEVICE_ID, 3003, 223, { 0, 1 }, PILOT_CONTROL_SURFACES, "Flaps/Slats Emergency")
F_4E:defineSpringloaded3PosTumb("PLT_CONTROLS_RUDDER_TRIM", CONTROL_SURFACES_DEVICE_ID, 3012, 964, PILOT_CONTROL_SURFACES, "Rudder Trim")
F_4E:defineToggleSwitch("PLT_CONTROLS_SLATS_OVERRIDE_COVER", CONTROL_SURFACES_DEVICE_ID, 3008, 2520, PILOT_CONTROL_SURFACES, "Slats Override Switch Cover")
F_4E:defineToggleSwitch("PLT_CONTROLS_SLATS_OVERRIDE", CONTROL_SURFACES_DEVICE_ID, 3010, 2519, PILOT_CONTROL_SURFACES, "Slats Override Switch")
F_4E:defineRotary("PLT_CONTROLS_PEDAL_ADJUST", CONTROL_SURFACES_DEVICE_ID, 3017, 2595, PILOT_CONTROL_SURFACES, "Adjust Pedal Position")

F_4E:defineIntegerFromArg("PLT_CONTROLS_FLAPS_INDICATOR", 226, 1, PILOT_CONTROL_SURFACES, "Flaps Indicator")
F_4E:defineIntegerFromArg("PLT_CONTROLS_SLATS_INDICATOR", 225, 2, PILOT_CONTROL_SURFACES, "Slats Indicator")

-- WSO Control Surfaces
local WSO_CONTROL_SURFACES = "WSO Control Surfaces"

F_4E:definePotentiometer("WSO_CONTROLS_FLAPS_SLATS_EMERGENCY", CONTROL_SURFACES_DEVICE_ID, 3004, 224, { 0, 1 }, WSO_CONTROL_SURFACES, "Flaps/Slats Emergency")
F_4E:defineRotary("WSO_CONTROLS_PEDAL_ADJUST", CONTROL_SURFACES_DEVICE_ID, 3018, 2813, WSO_CONTROL_SURFACES, "Adjust Pedal Position")

F_4E:defineIntegerFromArg("WSO_CONTROLS_FLAPS_INDICATOR", 228, 1, WSO_CONTROL_SURFACES, "Flaps Indicator")
F_4E:defineIntegerFromArg("WSO_CONTROLS_SLATS_INDICATOR", 227, 2, WSO_CONTROL_SURFACES, "Slats Indicator")

-- Oxygen System
local OXYGEN_SYSTEM_DEVICE_ID = 26

local PILOT_O2_SYSTEM = "PLT Oxygen System"

F_4E:definePushButton("PLT_O2_TEST", OXYGEN_SYSTEM_DEVICE_ID, 3001, 232, PILOT_O2_SYSTEM, "Test Oxygen Gauge")
F_4E:defineSpringloaded3PosTumb("PLT_O2_MODE", OXYGEN_SYSTEM_DEVICE_ID, 3002, 235, PILOT_O2_SYSTEM, "Select Oxygen Mode")
F_4E:defineToggleSwitch("PLT_O2_MIXTURE", OXYGEN_SYSTEM_DEVICE_ID, 3004, 236, PILOT_O2_SYSTEM, "Select Oxygen Mixture")
F_4E:defineToggleSwitch("PLT_O2_SUPPLY", OXYGEN_SYSTEM_DEVICE_ID, 3006, 237, PILOT_O2_SYSTEM, "Oxygen Supply")

F_4E:definePositiveFloat("PLT_O2_FLOW", 234, PILOT_O2_SYSTEM, "Oxygen Flow Indicator (White)")
F_4E:definePositiveFloat("PLT_O2_PRESSURE", 233, PILOT_O2_SYSTEM, "Oxygen Supply Pressure Gauge")
F_4E:definePositiveFloat("PLT_O2_LITERS", 231, PILOT_O2_SYSTEM, "Oxygen Supply Liters Gauge")

local WSO_O2_SYSTEM = "WSO Oxygen System"

F_4E:reserveIntValue(65535) -- Lamp Cap, not yet implemented

F_4E:defineSpringloaded3PosTumb("WSO_O2_MODE", OXYGEN_SYSTEM_DEVICE_ID, 3003, 242, WSO_O2_SYSTEM, "Select Oxygen Mode")
F_4E:defineToggleSwitch("WSO_O2_MIXTURE", OXYGEN_SYSTEM_DEVICE_ID, 3005, 243, WSO_O2_SYSTEM, "Select Oxygen Mixture")
F_4E:defineToggleSwitch("WSO_O2_SUPPLY", OXYGEN_SYSTEM_DEVICE_ID, 3007, 244, WSO_O2_SYSTEM, "Oxygen Supply")

F_4E:definePositiveFloat("WSO_O2_FLOW", 241, WSO_O2_SYSTEM, "Oxygen Flow Indicator (White)")
F_4E:definePositiveFloat("WSO_O2_PRESSURE", 245, WSO_O2_SYSTEM, "Oxygen Supply Pressure Gauge")

-- Weapons
local WEAPONS_DEVICE_ID = 27

-- WSO WRCS
local WSO_WRCS = "WSO WRCS"

F_4E:definePotentiometer("WSO_WRCS_DRAG_COEFFICIENT", WEAPONS_DEVICE_ID, 3024, 331, { 0, 1 }, WSO_WRCS, "Set Drag Coefficient")
F_4E:definePotentiometer("WSO_WRCS_ALT_RANGE", WEAPONS_DEVICE_ID, 3025, 330, { 0, 1 }, WSO_WRCS, "Set Target Altitude/Range (x100 ft)")
F_4E:definePotentiometer("WSO_WRCS_RELEASE_RANGE", WEAPONS_DEVICE_ID, 3029, 323, { 0, 1 }, WSO_WRCS, "Set Release Range (x10 ft)")
F_4E:definePotentiometer("WSO_WRCS_EW_DISTANCE", WEAPONS_DEVICE_ID, 3026, 321, { 0, 1 }, WSO_WRCS, "Set Target E/W Distance (x100 ft)")
F_4E:definePotentiometer("WSO_WRCS_NS_DISTANCE", WEAPONS_DEVICE_ID, 3027, 320, { 0, 1 }, WSO_WRCS, "Set Target N/S Distance (x100 ft)")
F_4E:definePotentiometer("WSO_WRCS_RELEASE_ADVANCE", WEAPONS_DEVICE_ID, 3028, 322, { 0, 1 }, WSO_WRCS, "Set Release Advance (ms)")
F_4E:defineTumb("WSO_WRCS_BIT_MODE", WEAPONS_DEVICE_ID, 3030, 332, 1 / 6, { 0, 5 / 6 }, nil, true, WSO_WRCS, "Select BIT Mode")
F_4E:defineToggleSwitch("WSO_WRCS_TARGET_FIND_MODE", WEAPONS_DEVICE_ID, 3040, 1017, WSO_WRCS, "Target Find Mode")
F_4E:defineToggleSwitch("WSO_WRCS_RANGE_MULTIPLIER", WEAPONS_DEVICE_ID, 3041, 1018, WSO_WRCS, "WRCS Range x100 Multiplier")

F_4E:defineString("WSO_WRCS_NS_DISTANCE_VALUE", function(dev0)
	local south = dev0:get_argument_value(345) < 0.5
	return string.format("%s%s", south and "S" or "N", drum_set(dev0, 308, 309, 310))
end, 4, WSO_WRCS, "N/S Distance (x100 ft)")

F_4E:defineString("WSO_WRCS_EW_DISTANCE_VALUE", function(dev0)
	local west = dev0:get_argument_value(346) < 0.5
	return string.format("%s%s", west and "W" or "E", drum_set(dev0, 311, 312, 313))
end, 4, WSO_WRCS, "E/W Distance (x100 ft)")

F_4E:defineString("WSO_WRCS_ALT_RANGE_VALUE", function(dev0)
	return drum_set(dev0, 324, 325, 326)
end, 3, WSO_WRCS, "Altitude/Range (x100 ft)")

F_4E:defineString("WSO_WRCS_DRAG_COEFFICIENT_VALUE", function(dev0)
	return drum_set(dev0, 327, 328, 329)
end, 3, WSO_WRCS, "Drag Coefficient")

F_4E:defineString("WSO_WRCS_RELEASE_ADVANCE_VALUE", function(dev0)
	return drum_set(dev0, 314, 315, 316)
end, 3, WSO_WRCS, "Release Advance (ms)")

F_4E:defineString("WSO_WRCS_RELEASE_RANGE_VALUE", function(dev0)
	return drum_set(dev0, 317, 318, 319)
end, 3, WSO_WRCS, "Release Range (x10 ft)")

-- WSO Cursor Control Panel
local WSO_CURSOR_CONTROL_PANEL = "WSO Cursor Control Panel"

F_4E:definePushButton("WSO_CURSOR_CONTROL_FREEZE", WEAPONS_DEVICE_ID, 3044, 1021, WSO_CURSOR_CONTROL_PANEL, "Freeze Target Data")
F_4E:definePushButton("WSO_CURSOR_CONTROL_INSERT", WEAPONS_DEVICE_ID, 3045, 1023, WSO_CURSOR_CONTROL_PANEL, "Insert Target Data")
F_4E:definePushButton("WSO_CURSOR_CONTROL_RESET", WEAPONS_DEVICE_ID, 3046, 1025, WSO_CURSOR_CONTROL_PANEL, "Reset Target Data")
F_4E:defineSpringloaded_3PosTumbWithRange("WSO_CURSOR_CONTROL_ALONG_TRACK", WEAPONS_DEVICE_ID, 3042, 3042, 1019, { 0.3, -0.3 }, WSO_CURSOR_CONTROL_PANEL, "Move Cursor (Along Track)")
F_4E:defineSpringloaded_3PosTumbWithRange("WSO_CURSOR_CONTROL_CROSS_TRACK", WEAPONS_DEVICE_ID, 3043, 3043, 1020, { -0.3, 0.3 }, WSO_CURSOR_CONTROL_PANEL, "Move Cursor (Cross Track)")

F_4E:defineIndicatorLight("WSO_CURSOR_CONTROL_FREEZE_LIGHT", 1022, WSO_CURSOR_CONTROL_PANEL, "Freeze Target Light")
F_4E:defineIndicatorLight("WSO_CURSOR_CONTROL_INSERT_LIGHT", 1024, WSO_CURSOR_CONTROL_PANEL, "Insert Target Light")

-- pilot weapons panel
local PILOT_WEAPONS = "PLT Weapons"

F_4E:defineTumb("PLT_WPN_FUZE_ARM", WEAPONS_DEVICE_ID, 3047, 1221, 1 / 4, { 0, 0.75 }, nil, true, PILOT_WEAPONS, "Arm Fuze")

F_4E:definePushButton("PLT_WPN_GUN_ARM", WEAPONS_DEVICE_ID, 3004, 249, PILOT_WEAPONS, "Arm/Disarm Gun")
F_4E:definePotentiometer("PLT_WPN_PANEL_DIM", WEAPONS_DEVICE_ID, 3037, 980, { 0, 1 }, PILOT_WEAPONS, "Change Panel Button Brightness")
F_4E:definePushButton("PLT_WPN_LO_ARM", WEAPONS_DEVICE_ID, 3005, 250, PILOT_WEAPONS, "Arm/Disarm Left-Outer Station")
F_4E:definePushButton("PLT_WPN_LI_ARM", WEAPONS_DEVICE_ID, 3006, 251, PILOT_WEAPONS, "Arm/Disarm Left-Inner Station")
F_4E:definePushButton("PLT_WPN_CENTER_ARM", WEAPONS_DEVICE_ID, 3007, 252, PILOT_WEAPONS, "Arm/Disarm Center Station")
F_4E:definePushButton("PLT_WPN_RI_ARM", WEAPONS_DEVICE_ID, 3008, 253, PILOT_WEAPONS, "Arm/Disarm Right-Inner Station")
F_4E:definePushButton("PLT_WPN_RO_ARM", WEAPONS_DEVICE_ID, 3009, 254, PILOT_WEAPONS, "Arm/Disarm Right-Outer Station")

F_4E:defineToggleSwitch("PLT_WPN_MASTER_ARM", WEAPONS_DEVICE_ID, 3003, 247, PILOT_WEAPONS, "PILOT Master Arm switch")

F_4E:defineMultipositionSwitch0To1("PLT_WPN_DELIVERY_MODE", WEAPONS_DEVICE_ID, 3010, 272, 13, PILOT_WEAPONS, "Select Delivery Mode")
F_4E:reserveIntValue(1) -- jettison nuclear weapon, not simulated

F_4E:defineTumb("PLT_WPN_WEAPON_SELECT", WEAPONS_DEVICE_ID, 3011, 273, 1 / 7, { 0, 1 }, nil, true, PILOT_WEAPONS, "Select Weapon")

F_4E:define3PosTumb("PLT_WPN_RADAR_MISSILE_CW", WEAPONS_DEVICE_ID, 3031, 347, PILOT_WEAPONS, "Seelct Radar-Missile CW")
F_4E:defineToggleSwitch("PLT_WPN_INTERLOCK", WEAPONS_DEVICE_ID, 3032, 348, PILOT_WEAPONS, "Select Interlock Position")

F_4E:definePotentiometer("PLT_WPN_BOMB_INTERVAL", WEAPONS_DEVICE_ID, 3022, 307, { 0, 1 }, PILOT_WEAPONS, "Select Interval (s)")
F_4E:defineToggleSwitch("PLT_WPN_BOMB_INTERVAL_MULTIPLIER", WEAPONS_DEVICE_ID, 3023, 306, PILOT_WEAPONS, "Select Interval Multiplier (x10)")
F_4E:defineTumb("PLT_WPN_BOMB_QUANTITY", WEAPONS_DEVICE_ID, 3021, 305, 1 / 11, { 0, 1 }, nil, true, PILOT_WEAPONS, "Select Quantity")

F_4E:defineTumb("PLT_WEAPON_JETTISON_SELECT", WEAPONS_DEVICE_ID, 3048, 1254, 1 / 8, { 0, 0.875 }, nil, true, PILOT_WEAPONS, "Select Stations to Jettison")
F_4E:definePushButton("PLT_WPN_JETTISON_PUSH", WEAPONS_DEVICE_ID, 3049, 1253, PILOT_WEAPONS, "Jettison Selection")

F_4E:defineToggleSwitch("PLT_WPN_GROUND_SAFETY_OVERRIDE", WEAPONS_DEVICE_ID, 3137, 281, PILOT_WEAPONS, "Override Ground Safety")

F_4E:definePushButton("PLT_WPN_STORES_EMERGENCY_RELEASE", WEAPONS_DEVICE_ID, 3036, 965, PILOT_WEAPONS, "Emergency Release External Stores")

F_4E:definePushButton("PLT_WPN_LABS_PULL_UP_TEST", WEAPONS_DEVICE_ID, 3072, 368, PILOT_WEAPONS, "LABS Pull-Up Light (push to test)")
F_4E:definePotentiometer("PLT_WPN_LABS_PULL_UP_DIM", WEAPONS_DEVICE_ID, 3073, 2794, { 0, 1 }, PILOT_WEAPONS, "LABS Pull-Up Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_WPN_LABS_PULL_UP", 367, PILOT_WEAPONS, "LABS Pull-up Lamp (Red)")

F_4E:defineToggleSwitch("PLT_WPN_GUN_RATE", WEAPONS_DEVICE_ID, 3012, 278, PILOT_WEAPONS, "Set Gun Rate")
F_4E:defineRotary("PLT_WPN_GUN_ROUNDS", WEAPONS_DEVICE_ID, 3050, 1412, PILOT_WEAPONS, "Set Gun Rounds")

F_4E:defineString("PLT_WPN_GUN_ROUNDS_COUNT", function(dev0)
	return drum_set(dev0, 275, 276, 277)
end, 3, PILOT_WEAPONS, "Gun Rounds")

F_4E:reserveIntValue(1) -- gun pod clear mode switch, not implemented
F_4E:defineSpringloaded_3PosTumbWithRange("PLT_WPN_MISSILE_REJECT", WEAPONS_DEVICE_ID, 3134, 3134, 2596, { 1, 0 }, PILOT_WEAPONS, "Missile Reject/Norm/Direction Finding Reject")
F_4E:reserveIntValue(1) -- change shrike band, not implemented

-- station select/arm lights (green depressed + yellow arm)
F_4E:defineIndicatorLight("PLT_WPN_GUN_SELECTED", 255, PILOT_WEAPONS, "Gun Selected Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_LO_SELECTED", 256, PILOT_WEAPONS, "Left Outboard Pylon Selected Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_LI_SELECTED", 257, PILOT_WEAPONS, "Left Inboard Pylon Selected Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_CENTER_SELECTED", 258, PILOT_WEAPONS, "Center Pylon Selected Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_RI_SELECTED", 259, PILOT_WEAPONS, "Right Inboard Pylon Selected Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_RO_SELECTED", 260, PILOT_WEAPONS, "Right Outboard Pylon Selected Lamp (Green)")

F_4E:defineIndicatorLight("PLT_WPN_GUN_ARMED", 261, PILOT_WEAPONS, "Gun Arm Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WPN_LO_ARMED", 262, PILOT_WEAPONS, "Left Outboard Pylon Arm Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WPN_LI_ARMED", 263, PILOT_WEAPONS, "Left Inboard Pylon Arm Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WPN_CENTER_ARMED", 264, PILOT_WEAPONS, "Center Pylon Selected Arm Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WPN_RI_ARMED", 265, PILOT_WEAPONS, "Right Inboard Pylon Arm Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WPN_RO_ARMED", 266, PILOT_WEAPONS, "Right Outboard Pylon Arm Lamp (Yellow)")

-- heads-up weapon lights
F_4E:defineIndicatorLight("PLT_WPN_HU_ARM", 248, PILOT_WEAPONS, "Heads-up Arm Lamp (Yellow)")
F_4E:defineIndicatorLight("PLT_WPN_HU_GUN", 274, PILOT_WEAPONS, "Heads-up Gun Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_HU_RADAR", 279, PILOT_WEAPONS, "Heads-up Radar Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_HU_HEAT", 280, PILOT_WEAPONS, "Heads-up Heat Lamp (Blue)")

-- heat/radar missile indicators
F_4E:defineIndicatorLight("PLT_WPN_HEAT_LO", 284, PILOT_WEAPONS, "Outer Left Heat Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_HEAT_LI", 285, PILOT_WEAPONS, "Inner Left Heat Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_HEAT_RI", 286, PILOT_WEAPONS, "Inner Right Heat Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_HEAT_RO", 287, PILOT_WEAPONS, "Outer Right Heat Lamp (Blue)")

F_4E:defineIndicatorLight("PLT_WPN_RADAR_TL", 288, PILOT_WEAPONS, "Top Left Radar Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_RADAR_BL", 289, PILOT_WEAPONS, "Bottom Left Radar Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_RADAR_TR", 290, PILOT_WEAPONS, "Top Right Radar Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_WPN_RADAR_BR", 291, PILOT_WEAPONS, "Bottom Right Radar Lamp (Blue)")

-- centerline tank aboard light
F_4E:defineIndicatorLight("PLT_WPN_CL_TANK_ABOARD", 349, PILOT_WEAPONS, "Centerline Tank Aboard Lamp (Blue)")

-- canopy rail shoot lights (green), shoot lights by aoa indexer (red)
F_4E:defineIndicatorLight("PLT_WPN_SHOOT_CANOPY_L", 2593, PILOT_WEAPONS, "Left Canopy Rail Shoot Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_SHOOT_CANOPY_C", 374, PILOT_WEAPONS, "Center Canopy Rail Shoot Lamp (Green)")
F_4E:defineIndicatorLight("PLT_WPN_SHOOT_CANOPY_R", 2594, PILOT_WEAPONS, "Right Canopy Rail Shoot Lamp (Green)")

F_4E:defineIndicatorLight("PLT_WPN_SHOOT_HU_L", 2530, PILOT_WEAPONS, "Left Heads-up Shoot Lamp (Red)")
F_4E:defineIndicatorLight("PLT_WPN_SHOOT_HU_R", 2531, PILOT_WEAPONS, "Right Heads-up Shoot Lamp (Red)")

-- WSO Weapons
local WSO_WEAPONS = "WSO Weapons"

F_4E:defineIndicatorLight("WSO_WPN_SHOOT_HU", 2677, WSO_WEAPONS, "Heads-up Shoot Lamp (Green)")
F_4E:defineToggleSwitch("WSO_WPN_LABS_TONE", WEAPONS_DEVICE_ID, 3078, 350, WSO_WEAPONS, "LABS Pull-Up Tone")

-- Turn Coordinators
-- local TURN_SLIP_DEVICE_ID = 29

-- Pilot Turn Coordinator
local PLT_TURN_COORDINATOR = "PLT Turn Coordinator"

F_4E:defineFullRangeFloat("PLT_TURN_BALL", 420, PLT_TURN_COORDINATOR, "Slip Ball")
F_4E:defineFullRangeFloat("PLT_TURN_INDICATOR", 421, PLT_TURN_COORDINATOR, "Turn Coordinator rotation")

-- WSO Turn Coordinator
local WSO_TURN_COORDINATOR = "WSO Turn Coordinator"

F_4E:defineFullRangeFloat("WSO_TURN_BALL", 610, WSO_TURN_COORDINATOR, "Slip Ball")
F_4E:defineFullRangeFloat("WSO_TURN_INDICATOR", 611, WSO_TURN_COORDINATOR, "Turn Coordinator rotation")

-- HUD (AN-ASG-26)
local HUD_DEVICE_ID = 31

local PLT_HUD = "PLT HUD"

F_4E:defineToggleSwitch("PLT_HUD_SHUTTER", HUD_DEVICE_ID, 3004, 1200, PLT_HUD, "Toggle Collimator Shutter")
F_4E:definePotentiometer("PLT_HUD_BRIGHTNESS", HUD_DEVICE_ID, 3003, 1201, { 0, 1 }, PLT_HUD, "Change HUD Brightness")
F_4E:definePotentiometer("PLT_HUD_DEPRESSION", HUD_DEVICE_ID, 3002, 267, { 0, 1 }, PLT_HUD, "Change Reticle Depression (mil)")
F_4E:defineMultipositionSwitch0To1("PLT_HUD_MODE", HUD_DEVICE_ID, 3001, 271, 7, PLT_HUD, "Select HUD Mode")

F_4E:defineString("PLT_HUD_DEPRESSION_MILS", function(dev0)
	return drum_set(dev0, 268, 269, 270)
end, 3, PLT_HUD, "Reticle Depression (mils)")

-- Accelerometer
local ACCELEROMETER_DEVICE_ID = 35

-- Pilot Accelerometer
local PILOT_ACCELEROMETER = "PLT Accelerometer"

F_4E:definePushButton("PLT_ACCELEROMETER_RESET", ACCELEROMETER_DEVICE_ID, 3001, 72, PILOT_ACCELEROMETER, "Reset Accelerometer")

F_4E:definePositiveFloat("PLT_ACCELEROMETER_LOW", 68, PILOT_ACCELEROMETER, "Low-G Needle")
F_4E:definePositiveFloat("PLT_ACCELEROMETER_CURRENT", 67, PILOT_ACCELEROMETER, "Current-G Needle")
F_4E:definePositiveFloat("PLT_ACCELEROMETER_HIGH", 69, PILOT_ACCELEROMETER, "High-G Needle")

-- WSO Accelerometer
local WSO_ACCELEROMETER = "WSO Accelerometer"

F_4E:definePushButton("WSO_ACCELEROMETER_RESET", ACCELEROMETER_DEVICE_ID, 3002, 180, WSO_ACCELEROMETER, "Reset Accelerometer")

F_4E:definePositiveFloat("WSO_ACCELEROMETER_LOW", 178, WSO_ACCELEROMETER, "Low-G Needle")
F_4E:definePositiveFloat("WSO_ACCELEROMETER_CURRENT", 177, WSO_ACCELEROMETER, "Current-G Needle")
F_4E:definePositiveFloat("WSO_ACCELEROMETER_HIGH", 179, WSO_ACCELEROMETER, "High-G Needle")

-- Pitot/Static System
local PITOT_STATIC_DEVICE_ID = 36

-- CADC
local CADC_DEVICE_ID = 38

-- Pilot CADC
local PILOT_CADC = "PLT CADC"

F_4E:defineSpringloaded3PosTumb("PLT_CADC_CORRECTION", CADC_DEVICE_ID, 3001, 113, PILOT_CADC, "CADC Corrections")

-- Airspeed Indicator
local ASI_DEVICE_ID = 39

-- Pilot Airspeed Indicator
local PILOT_ASI = "PLT Airspeed Indicator"

F_4E:defineRotary("PLT_ASI_BUG", ASI_DEVICE_ID, 3001, 106, PILOT_ASI, "Move Bug")
F_4E:defineToggleSwitch("PLT_ASI_BUG_UNITS", ASI_DEVICE_ID, 3002, 107, PILOT_ASI, "Toggle Speed/Mach bugs")

F_4E:definePositiveFloat("PLT_ASI_NEEDLE", 102, PILOT_ASI, "IAS Needle")
F_4E:definePositiveFloat("PLT_ASI_MACH_DIAL", 103, PILOT_ASI, "Mach Dial rotation")
F_4E:definePositiveFloat("PLT_ASI_AIRSPEED_BUG", 104, PILOT_ASI, "Airspeed Bug")
F_4E:definePositiveFloat("PLT_ASI_MACH_BUG", 105, PILOT_ASI, "Mach Bug")

-- WSO Airspeed Indicator
local WSO_ASI = "WSO Airspeed Indicator"

F_4E:defineRotary("WSO_ASI_BUG", ASI_DEVICE_ID, 3003, 197, WSO_ASI, "Move Bug")
F_4E:defineToggleSwitch("WSO_ASI_BUG_UNITS", ASI_DEVICE_ID, 3004, 198, WSO_ASI, "Toggle Speed/Mach bugs")

F_4E:definePositiveFloat("WSO_ASI_NEEDLE", 193, WSO_ASI, "IAS Needle")
F_4E:definePositiveFloat("WSO_ASI_MACH_DIAL", 194, WSO_ASI, "Mach Dial rotation")
F_4E:definePositiveFloat("WSO_ASI_AIRSPEED_BUG", 195, WSO_ASI, "Airspeed Bug")
F_4E:definePositiveFloat("WSO_ASI_MACH_BUG", 196, WSO_ASI, "Mach Bug")

-- Barometric Altimeter
local BARO_ALTIMETER_DEVICE_ID = 40

-- PLT Barometric Altimeter
local PILOT_BARO_ALTIMETER = "PLT Barometric Altimeter"

F_4E:definePotentiometer("PLT_BARO_PRESSURE_KNOB", BARO_ALTIMETER_DEVICE_ID, 3001, 95, { 0, 1 }, PILOT_BARO_ALTIMETER, "Change Reference Pressure")
F_4E:defineSpringloaded3PosTumb("PLT_BARO_MODE", BARO_ALTIMETER_DEVICE_ID, 3002, 100, PILOT_BARO_ALTIMETER, "Change Mode (hold to reset)")

F_4E:definePositiveFloat("PLT_BARO_NEEDLE", 91, PILOT_BARO_ALTIMETER, "Altimeter Needle")
F_4E:defineIntegerFromGetter("PLT_BARO_HUNDREDS", function(dev0)
	return drum_value(dev0, 92)
end, 9, PILOT_BARO_ALTIMETER, "Altitude Drum (hundreds)")
F_4E:defineIntegerFromGetter("PLT_BARO_THOUSANDS", function(dev0)
	return drum_value(dev0, 93)
end, 9, PILOT_BARO_ALTIMETER, "Altitude Drum (thousands)")
F_4E:defineIntegerFromGetter("PLT_BARO_TEN_THOUSANDS", function(dev0)
	return drum_value(dev0, 94)
end, 9, PILOT_BARO_ALTIMETER, "Altitude Drum (ten thousands)")
F_4E:defineString("PLT_BARO_ALTITUDE", function(dev0)
	return drum_set(dev0, 94, 93, 92)
end, 3, PILOT_BARO_ALTIMETER, "Altimeter Readout (x100)")

F_4E:defineString("PLT_BARO_PRESSURE", function(dev0)
	return drum_set(dev0, 99, 98, 97, 96)
end, 4, PILOT_BARO_ALTIMETER, "Pressure Setting")

F_4E:definePositiveFloat("PLT_BARO_STANDBY", 101, PILOT_BARO_ALTIMETER, "Standby Flag")

-- WSO Barometric Altimeter
local WSO_BARO_ALTIMETER = "WSO Barometric Altimeter"

F_4E:definePotentiometer("WSO_BARO_PRESSURE_KNOB", BARO_ALTIMETER_DEVICE_ID, 3003, 186, { 0, 1 }, WSO_BARO_ALTIMETER, "Change Reference Pressure")
F_4E:defineSpringloaded3PosTumb("WSO_BARO_MODE", BARO_ALTIMETER_DEVICE_ID, 3004, 191, WSO_BARO_ALTIMETER, "Change Mode (hold to reset)")

F_4E:definePositiveFloat("WSO_BARO_NEEDLE", 182, WSO_BARO_ALTIMETER, "Altimeter Needle")
F_4E:defineIntegerFromGetter("WSO_BARO_HUNDREDS", function(dev0)
	return drum_value(dev0, 183)
end, 9, WSO_BARO_ALTIMETER, "Altitude Drum (hundreds)")
F_4E:defineIntegerFromGetter("WSO_BARO_THOUSANDS", function(dev0)
	return drum_value(dev0, 184)
end, 9, WSO_BARO_ALTIMETER, "Altitude Drum (thousands)")
F_4E:defineIntegerFromGetter("WSO_BARO_TEN_THOUSANDS", function(dev0)
	return drum_value(dev0, 185)
end, 9, WSO_BARO_ALTIMETER, "Altitude Drum (ten thousands)")
F_4E:defineString("WSO_BARO_ALTITUDE", function(dev0)
	return drum_set(dev0, 185, 184, 183)
end, 3, WSO_BARO_ALTIMETER, "Altimeter Readout (x100)")

F_4E:defineString("WSO_BARO_PRESSURE", function(dev0)
	return drum_set(dev0, 190, 189, 188, 187)
end, 4, WSO_BARO_ALTIMETER, "Pressure Setting")

F_4E:definePositiveFloat("WSO_BARO_STANDBY", 192, WSO_BARO_ALTIMETER, "Standby Flag")

-- Vertical Velocity Indicator
-- local VVI_DEVICE_ID = 41

-- Pilot VVI
local PILOT_VVI = "PLT Vertical Velocity Indicator"

F_4E:defineFullRangeFloat("PLT_VVI_NEEDLE", 90, PILOT_VVI, "VVI Needle")

-- WSO VVI
local WSO_VVI = "WSO Vertical Velocity Indicator"

F_4E:defineFullRangeFloat("WSO_VVI_NEEDLE", 181, WSO_VVI, "VVI Needle")

-- TAS Indicator
-- local TAS_DEVICE_ID = 42

-- Pilot TAS
local PILOT_TAS = "PLT TAS"

F_4E:defineString("PLT_TAS", function(dev0)
	return drum_set(dev0, 112, 111, 110, 109)
end, 4, PILOT_TAS, "True Airspeed")

-- WSO TAS
local WSO_TAS = "WSO TAS"

F_4E:defineString("WSO_TAS", function(dev0)
	return drum_set(dev0, 603, 602, 601, 600)
end, 4, WSO_TAS, "True Airspeed")

-- ADI (ARU-11-A)
local ADI_DEVICE_ID = 44

-- Pilot ADI
local PILOT_ADI = "PLT ADI"

F_4E:defineToggleSwitch("PLT_ADI_REFERENCE_SYSTEM", ADI_DEVICE_ID, 3002, 692, PILOT_ADI, "Select Reference System")
F_4E:definePotentiometer("PLT_ADI_PITCH_ADJUST", ADI_DEVICE_ID, 3004, 612, { 0, 1 }, PILOT_ADI, "Adjust Pitch")

F_4E:defineFullRangeFloat("PLT_ADI_HEADING", 613, PILOT_ADI, "X-Axis Rotation (Yaw)")
F_4E:defineFullRangeFloat("PLT_ADI_ROLL", 614, PILOT_ADI, "Z-Axis Rotation (Roll)")
F_4E:defineFullRangeFloat("PLT_ADI_PITCH", 615, PILOT_ADI, "Y-Axis Rotation (Pitch)")
F_4E:defineFullRangeFloat("PLT_ADI_ROLL_STEERING_BAR", 616, PILOT_ADI, "Pitch Roll Cue Bar (Yellow)")
F_4E:defineFullRangeFloat("PLT_ADI_PITCH_STEERING_BAR", 617, PILOT_ADI, "Pitch Steering Cue Bar (Yellow)")
F_4E:defineFullRangeFloat("PLT_ADI_BANK", 618, PILOT_ADI, "Bank Pointers")
F_4E:defineFullRangeFloat("PLT_ADI_GLIDESLOPE", 619, PILOT_ADI, "Glideslope Pointer")
F_4E:definePositiveFloat("PLT_ADI_COURSE_WARNING_FLAG", 620, PILOT_ADI, "Course Warning Flag")
F_4E:definePositiveFloat("PLT_ADI_GLIDESLOPE_WARNING_FLAG", 621, PILOT_ADI, "Glideslope Warning Flag")
F_4E:definePositiveFloat("PLT_ADI_OFF_WARNING_FLAG", 622, PILOT_ADI, "Off Warning Flag")

-- CNI (AN-ASQ-19A)
local CNI_DEVICE_ID = 45

-- WSO CNI
local WSO_CNI = "WSO CNI"

F_4E:defineMultipositionRollerLimited("WSO_CNI_NAVIGATION_INPUT", CNI_DEVICE_ID, 3001, 664, 3, WSO_CNI, "Select Navigation Input")

-- Ground Speed Indicator
-- local GS_DEVICE_ID = 46

-- WSO Ground Speed Indicator
local WSO_GSI = "WSO Ground Speed Indicator"

F_4E:defineString("WSO_GSI", function(dev0)
	return drum_set(dev0, 607, 606, 605, 604)
end, 4, WSO_GSI, "Ground Speed")

-- Emergency Attitude Indicator
local EMERGENCY_ATTITUDE_DEVICE_ID = 47

-- Pilot Emergency Attitude Indicator
local PILOT_SAI = "PLT Emergency Attitude Indicator"

F_4E:defineToggleSwitch("PLT_SAI_CAGE", EMERGENCY_ATTITUDE_DEVICE_ID, 3002, 628, PILOT_SAI, "Cage/Uncage")
-- control isn't fully implemented in the module, so we can't use it as a potentiometer (yet)
-- F_4E:definePotentiometer("PLT_SAI_TRIM", EMERGENCY_ATTITUDE_DEVICE_ID, 3001, 629, { 0, 1 }, PILOT_SAI, "Trim Emergency Attitude Indicator")
F_4E:defineRotary("PLT_SAI_TRIM", EMERGENCY_ATTITUDE_DEVICE_ID, 3001, 629, PILOT_SAI, "Trim Emergency Attitude Indicator")

F_4E:defineFullRangeFloat("PLT_SAI_PITCH", 625, PILOT_SAI, "Y-Axis Rotation (Pitch)")
F_4E:definePositiveFloat("PLT_SAI_ROLL", 626, PILOT_SAI, "Z-Axis Rotation (Roll)")
F_4E:defineFullRangeFloat("PLT_SAI_TRIM_BAR", 630, PILOT_SAI, "Horizon Indicator Position")
F_4E:definePositiveFloat("PLT_SAI_OFF_FLAG", 627, PILOT_SAI, "Off Warning Flag")

-- TACAN (AN-ARN-118)
local TACAN_DEVICE_ID = 48

local function get_tacan_channel(dev0, arg_hundreds, arg_tens, arg_ones, arg_xy)
	local xy_value = dev0:get_argument_value(arg_xy)
	return string.format("%s%s", drum_set(dev0, arg_hundreds, arg_tens, arg_ones), xy_value > 0.5 and "Y" or "X")
end

-- Pilot TACAN
local PILOT_TACAN = "PLT TACAN"

F_4E:definePushButton("PLT_TACAN_TOGGLE_COMMAND", TACAN_DEVICE_ID, 3001, 120, PILOT_TACAN, "Toggle TACAN Command")
F_4E:definePotentiometer("PLT_TACAN_COMMAND_LIGHT_BRIGHTNESS", TACAN_DEVICE_ID, 3015, 2770, { 0, 1 }, PILOT_TACAN, "Change TACAN Command Light Brightness")
F_4E:defineMultipositionRollerLimited("PLT_TACAN_SET_TENS", TACAN_DEVICE_ID, 3003, 641, 13, PILOT_TACAN, "Set TACAN Channel (tens/hundreds)")
F_4E:defineMultipositionSwitch("PLT_TACAN_SET_ONES", TACAN_DEVICE_ID, 3002, 640, 10, 1 / 9, PILOT_TACAN, "Set TACAN Channel (ones)") -- yes, even though everything else is a "roller", this is a switch
F_4E:defineToggleSwitch("PLT_TACAN_SET_XY", TACAN_DEVICE_ID, 3004, 654, PILOT_TACAN, "Set TACAN Channel (X/Y)")
F_4E:definePotentiometer("PLT_TACAN_VOLUME", TACAN_DEVICE_ID, 3005, 642, { 0, 1 }, PILOT_TACAN, "Change TACAN Volume")
F_4E:defineMultipositionRollerLimited("PLT_TACAN_MODE", TACAN_DEVICE_ID, 3006, 646, 5, PILOT_TACAN, "Select TACAN Mode")
F_4E:definePushButton("PLT_TACAN_TEST", TACAN_DEVICE_ID, 3007, 655, PILOT_TACAN, "Test TACAN")

F_4E:defineDimmableIndicatorLight("PLT_TACAN_COMMAND_LIGHT", 170, PILOT_TACAN, "TACAN Command Lamp (Green)")
F_4E:defineIndicatorLight("PLT_TACAN_TEST_LIGHT", 657, PILOT_TACAN, "TACAN Test Lamp (Red)")
F_4E:defineString("PLT_TACAN_CHANNEL", function(dev0)
	return get_tacan_channel(dev0, 645, 644, 643, 656)
end, 4, PILOT_TACAN, "TACAN Channel")

-- WSO TACAN
local WSO_TACAN = "WSO TACAN"

F_4E:definePushButton("WSO_TACAN_TOGGLE_COMMAND", TACAN_DEVICE_ID, 3008, 145, WSO_TACAN, "Toggle TACAN Command")
F_4E:definePotentiometer("WSO_TACAN_COMMAND_LIGHT_BRIGHTNESS", TACAN_DEVICE_ID, 3016, 2774, { 0, 1 }, WSO_TACAN, "Change TACAN Command Light Brightness")
F_4E:defineMultipositionRollerLimited("WSO_TACAN_SET_TENS", TACAN_DEVICE_ID, 3010, 648, 13, WSO_TACAN, "Set TACAN Channel (tens/hundreds)")
F_4E:defineMultipositionSwitch("WSO_TACAN_SET_ONES", TACAN_DEVICE_ID, 3009, 647, 10, 1 / 9, WSO_TACAN, "Set TACAN Channel (ones)") -- yes, even though everything else is a "roller", this is a switch
F_4E:defineToggleSwitch("WSO_TACAN_SET_XY", TACAN_DEVICE_ID, 3011, 658, WSO_TACAN, "Set TACAN Channel (X/Y)")
F_4E:definePotentiometer("WSO_TACAN_VOLUME", TACAN_DEVICE_ID, 3012, 649, { 0, 1 }, WSO_TACAN, "Change TACAN Volume")
F_4E:defineMultipositionRollerLimited("WSO_TACAN_MODE", TACAN_DEVICE_ID, 3013, 653, 5, WSO_TACAN, "Select TACAN Mode")
F_4E:definePushButton("WSO_TACAN_TEST", TACAN_DEVICE_ID, 3014, 659, WSO_TACAN, "Test TACAN")

F_4E:defineDimmableIndicatorLight("WSO_TACAN_COMMAND_LIGHT", 171, WSO_TACAN, "TACAN Command Lamp (Green)")
F_4E:defineIndicatorLight("WSO_TACAN_TEST_LIGHT", 661, WSO_TACAN, "TACAN Test Lamp (Red)")
F_4E:defineString("WSO_TACAN_CHANNEL", function(dev0)
	return get_tacan_channel(dev0, 652, 651, 650, 660)
end, 4, WSO_TACAN, "TACAN Channel")

-- Flight Director Computer
local FLIGHT_DIRECTOR_DEVICE_ID = 49

-- Pilot Flight Director Computer
local PILOT_FLIGHT_DIRECTOR = "PLT Flight Director Computer"

F_4E:defineMultipositionRollerLimited("PLT_FDC_NAVIGATION_INPUT", FLIGHT_DIRECTOR_DEVICE_ID, 3001, 662, 4, PILOT_FLIGHT_DIRECTOR, "Select Navigation Input")
F_4E:defineMultipositionRollerLimited("PLT_FDC_NAVIGATION_MODE", FLIGHT_DIRECTOR_DEVICE_ID, 3002, 663, 4, PILOT_FLIGHT_DIRECTOR, "Select Navigation Mode")
F_4E:defineToggleSwitch("PLT_FDC_FLIGHT_DIRECTOR", FLIGHT_DIRECTOR_DEVICE_ID, 3003, 665, PILOT_FLIGHT_DIRECTOR, "Toggle Flight Director")

-- HSI (AF-A24J-1)
local HSI_DEVICE_ID = 50

-- Pilot HSI
local PILOT_HSI = "PLT HSI"

F_4E:defineRotary("PLT_HSI_HEADING_SET", HSI_DEVICE_ID, 3002, 678, PILOT_HSI, "Set HSI Heading")
F_4E:defineRotary("PLT_HSI_COURSE_SET", HSI_DEVICE_ID, 3001, 673, PILOT_HSI, "Set HSI Course")

F_4E:definePositiveFloat("PLT_HSI_COMPASS_ROTATION", 668, PILOT_HSI, "Compass Card Rotation")
F_4E:definePositiveFloat("PLT_HSI_BEARING_POINTER", 669, PILOT_HSI, "Bearing Arrow (outer ring)")
F_4E:definePositiveFloat("PLT_HSI_COURSE_ARROW", 670, PILOT_HSI, "Course Arrow (inner)")
F_4E:defineFullRangeFloat("PLT_HSI_COURSE_DEVIATION", 671, PILOT_HSI, "Course Deviation Line")
F_4E:definePositiveFloat("PLT_HSI_HEADING_BUG", 672, PILOT_HSI, "Heading Bug (outer ring)")
F_4E:defineFullRangeFloat("PLT_HSI_TO_FROM_ARROW", 677, PILOT_HSI, "To/From Arrow (inner)")

F_4E:defineString("PLT_HSI_COURSE", function(dev0)
	return drum_set(dev0, 676, 675, 674)
end, 3, PILOT_HSI, "Course Heading Drum")

F_4E:defineString("PLT_HSI_RANGE", function(dev0)
	return drum_set(dev0, 682, 681, 680, 679)
end, 4, PILOT_HSI, "Range Drum (miles)")

F_4E:definePositiveFloat("PLT_HSI_RANGE_WARNING_FLAG", 683, PILOT_HSI, "Range Warning Flag")
F_4E:defineDimmableIndicatorLight("PLT_HSI_NAV", 684, PILOT_HSI, "NAV Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_DL_L", 685, PILOT_HSI, "Left DL Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_ILS", 686, PILOT_HSI, "ILS Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_MAN", 687, PILOT_HSI, "MAN Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_TAC", 688, PILOT_HSI, "TAC Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_TGT", 689, PILOT_HSI, "TGT Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_UHF", 690, PILOT_HSI, "UHF Lamp (Red)")
F_4E:defineDimmableIndicatorLight("PLT_HSI_DL_R", 691, PILOT_HSI, "Right DL Lamp (Red)")

-- Radar
local RADAR_DEVICE_ID = 52

-- WSO Radar
local WSO_RADAR = "WSO Radar"

F_4E:defineSpringloaded3PosTumb("WSO_RADAR_ANTENNA_ELEVATION", RADAR_DEVICE_ID, 3011, 1014, WSO_RADAR, "Change Radar Antenna Elevation")
F_4E:definePushButton("WSO_RADAR_CHALLENGE", RADAR_DEVICE_ID, 3014, 2508, WSO_RADAR, "Challenge Button")
F_4E:reserveIntValue(1) -- reserved in case Trigger becomes clickable

-- WSO Radar Antenna Panel
F_4E:defineTumb("WSO_RADAR_METER_MODE", RADAR_DEVICE_ID, 3015, 1001, 1.673 / 15, { -0.673, 1 }, nil, false, WSO_RADAR, "Select Meter Mode (Volt/Signal)")
F_4E:defineTumb("WSO_RADAR_BIT", RADAR_DEVICE_ID, 3036, 1408, 1 / 11, { 0, 1 }, nil, true, WSO_RADAR, "Radar BIT")
F_4E:defineToggleSwitch("WSO_RADAR_METER_DISPLAY", RADAR_DEVICE_ID, 3018, 1006, WSO_RADAR, "Set Meter Display")
F_4E:defineToggleSwitch("WSO_RADAR_VC", RADAR_DEVICE_ID, 3017, 1005, WSO_RADAR, "Select Vc")
F_4E:define3PosTumb("WSO_RADAR_ANTENNA_STAB", RADAR_DEVICE_ID, 3016, 1004, WSO_RADAR, "Select Antenna Stabilization Mode")

-- WSO Radar Panel
F_4E:defineMultipositionSwitch0To1("WSO_RADAR_POWER", RADAR_DEVICE_ID, 3004, 336, 5, WSO_RADAR, "Radar Power Controls")
F_4E:define3PosTumb("WSO_RADAR_POLARIZATION", RADAR_DEVICE_ID, 3021, 1009, WSO_RADAR, "Change Polarization")
F_4E:defineMultipositionSwitch0To1("WSO_RADAR_RANGE", RADAR_DEVICE_ID, 3005, 337, 6, WSO_RADAR, "Select Radar Range")

F_4E:defineToggleSwitch("WSO_RADAR_MANEUVER", RADAR_DEVICE_ID, 3019, 1007, WSO_RADAR, "Select Maneuver")
F_4E:defineToggleSwitch("WSO_RADAR_SCAN", RADAR_DEVICE_ID, 3003, 342, WSO_RADAR, "Select Scan Pattern")
F_4E:defineMultipositionSwitch0To1("WSO_RADAR_TARGET_ASPECT", RADAR_DEVICE_ID, 3020, 1008, 5, WSO_RADAR, "Select Target Aspect")

F_4E:definePotentiometer("WSO_RADAR_GAIN_FINE", RADAR_DEVICE_ID, 3001, 340, { 0, 1 }, WSO_RADAR, "Change radar Receiver Gain (fine)")
F_4E:definePotentiometer("WSO_RADAR_GAIN_COARSE", RADAR_DEVICE_ID, 3002, 341, { 0, 1 }, WSO_RADAR, "Change radar Receiver Gain (coarse)")
F_4E:define3PosTumb("WSO_RADAR_TRACK", RADAR_DEVICE_ID, 3022, 372, WSO_RADAR, "Select Track Mode")
F_4E:defineMultipositionSwitch0To1("WSO_RADAR_DISPLAY", RADAR_DEVICE_ID, 3006, 338, 5, WSO_RADAR, "Select Display Mode")

F_4E:defineTumb("WSO_RADAR_MANUAL_VC", RADAR_DEVICE_ID, 3035, 1407, 0.917 / 11, { 0, 0.917 }, nil, true, WSO_RADAR, "Select Manual Vc (Closure Velocity, kt)")
F_4E:define3PosTumb("WSO_RADAR_PULSE", RADAR_DEVICE_ID, 3013, 371, WSO_RADAR, "Select Pulse Length")
F_4E:defineMultipositionSwitch0To1("WSO_RADAR_MODE", RADAR_DEVICE_ID, 3007, 339, 6, WSO_RADAR, "Select Radar Mode")

-- WSO DSCG
F_4E:definePotentiometer("WSO_RADAR_GRID_BRIGHT", RADAR_DEVICE_ID, 3032, 334, { 0, 1 }, WSO_RADAR, "Change Grid Brightness")
F_4E:definePotentiometer("WSO_RADAR_SCALE_BRIGHT", RADAR_DEVICE_ID, 3033, 2672, { 0, 1 }, WSO_RADAR, "Scale Brightness")
F_4E:definePotentiometer("WSO_RADAR_RANGE_CUR_BRIGHT", RADAR_DEVICE_ID, 3024, 1401, { 0, 1 }, WSO_RADAR, "Change Range-Cursor Brightness")
F_4E:definePotentiometer("WSO_RADAR_OFFSET_CUR_BRIGHT", RADAR_DEVICE_ID, 3026, 1403, { 0, 1 }, WSO_RADAR, "Change Offset-Cursor Brightness")
F_4E:definePotentiometer("WSO_RADAR_SCREEN_CONTRAST", RADAR_DEVICE_ID, 3023, 1400, { 0, 1 }, WSO_RADAR, "Change Screen Contrast")
F_4E:definePotentiometer("WSO_RADAR_SCREEN_BRIGHT", RADAR_DEVICE_ID, 3025, 1402, { 0, 1 }, WSO_RADAR, "Change Screen Brightness")
F_4E:defineMultipositionSwitch0To1("WSO_RADAR_SCREEN", RADAR_DEVICE_ID, 3027, 1404, 6, WSO_RADAR, "Select Screen Mode")

F_4E:definePushButton("WSO_RADAR_A2A_CAGE", RADAR_DEVICE_ID, 3034, 2732, WSO_RADAR, "Air to Air Mode - Exit Cage")

F_4E:defineIndicatorLight("WSO_RADAR_SKIN_TRACK", 1010, WSO_RADAR, "Skin Track Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RADAR_H", 2877, WSO_RADAR, "H Lamp (Red)")
F_4E:defineIndicatorLight("WSO_RADAR_T", 2878, WSO_RADAR, "T Lamp (Red)")
F_4E:defineIndicatorLight("WSO_RADAR_COOL_OFF", 2689, WSO_RADAR, "Cool Off Lamp (Blue)")
F_4E:defineIndicatorLight("WSO_RADAR_A2A_LIGHT", 2690, WSO_RADAR, "Air to Air Button Lamp (Green)")

-- WSO Range Indicator
local WSO_RANGE_INDICATOR = "WSO Range Indicator"

F_4E:definePositiveFloat("WSO_RANGE_RATE_NEEDLE", 2626, WSO_RANGE_INDICATOR, "Rate Needle")
F_4E:definePositiveFloat("WSO_RANGE_THOUSANDS_NEEDLE", 2741, WSO_RANGE_INDICATOR, "Thousands Arrow (Outer)")

-- Pilot Radar
local PILOT_RADAR = "PLT Radar"

F_4E:definePotentiometer("PLT_RADAR_SCALE_BRIGHT", RADAR_DEVICE_ID, 3030, 1202, { 0, 1 }, PILOT_RADAR, "Scale Brightness")
F_4E:definePotentiometer("PLT_RADAR_SCREEN_CONTRAST", RADAR_DEVICE_ID, 3028, 1203, { 0, 1 }, PILOT_RADAR, "Change Screen Contrast")
F_4E:definePotentiometer("PLT_RADAR_SCREEN_BRIGHT", RADAR_DEVICE_ID, 3029, 1206, { 0, 1 }, PILOT_RADAR, "Change Screen Brightness")
F_4E:definePotentiometer("PLT_RADAR_SCREEN_INTENSITY", RADAR_DEVICE_ID, 3066, 3040, { 0, 1 }, PILOT_RADAR, "Screen Intensity")

F_4E:defineToggleSwitch("PLT_RADAR_NIGHT_FILTER", RADAR_DEVICE_ID, 3068, 3039, PILOT_RADAR, "Screen Night Filter (Red)")

F_4E:define3PosTumb0To1("PLT_RADAR_SCREEN_MODE", RADAR_DEVICE_ID, 3031, 2599, PILOT_RADAR, "Select DSCG Screen Mode")

F_4E:defineIndicatorLight("PLT_RADAR_5", 2533, PILOT_RADAR, "5 Range Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RADAR_10", 2534, PILOT_RADAR, "10 Range Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RADAR_25", 2535, PILOT_RADAR, "25 Range Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RADAR_50", 2536, PILOT_RADAR, "50 Range Lamp (Green)")

F_4E:defineIndicatorLight("PLT_RADAR_IN_RANGE", 373, PILOT_RADAR, "In Range Lamp (Blue)")
F_4E:defineIndicatorLight("PLT_RADAR_HOLD_ALT", 2532, PILOT_RADAR, "Hold Alt Lamp (Blue)")

-- BDHI
-- local BDHI_DEVICE_ID = 53

-- WSO BDHI
local WSO_BDHI = "WSO BDHI"

F_4E:definePositiveFloat("WSO_BDHI_COMPASS_CARD", 949, WSO_BDHI, "Compass Card rotation")
F_4E:definePositiveFloat("WSO_BDHI_POINTER_1", 950, WSO_BDHI, "Pointer 1 orientation")
F_4E:definePositiveFloat("WSO_BDHI_POINTER_2", 951, WSO_BDHI, "Pointer 2 orientation")
F_4E:defineString("WSO_BDHI_RANGE", function(dev0)
	return drum_set(dev0, 2725, 954, 953, 952)
end, 4, WSO_BDHI, "BDHI Range")
F_4E:definePositiveFloat("WSO_BDHI_OFF_FLAG", 2627, WSO_BDHI, "Off Flag")

-- Compass System
local COMPASS_DEVICE_ID = 54

-- Pilot Compass
local PILOT_COMPASS = "PLT Compass"

F_4E:definePushButton("PLT_COMPASS_SET_HEADING_PRESS", COMPASS_DEVICE_ID, 3006, 1029, PILOT_COMPASS, "Set Compass Heading (Press)")
F_4E:definePotentiometer("PLT_COMPASS_SET_HEADING_ROTATE", COMPASS_DEVICE_ID, 3002, 956, { -1, 1 }, PILOT_COMPASS, "Set Compass Heading (Rotate)")
F_4E:defineMultipositionSwitch0To1("PLT_COMPASS_MODE_SYNC", COMPASS_DEVICE_ID, 3001, 955, 4, PILOT_COMPASS, "Set Compass Mode (hold to sync)")
F_4E:definePotentiometer("PLT_COMPASS_LATITUDE", COMPASS_DEVICE_ID, 3004, 958, { 0, 1 }, PILOT_COMPASS, "Set Compass Latitude")
F_4E:defineToggleSwitch("PLT_COMPASS_HEMISPHERE", COMPASS_DEVICE_ID, 3012, 960, PILOT_COMPASS, "Change Hemisphere")

F_4E:defineToggleSwitch("PLT_COMPASS_GYRO_MODE", COMPASS_DEVICE_ID, 3005, 366, PILOT_COMPASS, "Set Gyro Mode")

F_4E:definePositiveFloat("PLT_COMPASS_SYNC", 959, PILOT_COMPASS, "Compass Sync Indicator")

F_4E:definePositiveFloat("PLT_COMPASS_HEADING", 80, PILOT_COMPASS, "Compass Heading")
F_4E:defineFullRangeFloat("PLT_COMPASS_PITCH", 81, PILOT_COMPASS, "Compass Pitch")
F_4E:defineFullRangeFloat("PLT_COMPASS_BANK", 82, PILOT_COMPASS, "Compass Bank")

-- WSO Compass
local WSO_COMPASS = "WSO Compass"

-- yes, these are the same draw args as the pilot compass
F_4E:definePositiveFloat("WSO_COMPASS_HEADING", 80, WSO_COMPASS, "Compass Heading")
F_4E:defineFullRangeFloat("WSO_COMPASS_PITCH", 81, WSO_COMPASS, "Compass Pitch")
F_4E:defineFullRangeFloat("WSO_COMPASS_BANK", 82, WSO_COMPASS, "Compass Bank")

-- Electric System
local ELECTRICS_DEVICE_ID = 55

-- Pilot Electrical System
local PILOT_ELECTRICS = "PLT Electrical System"

F_4E:define3PosTumb("PLT_ELECTRICS_GENERATOR_L", ELECTRICS_DEVICE_ID, 3002, 971, PILOT_ELECTRICS, "Left Generator")
F_4E:define3PosTumb("PLT_ELECTRICS_GENERATOR_R", ELECTRICS_DEVICE_ID, 3003, 972, PILOT_ELECTRICS, "Right Generator")

-- WSO Electrical System
local WSO_ELECTRICS = "WSO Electrical System"

F_4E:defineToggleSwitch("WSO_ELECTRICS_BATTERY_BYPASS", ELECTRICS_DEVICE_ID, 3015, 1028, WSO_ELECTRICS, "Battery Bypass Switch")
F_4E:defineToggleSwitch("WSO_ELECTRICS_AUTOPILOT_GROUND_PWR", ELECTRICS_DEVICE_ID, 3001, 1027, WSO_ELECTRICS, "Autopilot Ground Power Switch")
F_4E:defineToggleSwitch("WSO_ELECTRICS_INSTRUMENT_GROUND_PWR", ELECTRICS_DEVICE_ID, 3004, 973, WSO_ELECTRICS, "Instrument Ground Power Switch")

-- Attitude Indicator (ARU-13A)
local ATTITUDE_INDICATOR_DEVICE_ID = 56

-- WSO Attitude Indicator
local WSO_ATTITUDE_INDICATOR = "WSO Attitude Indicator"

F_4E:definePotentiometer("WSO_ATTITUDE_INDICATOR_TRIM", ATTITUDE_INDICATOR_DEVICE_ID, 3001, 633, { 0, 1 }, WSO_ATTITUDE_INDICATOR, "Adjust Pitch")

F_4E:defineFullRangeFloat("WSO_ATTITUDE_INDICATOR_PITCH", 631, WSO_ATTITUDE_INDICATOR, "Pitch")
F_4E:defineFullRangeFloat("WSO_ATTITUDE_INDICATOR_ROLL", 632, WSO_ATTITUDE_INDICATOR, "Roll")
F_4E:defineFullRangeFloat("WSO_ATTITUDE_INDICATOR_ROLL_POINTER", 634, WSO_ATTITUDE_INDICATOR, "Roll Pointer")
F_4E:definePositiveFloat("WSO_ATTITUDE_INDICATOR_OFF_FLAG", 534, WSO_ATTITUDE_INDICATOR, "Off Flag")

-- Fuel
local FUEL_DEVICE_ID = 60

-- pilot fuel system
local PILOT_FUEL_PANEL = "PLT Fuel System"

F_4E:defineToggleSwitch("PLT_FUEL_WING_INTERNAL_FEED", FUEL_DEVICE_ID, 3004, 710, PILOT_FUEL_PANEL, "Internal Wing Tanks Feed")
F_4E:defineToggleSwitch("PLT_FUEL_REFUEL_SELECTOR_COVER", FUEL_DEVICE_ID, 3001, 705, PILOT_FUEL_PANEL, "Refuel Tank Selector Cover")
F_4E:defineToggleSwitch("PLT_FUEL_REFUEL_SELECTOR", FUEL_DEVICE_ID, 3002, 706, PILOT_FUEL_PANEL, "Select Tank to Refuel")
F_4E:defineToggleSwitch("PLT_FUEL_AIR_REFUEL", FUEL_DEVICE_ID, 3006, 712, PILOT_FUEL_PANEL, "Air Refuel Switch")
F_4E:defineToggleSwitch("PLT_FUEL_WING_FUEL_DUMP", FUEL_DEVICE_ID, 3003, 709, PILOT_FUEL_PANEL, "Wing Fuel Dump Selector")
F_4E:define3PosTumb("PLT_FUEL_EXTERNAL_TANKS_FEED", FUEL_DEVICE_ID, 3005, 711, PILOT_FUEL_PANEL, "External Tanks Feed")
F_4E:definePushButton("PLT_FUEL_BOOST_PUMP_L_CHECK", FUEL_DEVICE_ID, 3021, 725, PILOT_FUEL_PANEL, "Check Left Boost Pump")
F_4E:definePushButton("PLT_FUEL_BOOST_PUMP_R_CHECK", FUEL_DEVICE_ID, 3022, 726, PILOT_FUEL_PANEL, "Check Right Boost Pump")
F_4E:definePushButton("PLT_FUEL_FEED_TANK_CHECK", FUEL_DEVICE_ID, 3013, 2789, PILOT_FUEL_PANEL, "Check Engine-Feed Tank")

-- fuel totalizer
F_4E:definePositiveFloat("PLT_FUEL_GAUGE_TAPE", 723, PILOT_FUEL_PANEL, "Fuel Gauge Tape")
F_4E:defineString("PLT_FUEL_GAUGE_VALUE", function(dev0)
	local tens = drum_value(dev0, 719)
	local hundreds = drum_value(dev0, 720)
	local thousands = drum_value(dev0, 721)
	local ten_thousands = drum_value(dev0, 722)

	return string.format("%d%d%d%d", ten_thousands, thousands, hundreds, tens)
end, 4, PILOT_FUEL_PANEL, "Pilot Fuel Gauge Total Internal Fuel (x10)")

-- boost pump gauges
F_4E:definePositiveFloat("PLT_FUEL_BOOST_PUMP_L", 713, PILOT_FUEL_PANEL, "Left Fuel Boost Pump Pressure")
F_4E:definePositiveFloat("PLT_FUEL_BOOST_PUMP_R", 714, PILOT_FUEL_PANEL, "Right Fuel Boost Pump Pressure")

-- fuel flow gauges
F_4E:definePositiveFloat("PLT_FUEL_FLOW_L", 297, PILOT_FUEL_PANEL, "Left Engine Fuel Flow")
F_4E:definePositiveFloat("PLT_FUEL_FLOW_R", 298, PILOT_FUEL_PANEL, "Right Engine Fuel Flow")

F_4E:defineIndicatorLight("PLT_FUEL_AAR_READY", 2525, PILOT_FUEL_PANEL, "Aerial Refueling Ready Lamp (Green)")
F_4E:defineIndicatorLight("PLT_FUEL_AAR_EXT_L_FULL", 2526, PILOT_FUEL_PANEL, "Aerial Refueling Left Tank Full Lamp (Green)")
F_4E:defineIndicatorLight("PLT_FUEL_AAR_EXT_C_FULL", 2527, PILOT_FUEL_PANEL, "Aerial Refueling Center Tank Full (Green)")
F_4E:defineIndicatorLight("PLT_FUEL_AAR_EXT_R_FULL", 2528, PILOT_FUEL_PANEL, "Aerial Refueling Right Tank Full Lamp (Green)")
F_4E:defineIndicatorLight("PLT_FUEL_AAR_DISENGAGED", 2529, PILOT_FUEL_PANEL, "Aerial Refueling Disengaged Lamp (Green)")

-- ARBCS
local ARBCS_DEVICE_ID = 62

-- WSO ARBCS
local WSO_ARBCS = "WSO ARBCS"

F_4E:defineToggleSwitch("WSO_ARBCS_ACTIVATE", WEAPONS_DEVICE_ID, 3039, 1016, WSO_ARBCS, "ARBCS Activate")
F_4E:definePotentiometer("WSO_ARBCS_PULL_UP_TIMER", ARBCS_DEVICE_ID, 3001, 369, { 0, 1 }, WSO_ARBCS, "Set Bombing Pull-Up Timer (seconds)")
F_4E:definePotentiometer("WSO_ARBCS_RELEASE_TIMER", ARBCS_DEVICE_ID, 3002, 370, { 0, 1 }, WSO_ARBCS, "Set Bombing Release Timer (seconds)")
F_4E:definePotentiometer("WSO_ARBCS_LOW_ANGLE", ARBCS_DEVICE_ID, 3003, 351, { 0, 1 }, WSO_ARBCS, "Set LABS Low Angle")
F_4E:definePotentiometer("WSO_ARBCS_HIGH_ANGLE", ARBCS_DEVICE_ID, 3004, 352, { 0, 1 }, WSO_ARBCS, "Set LABS High Angle")

F_4E:defineString("WSO_ARBCS_LOW_ANGLE_DISPLAY", function(dev0)
	return drum_set(dev0, 355, 354, 353)
end, 3, WSO_ARBCS, "Low Angle Display")
F_4E:defineString("WSO_ARBCS_HIGH_ANGLE_DISPLAY", function(dev0)
	return drum_set(dev0, 359, 358, 357, 356)
end, 4, WSO_ARBCS, "High Angle Display")
F_4E:defineString("WSO_ARBCS_PULL_UP_DISPLAY", function(dev0)
	return drum_set(dev0, 362, 361, 360)
end, 3, WSO_ARBCS, "Pull-up Timer Display")
F_4E:defineString("WSO_ARBCS_RELEASE_DISPLAY", function(dev0)
	return drum_set(dev0, 365, 364, 363)
end, 3, WSO_ARBCS, "Release Timer Display")

-- Aircraft Effects
-- local AIRCRAFT_EFFECTS_DEVICE_ID = 63

-- Pilot Shake Effects
local PILOT_SHAKE_EFFECTS = "PLT Shake Effects"

F_4E:defineFullRangeFloat("PLT_SHAKE_RANGE_INDICATOR", 3000, PILOT_SHAKE_EFFECTS, "Range Indicator Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_MIRRORS", 3002, PILOT_SHAKE_EFFECTS, "Mirror Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_LAMP_L", 3003, PILOT_SHAKE_EFFECTS, "Glareshield Lamp Shake (Left)")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_L", 3004, PILOT_SHAKE_EFFECTS, "Glareshield Shake (Left)")
F_4E:defineFullRangeFloat("PLT_SHAKE_WEAPON_LIGHTS", 3005, PILOT_SHAKE_EFFECTS, "Weapon Light Stack Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_LAMPS_R", 3006, PILOT_SHAKE_EFFECTS, "Lamp Shake (Right)")
F_4E:defineFullRangeFloat("PLT_SHAKE_RWR", 3007, PILOT_SHAKE_EFFECTS, "RWR Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_JETTISON_HANDLE", 3008, PILOT_SHAKE_EFFECTS, "Jettison Handle Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_CANOPY_HANDLE", 3009, PILOT_SHAKE_EFFECTS, "Canopy Handle Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_BRAKE_HANDLE", 3010, PILOT_SHAKE_EFFECTS, "Brake Handle Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_HUD_STRING_L", 3011, PILOT_SHAKE_EFFECTS, "HUD String Shake (Left)")
F_4E:defineFullRangeFloat("PLT_SHAKE_HUD_STRING_R", 3012, PILOT_SHAKE_EFFECTS, "HUD String Shake (Right)")
F_4E:defineFullRangeFloat("PLT_SHAKE_HUD_LAMPS_R", 3013, PILOT_SHAKE_EFFECTS, "HUD Lamps Shake (Right)")
F_4E:defineFullRangeFloat("PLT_SHAKE_HUD_LAMPS_L", 3014, PILOT_SHAKE_EFFECTS, "HUD Lamps Shake (Left)")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_R", 3015, PILOT_SHAKE_EFFECTS, "Glareshield Shake (Right)")
F_4E:defineFullRangeFloat("PLT_SHAKE_SHOOT_TOP", 3016, PILOT_SHAKE_EFFECTS, "Shoot Light Shake (Top)")
F_4E:defineFullRangeFloat("PLT_SHAKE_PULL_UP", 3017, PILOT_SHAKE_EFFECTS, "Pull-up Lamp Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_ECS_L", 3018, PILOT_SHAKE_EFFECTS, "Air Duct Shake (Left)")
F_4E:defineFullRangeFloat("PLT_SHAKE_ECS_R", 3019, PILOT_SHAKE_EFFECTS, "Air Duct Shake (Right)")
F_4E:defineFullRangeFloat("PLT_SHAKE_PAPER_R", 3020, PILOT_SHAKE_EFFECTS, "Paper Shake (Right)")
F_4E:defineFullRangeFloat("PLT_SHAKE_PAPER_L", 3021, PILOT_SHAKE_EFFECTS, "Paper Shake (Left)")
F_4E:defineFullRangeFloat("PLT_SHAKE_EJECTION_HANDLES", 3022, PILOT_SHAKE_EFFECTS, "Ejection Handles Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_SYNC_SWITCH", 3023, PILOT_SHAKE_EFFECTS, "Reference System Sync Switch Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_GEN_WARN_LIGHTS", 3024, PILOT_SHAKE_EFFECTS, "Generator Warning Light Stack Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_CLOCK", 3025, PILOT_SHAKE_EFFECTS, "Clock Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_ESCAPE_TOOL", 3028, PILOT_SHAKE_EFFECTS, "Escape Tool Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_ESCAPE_TOOL_RING", 3029, PILOT_SHAKE_EFFECTS, "Escape Tool Ring Shake (Small)")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_LR", 3030, PILOT_SHAKE_EFFECTS, "Glareshield Left/Right Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_UD", 3031, PILOT_SHAKE_EFFECTS, "Glareshield Up/Down Shake (Small)")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_UD_2", 3032, PILOT_SHAKE_EFFECTS, "Glareshield Up/Down Shake (Large)")
F_4E:defineFullRangeFloat("PLT_SHAKE_GLARESHIELD_TWIST", 3033, PILOT_SHAKE_EFFECTS, "Glareshield Twist Shake")
F_4E:defineFullRangeFloat("PLT_SHAKE_ESCAPE_TOOL_RING_2", 3034, PILOT_SHAKE_EFFECTS, "Escape Tool Ring Shake (Large)")

-- Target Designator System (AN-ASQ-153)
local TARGET_DESIGNATOR_DEVICE_ID = 64

-- Target Designator Set Control
local WSO_TARGET_DESIGNATOR_SET_CONTROL = "WSO Target Designator Set Control"

F_4E:definePotentiometer("WSO_TGT_DESIGNATOR_RETICLE_BRIGHTNESS", TARGET_DESIGNATOR_DEVICE_ID, 3001, 2733, { 0, 1 }, WSO_TARGET_DESIGNATOR_SET_CONTROL, "TV Reticle Brightness (black to white)")
F_4E:definePotentiometer("WSO_TGT_DESIGNATOR_BORESIGHT_AZIMUTH", TARGET_DESIGNATOR_DEVICE_ID, 3002, 2734, { 0, 1 }, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Boresight Azimuth (12-Vis)")
F_4E:definePotentiometer("WSO_TGT_DESIGNATOR_BORESIGHT_ELEVATION", TARGET_DESIGNATOR_DEVICE_ID, 3003, 2735, { 0, 1 }, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Boresight Elevation (12-Vis)")
F_4E:definePotentiometer("WSO_TGT_DESIGNATOR_BORESIGHT_ROLL", TARGET_DESIGNATOR_DEVICE_ID, 3004, 2736, { 0, 1 }, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Boresight Roll (9-Vis)")
F_4E:definePushButton("WSO_TGT_DESIGNATOR_STOW", TARGET_DESIGNATOR_DEVICE_ID, 3005, 2754, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Stow/Unstow TGP")
F_4E:defineToggleSwitch("WSO_TGT_DESIGNATOR_LASER_READY", TARGET_DESIGNATOR_DEVICE_ID, 3006, 2755, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Arm/Disarm Laser")
F_4E:definePushButton("WSO_TGT_DESIGNATOR_POWER_ON", TARGET_DESIGNATOR_DEVICE_ID, 3007, 2756, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Power On/Off TGP")
F_4E:definePushButton("WSO_TGT_DESIGNATOR_BIT", TARGET_DESIGNATOR_DEVICE_ID, 3008, 2737, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Next BIT")
F_4E:definePotentiometer("WSO_TGT_DESIGNATOR_LIGHT_BRIGHTNESS", TARGET_DESIGNATOR_DEVICE_ID, 3009, 2738, { 0, 1 }, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Panel Light Brightness")
F_4E:definePushButton("WSO_TGT_DESIGNATOR_REJECT_OVERRIDE", TARGET_DESIGNATOR_DEVICE_ID, 3010, 2739, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Reject/Override Range")
F_4E:define3PosTumb0To1("WSO_TGT_DESIGNATOR_ACQUISITION", TARGET_DESIGNATOR_DEVICE_ID, 3011, 2740, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Acquisition Mode")
F_4E:defineToggleSwitch("WSO_TGT_DESIGNATOR_WRCS_OUT", TARGET_DESIGNATOR_DEVICE_ID, 3012, 2757, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Enable/Disable WRCS integration")
F_4E:defineToggleSwitch("WSO_TGT_DESIGNATOR_GO_MALF", TARGET_DESIGNATOR_DEVICE_ID, 3013, 2758, WSO_TARGET_DESIGNATOR_SET_CONTROL, "(no function)")
F_4E:defineToggleSwitch("WSO_TGT_DESIGNATOR_INS_OUT", TARGET_DESIGNATOR_DEVICE_ID, 3014, 2759, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Enable/Disable INS integration")

F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_STOW", 2715, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator Stow button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_LASER_READY", 2716, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator Laser Ready button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_POWER_ON", 2717, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator Power On button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_WRCS_OUT", 2718, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator WRCS button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_GO", 2719, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator GO button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_MALF", 2720, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator MALF button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_OVHT", 2721, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator Overheat button lamp")
F_4E:defineIndicatorLight("WSO_TGT_DESIGNATOR_LIGHT_INS_OUT", 2722, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Target Designator INS Out button lamp")

F_4E:defineString("WSO_TGT_DESIGNATOR_BIT_DISPLAY", function(_)
	return Module.parse_indication(7)["bit_foreground"]
end, 1, WSO_TARGET_DESIGNATOR_SET_CONTROL, "Bit Display")

-- Laser Coder Control
local WSO_LASER_CODE_PANEL = "WSO Laser Code Panel"

F_4E:definePushButton("WSO_LASER_CODE_ENTER", TARGET_DESIGNATOR_DEVICE_ID, 3015, 2504, WSO_LASER_CODE_PANEL, "Enter Laser Code")
F_4E:definePushButton("WSO_LASER_CODE_SET_THOUSANDS", TARGET_DESIGNATOR_DEVICE_ID, 3019, 2500, WSO_LASER_CODE_PANEL, "Next Laser Code (thousands)")
F_4E:definePushButton("WSO_LASER_CODE_SET_HUNDREDS", TARGET_DESIGNATOR_DEVICE_ID, 3018, 2501, WSO_LASER_CODE_PANEL, "Next Laser Code (hundreds)")
F_4E:definePushButton("WSO_LASER_CODE_SET_TENS", TARGET_DESIGNATOR_DEVICE_ID, 3017, 2502, WSO_LASER_CODE_PANEL, "Next Laser Code (tens)")
F_4E:definePushButton("WSO_LASER_CODE_SET_ONES", TARGET_DESIGNATOR_DEVICE_ID, 3016, 2503, WSO_LASER_CODE_PANEL, "Next Laser Code (ones)")
F_4E:defineIndicatorLight("WSO_LIGHT_LASER_NO_GO", 2697, WSO_LASER_CODE_PANEL, "Laser No Go button lamp")
F_4E:defineIntegerFromGetter("WSO_LASER_CODE_ONES", function(dev0)
	return drum_value(dev0, 2020)
end, 9, WSO_LASER_CODE_PANEL, "Laser Code (ones)")
F_4E:defineIntegerFromGetter("WSO_LASER_CODE_TENS", function(dev0)
	return drum_value(dev0, 2021)
end, 9, WSO_LASER_CODE_PANEL, "Laser Code (tens)")
F_4E:defineIntegerFromGetter("WSO_LASER_CODE_HUNDREDS", function(dev0)
	return drum_value(dev0, 2022)
end, 9, WSO_LASER_CODE_PANEL, "Laser Code (hundreds)")
F_4E:defineIntegerFromGetter("WSO_LASER_CODE_THOUSANDS", function(dev0)
	return drum_value(dev0, 2023)
end, 9, WSO_LASER_CODE_PANEL, "Laser Code (thousands)")
F_4E:defineString("WSO_LASER_CODE", function(dev0)
	return drum_set(dev0, 2023, 2022, 2021, 2020)
end, 4, WSO_LASER_CODE_PANEL, "Laser Code")

-- Range Indicator
local PLT_RANGE_INDICATOR_PANEL = "PLT Range Indicator Panel"

F_4E:definePushButton("PLT_RANGE_INDICATOR_TEST", TARGET_DESIGNATOR_DEVICE_ID, 3020, 2764, PLT_RANGE_INDICATOR_PANEL, "Test Display")
F_4E:definePotentiometer("PLT_RANGE_INDICATOR_BRIGHTNESS", TARGET_DESIGNATOR_DEVICE_ID, 3021, 1211, { 0, 1 }, PLT_RANGE_INDICATOR_PANEL, "Display Brightness")
F_4E:definePotentiometer("PLT_RANGE_INDICATOR_DESIRED_RANGE", TARGET_DESIGNATOR_DEVICE_ID, 3023, 1212, { 0, 1 }, PLT_RANGE_INDICATOR_PANEL, "Desired Release Range")
F_4E:define3PosTumb0To1("PLT_RANGE_INDICATOR_MODE", TARGET_DESIGNATOR_DEVICE_ID, 3022, 1210, PLT_RANGE_INDICATOR_PANEL, "Range Mode")

F_4E:defineString("PLT_RANGE_INDICATOR_RANGE", function(_)
	return Module.parse_indication(8)["range_indicator_foreground"]
end, 3, PLT_RANGE_INDICATOR_PANEL, "Range")

-- WSO Front Panel
local WSO_FRONT_PANEL_DEVICE_ID = 65

-- WSO Front Panel
local WSO_FRONT_PANEL = "WSO Front Panel"

F_4E:defineToggleSwitch("WSO_FRONT_PANEL_GLARE_SHIELD", WSO_FRONT_PANEL_DEVICE_ID, 3006, 3050, WSO_FRONT_PANEL, "Show/Hide Screen Glare Shield")
F_4E:defineToggleSwitch("WSO_FRONT_PANEL_SHOW_STICK", WSO_FRONT_PANEL_DEVICE_ID, 3002, 2841, WSO_FRONT_PANEL, "Hide/Show Stick")
F_4E:definePushButton("WSO_FRONT_PANEL_WEAPON_ASQ_153", WSO_FRONT_PANEL_DEVICE_ID, 3001, 2760, WSO_FRONT_PANEL, "Select Video (Maverick or TGP)")

F_4E:defineIndicatorLight("WSO_FRONT_PANEL_WEAPON_LIGHT", 2691, WSO_FRONT_PANEL, "Select Video Weapon Lamp (White)")
F_4E:defineIndicatorLight("WSO_FRONT_PANEL_ASQ_153_LIGHT", 2692, WSO_FRONT_PANEL, "Select Video ASQ-153 Lamp (White)")

-- RHAW
local RHAW_DEVICE_ID = 67

-- Pilot RWR
local PILOT_RWR = "PLT RWR"

F_4E:definePotentiometer("PLT_RWR_SCREEN_BRIGHTNESS", RHAW_DEVICE_ID, 3049, 975, { 0, 1 }, PILOT_RWR, "Screen Brightness")
F_4E:definePotentiometer("PLT_RWR_AUDIO_VOLUME", RHAW_DEVICE_ID, 3002, 977, { 0, 1 }, PILOT_RWR, "RWR Audio Volume")
F_4E:definePotentiometer("PLT_RWR_LIGHT_BRIGHTNESS", RHAW_DEVICE_ID, 3001, 976, { 0, 1 }, PILOT_RWR, "Light Brightness")
F_4E:definePushButton("PLT_RWR_PRIORITY_MODE", RHAW_DEVICE_ID, 3003, 381, PILOT_RWR, "Priority/Open Mode")
F_4E:definePushButton("PLT_RWR_SEARCH", RHAW_DEVICE_ID, 3004, 382, PILOT_RWR, "Search")
F_4E:definePushButton("PLT_RWR_HANDOFF", RHAW_DEVICE_ID, 3005, 383, PILOT_RWR, "Handoff")
F_4E:definePushButton("PLT_RWR_MISSILE_LAUNCH", RHAW_DEVICE_ID, 3006, 384, PILOT_RWR, "Missile Launch (no function)")
F_4E:definePushButton("PLT_RWR_LOW_ALTITUDE_MODE", RHAW_DEVICE_ID, 3007, 385, PILOT_RWR, "Low/Altitude Mode")
F_4E:definePushButton("PLT_RWR_TARGET_SEPARATION", RHAW_DEVICE_ID, 3008, 386, PILOT_RWR, "Target Separation")
F_4E:definePushButton("PLT_RWR_SYSTEM_TEST", RHAW_DEVICE_ID, 3009, 387, PILOT_RWR, "System Test")
F_4E:definePushButton("PLT_RWR_UNKNOWN", RHAW_DEVICE_ID, 3010, 388, PILOT_RWR, "Unknown")
F_4E:definePushButton("PLT_RWR_ACTIVITY_POWER", RHAW_DEVICE_ID, 3011, 389, PILOT_RWR, "Activity Power (no function)")
F_4E:definePushButton("PLT_RWR_SYSTEM_POWER", RHAW_DEVICE_ID, 3012, 390, PILOT_RWR, "System Power")

F_4E:definePotentiometer("PLT_RWR_MISSILE_LAUNCH_VOLUME", RHAW_DEVICE_ID, 3055, 1373, { 0, 1 }, PILOT_RWR, "RWR Missile Launch Audio Volume")

F_4E:defineIndicatorLight("PLT_RWR_PRIORITY_MODE_LIGHT_TOP", 2537, PILOT_RWR, "Priority Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_PRIORITY_MODE_LIGHT_BOT", 2742, PILOT_RWR, "Open Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_SEARCH_LIGHT_TOP", 2538, PILOT_RWR, "Search Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_SEARCH_LIGHT_BOT", 2743, PILOT_RWR, "Lower Search Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_HANDOFF_LIGHT_TOP", 2539, PILOT_RWR, "Handoff Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_HANDOFF_LIGHT_BOT", 2744, PILOT_RWR, "H Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_MISSILE_LAUNCH_LIGHT", 2540, PILOT_RWR, "Missile Launch Lamp (Red)")
F_4E:defineIndicatorLight("PLT_RWR_LOW_ALTITUDE_MODE_LIGHT", 2541, PILOT_RWR, "Low/Altitude Mode Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_TARGET_SEPARATION_LIGHT_TOP", 2542, PILOT_RWR, "Upper Target Separation Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_TARGET_SEPARATION_LIGHT_BOT", 2745, PILOT_RWR, "Lower Target Separation Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_SYSTEM_TEST_LIGHT", 2543, PILOT_RWR, "System Test Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_UNKNOWN_LIGHT_TOP", 2544, PILOT_RWR, "U Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_UNKNOWN_LIGHT_BOT", 2746, PILOT_RWR, "Unknown Lamp (Green)")
F_4E:defineIndicatorLight("PLT_RWR_ACTIVITY_POWER_LIGHT_TOP", 2545, PILOT_RWR, "Activity Lamp (Red)")
F_4E:defineIndicatorLight("PLT_RWR_ACTIVITY_POWER_LIGHT_BOT", 2747, PILOT_RWR, "Power Lamp (Red)")
F_4E:defineIndicatorLight("PLT_RWR_SYSTEM_POWER_LIGHT", 2546, PILOT_RWR, "System Power Lamp (Green)")

-- WSO RWR
local WSO_RWR = "WSO RWR"

F_4E:definePotentiometer("WSO_RWR_SCREEN_BRIGHTNESS", RHAW_DEVICE_ID, 3051, 2809, { 0, 1 }, WSO_RWR, "Screen Brightness")
F_4E:definePotentiometer("WSO_RWR_AUDIO_VOLUME", RHAW_DEVICE_ID, 3025, 2624, { 0, 1 }, WSO_RWR, "RWR Audio Volume")
F_4E:definePotentiometer("WSO_RWR_LIGHT_BRIGHTNESS", RHAW_DEVICE_ID, 3026, 2625, { 0, 1 }, WSO_RWR, "Light Brightness")
F_4E:definePushButton("WSO_RWR_PRIORITY_MODE", RHAW_DEVICE_ID, 3013, 2824, WSO_RWR, "Priority/Open Mode")
F_4E:definePushButton("WSO_RWR_SEARCH", RHAW_DEVICE_ID, 3014, 2825, WSO_RWR, "Search")
F_4E:definePushButton("WSO_RWR_HANDOFF", RHAW_DEVICE_ID, 3015, 2826, WSO_RWR, "Handoff")
F_4E:definePushButton("WSO_RWR_MISSILE_LAUNCH", RHAW_DEVICE_ID, 3016, 2827, WSO_RWR, "Missile Launch (no function)")
F_4E:definePushButton("WSO_RWR_LOW_ALTITUDE_MODE", RHAW_DEVICE_ID, 3017, 2828, WSO_RWR, "Low/Altitude Mode")
F_4E:definePushButton("WSO_RWR_TARGET_SEPARATION", RHAW_DEVICE_ID, 3018, 2829, WSO_RWR, "Target Separation")
F_4E:definePushButton("WSO_RWR_SYSTEM_TEST", RHAW_DEVICE_ID, 3019, 2830, WSO_RWR, "System Test")
F_4E:definePushButton("WSO_RWR_UNKNOWN", RHAW_DEVICE_ID, 3020, 2831, WSO_RWR, "Unknown")
F_4E:definePushButton("WSO_RWR_ACTIVITY_POWER", RHAW_DEVICE_ID, 3021, 2832, WSO_RWR, "Activity Power (no function)")
F_4E:definePushButton("WSO_RWR_SYSTEM_POWER", RHAW_DEVICE_ID, 3022, 2833, WSO_RWR, "System Power")

F_4E:definePotentiometer("WSO_RWR_MISSILE_LAUNCH_VOLUME", RHAW_DEVICE_ID, 3056, 2810, { 0, 1 }, WSO_RWR, "RWR Missile Launch Audio Volume")

F_4E:defineIndicatorLight("WSO_RWR_PRIORITY_MODE_LIGHT_TOP", 2678, WSO_RWR, "Priority Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_PRIORITY_MODE_LIGHT_BOT", 2748, WSO_RWR, "Open Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_SEARCH_LIGHT_TOP", 2679, WSO_RWR, "Search Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_SEARCH_LIGHT_BOT", 2749, WSO_RWR, "Lower Search Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_HANDOFF_LIGHT_TOP", 2680, WSO_RWR, "Handoff Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_HANDOFF_LIGHT_BOT", 2750, WSO_RWR, "H Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_MISSILE_LAUNCH_LIGHT", 2681, WSO_RWR, "Missile Launch Lamp (Red)")
F_4E:defineIndicatorLight("WSO_RWR_LOW_ALTITUDE_MODE_LIGHT", 2682, WSO_RWR, "Low/Altitude Mode Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_TARGET_SEPARATION_LIGHT_TOP", 2683, WSO_RWR, "Upper Target Separation Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_TARGET_SEPARATION_LIGHT_BOT", 2751, WSO_RWR, "Lower Target Separation Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_SYSTEM_TEST_LIGHT", 2684, WSO_RWR, "System Test Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_UNKNOWN_LIGHT_TOP", 2685, WSO_RWR, "U Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_UNKNOWN_LIGHT_BOT", 2752, WSO_RWR, "Unknown Lamp (Green)")
F_4E:defineIndicatorLight("WSO_RWR_ACTIVITY_POWER_LIGHT_TOP", 2686, WSO_RWR, "Activity Lamp (Red)")
F_4E:defineIndicatorLight("WSO_RWR_ACTIVITY_POWER_LIGHT_BOT", 2753, WSO_RWR, "Power Lamp (Red)")
F_4E:defineIndicatorLight("WSO_RWR_SYSTEM_POWER_LIGHT", 2687, WSO_RWR, "System Power Lamp (Green)")

-- IFF Interrogator (AN-APX-80A)
local IFF_INTERROGATOR_DEVICE_ID = 68

-- wso iff panel
local WSO_IFF_PANEL = "WSO IFF Panel"

local iff_ones = 0
local iff_tens = 0
local iff_hundreds = 0
local iff_thousands = 0
local iff_code = ""

-- WSO IFF display
F_4E:addExportHook(function(dev0)
	iff_ones = drum_value(dev0, 2000, false, 8)
	iff_tens = drum_value(dev0, 2001, false, 8)
	iff_hundreds = drum_value(dev0, 2002, false, 8)
	iff_thousands = drum_value(dev0, 2003, false, 8)
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

F_4E:definePushButton("WSO_IFF_CHALLENGE_TEST_BUTTON", IFF_INTERROGATOR_DEVICE_ID, 3015, 2646, WSO_IFF_PANEL, "Challenge Light (push to test)")
F_4E:definePotentiometer("WSO_IFF_CHALLENGE_DIM", IFF_INTERROGATOR_DEVICE_ID, 3016, 2811, { 0, 1 }, WSO_IFF_PANEL, "Challenge Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_IFF_CHALLENGE_LIGHT", 2695, WSO_IFF_PANEL, "IFF Challenge Light (Blue)")

F_4E:defineSpringloaded3PosTumb("WSO_IFF_TEST_CHALLENGE", IFF_INTERROGATOR_DEVICE_ID, 3013, 2645, WSO_IFF_PANEL, "Test/Challenge Code Switch")

F_4E:reserveIntValue(1) -- Anti-Jam, not yet implemented

F_4E:definePushButton("WSO_IFF_COMBAT_TREE_CHALLENGE_TEST_BUTTON", IFF_INTERROGATOR_DEVICE_ID, 3018, 2640, WSO_IFF_PANEL, "Combat-Tree Challenge Light (push to test)")
F_4E:definePotentiometer("WSO_IFF_COMBAT_TREE_CHALLENGE_DIM", IFF_INTERROGATOR_DEVICE_ID, 3019, 2812, { 0, 1 }, WSO_IFF_PANEL, "Combat-Tree Challenge Light (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_IFF_COMBAT_TREE_CHALLENGE_TEST_LIGHT", 2696, WSO_IFF_PANEL, "Combat-Tree Challenge Light (Blue)")

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

-- Pilot VOR/ILS
local PILOT_VOR_ILS = "PLT VOR/ILS"

F_4E:definePushButton("PLT_VOR_ILS_TEST", VOR_ILS_DEVICE_ID, 3001, 1513, PILOT_VOR_ILS, "Test VOR/ILS System")
F_4E:definePotentiometer("PLT_VOR_ILS_VOLUME", VOR_ILS_DEVICE_ID, 3002, 1511, { 0, 1 }, PILOT_VOR_ILS, "Change VOR/ILS Volume")
F_4E:definePotentiometer("PLT_VOR_ILS_MARKER_VOLUME", VOR_ILS_DEVICE_ID, 3005, 1512, { 0, 1 }, PILOT_VOR_ILS, "Change Marker-Beacon Volume")
F_4E:defineTumb("PLT_VOR_ILS_FREQUENCY_HUNDREDS", VOR_ILS_DEVICE_ID, 3003, 1514, 1 / 10, { 0, 0.9 }, nil, true, PILOT_VOR_ILS, "Set ILS Frequency (hundreds)")
F_4E:defineTumb("PLT_VOR_ILS_FREQUENCY_DECIMALS", VOR_ILS_DEVICE_ID, 3004, 1515, 1 / 20, { 0, 0.95 }, nil, true, PILOT_VOR_ILS, "Set ILS Frequency (decimals)")

F_4E:defineString("PLT_VOR_ILS_FREQUENCY", function(dev0)
	local hundreds_frequency = drum_value(dev0, 1452) + 108 -- 108-117
	local decimal_frequency = drum_value(dev0, 1455, false, 20) * 5 -- 00-95
	return string.format("%03d.%02d", hundreds_frequency, decimal_frequency)
end, 6, PILOT_VOR_ILS, "VOR/ILS Frequency")

F_4E:definePushButton("PLT_VOR_ILS_MARKER_TEST", VOR_ILS_DEVICE_ID, 3010, 2798, PILOT_VOR_ILS, "Marker-Beacon Lamp (push to test)")
F_4E:definePotentiometer("PLT_VOR_ILS_MARKER_DIM", VOR_ILS_DEVICE_ID, 3011, 2797, { 0, 1 }, PILOT_VOR_ILS, "Marker-Beacon Lamp (rotate to dim)")
F_4E:defineDimmableIndicatorLight("PLT_VOR_ILS_MARKER_LIGHT", 693, PILOT_VOR_ILS, "Marker Beacon Lamp (Red)")

-- WSO VOR/ILS
local WSO_VOR_ILS = "WSO VOR/ILS"

F_4E:definePotentiometer("WSO_VOR_ILS_VOLUME", VOR_ILS_DEVICE_ID, 3007, 2521, { 0, 1 }, WSO_VOR_ILS, "Change VOR/ILS Volume")
F_4E:definePotentiometer("WSO_VOR_ILS_MARKER_VOLUME", VOR_ILS_DEVICE_ID, 3006, 2522, { 0, 1 }, WSO_VOR_ILS, "Change Marker-Beacon Volume")

F_4E:definePushButton("WSO_VOR_ILS_MARKER_TEST", VOR_ILS_DEVICE_ID, 3008, 2620, WSO_VOR_ILS, "Marker-Beacon Lamp (push to test)")
F_4E:definePotentiometer("WSO_VOR_ILS_MARKER_DIM", VOR_ILS_DEVICE_ID, 3009, 2806, { 0, 1 }, WSO_VOR_ILS, "Marker-Beacon Lamp (rotate to dim)")
F_4E:defineDimmableIndicatorLight("WSO_VOR_ILS_MARKER_LIGHT", 2674, WSO_VOR_ILS, "Marker Beacon Lamp (Red)")

-- Ejection Seat
local EJECTION_SEAT_DEVICE_ID = 71

-- Pilot Ejection Seat
local PILOT_EJECTION_SEAT = "PLT Ejection Seat"

F_4E:defineToggleSwitch("PLT_EJECT_SIGNAL", EJECTION_SEAT_DEVICE_ID, 3002, 2834, PILOT_EJECTION_SEAT, "Signal Ejection To WSO")
F_4E:defineIndicatorLight("PLT_EJECT_LIGHT", 2835, PILOT_EJECTION_SEAT, "Eject Lamp (Red)")
F_4E:defineInputOnlyPushButton("PLT_EJECT_INSTANT", EJECTION_SEAT_DEVICE_ID, 3005, PILOT_EJECTION_SEAT, "Eject (Single Press)") -- draw arg 0 - no output

-- WSO Ejection Seat
local WSO_EJECTION_SEAT = "WSO Ejection Seat"

F_4E:defineToggleSwitch("WSO_EJECT_SELECTOR", EJECTION_SEAT_DEVICE_ID, 3001, 995, WSO_EJECTION_SEAT, "Ejection Command Selector (vert: WSO, horz: Both)")
F_4E:definePushButton("WSO_EJECT_LIGHT_TEST", EJECTION_SEAT_DEVICE_ID, 3003, 2836, WSO_EJECTION_SEAT, "Eject Light (push to test)")
F_4E:defineIndicatorLight("WSO_EJECT_LIGHT", 2837, WSO_EJECTION_SEAT, "Eject Lamp (Red)")
F_4E:defineInputOnlyPushButton("WSO_EJECT_INSTANT", EJECTION_SEAT_DEVICE_ID, 3007, WSO_EJECTION_SEAT, "Eject (Single Press)") -- draw arg 0 - no output

-- Interior Lights
local INTERIOR_LIGHTS_DEVICE_ID = 72

-- Pilot Interior Lights
local PILOT_INTERIOR_LIGHTS = "PLT Interior Lights"

F_4E:definePotentiometer("PLT_INT_LIGHT_INSTRUMENT_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3001, 979, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change Flight Instrument Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_AOA_INDICATOR_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3003, 1360, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change AoA Indicator Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_HSI_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3004, 1361, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change HSI Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_VVI_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3005, 1362, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change VVI Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_SPEED_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3006, 1363, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change Speed Indicator Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_ADI_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3007, 1364, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change ADI Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_ALT_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3008, 1365, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change Altimeter Brightness")

F_4E:defineToggleSwitch("PLT_INT_LIGHT_FLOOD_WHITE_TOGGLE", INTERIOR_LIGHTS_DEVICE_ID, 3009, 1350, PILOT_INTERIOR_LIGHTS, "Toggle White Floodlight")
F_4E:definePotentiometer("PLT_INT_LIGHT_INSTRUMENT_PANEL_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3010, 1352, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change Instrument Panel Light Brightness")
F_4E:define3PosTumb0To1("PLT_INT_LIGHT_FLOOD_RED_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3011, 1351, PILOT_INTERIOR_LIGHTS, "Set Console Floodlight (Red) Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_CONSOLE_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3012, 1353, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change Console Light Brightness")

F_4E:define3PosTumb0To1("PLT_INT_LIGHT_FLOOD_INST_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3013, 1370, PILOT_INTERIOR_LIGHTS, "Set Instrument Floodlight (Red) Brightness (also WSO)")

F_4E:definePotentiometer("PLT_INT_LIGHT_SAI_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3039, 2860, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change Standby Attitude Indicator Brightness")
F_4E:definePotentiometer("PLT_INT_LIGHT_AOA_INDEXER_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3002, 1369, { 0, 1 }, PILOT_INTERIOR_LIGHTS, "Change AoA Indexer Brightness")

F_4E:definePositiveFloat("PLT_INT_LIGHT_INDICATORS", 2889, PILOT_INTERIOR_LIGHTS, "All Indicator Lamp Brightness")
F_4E:definePositiveFloat("PLT_INT_LIGHT_AOA_INDICATOR", 2868, PILOT_INTERIOR_LIGHTS, "AoA Indicator Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_HSI", 2869, PILOT_INTERIOR_LIGHTS, "HSI Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_VVI", 2870, PILOT_INTERIOR_LIGHTS, "VVI Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_SPEED", 2871, PILOT_INTERIOR_LIGHTS, "Airspeed Indicator Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_ADI", 2872, PILOT_INTERIOR_LIGHTS, "ADI Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_ALT", 2873, PILOT_INTERIOR_LIGHTS, "Altimeter Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_SAI", 2876, PILOT_INTERIOR_LIGHTS, "Emergency Attitude Indicator Edge Light")
F_4E:definePositiveFloat("PLT_INT_LIGHT_STANDBY_COMPASS", 2881, PILOT_INTERIOR_LIGHTS, "Standby Compass Light")

F_4E:defineIndicatorLight("PLT_INT_LIGHT_FLOOD_WHITE", 2708, PILOT_INTERIOR_LIGHTS, "White Floodlight On/Off")
F_4E:definePositiveFloat("PLT_INT_LIGHT_FLOOD_RED", 2709, PILOT_INTERIOR_LIGHTS, "Red Floodlight Brightness")
F_4E:definePositiveFloat("PLT_INT_LIGHT_INSTRUMENT_PANEL", 2710, PILOT_INTERIOR_LIGHTS, "Instrument Panel Light Brightness")
F_4E:definePositiveFloat("PLT_INT_LIGHT_CONSOLE", 2866, PILOT_INTERIOR_LIGHTS, "Console Light Brightness")

F_4E:definePositiveFloat("PLT_INT_LIGHT_WEAPON_SELECTOR", 2846, PILOT_INTERIOR_LIGHTS, "Weapon Selector Lamp Brightness")

-- WSO Interior Lights
local WSO_INTERIOR_LIGHTS = "WSO Interior Lights"

F_4E:defineToggleSwitch("WSO_INT_LIGHT_FLOOD_WHITE_TOGGLE", INTERIOR_LIGHTS_DEVICE_ID, 3014, 2510, WSO_INTERIOR_LIGHTS, "Toggle White Floodlight")
F_4E:defineToggleSwitch("WSO_INT_LIGHT_STANDBY_COMPASS_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3015, 2511, WSO_INTERIOR_LIGHTS, "Toggle Standby Compass Light")
F_4E:define3PosTumb0To1("WSO_INT_LIGHT_FLOOD_RED_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3016, 2512, WSO_INTERIOR_LIGHTS, "Set Console Floodlight (Red) Brightness")
F_4E:definePotentiometer("WSO_INT_LIGHT_AOA_INDEXER_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3018, 2515, { 0, 1 }, WSO_INTERIOR_LIGHTS, "Change AoA Indexer Brightness")
F_4E:definePotentiometer("WSO_INT_LIGHT_INSTRUMENT_PANEL_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3017, 2514, { 0, 1 }, WSO_INTERIOR_LIGHTS, "Change Instrument Panel Light Brightness")
F_4E:definePotentiometer("WSO_INT_LIGHT_CONSOLE_BRIGHTNESS", INTERIOR_LIGHTS_DEVICE_ID, 3019, 2516, { 0, 1 }, WSO_INTERIOR_LIGHTS, "Change Console Light Brightness")

F_4E:definePositiveFloat("WSO_INT_LIGHT_INDICATORS", 2890, WSO_INTERIOR_LIGHTS, "All Indicator Lamp Brightness")
-- no draw args reserved for the wso light yet - reserve the slots here just in case
F_4E:reserveIntValue(65535)
F_4E:reserveIntValue(65535)
F_4E:reserveIntValue(65535)
F_4E:reserveIntValue(65535)
F_4E:reserveIntValue(65535)
F_4E:reserveIntValue(65535)
F_4E:definePositiveFloat("WSO_INT_LIGHT_STANDBY_COMPASS", 2882, WSO_INTERIOR_LIGHTS, "Standby Compass Light")

F_4E:defineIndicatorLight("WSO_INT_LIGHT_FLOOD_WHITE", 2711, WSO_INTERIOR_LIGHTS, "White Floodlight On/Off")
F_4E:definePositiveFloat("WSO_INT_LIGHT_FLOOD_RED", 2712, WSO_INTERIOR_LIGHTS, "Red Floodlight Brightness")
F_4E:definePositiveFloat("WSO_INT_LIGHT_INSTRUMENT_PANEL", 2713, WSO_INTERIOR_LIGHTS, "Instrument Panel Light Brightness")
F_4E:definePositiveFloat("WSO_INT_LIGHT_CONSOLE", 2867, WSO_INTERIOR_LIGHTS, "Console Light Brightness")

-- Airborne Video Tape Recorder
local AVTR_DEVICE_ID = 73

-- Pilot Airborne Video Tape Recorder
local PILOT_AVTR = "PLT Airborne Video Tape Recorder"

F_4E:definePushButton("PLT_AVTR_EJECT", AVTR_DEVICE_ID, 3006, 2884, PILOT_AVTR, "Eject AVTR Cassette (OFF mode only)")
F_4E:definePushButton("PLT_AVTR_UNTHREAD", AVTR_DEVICE_ID, 3005, 2885, PILOT_AVTR, "Unthread AVTR Cassette")
F_4E:definePushButton("PLT_AVTR_CLOSE_DOOR", AVTR_DEVICE_ID, 3016, 2894, PILOT_AVTR, "Close Door (Door open only)")
F_4E:definePushButton("PLT_AVTR_CHANGE_TAPE", AVTR_DEVICE_ID, 3018, 2895, PILOT_AVTR, "Change Tape")
F_4E:definePushButton("PLT_AVTR_RECORDER_LIGHT_TEST", AVTR_DEVICE_ID, 3002, 2796, PILOT_AVTR, "AVTR Recorder Lamp (push to test)")
F_4E:definePotentiometer("PLT_AVTR_RECORDER_LIGHT_DIM", AVTR_DEVICE_ID, 3003, 2795, { 0, 1 }, PILOT_AVTR, "AVTR Recorder Lamp (rotate to dim)")
F_4E:defineIndicatorLight("PLT_AVTR_RECORDER_LIGHT", 2592, PILOT_AVTR, "Pilot AVTR Recorder Lamp (Red)")

F_4E:definePositiveFloat("PLT_AVTR_TAPE_POSITION", 2886, PILOT_AVTR, "Cassette Tape Position")
F_4E:defineIntegerFromArg("PLT_AVTR_TAPE_CONTENTS", 2891, 1, PILOT_AVTR, "Selected Tape")
F_4E:definePositiveFloat("PLT_AVTR_DOOR", 2892, PILOT_AVTR, "Door Position")
F_4E:definePositiveFloat("PLT_AVTR_CASSETTE_DRUM", 2893, PILOT_AVTR, "Drum Rotation")

F_4E:defineString("PLT_AVTR_TIME_DISPLAY", function(_)
	return Module.parse_indication(15)["avtr_time_indicator_pilot_foreground"]
end, 3, PILOT_AVTR, "Time Remaining Display (minutes)")

-- WSO Airborne Video Tape Recorder
local WSO_AVTR = "WSO Airborne Video Tape Recorder"

F_4E:definePushButton("WSO_AVTR_RECORD_EOT", AVTR_DEVICE_ID, 3004, 2816, WSO_AVTR, "AVTR Record/End Of Tape Button (no function)")
F_4E:define3PosTumb0To1("WSO_AVTR_MODE", AVTR_DEVICE_ID, 3001, 2628, WSO_AVTR, "Set AVTR Mode")

F_4E:defineIndicatorLight("WSO_AVTR_RECORD", 2693, WSO_AVTR, "Record Lamp (Green)")
F_4E:defineIndicatorLight("WSO_AVTR_EOT", 2694, WSO_AVTR, "End of Tape Lamp (Green)")

F_4E:defineString("WSO_AVTR_TIME_DISPLAY", function(_)
	return Module.parse_indication(14)["avtr_time_indicator_wso_foreground"]
end, 3, WSO_AVTR, "Time Remaining Display (minutes)")

-- Pilot Front Panel
local PILOT_FRONT_PANEL_DEVICE_ID = 74

-- Pilot Front Panel
local PLT_FRONT_PANEL = "PLT Front Panel"

F_4E:defineToggleSwitch("PLT_FRONT_PANEL_SHOW_STICK", PILOT_FRONT_PANEL_DEVICE_ID, 3001, 2840, PLT_FRONT_PANEL, "Hide/Show Stick")

-- WSO Course Indicator
local WSO_COURSE_INDICATOR_DEVICE_ID = 76

-- WSO Course Indicator
local WSO_COURSE_INDICATOR = "WSO Course Indicator"

F_4E:definePotentiometer("WSO_COURSE_INDICATOR_SET", WSO_COURSE_INDICATOR_DEVICE_ID, 3001, 2612, { 0, 1 }, WSO_COURSE_INDICATOR, "Set Course")

F_4E:defineFullRangeFloat("WSO_COURSE_INDICATOR_GLIDESLOPE", 2613, WSO_COURSE_INDICATOR, "Glideslope Needle")
F_4E:definePositiveFloat("WSO_COURSE_INDICATOR_GLIDESLOPE_OFF", 2614, WSO_COURSE_INDICATOR, "Glideslope Off Flag")
F_4E:defineFullRangeFloat("WSO_COURSE_INDICATOR_LOCALIZER", 2615, WSO_COURSE_INDICATOR, "Localizer Needle")
F_4E:definePositiveFloat("WSO_COURSE_INDICATOR_LOCALIZER_OFF", 2616, WSO_COURSE_INDICATOR, "Localizer Off Flag")
F_4E:definePositiveFloat("WSO_COURSE_INDICATOR_HEADING", 2621, WSO_COURSE_INDICATOR, "Heading Card Rotation")
F_4E:defineFullRangeFloat("WSO_COURSE_INDICATOR_DEVIATION", 2726, WSO_COURSE_INDICATOR, "Course Deviation Needle")

F_4E:defineString("WSO_COURSE_INDICATOR_DISTANCE", function(dev0)
	return drum_set(dev0, 2619, 2618, 2617)
end, 3, WSO_COURSE_INDICATOR, "Distance Drum")

-- Jester Wheel
local JESTER_WHEEL_DEVICE_ID = 78

-- Pilot Jester Commands
local PILOT_JESTER_WHEEL = "PLT Jester Wheel"

F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_BACK", JESTER_WHEEL_DEVICE_ID, 3003, PILOT_JESTER_WHEEL, "Jester UI Back")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_NAV_HOME", JESTER_WHEEL_DEVICE_ID, 3201, PILOT_JESTER_WHEEL, "Jester UI Navigate To Main Menu")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_1", JESTER_WHEEL_DEVICE_ID, 3004, PILOT_JESTER_WHEEL, "Jester UI Option 1")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_2", JESTER_WHEEL_DEVICE_ID, 3005, PILOT_JESTER_WHEEL, "Jester UI Option 2")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_3", JESTER_WHEEL_DEVICE_ID, 3006, PILOT_JESTER_WHEEL, "Jester UI Option 3")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_4", JESTER_WHEEL_DEVICE_ID, 3007, PILOT_JESTER_WHEEL, "Jester UI Option 4")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_5", JESTER_WHEEL_DEVICE_ID, 3008, PILOT_JESTER_WHEEL, "Jester UI Option 5")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_6", JESTER_WHEEL_DEVICE_ID, 3009, PILOT_JESTER_WHEEL, "Jester UI Option 6")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_7", JESTER_WHEEL_DEVICE_ID, 3010, PILOT_JESTER_WHEEL, "Jester UI Option 7")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_8", JESTER_WHEEL_DEVICE_ID, 3011, PILOT_JESTER_WHEEL, "Jester UI Option 8")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_LEFT", JESTER_WHEEL_DEVICE_ID, 3012, PILOT_JESTER_WHEEL, "Jester UI Left/CCW")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_CENTER", JESTER_WHEEL_DEVICE_ID, 3013, PILOT_JESTER_WHEEL, "Jester UI Middle/Select")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_OPTION_RIGHT", JESTER_WHEEL_DEVICE_ID, 3014, PILOT_JESTER_WHEEL, "Jester UI Right/CW")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_UI_ACTION", JESTER_WHEEL_DEVICE_ID, 3150, PILOT_JESTER_WHEEL, "Jester UI Action (short, hold)")
F_4E:defineInputOnlyPushButton("PILOT_JESTER_CONTEXT_ACTION", JESTER_WHEEL_DEVICE_ID, 3122, PILOT_JESTER_WHEEL, "Jester Context Action (short, hold, double click)")

-- Specific Jester Commands
local PILOT_JESTER_COMMANDS = "PLT Jester Commands"

F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_MODE_OFF", JESTER_WHEEL_DEVICE_ID, 3062, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Mode > Off")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_MODE_TRADF", JESTER_WHEEL_DEVICE_ID, 3063, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Mode > T/R, ADF")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_MODE_TRGADF", JESTER_WHEEL_DEVICE_ID, 3064, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Mode > T/R+G, ADF")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_MODE_ADFGCMD", JESTER_WHEEL_DEVICE_ID, 3065, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Mode > ADF+G, CMD")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_MODE_ADFG", JESTER_WHEEL_DEVICE_ID, 3066, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Mode > ADF, G")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_MODE_GADF", JESTER_WHEEL_DEVICE_ID, 3067, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Mode > G, ADF")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_FREQ_MODE_PRESET", JESTER_WHEEL_DEVICE_ID, 3068, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Frequency Mode > Preset")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_FREQ_MODE_MANUAL", JESTER_WHEEL_DEVICE_ID, 3069, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Frequency Mode > Manual")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_1", JESTER_WHEEL_DEVICE_ID, 3070, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 1")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_2", JESTER_WHEEL_DEVICE_ID, 3071, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 2")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_3", JESTER_WHEEL_DEVICE_ID, 3164, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 3")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_4", JESTER_WHEEL_DEVICE_ID, 3165, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 4")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_5", JESTER_WHEEL_DEVICE_ID, 3166, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 5")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_6", JESTER_WHEEL_DEVICE_ID, 3167, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 6")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_7", JESTER_WHEEL_DEVICE_ID, 3168, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 7")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_8", JESTER_WHEEL_DEVICE_ID, 3169, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 8")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_9", JESTER_WHEEL_DEVICE_ID, 3170, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 9")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_10", JESTER_WHEEL_DEVICE_ID, 3171, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 10")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_11", JESTER_WHEEL_DEVICE_ID, 3172, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 11")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_12", JESTER_WHEEL_DEVICE_ID, 3173, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 12")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_13", JESTER_WHEEL_DEVICE_ID, 3174, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 13")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_14", JESTER_WHEEL_DEVICE_ID, 3175, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 14")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_15", JESTER_WHEEL_DEVICE_ID, 3176, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 15")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_16", JESTER_WHEEL_DEVICE_ID, 3177, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 16")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_17", JESTER_WHEEL_DEVICE_ID, 3178, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 17")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_COM_18", JESTER_WHEEL_DEVICE_ID, 3179, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Comm > 18")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_1", JESTER_WHEEL_DEVICE_ID, 3072, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 1")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_2", JESTER_WHEEL_DEVICE_ID, 3073, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 2")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_3", JESTER_WHEEL_DEVICE_ID, 3180, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 3")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_4", JESTER_WHEEL_DEVICE_ID, 3181, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 4")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_5", JESTER_WHEEL_DEVICE_ID, 3182, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 5")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_6", JESTER_WHEEL_DEVICE_ID, 3183, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 6")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_7", JESTER_WHEEL_DEVICE_ID, 3184, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 7")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_8", JESTER_WHEEL_DEVICE_ID, 3185, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 8")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_9", JESTER_WHEEL_DEVICE_ID, 3186, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 9")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_10", JESTER_WHEEL_DEVICE_ID, 3187, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 10")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_11", JESTER_WHEEL_DEVICE_ID, 3188, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 11")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_12", JESTER_WHEEL_DEVICE_ID, 3189, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 12")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_13", JESTER_WHEEL_DEVICE_ID, 3190, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 13")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_14", JESTER_WHEEL_DEVICE_ID, 3191, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 14")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_15", JESTER_WHEEL_DEVICE_ID, 3192, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 15")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_16", JESTER_WHEEL_DEVICE_ID, 3193, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 16")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_17", JESTER_WHEEL_DEVICE_ID, 3194, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 17")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_18", JESTER_WHEEL_DEVICE_ID, 3195, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 18")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_19", JESTER_WHEEL_DEVICE_ID, 3196, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 19")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADIO_CHANNEL_AUX_20", JESTER_WHEEL_DEVICE_ID, 3197, PILOT_JESTER_COMMANDS, "Jester Command: UHF Radio > Channel > Aux > 20")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_OPERATION_ACTIVE", JESTER_WHEEL_DEVICE_ID, 3148, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Operation > Active")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_OPERATION_STANDBY", JESTER_WHEEL_DEVICE_ID, 3149, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Operation > Standby")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_AUTO_FOCUS_ON", JESTER_WHEEL_DEVICE_ID, 3135, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Operation > Auto Focus On")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_AUTO_FOCUS_OFF", JESTER_WHEEL_DEVICE_ID, 3137, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Operation > Auto Focus Off")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_IFF", JESTER_WHEEL_DEVICE_ID, 3134, PILOT_JESTER_COMMANDS, "Jester Command: Radar > IFF")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_0_10_ABS", JESTER_WHEEL_DEVICE_ID, 3138, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > 0 - 10k ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_10_20_ABS", JESTER_WHEEL_DEVICE_ID, 3139, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > 10 - 20k ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_20_30_ABS", JESTER_WHEEL_DEVICE_ID, 3140, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > 20 - 30k ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_30_40_ABS", JESTER_WHEEL_DEVICE_ID, 3141, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > 30 - 40k ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_40_50_ABS", JESTER_WHEEL_DEVICE_ID, 3142, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > 40 - 50k ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_50_60_ABS", JESTER_WHEEL_DEVICE_ID, 3143, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > 50 - 60k ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_CENTER_REL", JESTER_WHEEL_DEVICE_ID, 3154, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > Center")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_MINUS_3_REL", JESTER_WHEEL_DEVICE_ID, 3155, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > -3500 ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_MINUS_5_REL", JESTER_WHEEL_DEVICE_ID, 3156, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > -5000 ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_MINUS_7_REL", JESTER_WHEEL_DEVICE_ID, 3157, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > -7500 ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_PLUS_3_REL", JESTER_WHEEL_DEVICE_ID, 3158, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > +3500 ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_PLUS_5_REL", JESTER_WHEEL_DEVICE_ID, 3159, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > +5000 ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_SCAN_PLUS_7_REL", JESTER_WHEEL_DEVICE_ID, 3160, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Elevation > +7500 ft")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_RANGE_25_WIDE", JESTER_WHEEL_DEVICE_ID, 3144, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Type > 25nm Wide")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_RANGE_25_NARROW", JESTER_WHEEL_DEVICE_ID, 3145, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Type > 25nm Narrow")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_RANGE_50_WIDE", JESTER_WHEEL_DEVICE_ID, 3146, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Type > 50nm Wide")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_RADAR_RANGE_50_NARROW", JESTER_WHEEL_DEVICE_ID, 3147, PILOT_JESTER_COMMANDS, "Jester Command: Radar > Scan Type > 50nm Narrow")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_A2G_VIDEO_WEAPONS", JESTER_WHEEL_DEVICE_ID, 3074, PILOT_JESTER_COMMANDS, "Jester Command: A2G > Video Source > Weapons")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_A2G_VIDEO_PAVE_SPIKE", JESTER_WHEEL_DEVICE_ID, 3075, PILOT_JESTER_COMMANDS, "Jester Command: A2G > Video Source > Pave Spike")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_A2G_TGP_OPERATION_READY", JESTER_WHEEL_DEVICE_ID, 3076, PILOT_JESTER_COMMANDS, "Jester Command: A2G > Pave Spike > Operation > Ready")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_A2G_TGP_OPERATION_STANDBY", JESTER_WHEEL_DEVICE_ID, 3077, PILOT_JESTER_COMMANDS, "Jester Command: A2G > Pave Spike > Operation > Standby")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_WITH_TGT1", JESTER_WHEEL_DEVICE_ID, 3078, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Navigate With > TGT 1")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_WITH_TGT2", JESTER_WHEEL_DEVICE_ID, 3079, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Navigate With > TGT 2")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_TACAN_MODE_OFF", JESTER_WHEEL_DEVICE_ID, 3081, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Tacan > Mode > Off")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_TACAN_MODE_R", JESTER_WHEEL_DEVICE_ID, 3082, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Tacan > Mode > R")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_TACAN_MODE_TR", JESTER_WHEEL_DEVICE_ID, 3083, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Tacan > Mode > T/R")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_TACAN_MODE_AAR", JESTER_WHEEL_DEVICE_ID, 3084, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Tacan > Mode > A/A R")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_TACAN_MODE_AATR", JESTER_WHEEL_DEVICE_ID, 3085, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Tacan > Mode > A/A T/R")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_NAV_FINE_ALIGN_INS", JESTER_WHEEL_DEVICE_ID, 3227, PILOT_JESTER_COMMANDS, "Jester Command: Navigation > Fine-Align INS")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_CHAFF_MODE_OFF", JESTER_WHEEL_DEVICE_ID, 3086, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Chaff Mode > Off")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_CHAFF_MODE_SINGLE", JESTER_WHEEL_DEVICE_ID, 3087, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Chaff Mode > Single")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_CHAFF_MODE_MULTIPLE", JESTER_WHEEL_DEVICE_ID, 3088, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Chaff Mode > Multiple")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_CHAFF_MODE_PROGRAM", JESTER_WHEEL_DEVICE_ID, 3089, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Chaff Mode > Program")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_FLARE_MODE_OFF", JESTER_WHEEL_DEVICE_ID, 3090, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Flare Mode > Off")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_FLARE_MODE_SINGLE", JESTER_WHEEL_DEVICE_ID, 3091, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Flare Mode > Single")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_FLARE_MODE_PROGRAM", JESTER_WHEEL_DEVICE_ID, 3092, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Flare Mode > Program")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_JAMMER_STANDBY", JESTER_WHEEL_DEVICE_ID, 3093, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Jammer > Standby")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_JAMMER_TRANSMIT", JESTER_WHEEL_DEVICE_ID, 3094, PILOT_JESTER_COMMANDS, "Jester Command: Systems > Jammer > Transmit")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_AVTR_RECORD", JESTER_WHEEL_DEVICE_ID, 3099, PILOT_JESTER_COMMANDS, "Jester Command: Systems > AVTR > Record")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_AVTR_STANDBY", JESTER_WHEEL_DEVICE_ID, 3198, PILOT_JESTER_COMMANDS, "Jester Command: Systems > AVTR > Standby")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_SYSTEMS_AVTR_OFF", JESTER_WHEEL_DEVICE_ID, 3100, PILOT_JESTER_COMMANDS, "Jester Command: Systems > AVTR > Off")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_TALKING_TALK", JESTER_WHEEL_DEVICE_ID, 3131, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Talking > Talk")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_TALKING_SILENCE", JESTER_WHEEL_DEVICE_ID, 3132, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Talking > Silence")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_EJECTION_WSO", JESTER_WHEEL_DEVICE_ID, 3097, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Ejection > WSO")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_EJECTION_BOTH", JESTER_WHEEL_DEVICE_ID, 3098, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Ejection > Both")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_PRESENCE_AUTO", JESTER_WHEEL_DEVICE_ID, 3128, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Presence > Auto")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_PRESENCE_ENABLED", JESTER_WHEEL_DEVICE_ID, 3129, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Presence > Force")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_PRESENCE_DISABLED", JESTER_WHEEL_DEVICE_ID, 3130, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Presence > Disable")
F_4E:defineInputOnlyPushButton("PLT_JESTER_COMMAND_CREW_START_ALIGNMENT", JESTER_WHEEL_DEVICE_ID, 3133, PILOT_JESTER_COMMANDS, "Jester Command: Crew Contract > Start Alignment")

-- Specific Crew Chief Commands
local PILOT_CREW_CHIEF_COMMANDS = "PLT Crew Chief Commands"

F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_COMMS_CHECK", JESTER_WHEEL_DEVICE_ID, 3101, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Comms Check")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_WHEEL_CHOCKS_PLACE", JESTER_WHEEL_DEVICE_ID, 3102, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Wheel Chocks > Place")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_WHEEL_CHOCKS_REMOVE", JESTER_WHEEL_DEVICE_ID, 3103, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Wheel Chocks > Remove")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_EXT_POWER_CONNECT", JESTER_WHEEL_DEVICE_ID, 3104, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: External Power > Connect")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_EXT_POWER_DISCONNECT", JESTER_WHEEL_DEVICE_ID, 3105, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: External Power > Disconnect")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_CONNECT_RIGHT", JESTER_WHEEL_DEVICE_ID, 3106, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Connect Right Engine")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_CONNECT_LEFT", JESTER_WHEEL_DEVICE_ID, 3107, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Connect Left Engine")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_START", JESTER_WHEEL_DEVICE_ID, 3108, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Start Flow")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_STOP", JESTER_WHEEL_DEVICE_ID, 3109, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Stop Flow")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_DISCONNECT", JESTER_WHEEL_DEVICE_ID, 3110, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Disconnect")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_LOAD_CARTRIDGES", JESTER_WHEEL_DEVICE_ID, 3111, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Load Starter Cartridges")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_AIR_SOURCE_REMOVE_CARTRIDGES", JESTER_WHEEL_DEVICE_ID, 3112, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Air Source > Remove Starter Cartridges")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_BOARDING_LADDER_PLACE", JESTER_WHEEL_DEVICE_ID, 3113, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Boarding > Place Ladder")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_BOARDING_LADDER_REMOVE", JESTER_WHEEL_DEVICE_ID, 3114, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Boarding > Remove Ladder")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_BOARDING_STEPS_EXTEND", JESTER_WHEEL_DEVICE_ID, 3115, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Boarding > Extend Steps")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_BOARDING_STEPS_RETRACT", JESTER_WHEEL_DEVICE_ID, 3116, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Boarding > Retract Steps")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CHECKS_PITOT_HEAT", JESTER_WHEEL_DEVICE_ID, 3117, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Checks > Pitot Heat")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CHECKS_SPOILER_ACTUATOR", JESTER_WHEEL_DEVICE_ID, 3118, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Checks > Spoiler Actuator")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CHECKS_FLIGHT_CONTROLS", JESTER_WHEEL_DEVICE_ID, 3119, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Checks > Flight Controls")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CHECKS_ARI_DISENGAGE", JESTER_WHEEL_DEVICE_ID, 3199, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Checks > ARI Disengage")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CHECKS_STAB_AUG", JESTER_WHEEL_DEVICE_ID, 3200, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Checks > Stab Aug")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CHECKS_TRIM_NEUTRAL", JESTER_WHEEL_DEVICE_ID, 3120, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Checks > Trim Neutral")
F_4E:defineInputOnlyPushButton("PLT_CREW_CHIEF_COMMAND_CANCEL", JESTER_WHEEL_DEVICE_ID, 3121, PILOT_CREW_CHIEF_COMMANDS, "Crew Chief Command: Cancel")

-- WSO Jester Commands
local WSO_JESTER_WHEEL = "WSO Jester Wheel"

F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_BACK", JESTER_WHEEL_DEVICE_ID, 3015, WSO_JESTER_WHEEL, "Jester UI Back")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_NAV_HOME", JESTER_WHEEL_DEVICE_ID, 3203, WSO_JESTER_WHEEL, "Jester UI Navigate To Main Menu")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_1", JESTER_WHEEL_DEVICE_ID, 3016, WSO_JESTER_WHEEL, "Jester UI Option 1")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_2", JESTER_WHEEL_DEVICE_ID, 3017, WSO_JESTER_WHEEL, "Jester UI Option 2")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_3", JESTER_WHEEL_DEVICE_ID, 3018, WSO_JESTER_WHEEL, "Jester UI Option 3")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_4", JESTER_WHEEL_DEVICE_ID, 3019, WSO_JESTER_WHEEL, "Jester UI Option 4")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_5", JESTER_WHEEL_DEVICE_ID, 3020, WSO_JESTER_WHEEL, "Jester UI Option 5")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_6", JESTER_WHEEL_DEVICE_ID, 3021, WSO_JESTER_WHEEL, "Jester UI Option 6")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_7", JESTER_WHEEL_DEVICE_ID, 3022, WSO_JESTER_WHEEL, "Jester UI Option 7")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_8", JESTER_WHEEL_DEVICE_ID, 3023, WSO_JESTER_WHEEL, "Jester UI Option 8")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_LEFT", JESTER_WHEEL_DEVICE_ID, 3024, WSO_JESTER_WHEEL, "Jester UI Left/CCW")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_CENTER", JESTER_WHEEL_DEVICE_ID, 3025, WSO_JESTER_WHEEL, "Jester UI Middle/Select")
F_4E:defineInputOnlyPushButton("WSO_JESTER_OPTION_RIGHT", JESTER_WHEEL_DEVICE_ID, 3026, WSO_JESTER_WHEEL, "Jester UI Right/CW")
F_4E:defineInputOnlyPushButton("WSO_JESTER_UI_ACTION", JESTER_WHEEL_DEVICE_ID, 3152, WSO_JESTER_WHEEL, "Jester UI Action (short, hold)")

-- Grease Pencil
local GREASE_PENCIL_DEVICE_ID = 82

-- Pilot Grease Pencil
local PILOT_GREASE_PENCIL = "PLT Grease Pencil"

F_4E:defineToggleSwitch("PLT_GREASE_PENCIL", GREASE_PENCIL_DEVICE_ID, 3001, 3036, PILOT_GREASE_PENCIL, "Hide/Show Grease Pencil")

-- WSO Grease Pencil
local WSO_GREASE_PENCIL = "WSO Grease Pencil"

F_4E:defineToggleSwitch("WSO_GREASE_PENCIL", GREASE_PENCIL_DEVICE_ID, 3003, 3037, WSO_GREASE_PENCIL, "Hide/Show Grease Pencil")

-- Circuit Breakers
local CIRCUIT_BREAKERS_DEVICE_ID = 84

local PILOT_BREAKER_PANEL = "PLT CB Panel"

local WSO_BREAKER_PANEL = "WSO CB Panel"

F_4E:defineToggleSwitch("PLT_CB_ARI", CIRCUIT_BREAKERS_DEVICE_ID, 3001, 1382, PILOT_BREAKER_PANEL, "Aileron-Rudder Interconnect (ARI) CB")
F_4E:defineToggleSwitch("PLT_CB_SAI_LW", CIRCUIT_BREAKERS_DEVICE_ID, 3002, 2861, PILOT_BREAKER_PANEL, "Standby Attitude Indicator CB")
F_4E:defineToggleSwitch("PLT_CB_AIL_FEEL_TRIM", CIRCUIT_BREAKERS_DEVICE_ID, 3003, 1382, PILOT_BREAKER_PANEL, "AIL Feel-Trim CB")
F_4E:defineToggleSwitch("PLT_CB_FEEL_TRIM", CIRCUIT_BREAKERS_DEVICE_ID, 3004, 1384, PILOT_BREAKER_PANEL, "STAB Feel-Trim CB")
F_4E:defineToggleSwitch("PLT_CB_SPEED_BRAKE", CIRCUIT_BREAKERS_DEVICE_ID, 3005, 1385, PILOT_BREAKER_PANEL, "Speed Brake CB")
F_4E:defineToggleSwitch("PT_CB_FLAPS", CIRCUIT_BREAKERS_DEVICE_ID, 3006, 1387, PILOT_BREAKER_PANEL, "Flaps CB")
F_4E:defineToggleSwitch("PLT_CB_TRIM", CIRCUIT_BREAKERS_DEVICE_ID, 3007, 1388, PILOT_BREAKER_PANEL, "Trim Controls CB")
F_4E:defineToggleSwitch("PLT_CB_RUD_TRIM", CIRCUIT_BREAKERS_DEVICE_ID, 3008, 1389, PILOT_BREAKER_PANEL, "Rudder Trim CB")
F_4E:defineToggleSwitch("PLT_CB_FLOODLIGHTS", CIRCUIT_BREAKERS_DEVICE_ID, 3009, 2710, PILOT_BREAKER_PANEL, "Pilot Instruments Lights CB")
F_4E:defineToggleSwitch("PLT_CB_WARNING_LIGHTS", CIRCUIT_BREAKERS_DEVICE_ID, 3010, 2889, PILOT_BREAKER_PANEL, "Pilot Warning Lights CB")
F_4E:defineToggleSwitch("PLT_CB_LANDING_GEAR", CIRCUIT_BREAKERS_DEVICE_ID, 3011, 1386, PILOT_BREAKER_PANEL, "Landing Gear CB")

F_4E:defineToggleSwitch("WSO_CB_FLOODLIGHTS", CIRCUIT_BREAKERS_DEVICE_ID, 3012, 2713, WSO_BREAKER_PANEL, "WSO Instruments Lights CB")
F_4E:defineToggleSwitch("WSO_CB_WARNING_LIGHTS", CIRCUIT_BREAKERS_DEVICE_ID, 3013, 2890, WSO_BREAKER_PANEL, "WSO Warning Lights CB")

-- Seat
local SEAT_DEVICE_ID = 85

-- Pilot Seat
local PILOT_SEAT = "PLT Seat"

F_4E:defineSpringloaded_3PosTumb("PLT_SEAT_ADJUST", SEAT_DEVICE_ID, 3001, 3001, 3041, PILOT_SEAT, "Change Seat Position")
F_4E:defineFullRangeFloat("PLT_SEAT_HEIGHT", 3042, PILOT_SEAT, "Seat Height")

-- WSO Seat
local WSO_SEAT = "WSO Seat"

F_4E:defineSpringloaded_3PosTumb("WSO_SEAT_ADJUST", SEAT_DEVICE_ID, 3002, 3002, 3043, WSO_SEAT, "Change Seat Position")
F_4E:defineFullRangeFloat("WSO_SEAT_HEIGHT", 3044, WSO_SEAT, "Seat Height")

-- todo: seat pos draw arg

-- ECM
local ECM_DEVICE_ID = 91

-- WSO ECM
local WSO_ECM = "WSO ECM"

-- left
F_4E:defineMultipositionSwitch0To1("WSO_ECM_MODE_L", ECM_DEVICE_ID, 3001, 2650, 5, WSO_ECM, "Select ECM Mode (left pylons)")
F_4E:definePushButton("WSO_ECM_RESET_L", ECM_DEVICE_ID, 3005, 2657, WSO_ECM, "Reset ECM Fault (left pylons)")

F_4E:defineIndicatorLight("WSO_ECM_STANDBY_1_L", 2651, WSO_ECM, "Left Standby 1 Lamp (Yellow)")
F_4E:defineIndicatorLight("WSO_ECM_STANDBY_2_L", 2652, WSO_ECM, "Left Standby 2 Lamp (Yellow)")
F_4E:defineIndicatorLight("WSO_ECM_XMIT_1_L", 2653, WSO_ECM, "Left Xmit 1 Lamp (Green)")
F_4E:defineIndicatorLight("WSO_ECM_XMIT_3_L", 2654, WSO_ECM, "Left Xmit 3 Lamp (Green)")
F_4E:defineIndicatorLight("WSO_ECM_AI_L", 2655, WSO_ECM, "Left AI Lamp (Red)")
F_4E:defineIndicatorLight("WSO_ECM_FAULT_L", 2656, WSO_ECM, "Left Fault Lamp (Red)")

-- right
F_4E:defineMultipositionSwitch0To1("WSO_ECM_MODE_R", ECM_DEVICE_ID, 3007, 2658, 5, WSO_ECM, "Select ECM Mode (right pylons)")
F_4E:definePushButton("WSO_ECM_RESET_R", ECM_DEVICE_ID, 3011, 2665, WSO_ECM, "Reset ECM Fault (right pylons)")

F_4E:defineIndicatorLight("WSO_ECM_STANDBY_1_R", 2659, WSO_ECM, "Right Standby 1 Lamp (Yellow)")
F_4E:defineIndicatorLight("WSO_ECM_STANDBY_2_R", 2660, WSO_ECM, "Right Standby 2 Lamp (Yellow)")
F_4E:defineIndicatorLight("WSO_ECM_XMIT_1_R", 2661, WSO_ECM, "Right Xmit 1 Lamp (Green)")
F_4E:defineIndicatorLight("WSO_ECM_XMIT_3_R", 2662, WSO_ECM, "Right Xmit 3 Lamp (Green)")
F_4E:defineIndicatorLight("WSO_ECM_AI_R", 2663, WSO_ECM, "Right AI Lamp (Red)")
F_4E:defineIndicatorLight("WSO_ECM_FAULT_R", 2664, WSO_ECM, "Right Fault Lamp (Red)")

-- Pilot Stick
local PILOT_STICK = "PLT Stick"

F_4E:definePushButton("PLT_STICK_AIR_REFUEL_RELEASE", WEAPONS_DEVICE_ID, 3020, 2780, PILOT_STICK, "Air Refuel Release Button")
F_4E:definePushButton("PLT_STICK_NWS", LANDING_GEAR_DEVICE_ID, 3006, 2781, PILOT_STICK, "Nosegear Steering Button")
F_4E:definePushButton("PLT_STICK_AFCS_EMERGENCY_RELEASE", AFCS_DEVICE_ID, 3020, 2782, PILOT_STICK, "Emergency Quick Release")

-- WSO Stick
local WSO_STICK = "WSO Stick"

F_4E:definePushButton("WSO_STICK_NWS", LANDING_GEAR_DEVICE_ID, 3007, 2787, WSO_STICK, "Nosegear Steering Button")
F_4E:definePushButton("WSO_STICK_AFCS_EMERGENCY_RELEASE", AFCS_DEVICE_ID, 3021, 2788, WSO_STICK, "Emergency Quick Release")

-- Pilot Throttle
local PILOT_THROTTLE = "PLT Throttle"

F_4E:definePushButton("PLT_THROTTLE_IGNITION_L", ENGINE_DEVICE_ID, 3004, 295, PILOT_THROTTLE, "Ignite Left Engine")
F_4E:definePushButton("PLT_THROTTLE_IGNITION_R", ENGINE_DEVICE_ID, 3005, 296, PILOT_THROTTLE, "Ignite Right Engine")
F_4E:defineSpringloaded3PosTumb("PLT_THROTTLE_SPEED_BRAKE", CONTROL_SURFACES_DEVICE_ID, 3001, 2610, PILOT_THROTTLE, "Speed Brake")
F_4E:defineSpringloaded3PosTumb("PLT_THROTTLE_MIC", ICS_DEVICE_ID, 3001, 2609, PILOT_THROTTLE, "Mic Switch")
F_4E:definePushButton("PLT_THROTTLE_WPN_CAGE", WEAPONS_DEVICE_ID, 3018, 1435, PILOT_THROTTLE, "Cage Mode")
F_4E:definePushButton("PLT_THROTTLE_CM_DISPENSE", COUNTERMEASURES_DEVICE_ID, 3012, 1436, PILOT_THROTTLE, "Dispense Countermeasures")
F_4E:definePushButton("PLT_THROTTLE_DETENT_L", ENGINE_DEVICE_ID, 3006, 2607, PILOT_THROTTLE, "Left Idle Detent")
F_4E:definePushButton("PLT_THROTTLE_DETENT_R", ENGINE_DEVICE_ID, 3007, 2608, PILOT_THROTTLE, "Right Idle Detent")

-- WSO Throttle
local WSO_THROTTLE = "WSO Throttle"

F_4E:defineSpringloaded3PosTumb("WSO_THROTTLE_SPEED_BRAKE", CONTROL_SURFACES_DEVICE_ID, 3015, 2670, WSO_THROTTLE, "Speed Brake")
F_4E:defineSpringloaded3PosTumb("WSO_THROTTLE_MIC", ICS_DEVICE_ID, 3002, 2671, WSO_THROTTLE, "Mic Switch")

-- Pilot Left Subpanel
local PILOT_LEFT_SUB_PANEL = "PLT Left Subpanel"

F_4E:define3PosTumb0To1("PLT_EXT_LIGHT_TAXI_LAND", EXTERIOR_LIGHTS_DEVICE_ID, 3001, 1416, PILOT_LEFT_SUB_PANEL, "Taxi/Landing Light")

-- Pilot Right Console
local PILOT_RIGHT_CONSOLE = "PLT Right Console"

F_4E:definePushButton("PLT_COCKPIT_PRESSURE_EMERGENCY_RELEASE", OXYGEN_SYSTEM_DEVICE_ID, 3012, 2879, PILOT_RIGHT_CONSOLE, "Emergency Release Cockpit Pressure")
F_4E:defineToggleSwitch("PLT_PITOT_HEAT", PITOT_STATIC_DEVICE_ID, 3001, 108, PILOT_RIGHT_CONSOLE, "Pitot Heat")

-- Pilot Right Wall
local PILOT_RIGHT_WALL = "PLT Right Wall"

F_4E:defineSpringloaded_3PosTumbWithRange("PLT_EXT_LIGHT_FORMATION_MODE", EXTERIOR_LIGHTS_DEVICE_ID, 3003, 3003, 1367, { 0, 1 }, PILOT_RIGHT_WALL, "Set Formation Lights Mode")
F_4E:definePotentiometer("PLT_EXT_LIGHT_FORMATION_BRIGHTNESS", EXTERIOR_LIGHTS_DEVICE_ID, 3002, 1368, { 0, 1 }, PILOT_RIGHT_WALL, "Change Formation Lights Brightness")

-- Pilot Azimuth-Elevation Indicator
local PILOT_AZIMUTH_ELEVATION_INDICATOR = "PLT Azimuth-Elevation Indicator"

F_4E:definePositiveFloat("PLT_AZIMUTH_ELEVATION_ROLL_NEEDLE", 2611, PILOT_AZIMUTH_ELEVATION_INDICATOR, "Roll Needle")
F_4E:definePositiveFloat("PLT_AZIMUTH_ELEVATION_FLAG_RED", 2761, PILOT_AZIMUTH_ELEVATION_INDICATOR, "Red Flag (top-left)")
F_4E:definePositiveFloat("PLT_AZIMUTH_ELEVATION_FLAG_YELLOW", 2762, PILOT_AZIMUTH_ELEVATION_INDICATOR, "Yellow Flag (top-right)")
F_4E:definePositiveFloat("PLT_AZIMUTH_ELEVATION_FLAG_GREEN", 2763, PILOT_AZIMUTH_ELEVATION_INDICATOR, "Green Flag (bottom)")

-- Radios

F_4E:defineReadWriteRadio("RADIO_ARC_164", ARC_164_DEVICE_ID, 7, 3, 1000, "ARC-164 (Comm Command)")

-- new controls
F_4E:defineIndicatorLight("WSO_WRCS_ALT_LIGHT", 391, WSO_WRCS, "ALT Light (Red)")
F_4E:defineIndicatorLight("WSO_WRCS_RANGE_LIGHT", 392, WSO_WRCS, "Freeze Light (Red)")

F_4E:definePotentiometer("PLT_RADAR_HORIZONTAL_LINE", RADAR_DEVICE_ID, 3113, 1205, { 0, 1 }, PILOT_RADAR, "Adjust Horizon on Display")

return F_4E
