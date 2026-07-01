module("C-130J", package.seeall)

local CommonPositions = require("Scripts.DCS-BIOS.lib.modules.CommonPositions")
local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlAttributeDocumentation = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlAttributeDocumentation")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

--- @class C_130J: Module
local C_130J = Module:new("C-130J", 0xB000, { "C-130J-30" })

local devices = {
	MAIN_COMPUTER = 1,
	ENGINE_APU_CTRL = 2,
	THROTTLE_SYNC = 3,
	SYNC_MACHINE = 4,
	ELECTRIC_SYSTEM = 5,
	VHF1 = 6,
	UHF1 = 7,
	VHF2 = 8,
	UHF2 = 9,
	HF1 = 10,
	HF2 = 11,
	TACAN1 = 12,
	TACAN2 = 13,
	VORILS1 = 14,
	VORILS2 = 15,
	ADF1 = 16,
	ADF2 = 17,
	WayPointMgr = 18,
	CNBP = 19,
	P_DISPLAYS = 20,
	C_DISPLAYS = 21,
	PFD = 22,
	TAWS_Device = 23,
	RWR = 24,
	P_CNI = 25,
	C_CNI = 26,
	AC_CNI = 27,
	INTERCOM = 28,
	AMU001 = 29,
	AMU002 = 30,
	AMU003 = 31,
	AMU004 = 32,
	PILOT_CPT_INTERFACE = 33,
	COPILOT_CPT_INTERFACE = 34,
	PILOT_HUD_PANEL = 35,
	COPILOT_HUD_PANEL = 36,
	PILOT_REF_MODE_PANEL = 37,
	COPILOT_REF_MODE_PANEL = 38,
	LIGHTING_PANELS = 39,
	ECM = 40,
	MWS = 41,
	CMS_DISPENSER = 42,
	CMS_MGR = 43,
	CURSOR = 44,
	IRCM = 45,
	MECH_INTERFACE = 46,
	J_WORLD = 47,
	CARGO_HANDLER = 48,
	STANDBY = 49,
	WEAPONS = 50,
	IFF = 51,
	AP_INTERFACE = 52,
	AP_MGR = 53,
	DLINK = 54,
	Autopilot = 55,
	HDD001 = 56,
	HDD002 = 57,
	HDD003 = 58,
	HDD004 = 59,
	SOUND_ENG = 60,
	HOTAS_P = 61,
	HOTAS_C = 62,
	INTERCOM_CP = 63,
	FUEL_SYSTEM = 64,
	FADEC = 65,
	APU = 66,
	NAV_RADAR = 67,
	ACAWS = 68,
	VOLUME_MANAGER = 69,
	PLANE_ATM = 70,
	BLEED_AIR = 71,
	HYDRAULICS = 72,
	CDMU = 73,
	SOUNDER = 74,
	SP_RAD = 75,
	TIMER = 76,
	GPS1 = 77,
	GPS2 = 78,
	RADALT_1 = 79,
	RADALT_2 = 80,
	GALLEY = 81,
	OXYGEN = 82,
	PHYSIO = 83,
	INS1 = 84,
	INS2 = 85,
	INS_MGR = 86,
	NVG = 87,
	MECH_GYRO = 88,
	MACROS = 89,
	HEAD = 90,
	STB_COMPASS = 91,
	ARC_210 = 92,
	CAPS = 93,
	AUX_SYNC = 94,
	KNEEBOARD = 95,
	ROUTE_SYNC = 96,
	FAILURE_MGR = 97,
}

function C_130J:defineIndicatorLight(identifier, arg_number, category, description, attributes)
	self:defineGatedIndicatorLight(identifier, arg_number, 0.01, nil, category, description, attributes)
end

--- Adds a springloaded 3-pos tumb switch with special behavior for the C-130
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
--- @return Control
function C_130J:defineC130Springloaded_3PosTumb(identifier, device_id, command, arg_number, category, description, attributes)
	local alloc = self:allocateInt(2, identifier)

	local lower = -1
	local upper = 1
	local mid = 0

	self:addExportHook(function(dev0)
		local val = dev0:get_argument_value(arg_number)
		if math.abs(val - lower) < 0.01 then
			alloc:setValue(0)
		elseif math.abs(val - mid) < 0.01 then
			alloc:setValue(1)
		elseif math.abs(val - upper) < 0.01 then
			alloc:setValue(2)
		end
	end)

	local control = Control:new(category, ControlType.three_pos_two_command_switch_open_close, identifier, description, {
		SetStateInput:new(2, "set the switch position"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, string.format("switch position -- 0 = Down, 1 = Mid,  2 = Up")),
	}, nil, ControlAttributeDocumentation.from_switch_attributes(attributes))

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)
		if dev == nil then
			return
		end
		if toState == "0" then --downSwitch
			dev:performClickableAction(command, lower)
		elseif toState == "1" then --Stop
			dev:performClickableAction(command, mid)
		elseif toState == "2" then --upSwitch
			dev:performClickableAction(command, upper)
		end
	end)

	return control
end

-- 0 = fixed
-- 0.33 = auto
-- 0.70 = open
-- 1 = close
local function oil_cooler_switch_value(arg_value)
	if arg_value < 0.165 then
		return 0
	elseif arg_value < 0.515 then
		return 1
	elseif arg_value < 0.85 then
		return 2
	else
		return 3
	end
end

--- Adds a new oil cooler flaps control
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command_fixed integer the dcs command to set the switch to the fixed position
--- @param command_auto integer the dcs command to set the swithc to the auto position
--- @param command_open integer the dcs command to set the swithc to the open position
--- @param command_close integer the dcs command to set the swithc to the close position
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function C_130J:defineOilCoolerFlapsSwitch(identifier, device_id, command_fixed, command_auto, command_open, command_close, arg_number, category, description)
	local alloc = self:allocateInt(3)
	self:addExportHook(function(dev0)
		local val = oil_cooler_switch_value(dev0:get_argument_value(arg_number))
		alloc:setValue(val)
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		SetStateInput:new(3, "set the switch position"),
		FixedStepInput:new("switch to previous or next state"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = FIXED, 1 = AUTO , 2 = OPEN, 3 = CLOSE"),
	}, nil, { positions = { "FIXED", "AUTO", "OPEN", "CLOSE" } })
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		local currentState = oil_cooler_switch_value(GetDevice(0):get_argument_value(arg_number))
		local new_state

		if toState == "INC" then
			if currentState >= 3 then
				return
			end
			new_state = currentState + 1
		elseif toState == "DEC" then
			if currentState <= 0 then
				return
			end
			new_state = currentState - 1
		else
			new_state = tonumber(toState)
		end

		if new_state == 0 then -- fixed
			dev:performClickableAction(command_fixed, 1)
		elseif new_state == 1 then -- auto
			dev:performClickableAction(command_auto, 1)
		elseif new_state == 2 then -- open
			dev:performClickableAction(command_open, 1)
		elseif new_state == 3 then -- close
			dev:performClickableAction(command_close, 1)
		end
	end)

	return control
end

--- Adds a multi-position engine start/stop switch for the APU and engine start switches.
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param step number the amount to increase or decrease dcs data by with each step
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param positions number the number of positions the switch has
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function C_130J:defineEngineStartSwitch(identifier, device_id, command, arg_number, step, limits, positions, category, description, attributes)
	local min_output = 0
	local max_output = positions - 1
	local alloc = self:allocateInt(max_output, identifier)

	self:addExportHook(function(dev0)
		local val = dev0:get_argument_value(arg_number)
		local v = Module.round(Module.valueConvert(val, limits, { min_output, max_output }))
		alloc:setValue(v)
	end)

	local control = Control:new(category, ControlType.three_pos_two_command_switch_open_close, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(max_output, "set the switch position"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, string.format("switch position")),
	}, nil, ControlAttributeDocumentation.from_switch_attributes(attributes))

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)
		if dev == nil then
			return
		end

		local current_value = Module.round(Module.valueConvert(GetDevice(0):get_argument_value(arg_number), limits, { min_output, max_output }))

		local to_state_num

		if toState == "INC" then
			to_state_num = Module.cap(current_value + 1, min_output, max_output)
		elseif toState == "DEC" then
			to_state_num = Module.cap(current_value - 1, min_output, max_output)
		else
			to_state_num = tonumber(toState)
		end

		if to_state_num ~= nil then
			local diff = to_state_num - current_value
			local s = diff < 0 and -step or step
			for _ = 1, math.abs(diff) do
				dev:performClickableAction(command, s)
			end
		end
	end)

	return control
end

--- Returns the string value of an lcd line
--- @param indication_id integer the id of the dcs indication
--- @param elements integer[] the length of each element
--- @return string value
local function parse_overhead_lcd_line(indication_id, elements)
	local data = Module.parse_indication(indication_id)
	local value = ""

	-- elements have uuid names, first item never has any data, and are often right-aligned, lacking whitespace padding
	for index, length in ipairs(elements) do
		value = value .. Functions.pad_left(Functions.coerce_nil_to_string(data[index + 1]), length)
	end

	return value
end

--- Returns the string values of an lcd with two equal-length lines
--- @param indication_id integer the id of the dcs indication
--- @param length integer the length of the lines
--- @return string, string value
local function parse_overhead_lcd_dual_line(indication_id, length)
	local data = Module.parse_indication(indication_id)

	-- elements have uuid names, first item never has any data, and are often right-aligned, lacking whitespace padding
	local value_1 = Functions.pad_left(Functions.coerce_nil_to_string(data[2]), length)
	local value_2 = Functions.pad_left(Functions.coerce_nil_to_string(data[3]), length)

	return value_1, value_2
end

-- Flight Station Forward

-- Pilot Side Console

-- Pilot Oxygen Regulator
local PLT_OXYGEN_REGULATOR = "PLT Oxygen Regulator"

C_130J:defineToggleSwitchManualRange("PLT_OXYGEN_DILUTER_LEVER", devices.PLANE_ATM, 3029, 508, { -2, 2 }, PLT_OXYGEN_REGULATOR, "Pilot Oxygen Diluter Lever") -- -2 to 2 for the range is correct for this specific switch
C_130J:defineToggleSwitchManualRange("PLT_OXYGEN_SUPPLY_LEVER", devices.PLANE_ATM, 3031, 509, { -2, 2 }, PLT_OXYGEN_REGULATOR, "Pilot Oxygen Supply Lever") -- -2 to 2 for the range is correct for this specific switch
C_130J:define3PosTumb("PLT_OXYGEN_EMERGENCY_LEVER", devices.PLANE_ATM, 3030, 507, PLT_OXYGEN_REGULATOR, "Pilot Oxygen Emergency Lever", { positions = { "TEST MASK", "NORMAL", "EMERGENCY" } })
C_130J:defineFloat("PLT_OXYGEN_PRESSURE", 511, { -1, 1 }, PLT_OXYGEN_REGULATOR, "Pilot Oxygen Pressure")

-- Pilot Intercommunications System Monitor Panel
local PLT_ICS_MONITOR_PANEL = "Pilot Intercommunications System Monitor Panel"

C_130J:definePotentiometer("PLT_ICS_MON_VOR_1_VOLUME", devices.VOLUME_MANAGER, 3057, 428, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "VOR 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_VOR_1_BUTTON", devices.VOLUME_MANAGER, 3067, 427, PLT_ICS_MONITOR_PANEL, "VOR 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_TACAN_1_VOLUME", devices.VOLUME_MANAGER, 3059, 430, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "TACAN 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_TACAN_1_BUTTON", devices.VOLUME_MANAGER, 3069, 429, PLT_ICS_MONITOR_PANEL, "TACAN 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_ADF_1_VOLUME", devices.VOLUME_MANAGER, 3061, 432, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "ADF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_ADF_1_BUTTON", devices.VOLUME_MANAGER, 3071, 431, PLT_ICS_MONITOR_PANEL, "ADF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_SAR_VOLUME", devices.VOLUME_MANAGER, 3063, 434, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "SAR Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_SAR_BUTTON", devices.VOLUME_MANAGER, 3073, 433, PLT_ICS_MONITOR_PANEL, "SAR Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_BCN_VOLUME", devices.VOLUME_MANAGER, 3065, 436, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "BCN Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_BCN_BUTTON", devices.VOLUME_MANAGER, 3075, 435, PLT_ICS_MONITOR_PANEL, "BCN Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_VOR_2_VOLUME", devices.VOLUME_MANAGER, 3058, 438, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "VOR 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_VOR_2_BUTTON", devices.VOLUME_MANAGER, 3068, 437, PLT_ICS_MONITOR_PANEL, "VOR 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_TACAN_2_VOLUME", devices.VOLUME_MANAGER, 3060, 440, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "TACAN 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_TACAN_2_BUTTON", devices.VOLUME_MANAGER, 3070, 439, PLT_ICS_MONITOR_PANEL, "TACAN 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_ADF_2_VOLUME", devices.VOLUME_MANAGER, 3062, 442, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "ADF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_ADF_2_BUTTON", devices.VOLUME_MANAGER, 3072, 441, PLT_ICS_MONITOR_PANEL, "ADF 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_BLANK_VOLUME", devices.VOLUME_MANAGER, 3064, 444, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "Blank Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_BLANK_BUTTON", devices.VOLUME_MANAGER, 3074, 443, PLT_ICS_MONITOR_PANEL, "Blank Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_MON_RWR_VOLUME", devices.VOLUME_MANAGER, 3066, 446, { 0, 1 }, PLT_ICS_MONITOR_PANEL, "RWR Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_MON_RWR_BUTTON", devices.VOLUME_MANAGER, 3076, 445, PLT_ICS_MONITOR_PANEL, "RWR Pull to Monitor")

-- Pilot Side Console END

-- Copilot Side Console

-- Copilot Oxygen Regulator
local CPLT_OXYGEN_REGULATOR = "CPLT Oxygen Regulator"

C_130J:defineToggleSwitchManualRange("CPLT_OXYGEN_DILUTER_LEVER", devices.PLANE_ATM, 3034, 192, { -2, 2 }, CPLT_OXYGEN_REGULATOR, "Copilot Oxygen Diluter Lever") -- -2 to 2 for the range is correct for this specific switch
C_130J:defineToggleSwitchManualRange("CPLT_OXYGEN_SUPPLY_LEVER", devices.PLANE_ATM, 3032, 191, { -2, 2 }, CPLT_OXYGEN_REGULATOR, "Copilot Oxygen Supply Lever") -- -2 to 2 for the range is correct for this specific switch
C_130J:define3PosTumb("CPLT_OXYGEN_EMERGENCY_LEVER", devices.PLANE_ATM, 3033, 193, CPLT_OXYGEN_REGULATOR, "Copilot Oxygen Emergency Lever", { positions = { "TEST MASK", "NORMAL", "EMERGENCY" } })
C_130J:defineFloat("CPLT_OXYGEN_PRESSURE", 512, { -1, 1 }, CPLT_OXYGEN_REGULATOR, "Copilot Oxygen Pressure")

-- Copilot Intercommunications System Monitor Panel
local CPLT_ICS_MONITOR_PANEL = "Copilot Intercommunications System Monitor Panel"

C_130J:definePotentiometer("CPLT_ICS_MON_VOR_1_VOLUME", devices.VOLUME_MANAGER, 3077, 448, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "VOR 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_VOR_1_BUTTON", devices.VOLUME_MANAGER, 3087, 447, CPLT_ICS_MONITOR_PANEL, "VOR 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_TACAN_1_VOLUME", devices.VOLUME_MANAGER, 3079, 450, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "TACAN 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_TACAN_1_BUTTON", devices.VOLUME_MANAGER, 3089, 449, CPLT_ICS_MONITOR_PANEL, "TACAN 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_ADF_1_VOLUME", devices.VOLUME_MANAGER, 3081, 452, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "ADF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_ADF_1_BUTTON", devices.VOLUME_MANAGER, 3091, 451, CPLT_ICS_MONITOR_PANEL, "ADF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_SAR_VOLUME", devices.VOLUME_MANAGER, 3083, 454, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "SAR Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_SAR_BUTTON", devices.VOLUME_MANAGER, 3093, 453, CPLT_ICS_MONITOR_PANEL, "SAR Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_BCN_VOLUME", devices.VOLUME_MANAGER, 3085, 456, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "BCN Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_BCN_BUTTON", devices.VOLUME_MANAGER, 3095, 455, CPLT_ICS_MONITOR_PANEL, "BCN Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_VOR_2_VOLUME", devices.VOLUME_MANAGER, 3078, 458, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "VOR 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_VOR_2_BUTTON", devices.VOLUME_MANAGER, 3088, 457, CPLT_ICS_MONITOR_PANEL, "VOR 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_TACAN_2_VOLUME", devices.VOLUME_MANAGER, 3080, 460, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "TACAN 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_TACAN_2_BUTTON", devices.VOLUME_MANAGER, 3090, 459, CPLT_ICS_MONITOR_PANEL, "TACAN 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_ADF_2_VOLUME", devices.VOLUME_MANAGER, 3082, 462, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "ADF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_ADF_2_BUTTON", devices.VOLUME_MANAGER, 3092, 461, CPLT_ICS_MONITOR_PANEL, "ADF 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_BLANK_VOLUME", devices.VOLUME_MANAGER, 3084, 464, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "Blank Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_BLANK_BUTTON", devices.VOLUME_MANAGER, 3094, 463, CPLT_ICS_MONITOR_PANEL, "Blank Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_MON_RWR_VOLUME", devices.VOLUME_MANAGER, 3086, 466, { 0, 1 }, CPLT_ICS_MONITOR_PANEL, "RWR Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_MON_RWR_BUTTON", devices.VOLUME_MANAGER, 3096, 465, CPLT_ICS_MONITOR_PANEL, "RWR Pull to Monitor")

-- Copilot Side Console END

-- Main Instrument Panel

-- Parking Brake
local PARKING_BRAKE = "Parking Brake"

C_130J:defineToggleSwitch("PARKING_BRAKE_HANDLE", devices.MECH_INTERFACE, 3037, 29, PARKING_BRAKE, "Parking Brake Handle")

-- Pilot Reference Set/Mode Select Panel

local function parse_ref_mode_display(indicator_id)
	local display = Module.parse_indication(indicator_id)

	if display == nil then
		return ""
	end

	local value = display["ref_mode_value"]
	local period = display["ref_symbol_period"]

	if period ~= nil then
		value = value:sub(1, #value - 1) .. period .. value:sub(#value)
	end

	return Functions.pad_left(value, 5)
end

local PLT_REF_MODE = "PLT Reference Set/Mode Select Panel"

-- rotaries will only act as single increment, regardless of value set
C_130J:defineTumb("PLT_REF_MODE_SELECT", devices.PILOT_REF_MODE_PANEL, 3001, 110, 0.4, { -0.8, 0.8 }, nil, false, PLT_REF_MODE, "Reference Select Switch", { positions = { "HP", "RAD ALT", "IAS", "FPA", "MINS" } })
C_130J:defineRotaryWithRange("PLT_REF_SET_KNOB", devices.PILOT_REF_MODE_PANEL, 3002, 109, { -1, 1 }, PLT_REF_MODE, "Reference Set Knob")
C_130J:definePushButton("PLT_REF_SET_PRESS", devices.PILOT_REF_MODE_PANEL, 3003, 556, PLT_REF_MODE, "Reference Set Knob Press")
C_130J:defineRotaryWithRange("PLT_ALTITUDE_ALERT_KNOB", devices.PILOT_REF_MODE_PANEL, 3005, 108, { -1, 1 }, PLT_REF_MODE, "Altitude Alerter Set Knob")
C_130J:definePushButton("PLT_ALTITUDE_ALERT_PRESS", devices.PILOT_REF_MODE_PANEL, 3006, 557, PLT_REF_MODE, "Altitude Alerter Sync")
C_130J:defineRotaryWithRange("PLT_BARO_SET_KNOB", devices.PILOT_REF_MODE_PANEL, 3007, 107, { -1, 1 }, PLT_REF_MODE, "Baro Set Knob")
C_130J:definePushButton("PLT_BARO_SET_PRESS", devices.PILOT_REF_MODE_PANEL, 3008, 558, PLT_REF_MODE, "Baro Set Knob Press")

C_130J:definePushButton("PLT_REF_MODE_MASTER_WARNING", devices.PILOT_REF_MODE_PANEL, 3009, 80, PLT_REF_MODE, "Master Warning Button")
C_130J:definePushButton("PLT_REF_MODE_MASTER_CAUTION", devices.PILOT_REF_MODE_PANEL, 3010, 81, PLT_REF_MODE, "Master Caution Button")
C_130J:definePushButton("PLT_AP_MODE_ALT", devices.AP_INTERFACE, 3001, 82, PLT_REF_MODE, "ALT Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_SEL", devices.AP_INTERFACE, 3002, 84, PLT_REF_MODE, "SEL Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_HDG", devices.AP_INTERFACE, 3003, 86, PLT_REF_MODE, "HDG Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_NAV", devices.AP_INTERFACE, 3004, 88, PLT_REF_MODE, "NAV Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_APPR", devices.AP_INTERFACE, 3005, 90, PLT_REF_MODE, "APPR Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_VS", devices.AP_INTERFACE, 3006, 83, PLT_REF_MODE, "VS Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_IAS", devices.AP_INTERFACE, 3007, 85, PLT_REF_MODE, "IAS Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_BLANK", devices.AP_INTERFACE, 3010, 87, PLT_REF_MODE, "Blank Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_CAPS", devices.AP_INTERFACE, 3008, 89, PLT_REF_MODE, "CAPS Mode Switch")
C_130J:definePushButton("PLT_AP_MODE_AT", devices.AP_INTERFACE, 3009, 91, PLT_REF_MODE, "A/T Mode Switch")

C_130J:defineIndicatorLight("PLT_REF_MODE_MASTER_WARNING_L", 4045, PLT_REF_MODE, "Master Warning Light", { color = "red" })
C_130J:defineIndicatorLight("PLT_REF_MODE_MASTER_CAUTION_L", 4046, PLT_REF_MODE, "Master Caution Light", { color = "yellow" })
C_130J:defineIndicatorLight("PLT_AP_MODE_ALT_L", 4047, PLT_REF_MODE, "ALT Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_SEL_L", 4049, PLT_REF_MODE, "SEL Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_HDG_L", 4051, PLT_REF_MODE, "HDG Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_NAV_L", 4052, PLT_REF_MODE, "NAV Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_APPR_L", 4054, PLT_REF_MODE, "APPR Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_VS_L", 4048, PLT_REF_MODE, "VS Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_IAS_L", 4050, PLT_REF_MODE, "IAS Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_CAPS_L", 4053, PLT_REF_MODE, "CAPS Mode Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_AP_MODE_AT_L", 4055, PLT_REF_MODE, "A/T Mode Light", { color = "green" })

C_130J:defineString("PLT_REF_MODE_DISPLAY", function()
	return parse_ref_mode_display(16)
end, 5, PLT_REF_MODE, "REF/MODE Display")

-- Copilot Reference Set/Mode Select Panel
local CPLT_REF_MODE = "CPLT Reference Set/Mode Select Panel"

-- rotaries will only act as single increment, regardless of value set
C_130J:defineTumb("CPLT_REF_MODE_SELECT", devices.COPILOT_REF_MODE_PANEL, 3001, 111, 0.4, { -0.8, 0.8 }, nil, false, CPLT_REF_MODE, "Reference Select Switch", { positions = { "HP", "RAD ALT", "IAS", "FPA", "MINS" } })
C_130J:defineRotaryWithRange("CPLT_REF_SET_KNOB", devices.COPILOT_REF_MODE_PANEL, 3002, 106, { -1, 1 }, CPLT_REF_MODE, "Reference Set Knob")
C_130J:definePushButton("CPLT_REF_SET_PRESS", devices.COPILOT_REF_MODE_PANEL, 3003, 559, CPLT_REF_MODE, "Reference Set Knob Press")
C_130J:defineRotaryWithRange("CPLT_ALTITUDE_ALERT_KNOB", devices.COPILOT_REF_MODE_PANEL, 3005, 105, { -1, 1 }, CPLT_REF_MODE, "Altitude Alerter Set Knob")
C_130J:definePushButton("CPLT_ALTITUDE_ALERT_PRESS", devices.COPILOT_REF_MODE_PANEL, 3006, 560, CPLT_REF_MODE, "Altitude Alerter Sync")
C_130J:defineRotaryWithRange("CPLT_BARO_SET_KNOB", devices.COPILOT_REF_MODE_PANEL, 3007, 104, { -1, 1 }, CPLT_REF_MODE, "Baro Set Knob")
C_130J:definePushButton("CPLT_BARO_SET_PRESS", devices.COPILOT_REF_MODE_PANEL, 3008, 561, CPLT_REF_MODE, "Baro Set Knob Press")

C_130J:definePushButton("CPLT_REF_MODE_MASTER_WARNING", devices.COPILOT_REF_MODE_PANEL, 3009, 92, CPLT_REF_MODE, "Master Warning Button")
C_130J:definePushButton("CPLT_REF_MODE_MASTER_CAUTION", devices.COPILOT_REF_MODE_PANEL, 3010, 93, CPLT_REF_MODE, "Master Caution Button")
C_130J:definePushButton("CPLT_AP_MODE_ALT", devices.AP_INTERFACE, 3021, 94, CPLT_REF_MODE, "ALT Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_SEL", devices.AP_INTERFACE, 3022, 96, CPLT_REF_MODE, "SEL Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_HDG", devices.AP_INTERFACE, 3023, 98, CPLT_REF_MODE, "HDG Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_NAV", devices.AP_INTERFACE, 3024, 100, CPLT_REF_MODE, "NAV Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_APPR", devices.AP_INTERFACE, 3025, 102, CPLT_REF_MODE, "APPR Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_VS", devices.AP_INTERFACE, 3026, 95, CPLT_REF_MODE, "VS Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_IAS", devices.AP_INTERFACE, 3027, 97, CPLT_REF_MODE, "IAS Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_BLANK", devices.AP_INTERFACE, 3030, 99, CPLT_REF_MODE, "Blank Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_CAPS", devices.AP_INTERFACE, 3028, 101, CPLT_REF_MODE, "CAPS Mode Switch")
C_130J:definePushButton("CPLT_AP_MODE_AT", devices.AP_INTERFACE, 3029, 103, CPLT_REF_MODE, "A/T Mode Switch")

-- draw args are identical to PLT
C_130J:defineIndicatorLight("CPLT_REF_MODE_MASTER_WARNING_L", 4045, CPLT_REF_MODE, "Master Warning Light", { color = "red" })
C_130J:defineIndicatorLight("CPLT_REF_MODE_MASTER_CAUTION_L", 4046, CPLT_REF_MODE, "Master Caution Light", { color = "yellow" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_ALT_L", 4047, CPLT_REF_MODE, "ALT Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_SEL_L", 4049, CPLT_REF_MODE, "SEL Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_HDG_L", 4051, CPLT_REF_MODE, "HDG Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_NAV_L", 4052, CPLT_REF_MODE, "NAV Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_APPR_L", 4054, CPLT_REF_MODE, "APPR Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_VS_L", 4048, CPLT_REF_MODE, "VS Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_IAS_L", 4050, CPLT_REF_MODE, "IAS Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_CAPS_L", 4053, CPLT_REF_MODE, "CAPS Mode Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_AP_MODE_AT_L", 4055, CPLT_REF_MODE, "A/T Mode Light", { color = "green" })

C_130J:defineString("CPLT_REF_MODE_DISPLAY", function()
	return parse_ref_mode_display(17)
end, 5, CPLT_REF_MODE, "REF/MODE Display")

-- Left Outer Avionics Management Unit
local LO_AMU = "Left Outer AMU"

C_130J:defineRockerSwitch("L_AMU_BRT_SWITCH", devices.P_DISPLAYS, 3009, 3009, 3020, 3020, 200, LO_AMU, "Left AMU Brightness Switch", { positions = { "DECREASE", "MIDDLE", "INCREASE" } })

C_130J:definePushButton("LO_AMU_L1", devices.P_DISPLAYS, 3011, 133, LO_AMU, "Button L1")
C_130J:definePushButton("LO_AMU_L2", devices.P_DISPLAYS, 3012, 134, LO_AMU, "Button L2")
C_130J:definePushButton("LO_AMU_L3", devices.P_DISPLAYS, 3013, 135, LO_AMU, "Button L3")
C_130J:definePushButton("LO_AMU_L4", devices.P_DISPLAYS, 3014, 136, LO_AMU, "Button L4")
C_130J:definePushButton("LO_AMU_R1", devices.P_DISPLAYS, 3015, 137, LO_AMU, "Button R1")
C_130J:definePushButton("LO_AMU_R2", devices.P_DISPLAYS, 3016, 138, LO_AMU, "Button R2")
C_130J:definePushButton("LO_AMU_R3", devices.P_DISPLAYS, 3017, 139, LO_AMU, "Button R3")
C_130J:definePushButton("LO_AMU_R4", devices.P_DISPLAYS, 3018, 140, LO_AMU, "Button R4")

-- Left Inner Avionics Management Unit
local LI_AMU = "Left Inner AMU"

C_130J:definePushButton("LI_AMU_L1", devices.P_DISPLAYS, 3001, 141, LI_AMU, "Button L1")
C_130J:definePushButton("LI_AMU_L2", devices.P_DISPLAYS, 3002, 142, LI_AMU, "Button L2")
C_130J:definePushButton("LI_AMU_L3", devices.P_DISPLAYS, 3003, 143, LI_AMU, "Button L3")
C_130J:definePushButton("LI_AMU_L4", devices.P_DISPLAYS, 3004, 144, LI_AMU, "Button L4")
C_130J:definePushButton("LI_AMU_R1", devices.P_DISPLAYS, 3005, 145, LI_AMU, "Button R1")
C_130J:definePushButton("LI_AMU_R2", devices.P_DISPLAYS, 3006, 146, LI_AMU, "Button R2")
C_130J:definePushButton("LI_AMU_R3", devices.P_DISPLAYS, 3007, 147, LI_AMU, "Button R3")
C_130J:definePushButton("LI_AMU_R4", devices.P_DISPLAYS, 3008, 148, LI_AMU, "Button R4")

-- Right Inner Avionics Management Unit
local RI_AMU = "Right Inner AMU"

C_130J:definePushButton("RI_AMU_L1", devices.C_DISPLAYS, 3011, 174, RI_AMU, "Button L1")
C_130J:definePushButton("RI_AMU_L2", devices.C_DISPLAYS, 3012, 175, RI_AMU, "Button L2")
C_130J:definePushButton("RI_AMU_L3", devices.C_DISPLAYS, 3013, 176, RI_AMU, "Button L3")
C_130J:definePushButton("RI_AMU_L4", devices.C_DISPLAYS, 3014, 177, RI_AMU, "Button L4")
C_130J:definePushButton("RI_AMU_R1", devices.C_DISPLAYS, 3015, 178, RI_AMU, "Button R1")
C_130J:definePushButton("RI_AMU_R2", devices.C_DISPLAYS, 3016, 179, RI_AMU, "Button R2")
C_130J:definePushButton("RI_AMU_R3", devices.C_DISPLAYS, 3017, 180, RI_AMU, "Button R3")
C_130J:definePushButton("RI_AMU_R4", devices.C_DISPLAYS, 3018, 181, RI_AMU, "Button R4")

-- Right Outer Avionics Management Unit
local RO_AMU = "Right Outer AMU"

C_130J:defineRockerSwitch("R_AMU_BRT_SWITCH", devices.C_DISPLAYS, 3009, 3009, 3020, 3020, 202, RO_AMU, "Right AMU Brightness Switch", { positions = { "DECREASE", "MIDDLE", "INCREASE" } })

C_130J:definePushButton("RO_AMU_L1", devices.C_DISPLAYS, 3001, 182, RO_AMU, "Button L1")
C_130J:definePushButton("RO_AMU_L2", devices.C_DISPLAYS, 3002, 183, RO_AMU, "Button L2")
C_130J:definePushButton("RO_AMU_L3", devices.C_DISPLAYS, 3003, 184, RO_AMU, "Button L3")
C_130J:definePushButton("RO_AMU_L4", devices.C_DISPLAYS, 3004, 185, RO_AMU, "Button L4")
C_130J:definePushButton("RO_AMU_R1", devices.C_DISPLAYS, 3005, 186, RO_AMU, "Button R1")
C_130J:definePushButton("RO_AMU_R2", devices.C_DISPLAYS, 3006, 187, RO_AMU, "Button R2")
C_130J:definePushButton("RO_AMU_R3", devices.C_DISPLAYS, 3007, 188, RO_AMU, "Button R3")
C_130J:definePushButton("RO_AMU_R4", devices.C_DISPLAYS, 3008, 189, RO_AMU, "Button R4")

-- Communication/Navigation/Electronic Circuit Breaker Panel
local CNBP = "Communication/Navigation/Electronic Circuit Breaker Panel"

C_130J:defineRockerSwitch("CNBP_BRT_SWITCH", devices.CNBP, 3024, 3024, 3025, 3025, 201, CNBP, "Brightness Switch", { positions = { "DECREASE", "MIDDLE", "INCREASE" } })

C_130J:definePushButton("CNBP_COMM", devices.CNBP, 3021, 159, CNBP, "COMM Button")
C_130J:definePushButton("CNBP_NAV", devices.CNBP, 3022, 160, CNBP, "NAV Button")
C_130J:definePushButton("CNBP_ECB", devices.CNBP, 3023, 161, CNBP, "ECB Button")

C_130J:definePushButton("CNBP_NUMPAD_1", devices.CNBP, 3002, 162, CNBP, "Numpad Button 1")
C_130J:definePushButton("CNBP_NUMPAD_2", devices.CNBP, 3003, 163, CNBP, "Numpad Button 2")
C_130J:definePushButton("CNBP_NUMPAD_3", devices.CNBP, 3004, 164, CNBP, "Numpad Button 3")
C_130J:definePushButton("CNBP_NUMPAD_4", devices.CNBP, 3005, 165, CNBP, "Numpad Button 4")
C_130J:definePushButton("CNBP_NUMPAD_5", devices.CNBP, 3006, 166, CNBP, "Numpad Button 5")
C_130J:definePushButton("CNBP_NUMPAD_6", devices.CNBP, 3007, 167, CNBP, "Numpad Button 6")
C_130J:definePushButton("CNBP_NUMPAD_7", devices.CNBP, 3008, 168, CNBP, "Numpad Button 7")
C_130J:definePushButton("CNBP_NUMPAD_8", devices.CNBP, 3009, 169, CNBP, "Numpad Button 8")
C_130J:definePushButton("CNBP_NUMPAD_9", devices.CNBP, 3010, 170, CNBP, "Numpad Button 9")
C_130J:definePushButton("CNBP_NUMPAD_DECIMAL", devices.CNBP, 3011, 171, CNBP, "Numpad Button Decimal")
C_130J:definePushButton("CNBP_NUMPAD_0", devices.CNBP, 3001, 172, CNBP, "Numpad Button 0")
C_130J:definePushButton("CNBP_NUMPAD_CLEAR", devices.CNBP, 3012, 173, CNBP, "Numpad Button Clear")

C_130J:definePushButton("CNBP_L1", devices.CNBP, 3013, 152, CNBP, "Button L1")
C_130J:definePushButton("CNBP_L2", devices.CNBP, 3014, 152, CNBP, "Button L2")
C_130J:definePushButton("CNBP_L3", devices.CNBP, 3015, 153, CNBP, "Button L3")
C_130J:definePushButton("CNBP_L4", devices.CNBP, 3016, 154, CNBP, "Button L4")
C_130J:definePushButton("CNBP_R1", devices.CNBP, 3017, 155, CNBP, "Button R1")
C_130J:definePushButton("CNBP_R2", devices.CNBP, 3018, 156, CNBP, "Button R2")
C_130J:definePushButton("CNBP_R3", devices.CNBP, 3019, 157, CNBP, "Button R3")
C_130J:definePushButton("CNBP_R4", devices.CNBP, 3020, 158, CNBP, "Button R4")

-- Pilot Mode Annunciator Panel
local PLT_MODE_ANNUNICIATOR = "PLT Mode Annunciator Panel"

C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_AP_ON", 4056, PLT_MODE_ANNUNICIATOR, "AP ON Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_PTCH_OFF", 4057, PLT_MODE_ANNUNICIATOR, "PTCH OFF Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_NAV_ARM", 4058, PLT_MODE_ANNUNICIATOR, "NAV ARM Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_GS_ARM", 4059, PLT_MODE_ANNUNICIATOR, "GS ARM Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_GO_ARND", 4060, PLT_MODE_ANNUNICIATOR, "GO ARND Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_CAT2_ARM", 4061, PLT_MODE_ANNUNICIATOR, "CAT2 ARM Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_AP_DSGN", 4062, PLT_MODE_ANNUNICIATOR, "AP DSGN Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_LAT_OFF", 4063, PLT_MODE_ANNUNICIATOR, "LAT OFF Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_NAV_CAPT", 4064, PLT_MODE_ANNUNICIATOR, "NAV CAPT Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_GS_CAPT", 4065, PLT_MODE_ANNUNICIATOR, "GS CAPT Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_BACK_LOC", 4066, PLT_MODE_ANNUNICIATOR, "BACK LOC Light", { color = "green" })
C_130J:defineIndicatorLight("PLT_MODE_ANNUNCIATOR_CAT2", 4067, PLT_MODE_ANNUNICIATOR, "CAT2 Light", { color = "green" })

-- Copilot Mode Annunciator Panel
local CPLT_MODE_ANNUNICIATOR = "CPLT Mode Annunciator Panel"

C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_AP_ON", 4114, CPLT_MODE_ANNUNICIATOR, "AP ON Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_PTCH_OFF", 4115, CPLT_MODE_ANNUNICIATOR, "PTCH OFF Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_NAV_ARM", 4116, CPLT_MODE_ANNUNICIATOR, "NAV ARM Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_GS_ARM", 4117, CPLT_MODE_ANNUNICIATOR, "GS ARM Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_GO_ARND", 4118, CPLT_MODE_ANNUNICIATOR, "GO ARND Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_CAT2_ARM", 4119, CPLT_MODE_ANNUNICIATOR, "CAT2 ARM Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_AP_DSGN", 4120, CPLT_MODE_ANNUNICIATOR, "AP DSGN Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_LAT_OFF", 4121, CPLT_MODE_ANNUNICIATOR, "LAT OFF Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_NAV_CAPT", 4122, CPLT_MODE_ANNUNICIATOR, "NAV CAPT Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_GS_CAPT", 4123, CPLT_MODE_ANNUNICIATOR, "GS CAPT Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_BACK_LOC", 4124, CPLT_MODE_ANNUNICIATOR, "BACK LOC Light", { color = "green" })
C_130J:defineIndicatorLight("CPLT_MODE_ANNUNCIATOR_CAT2", 4125, CPLT_MODE_ANNUNICIATOR, "CAT2 Light", { color = "green" })

-- Pilot Inclinometer

-- Copilot Inclinometer

-- Left Outer Head Down Display

-- Left Inner Head Down Display

-- Right Inner Head Down Display

-- Right Outer Head Down Display

-- Hydraulic Control Panel
local HYD_PANEL = "Hydraulic Control Panel"

C_130J:defineToggleSwitch("HYD_ANTI_SKID", devices.ENGINE_APU_CTRL, 3029, 37, HYD_PANEL, "Anti-Skid Switch")
C_130J:definePushButton("HYD_EMER_BRAKE_SEL", devices.HYDRAULICS, 3001, 99, HYD_PANEL, "Emergency Brake Select")
C_130J:definePushButton("HYD_ENGINE_PUMP_1", devices.HYDRAULICS, 3003, 39, HYD_PANEL, "Engine 1 Utility Pump")
C_130J:definePushButton("HYD_ENGINE_PUMP_2", devices.HYDRAULICS, 3004, 40, HYD_PANEL, "Engine 2 Utility Pump")
C_130J:definePushButton("HYD_ENGINE_PUMP_3", devices.HYDRAULICS, 3005, 41, HYD_PANEL, "Engine 3 Boost Pump")
C_130J:definePushButton("HYD_ENGINE_PUMP_4", devices.HYDRAULICS, 3006, 42, HYD_PANEL, "Engine 4 Boost Pump")
C_130J:definePushButton("HYD_ENGINE_PUMP_SUCTION_UTIL", devices.HYDRAULICS, 3007, 43, HYD_PANEL, "Utility Suction Boost Pump")
C_130J:definePushButton("HYD_ENGINE_PUMP_SUCTION_BOOST", devices.HYDRAULICS, 3008, 44, HYD_PANEL, "Suction Boost Pump")
C_130J:defineToggleSwitch("HYD_AUX_PUMP", devices.HYDRAULICS, 3002, 45, HYD_PANEL, "Auxiliary Hydraulic Pump")

C_130J:defineIndicatorLight("HYD_AUX_PUMP_ON", 4041, HYD_PANEL, "Auxiliary Pump On", { color = "green" })
C_130J:defineIndicatorLight("HYD_EMER_BRAKE_SEL_EMER", 4068, HYD_PANEL, "Emergency Brake Select EMER", { color = "green" })
C_130J:defineIndicatorLight("HYD_ENGINE_PUMP_1_OFF", 4069, HYD_PANEL, "Engine 1 Utility Pump Off", { color = "green" })
C_130J:defineIndicatorLight("HYD_ENGINE_PUMP_2_OFF", 4070, HYD_PANEL, "Engine 2 Utility Pump Off", { color = "green" })
C_130J:defineIndicatorLight("HYD_ENGINE_PUMP_3_OFF", 4071, HYD_PANEL, "Engine 3 Boost Pump Off", { color = "green" })
C_130J:defineIndicatorLight("HYD_ENGINE_PUMP_4_OFF", 4072, HYD_PANEL, "Engine 4 Boost Pump Off", { color = "green" })
C_130J:defineIndicatorLight("HYD_ENGINE_PUMP_SUCTION_UTIL_OFF", 4073, HYD_PANEL, "Utility Suction Boost Pump Off", { color = "green" })
C_130J:defineIndicatorLight("HYD_ENGINE_PUMP_SUCTION_BOOST_OFF", 4074, HYD_PANEL, "Suction Boost Pump Off", { color = "green" })

C_130J:defineString("HYD_AUX_PRESSURE", function()
	return parse_overhead_lcd_line(43, { 4 })
end, 4, HYD_PANEL, "Auxiliary Pressure")

-- Landing Gear/Landing Lights Panel
local LANDING = "Landing Gear/Landing Lights Panel"

C_130J:defineFloat("LANDING_GEAR_LOCKED_L", 4033, { 0, 1 }, LANDING, "Left Landing Gear Locked Light (Green)")
C_130J:defineFloat("LANDING_GEAR_LOCKED_R", 4034, { 0, 1 }, LANDING, "Right Landing Gear Locked Light (Green)")
C_130J:defineFloat("LANDING_GEAR_LOCKED_C", 4032, { 0, 1 }, LANDING, "Center Landing Gear Locked Light (Green)")
C_130J:defineFloat("LANDING_GEAR_LEVER_LIGHT", 4035, { 0, 1 }, LANDING, "Landing Gear Handle Light (Red)")

C_130J:defineToggleSwitch("LANDING_GEAR_LEVER", devices.HYDRAULICS, 3022, 126, LANDING, "Landing Gear Lever")
C_130J:definePushButton("LANDING_GEAR_LOCK_RELEASE", devices.HYDRAULICS, 3027, 36, LANDING, "Landing Gear Downlock Release")
C_130J:defineToggleSwitch("LANDING_LIGHTS_L", devices.LIGHTING_PANELS, 3002, 32, LANDING, "Left Landing Lights")
C_130J:defineToggleSwitch("LANDING_LIGHTS_R", devices.LIGHTING_PANELS, 3001, 33, LANDING, "Right Landing Lights")
C_130J:defineToggleSwitch("TAXI_LIGHTS", devices.LIGHTING_PANELS, 3006, 34, LANDING, "Taxi Lights")
C_130J:defineToggleSwitch("TAXI_LIGHTS_WINGTIP", devices.LIGHTING_PANELS, 3007, 35, LANDING, "Wingtip Taxi Lights")

C_130J:define3PosTumb("LANDING_LIGHTS_MOTOR_L", devices.LIGHTING_PANELS, 3004, 30, LANDING, "Left Landing Light Motor", { positions = { "RETRACT", "HOLD", "EXTEND" } })
C_130J:define3PosTumb("LANDING_LIGHTS_MOTOR_R", devices.LIGHTING_PANELS, 3003, 31, LANDING, "Right Landing Light Motor", { positions = { "RETRACT", "HOLD", "EXTEND" } })

-- Flap and Trim Indicator Panel
local FLAP_TRIM_INDICATOR = "Flap and Trim Indicator Panel"

C_130J:defineFloat("FLAP_TRIM_INDICATOR_LEFT_AILERON", 470, { -1, 1 }, FLAP_TRIM_INDICATOR, "Left Aileron Trim Indicator")
C_130J:defineFloat("FLAP_TRIM_INDICATOR_RIGHT_AILERON", 471, { -1, 1 }, FLAP_TRIM_INDICATOR, "Right Aileron Trim Indicator")
C_130J:defineFloat("FLAP_TRIM_INDICATOR_RUDDER", 472, { -1, 1 }, FLAP_TRIM_INDICATOR, "Rudder Trim Indicator")
C_130J:defineFloat("FLAP_TRIM_INDICATOR_ELEVATOR", 473, { -1, 1 }, FLAP_TRIM_INDICATOR, "Elevator Trim Indicator")
C_130J:defineFloat("FLAP_TRIM_INDICATOR_FLAPS", 426, { -1, 1 }, FLAP_TRIM_INDICATOR, "Flaps Trim Indicator")

-- Standby Altimeter/Airspeed Indicator

-- Standby Attitude Indicator

-- Main Instrument Panel END

-- Overhead Console

-- Control Boost Panel
local CONTROL_BOOST = "Control Boost Panel"

C_130J:defineToggleSwitch("CTRL_BOOST_ELEVATOR_BOOST_GUARD", devices.HYDRAULICS, 3010, 335, CONTROL_BOOST, "Elevator Control Boost Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("CTRL_BOOST_ELEVATOR_UTIL_GUARD", devices.HYDRAULICS, 3011, 336, CONTROL_BOOST, "Elevator Utility Control Boost Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("CTRL_BOOST_RUDDER_BOOST_GUARD", devices.HYDRAULICS, 3012, 337, CONTROL_BOOST, "Rudder Control Boost Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("CTRL_BOOST_RUDDER_UTIL_GUARD", devices.HYDRAULICS, 3013, 338, CONTROL_BOOST, "Rudder Utility Control Boost Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("CTRL_BOOST_AILERON_BOOST_GUARD", devices.HYDRAULICS, 3014, 339, CONTROL_BOOST, "Aileron Control Boost Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("CTRL_BOOST_AILERON_UTIL_GUARD", devices.HYDRAULICS, 3015, 340, CONTROL_BOOST, "Aileron Utility Control Boost Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitchManualRange("CTRL_BOOST_ELEVATOR_BOOST", devices.HYDRAULICS, 3016, 500, { 1, 0 }, CONTROL_BOOST, "Elevator Control Boost Switch")
C_130J:defineToggleSwitchManualRange("CTRL_BOOST_ELEVATOR_UTIL", devices.HYDRAULICS, 3017, 501, { 1, 0 }, CONTROL_BOOST, "Elevator Utility Control Boost Switch")
C_130J:defineToggleSwitchManualRange("CTRL_BOOST_RUDDER_BOOST", devices.HYDRAULICS, 3018, 502, { 1, 0 }, CONTROL_BOOST, "Rudder Control Boost Switch")
C_130J:defineToggleSwitchManualRange("CTRL_BOOST_RUDDER_UTIL", devices.HYDRAULICS, 3019, 503, { 1, 0 }, CONTROL_BOOST, "Rudder Utility Control Boost Switch")
C_130J:defineToggleSwitchManualRange("CTRL_BOOST_AILERON_BOOST", devices.HYDRAULICS, 3020, 504, { 1, 0 }, CONTROL_BOOST, "Aileron Control Boost Switch")
C_130J:defineToggleSwitchManualRange("CTRL_BOOST_AILERON_UTIL", devices.HYDRAULICS, 3021, 505, { 1, 0 }, CONTROL_BOOST, "Aileron Utility Control Boost Switch")

-- Oil Cooler Flaps Panel
local OIL_COOLER_FLAPS = "Oil Cooler Flaps Panel"

C_130J:defineOilCoolerFlapsSwitch("OIL_COOLER_FLAPS_1", devices.MECH_INTERFACE, 3032, 3082, 3074, 3078, 495, OIL_COOLER_FLAPS, "Oil Cooler Flaps 1 Switch")
C_130J:defineOilCoolerFlapsSwitch("OIL_COOLER_FLAPS_2", devices.MECH_INTERFACE, 3033, 3083, 3075, 3079, 496, OIL_COOLER_FLAPS, "Oil Cooler Flaps 2 Switch")
C_130J:defineOilCoolerFlapsSwitch("OIL_COOLER_FLAPS_3", devices.MECH_INTERFACE, 3034, 3084, 3076, 3080, 497, OIL_COOLER_FLAPS, "Oil Cooler Flaps 3 Switch")
C_130J:defineOilCoolerFlapsSwitch("OIL_COOLER_FLAPS_4", devices.MECH_INTERFACE, 3035, 3085, 3077, 3081, 498, OIL_COOLER_FLAPS, "Oil Cooler Flaps 4 Switch")

-- Electrical Panel
local ELECTRICAL_PANEL = "Electrical Panel"

C_130J:defineToggleSwitch("ELECTRICAL_GENERATOR_1", devices.ENGINE_APU_CTRL, 3002, 341, ELECTRICAL_PANEL, "Generator 1 Switch")
C_130J:defineToggleSwitch("ELECTRICAL_GENERATOR_2", devices.ENGINE_APU_CTRL, 3003, 342, ELECTRICAL_PANEL, "Generator 2 Switch")
C_130J:defineToggleSwitch("ELECTRICAL_GENERATOR_3", devices.ENGINE_APU_CTRL, 3004, 343, ELECTRICAL_PANEL, "Generator 3 Switch")
C_130J:defineToggleSwitch("ELECTRICAL_GENERATOR_4", devices.ENGINE_APU_CTRL, 3005, 344, ELECTRICAL_PANEL, "Generator 4 Switch")
C_130J:defineIndicatorLight("ELECTRICAL_GENERATOR_1_LIGHT", 4036, ELECTRICAL_PANEL, "Generator 1 Light", { color = "Green" })
C_130J:defineIndicatorLight("ELECTRICAL_GENERATOR_2_LIGHT", 4037, ELECTRICAL_PANEL, "Generator 2 Light", { color = "Green" })
C_130J:defineIndicatorLight("ELECTRICAL_GENERATOR_3_LIGHT", 4038, ELECTRICAL_PANEL, "Generator 3 Light", { color = "Green" })
C_130J:defineIndicatorLight("ELECTRICAL_GENERATOR_4_LIGHT", 4039, ELECTRICAL_PANEL, "Generator 4 Light", { color = "Green" })
C_130J:define3PosTumb("ELECTRICAL_EXT_POWER_APU", devices.ENGINE_APU_CTRL, 3006, 467, ELECTRICAL_PANEL, "External Power/APU Switch", { positions = { "EXT PWR", "OFF", "APU" } })
C_130J:define3PosTumb("ELECTRICAL_BATTERY_TEST", devices.ENGINE_APU_CTRL, 3033, 383, ELECTRICAL_PANEL, "Battery Test Switch", { positions = { "AV", "ISOL", "UTIL" } })
C_130J:defineToggleSwitch("ELECTRICAL_BATTERY", devices.ENGINE_APU_CTRL, 3001, 371, ELECTRICAL_PANEL, "Battery Switch")
C_130J:defineString("ELECTRICAL_DC_VOLTS", function()
	return parse_overhead_lcd_line(23, { 2, 1, 1 })
end, 4, ELECTRICAL_PANEL, "DC Volts Display")

-- Pressurization Panel
local PRESSURIZATION = "Pressurization Panel"

C_130J:defineRockerSwitch("PRESS_OUTFLOW_VALVE", devices.PLANE_ATM, 3010, 3010, 3010, 3010, 345, PRESSURIZATION, "Outflow Valve Control", { positions = { "CLOSE", "OFF", "OPEN" } })
C_130J:definePotentiometer("PRESS_RATE_CONTROL_KNOB", devices.PLANE_ATM, 3014, 1333, { 0, 1 }, PRESSURIZATION, "Pressurization Rate Control Knob")
C_130J:defineRotary("PRESS_LANDING_KNOB", devices.PLANE_ATM, 3015, 1332, PRESSURIZATION, "Landing/Constant Altitude Selector")
C_130J:defineTumb("PRESS_MODE", devices.PLANE_ATM, 3012, 468, 0.25, { -0.5, 0.5 }, nil, false, PRESSURIZATION, "Pressurization Mode Switch", { positions = { "CONST ALT", "MAN", "AUTO", "NO PRESS", "AUX VENT" } })
C_130J:defineToggleSwitch("PRESS_EMER_DUMP", devices.PLANE_ATM, 3011, 1363, PRESSURIZATION, "Emergency Depressurize Switch", { positions = { "NORM", "DUMP" } })
C_130J:defineToggleSwitch("PRESS_EMER_DUMP_GUARD", devices.PLANE_ATM, 3013, 334, PRESSURIZATION, "Emergency Depressurize Switch Guard", { positions = CommonPositions.COVER })

C_130J:defineString("PRESS_RATE", function()
	return parse_overhead_lcd_line(38, { 5 })
end, 5, PRESSURIZATION, "Cabin Rate Indicator")
C_130J:defineString("PRESS_CABIN_ALT", function()
	return parse_overhead_lcd_line(39, { 5 })
end, 5, PRESSURIZATION, "Cabin Altitude Indicator")
C_130J:defineString("PRESS_DIF", function()
	return parse_overhead_lcd_line(40, { 2, 1, 1 })
end, 4, PRESSURIZATION, "Differential Pressure Indicator")
C_130J:defineString("PRESS_LDG_CONST", function()
	return parse_overhead_lcd_line(41, { 5 })
end, 5, PRESSURIZATION, "Landing/Constant Altitude Pressure Indicator")

-- Fuel Management Panel
local FUEL_MANAGEMENT = "Fuel Management Panel"

C_130J:defineToggleSwitch("FUEL_DUMP_L", devices.FUEL_SYSTEM, 3022, 1338, FUEL_MANAGEMENT, "Left Fuel Dump Switch")
C_130J:defineToggleSwitch("FUEL_DUMP_L_GUARD", devices.FUEL_SYSTEM, 3017, 332, FUEL_MANAGEMENT, "Left Fuel Dump Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("FUEL_DUMP_R", devices.FUEL_SYSTEM, 3021, 1339, FUEL_MANAGEMENT, "Right Fuel Dump Switch")
C_130J:defineToggleSwitch("FUEL_DUMP_R_GUARD", devices.FUEL_SYSTEM, 3016, 333, FUEL_MANAGEMENT, "Right Fuel Dump Switch Guard", { positions = CommonPositions.COVER })

C_130J:defineMultipositionSwitch("FUEL_TANK_SELECTOR", devices.FUEL_SYSTEM, 3015, 370, 9, 1 / 8, FUEL_MANAGEMENT, "Fuel Tank Select", { positions = { "OFF", "1", "2", "LA", "RA", "3", "4", "LE", "RE" } })
C_130J:defineRotary("FUEL_QTY_SET", devices.FUEL_SYSTEM, 3019, 487, FUEL_MANAGEMENT, "Fuel Transfer Quantity Set Knob")
C_130J:define3PosTumb("FUEL_SPR_VALVE", devices.FUEL_SYSTEM, 3018, 362, FUEL_MANAGEMENT, "Single Point Refueling (SPR) Valve Switch")
C_130J:definePushButton("FUEL_FLCV_TEST", devices.FUEL_SYSTEM, 3010, 354, FUEL_MANAGEMENT, "Fuel Level Control Valve (FLCV) Test Button")

local XFER_POSITIONS = { "FROM", "OFF", "TO" }

C_130J:define3PosTumb("FUEL_XFER_EXT_L", devices.FUEL_SYSTEM, 3007, 356, FUEL_MANAGEMENT, "Left External Tank Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_EXT_R", devices.FUEL_SYSTEM, 3008, 365, FUEL_MANAGEMENT, "Right External Tank Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_AUX_L", devices.FUEL_SYSTEM, 3005, 359, FUEL_MANAGEMENT, "Left Auxiliary Tank Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_AUX_R", devices.FUEL_SYSTEM, 3006, 361, FUEL_MANAGEMENT, "Right Auxiliary Tank Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_MAIN_1", devices.FUEL_SYSTEM, 3001, 357, FUEL_MANAGEMENT, "Main Tank 1 Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_MAIN_2", devices.FUEL_SYSTEM, 3002, 358, FUEL_MANAGEMENT, "Main Tank 2 Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_MAIN_3", devices.FUEL_SYSTEM, 3003, 363, FUEL_MANAGEMENT, "Main Tank 3 Transfer Pump", { positions = XFER_POSITIONS })
C_130J:define3PosTumb("FUEL_XFER_MAIN_4", devices.FUEL_SYSTEM, 3004, 364, FUEL_MANAGEMENT, "Main Tank 4 Transfer Pump", { positions = XFER_POSITIONS })

C_130J:defineToggleSwitch("FUEL_XFEED_SHIP", devices.FUEL_SYSTEM, 3009, 360, FUEL_MANAGEMENT, "Crosship Separation Valve")
C_130J:defineToggleSwitch("FUEL_XFEED_ENG_1", devices.FUEL_SYSTEM, 3011, 366, FUEL_MANAGEMENT, "Engine 1 Crossfeed Valve")
C_130J:defineToggleSwitch("FUEL_XFEED_ENG_2", devices.FUEL_SYSTEM, 3012, 367, FUEL_MANAGEMENT, "Engine 2 Crossfeed Valve")
C_130J:defineToggleSwitch("FUEL_XFEED_ENG_3", devices.FUEL_SYSTEM, 3013, 368, FUEL_MANAGEMENT, "Engine 3 Crossfeed Valve")
C_130J:defineToggleSwitch("FUEL_XFEED_ENG_4", devices.FUEL_SYSTEM, 3014, 369, FUEL_MANAGEMENT, "Engine 4 Crossfeed Valve")

C_130J:defineIndicatorLight("FUEL_FLCV_ON_LIGHT", 4107, FUEL_MANAGEMENT, "Fuel Level Control Valve (FLCV) ON Light", { color = "Green" })
C_130J:defineIndicatorLight("FUEL_DRAIN_LIGHT", 4028, FUEL_MANAGEMENT, "Drain Light", { color = "Green" })

C_130J:defineString("FUEL_PRESSURE", function()
	return parse_overhead_lcd_line(42, { 2 })
end, 2, FUEL_MANAGEMENT, "Fuel Pressure Indicator")

local fuel_amounts = {
	ext_l_amount = "",
	ext_l_transfer = "",
	ext_r_amount = "",
	ext_r_transfer = "",
	aux_l_amount = "",
	aux_l_transfer = "",
	aux_r_amount = "",
	aux_r_transfer = "",
	main_1_amount = "",
	main_1_transfer = "",
	main_2_amount = "",
	main_2_transfer = "",
	main_3_amount = "",
	main_3_transfer = "",
	main_4_amount = "",
	main_4_transfer = "",
	total_amount = "",
	total_transfer = "",
}

C_130J:addExportHook(function()
	fuel_amounts.ext_l_amount, fuel_amounts.ext_l_transfer = parse_overhead_lcd_dual_line(31, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.ext_r_amount, fuel_amounts.ext_r_transfer = parse_overhead_lcd_dual_line(32, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.aux_l_amount, fuel_amounts.aux_l_transfer = parse_overhead_lcd_dual_line(29, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.aux_r_amount, fuel_amounts.aux_r_transfer = parse_overhead_lcd_dual_line(30, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.main_1_amount, fuel_amounts.main_1_transfer = parse_overhead_lcd_dual_line(25, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.main_2_amount, fuel_amounts.main_2_transfer = parse_overhead_lcd_dual_line(26, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.main_3_amount, fuel_amounts.main_3_transfer = parse_overhead_lcd_dual_line(27, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.main_4_amount, fuel_amounts.main_4_transfer = parse_overhead_lcd_dual_line(28, 4)
end)

C_130J:addExportHook(function()
	fuel_amounts.total_amount, fuel_amounts.total_transfer = parse_overhead_lcd_dual_line(24, 5)
end)

C_130J:defineString("FUEL_AMOUNT_EXT_L_AMOUNT", function()
	return fuel_amounts.ext_l_amount
end, 4, FUEL_MANAGEMENT, "Left External Fuel Tank Amount")
C_130J:defineString("FUEL_XFER_EXT_L_AMOUNT", function()
	return fuel_amounts.ext_l_transfer
end, 4, FUEL_MANAGEMENT, "Left External Fuel Tank Transfer")
C_130J:defineString("FUEL_AMOUNT_EXT_R_AMOUNT", function()
	return fuel_amounts.ext_r_amount
end, 4, FUEL_MANAGEMENT, "Right External Fuel Tank Amount")
C_130J:defineString("FUEL_XFER_EXT_R_AMOUNT", function()
	return fuel_amounts.ext_r_transfer
end, 4, FUEL_MANAGEMENT, "Right External Fuel Tank Transfer")
C_130J:defineString("FUEL_AMOUNT_AUX_L_AMOUNT", function()
	return fuel_amounts.aux_l_amount
end, 4, FUEL_MANAGEMENT, "Left Auxiliary Fuel Tank Amount")
C_130J:defineString("FUEL_XFER_AUX_L_AMOUNT", function()
	return fuel_amounts.aux_l_transfer
end, 4, FUEL_MANAGEMENT, "Left Auxiliary Fuel Tank Transfer")
C_130J:defineString("FUEL_AMOUNT_AUX_R_AMOUNT", function()
	return fuel_amounts.aux_r_amount
end, 4, FUEL_MANAGEMENT, "Right Auxiliary Fuel Tank Amount")
C_130J:defineString("FUEL_XFER_AUX_R_AMOUNT", function()
	return fuel_amounts.aux_r_transfer
end, 4, FUEL_MANAGEMENT, "Right Auxiliary Fuel Tank Transfer")
C_130J:defineString("FUEL_AMOUNT_MAIN_1_AMOUNT", function()
	return fuel_amounts.main_1_amount
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 1 Amount")
C_130J:defineString("FUEL_XFER_MAIN_1_AMOUNT", function()
	return fuel_amounts.main_1_transfer
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 1 Transfer")
C_130J:defineString("FUEL_AMOUNT_MAIN_2_AMOUNT", function()
	return fuel_amounts.main_2_amount
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 2 Amount")
C_130J:defineString("FUEL_XFER_MAIN_2_AMOUNT", function()
	return fuel_amounts.main_2_transfer
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 2 Transfer")
C_130J:defineString("FUEL_AMOUNT_MAIN_3_AMOUNT", function()
	return fuel_amounts.main_3_amount
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 3 Amount")
C_130J:defineString("FUEL_XFER_MAIN_3_AMOUNT", function()
	return fuel_amounts.main_3_transfer
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 3 Transfer")
C_130J:defineString("FUEL_AMOUNT_MAIN_4_AMOUNT", function()
	return fuel_amounts.main_4_amount
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 4 Amount")
C_130J:defineString("FUEL_XFER_MAIN_4_AMOUNT", function()
	return fuel_amounts.main_4_transfer
end, 4, FUEL_MANAGEMENT, "Main Fuel Tank 4 Transfer")
C_130J:defineString("FUEL_AMOUNT_TOTAL_AMOUNT", function()
	return fuel_amounts.total_amount
end, 5, FUEL_MANAGEMENT, "Total Fuel Amount")
C_130J:defineString("FUEL_XFER_TOTAL_AMOUNT", function()
	return fuel_amounts.total_transfer
end, 5, FUEL_MANAGEMENT, "Total Fuel Transfer")

-- Air Conditioning Panel
local AC = "Air Conditioning Panel"

C_130J:definePushButton("AC_CABIN_POWER", devices.PLANE_ATM, 3001, 352, AC, "Flight Station Air Conditioning Power")
C_130J:defineIndicatorLight("AC_CABIN_POWER_OFF", 4102, AC, "Flight Station Air Conditioning Power Off Light", { color = "green" })
C_130J:definePushButton("AC_CABIN_MAN", devices.PLANE_ATM, 3005, 350, AC, "Flight Station Manual Mode")
C_130J:defineIndicatorLight("AC_CABIN_MAN_ON", 4104, AC, "Flight Station Manual Mode On Light", { color = "green" })
C_130J:defineRockerSwitch("AC_CABIN_TEMP", devices.PLANE_ATM, 3003, 3003, 3003, 3003, 346, AC, "Flight Station Temperature", { positions = { "DECREASE", "OFF", "INCREASE" } })
C_130J:definePushButton("AC_XF_MAN", devices.PLANE_ATM, 3007, 349, AC, "Cross Flow Valve Manual Mode")
C_130J:defineIndicatorLight("AC_XF_MAN_ON", 4106, AC, "Cross Flow Valve Manual Mode On Light", { color = "green" })
C_130J:defineRockerSwitch("AC_XF", devices.PLANE_ATM, 3008, 3008, 3008, 3008, 348, AC, "Cross Flow Valve", { positions = { "CLOSE", "OFF", "OPEN" } })

C_130J:definePushButton("AC_CARGO_POWER", devices.PLANE_ATM, 3002, 353, AC, "Cargo Compartment Air Conditioning Power")
C_130J:defineIndicatorLight("AC_CARGO_POWER_OFF", 4103, AC, "Cargo Compartment Air Conditioning Power Off Light", { color = "green" })
C_130J:definePushButton("AC_CARGO_MAN", devices.PLANE_ATM, 3006, 351, AC, "Cargo Compartment Manual Mode")
C_130J:defineIndicatorLight("AC_CARGO_MAN_ON", 4105, AC, "Cargo Compartment Manual Mode On Light", { color = "green" })
C_130J:defineRockerSwitch("AC_CARGO_TEMP", devices.PLANE_ATM, 3004, 3004, 3004, 3004, 347, AC, "Cargo Compartment Temperature", { positions = { "DECREASE", "OFF", "INCREASE" } })
C_130J:define3PosTumb("AC_UNDERFLOOR", devices.PLANE_ATM, 3009, 469, AC, "Underfloor Heat/Fan Switch", { positions = { "FAN", "OFF", "HEAT/FAN" } })

local temps = {
	cabin_actual = "",
	cabin_set = "",
	cargo_actual = "",
	cargo_set = "",
}

C_130J:addExportHook(function()
	temps.cabin_actual, temps.cabin_set = parse_overhead_lcd_dual_line(36, 3)
end)
C_130J:addExportHook(function()
	temps.cargo_actual, temps.cargo_set = parse_overhead_lcd_dual_line(37, 3)
end)

C_130J:defineString("AC_CABIN_ACTUAL", function()
	return temps.cabin_actual
end, 3, AC, "Flight Station Actual Temperature")
C_130J:defineString("AC_CABIN_SET", function()
	return temps.cabin_set
end, 3, AC, "Flight Station Set Temperature")
C_130J:defineString("AC_CARGO_ACTUAL", function()
	return temps.cargo_actual
end, 3, AC, "Cargo Compartment Actual Temperature")
C_130J:defineString("AC_CARGO_SET", function()
	return temps.cargo_set
end, 3, AC, "Cargo Compartment Set Temperature")

-- Pilot HUD Panel
local PLT_HUD = "PLT HUD Panel"

C_130J:definePushButton("PLT_HUD_VIS_BTN", devices.P_DISPLAYS, 3026, 1311, PLT_HUD, "Visual Mode")
C_130J:defineIndicatorLight("PLT_HUD_VIS_ON", 4011, PLT_HUD, "Visual Mode On", { color = "green" })
C_130J:definePushButton("PLT_HUD_BLANK1_BTN", devices.P_DISPLAYS, 3032, 1312, PLT_HUD, "Blank 1")
C_130J:definePushButton("PLT_HUD_CAT2_BTN", devices.P_DISPLAYS, 3031, 1313, PLT_HUD, "CAT2 Mode")
C_130J:defineIndicatorLight("PLT_HUD_CAT2_ON", 4012, PLT_HUD, "CAT2 Mode On", { color = "green" })
C_130J:definePushButton("PLT_HUD_OS_BTN", devices.P_DISPLAYS, 3030, 1314, PLT_HUD, "Offside Mode")
C_130J:defineIndicatorLight("PLT_HUD_OS_ON", 4013, PLT_HUD, "Offside Mode On", { color = "green" })
C_130J:definePushButton("PLT_HUD_TACT_BTN", devices.P_DISPLAYS, 3028, 1318, PLT_HUD, "Tactical Mode")
C_130J:defineIndicatorLight("PLT_HUD_TACT_ON", 4016, PLT_HUD, "Tactical Mode On", { color = "green" })
C_130J:definePushButton("PLT_HUD_BLANK2_BTN", devices.P_DISPLAYS, 3033, 1317, PLT_HUD, "Blank 2")
C_130J:definePushButton("PLT_HUD_NAV_BTN", devices.P_DISPLAYS, 3027, 1316, PLT_HUD, "Nav Mode")
C_130J:defineIndicatorLight("PLT_HUD_NAV_ON", 4015, PLT_HUD, "Nav Mode On", { color = "green" })
C_130J:definePushButton("PLT_HUD_UNCG_BTN", devices.P_DISPLAYS, 3029, 1315, PLT_HUD, "Uncage Mode")
C_130J:defineIndicatorLight("PLT_HUD_UNCG_ON", 4014, PLT_HUD, "Uncage Mode On", { color = "green" })

C_130J:defineToggleSwitch("PLT_HUD_BRT_PULL", devices.P_DISPLAYS, 3025, 1320, PLT_HUD, "Auto HUD Brightness")
C_130J:defineRotary("PLT_HUD_BRT", devices.P_DISPLAYS, 3024, 1319, PLT_HUD, "HUD Brightness Knob")

C_130J:defineToggleSwitch("PLT_HUD_LATCH", devices.P_DISPLAYS, 3023, 6, PLT_HUD, "HUD Latch")

-- Copilot HUD Panel
local CPLT_HUD = "CPLT HUD Panel"

C_130J:definePushButton("CPLT_HUD_VIS_BTN", devices.C_DISPLAYS, 3026, 1322, CPLT_HUD, "Visual Mode")
C_130J:defineIndicatorLight("CPLT_HUD_VIS_ON", 4017, CPLT_HUD, "Visual Mode On", { color = "green" })
C_130J:definePushButton("CPLT_HUD_BLANK1_BTN", devices.C_DISPLAYS, 3032, 1323, CPLT_HUD, "Blank 1")
C_130J:definePushButton("CPLT_HUD_CAT2_BTN", devices.C_DISPLAYS, 3031, 1324, CPLT_HUD, "CAT2 Mode")
C_130J:defineIndicatorLight("CPLT_HUD_CAT2_ON", 4018, CPLT_HUD, "CAT2 Mode On", { color = "green" })
C_130J:definePushButton("CPLT_HUD_OS_BTN", devices.C_DISPLAYS, 3030, 1325, CPLT_HUD, "Offside Mode")
C_130J:defineIndicatorLight("CPLT_HUD_OS_ON", 4019, CPLT_HUD, "Offside Mode On", { color = "green" })
C_130J:definePushButton("CPLT_HUD_TACT_BTN", devices.C_DISPLAYS, 3028, 1329, CPLT_HUD, "Tactical Mode")
C_130J:defineIndicatorLight("CPLT_HUD_TACT_ON", 4022, CPLT_HUD, "Tactical Mode On", { color = "green" })
C_130J:definePushButton("CPLT_HUD_BLANK2_BTN", devices.C_DISPLAYS, 3033, 1328, CPLT_HUD, "Blank 2")
C_130J:definePushButton("CPLT_HUD_NAV_BTN", devices.C_DISPLAYS, 3027, 1327, CPLT_HUD, "Nav Mode")
C_130J:defineIndicatorLight("CPLT_HUD_NAV_ON", 4021, CPLT_HUD, "Nav Mode On", { color = "green" })
C_130J:definePushButton("CPLT_HUD_UNCG_BTN", devices.C_DISPLAYS, 3029, 1326, CPLT_HUD, "Uncage Mode")
C_130J:defineIndicatorLight("CPLT_HUD_UNCG_ON", 4020, CPLT_HUD, "Uncage Mode On", { color = "green" })

C_130J:defineToggleSwitch("CPLT_HUD_BRT_PULL", devices.C_DISPLAYS, 3025, 1330, CPLT_HUD, "Auto HUD Brightness")
C_130J:defineRotary("CPLT_HUD_BRT", devices.C_DISPLAYS, 3024, 1331, CPLT_HUD, "HUD Brightness Knob")

C_130J:defineToggleSwitch("CPLT_HUD_LATCH", devices.C_DISPLAYS, 3023, 7, CPLT_HUD, "HUD Latch")

-- Wipers/ELT/Emergency Exit Lights Extinguish Panel

-- APU Panel
local APU = "APU Panel"

C_130J:defineToggleSwitch("APU_ALARM", devices.ENGINE_APU_CTRL, 3027, 425, APU, "APU Alarm")
C_130J:defineEngineStartSwitch("APU_START", devices.ENGINE_APU_CTRL, 3015, 322, 0.5, { 0, 1 }, 3, APU, "APU Start Switch", { positions = { "STOP", "RUN", "START" } })
C_130J:defineIndicatorLight("APU_START_LIGHT", 4027, APU, "APU Start Light", { color = "green" })

C_130J:defineToggleSwitch("APU_FIRE_HANDLE_PULL", devices.ENGINE_APU_CTRL, 3026, 324, APU, "APU Fire Handle (Push/Pull)")
C_130J:define3PosTumb("APU_FIRE_HANDLE_ROTATE", devices.ENGINE_APU_CTRL, 3021, 325, APU, "APU Fire Handle (Rotate)", { positions = { "1", "OFF", "2" } })
C_130J:defineGatedIndicatorLight("APU_FIRE", 4135, 1, nil, APU, "APU Fire Light", { color = "red" }) -- light comes on at exactly 1

C_130J:defineString("APU_EGT", function()
	return parse_overhead_lcd_line(34, { 3 })
end, 3, APU, "EGT")
C_130J:defineString("APU_RPM", function()
	return parse_overhead_lcd_line(33, { 3 })
end, 3, APU, "RPM (%)")

-- Engine Start Panel
local ENGINE_START = "Engine Start Panel"

-- the step/range/positions for these engine start switches are a little weird, but they match what is in the dcs lua files, and they work
C_130J:defineEngineStartSwitch("ENGINE_START_1", devices.ENGINE_APU_CTRL, 3007, 310, 0.5, { -0.33, 1 }, 4, ENGINE_START, "Engine 1 Start Switch", { positions = { "MOTOR", "STOP", "RUN", "START" } })
C_130J:defineIndicatorLight("ENGINE_START_1_LIGHT", 4023, ENGINE_START, "Engine 1 Start Light", { color = "green" })
C_130J:defineEngineStartSwitch("ENGINE_START_2", devices.ENGINE_APU_CTRL, 3008, 311, 0.5, { -0.33, 1 }, 4, ENGINE_START, "Engine 2 Start Switch", { positions = { "MOTOR", "STOP", "RUN", "START" } })
C_130J:defineIndicatorLight("ENGINE_START_2_LIGHT", 4024, ENGINE_START, "Engine 2 Start Light", { color = "green" })
C_130J:defineEngineStartSwitch("ENGINE_START_3", devices.ENGINE_APU_CTRL, 3009, 312, 0.5, { -0.33, 1 }, 4, ENGINE_START, "Engine 3 Start Switch", { positions = { "MOTOR", "STOP", "RUN", "START" } })
C_130J:defineIndicatorLight("ENGINE_START_3_LIGHT", 4025, ENGINE_START, "Engine 3 Start Light", { color = "green" })
C_130J:defineEngineStartSwitch("ENGINE_START_4", devices.ENGINE_APU_CTRL, 3010, 313, 0.5, { -0.33, 1 }, 4, ENGINE_START, "Engine 4 Start Switch", { positions = { "MOTOR", "STOP", "RUN", "START" } })
C_130J:defineIndicatorLight("ENGINE_START_4_LIGHT", 4026, ENGINE_START, "Engine 4 Start Light", { color = "green" })

C_130J:defineToggleSwitch("FIRE_ENGINE_1_HANDLE_PULL", devices.ENGINE_APU_CTRL, 3022, 314, ENGINE_START, "Engine 1 Fire Handle (Push/Pull)")
C_130J:define3PosTumb("FIRE_ENGINE_1_HANDLE_ROTATE", devices.ENGINE_APU_CTRL, 3017, 315, ENGINE_START, "Engine 1 Fire Handle (Rotate)", { positions = { "1", "OFF", "2" } })
C_130J:defineGatedIndicatorLight("FIRE_ENGINE_1", 4131, 1, nil, ENGINE_START, "Engine 1 Fire Light", { color = "red" }) -- light comes on at exactly 1
C_130J:defineToggleSwitch("FIRE_ENGINE_2_HANDLE_PULL", devices.ENGINE_APU_CTRL, 3023, 316, ENGINE_START, "Engine 2 Fire Handle (Push/Pull)")
C_130J:define3PosTumb("FIRE_ENGINE_2_HANDLE_ROTATE", devices.ENGINE_APU_CTRL, 3018, 317, ENGINE_START, "Engine 2 Fire Handle (Rotate)", { positions = { "1", "OFF", "2" } })
C_130J:defineGatedIndicatorLight("FIRE_ENGINE_2", 4132, 1, nil, ENGINE_START, "Engine 2 Fire Light", { color = "red" }) -- light comes on at exactly 1
C_130J:defineToggleSwitch("FIRE_ENGINE_3_HANDLE_PULL", devices.ENGINE_APU_CTRL, 3024, 318, ENGINE_START, "Engine 3 Fire Handle (Push/Pull)")
C_130J:define3PosTumb("FIRE_ENGINE_3_HANDLE_ROTATE", devices.ENGINE_APU_CTRL, 3019, 319, ENGINE_START, "Engine 3 Fire Handle (Rotate)", { positions = { "1", "OFF", "2" } })
C_130J:defineGatedIndicatorLight("FIRE_ENGINE_3", 4133, 1, nil, ENGINE_START, "Engine 3 Fire Light", { color = "red" }) -- light comes on at exactly 1
C_130J:defineToggleSwitch("FIRE_ENGINE_4_HANDLE_PULL", devices.ENGINE_APU_CTRL, 3025, 320, ENGINE_START, "Engine 4 Fire Handle (Push/Pull)")
C_130J:define3PosTumb("FIRE_ENGINE_4_HANDLE_ROTATE", devices.ENGINE_APU_CTRL, 3020, 321, ENGINE_START, "Engine 4 Fire Handle (Rotate)", { positions = { "1", "OFF", "2" } })
C_130J:defineGatedIndicatorLight("FIRE_ENGINE_4", 4134, 1, nil, ENGINE_START, "Engine 4 Fire Light", { color = "red" }) -- light comes on at exactly 1

-- FADEC/Prop Control/Prop Sync/ATCS Panel
local FADEC = "FADEC/Prop Control/Prop Sync/ATCS Panel"

C_130J:defineToggleSwitchManualRange("FADEC_1_GUARD", devices.ENGINE_APU_CTRL, 3035, 328, { 1, 0 }, FADEC, "Engine 1 FADEC Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitchManualRange("FADEC_2_GUARD", devices.ENGINE_APU_CTRL, 3036, 329, { 1, 0 }, FADEC, "Engine 2 FADEC Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitchManualRange("FADEC_3_GUARD", devices.ENGINE_APU_CTRL, 3037, 330, { 1, 0 }, FADEC, "Engine 3 FADEC Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitchManualRange("FADEC_4_GUARD", devices.ENGINE_APU_CTRL, 3038, 331, { 1, 0 }, FADEC, "Engine 4 FADEC Switch Guard", { positions = CommonPositions.COVER })

local FADEC_ATTRIBUTES = { positions = { "RESET", "NORM", "ALT" } }

C_130J:define3PosTumb("FADEC_1_MODE", devices.ENGINE_APU_CTRL, 3039, 412, FADEC, "Engine 1 FADEC Switch", FADEC_ATTRIBUTES)
C_130J:define3PosTumb("FADEC_2_MODE", devices.ENGINE_APU_CTRL, 3040, 413, FADEC, "Engine 2 FADEC Switch", FADEC_ATTRIBUTES)
C_130J:define3PosTumb("FADEC_3_MODE", devices.ENGINE_APU_CTRL, 3041, 414, FADEC, "Engine 3 FADEC Switch", FADEC_ATTRIBUTES)
C_130J:define3PosTumb("FADEC_4_MODE", devices.ENGINE_APU_CTRL, 3042, 415, FADEC, "Engine 4 FADEC Switch", FADEC_ATTRIBUTES)

local PROP_CONTROL_ATTRIBUTES = { positions = { "UNFEATHER", "NORMAL", "FEATHER" } }

C_130J:define3PosTumb("PROP_CONTROL_1", devices.ENGINE_APU_CTRL, 3043, 372, FADEC, "Propeller 1 Control Switch", PROP_CONTROL_ATTRIBUTES)
C_130J:define3PosTumb("PROP_CONTROL_2", devices.ENGINE_APU_CTRL, 3044, 373, FADEC, "Propeller 2 Control Switch", PROP_CONTROL_ATTRIBUTES)
C_130J:define3PosTumb("PROP_CONTROL_3", devices.ENGINE_APU_CTRL, 3045, 374, FADEC, "Propeller 3 Control Switch", PROP_CONTROL_ATTRIBUTES)
C_130J:define3PosTumb("PROP_CONTROL_4", devices.ENGINE_APU_CTRL, 3046, 375, FADEC, "Propeller 4 Control Switch", PROP_CONTROL_ATTRIBUTES)

C_130J:defineToggleSwitch("ATCS_GUARD", devices.ENGINE_APU_CTRL, 3047, 327, FADEC, "ATCS Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitchManualRange("ATCS", devices.ENGINE_APU_CTRL, 3049, 416, { 1, 0 }, FADEC, "ATCS")
C_130J:defineToggleSwitchManualRange("PROP_SYNC", devices.ENGINE_APU_CTRL, 3048, 376, { 1, 0 }, FADEC, "Prop Sync Switch")

-- Exterior Lighting Panel
local EXT_LIGHT_PANEL = "Exterior Lighting Panel"

C_130J:definePotentiometer("EXT_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3016, 424, { 0, 1 }, EXT_LIGHT_PANEL, "Covert/Formation Light Brightness Knob")

C_130J:defineToggleSwitch("EXT_LIGHT_MASTER", devices.LIGHTING_PANELS, 3008, 421, EXT_LIGHT_PANEL, "Exterior Lighting Master Switch", { positions = { "NORM", "COVERT" } })
C_130J:define3PosTumb("EXT_LIGHT_NAV_MODE", devices.LIGHTING_PANELS, 3009, 422, EXT_LIGHT_PANEL, "Navigation Light Mode Switch", { positions = { "STEADY", "OFF", "FLASH" } })
C_130J:defineToggleSwitch("EXT_LIGHT_NAV_BRIGHTNESS", devices.LIGHTING_PANELS, 3010, 423, EXT_LIGHT_PANEL, "Navigation Light Brightness Switch", { positions = { "BRIGHT", "DIM" } })

C_130J:define3PosTumb("EXT_LIGHT_STROBE_TOP_MODE", devices.LIGHTING_PANELS, 3012, 418, EXT_LIGHT_PANEL, "Top Strobe Mode Switch", { positions = { "WHT", "OFF", "RED" } })
C_130J:define3PosTumb("EXT_LIGHT_STROBE_BOT_MODE", devices.LIGHTING_PANELS, 3013, 419, EXT_LIGHT_PANEL, "Bottom Strobe Mode Switch", { positions = { "WHT", "OFF", "RED" } })
C_130J:defineToggleSwitch("EXT_LIGHT_STROBE_BOT_TEST", devices.LIGHTING_PANELS, 3014, 420, EXT_LIGHT_PANEL, "Bottom Strobe Test Switch")

C_130J:defineToggleSwitch("EXT_LIGHT_LEADING_EDGE", devices.LIGHTING_PANELS, 3015, 417, EXT_LIGHT_PANEL, "Leading Edge Light Switch")

-- Ice Protection Panel
local ICE = "Ice Protection Panel"

local ICE_PROTECTION_ATTRIBUTES = { positions = { "ON", "AUTO", "OFF" } }

C_130J:define3PosTumb("ICE_PROP_1", devices.ENGINE_APU_CTRL, 3058, 386, ICE, "Propeller 1 Ice Protection Switch", ICE_PROTECTION_ATTRIBUTES)
C_130J:define3PosTumb("ICE_PROP_2", devices.ENGINE_APU_CTRL, 3059, 387, ICE, "Propeller 2 Ice Protection Switch", ICE_PROTECTION_ATTRIBUTES)
C_130J:define3PosTumb("ICE_PROP_3", devices.ENGINE_APU_CTRL, 3060, 388, ICE, "Propeller 3 Ice Protection Switch", ICE_PROTECTION_ATTRIBUTES)
C_130J:define3PosTumb("ICE_PROP_4", devices.ENGINE_APU_CTRL, 3061, 389, ICE, "Propeller 4 Ice Protection Switch", ICE_PROTECTION_ATTRIBUTES)
C_130J:define3PosTumb("ICE_ENG", devices.ENGINE_APU_CTRL, 3062, 385, ICE, "Engine Ice Protection Switch", ICE_PROTECTION_ATTRIBUTES)
C_130J:define3PosTumb("ICE_WING_EMP", devices.ENGINE_APU_CTRL, 3063, 384, ICE, "Wing/Empennage Ice Protection Switch", ICE_PROTECTION_ATTRIBUTES)

C_130J:defineToggleSwitchManualRange("ICE_ANTI_DE_ICE", devices.ENGINE_APU_CTRL, 3064, 382, { 1, 0 }, ICE, "Anti-Ice/De-Ice Switch", { positions = { "ANTI-ICE", "DE-ICE" } })
C_130J:defineToggleSwitchManualRange("ICE_PLT_PITOT", devices.ENGINE_APU_CTRL, 3065, 378, { 1, 0 }, ICE, "Pilot Pitot Heat Switch")
C_130J:defineToggleSwitchManualRange("ICE_CPLT_PITOT", devices.ENGINE_APU_CTRL, 3066, 379, { 1, 0 }, ICE, "Copilot Pitot Heat Switch")
C_130J:defineToggleSwitchManualRange("ICE_NESA_C", devices.ENGINE_APU_CTRL, 3067, 380, { 1, 0 }, ICE, "Center NESA Heat Switch")
C_130J:defineToggleSwitchManualRange("ICE_NESA_S", devices.ENGINE_APU_CTRL, 3068, 381, { 1, 0 }, ICE, "Side/Lower NESA Heat Switch")

-- Bleed Air Panel
local BLEED_AIR = "Bleed Air Panel"

C_130J:definePushButton("BLEED_AIR_APU", devices.ENGINE_APU_CTRL, 3050, 355, BLEED_AIR, "APU Bleed Air Button")
C_130J:defineIndicatorLight("BLEED_AIR_APU_OPEN", 4108, BLEED_AIR, "APU Bleed Air Open Light", { color = "green" })

local BLEED_AIR_ATTRIBUTES = { positions = { "OPEN", "AUTO", "CLOSE" } }

C_130J:define3PosTumb("BLEED_AIR_ISO_L", devices.ENGINE_APU_CTRL, 3051, 394, BLEED_AIR, "Left Wing Isolation Valve", BLEED_AIR_ATTRIBUTES)
C_130J:define3PosTumb("BLEED_AIR_DIVIDER", devices.ENGINE_APU_CTRL, 3052, 395, BLEED_AIR, "Divider Valve", BLEED_AIR_ATTRIBUTES)
C_130J:define3PosTumb("BLEED_AIR_ISO_R", devices.ENGINE_APU_CTRL, 3053, 396, BLEED_AIR, "Right Wing Isolation Valve", BLEED_AIR_ATTRIBUTES)
C_130J:define3PosTumb("BLEED_AIR_SHUTOFF_ENGINE_1", devices.ENGINE_APU_CTRL, 3054, 390, BLEED_AIR, "Engine 1 Nacelle Shutoff Valve", BLEED_AIR_ATTRIBUTES)
C_130J:define3PosTumb("BLEED_AIR_SHUTOFF_ENGINE_2", devices.ENGINE_APU_CTRL, 3055, 391, BLEED_AIR, "Engine 2 Nacelle Shutoff Valve", BLEED_AIR_ATTRIBUTES)
C_130J:define3PosTumb("BLEED_AIR_SHUTOFF_ENGINE_3", devices.ENGINE_APU_CTRL, 3056, 392, BLEED_AIR, "Engine 3 Nacelle Shutoff Valve", BLEED_AIR_ATTRIBUTES)
C_130J:define3PosTumb("BLEED_AIR_SHUTOFF_ENGINE_4", devices.ENGINE_APU_CTRL, 3057, 393, BLEED_AIR, "Engine 4 Nacelle Shutoff Valve", BLEED_AIR_ATTRIBUTES)

C_130J:defineString("BLEED_AIR_PRESSURE", function()
	return parse_overhead_lcd_line(35, { 3 })
end, 3, BLEED_AIR, "Bleed Air Pressure Indicator")

-- Standby Magnetic Compass
local COMPASS = "Standby Magnetic Compass"

-- compass does not pitch or roll
C_130J:defineFloat("COMPASS_HEADING", 17, { -1, 1 }, COMPASS, "Compass Heading")

-- Overhead Console END

-- Center Console

-- Pilot Lighting Panel
local PLT_LIGHTING_PANEL = "PLT Lighting Panel"
C_130J:define3PosTumb("PLT_CC_LIGHTING_MASTER_SWITCH", devices.LIGHTING_PANELS, 3029, 1337, PLT_LIGHTING_PANEL, "Lighting Mode Master Switch", { positions = { "TSTORM", "NORM", "NVIS" } })
C_130J:defineC130Springloaded_3PosTumb("PLT_CC_LIGHTING_ANNUNCIATOR_BRIGHTNESS", devices.LIGHTING_PANELS, 3030, 1336, PLT_LIGHTING_PANEL, "Annunciator Light Brightness Switch", { positions = { "BRIGHT", "OFF", "DIM" } })
C_130J:definePotentiometer("PLT_CC_LIGHTING_DOME_BRIGHTNESS", devices.LIGHTING_PANELS, 3017, 1340, { 0, 1 }, PLT_LIGHTING_PANEL, "Cockpit Dome Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_CB_BRIGHTNESS", devices.LIGHTING_PANELS, 3018, 1341, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Circuit Breaker Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_MASTER_DISPLAY_BRIGHTNESS", devices.LIGHTING_PANELS, 3005, 1335, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Master Display Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_PANEL_BACKLIGHTING", devices.LIGHTING_PANELS, 3031, 1342, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3020, 1343, { 0, 1 }, PLT_LIGHTING_PANEL, "Pilot Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("PLT_CC_LIGHTING_FLOOR_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3025, 1344, { 0, 1 }, PLT_LIGHTING_PANEL, "Floor Lighting Brightness Knob")

-- Copilot Lighting Panel
local CPLT_LIGHTING_PANEL = "CPLT Lighting Panel"
C_130J:definePotentiometer("CPLT_CC_LIGHTING_CB_BRIGHTNESS", devices.LIGHTING_PANELS, 3019, 1345, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Circuit Breaker Lighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_OVERHEAD_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3026, 1346, { 0, 1 }, CPLT_LIGHTING_PANEL, "Overhead Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_OVERHEAD_PANEL_BACKLIGHTING", devices.LIGHTING_PANELS, 3022, 1347, { 0, 1 }, CPLT_LIGHTING_PANEL, "Overhead Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_CONSOLE_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3027, 1348, { 0, 1 }, CPLT_LIGHTING_PANEL, "Center Console Backlighting Brightness Knob")
C_130J:defineC130Springloaded_3PosTumb("CPLT_CC_LIGHTING_DISPLAY_LAMP_TEST", devices.LIGHTING_PANELS, 3028, 1352, CPLT_LIGHTING_PANEL, "Display/Lamp Test Switch", { positions = { "DSPL", "OFF", "LAMP" } })
C_130J:definePotentiometer("CPLT_CC_LIGHTING_FLOOD_LIGHT_BRIGHTNESS", devices.LIGHTING_PANELS, 3021, 1351, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Panel Flood Lighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_PANEL_BACKLIGHTING", devices.LIGHTING_PANELS, 3032, 1350, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Panel Backlighting Brightness Knob")
C_130J:definePotentiometer("CPLT_CC_LIGHTING_MASTER_DISPLAY_BRIGHTNESS", devices.LIGHTING_PANELS, 3024, 1349, { 0, 1 }, CPLT_LIGHTING_PANEL, "Copilot Master Display Brightness Knob")

-- Radar Control Panel
local RADAR_CONTROL_PANEL = "Radar Control Panel"
C_130J:defineMultipositionSwitch("RCP_MASTER_POWER", devices.NAV_RADAR, 3001, 485, 3, 0.4, RADAR_CONTROL_PANEL, "Radar Master Power Switch", { positions = { "OFF", "ON", "TEST" } })
C_130J:definePushButton("RCP_PRCN_MODE", devices.NAV_RADAR, 3010, 398, RADAR_CONTROL_PANEL, "Radar PRCN Mode Switch")
C_130J:definePushButton("RCP_MAP_MODE", devices.NAV_RADAR, 3011, 399, RADAR_CONTROL_PANEL, "Radar MAP Mode Switch")
C_130J:definePushButton("RCP_WX_MODE", devices.NAV_RADAR, 3012, 400, RADAR_CONTROL_PANEL, "Radar WX Mode Switch")
C_130J:definePushButton("RCP_SP_MODE", devices.NAV_RADAR, 3013, 401, RADAR_CONTROL_PANEL, "Radar SP Mode Switch")
C_130J:definePushButton("RCP_MGM_MODE", devices.NAV_RADAR, 3014, 402, RADAR_CONTROL_PANEL, "Radar MGM Mode Switch")
C_130J:definePushButton("RCP_WS_MODE", devices.NAV_RADAR, 3015, 403, RADAR_CONTROL_PANEL, "Radar WS Mode Switch")
C_130J:definePushButton("RCP_BCN_MODE", devices.NAV_RADAR, 3016, 404, RADAR_CONTROL_PANEL, "Radar BCN Mode Switch")
C_130J:defineMultipositionSwitch("RCP_INTENSITY_TARGET", devices.NAV_RADAR, 3002, 486, 4, 0.3, RADAR_CONTROL_PANEL, "Intensity Target Select Switch", { positions = { "RM", "CUR", "SYM", "VID" } })
C_130J:definePushButton("RCP_PSEL_MODE", devices.NAV_RADAR, 3009, 405, RADAR_CONTROL_PANEL, "Radar PSEL Mode Switch")
C_130J:defineRockerSwitch("RCP_INTENSITY_ROCKER", devices.NAV_RADAR, 3003, 3003, 3003, 3003, 410, RADAR_CONTROL_PANEL, "Radar Intensity Increase/Decrease", { positions = { "DECR", "OFF", "INCR" } })
C_130J:defineRockerSwitch("RCP_GAIN_ROCKER", devices.NAV_RADAR, 3004, 3004, 3004, 3004, 411, RADAR_CONTROL_PANEL, "Radar Gain Increase/Decrease", { positions = { "DECR", "OFF", "INCR" } })
C_130J:definePushButton("RCP_OFS_MODE", devices.NAV_RADAR, 3005, 406, RADAR_CONTROL_PANEL, "Radar OFS Mode Switch")
C_130J:definePushButton("RCP_FRZ_MODE", devices.NAV_RADAR, 3006, 407, RADAR_CONTROL_PANEL, "Radar FRZ Mode Switch")
C_130J:definePushButton("RCP_PEN_MODE", devices.NAV_RADAR, 3007, 408, RADAR_CONTROL_PANEL, "Radar PEN Mode Switch")
C_130J:definePushButton("RCP_SCTR_MODE", devices.NAV_RADAR, 3008, 409, RADAR_CONTROL_PANEL, "Radar SCTR Mode Switch")
C_130J:defineIndicatorLight("RCP_PRCN_MODE_LED", 4077, RADAR_CONTROL_PANEL, "Radar PRCN Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_MAP_MODE_LED", 4078, RADAR_CONTROL_PANEL, "Radar MAP Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_WX_MODE_LED", 4079, RADAR_CONTROL_PANEL, "Radar WX Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_SP_MODE_LED", 4080, RADAR_CONTROL_PANEL, "Radar SP Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_MGM_MODE_LED", 4081, RADAR_CONTROL_PANEL, "Radar MGM Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_WS_MODE_LED", 4082, RADAR_CONTROL_PANEL, "Radar WS Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_BCN_MODE_LED", 4083, RADAR_CONTROL_PANEL, "Radar BCN Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_PSEL_MODE_LED", 4084, RADAR_CONTROL_PANEL, "Radar PSEL Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_OFS_MODE_LED", 4085, RADAR_CONTROL_PANEL, "Radar OFS Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_FRZ_MODE_LED", 4086, RADAR_CONTROL_PANEL, "Radar FRZ Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_PEN_MODE_LED", 4087, RADAR_CONTROL_PANEL, "Radar PEN Mode Switch Led", { color = "Green" })
C_130J:defineIndicatorLight("RCP_SCTR_MODE_LED", 4088, RADAR_CONTROL_PANEL, "Radar SCTR Mode Switch Led", { color = "Green" })

-- Pilot Intercommunications System Control Panel
local PLT_ICS_PANEL = "PLT Intercommunications System Control Panel"
C_130J:definePotentiometer("PLT_ICS_INT_VOLUME", devices.VOLUME_MANAGER, 3002, 205, { 0, 1 }, PLT_ICS_PANEL, "Pilot INT Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_INT_BUTTON", devices.VOLUME_MANAGER, 3016, 204, PLT_ICS_PANEL, "Pilot INT Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_H1_VOLUME", devices.VOLUME_MANAGER, 3003, 207, { 0, 1 }, PLT_ICS_PANEL, "Pilot HF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_H1_BUTTON", devices.VOLUME_MANAGER, 3017, 206, PLT_ICS_PANEL, "Pilot HF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_H2_VOLUME", devices.VOLUME_MANAGER, 3004, 209, { 0, 1 }, PLT_ICS_PANEL, "Pilot HF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_H2_BUTTON", devices.VOLUME_MANAGER, 3018, 208, PLT_ICS_PANEL, "Pilot HF 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_PA_VOLUME", devices.VOLUME_MANAGER, 3005, 211, { 0, 1 }, PLT_ICS_PANEL, "Pilot PA Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_PA_BUTTON", devices.VOLUME_MANAGER, 3019, 210, PLT_ICS_PANEL, "Pilot PA Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_PA_GAIN", devices.VOLUME_MANAGER, 3006, 1353, { 0, 1 }, PLT_ICS_PANEL, "Pilot PA GAIN Knob")
C_130J:definePotentiometer("PLT_ICS_VOX_SENSITIVITY", devices.VOLUME_MANAGER, 3007, 1354, { 0, 1 }, PLT_ICS_PANEL, "Pilot VOX Sensitivity Knob")
C_130J:definePotentiometer("PLT_ICS_V1_VOLUME", devices.VOLUME_MANAGER, 3008, 213, { 0, 1 }, PLT_ICS_PANEL, "Pilot VHF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_V1_BUTTON", devices.VOLUME_MANAGER, 3020, 212, PLT_ICS_PANEL, "Pilot VHF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_V2_VOLUME", devices.VOLUME_MANAGER, 3009, 215, { 0, 1 }, PLT_ICS_PANEL, "Pilot VHF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_V2_BUTTON", devices.VOLUME_MANAGER, 3021, 214, PLT_ICS_PANEL, "Pilot VHF 2 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_SATCOM_VOLUME", devices.VOLUME_MANAGER, 3010, 217, { 0, 1 }, PLT_ICS_PANEL, "Pilot SAT Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_SATCOM_BUTTON", devices.VOLUME_MANAGER, 3022, 216, PLT_ICS_PANEL, "Pilot SAT Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_PVT_VOLUME", devices.VOLUME_MANAGER, 3011, 219, { 0, 1 }, PLT_ICS_PANEL, "Pilot PVT Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_PVT_BUTTON", devices.VOLUME_MANAGER, 3023, 218, PLT_ICS_PANEL, "Pilot PVT Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_VOXHM_VOLUME", devices.VOLUME_MANAGER, 3012, 221, { 0, 1 }, PLT_ICS_PANEL, "Pilot VOX/HM Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_VOXHM_BUTTON", devices.VOLUME_MANAGER, 3024, 220, PLT_ICS_PANEL, "Pilot VOX/HM Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_U1_VOLUME", devices.VOLUME_MANAGER, 3013, 223, { 0, 1 }, PLT_ICS_PANEL, "Pilot UHF 1 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_U1_BUTTON", devices.VOLUME_MANAGER, 3025, 222, PLT_ICS_PANEL, "Pilot UHF 1 Pull to Monitor")
C_130J:definePotentiometer("PLT_ICS_U2_VOLUME", devices.VOLUME_MANAGER, 3014, 225, { 0, 1 }, PLT_ICS_PANEL, "Pilot UHF 2 Volume Knob")
C_130J:defineToggleSwitch("PLT_ICS_U2_BUTTON", devices.VOLUME_MANAGER, 3026, 224, PLT_ICS_PANEL, "Pilot UHF 2 Pull to Monitor")
C_130J:defineRockerSwitch("PLT_ICS_INT_RADIO_ROCKER", devices.VOLUME_MANAGER, 3015, 3015, 3015, 3015, 291, PLT_ICS_PANEL, "Pilot Intercom/Radio Transmit")
C_130J:defineMultipositionSwitch("PLT_ICS_INTERPHONE_MODE", devices.VOLUME_MANAGER, 3027, 293, 4, 0.3, PLT_ICS_PANEL, "Pilot Interphone Mode Switch", { positions = { "CALL", "INT", "VOX", "HOT MIC" } })
C_130J:defineTumb("PLT_ICS_TRANSMISSION_SELECTOR", devices.VOLUME_MANAGER, 3028, 294, 1 / 9, { -2 / 9, 7 / 9 }, nil, false, PLT_ICS_PANEL, "Pilot Transmission Selector Switch", { positions = { "PA", "INT", "U-1", "U-2", "V-1", "V-2", "H-1", "H-2", "SAT", "PVT" } })
C_130J:definePotentiometer("PLT_ICS_MASTER_VOLUME", devices.VOLUME_MANAGER, 3001, 1355, { 0, 1 }, PLT_ICS_PANEL, "Pilot Master Volume Knob")

-- Copilot Intercommunications System Control Panel
local CPLT_ICS_PANEL = "CPLT Intercommunications System Control Panel"
C_130J:definePotentiometer("CPLT_ICS_INT_VOLUME", devices.VOLUME_MANAGER, 3030, 227, { 0, 1 }, CPLT_ICS_PANEL, "Copilot INT Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_INT_BUTTON", devices.VOLUME_MANAGER, 3044, 226, CPLT_ICS_PANEL, "Copilot INT Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_H1_VOLUME", devices.VOLUME_MANAGER, 3031, 229, { 0, 1 }, CPLT_ICS_PANEL, "Copilot HF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_H1_BUTTON", devices.VOLUME_MANAGER, 3045, 228, CPLT_ICS_PANEL, "Copilot HF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_H2_VOLUME", devices.VOLUME_MANAGER, 3032, 231, { 0, 1 }, CPLT_ICS_PANEL, "Copilot HF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_H2_BUTTON", devices.VOLUME_MANAGER, 3046, 230, CPLT_ICS_PANEL, "Copilot HF 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_PA_VOLUME", devices.VOLUME_MANAGER, 3033, 233, { 0, 1 }, CPLT_ICS_PANEL, "Copilot PA Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_PA_BUTTON", devices.VOLUME_MANAGER, 3047, 232, CPLT_ICS_PANEL, "Copilot PA Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_PA_GAIN", devices.VOLUME_MANAGER, 3034, 1356, { 0, 1 }, CPLT_ICS_PANEL, "Copilot PA GAIN Knob")
C_130J:definePotentiometer("CPLT_ICS_VOX_SENSITIVITY", devices.VOLUME_MANAGER, 3035, 1357, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VOX Sensitivity Knob")
C_130J:definePotentiometer("CPLT_ICS_V1_VOLUME", devices.VOLUME_MANAGER, 3036, 235, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VHF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_V1_BUTTON", devices.VOLUME_MANAGER, 3048, 234, CPLT_ICS_PANEL, "Copilot VHF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_V2_VOLUME", devices.VOLUME_MANAGER, 3037, 237, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VHF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_V2_BUTTON", devices.VOLUME_MANAGER, 3049, 236, CPLT_ICS_PANEL, "Copilot VHF 2 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_SATCOM_VOLUME", devices.VOLUME_MANAGER, 3038, 239, { 0, 1 }, CPLT_ICS_PANEL, "Copilot SAT Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_SATCOM_BUTTON", devices.VOLUME_MANAGER, 3050, 238, CPLT_ICS_PANEL, "Copilot SAT Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_PVT_VOLUME", devices.VOLUME_MANAGER, 3039, 241, { 0, 1 }, CPLT_ICS_PANEL, "Copilot PVT Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_PVT_BUTTON", devices.VOLUME_MANAGER, 3051, 240, CPLT_ICS_PANEL, "Copilot PVT Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_VOXHM_VOLUME", devices.VOLUME_MANAGER, 3040, 243, { 0, 1 }, CPLT_ICS_PANEL, "Copilot VOX/HM Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_VOXHM_BUTTON", devices.VOLUME_MANAGER, 3052, 242, CPLT_ICS_PANEL, "Copilot VOX/HM Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_U1_VOLUME", devices.VOLUME_MANAGER, 3041, 245, { 0, 1 }, CPLT_ICS_PANEL, "Copilot UHF 1 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_U1_BUTTON", devices.VOLUME_MANAGER, 3053, 244, CPLT_ICS_PANEL, "Copilot UHF 1 Pull to Monitor")
C_130J:definePotentiometer("CPLT_ICS_U2_VOLUME", devices.VOLUME_MANAGER, 3042, 247, { 0, 1 }, CPLT_ICS_PANEL, "Copilot UHF 2 Volume Knob")
C_130J:defineToggleSwitch("CPLT_ICS_U2_BUTTON", devices.VOLUME_MANAGER, 3054, 246, CPLT_ICS_PANEL, "Copilot UHF 2 Pull to Monitor")
C_130J:defineRockerSwitch("CPLT_ICS_INT_RADIO_ROCKER", devices.VOLUME_MANAGER, 3043, 3043, 3043, 3043, 292, CPLT_ICS_PANEL, "Copilot Intercom/Radio Transmit")
C_130J:defineMultipositionSwitch("CPLT_ICS_INTERPHONE_MODE", devices.VOLUME_MANAGER, 3055, 295, 4, 0.3, CPLT_ICS_PANEL, "Copilot Interphone Mode Switch", { positions = { "CALL", "INT", "VOX", "HOT MIC" } })
C_130J:defineTumb("CPLT_ICS_TRANSMISSION_SELECTOR", devices.VOLUME_MANAGER, 3056, 296, 1 / 9, { -2 / 9, 7 / 9 }, nil, false, CPLT_ICS_PANEL, "Copilot Transmission Selector Switch", { positions = { "PA", "INT", "U-1", "U-2", "V-1", "V-2", "H-1", "H-2", "SAT", "PVT" } })
C_130J:definePotentiometer("CPLT_ICS_MASTER_VOLUME", devices.VOLUME_MANAGER, 3029, 1358, { 0, 1 }, CPLT_ICS_PANEL, "Copilot Master Volume Knob")

-- Augmented Intercommunications System Control Panel
local AUG_ICS_PANEL = "AUG Intercommunications System Control Panel"
C_130J:definePotentiometer("AUG_ICS_INTVOLUME", devices.VOLUME_MANAGER, 3118, 269, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSInt Volume")
C_130J:defineToggleSwitch("AUG_ICS_INT_BUTTON", devices.VOLUME_MANAGER, 3132, 268, AUG_ICS_PANEL, "AUG ICSInt Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_H1_VOLUME", devices.VOLUME_MANAGER, 3119, 271, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSH1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_H1_BUTTON", devices.VOLUME_MANAGER, 3133, 270, AUG_ICS_PANEL, "AUG ICSH1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_H2_VOLUME", devices.VOLUME_MANAGER, 3120, 273, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSH2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_H2_BUTTON", devices.VOLUME_MANAGER, 3134, 272, AUG_ICS_PANEL, "AUG ICSH2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_PA_VOLUME", devices.VOLUME_MANAGER, 3121, 275, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSPA Volume")
C_130J:defineToggleSwitch("AUG_ICS_PA_BUTTON", devices.VOLUME_MANAGER, 3135, 274, AUG_ICS_PANEL, "AUG ICSPA Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_PA_GAIN", devices.VOLUME_MANAGER, 3122, 1359, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSPA Gain Knob")
C_130J:definePotentiometer("AUG_ICS_VOX_SENSITIVITY", devices.VOLUME_MANAGER, 3123, 1360, { 0, 1 }, AUG_ICS_PANEL, "Aug ICSVOX Sensitivity")
C_130J:definePotentiometer("AUG_ICS_V1_VOLUME", devices.VOLUME_MANAGER, 3124, 277, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSV1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_V1_BUTTON", devices.VOLUME_MANAGER, 3136, 276, AUG_ICS_PANEL, "AUG ICSV1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_V2_VOLUME", devices.VOLUME_MANAGER, 3125, 279, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSV2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_V2_BUTTON", devices.VOLUME_MANAGER, 3137, 278, AUG_ICS_PANEL, "AUG ICSV2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_SATCOM_VOLUME", devices.VOLUME_MANAGER, 3126, 281, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSSat Volume")
C_130J:defineToggleSwitch("AUG_ICS_SATCOM_BUTTON", devices.VOLUME_MANAGER, 3138, 280, AUG_ICS_PANEL, "AUG ICSSat Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_PVT_VOLUME", devices.VOLUME_MANAGER, 3127, 283, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSPVT Volume")
C_130J:defineToggleSwitch("AUG_ICS_PVT_BUTTON", devices.VOLUME_MANAGER, 3139, 282, AUG_ICS_PANEL, "AUG ICSPVT Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_VOXHM_VOLUME", devices.VOLUME_MANAGER, 3128, 285, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSHM Volume")
C_130J:defineToggleSwitch("AUG_ICS_VOXHM_BUTTON", devices.VOLUME_MANAGER, 3140, 284, AUG_ICS_PANEL, "AUG ICSHM Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_U1_VOLUME", devices.VOLUME_MANAGER, 3129, 287, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSU1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_U1_BUTTON", devices.VOLUME_MANAGER, 3141, 286, AUG_ICS_PANEL, "AUG ICSU1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_U2_VOLUME", devices.VOLUME_MANAGER, 3130, 289, { 0, 1 }, AUG_ICS_PANEL, "AUG ICSU2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_U2_BUTTON", devices.VOLUME_MANAGER, 3142, 288, AUG_ICS_PANEL, "AUG ICSU2 Pull to Monitor")
C_130J:defineRockerSwitch("AUG_ICS_INT_RADIO_ROCKER", devices.VOLUME_MANAGER, 3131, 3131, 3131, 3131, 290, AUG_ICS_PANEL, "AUG ICS Intercom/Radio")
C_130J:defineMultipositionSwitch("AUG_ICS_MIC_MODE", devices.VOLUME_MANAGER, 3143, 297, 4, 0.3, AUG_ICS_PANEL, "AUG ICS Mic Mode", { positions = { "CALL", "INT", "VOX", "HOT MIC" } })
C_130J:defineTumb("AUG_ICS_TRANSMISSION_SELECTOR", devices.VOLUME_MANAGER, 3144, 298, 1 / 9, { -2 / 9, 7 / 9 }, nil, false, AUG_ICS_PANEL, "AUG ICS Transmit Selector Switch", { positions = { "PA", "INT", "U-1", "U-2", "V-1", "V-2", "H-1", "H-2", "SAT", "PVT" } })
C_130J:definePotentiometer("AUG_ICS_MASTER_VOLUME", devices.VOLUME_MANAGER, 3097, 1361, { 0, 1 }, AUG_ICS_PANEL, "Aug ICS Master Volume Knob")

-- Pilot Communication/Navigation/Identification Management Unit
local PLT_CNI_MU = "PLT Communication/Navigation/Identification Management Unit"
C_130J:definePushButton("PLT_CNI_LSK_L1", devices.P_CNI, 3001, 1100, PLT_CNI_MU, "Pilot CNI-MU LSK L1")
C_130J:definePushButton("PLT_CNI_LSK_L2", devices.P_CNI, 3002, 1101, PLT_CNI_MU, "Pilot CNI-MU LSK L2")
C_130J:definePushButton("PLT_CNI_LSK_L3", devices.P_CNI, 3003, 1102, PLT_CNI_MU, "Pilot CNI-MU LSK L3")
C_130J:definePushButton("PLT_CNI_LSK_L4", devices.P_CNI, 3004, 1103, PLT_CNI_MU, "Pilot CNI-MU LSK L4")
C_130J:definePushButton("PLT_CNI_LSK_L5", devices.P_CNI, 3005, 1104, PLT_CNI_MU, "Pilot CNI-MU LSK L5")
C_130J:definePushButton("PLT_CNI_LSK_L6", devices.P_CNI, 3006, 1105, PLT_CNI_MU, "Pilot CNI-MU LSK L6")
C_130J:definePushButton("PLT_CNI_LSK_R1", devices.P_CNI, 3007, 1106, PLT_CNI_MU, "Pilot CNI-MU LSK R1")
C_130J:definePushButton("PLT_CNI_LSK_R2", devices.P_CNI, 3008, 1107, PLT_CNI_MU, "Pilot CNI-MU LSK R2")
C_130J:definePushButton("PLT_CNI_LSK_R3", devices.P_CNI, 3009, 1108, PLT_CNI_MU, "Pilot CNI-MU LSK R3")
C_130J:definePushButton("PLT_CNI_LSK_R4", devices.P_CNI, 3010, 1109, PLT_CNI_MU, "Pilot CNI-MU LSK R4")
C_130J:definePushButton("PLT_CNI_LSK_R5", devices.P_CNI, 3011, 1110, PLT_CNI_MU, "Pilot CNI-MU LSK R5")
C_130J:definePushButton("PLT_CNI_LSK_R6", devices.P_CNI, 3012, 1111, PLT_CNI_MU, "Pilot CNI-MU LSK R6")
C_130J:definePushButton("PLT_CNI_COMM_TUNE", devices.P_CNI, 3013, 1112, PLT_CNI_MU, "Pilot CNI-MU COMM TUNE Key")
C_130J:definePushButton("PLT_CNI_NAV_TUNE", devices.P_CNI, 3022, 1113, PLT_CNI_MU, "Pilot CNI-MU NAV TUNE Key")
C_130J:definePushButton("PLT_CNI_IFF", devices.P_CNI, 3021, 1114, PLT_CNI_MU, "Pilot CNI-MU IFF Key")
C_130J:definePushButton("PLT_CNI_NAV_CTRL", devices.P_CNI, 3015, 1115, PLT_CNI_MU, "Pilot CNI-MU NAV CTRL Key")
C_130J:definePushButton("PLT_CNI_MSN", devices.P_CNI, 3023, 1116, PLT_CNI_MU, "Pilot CNI-MU MSN Key")
C_130J:definePushButton("PLT_CNI_DIR_INTC", devices.P_CNI, 3018, 1117, PLT_CNI_MU, "Pilot CNI-MU DIR INTC Key")
C_130J:definePushButton("PLT_CNI_TOLD", devices.P_CNI, 3014, 1118, PLT_CNI_MU, "Pilot CNI-MU TOLD Key")
C_130J:definePushButton("PLT_CNI_INDX", devices.P_CNI, 3016, 1119, PLT_CNI_MU, "Pilot CNI-MU INDX Key")
C_130J:definePushButton("PLT_CNI_MC_INDX", devices.P_CNI, 3017, 1120, PLT_CNI_MU, "Pilot CNI-MU MC INDX Key")
C_130J:definePushButton("PLT_CNI_CAPS", devices.P_CNI, 3024, 1121, PLT_CNI_MU, "Pilot CNI-MU CAPS Key")
C_130J:definePushButton("PLT_CNI_EXEC", devices.P_CNI, 3025, 1122, PLT_CNI_MU, "Pilot CNI-MU EXEC Key")
C_130J:definePushButton("PLT_CNI_LEGS", devices.P_CNI, 3019, 1123, PLT_CNI_MU, "Pilot CNI-MU LEGS Key")
C_130J:definePushButton("PLT_CNI_MARK", devices.P_CNI, 3020, 1124, PLT_CNI_MU, "Pilot CNI-MU MARK Key")
C_130J:definePushButton("PLT_CNI_PREV_PAGE", devices.P_CNI, 3027, 1125, PLT_CNI_MU, "Pilot CNI-MU PREV PAGE Key")
C_130J:definePushButton("PLT_CNI_NEXT_PAGE", devices.P_CNI, 3026, 1126, PLT_CNI_MU, "Pilot CNI-MU NEXT PAGE Key")
C_130J:defineRockerSwitch("PLT_CNI_BRT_ROCKER", devices.P_CNI, 3070, 3070, 3071, 3071, 1127, PLT_CNI_MU, "Pilot CNI-MU BRT", { positions = { "DECREASE", "OFF", "INCREASE" } })
C_130J:definePushButton("PLT_CNI_KBD_1", devices.P_CNI, 3031, 1128, PLT_CNI_MU, "Pilot CNI-MU 1 Key")
C_130J:definePushButton("PLT_CNI_KBD_2", devices.P_CNI, 3032, 1129, PLT_CNI_MU, "Pilot CNI-MU 2 Key")
C_130J:definePushButton("PLT_CNI_KBD_3", devices.P_CNI, 3033, 1130, PLT_CNI_MU, "Pilot CNI-MU 3 Key")
C_130J:definePushButton("PLT_CNI_KBD_4", devices.P_CNI, 3034, 1131, PLT_CNI_MU, "Pilot CNI-MU 4 Key")
C_130J:definePushButton("PLT_CNI_KBD_5", devices.P_CNI, 3035, 1132, PLT_CNI_MU, "Pilot CNI-MU 5 Key")
C_130J:definePushButton("PLT_CNI_KBD_6", devices.P_CNI, 3036, 1133, PLT_CNI_MU, "Pilot CNI-MU 6 Key")
C_130J:definePushButton("PLT_CNI_KBD_7", devices.P_CNI, 3037, 1134, PLT_CNI_MU, "Pilot CNI-MU 7 Key")
C_130J:definePushButton("PLT_CNI_KBD_8", devices.P_CNI, 3038, 1135, PLT_CNI_MU, "Pilot CNI-MU 8 Key")
C_130J:definePushButton("PLT_CNI_KBD_9", devices.P_CNI, 3039, 1136, PLT_CNI_MU, "Pilot CNI-MU 9 Key")
C_130J:definePushButton("PLT_CNI_KBD_0", devices.P_CNI, 3030, 1137, PLT_CNI_MU, "Pilot CNI-MU 0 Key")
C_130J:definePushButton("PLT_CNI_KBD_DOT", devices.P_CNI, 3040, 1138, PLT_CNI_MU, "Pilot CNI-MU . Key")
C_130J:definePushButton("PLT_CNI_KBD_PLUSMINUS", devices.P_CNI, 3041, 1139, PLT_CNI_MU, "Pilot CNI-MU +/- Key")
C_130J:definePushButton("PLT_CNI_KBD_A", devices.P_CNI, 3042, 1140, PLT_CNI_MU, "Pilot CNI-MU A Key")
C_130J:definePushButton("PLT_CNI_KBD_B", devices.P_CNI, 3043, 1141, PLT_CNI_MU, "Pilot CNI-MU B Key")
C_130J:definePushButton("PLT_CNI_KBD_C", devices.P_CNI, 3044, 1142, PLT_CNI_MU, "Pilot CNI-MU C Key")
C_130J:definePushButton("PLT_CNI_KBD_D", devices.P_CNI, 3045, 1143, PLT_CNI_MU, "Pilot CNI-MU D Key")
C_130J:definePushButton("PLT_CNI_KBD_E", devices.P_CNI, 3046, 1144, PLT_CNI_MU, "Pilot CNI-MU E Key")
C_130J:definePushButton("PLT_CNI_KBD_F", devices.P_CNI, 3047, 1145, PLT_CNI_MU, "Pilot CNI-MU F Key")
C_130J:definePushButton("PLT_CNI_KBD_G", devices.P_CNI, 3048, 1146, PLT_CNI_MU, "Pilot CNI-MU G Key")
C_130J:definePushButton("PLT_CNI_KBD_H", devices.P_CNI, 3049, 1147, PLT_CNI_MU, "Pilot CNI-MU H Key")
C_130J:definePushButton("PLT_CNI_KBD_I", devices.P_CNI, 3050, 1148, PLT_CNI_MU, "Pilot CNI-MU I Key")
C_130J:definePushButton("PLT_CNI_KBD_J", devices.P_CNI, 3051, 1149, PLT_CNI_MU, "Pilot CNI-MU J Key")
C_130J:definePushButton("PLT_CNI_KBD_K", devices.P_CNI, 3052, 1150, PLT_CNI_MU, "Pilot CNI-MU K Key")
C_130J:definePushButton("PLT_CNI_KBD_L", devices.P_CNI, 3053, 1151, PLT_CNI_MU, "Pilot CNI-MU L Key")
C_130J:definePushButton("PLT_CNI_KBD_M", devices.P_CNI, 3054, 1152, PLT_CNI_MU, "Pilot CNI-MU M Key")
C_130J:definePushButton("PLT_CNI_KBD_N", devices.P_CNI, 3055, 1153, PLT_CNI_MU, "Pilot CNI-MU N Key")
C_130J:definePushButton("PLT_CNI_KBD_O", devices.P_CNI, 3056, 1154, PLT_CNI_MU, "Pilot CNI-MU O Key")
C_130J:definePushButton("PLT_CNI_KBD_P", devices.P_CNI, 3057, 1155, PLT_CNI_MU, "Pilot CNI-MU P Key")
C_130J:definePushButton("PLT_CNI_KBD_Q", devices.P_CNI, 3058, 1156, PLT_CNI_MU, "Pilot CNI-MU Q Key")
C_130J:definePushButton("PLT_CNI_KBD_R", devices.P_CNI, 3059, 1157, PLT_CNI_MU, "Pilot CNI-MU R Key")
C_130J:definePushButton("PLT_CNI_KBD_S", devices.P_CNI, 3060, 1158, PLT_CNI_MU, "Pilot CNI-MU S Key")
C_130J:definePushButton("PLT_CNI_KBD_T", devices.P_CNI, 3061, 1159, PLT_CNI_MU, "Pilot CNI-MU T Key")
C_130J:definePushButton("PLT_CNI_KBD_U", devices.P_CNI, 3062, 1160, PLT_CNI_MU, "Pilot CNI-MU U Key")
C_130J:definePushButton("PLT_CNI_KBD_V", devices.P_CNI, 3063, 1161, PLT_CNI_MU, "Pilot CNI-MU V Key")
C_130J:definePushButton("PLT_CNI_KBD_W", devices.P_CNI, 3064, 1162, PLT_CNI_MU, "Pilot CNI-MU W Key")
C_130J:definePushButton("PLT_CNI_KBD_X", devices.P_CNI, 3065, 1163, PLT_CNI_MU, "Pilot CNI-MU X Key")
C_130J:definePushButton("PLT_CNI_KBD_Y", devices.P_CNI, 3066, 1164, PLT_CNI_MU, "Pilot CNI-MU Y Key")
C_130J:definePushButton("PLT_CNI_KBD_Z", devices.P_CNI, 3067, 1165, PLT_CNI_MU, "Pilot CNI-MU Z Key")
C_130J:definePushButton("PLT_CNI_KBD_SLASH", devices.P_CNI, 3068, 1168, PLT_CNI_MU, "Pilot CNI-MU / Key")
C_130J:definePushButton("PLT_CNI_KBD_DEL", devices.P_CNI, 3028, 1167, PLT_CNI_MU, "Pilot CNI-MU DEL Key")
C_130J:definePushButton("PLT_CNI_KBD_CLR", devices.P_CNI, 3029, 1169, PLT_CNI_MU, "Pilot CNI-MU CLR Key")
C_130J:defineIndicatorLight("PLT_CNI_DSPY_LED", 4137, PLT_CNI_MU, "Pilot CNI-MU DSPY Light", { color = "Green" })
C_130J:defineIndicatorLight("PLT_CNI_MSG_LED", 4138, PLT_CNI_MU, "Pilot CNI-MU MSG Light", { color = "Green" })
C_130J:defineIndicatorLight("PLT_CNI_FAIL_LED", 4139, PLT_CNI_MU, "Pilot CNI-MU FAIL Light", { color = "Yellow" })
C_130J:defineIndicatorLight("PLT_CNI_OFSET_LED", 4140, PLT_CNI_MU, "Pilot CNI-MU OFSET Light", { color = "Green" })
C_130J:defineFloat("PLT_CNI_EXEC_LED", 3390, { 0, 1 }, PLT_CNI_MU, "Pilot CNI-MU EXEC Light (Green)")

-- Copilot Communication/Navigation/Identification Management Unit
local CPLT_CNI_MU = "CPLT Communication/Navigation/Identification Management Unit"
C_130J:definePushButton("CPLT_CNI_LSK_L1", devices.C_CNI, 3001, 1170, CPLT_CNI_MU, "Copilot CNI-MU LSK L1")
C_130J:definePushButton("CPLT_CNI_LSK_L2", devices.C_CNI, 3002, 1171, CPLT_CNI_MU, "Copilot CNI-MU LSK L2")
C_130J:definePushButton("CPLT_CNI_LSK_L3", devices.C_CNI, 3003, 1172, CPLT_CNI_MU, "Copilot CNI-MU LSK L3")
C_130J:definePushButton("CPLT_CNI_LSK_L4", devices.C_CNI, 3004, 1173, CPLT_CNI_MU, "Copilot CNI-MU LSK L4")
C_130J:definePushButton("CPLT_CNI_LSK_L5", devices.C_CNI, 3005, 1174, CPLT_CNI_MU, "Copilot CNI-MU LSK L5")
C_130J:definePushButton("CPLT_CNI_LSK_L6", devices.C_CNI, 3006, 1175, CPLT_CNI_MU, "Copilot CNI-MU LSK L6")
C_130J:definePushButton("CPLT_CNI_LSK_R1", devices.C_CNI, 3007, 1176, CPLT_CNI_MU, "Copilot CNI-MU LSK R1")
C_130J:definePushButton("CPLT_CNI_LSK_R2", devices.C_CNI, 3008, 1177, CPLT_CNI_MU, "Copilot CNI-MU LSK R2")
C_130J:definePushButton("CPLT_CNI_LSK_R3", devices.C_CNI, 3009, 1178, CPLT_CNI_MU, "Copilot CNI-MU LSK R3")
C_130J:definePushButton("CPLT_CNI_LSK_R4", devices.C_CNI, 3010, 1179, CPLT_CNI_MU, "Copilot CNI-MU LSK R4")
C_130J:definePushButton("CPLT_CNI_LSK_R5", devices.C_CNI, 3011, 1180, CPLT_CNI_MU, "Copilot CNI-MU LSK R5")
C_130J:definePushButton("CPLT_CNI_LSK_R6", devices.C_CNI, 3012, 1181, CPLT_CNI_MU, "Copilot CNI-MU LSK R6")
C_130J:definePushButton("CPLT_CNI_COMM_TUNE", devices.C_CNI, 3013, 1182, CPLT_CNI_MU, "Copilot CNI-MU COMM TUNE Key")
C_130J:definePushButton("CPLT_CNI_NAV_TUNE", devices.C_CNI, 3022, 1183, CPLT_CNI_MU, "Copilot CNI-MU NAV TUNE Key")
C_130J:definePushButton("CPLT_CNI_IFF", devices.C_CNI, 3021, 1184, CPLT_CNI_MU, "Copilot CNI-MU IFF Key")
C_130J:definePushButton("CPLT_CNI_NAV_CTRL", devices.C_CNI, 3015, 1185, CPLT_CNI_MU, "Copilot CNI-MU NAV CTRL Key")
C_130J:definePushButton("CPLT_CNI_MSN", devices.C_CNI, 3023, 1186, CPLT_CNI_MU, "Copilot CNI-MU MSN Key")
C_130J:definePushButton("CPLT_CNI_DIR_INTC", devices.C_CNI, 3018, 1187, CPLT_CNI_MU, "Copilot CNI-MU DIR INTC Key")
C_130J:definePushButton("CPLT_CNI_TOLD", devices.C_CNI, 3014, 1188, CPLT_CNI_MU, "Copilot CNI-MU TOLD Key")
C_130J:definePushButton("CPLT_CNI_INDX", devices.C_CNI, 3016, 1189, CPLT_CNI_MU, "Copilot CNI-MU INDX Key")
C_130J:definePushButton("CPLT_CNI_MC_INDX", devices.C_CNI, 3017, 1190, CPLT_CNI_MU, "Copilot CNI-MU MC INDX Key")
C_130J:definePushButton("CPLT_CNI_CAPS", devices.C_CNI, 3024, 1191, CPLT_CNI_MU, "Copilot CNI-MU CAPS Key")
C_130J:definePushButton("CPLT_CNI_EXEC", devices.C_CNI, 3025, 1192, CPLT_CNI_MU, "Copilot CNI-MU EXEC Key")
C_130J:definePushButton("CPLT_CNI_LEGS", devices.C_CNI, 3019, 1193, CPLT_CNI_MU, "Copilot CNI-MU LEGS Key")
C_130J:definePushButton("CPLT_CNI_MARK", devices.C_CNI, 3020, 1194, CPLT_CNI_MU, "Copilot CNI-MU MARK Key")
C_130J:definePushButton("CPLT_CNI_PREV_PAGE", devices.C_CNI, 3027, 1195, CPLT_CNI_MU, "Copilot CNI-MU PREV PAGE Key")
C_130J:definePushButton("CPLT_CNI_NEXT_PAGE", devices.C_CNI, 3026, 1196, CPLT_CNI_MU, "Copilot CNI-MU NEXT PAGE Key")
C_130J:defineRockerSwitch("CPLT_CNI_BRT_ROCKER", devices.C_CNI, 3070, 3070, 3071, 3071, 1197, CPLT_CNI_MU, "Copilot CNI-MU BRT", { positions = { "DECREASE", "OFF", "INCREASE" } })
C_130J:definePushButton("CPLT_CNI_KBD_1", devices.C_CNI, 3031, 1198, CPLT_CNI_MU, "Copilot CNI-MU 1 Key")
C_130J:definePushButton("CPLT_CNI_KBD_2", devices.C_CNI, 3032, 1199, CPLT_CNI_MU, "Copilot CNI-MU 2 Key")
C_130J:definePushButton("CPLT_CNI_KBD_3", devices.C_CNI, 3033, 1200, CPLT_CNI_MU, "Copilot CNI-MU 3 Key")
C_130J:definePushButton("CPLT_CNI_KBD_4", devices.C_CNI, 3034, 1201, CPLT_CNI_MU, "Copilot CNI-MU 4 Key")
C_130J:definePushButton("CPLT_CNI_KBD_5", devices.C_CNI, 3035, 1202, CPLT_CNI_MU, "Copilot CNI-MU 5 Key")
C_130J:definePushButton("CPLT_CNI_KBD_6", devices.C_CNI, 3036, 1203, CPLT_CNI_MU, "Copilot CNI-MU 6 Key")
C_130J:definePushButton("CPLT_CNI_KBD_7", devices.C_CNI, 3037, 1204, CPLT_CNI_MU, "Copilot CNI-MU 7 Key")
C_130J:definePushButton("CPLT_CNI_KBD_8", devices.C_CNI, 3038, 1205, CPLT_CNI_MU, "Copilot CNI-MU 8 Key")
C_130J:definePushButton("CPLT_CNI_KBD_9", devices.C_CNI, 3039, 1206, CPLT_CNI_MU, "Copilot CNI-MU 9 Key")
C_130J:definePushButton("CPLT_CNI_KBD_0", devices.C_CNI, 3030, 1207, CPLT_CNI_MU, "Copilot CNI-MU 0 Key")
C_130J:definePushButton("CPLT_CNI_KBD_DOT", devices.C_CNI, 3040, 1208, CPLT_CNI_MU, "Copilot CNI-MU . Key")
C_130J:definePushButton("CPLT_CNI_KBD_PLUSMINUS", devices.C_CNI, 3041, 1209, CPLT_CNI_MU, "Copilot CNI-MU +/- Key")
C_130J:definePushButton("CPLT_CNI_KBD_A", devices.C_CNI, 3042, 1210, CPLT_CNI_MU, "Copilot CNI-MU A Key")
C_130J:definePushButton("CPLT_CNI_KBD_B", devices.C_CNI, 3043, 1211, CPLT_CNI_MU, "Copilot CNI-MU B Key")
C_130J:definePushButton("CPLT_CNI_KBD_C", devices.C_CNI, 3044, 1212, CPLT_CNI_MU, "Copilot CNI-MU C Key")
C_130J:definePushButton("CPLT_CNI_KBD_D", devices.C_CNI, 3045, 1213, CPLT_CNI_MU, "Copilot CNI-MU D Key")
C_130J:definePushButton("CPLT_CNI_KBD_E", devices.C_CNI, 3046, 1214, CPLT_CNI_MU, "Copilot CNI-MU E Key")
C_130J:definePushButton("CPLT_CNI_KBD_F", devices.C_CNI, 3047, 1215, CPLT_CNI_MU, "Copilot CNI-MU F Key")
C_130J:definePushButton("CPLT_CNI_KBD_G", devices.C_CNI, 3048, 1216, CPLT_CNI_MU, "Copilot CNI-MU G Key")
C_130J:definePushButton("CPLT_CNI_KBD_H", devices.C_CNI, 3049, 1217, CPLT_CNI_MU, "Copilot CNI-MU H Key")
C_130J:definePushButton("CPLT_CNI_KBD_I", devices.C_CNI, 3050, 1218, CPLT_CNI_MU, "Copilot CNI-MU I Key")
C_130J:definePushButton("CPLT_CNI_KBD_J", devices.C_CNI, 3051, 1219, CPLT_CNI_MU, "Copilot CNI-MU J Key")
C_130J:definePushButton("CPLT_CNI_KBD_K", devices.C_CNI, 3052, 1220, CPLT_CNI_MU, "Copilot CNI-MU K Key")
C_130J:definePushButton("CPLT_CNI_KBD_L", devices.C_CNI, 3053, 1221, CPLT_CNI_MU, "Copilot CNI-MU L Key")
C_130J:definePushButton("CPLT_CNI_KBD_M", devices.C_CNI, 3054, 1222, CPLT_CNI_MU, "Copilot CNI-MU M Key")
C_130J:definePushButton("CPLT_CNI_KBD_N", devices.C_CNI, 3055, 1223, CPLT_CNI_MU, "Copilot CNI-MU N Key")
C_130J:definePushButton("CPLT_CNI_KBD_O", devices.C_CNI, 3056, 1224, CPLT_CNI_MU, "Copilot CNI-MU O Key")
C_130J:definePushButton("CPLT_CNI_KBD_P", devices.C_CNI, 3057, 1225, CPLT_CNI_MU, "Copilot CNI-MU P Key")
C_130J:definePushButton("CPLT_CNI_KBD_Q", devices.C_CNI, 3058, 1226, CPLT_CNI_MU, "Copilot CNI-MU Q Key")
C_130J:definePushButton("CPLT_CNI_KBD_R", devices.C_CNI, 3059, 1227, CPLT_CNI_MU, "Copilot CNI-MU R Key")
C_130J:definePushButton("CPLT_CNI_KBD_S", devices.C_CNI, 3060, 1228, CPLT_CNI_MU, "Copilot CNI-MU S Key")
C_130J:definePushButton("CPLT_CNI_KBD_T", devices.C_CNI, 3061, 1229, CPLT_CNI_MU, "Copilot CNI-MU T Key")
C_130J:definePushButton("CPLT_CNI_KBD_U", devices.C_CNI, 3062, 1230, CPLT_CNI_MU, "Copilot CNI-MU U Key")
C_130J:definePushButton("CPLT_CNI_KBD_V", devices.C_CNI, 3063, 1231, CPLT_CNI_MU, "Copilot CNI-MU V Key")
C_130J:definePushButton("CPLT_CNI_KBD_W", devices.C_CNI, 3064, 1232, CPLT_CNI_MU, "Copilot CNI-MU W Key")
C_130J:definePushButton("CPLT_CNI_KBD_X", devices.C_CNI, 3065, 1233, CPLT_CNI_MU, "Copilot CNI-MU X Key")
C_130J:definePushButton("CPLT_CNI_KBD_Y", devices.C_CNI, 3066, 1234, CPLT_CNI_MU, "Copilot CNI-MU Y Key")
C_130J:definePushButton("CPLT_CNI_KBD_Z", devices.C_CNI, 3067, 1235, CPLT_CNI_MU, "Copilot CNI-MU Z Key")
C_130J:definePushButton("CPLT_CNI_KBD_SLASH", devices.C_CNI, 3068, 1238, CPLT_CNI_MU, "Copilot CNI-MU / Key")
C_130J:definePushButton("CPLT_CNI_KBD_DEL", devices.C_CNI, 3028, 1237, CPLT_CNI_MU, "Copilot CNI-MU DEL Key")
C_130J:definePushButton("CPLT_CNI_KBD_CLR", devices.C_CNI, 3029, 1239, CPLT_CNI_MU, "Copilot CNI-MU CLR Key")
C_130J:defineIndicatorLight("CPLT_CNI_DSPY_LED", 4141, CPLT_CNI_MU, "Copilot CNI-MU DSPY Light", { color = "Green" })
C_130J:defineIndicatorLight("CPLT_CNI_MSG_LED", 4142, CPLT_CNI_MU, "Copilot CNI-MU MSG Light", { color = "Green" })
C_130J:defineIndicatorLight("CPLT_CNI_FAIL_LED", 4143, CPLT_CNI_MU, "Copilot CNI-MU FAIL Light", { color = "Yellow" })
C_130J:defineIndicatorLight("CPLT_CNI_OFSET_LED", 4144, CPLT_CNI_MU, "Copilot CNI-MU OFSET Light", { color = "Green" })
C_130J:defineFloat("CPLT_CNI_EXEC_LED", 3392, { 0, 1 }, CPLT_CNI_MU, "Copilot CNI-MU EXEC Light (Green)")

-- Augmented Communication/Navigation/Identification Management Unit
local AUG_CNI_MU = "AUG Communication/Navigation/Identification Management Unit"
C_130J:definePushButton("AUG_CNI_LSK_L1", devices.AC_CNI, 3001, 1240, AUG_CNI_MU, "Aug Crew CNI-MU LSK L1")
C_130J:definePushButton("AUG_CNI_LSK_L2", devices.AC_CNI, 3002, 1241, AUG_CNI_MU, "Aug Crew CNI-MU LSK L2")
C_130J:definePushButton("AUG_CNI_LSK_L3", devices.AC_CNI, 3003, 1242, AUG_CNI_MU, "Aug Crew CNI-MU LSK L3")
C_130J:definePushButton("AUG_CNI_LSK_L4", devices.AC_CNI, 3004, 1243, AUG_CNI_MU, "Aug Crew CNI-MU LSK L4")
C_130J:definePushButton("AUG_CNI_LSK_L5", devices.AC_CNI, 3005, 1244, AUG_CNI_MU, "Aug Crew CNI-MU LSK L5")
C_130J:definePushButton("AUG_CNI_LSK_L6", devices.AC_CNI, 3006, 1245, AUG_CNI_MU, "Aug Crew CNI-MU LSK L6")
C_130J:definePushButton("AUG_CNI_LSK_R1", devices.AC_CNI, 3007, 1246, AUG_CNI_MU, "Aug Crew CNI-MU LSK R1")
C_130J:definePushButton("AUG_CNI_LSK_R2", devices.AC_CNI, 3008, 1247, AUG_CNI_MU, "Aug Crew CNI-MU LSK R2")
C_130J:definePushButton("AUG_CNI_LSK_R3", devices.AC_CNI, 3009, 1248, AUG_CNI_MU, "Aug Crew CNI-MU LSK R3")
C_130J:definePushButton("AUG_CNI_LSK_R4", devices.AC_CNI, 3010, 1249, AUG_CNI_MU, "Aug Crew CNI-MU LSK R4")
C_130J:definePushButton("AUG_CNI_LSK_R5", devices.AC_CNI, 3011, 1250, AUG_CNI_MU, "Aug Crew CNI-MU LSK R5")
C_130J:definePushButton("AUG_CNI_LSK_R6", devices.AC_CNI, 3012, 1251, AUG_CNI_MU, "Aug Crew CNI-MU LSK R6")
C_130J:definePushButton("AUG_CNI_COMM_TUNE", devices.AC_CNI, 3013, 1252, AUG_CNI_MU, "Aug Crew CNI-MU COMM TUNE Key")
C_130J:definePushButton("AUG_CNI_NAV_TUNE", devices.AC_CNI, 3022, 1253, AUG_CNI_MU, "Aug Crew CNI-MU NAV TUNE Key")
C_130J:definePushButton("AUG_CNI_IFF", devices.AC_CNI, 3021, 1254, AUG_CNI_MU, "Aug Crew CNI-MU IFF Key")
C_130J:definePushButton("AUG_CNI_NAV_CTRL", devices.AC_CNI, 3015, 1255, AUG_CNI_MU, "Aug Crew CNI-MU NAV CTRL Key")
C_130J:definePushButton("AUG_CNI_MSN", devices.AC_CNI, 3023, 1256, AUG_CNI_MU, "Aug Crew CNI-MU MSN Key")
C_130J:definePushButton("AUG_CNI_DIR_INTC", devices.AC_CNI, 3018, 1257, AUG_CNI_MU, "Aug Crew CNI-MU DIR INTC Key")
C_130J:definePushButton("AUG_CNI_TOLD", devices.AC_CNI, 3014, 1258, AUG_CNI_MU, "Aug Crew CNI-MU TOLD Key")
C_130J:definePushButton("AUG_CNI_INDX", devices.AC_CNI, 3016, 1259, AUG_CNI_MU, "Aug Crew CNI-MU INDX Key")
C_130J:definePushButton("AUG_CNI_MC_INDX", devices.AC_CNI, 3017, 1260, AUG_CNI_MU, "Aug Crew CNI-MU MC INDX Key")
C_130J:definePushButton("AUG_CNI_CAPS", devices.AC_CNI, 3024, 1261, AUG_CNI_MU, "Aug Crew CNI-MU CAPS Key")
C_130J:definePushButton("AUG_CNI_EXEC", devices.AC_CNI, 3025, 1262, AUG_CNI_MU, "Aug Crew CNI-MU EXEC Key")
C_130J:definePushButton("AUG_CNI_LEGS", devices.AC_CNI, 3019, 1263, AUG_CNI_MU, "Aug Crew CNI-MU LEGS Key")
C_130J:definePushButton("AUG_CNI_MARK", devices.AC_CNI, 3020, 1264, AUG_CNI_MU, "Aug Crew CNI-MU MARK Key")
C_130J:definePushButton("AUG_CNI_PREV_PAGE", devices.AC_CNI, 3027, 1265, AUG_CNI_MU, "Aug Crew CNI-MU PREV PAGE Key")
C_130J:definePushButton("AUG_CNI_NEXT_PAGE", devices.AC_CNI, 3026, 1266, AUG_CNI_MU, "Aug Crew CNI-MU NEXT PAGE Key")
C_130J:defineRockerSwitch("AUG_CNI_BRT_ROCKER", devices.AC_CNI, 3070, 3070, 3071, 3071, 1267, AUG_CNI_MU, "Aug Crew CNI-MU BRT", { positions = { "DECREASE", "OFF", "INCREASE" } })
C_130J:definePushButton("AUG_CNI_KBD_1", devices.AC_CNI, 3031, 1268, AUG_CNI_MU, "Aug Crew CNI-MU 1 Key")
C_130J:definePushButton("AUG_CNI_KBD_2", devices.AC_CNI, 3032, 1269, AUG_CNI_MU, "Aug Crew CNI-MU 2 Key")
C_130J:definePushButton("AUG_CNI_KBD_3", devices.AC_CNI, 3033, 1270, AUG_CNI_MU, "Aug Crew CNI-MU 3 Key")
C_130J:definePushButton("AUG_CNI_KBD_4", devices.AC_CNI, 3034, 1271, AUG_CNI_MU, "Aug Crew CNI-MU 4 Key")
C_130J:definePushButton("AUG_CNI_KBD_5", devices.AC_CNI, 3035, 1272, AUG_CNI_MU, "Aug Crew CNI-MU 5 Key")
C_130J:definePushButton("AUG_CNI_KBD_6", devices.AC_CNI, 3036, 1273, AUG_CNI_MU, "Aug Crew CNI-MU 6 Key")
C_130J:definePushButton("AUG_CNI_KBD_7", devices.AC_CNI, 3037, 1274, AUG_CNI_MU, "Aug Crew CNI-MU 7 Key")
C_130J:definePushButton("AUG_CNI_KBD_8", devices.AC_CNI, 3038, 1275, AUG_CNI_MU, "Aug Crew CNI-MU 8 Key")
C_130J:definePushButton("AUG_CNI_KBD_9", devices.AC_CNI, 3039, 1276, AUG_CNI_MU, "Aug Crew CNI-MU 9 Key")
C_130J:definePushButton("AUG_CNI_KBD_0", devices.AC_CNI, 3030, 1277, AUG_CNI_MU, "Aug Crew CNI-MU 0 Key")
C_130J:definePushButton("AUG_CNI_KBD_DOT", devices.AC_CNI, 3040, 1278, AUG_CNI_MU, "Aug Crew CNI-MU . Key")
C_130J:definePushButton("AUG_CNI_KBD_PLUSMINUS", devices.AC_CNI, 3041, 1279, AUG_CNI_MU, "Aug Crew CNI-MU +/- Key")
C_130J:definePushButton("AUG_CNI_KBD_A", devices.AC_CNI, 3042, 1280, AUG_CNI_MU, "Aug Crew CNI-MU A Key")
C_130J:definePushButton("AUG_CNI_KBD_B", devices.AC_CNI, 3043, 1281, AUG_CNI_MU, "Aug Crew CNI-MU B Key")
C_130J:definePushButton("AUG_CNI_KBD_C", devices.AC_CNI, 3044, 1282, AUG_CNI_MU, "Aug Crew CNI-MU C Key")
C_130J:definePushButton("AUG_CNI_KBD_D", devices.AC_CNI, 3045, 1283, AUG_CNI_MU, "Aug Crew CNI-MU D Key")
C_130J:definePushButton("AUG_CNI_KBD_E", devices.AC_CNI, 3046, 1284, AUG_CNI_MU, "Aug Crew CNI-MU E Key")
C_130J:definePushButton("AUG_CNI_KBD_F", devices.AC_CNI, 3047, 1285, AUG_CNI_MU, "Aug Crew CNI-MU F Key")
C_130J:definePushButton("AUG_CNI_KBD_G", devices.AC_CNI, 3048, 1286, AUG_CNI_MU, "Aug Crew CNI-MU G Key")
C_130J:definePushButton("AUG_CNI_KBD_H", devices.AC_CNI, 3049, 1287, AUG_CNI_MU, "Aug Crew CNI-MU H Key")
C_130J:definePushButton("AUG_CNI_KBD_I", devices.AC_CNI, 3050, 1288, AUG_CNI_MU, "Aug Crew CNI-MU I Key")
C_130J:definePushButton("AUG_CNI_KBD_J", devices.AC_CNI, 3051, 1289, AUG_CNI_MU, "Aug Crew CNI-MU J Key")
C_130J:definePushButton("AUG_CNI_KBD_K", devices.AC_CNI, 3052, 1290, AUG_CNI_MU, "Aug Crew CNI-MU K Key")
C_130J:definePushButton("AUG_CNI_KBD_L", devices.AC_CNI, 3053, 1291, AUG_CNI_MU, "Aug Crew CNI-MU L Key")
C_130J:definePushButton("AUG_CNI_KBD_M", devices.AC_CNI, 3054, 1292, AUG_CNI_MU, "Aug Crew CNI-MU M Key")
C_130J:definePushButton("AUG_CNI_KBD_N", devices.AC_CNI, 3055, 1293, AUG_CNI_MU, "Aug Crew CNI-MU N Key")
C_130J:definePushButton("AUG_CNI_KBD_O", devices.AC_CNI, 3056, 1294, AUG_CNI_MU, "Aug Crew CNI-MU O Key")
C_130J:definePushButton("AUG_CNI_KBD_P", devices.AC_CNI, 3057, 1295, AUG_CNI_MU, "Aug Crew CNI-MU P Key")
C_130J:definePushButton("AUG_CNI_KBD_Q", devices.AC_CNI, 3058, 1296, AUG_CNI_MU, "Aug Crew CNI-MU Q Key")
C_130J:definePushButton("AUG_CNI_KBD_R", devices.AC_CNI, 3059, 1297, AUG_CNI_MU, "Aug Crew CNI-MU R Key")
C_130J:definePushButton("AUG_CNI_KBD_S", devices.AC_CNI, 3060, 1298, AUG_CNI_MU, "Aug Crew CNI-MU S Key")
C_130J:definePushButton("AUG_CNI_KBD_T", devices.AC_CNI, 3061, 1299, AUG_CNI_MU, "Aug Crew CNI-MU T Key")
C_130J:definePushButton("AUG_CNI_KBD_U", devices.AC_CNI, 3062, 1300, AUG_CNI_MU, "Aug Crew CNI-MU U Key")
C_130J:definePushButton("AUG_CNI_KBD_V", devices.AC_CNI, 3063, 1301, AUG_CNI_MU, "Aug Crew CNI-MU V Key")
C_130J:definePushButton("AUG_CNI_KBD_W", devices.AC_CNI, 3064, 1302, AUG_CNI_MU, "Aug Crew CNI-MU W Key")
C_130J:definePushButton("AUG_CNI_KBD_X", devices.AC_CNI, 3065, 1303, AUG_CNI_MU, "Aug Crew CNI-MU X Key")
C_130J:definePushButton("AUG_CNI_KBD_Y", devices.AC_CNI, 3066, 1304, AUG_CNI_MU, "Aug Crew CNI-MU Y Key")
C_130J:definePushButton("AUG_CNI_KBD_Z", devices.AC_CNI, 3067, 1305, AUG_CNI_MU, "Aug Crew CNI-MU Z Key")
C_130J:definePushButton("AUG_CNI_KBD_SLASH", devices.AC_CNI, 3068, 1308, AUG_CNI_MU, "Aug Crew CNI-MU / Key")
C_130J:definePushButton("AUG_CNI_KBD_DEL", devices.AC_CNI, 3028, 1307, AUG_CNI_MU, "Aug Crew CNI-MU DEL Key")
C_130J:definePushButton("AUG_CNI_KBD_CLR", devices.AC_CNI, 3029, 1309, AUG_CNI_MU, "Aug Crew CNI-MU CLR Key")
C_130J:defineIndicatorLight("AUG_CNI_DSPY_LED", 4145, AUG_CNI_MU, "Aug Crew CNI-MU DSPY Light", { color = "Green" })
C_130J:defineIndicatorLight("AUG_CNI_MSG_LED", 4146, AUG_CNI_MU, "Aug Crew CNI-MU MSG Light", { color = "Green" })
C_130J:defineIndicatorLight("AUG_CNI_FAIL_LED", 4147, AUG_CNI_MU, "Aug Crew CNI-MU FAIL Light", { color = "Yellow" })
C_130J:defineIndicatorLight("AUG_CNI_OFSET_LED", 4148, AUG_CNI_MU, "Aug Crew CNI-MU OFSET Light", { color = "Green" })
C_130J:defineFloat("AUG_CNI_EXEC_LED", 3394, { 0, 1 }, AUG_CNI_MU, "Aug Crew CNI-MU EXEC Light (Green)")

-- Pilot Remote Heading and Course Selector
local PLT_HEAD_COURSE = "PLT Remote Heading and Course Selector"
C_130J:defineRotaryWithRange("PLT_HEADING_ADJUST", devices.PILOT_CPT_INTERFACE, 3001, 490, { -1, 1 }, PLT_HEAD_COURSE, "Pilot Heading Adjust")
C_130J:defineToggleSwitch("PLT_HEADING_SYNC", devices.PILOT_CPT_INTERFACE, 3003, 562, PLT_HEAD_COURSE, "Pilot Heading Push to Sync")
C_130J:defineRotaryWithRange("PLT_COURSE_ADJUST", devices.PILOT_CPT_INTERFACE, 3002, 491, { -1, 1 }, PLT_HEAD_COURSE, "Pilot Course Adjust")
C_130J:defineToggleSwitch("PLT_COURSE_SYNC", devices.PILOT_CPT_INTERFACE, 3004, 563, PLT_HEAD_COURSE, "Pilot Course Push to Sync")

-- Copilot Remote Heading and Course Selector
local CPLT_HEAD_COURSE = "CPLT Remote Heading and Course Selector"
C_130J:defineRotaryWithRange("CPLT_HEADING_ADJUST", devices.COPILOT_CPT_INTERFACE, 3001, 492, { -1, 1 }, CPLT_HEAD_COURSE, "Copilot Heading Adjust")
C_130J:defineToggleSwitch("CPLT_HEADING_SYNC", devices.COPILOT_CPT_INTERFACE, 3003, 564, CPLT_HEAD_COURSE, "Copilot Heading Push to Sync")
C_130J:defineRotaryWithRange("CPLT_COURSE_ADJUST", devices.COPILOT_CPT_INTERFACE, 3002, 493, { -1, 1 }, CPLT_HEAD_COURSE, "Copilot Course Adjust")
C_130J:defineToggleSwitch("CPLT_COURSE_SYNC", devices.COPILOT_CPT_INTERFACE, 3004, 565, CPLT_HEAD_COURSE, "Copilot Course Push to Sync")

-- Throttle Quadrant
local THROTTLE_QUADRANT = "Throttle Quadrant"
C_130J:definePushButton("CC_LSGI_ENGINE_1_SWITCH", devices.MECH_INTERFACE, 3004, 46, THROTTLE_QUADRANT, "Engine 1 LSGI Select Switch")
C_130J:definePushButton("CC_LSGI_ENGINE_2_SWITCH", devices.MECH_INTERFACE, 3005, 47, THROTTLE_QUADRANT, "Engine 2 LSGI Select Switch")
C_130J:definePushButton("CC_LSGI_ENGINE_3_SWITCH", devices.MECH_INTERFACE, 3006, 48, THROTTLE_QUADRANT, "Engine 3 LSGI Select Switch")
C_130J:definePushButton("CC_LSGI_ENGINE_4_SWITCH", devices.MECH_INTERFACE, 3007, 49, THROTTLE_QUADRANT, "Engine 4 LSGI Select Switch")
C_130J:definePushButton("CC_L_ATHROTTLE_DISC", devices.AP_INTERFACE, 3035, 19, THROTTLE_QUADRANT, "Left Autothrottle Disconnect Button")
C_130J:definePushButton("CC_R_ATHROTTLE_DISC", devices.AP_INTERFACE, 3036, 20, THROTTLE_QUADRANT, "Right Autothrottle Disconnect Button")
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_1_LED", 4091, THROTTLE_QUADRANT, "Engine 1 LSGI Switch Low Led", { color = "Green" })
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_2_LED", 4092, THROTTLE_QUADRANT, "Engine 2 LSGI Switch Low Led", { color = "Green" })
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_3_LED", 4093, THROTTLE_QUADRANT, "Engine 3 LSGI Switch Low Led", { color = "Green" })
C_130J:defineIndicatorLight("CC_LSGI_ENGINE_4_LED", 4094, THROTTLE_QUADRANT, "Engine 4 LSGI Switch Low Led", { color = "Green" })

-- Cursor Control Panel
local CURSOR_CONTROL_PANEL = "Cursor Control Panel"
C_130J:defineMultipositionSwitch("CCP_CURSOR_PRIORITY", devices.MECH_INTERFACE, 3003, 65, 3, 0.5, CURSOR_CONTROL_PANEL, "Cursor Priority Switch", { positions = { "P", "3RD", "CP" } })
C_130J:definePushButton("CCP_CURSOR_RESET", devices.MECH_INTERFACE, 3010, 68, CURSOR_CONTROL_PANEL, "Cursor Reset Switch")
C_130J:definePushButton("CCP_HUD_CURSOR", devices.MECH_INTERFACE, 3014, 69, CURSOR_CONTROL_PANEL, "HUD Cursor Off/On Switch")
C_130J:defineRockerSwitch("CCP_DISPLAY_RANGE", devices.MECH_INTERFACE, 3015, 3015, 3015, 3015, 66, CURSOR_CONTROL_PANEL, "Display Range Increase/Decrease", { positions = { "DECR", "OFF", "INCR" } })
C_130J:defineRockerSwitch("CCP_DISPLAY_ZOOM", devices.MECH_INTERFACE, 3016, 3016, 3016, 3016, 67, CURSOR_CONTROL_PANEL, "Display Zoom Increase/Decrease", { positions = { "DECR", "OFF", "INCR" } })
C_130J:defineTumb("CCP_CURSOR_SELECT", devices.MECH_INTERFACE, 3030, 72, 1 / 6, { -1 / 6, 5 / 6 }, nil, false, CURSOR_CONTROL_PANEL, "Cursor Display Select Switch", { positions = { "1", "2", "3", "4", "OFF", "", "" } }) -- actually blank
C_130J:defineRockerSwitch("CCP_CURSOR_TILT", devices.MECH_INTERFACE, 3096, 3096, 3096, 3096, 483, CURSOR_CONTROL_PANEL, "Cursor - Tilt")

-- Wing Flaps Control Quadrant
local FLAPS_CONTROL = "Wing Flaps Control Quadrant"
C_130J:definePotentiometer("CC_FLAP_LEVER", devices.MECH_INTERFACE, 3002, 16, { 0, 1 }, FLAPS_CONTROL, "Flap Control Lever")

-- Augmented Intercommunications System Monitor Panel
local AUG_ICS_MONITOR = "AUG Intercommunications System Monitor Panel"
C_130J:definePotentiometer("AUG_ICS_VOR1_VOLUME", devices.VOLUME_MANAGER, 3098, 249, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonVOR 1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_VOR1_BUTTON", devices.VOLUME_MANAGER, 3108, 248, AUG_ICS_MONITOR, "Aug MonVOR 1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_VOR2_VOLUME", devices.VOLUME_MANAGER, 3099, 259, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonVOR 2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_VOR2_BUTTON", devices.VOLUME_MANAGER, 3109, 258, AUG_ICS_MONITOR, "Aug MonVOR 2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_TACAN1_VOLUME", devices.VOLUME_MANAGER, 3100, 251, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonTACAN 1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_TACAN1_BUTTON", devices.VOLUME_MANAGER, 3110, 250, AUG_ICS_MONITOR, "Aug MonTACAN 1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_TACAN2_VOLUME", devices.VOLUME_MANAGER, 3101, 261, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonTACAN 2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_TACAN2_BUTTON", devices.VOLUME_MANAGER, 3111, 260, AUG_ICS_MONITOR, "Aug MonTACAN 2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_ADF1_VOLUME", devices.VOLUME_MANAGER, 3102, 253, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonADF 1 Volume")
C_130J:defineToggleSwitch("AUG_ICS_ADF1_BUTTON", devices.VOLUME_MANAGER, 3112, 252, AUG_ICS_MONITOR, "Aug MonADF 1 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_ADF2_VOLUME", devices.VOLUME_MANAGER, 3103, 263, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonADF 2 Volume")
C_130J:defineToggleSwitch("AUG_ICS_ADF2_BUTTON", devices.VOLUME_MANAGER, 3113, 262, AUG_ICS_MONITOR, "Aug MonADF 2 Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_SAR_VOLUME", devices.VOLUME_MANAGER, 3104, 255, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonSAR Volume")
C_130J:defineToggleSwitch("AUG_ICS_SAR_BUTTON", devices.VOLUME_MANAGER, 3114, 254, AUG_ICS_MONITOR, "Aug MonSAR Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_SPARE_VOLUME", devices.VOLUME_MANAGER, 3105, 265, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonSpare Knob")
C_130J:defineToggleSwitch("AUG_ICS_SPARE_BUTTON", devices.VOLUME_MANAGER, 3115, 264, AUG_ICS_MONITOR, "Aug MonSpare Button")
C_130J:definePotentiometer("AUG_ICS_BCN_VOLUME", devices.VOLUME_MANAGER, 3106, 257, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonBCN Volume")
C_130J:defineToggleSwitch("AUG_ICS_BCN_BUTTON", devices.VOLUME_MANAGER, 3116, 256, AUG_ICS_MONITOR, "Aug MonBCN Pull to Monitor")
C_130J:definePotentiometer("AUG_ICS_RWR_VOLUME", devices.VOLUME_MANAGER, 3107, 267, { 0, 1 }, AUG_ICS_MONITOR, "Aug MonRWR Knob")
C_130J:defineToggleSwitch("AUG_ICS_RWR_BUTTON", devices.VOLUME_MANAGER, 3117, 266, AUG_ICS_MONITOR, "Aug MonRWR Button")

-- Trim Panel
local TRIM_PANEL = "Trim Panel"
C_130J:defineC130Springloaded_3PosTumb("TRIM_ELEV_TAB_PWR", devices.MECH_INTERFACE, 3038, 1334, TRIM_PANEL, "Elevator Trim Tab Power Switch", { positions = { "EMER", "OFF", "NORM" } })
C_130J:defineRockerSwitch("TRIM_RUDDER_SWITCH", devices.MECH_INTERFACE, 3036, 3036, 3036, 3036, 75, TRIM_PANEL, "Rudder Trim Switch", { positions = { "NOSE LEFT", "OFF", "NOSE RIGHT" } })
C_130J:defineRockerSwitch("TRIM_NOSE_UP_DOWN", devices.MECH_INTERFACE, 3089, 3089, 3088, 3088, 1364, TRIM_PANEL, "Elevator Trim Nose Up/Down", { positions = { "NOSE DOWN", "OFF", "NOSE UP" } })
C_130J:defineRockerSwitch("TRIM_WING_RIGHT_LEFT", devices.MECH_INTERFACE, 3091, 3091, 3090, 3090, 1365, TRIM_PANEL, "Aileron Trim Right/Left Wing Down", { positions = { "L WG LWR", "OFF", "R WG LWR" } })

-- Defensive Systems Panel
local DEFENSIVE_SYSTEMS = "Defensive Systems Panel"
C_130J:defineToggleSwitch("DSP_DEFENSIVE_MASTER_SWITCH", devices.CMS_MGR, 3001, 61, DEFENSIVE_SYSTEMS, "Defensive Systems Master Switch", { positions = { "STBY", "OPR" } })
C_130J:defineToggleSwitch("DSP_CMS_JETTISON_GUARD", devices.CMS_MGR, 3006, 59, DEFENSIVE_SYSTEMS, "CMS Jettison Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("DSP_CMS_JETTISON_SWITCH", devices.CMS_MGR, 3005, 60, DEFENSIVE_SYSTEMS, "CMS Jettison Switch")
C_130J:defineMultipositionSwitch("DSP_CMDS_MODE", devices.CMS_MGR, 3003, 74, 5, 0.25, DEFENSIVE_SYSTEMS, "CMDS Mode Selector", { positions = { "STBY", "MAN", "SEMI", "AUTO", "BYP" } })
C_130J:defineMultipositionSwitch("DSP_MAN_PRGMS_SWITCH", devices.CMS_MGR, 3008, 64, 3, 0.5, DEFENSIVE_SYSTEMS, "MAN PRGMS Switch", { positions = { "6", "5", "1-4" } })
C_130J:defineToggleSwitch("DSP_ECM_MASTER", devices.CMS_MGR, 3007, 62, DEFENSIVE_SYSTEMS, "ECM Master Switch", { positions = { "STBY", "OPR" } })
C_130J:defineToggleSwitch("DSP_IRCM_MASTER", devices.CMS_MGR, 3004, 63, DEFENSIVE_SYSTEMS, "IRCM Master Switch", { positions = { "STBY", "OPR" } })
C_130J:definePushButton("DSP_RWR_SRCH", devices.CMS_MGR, 3009, 54, DEFENSIVE_SYSTEMS, "RWR SRCH Switch")
C_130J:definePushButton("DSP_RWR_MODE", devices.CMS_MGR, 3010, 55, DEFENSIVE_SYSTEMS, "RWR MODE Switch")
C_130J:definePushButton("DSP_RWR_HANDOFF", devices.CMS_MGR, 3011, 56, DEFENSIVE_SYSTEMS, "RWR HANDOFF Switch")
C_130J:definePushButton("DSP_RWR_ALT", devices.CMS_MGR, 3012, 57, DEFENSIVE_SYSTEMS, "RWR ALT Switch")
C_130J:definePushButton("DSP_RWR_TGT_SEP", devices.CMS_MGR, 3013, 58, DEFENSIVE_SYSTEMS, "RWR TGT SEP Switch")
C_130J:defineIndicatorLight("DSP_RWR_SRCH_LED", 4097, DEFENSIVE_SYSTEMS, "RWR SRCH Switch Light", { color = "Green" })
C_130J:defineIndicatorLight("DSP_RWR_MODE_LED", 4098, DEFENSIVE_SYSTEMS, "RWR MODE Switch Light", { color = "Green" })
C_130J:defineIndicatorLight("DSP_RWR_HANDOFF_LED", 4099, DEFENSIVE_SYSTEMS, "RWR HANDOFF Switch Light", { color = "Green" })
C_130J:defineIndicatorLight("DSP_RWR_ALT_LED", 4100, DEFENSIVE_SYSTEMS, "RWR ALT Switch Light", { color = "Green" })
C_130J:defineIndicatorLight("DSP_RWR_TGT_SEP_LED", 4101, DEFENSIVE_SYSTEMS, "RWR TGT SEP Switch Light", { color = "Green" })

-- Aerial Delivery Panel
local AERIAL_DELIVERY = "Aerial Delivery Panel"
C_130J:defineC130Springloaded_3PosTumb("ADP_RAMP_DOOR", devices.MECH_INTERFACE, 3031, 479, AERIAL_DELIVERY, "Ramp/Door Control Switch", { positions = { "CLOSE", "OFF", "OPEN" } })
C_130J:defineIndicatorLight("ADP_RAMP_DOOR_LED", 4075, AERIAL_DELIVERY, "Ramp/Door Control Switch Light", { color = "Green" })
C_130J:definePushButton("ADP_AIRDROP_CAUTION", devices.MECH_INTERFACE, 3026, 397, AERIAL_DELIVERY, "Airdrop Caution Control Button")
C_130J:defineIndicatorLight("ADP_AIRDROP_CAUTION_LED", 4095, AERIAL_DELIVERY, "Airdrop Caution Light", { color = "Yellow" })
C_130J:definePushButton("ADP_AIRDROP_JUMP", devices.MECH_INTERFACE, 3027, 326, AERIAL_DELIVERY, "Airdrop Jump Control Button")
C_130J:defineIndicatorLight("ADP_AIRDROP_JUMP_LED", 4096, AERIAL_DELIVERY, "Airdrop Jump Light", { color = "Green" })
C_130J:defineToggleSwitch("ADP_RELEASE_CHUTE_COVER", devices.MECH_INTERFACE, 3028, 76, AERIAL_DELIVERY, "Chute Release Button Cover", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("ADP_RELEASE_CHUTE_BUTTON", devices.MECH_INTERFACE, 3029, 77, AERIAL_DELIVERY, "Chute Release Button")
C_130J:defineToggleSwitch("ADP_AIR_DEFLECTOR", devices.MECH_INTERFACE, 3024, 478, AERIAL_DELIVERY, "Air Deflector Control Switch", { positions = { "CLOSE", "OPEN" } })
C_130J:defineMultipositionSwitch("ADP_COMP_DROP", devices.MECH_INTERFACE, 3025, 474, 3, 0.5, AERIAL_DELIVERY, "Computer Drop Switch", { positions = { "MAN", "AD-MAN/TJ-AUTO", "AUTO" } })
C_130J:defineToggleSwitch("ADP_BAY_ALARM_GUARD", devices.MECH_INTERFACE, 3022, 78, AERIAL_DELIVERY, "Cargo Bay Alarm Switch Guard", { positions = CommonPositions.COVER })
C_130J:defineToggleSwitch("ADP_BAY_ALARM_SWITCH", devices.MECH_INTERFACE, 3023, 79, AERIAL_DELIVERY, "Cargo Bay Alarm Switch")

-- Automatic Flight Control System Panel
local AFCS_PANEL = "Automatic Flight Control System Panel"
C_130J:definePotentiometer("AFCS_TURN_KNOB", devices.AP_INTERFACE, 3016, 70, { -1, 1 }, AFCS_PANEL, "AFCS Turn Control Knob / Center Detent")
C_130J:defineRotary("AFCS_PITCH_WHEEL", devices.AP_INTERFACE, 3015, 71, AFCS_PANEL, "AFCS Pitch Control Wheel")
C_130J:defineToggleSwitch("AFCS_PLT_ENGAGE_SWITCH", devices.AP_INTERFACE, 3011, 52, AFCS_PANEL, "Pilot AFCS Engage Switch")
C_130J:defineToggleSwitch("AFCS_CPLT_ENGAGE_SWITCH", devices.AP_INTERFACE, 3012, 53, AFCS_PANEL, "Copilot AFCS Engage Switch")
C_130J:definePushButton("AFCS_PITCH_AXIS_SWITCH", devices.AP_INTERFACE, 3013, 51, AFCS_PANEL, "AFCS Pitch Axis Deselect Switch")
C_130J:definePushButton("AFCS_LATERAL_AXIS_SWITCH", devices.AP_INTERFACE, 3014, 73, AFCS_PANEL, "AFCS Lateral Axis Deselect Switch")
C_130J:defineIndicatorLight("AFCS_PITCH_AXIS_SWITCH_LED", 4089, AFCS_PANEL, "AFCS Pitch Axis Deselect Light", { color = "Green" })
C_130J:defineIndicatorLight("AFCS_LATERAL_AXIS_SWITCH_LED", 4090, AFCS_PANEL, "AFCS Lateral Axis Deselect Light", { color = "Green" })

-- ARC-210

-- Center Console END

-- Nosewheel Steering

-- Pilot Yoke

-- Copilot Yoke

-- Flight Station Forward END

-- Loadmaster Station

-- TODO: panel, circuit breakers, crew door handle

-- Loadmaster Station End

-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

-- Seat Position

return C_130J
