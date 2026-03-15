module("MiG-29A", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlAttributeDocumentation = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlAttributeDocumentation")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

--- @class MiG_29A: Module
local MiG_29A = Module:new("MiG-29 Fulcrum", 0x3c00, { "MiG-29 Fulcrum" })

-- Special Args:
-- 1: Unit system (1 = metric, 0 = imperial)
-- 2: Joystick visibility (Hidden >= 0.9 )
-- 1040: Body visibility (Hidden >= 0.99 )

local devices = {
	FM_PROXY = 1,
	SNSR_SYS_INTERFACE = 2,
	ELEC_INTERFACE = 3,
	CONTROL_INTERFACE = 4,
	FUEL_INTERFACE = 5,
	POWER_PLANT_INTERFACE = 6,
	OXYGEN_INTERFACE = 7,
	HEARING_SENS = 8,
	AIR_INTERFACE = 9,
	HYDRO_INTERFACE = 10,
	AFCS_INTERFACE = 11,
	EXTLIGHTS_SYSTEM = 12,
	INTLIGHTS_SYSTEM = 13,
	EKRAN = 14,
	INPUT_PANEL = 15,
	CLOCK = 16,
	BAROMETRIC_ALTIMETER = 17,
	VVI_TURN_SLIP = 18,
	IAS = 19,
	TAS = 20,
	AOA_G_METER = 21,
	HSI = 22,
	ADI = 23,
	COMBINED_PRESSURE = 24,
	BRAKE_PRESSURE = 25,
	FUEL_INDICATOR = 26,
	RPM_INDICATOR = 27,
	EXHAUST_GAS_LEFT = 28,
	EXHAUST_GAS_RIGHT = 29,
	RAMP_POS_INDICATOR = 30,
	VOLTMETER = 31,
	STANDBY_COMPASS = 32,
	RADALT = 33,
	INS = 34,
	HOTAS = 35,
	CPT_MECH = 36,
	HEAD_WRAPPER = 37,
	MUX = 38,
	NAV = 39,
	CP = 40,
	WP = 41,
	DP = 42,
	HMS = 43,
	QOLS = 44,
	RADAR = 45,
	WEAPONS = 46,
	L006LM = 47,
	HMD = 48,
	HUD = 49,
	HDD = 50,
	VHF_UHF_R862 = 51,
	VHF_R855UM = 52,
	MRP = 53,
	ARK = 54,
	RSBN = 55,
	VIWAS = 56,
	INTERCOM = 57,
	MACROS = 58,
	KNEEBOARD = 59,
	CREW_ANIMATION = 60,
	VISOR = 61,
	TRANSPONDER = 62,
	INTERROGATOR = 63,
	SO69 = 64,
}

--- Defines a 0-max_value output from a 0-1 input
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param max_value integer the maximum value of the output
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes BaseControlAttributes? additional control attributes
function MiG_29A:defineIntegerFromArg(identifier, arg_number, max_value, category, description, attributes)
	self:defineIntegerFromGetter(identifier, function(dev0)
		return Module.round(dev0:get_argument_value(arg_number) * max_value)
	end, max_value, category, description, attributes)
end

--- Defines multiposition with a manual range
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param count integer the number of discrete steps the control has
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function MiG_29A:defineMultipositionManualRange(identifier, device_id, command, arg_number, count, limits, category, description, attributes)
	self:defineTumb(identifier, device_id, command, arg_number, 1 / (count - 1), limits, nil, false, category, description, attributes)
end

--- Adds an n-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param positions integer the number of switch positions
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function MiG_29A:defineMultipositionSwitch0To1(identifier, device_id, command, arg_number, positions, category, description, attributes)
	self:defineMultipositionSwitch(identifier, device_id, command, arg_number, positions, 1 / (positions - 1), category, description, attributes)
end

--- Adds a 3-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function MiG_29A:define3PosTumb0To1(identifier, device_id, command, arg_number, category, description, attributes)
	self:defineMultipositionSwitch0To1(identifier, device_id, command, arg_number, 3, category, description, attributes)
end

local function cabinTempSwitchIntValue(arg_value)
	if arg_value < 0.075 then
		return 0
	elseif arg_value < 0.30 then
		return 1
	elseif arg_value < 0.60 then
		return 2
	else
		return 3
	end
end

--- Adds a custom switch for the cabine temperature switch
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function MiG_29A:defineCabinTempSwitch(identifier, device_id, arg_number, category, description, attributes)
	local alloc = self:allocateInt(3)
	self:addExportHook(function(dev0)
		local val = cabinTempSwitchIntValue(dev0:get_argument_value(arg_number))
		alloc:setValue(val)
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		SetStateInput:new(3, "set the switch position"),
		FixedStepInput:new("switch to previous or next state"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = Middle, 1 = UP , 2 = LEFT, 3 = RIGHT"),
	}, nil, ControlAttributeDocumentation.from_switch_attributes(attributes))
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		local currentState = cabinTempSwitchIntValue(GetDevice(0):get_argument_value(arg_number))
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

		if new_state == 0 then -- OFF
			dev:performClickableAction(3001, 0)
		elseif new_state == 1 then -- AUTO
			dev:performClickableAction(3002, 0.15)
		elseif new_state == 2 then -- HOT
			dev:performClickableAction(3003, 0.45)
		elseif new_state == 3 then -- COLD
			dev:performClickableAction(3004, 0.75)
		end
	end)
end

local function gunTriggerIntValue(arg_value)
	if arg_value < 0.30 then
		return 0
	elseif arg_value < 0.675 then
		return 1
	else
		return 2
	end
end

--- Adds a custom switch for the gun trigger
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function MiG_29A:defineGunTrigger(identifier, device_id, arg_number, category, description, attributes)
	local alloc = self:allocateInt(2)
	self:addExportHook(function(dev0)
		local val = gunTriggerIntValue(dev0:get_argument_value(arg_number))
		alloc:setValue(val)
	end)

	local control = Control:new(category, ControlType.toggle_switch, identifier, description, {
		SetStateInput:new(2, "set the trigger position"),
		FixedStepInput:new("switch to previous or next state"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "trigger position -- 0 = released, 1 = first detent , 2 = second detent"),
	}, nil, ControlAttributeDocumentation.from_switch_attributes(attributes))
	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)

		if dev == nil then
			return
		end

		local currentState = gunTriggerIntValue(GetDevice(0):get_argument_value(arg_number))
		local new_state

		if toState == "INC" then
			if currentState >= 2 then
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

		if new_state == 0 then -- RELEASED
			dev:performClickableAction(3001, 0)
			dev:performClickableAction(3002, 0)
		elseif new_state == 1 then -- FIRST DETENT
			dev:performClickableAction(3001, 0)
			-- 0.6 is the arg value when the first detent is pressed
			dev:performClickableAction(3002, 0.6)
		elseif new_state == 2 then -- SECOND DETENT
			dev:performClickableAction(3001, 0)
			dev:performClickableAction(3001, 1)
		end
	end)
end

--- Adds an input-only control which performs a specific LoSetCommand with no arguments
--- @param identifier string the unique identifier for the control
--- @param iCommand ICommand the dcs icommand to move the switch up or down
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes SwitchAttributes? additional control attributes
function MiG_29A:defineBrakeLever(identifier, iCommand, arg_number, category, description, attributes)
	local max_value = 65535
	local limits = { -1, 1 }

	local intervalLength = limits[2] - limits[1]
	self:addInputProcessor(identifier, function(value)
		local newValue = 0
		if value:match("-[0-9]+") then
			newValue = Module.cap(newValue + tonumber(value), 0, max_value)
		elseif value:match("[0-9]+") then
			newValue = Module.cap(tonumber(value) or 0, 0, max_value)
		end

		LoSetCommand(iCommand, -(newValue / max_value * intervalLength + limits[1]))
	end)

	local value = self:allocateInt(max_value, identifier)

	self:addExportHook(function(dev0)
		value:setValue((dev0:get_argument_value(arg_number) / 0.5) * max_value)
	end)

	local control = Control:new(category, ControlType.limited_dial, identifier, description, {
		SetStateInput:new(max_value, "set the position of the dial"),
	}, {
		IntegerOutput:new(value, Suffix.none, "position of the potentiometer"),
	}, nil, ControlAttributeDocumentation.from_switch_attributes(attributes))
	self:addControl(control)

	return control
end

-- Unit system set by the user settings, true if "metric", false if "imperial"
local unit_metric = nil

MiG_29A:addExportHook(function(dev0)
	if unit_metric == nil then
		unit_metric = dev0:get_argument_value(1) < 0.01
	end
end)

--- Defines a single gauge from a metric arg and it's limits and an imperial arg and it's limits based on user selected unit system
--- @param identifier string the unique identifier for the control
--- @param arg_number_metric integer the dcs argument number for the metric gauge
--- @param arg_number_imperial integer the dcs argument number for the imperial gauge
--- @param metric_limits number[] a length-2 array with the lower and upper bounds of the data for the metric control as used in dcs
--- @param imperial_limits number[] a length-2 array with the lower and upper bounds of the data for the imperial control as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes BaseControlAttributes? additional control attributes
function MiG_29A:defineMultiUnitFloatManualRange(identifier, arg_number_metric, arg_number_imperial, metric_limits, imperial_limits, category, description, attributes)
	assert(#metric_limits == 2, string.format("%s may only contain a min and max value", identifier))
	assert(#imperial_limits == 2, string.format("%s may only contain a min and max value", identifier))
	local max_value = 65535
	local alloc = self:allocateInt(max_value, identifier)

	local function getArgFromUnit(dev0)
		local arg = unit_metric and arg_number_metric or arg_number_imperial
		return dev0:get_argument_value(arg)
	end

	self:addExportHook(function(dev0)
		local limits = unit_metric and imperial_limits or metric_limits

		alloc:setValue(Module.valueConvert(getArgFromUnit(dev0), limits, { 0, max_value }))
	end)

	local control = Control:new(category, ControlType.metadata, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, description),
	}, nil, ControlAttributeDocumentation.from_base_attributes(attributes))
	self:addControl(control)

	return control
end

--- Defines a single gauge from a metric arg and an imperial arg based on user selected unit system
--- @param identifier string the unique identifier for the control
--- @param arg_number_metric integer the dcs argument number for the metric gauge
--- @param arg_number_imperial integer the dcs argument number for the imperial gauge
--- @param limits number[] a length-2 array with the lower and upper bounds of the data for the control as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes BaseControlAttributes? additional control attributes
function MiG_29A:defineMultiUnitFloat(identifier, arg_number_metric, arg_number_imperial, limits, category, description, attributes)
	self:defineMultiUnitFloatManualRange(identifier, arg_number_metric, arg_number_imperial, limits, limits, category, description, attributes)
end

local function flagIntValue(arg_value)
	if arg_value < 0.002 then
		return 0
	elseif arg_value < 0.006 then
		return 1
	elseif arg_value < 0.010 then
		return 2
	else
		return 3
	end
end

--- Defines an integer output from a float for a flag indicator
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @param attributes BaseControlAttributes? additional control attributes
function MiG_29A:defineFlag(identifier, arg_number, category, description, attributes)
	local alloc = self:allocateInt(3, identifier)
	self:addExportHook(function(dev0)
		local val = flagIntValue(dev0:get_argument_value(arg_number))
		alloc:setValue(val)
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, "flag position"),
	}, nil, ControlAttributeDocumentation.from_base_attributes(attributes))
	self:addControl(control)

	return control
end

local function indicator_argument_display(dev0, arg_number, max_value)
	local val = Module.round(dev0:get_argument_value(arg_number) * max_value)
	return val >= 10 and 0 or val
end

local function hsi_course_string(dev0, arg_tens, arg_ones)
	local tens = Module.round(((dev0:get_argument_value(arg_tens) + 1) / 2) * 36)
	return string.format("%d%d", tens, indicator_argument_display(dev0, arg_ones, 10))
end

local function hsi_range_string(dev0, arg_hundreds_metric, arg_tens_metric, arg_ones_metric, arg_hundreds_imperial, arg_tens_imperial, arg_ones_imperial)
	if unit_metric then
		return string.format("%d%d%d", indicator_argument_display(dev0, arg_hundreds_metric, 10), indicator_argument_display(dev0, arg_tens_metric, 10), indicator_argument_display(dev0, arg_ones_metric, 10))
	else
		return string.format("%d%d%d", indicator_argument_display(dev0, arg_hundreds_imperial, 10), indicator_argument_display(dev0, arg_tens_imperial, 10), indicator_argument_display(dev0, arg_ones_imperial, 10))
	end
end

local function getCountermeasuresCounterString(arg_value)
	if arg_value < 0.2 then
		return "60"
	elseif arg_value < 0.45 then
		return "40"
	elseif arg_value < 0.75 then
		return "20"
	else
		return "00"
	end
end

--- Splits a string into an array by newlines
--- @param inputstr string?
--- @return string[]
local function line_split(inputstr)
	local t = {}
	if inputstr then
		for str in string.gmatch(inputstr, "([^\n]+)") do
			table.insert(t, str)
		end
	end
	return t
end

-- Stick
local STICK = "Stick Controls"

MiG_29A:defineRockerSwitch("STICK_TRIM_HORIZ", devices.HOTAS, 3007, 3006, 3006, 3007, 52, STICK, "Trim Hat Switch Horizontal", { positions = { "LEFT", "MIDDLE", "RIGHT" } })
MiG_29A:defineRockerSwitch("STICK_TRIM_VERT", devices.HOTAS, 3004, 3005, 3005, 3004, 51, STICK, "Trim Hat Switch Vertical", { positions = { "DOWN", "MIDDLE", "UP" } })
MiG_29A:definePushButton("STICK_LEVELING_BUTTON", devices.HOTAS, 3008, 55, STICK, "Leveling Button")
MiG_29A:defineGatedIndicatorLight("STICK_LEVELING_LIGHT", 49, 0.5, nil, STICK, "Leveling Light")
MiG_29A:definePushButton("STICK_ACFS_OFF_BUTTON", devices.HOTAS, 3009, 48, STICK, "ACFS Modes Off Button")
MiG_29A:definePushButton("STICK_TARGET_ACQUISITION_DEPRESS_BUTTON", devices.HOTAS, 3016, 472, STICK, "Target Acquisition Depress Button")
MiG_29A:definePotentiometer("STICK_TARGET_ACQUISITION_HORIZ", devices.HOTAS, 3010, 471, { -1, 1 }, STICK, "Target Acquisition Horizontal Axis")
MiG_29A:definePotentiometer("STICK_TARGET_ACQUISITION_VERT", devices.HOTAS, 3011, 470, { -1, 1 }, STICK, "Target Acquisition Vertical Axis")
MiG_29A:definePushButton("STICK_BREAK_LOCK_BUTTON", devices.HOTAS, 3017, 54, STICK, "Break-lock Button")
MiG_29A:definePushButton("STICK_AP_CUTOFF_BUTTON", devices.HOTAS, 3018, 70, STICK, "Autopilot Cut-Off Button")
MiG_29A:defineGunTrigger("STICK_GUN_TRIGGER", devices.HOTAS, 442, STICK, "Gun Trigger", { positions = { "RELEASED", "FIRST DETENT", "SECOND DETENT" } })
MiG_29A:defineToggleSwitch("STICK_WEAPON_TRIGGER", devices.HOTAS, 3003, 441, STICK, "Weapon Trigger")
MiG_29A:defineToggleSwitch("STICK_EMERGENCY_JETTISON_COVER", devices.HOTAS, 3022, 100, STICK, "Emergency Jettison Button Cover")
MiG_29A:definePushButton("STICK_EMERGENCY_JETTISON_BUTTON", devices.HOTAS, 3021, 101, STICK, "Emergency Jettison Button")
MiG_29A:defineBrakeLever("STICK_BRAKE_LEVER", ICommand.wheel_brake, 47, STICK, "Wheel Brake")
MiG_29A:defineToggleSwitch("STICK_RUN_UP_BRAKE_LEVER", devices.HOTAS, 3020, 47, STICK, "Run-up Brake Lever")

-- Throttle
local THROTTLE = "Throttle Controls"

MiG_29A:definePushButton("THROTTLE_RADIO_BUTTON", devices.HOTAS, 3024, 840, THROTTLE, "Radio Button")
MiG_29A:definePushButton("THROTTLE_SPEED_BRAKE_BUTTON", devices.HOTAS, 3026, 841, THROTTLE, "Speed Brake Button")
MiG_29A:definePushButton("THROTTLE_LOCK_BUTTON", devices.HOTAS, 3025, 842, THROTTLE, "Lock On / NWS Button")
MiG_29A:definePushButton("THROTTLE_COUNTERMEASURES_BUTTON", devices.HOTAS, 3027, 61, THROTTLE, "Countermeasures Dispense Button")
MiG_29A:definePushButton("THROTTLE_AFTERBURNER_LOCK_LEFT", devices.HOTAS, 3028, 846, THROTTLE, "Afterburner Lock Latch (Left)")
MiG_29A:definePushButton("THROTTLE_AFTERBURNER_LOCK_RIGHT", devices.HOTAS, 3029, 845, THROTTLE, "Afterburner Lock Latch (Right)")
MiG_29A:definePushButton("THROTTLE_IDLE_LOCK_LEFT", devices.HOTAS, 3031, 847, THROTTLE, "Idle Lock Latch (Left)")
MiG_29A:definePushButton("THROTTLE_IDLE_LOCK_RIGHT", devices.HOTAS, 3032, 844, THROTTLE, "Idle Lock Latch (Right)")
MiG_29A:reserveIntValue(65535) -- Manual Ranging Control Potentiometer

-- Pedals

-- Control & Test panel

-- Electrical power panel

-- System power panel

-- Engine & APU start panel

-- AFT lightning control panel

-- FWD lightning control pane

-- Lights controls (external)

-- Combined AOA / G meter indicator
local AOA_G_METER = "Combined AOA / G meter indicator"

MiG_29A:definePushButton("AOA_G_METER_RESET_BUTTON", devices.AOA_G_METER, 3001, 528, AOA_G_METER, "G-Index Reset Button")
MiG_29A:defineFloat("AOA_G_METER_MAX_G_POINTER", 3, { 0, 1 }, AOA_G_METER, "Max G-Index Pointer")
MiG_29A:defineFloat("AOA_G_METER_G_POINTER", 6, { 0, 1 }, AOA_G_METER, "Current G-Index Pointer")
MiG_29A:defineFloat("AOA_G_METER_AOA_POINTER", 7, { 0, 1 }, AOA_G_METER, "Current AOA Pointer")

-- Master caution
local MASTER_CAUTION = "Master Caution"

MiG_29A:defineFloat("MASTER_CAUTION_LIGHT", 445, { 0, 1 }, MASTER_CAUTION, "Master Caution Light")
MiG_29A:definePushButton("MASTER_CAUTION_EXTINGUISH_BUTTON", devices.INTLIGHTS_SYSTEM, 3002, 97, MASTER_CAUTION, "Master Caution Extinguish Button")
MiG_29A:definePotentiometer("MASTER_CAUTION_BRIGHTNESS_KNOB", devices.INTLIGHTS_SYSTEM, 3003, 453, { 0, 1 }, MASTER_CAUTION, "Master Caution Brightness Knob")

-- IAS indicator
local IAS = "IAS indicator"

MiG_29A:defineMultiUnitFloat("IAS_INDICATOR_POINTER", 8, 821, { 0, 1 }, IAS, "IAS Pointer")
MiG_29A:defineMultiUnitFloatManualRange("IAS_INDICATOR_WINDOW", 5, 820, { 1, 0 }, { 0, 1 }, IAS, "IAS Mach Number")

-- Altimeter

-- IP-52-03 Flaps / Landing gear indicator
local IP_52_03 = "IP-52-03 Control Surfaces / Landing Gear Indicators"

MiG_29A:defineFloat("IP_52_03_UPPER_SPEEDBRAKE_INDICATOR", 44, { 0, 1 }, IP_52_03, "Upper Speedbrake Indicator")
MiG_29A:defineFloat("IP_52_03_LOWER_SPEEDBRAKE_INDICATOR", 45, { 0, 1 }, IP_52_03, "Lower Speedbrake Indicator")
MiG_29A:defineFloat("IP_52_03_LEFT_SLAT_INDICATOR", 320, { 0, 1 }, IP_52_03, "Left Slat Indicator")
MiG_29A:defineFloat("IP_52_03_RIGHT_SLAT_INDICATOR", 321, { 0, 1 }, IP_52_03, "Right Slat Indicator")
MiG_29A:defineFloat("IP_52_03_LEFT_FLAP_TAKEOFF_INDICATOR", 42, { 0, 1 }, IP_52_03, "Left Flap Take Off Indicator")
MiG_29A:defineFloat("IP_52_03_RIGHT_FLAP_TAKEOFF_INDICATOR", 43, { 0, 1 }, IP_52_03, "Right Flap Take Off Indicator")
MiG_29A:defineFloat("IP_52_03_LEFT_FLAP_LANDING_INDICATOR", 56, { 0, 1 }, IP_52_03, "Left Flap Landing Indicator")
MiG_29A:defineFloat("IP_52_03_RIGHT_FLAP_LANDING_INDICATOR", 57, { 0, 1 }, IP_52_03, "Right Flap Landing Indicator")
MiG_29A:defineFloat("IP_52_03_NOSE_GEAR_INDICATOR", 40, { 0, 1 }, IP_52_03, "Nose Gear Indicator")
MiG_29A:defineFloat("IP_52_03_LEFT_GEAR_INDICATOR", 39, { 0, 1 }, IP_52_03, "Left Gear Indicator")
MiG_29A:defineFloat("IP_52_03_RIGHT_GEAR_INDICATOR", 41, { 0, 1 }, IP_52_03, "Right Gear Indicator")
MiG_29A:defineFloat("IP_52_03_GEAR_WARNING_INDICATOR", 46, { 0, 1 }, IP_52_03, "Gear Release Warning Indicator")

-- PNP-72-12 HSI
local PNP_72_12 = "PNP-72-12 HSI"

MiG_29A:defineFloat("HSI_COMPASS_CARD", 32, { 0, 1 }, PNP_72_12, "Compass Card")
MiG_29A:defineFloat("HSI_BEARING_POINTER", 36, { 0, 1 }, PNP_72_12, "Bearing Pointer")
MiG_29A:defineFloat("HSI_COURSE_HEADING_POINTER", 35, { 0, 1 }, PNP_72_12, "Course Heading Pointer")
MiG_29A:defineFloat("HSI_GLIDE_SLOPE_INDICATOR", 33, { -1, 1 }, PNP_72_12, "Glide Slope Indicator")
MiG_29A:defineFloat("HSI_COURSE_DEVIATION_INDICATOR", 34, { -1, 1 }, PNP_72_12, "Course Deviation Indicator")
MiG_29A:defineFlag("HSI_AZIMUTH_SENSOR_FLAG", 121, PNP_72_12, "Azimuth Sensor Failure Flag")
MiG_29A:defineFlag("HSI_GLIDE_SENSOR_FLAG", 122, PNP_72_12, "Glide Slope Sensor Failure Flag")
MiG_29A:defineFlag("HSI_SENSORS_FLAG", 402, PNP_72_12, "Sensor Failure Flag")
MiG_29A:defineFlag("HSI_RANGE_COVER", 403, PNP_72_12, "Range Indicator Cover")
MiG_29A:defineFlag("HSI_COURSE_COVER", 404, PNP_72_12, "Course Indicator Cover")
MiG_29A:defineFloat("HSI_COURSE_HEADING_TENS", 400, { -1, 1 }, PNP_72_12, "Course Indicator (Tens)")
MiG_29A:defineFloat("HSI_COURSE_HEADING_ONES", 401, { 0, 1 }, PNP_72_12, "Course Indicator (Ones)")
MiG_29A:defineMultiUnitFloat("HSI_RANGE_HUNDREDS", 111, 826, { 0, 1 }, PNP_72_12, "Range Indicator (Hundreds)")
MiG_29A:defineMultiUnitFloat("HSI_RANGE_TENS", 112, 827, { 0, 1 }, PNP_72_12, "Range Indicator (Tens)")
MiG_29A:defineMultiUnitFloat("HSI_RANGE_ONES", 113, 828, { 0, 1 }, PNP_72_12, "Range Indicator (Ones)")
MiG_29A:definePushButton("HSI_TEST_BUTTON", devices.HSI, 3002, 269, PNP_72_12, "Test Button")
MiG_29A:definePotentiometer("HSI_COURSE_SELECTION_KNOB", devices.HSI, 3001, 270, { 0, 1 }, PNP_72_12, "Course Selection Knob")
MiG_29A:definePushButton("HSI_COURSE_MAG_BUTTON", devices.NAV, 3021, 274, PNP_72_12, "Magnetic Course Adjustment Button")
MiG_29A:defineToggleSwitch("HSI_COURSE_MODE_SWITCH", devices.NAV, 3022, 273, PNP_72_12, "Course Mode Switch", { positions = { "MANUAL", "AUTO" } })
MiG_29A:defineString("HSI_COURSE_HEADING_FULL", function(dev0)
	return hsi_course_string(dev0, 400, 401)
end, 3, PNP_72_12, "Course Indicator")
MiG_29A:defineString("HSI_RANGE_FULL", function(dev0)
	return hsi_range_string(dev0, 111, 112, 113, 826, 827, 828)
end, 3, PNP_72_12, "Range Indicator")

-- DA-200P Combined indicator (VVI/Turn/Slip indicator)
local DA_200P = "DA-200P Combined Indicator"

MiG_29A:defineMultiUnitFloat("DA200P_VARIOMETER_POINTER", 24, 838, { -1, 1 }, DA_200P, "Variometer Pointer")
MiG_29A:defineMultiUnitFloat("DA200P_DIRECTION_INDICATOR", 25, 839, { -1, 1 }, DA_200P, "Direction Indicator")
MiG_29A:defineFloat("DA200P_SLIP_INDICATOR", 26, { -1, 1 }, DA_200P, "Slip Indicator")
MiG_29A:definePotentiometer("DA200P_VVI_ADJUSTMENT_KNOB", devices.VVI_TURN_SLIP, 3001, 268, { 0, 1 }, DA_200P, "VVI Adjustment Knob")

-- ADI
local ADI = "ADI"

MiG_29A:defineFloat("ADI_PITCH_INDICATOR", 81, { -1, 1 }, ADI, "Pitch Indicator")
MiG_29A:defineFloat("ADI_ROLL_INDICATOR", 30, { -1, 1 }, ADI, "Roll Indicator")
MiG_29A:defineFloat("ADI_SLIP_INDICATOR", 31, { -1, 1 }, ADI, "Slip Indicator")
MiG_29A:defineFloat("ADI_HORIZ_FLIGHT_DIRECTOR", 27, { -1, 1 }, ADI, "Horizontal Flight Director")
MiG_29A:defineFloat("ADI_PITCH_OFF_INDICATOR", 94, { 0, 1 }, ADI, "Pitch Off Indicator")
MiG_29A:defineFloat("ADI_AZIMUTH_OFF_INDICATOR", 96, { 0, 1 }, ADI, "Azimuth Off Indicator")
MiG_29A:defineFloat("ADI_HORIZ_PLANE_INDICATOR", 393, { -1, 1 }, ADI, "Horizontal Plane Indicator")
MiG_29A:defineFloat("ADI_VERT_PLANE_INDICATOR", 392, { -1, 1 }, ADI, "Vertical Plane Indicator")
MiG_29A:definePotentiometer("ADI_POSITION_ADJUSTMENT_KNOB", devices.ADI, 3001, 264, { -1, 1 }, ADI, "Aircraft Symbol Adjustment Knob")
MiG_29A:definePushButton("ADI_GYRO_CAGE_BUTTON", devices.ADI, 3002, 265, ADI, "Gyro Cage Button")
MiG_29A:defineFloat("ADI_GYRO_CAGE_LIGHT", 262, { 0, 1 }, ADI, "Gyro Cage Light")

-- TAS
local TAS = "TAS Indicator"

MiG_29A:defineMultiUnitFloat("TAS_MACH_POINTER", 79, 825, { 0, 1 }, TAS, "Mach Pointer")
MiG_29A:defineMultiUnitFloat("TAS_SPEED_POINTER", 182, 823, { 0, 1 }, TAS, "True Air Speed Pointer")
MiG_29A:defineFloat("TAS_MACH_WINDOW", 824, { 0, 1 }, TAS, "Mach Window")

-- Clock
local ACHS_1M = "AChS-1M Clock"

MiG_29A:defineFloat("ACHS_1M_CURRENT_HOURS", 19, { 0, 1 }, ACHS_1M, "Current Hours")
MiG_29A:defineFloat("ACHS_1M_CURRENT_MINUTES", 18, { 0, 1 }, ACHS_1M, "Current Minutes")
MiG_29A:defineFloat("ACHS_1M_CURRENT_SECONDS", 37, { 0, 1 }, ACHS_1M, "Current Seconds")
MiG_29A:defineFloat("ACHS_1M_FLIGHT_HOURS", 395, { 0, 1 }, ACHS_1M, "Flight Hours")
MiG_29A:defineFloat("ACHS_1M_FLIGHT_MINUTES", 396, { 0, 1 }, ACHS_1M, "Flight Minutes")
MiG_29A:defineFloat("ACHS_1M_STOP_WATCH_MINUTES", 394, { 0, 1 }, ACHS_1M, "Stop Watch Minutes")
MiG_29A:defineFloat("ACHS_1M_STOP_WATCH_SECONDS", 406, { 0, 1 }, ACHS_1M, "Stop Watch Seconds")
MiG_29A:defineFloat("ACHS_1M_FLIGHT_STATUS_WINDOW", 58, { 0, 1 }, ACHS_1M, "Flight Time Status Window")
MiG_29A:defineSpringloaded_3PosTumb("ACHS_1M_LEFT_ROTARY_PUSH_PULL", devices.CLOCK, 3001, 3002, 278, ACHS_1M, "Left Head Rotary")
MiG_29A:defineRotary("ACHS_1M_LEFT_ROTARY_ROTATE", devices.CLOCK, 3003, 277, ACHS_1M, "Left Head Rotate Rotary")
MiG_29A:definePushButton("ACHS_1M_RIGHT_ROTARY_PUSH", devices.CLOCK, 3004, 280, ACHS_1M, "Right Head Push Rotary")
MiG_29A:defineToggleSwitchManualRange("ACHS_1M_RIGHT_ROTARY_ROTATE", devices.CLOCK, 3005, 279, { -0.15, 0.15 }, ACHS_1M, "Right Head Rotate Rotary")

-- ADF mode toggle switch
local ADF_SWITCH = "ADF Mode Switch"

MiG_29A:defineToggleSwitch("ADF_MODE_SWITCH", devices.ARK, 3005, 139, ADF_SWITCH, "Mode Switch", { positions = { "INNER", "OUTER" } })
MiG_29A:defineFloat("ADF_MODE_BEACON_INNER_LIGHT", 364, { 0, 1 }, ADF_SWITCH, "Beacon Inner Light (green)")

-- Nose wheel brake
local NOSE_WHEEL_BRAKE = "Nose Wheel Brake (Instrument Panel)"

MiG_29A:defineToggleSwitch("NOSE_WHEEL_BRAKE_HANDLE", devices.INPUT_PANEL, 3035, 23, NOSE_WHEEL_BRAKE, "Nose Wheel Brake Handle")

-- Radar altimeter
local RADAR_ALTIMETER = "Radar Altimeter"

MiG_29A:defineMultiUnitFloat("RADAR_ALTIMETER_ALTITUDE_POINTER", 9, 849, { -1, 1 }, RADAR_ALTIMETER, "Altitude Pointer")
MiG_29A:defineMultiUnitFloat("RADAR_ALTIMETER_LOW_ALTITUDE_MARKER", 405, 850, { -1, 1 }, RADAR_ALTIMETER, "Low Altitude Marker")
MiG_29A:defineMultiUnitFloat("RADAR_ALTIMETER_SENSOR_FLAG", 13, 851, { 0, 1 }, RADAR_ALTIMETER, "Sensor Failure Flag")
MiG_29A:defineRotary("RADAR_ALTIMETER_LOW_ALTITUDE_ROTARY", devices.RADALT, 3002, 137, RADAR_ALTIMETER, "Low Altitude Knob")
MiG_29A:defineFloat("RADAR_ALTIMETER_LOW_ALTITUDE_LIGHT", 170, { 0, 1 }, RADAR_ALTIMETER, "Low Altitude Warning Light")
MiG_29A:definePushButton("RADAR_ALTIMETER_TEST_BUTTON", devices.RADALT, 3001, 138, RADAR_ALTIMETER, "Test Button")

-- Counter measure panel
local COUNTERMEASURES = "Countermeasures Dispenser Panel"

MiG_29A:definePushButton("COUNTERMEASURES_EMERGENCY_JETTISON_BUTTON", devices.WP, 3001, 143, COUNTERMEASURES, "Countermeasures Emergency Jettison Button")
MiG_29A:define3PosTumb("COUNTERMEASURES_PROGRAM_SWITCH", devices.WP, 3002, 140, COUNTERMEASURES, "Countermeasures Program Switch", { positions = { "RHS", "FHS", "GROUND" } })
MiG_29A:defineFloat("COUNTERMEASURES_COUNTER_FLOAT", 38, { 0, 1 }, COUNTERMEASURES, "Countermeasures Counter Float")
MiG_29A:defineString("COUNTERMEASURES_COUNTER_STRING", function(dev0)
	return getCountermeasuresCounterString(dev0:get_argument_value(38))
end, 2, COUNTERMEASURES, "Countermeasures Counter String")

-- ITG-1 Gas temperature meters
local ITG_1 = "ITG-1 Gas Temperature Meters"

MiG_29A:defineFloat("ITG_1_LEFT_ENGINE_GAS_TEMPERATURE_POINTER", 12, { 0, 1 }, ITG_1, "Left Engine Temperature Pointer")
MiG_29A:defineFloat("ITG_1_RIGHT_ENGINE_GAS_TEMPERATURE_POINTER", 14, { 0, 1 }, ITG_1, "Right Engine Temperature Pointer")

-- ISTR4 Fuel flow metering system indicator
local ISTR4 = "ISTR4 Fuel Flow Metering System Indicator"

MiG_29A:defineFloat("ISTR4_ESTIMATED_DISTANCE_THOUSANDS", 225, { 0, 1 }, ISTR4, "Estimated Flight Distance Indicator (Thousands)")
MiG_29A:defineFloat("ISTR4_ESTIMATED_DISTANCE_HUNDREDS", 226, { 0, 1 }, ISTR4, "Estimated Flight Distance Indicator (Hundreds)")
MiG_29A:defineFloat("ISTR4_ESTIMATED_DISTANCE_TENS", 227, { 0, 1 }, ISTR4, "Estimated Flight Distance Indicator (Tens)")
MiG_29A:defineString("ISTR4_ESTIMATED_DISTANCE_FULL", function(dev0)
	return string.format("%d%d%d", indicator_argument_display(dev0, 225, 10), indicator_argument_display(dev0, 226, 10), indicator_argument_display(dev0, 227, 10))
end, 3, ISTR4, "Estimated Flight Distance Indicator")
MiG_29A:defineToggleSwitch("ISTR4_DISTANCE_COMPUTER_MODE_SWITCH", devices.FUEL_INDICATOR, 3002, 446, ISTR4, "Distance Computer Mode Switch", { positions = { "OPT", "TAC" } })
MiG_29A:defineFloat("ISTR4_DISTANCE_COMPUTER_OPT_LIGHT", 66, { 0, 1 }, ISTR4, "Distance Computer OPT Light (Orange)")
MiG_29A:defineFloat("ISTR4_DISTANCE_COMPUTER_TAC_LIGHT", 62, { 0, 1 }, ISTR4, "Distance Computer TAC Light (Orange)")
MiG_29A:defineToggleSwitch("ISTR4_FUEL_MEASURING_MODE_SWITCH", devices.FUEL_INDICATOR, 3001, 440, ISTR4, "Fuel Measuring Mode Switch", { positions = { "T", "P" } })
MiG_29A:defineFloat("ISTR4_FUEL_MEASURING_T_LIGHT", 63, { 0, 1 }, ISTR4, "Fuel Measuring Mode T Light (Green)")
MiG_29A:defineFloat("ISTR4_FUEL_MEASURING_P_LIGHT", 64, { 0, 1 }, ISTR4, "Fuel Measuring Mode P Light (Green)")
MiG_29A:defineFloat("ISTR4_TOTAL_FUEL_GAUGE", 22, { 0, 1 }, ISTR4, "Total Fuel Gauge")
MiG_29A:defineFloat("ISTR4_EXTERNAL_TANKS_EMPTY_LIGHT", 221, { 0, 1 }, ISTR4, 'External Tanks Empty Light "CL" (Yellow)')
MiG_29A:defineFloat("ISTR4_WING_TANK_EMPTY_LIGHT", 217, { 0, 1 }, ISTR4, 'Wing Tank Empty Light "WING" (Yellow)')
MiG_29A:defineFloat("ISTR4_TANK_3_EMPTY_LIGHT", 218, { 0, 1 }, ISTR4, 'Tank 3 Empty Light "3" (Yellow)')
MiG_29A:defineFloat("ISTR4_TANK_1_EMPTY_LIGHT", 220, { 0, 1 }, ISTR4, 'Tank 1 Empty Light "1" (Yellow)')

-- IKG-1 Combined oxygen indicator
local IKG_1_OXYGEN = "IKG-1 Combined Oxygen Indicator"

MiG_29A:defineFloat("IKG_1_OXYGEN_ALTITUDE_POINTER", 300, { 0, 1 }, IKG_1_OXYGEN, "Cockpit Altitude Pointer")
MiG_29A:defineFloat("IKG_1_OXYGEN_QUANTITY_POINTER", 301, { 0, 1 }, IKG_1_OXYGEN, "Oxygen Quantity Pointer")
MiG_29A:defineFloat("IKG_1_OXYGEN_FLOW_POINTER", 302, { 0, 1 }, IKG_1_OXYGEN, "Oxygen Flow Pointer")
MiG_29A:defineFloat("IKG_1_OXYGEN_PRESSURIZATION_POINTER", 303, { 0, 1 }, IKG_1_OXYGEN, "Cockpit Pressurization Pointer")

-- IKG-1 Combined Pressure Indicator
local IKG_1_PRESSURE = "IKG-1 Combined Pressure Indicator"

MiG_29A:defineFloat("IKG_1_HYDRO_PRESSURE_MAIN_INDICATOR", 304, { 0, 1 }, IKG_1_PRESSURE, "Main Hydraulic Pressure Indicator")
MiG_29A:defineFloat("IKG_1_HYDRO_PRESSURE_BOOST_INDICATOR", 305, { 0, 1 }, IKG_1_PRESSURE, "Boost Hydraulic Pressure Indicator")
MiG_29A:defineFloat("IKG_1_PNEUMATIC_PRESSURE_MAIN_INDICATOR", 306, { 0, 1 }, IKG_1_PRESSURE, "Main Pneumatic Pressure Indicator")
MiG_29A:defineFloat("IKG_1_PNEUMATIC_PRESSURE_EMERGENCY_INDICATOR", 306, { 0, 1 }, IKG_1_PRESSURE, "Emergency Pneumatic Pressure Indicator")

-- Air duct ramp indicator
local AIR_DUCT_RAMP = "Air Duct Ramp"

MiG_29A:defineFloat("AIR_DUCT_LEFT_RAMP_POSITION_INDICATOR", 443, { 0, 1 }, AIR_DUCT_RAMP, "Left Ramp Position Indicator")
MiG_29A:defineFloat("AIR_DUCT_RIGHT_RAMP_POSITION_INDICATOR", 444, { 0, 1 }, AIR_DUCT_RAMP, "Right Ramp Position Indicator")
MiG_29A:reserveIntValue(65535) -- Left Ramp Setting Knob
MiG_29A:reserveIntValue(65535) -- Right Ramp Setting Knob

-- ITE-2TB Engine RPM Tachometer
local ITE_2TB = "ITE-2TB Engine RPM Tachometer"

MiG_29A:defineFloat("ITE_2TB_LEFT_ENGINE_RPM_POINTER", 16, { 0, 1 }, ITE_2TB, "Left Engine RPM Pointer")
MiG_29A:defineFloat("ITE_2TB_RIGHT_ENGINE_RPM_POINTER", 17, { 0, 1 }, ITE_2TB, "Right Engine RPM Pointer")

-- Voltmeter
local VOLTMETER = "Voltmeter"

MiG_29A:defineFloat("VOLTMETER_POINTER", 308, { 0, 1 }, VOLTMETER, "Voltmeter Pointer")

-- Pitot Controls
local PITOT_CONTROLS = "Pitot Controls"

MiG_29A:defineToggleSwitch("PITOT_LEVER", devices.SNSR_SYS_INTERFACE, 3001, 131, PITOT_CONTROLS, "Pitot Lever", { positions = { "MAIN", "STBY" } })
MiG_29A:defineToggleSwitch("PITOT_HEAT_SWITCH", devices.SNSR_SYS_INTERFACE, 3003, 558, PITOT_CONTROLS, "Pitot Lever", { positions = { "OFF", "ON" } })

-- M-2A Brake air pressure manometer
local M_2A = "M-2A Brake Air Pressure Manometer"

MiG_29A:defineFloat("M_2A_LEFT_BRAKE_PRESSURE_INDICATOR", 124, { 0, 1 }, M_2A, "Left Brake Pressure Indicator")
MiG_29A:defineFloat("M_2A_RIGHT_BRAKE_PRESSURE_INDICATOR", 125, { 0, 1 }, M_2A, "Right Brake Pressure Indicator")

-- Hydrolique pressure

-- SPO-15LM RWR
local SPO_15LM = "SPO-15LM RWR"
MiG_29A:definePotentiometer("SPO_15_BRIGHTNESS_KNOB", devices.L006LM, 3003, 186, { 0, 1 }, SPO_15LM, "Brightness Knob")
MiG_29A:defineSpringloaded_3PosTumb("SPO_15_TEST_SWITCH", devices.L006LM, 3001, 3002, 185, SPO_15LM, "Test Switch", { positions = { "MANUAL", "TEST", "AUTO" } })
MiG_29A:defineToggleSwitch("SPO_15_POWER_SWITCH", devices.L006LM, 3004, 189, SPO_15LM, "Power Switch", { positions = { "OFF", "SPO ON" } })
MiG_29A:defineToggleSwitch("SPO_15_SCAN_SWITCH", devices.L006LM, 3005, 188, SPO_15LM, "Scan Switch", { positions = { "OFF", "SCAN" } })
MiG_29A:definePotentiometer("SPO_15_TONE_VOLUME_KNOB", devices.L006LM, 3006, 187, { 0, 1 }, SPO_15LM, "Warning Tone Volume Knob")

MiG_29A:defineFloat("SPO_15_READY_LIGHT", 177, { 0, 1 }, SPO_15LM, "Device Ready Light (Yellow)")
MiG_29A:defineFloat("SPO_15_WARNING_LIGHT", 162, { 0, 1 }, SPO_15LM, "Tracking Warning Light (Red)")
MiG_29A:defineFloat("SPO_15_SOUND_OFF_LIGHT", 163, { 0, 1 }, SPO_15LM, "Sound Off Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_POSITION_LIGHT", 201, { 0, 1 }, SPO_15LM, "Main Threat Position Light (Yellow)")
MiG_29A:defineFloat("SPO_15_UPPER_ELEVATION_INDICATOR_LIGHT", 160, { 0, 1 }, SPO_15LM, "Upper Hemisphere Elevation Angle Light (B) (Yellow)")
MiG_29A:defineFloat("SPO_15_LOWER_ELEVATION_INDICATOR_LIGHT", 161, { 0, 1 }, SPO_15LM, "Lower Hemisphere Elevation Angle Light (H) (Yellow)")

MiG_29A:defineFloat("SPO_15_MAIN_THREAT_90_LEFT_LIGHT", 150, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 90 Left Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_50_LEFT_LIGHT", 151, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 50 Left Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_30_LEFT_LIGHT", 152, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 30 Left Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_10_LEFT_LIGHT", 153, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 10 Left Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_90_RIGHT_LIGHT", 157, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 90 Right Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_50_RIGHT_LIGHT", 156, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 50 Right Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_30_RIGHT_LIGHT", 155, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 30 Right Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_10_RIGHT_LIGHT", 154, { 0, 1 }, SPO_15LM, "Main Threat Azimuth 10 Right Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_REAR_LEFT_LIGHT", 158, { 0, 1 }, SPO_15LM, "Main Threat Azimuth Rear Left Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_REAR_RIGHT_LIGHT", 159, { 0, 1 }, SPO_15LM, "Main Threat Azimuth Rear Right Light (Yellow)")

MiG_29A:defineFloat("SPO_15_THREAT_90_LEFT_LIGHT", 191, { 0, 1 }, SPO_15LM, "Threat Azimuth 90 Left Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_50_LEFT_LIGHT", 192, { 0, 1 }, SPO_15LM, "Threat Azimuth 50 Left Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_30_LEFT_LIGHT", 193, { 0, 1 }, SPO_15LM, "Threat Azimuth 30 Left Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_10_LEFT_LIGHT", 194, { 0, 1 }, SPO_15LM, "Threat Azimuth 10 Left Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_90_RIGHT_LIGHT", 198, { 0, 1 }, SPO_15LM, "Threat Azimuth 90 Right Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_50_RIGHT_LIGHT", 197, { 0, 1 }, SPO_15LM, "Threat Azimuth 50 Right Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_30_RIGHT_LIGHT", 196, { 0, 1 }, SPO_15LM, "Threat Azimuth 30 Right Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_10_RIGHT_LIGHT", 195, { 0, 1 }, SPO_15LM, "Threat Azimuth 10 Right Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_REAR_LEFT_LIGHT", 199, { 0, 1 }, SPO_15LM, "Threat Azimuth Rear Left Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_REAR_RIGHT_LIGHT", 200, { 0, 1 }, SPO_15LM, "Threat Azimuth Rear Right Light (Green)")

MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_1_LIGHT", 202, { 0, 1 }, SPO_15LM, "Emitter Power Level 1 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_2_LIGHT", 203, { 0, 1 }, SPO_15LM, "Emitter Power Level 2 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_3_LIGHT", 204, { 0, 1 }, SPO_15LM, "Emitter Power Level 3 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_4_LIGHT", 205, { 0, 1 }, SPO_15LM, "Emitter Power Level 4 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_5_LIGHT", 206, { 0, 1 }, SPO_15LM, "Emitter Power Level 5 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_6_LIGHT", 207, { 0, 1 }, SPO_15LM, "Emitter Power Level 6 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_7_LIGHT", 208, { 0, 1 }, SPO_15LM, "Emitter Power Level 7 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_8_LIGHT", 209, { 0, 1 }, SPO_15LM, "Emitter Power Level 8 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_9_LIGHT", 210, { 0, 1 }, SPO_15LM, "Emitter Power Level 9 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_10_LIGHT", 211, { 0, 1 }, SPO_15LM, "Emitter Power Level 10 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_11_LIGHT", 212, { 0, 1 }, SPO_15LM, "Emitter Power Level 11 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_12_LIGHT", 213, { 0, 1 }, SPO_15LM, "Emitter Power Level 12 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_13_LIGHT", 214, { 0, 1 }, SPO_15LM, "Emitter Power Level 13 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_14_LIGHT", 215, { 0, 1 }, SPO_15LM, "Emitter Power Level 14 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_EMITTER_POWER_LEVEL_15_LIGHT", 216, { 0, 1 }, SPO_15LM, "Emitter Power Level 15 Light (Yellow)")

MiG_29A:defineFloat("SPO_15_MAIN_THREAT_TYPE_1_LIGHT", 164, { 0, 1 }, SPO_15LM, "Main Threat Type M Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_TYPE_2_LIGHT", 165, { 0, 1 }, SPO_15LM, "Main Threat Type 3 Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_TYPE_3_LIGHT", 166, { 0, 1 }, SPO_15LM, "Main Threat Type X Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_TYPE_4_LIGHT", 167, { 0, 1 }, SPO_15LM, "Main Threat Type H Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_TYPE_5_LIGHT", 168, { 0, 1 }, SPO_15LM, "Main Threat Type F Light (Yellow)")
MiG_29A:defineFloat("SPO_15_MAIN_THREAT_TYPE_6_LIGHT", 169, { 0, 1 }, SPO_15LM, "Main Threat Type C Light (Yellow)")

MiG_29A:defineFloat("SPO_15_THREAT_TYPE_1_LIGHT", 171, { 0, 1 }, SPO_15LM, "Threat Type M Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_TYPE_2_LIGHT", 172, { 0, 1 }, SPO_15LM, "Threat Type 3 Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_TYPE_3_LIGHT", 173, { 0, 1 }, SPO_15LM, "Threat Type X Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_TYPE_4_LIGHT", 174, { 0, 1 }, SPO_15LM, "Threat Type H Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_TYPE_5_LIGHT", 175, { 0, 1 }, SPO_15LM, "Threat Type F Light (Green)")
MiG_29A:defineFloat("SPO_15_THREAT_TYPE_6_LIGHT", 176, { 0, 1 }, SPO_15LM, "Threat Type C Light (Green)")

-- Cabine air controls

-- Tally light panel

-- A-323 Navigation control panel

-- Lower center console

-- Oxygen system
local O2_SYSTEM = "Oxygen System"

MiG_29A:defineToggleSwitch("OXYGEN_FLOW_VALVE", devices.AIR_INTERFACE, 3017, 106, O2_SYSTEM, "Oxygen Flow Valve")
MiG_29A:defineToggleSwitch("OXYGEN_MIX_SWITCH", devices.AIR_INTERFACE, 3018, 115, O2_SYSTEM, "Oxygen Mixture Switch")
MiG_29A:defineToggleSwitch("OXYGEN_EMERGENCY_SWITCH", devices.AIR_INTERFACE, 3020, 117, O2_SYSTEM, "Oxygen Emergency Switch")
MiG_29A:defineToggleSwitch("OXYGEN_VENT_HELMET_SWITCH", devices.AIR_INTERFACE, 3022, 119, O2_SYSTEM, "Oxygen Vent Helmet Switch")
MiG_29A:defineToggleSwitch("OXYGEN_CABIN_EMERGENCY_DECOMPRESSION_SWITCH", devices.AIR_INTERFACE, 3014, 247, O2_SYSTEM, "Cabin Emergency Decompression Switch")

-- Air conditionning
local AIR_CONDITIONING = "Air Conditioning"

MiG_29A:defineToggleSwitch("AIR_CONDITIONING_SUIT_VENTILATION_TOGGLE", devices.AIR_INTERFACE, 3016, 108, AIR_CONDITIONING, "Suit Ventilation", { positions = { "OPEN", "CLOSE" } })
MiG_29A:definePotentiometer("AIR_CONDITIONING_SUIT_VENTILATION_KNOB", devices.AIR_INTERFACE, 3030, 109, { 0, 0.6 }, AIR_CONDITIONING, "Suit Ventilation Temperature Knob")
MiG_29A:defineToggleSwitch("AIR_CONDITIONING_COCKPIT_BLOW_DISTRIBUTION_LEVER", devices.AIR_INTERFACE, 3010, 254, AIR_CONDITIONING, "Cockpit air distribution lever", { positions = { "PILOT", "OPEN" } })
MiG_29A:defineToggleSwitch("AIR_CONDITIONING_COCKPIT_AIR_SUPPLY_LEVER", devices.AIR_INTERFACE, 3012, 246, AIR_CONDITIONING, "Cockpit air supply lever", { positions = { "CLOSED", "OPEN" } })
MiG_29A:definePotentiometer("AIR_CONDITIONING_CABIN_TEMP_CONTROL_KNOB", devices.AIR_INTERFACE, 3007, 114, { 0, 0.5 }, AIR_CONDITIONING, "Cabin Temperature Control Knob")
MiG_29A:defineCabinTempSwitch("AIR_CONDITIONING_CABIN_TEMP_SWITCH", devices.AIR_INTERFACE, 555, AIR_CONDITIONING, "Cabin Temperature Switch", { positions = { "OFF", "AUTO", "HOT", "COLD" } })

-- Flaps controls
local FLAPS_CONTROL = "Flaps Controls"

MiG_29A:definePushButton("FLAPS_CONTROL_UP_BUTTON", devices.HYDRO_INTERFACE, 3002, 222, FLAPS_CONTROL, "Flaps Up Button")
MiG_29A:definePushButton("FLAPS_CONTROL_DOWN_TAKEOFF_BUTTON", devices.HYDRO_INTERFACE, 3003, 223, FLAPS_CONTROL, "Flaps Down Takeoff Button")
MiG_29A:definePushButton("FLAPS_CONTROL_DOWN_LANDING_BUTTON", devices.HYDRO_INTERFACE, 3004, 224, FLAPS_CONTROL, "Flaps Down Landing Button")
MiG_29A:definePushButton("FLAPS_CONTROL_OFF_BUTTON", devices.HYDRO_INTERFACE, 3005, 219, FLAPS_CONTROL, "Flaps Off Button")

-- R-862 VHF / UHF control panel
local R_862 = "R-862 VHF/UHF"

MiG_29A:reserveIntValue(1) -- Guard frequency lamp indicator
MiG_29A:defineToggleSwitch("R862_GUARD_RECEIVER_SWITCH", devices.VHF_UHF_R862, 3006, 248, R_862, "Guard Receiver Select Switch")
MiG_29A:defineToggleSwitch("R862_ADF_SWITCH", devices.VHF_UHF_R862, 3005, 249, R_862, "ADF Switch")
MiG_29A:defineToggleSwitch("R862_SQUELCH_SWITCH", devices.VHF_UHF_R862, 3003, 250, R_862, "Squelch Switch")
MiG_29A:definePotentiometer("R862_VOLUME_KNOB", devices.VHF_UHF_R862, 3004, 251, { 0, 1 }, R_862, "Volume Control Knob")
MiG_29A:defineMultipositionSwitch("R862_CHANNEL_SELECTOR", devices.VHF_UHF_R862, 3002, 252, 20, 0.05, R_862, "Channel Selector (0-19)")
MiG_29A:defineIntegerFromArg("R862_SELECTED_CHANNEL_INDICATOR", 284, 20, R_862, "Selected Channel Indicator")

-- ADF control panel

-- Engine emergency panel

-- PSR-31 Weapon controls panel
local WEAPONS_CONTROL = "PSR-31 Weapon Control Panel"

MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_MASTER_ARM", devices.INPUT_PANEL, 3011, 526, WEAPONS_CONTROL, "Master Arm Switch")
MiG_29A:define3PosTumb("WEAPONS_CONTROL_RADAR_ZONE_SWITCH", devices.INPUT_PANEL, 3006, 525, WEAPONS_CONTROL, "Radar Operating Zone Wwitch", { positions = { "LEFT", "CENTER", "RIGHT" } })
MiG_29A:definePotentiometer("WEAPONS_CONTROL_IR_GAIN_HEML_BRIGHT_KNOB", devices.INPUT_PANEL, 3008, 524, { 0, 1 }, WEAPONS_CONTROL, "IR Gain / Helmet Brightness Knob")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_MISSILE_PREPARE_SWITCH", devices.INPUT_PANEL, 3013, 527, WEAPONS_CONTROL, "Missile Launch Preparation Mode", { positions = { "AUTO", "MAN" } })
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_BURST_MODE_SWITCH", devices.WP, 3012, 521, WEAPONS_CONTROL, "Burst Mode Switch", { positions = { "SINGLE/0.5 ALL", "ALL" } })
MiG_29A:definePotentiometer("WEAPONS_CONTROL_WING_SPAN_KNOB", devices.INPUT_PANEL, 3001, 520, { 0, 1 }, WEAPONS_CONTROL, "Target Wing Span Knob")
MiG_29A:defineMultipositionSwitch("WEAPONS_CONTROL_WCS_MODES_SELECTOR", devices.INPUT_PANEL, 3004, 523, 8, 0.1, WEAPONS_CONTROL, "WCS Modes Selector Knob", { positions = { "TOSS", "NAV", "RAD", "IR", "CC", "HELM", "OPT", "BS" } })

-- AFCS Autopilot control panel
local AUTOPILOT = "AFCS Autopilot Control Panel"

MiG_29A:definePushButton("AUTOPILOT_DAMPER_BUTTON", devices.AFCS_INTERFACE, 3001, 82, AUTOPILOT, "Autopilot Damper Button")
MiG_29A:defineFloat("AUTOPILOT_DAMPER_LIGHT", 83, { 0, 1 }, AUTOPILOT, "Autopilot Damper Light")
MiG_29A:definePushButton("AUTOPILOT_AUTO_RECOVER_BUTTON", devices.AFCS_INTERFACE, 3002, 84, AUTOPILOT, "Autopilot Auto Recover Button")
MiG_29A:defineFloat("AUTOPILOT_AUTO_RECOVER_LIGHT", 85, { 0, 1 }, AUTOPILOT, "Autopilot Auto Recover Light")
MiG_29A:definePushButton("AUTOPILOT_ALT_HOLD_BUTTON", devices.AFCS_INTERFACE, 3003, 86, AUTOPILOT, "Autopilot ALT Hold Button")
MiG_29A:defineFloat("AUTOPILOT_ALT_HOLD_LIGHT", 87, { 0, 1 }, AUTOPILOT, "Autopilot ALT Hold Light")
MiG_29A:definePushButton("AUTOPILOT_ATT_HOLD_BUTTON", devices.AFCS_INTERFACE, 3004, 88, AUTOPILOT, "Autopilot Given ATT Hold Button")
MiG_29A:defineFloat("AUTOPILOT_ATT_HOLD_LIGHT", 89, { 0, 1 }, AUTOPILOT, "Autopilot ATT Hold Light")
MiG_29A:definePushButton("AUTOPILOT_APPROACH_BUTTON", devices.AFCS_INTERFACE, 3005, 90, AUTOPILOT, "Autopilot Approach Button")
MiG_29A:defineFloat("AUTOPILOT_APPROACH_LIGHT", 91, { 0, 1 }, AUTOPILOT, "Autopilot Approach Light")
MiG_29A:definePushButton("AUTOPILOT_MISSED_APPROACH_BUTTON", devices.AFCS_INTERFACE, 3006, 92, AUTOPILOT, "Autopilot Missed Approach Button")
MiG_29A:defineFloat("AUTOPILOT_MISSED_APPROACH_LIGHT", 93, { 0, 1 }, AUTOPILOT, "Autopilot Missed Approach Light")

-- PUR-31 Radar control panel
local PUR_31 = "PUR-31 Radar Control Panel"

MiG_29A:defineMultipositionManualRange("RADAR_CONTROLS_ANTENNA_ELEV_SELECTOR", devices.INPUT_PANEL, 3025, 294, 11, { -0.4, 0.6 }, PUR_31, "Radar Antenna Elevation Selector", { positions = { "-6", "-4", "-2", "-1", "0", "1", "2", "4", "6", "8", "10" } })
MiG_29A:defineMultipositionSwitch("RADAR_CONTROLS_MODE_SWITCH", devices.INPUT_PANEL, 3021, 295, 4, 0.1, PUR_31, "Radar Mode Selector", { positions = { "AUTO", "CLOSE CMBT", "HEAD ON", "P" } })
MiG_29A:define3PosTumb("RADAR_CONTROLS_ILLUMINATION_SWITCH", devices.INPUT_PANEL, 3029, 296, PUR_31, "Radar Illumination Switch", { positions = { "OFF", "DUMMY", "ILLUM" } })
MiG_29A:define3PosTumb("RADAR_CONTROLS_ECCM_SWITCH", devices.INPUT_PANEL, 3031, 299, PUR_31, "Radar ECCM Counteraction Switch", { positions = { "CAJ", "OFF", "AJ" } })
MiG_29A:defineToggleSwitch("RADAR_CONTROLS_TWF_SWITCH", devices.INPUT_PANEL, 3023, 298, PUR_31, "Radar TWF Switch", { positions = { "RHS", "TWF FHS" } })
MiG_29A:defineToggleSwitch("RADAR_CONTROLS_COMPENSATION_SWITCH", devices.INPUT_PANEL, 3027, 297, PUR_31, "Radar Compensation Switch")

-- HUD control panel
local HUD = "Head-up Display Controls"

MiG_29A:definePotentiometer("HUD_BRIGHTNESS_KNOB", devices.HUD, 3002, 536, { 0, 1 }, HUD, "Brightness Knob")
MiG_29A:definePushButton("HUD_TEST_BUTTON", devices.HUD, 3001, 534, HUD, "Test Button")
MiG_29A:define3PosTumb("HUD_MODE_SWITCH", devices.HUD, 3003, 535, HUD, "HUD Mode Selector", { positions = { "RETICLE", "DAY", "NIGHT" } })

-- HDD control panel
local HDD = "Head Down Display Controls"

MiG_29A:definePotentiometer("HDD_BRIGHTNESS_KNOB", devices.HDD, 3001, 530, { 0, 1 }, HDD, "Brightness Knob")
MiG_29A:defineToggleSwitch("HDD_SOURCE_SWITCH", devices.HDD, 3002, 869, HDD, "HDD Source Switch", { positions = { "DUPLICATION", "TACTICAL" } })
MiG_29A:reserveIntValue(1) -- HDD Mode Switch

-- Canopy controls
local CANOPY_CONTROLS = "Canopy Controls"

MiG_29A:define3PosTumb0To1("LEFT_WALL_CANOPY_HANDLE", devices.AIR_INTERFACE, 3008, 810, CANOPY_CONTROLS, "Canopy Control Handle", { positions = { "CLOSE", "TAXI", "OPEN" } })
MiG_29A:defineIndicatorLight("LEFT_WALL_CANOPY_LOCK_INDICATOR", 383, CANOPY_CONTROLS, "Canopy Lock Indicator")
MiG_29A:definePushButton("RIGHT_WALL_CANOPY_EMERGENCY_HANDLE", devices.CPT_MECH, 3011, 76, CANOPY_CONTROLS, "Canopy Emergency Jettison Handle")
MiG_29A:defineFloat("RIGHT_WALL_CANOPY_INDICATOR", 180, { 0, 1 }, CANOPY_CONTROLS, "Canopy Indicator")

-- Refueling panel

-- EKRAN warning system
local EKRAN = "EKRAN Warning System"

MiG_29A:definePushButton("EKRAN_CALL_BUTTON", devices.EKRAN, 3001, 84, EKRAN, "Call Button")
MiG_29A:defineFloat("EKRAN_FAIL_LIGHT", 231, { 0, 1 }, EKRAN, "Fail Light")
MiG_29A:defineFloat("EKRAN_TURN_LIGHT", 232, { 0, 1 }, EKRAN, "Turn Light")
MiG_29A:defineFloat("EKRAN_MEMORY_LIGHT", 233, { 0, 1 }, EKRAN, "Memory Light")

local parsedEKRAN = {}
local ekran_txt_1 = {}
local ekran_txt_2 = {}

MiG_29A:addExportHook(function()
	parsedEKRAN = Module.parse_indication(5)
	ekran_txt_1 = line_split(parsedEKRAN.txt_1)
	ekran_txt_2 = line_split(parsedEKRAN.txt_2)
end)

local function getEKRAN_txt1_line1()
	return Functions.coerce_nil_to_string(ekran_txt_1[1])
end
local function getEKRAN_txt1_line2()
	return Functions.coerce_nil_to_string(ekran_txt_1[2])
end
local function getEKRAN_txt1_line3()
	return Functions.coerce_nil_to_string(ekran_txt_1[3])
end
local function getEKRAN_txt1_line4()
	return Functions.coerce_nil_to_string(ekran_txt_1[4])
end
local function getEKRAN_txt2_line1()
	return Functions.coerce_nil_to_string(ekran_txt_2[1])
end
local function getEKRAN_txt2_line2()
	return Functions.coerce_nil_to_string(ekran_txt_2[2])
end
local function getEKRAN_txt2_line3()
	return Functions.coerce_nil_to_string(ekran_txt_2[3])
end
local function getEKRAN_txt2_line4()
	return Functions.coerce_nil_to_string(ekran_txt_2[4])
end
-- Max length of a line is 10 minus the ommited number at the end
MiG_29A:defineString("EKRAN_TXT1_LINE1", getEKRAN_txt1_line1, 9, "EKRAN", "EKRAN txt 1 line 1")
MiG_29A:defineString("EKRAN_TXT1_LINE2", getEKRAN_txt1_line2, 9, "EKRAN", "EKRAN txt 1 line 2")
MiG_29A:defineString("EKRAN_TXT1_LINE3", getEKRAN_txt1_line3, 9, "EKRAN", "EKRAN txt 1 line 3")
MiG_29A:defineString("EKRAN_TXT1_LINE4", getEKRAN_txt1_line4, 9, "EKRAN", "EKRAN txt 1 line 4")
MiG_29A:defineString("EKRAN_TXT2_LINE1", getEKRAN_txt2_line1, 9, "EKRAN", "EKRAN txt 2 line 1")
MiG_29A:defineString("EKRAN_TXT2_LINE2", getEKRAN_txt2_line2, 9, "EKRAN", "EKRAN txt 2 line 2")
MiG_29A:defineString("EKRAN_TXT2_LINE3", getEKRAN_txt2_line3, 9, "EKRAN", "EKRAN txt 2 line 3")
MiG_29A:defineString("EKRAN_TXT2_LINE4", getEKRAN_txt2_line4, 9, "EKRAN", "EKRAN txt 2 line 4")

-- Voice information and warning system (VIWAS) controls

-- Left wall
local LEFT_WALL = "Left Wall"

MiG_29A:defineToggleSwitch("LEFT_WALL_EXT_STORES_SWITCH", devices.WP, 3010, 29, LEFT_WALL, "External Stores Selector Switch", { positions = { "INBD", "OUTBD" } })

-- Bottom left console auxiliary controls
local BOTTOM_LEFT_AUXILIARY = "Bottom Left Console Auxiliary Controls"

MiG_29A:definePotentiometer("LEFT_WALL_IR_VOLUME", devices.INTERCOM, 3001, 98, { 0, 1 }, BOTTOM_LEFT_AUXILIARY, "IR Volume Control Knob")
MiG_29A:defineSpringloaded_3PosTumb("LEFT_WALL_RUDDER_TRIM_SWITCH", devices.CONTROL_INTERFACE, 3001, 3002, 99, BOTTOM_LEFT_AUXILIARY, "Rudder Trim Switch", { positions = { "LEFT", "MIDDLE", "RIGHT" } })

-- Top left console auxiliary controls
local TOP_LEFT_AUXILIARY = "Top Left Console Auxiliary Controls"

MiG_29A:define3PosTumb("LEFT_WALL_TAXI_LIGHT_SWITCH", devices.EXTLIGHTS_SYSTEM, 3003, 178, TOP_LEFT_AUXILIARY, "Taxi Light Switch", { positions = { "OFF", "TAXI", "LAND LIGHT" } })
MiG_29A:definePushButton("LEFT_WALL_MISSILE_EMERGENCY_JETTISON_BUTTON", devices.WP, 3004, 95, TOP_LEFT_AUXILIARY, "Emergency Missile Jettison Button")

-- Chute controls
local DRAG_CHUTE = "Drag Chute"

MiG_29A:definePushButton("CHUTE_JETTISON_BUTTON", devices.INPUT_PANEL, 3038, 243, DRAG_CHUTE, "Drag Chute Jettison Button")
MiG_29A:definePushButton("CHUTE_LAUNCH_BUTTON", devices.INPUT_PANEL, 3037, 28, DRAG_CHUTE, "Drag Chute Launch Button")

-- Mirrors

-- Landing gear controls
local LANDING_GEAR = "Landing Gear Controls"

MiG_29A:defineToggleSwitch("LANDING_GEAR_HANDLE", devices.HYDRO_INTERFACE, 3001, 80, LANDING_GEAR, "Landing Gear Handle", { positions = { "EXTENDED", "RETRACTED" } })
MiG_29A:defineFloat("LANDING_GEAR_EMERGENCY_HANDLE", 15, { 0, 1 }, LANDING_GEAR, "Landing Gear Emergency Handle") -- No controls to action it yet

-- PU-S31 Weapon Control Panel
local WEAPONS_SETTINGS = "PU-S31 Weapon Control Panel"

MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_COOP_SWITCH", devices.INPUT_PANEL, 3019, 287, WEAPONS_SETTINGS, "Coop Switch", { positions = { "NO RETARD", "COOP RETARD" } })
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_AG_SWITCH", devices.INPUT_PANEL, 3015, 286, WEAPONS_SETTINGS, "A/G Mode Switch", { positions = { "AIR", "GROUND" } })
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_BOMB_JETTISON_ARM_SWITCH", devices.WP, 3008, 290, WEAPONS_SETTINGS, "Bombs Jettison Arm Switch", { positions = { "SAFE", "ARMED" } })
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_EMERGENCY_JETTISON_COVER", devices.WP, 3006, 291, WEAPONS_SETTINGS, "Emergency Jettison Button Cover")
MiG_29A:definePushButton("WEAPONS_CONTROL_EMERGENCY_JETTISON_BUTTON", devices.WP, 3005, 292, WEAPONS_SETTINGS, "Emergency Jettison Button")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_GUIDANCE_MODE_SWITCH", devices.INPUT_PANEL, 3017, 289, WEAPONS_SETTINGS, "Guidance Mode Switch")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_LOCK_SWITCH", devices.INPUT_PANEL, 3033, 288, WEAPONS_SETTINGS, "Lock Switch", { positions = { "FOE", "FRIEND" } })

-- KI-13 Magnetic compass
local KI_13 = "KI-13 Magnetic Compass"

MiG_29A:defineFloat("KI_13_COMPASS", 53, { 0, 1 }, KI_13, "Compass Indicator")

-- Telelight Panel
local TLP = "Telelight Panel"

MiG_29A:defineFloat("TLP_LIGHT_GBX_FIRE", 340, { 0, 1 }, TLP, "GBX FIRE Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_LEFT_ENG_FIRE", 341, { 0, 1 }, TLP, "LH ENG FIRE Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_RIGHT_ENG_FIRE", 342, { 0, 1 }, TLP, "RH ENG FIRE Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_LEFT_ENG_RPM", 343, { 0, 1 }, TLP, "REDUCED RPM LH ENG Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_RIGHT_ENG_RPM", 344, { 0, 1 }, TLP, "REDUCED RPM RH ENG Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_LEFT_OIL_PRESS", 345, { 0, 1 }, TLP, "OIL PRESS LEFT Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_RIGHT_OIL_PRESS", 346, { 0, 1 }, TLP, "OIL PRESS RIGHT Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_OIL_GBX", 347, { 0, 1 }, TLP, "OIL GBX Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_550_REMAIN", 348, { 0, 1 }, TLP, "550 KG REMAIN Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_DOUBLE_HYD_SYS", 349, { 0, 1 }, TLP, "DOUBLE HYD SYS Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_COC_FAIL", 350, { 0, 1 }, TLP, "COC FAIL Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_ARMED", 378, { 0, 1 }, TLP, "ARMED Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_DAMPER_OFF", 352, { 0, 1 }, TLP, "DAMPER OFF Light (Red)")
MiG_29A:defineFloat("TLP_LIGHT_LEFT_ENG_START", 379, { 0, 1 }, TLP, "LH ENG START Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_RIGHT_ENG_START", 380, { 0, 1 }, TLP, "RH ENG START Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_LEFT_ENG_BURNER", 355, { 0, 1 }, TLP, "LH ENG AB Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_RIGHT_ENG_BURNER", 356, { 0, 1 }, TLP, "RH ENG AB Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_RUDDER_TRIM", 357, { 0, 1 }, TLP, "RUD TRIM NEUTRAL Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_STAB_TRIM", 358, { 0, 1 }, TLP, "STAB TRIM NEUTRAL Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_AIL_TRIM", 360, { 0, 1 }, TLP, "AIL TRIM NEUTRAL Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_FEEL_UNIT", 359, { 0, 1 }, TLP, "FEEL UNIT TO/LD Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_MARKER_BEACON", 367, { 0, 1 }, TLP, "MARKER BEACON Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_EMERGENCY_HYD_PUMP", 362, { 0, 1 }, TLP, "EMERG HYD PUMP ON Light (Green)")
MiG_29A:defineFloat("TLP_LIGHT_MODE", 363, { 0, 1 }, TLP, "MODE 1 Light (Green)")
MiG_29A:reserveIntValue(65535) -- Light not implemented yet
MiG_29A:reserveIntValue(65535) -- Light not implemented yet
MiG_29A:defineFloat("TLP_LIGHT_RADAR", 365, { 0, 1 }, TLP, "RADAR READY Light (Green)")
MiG_29A:reserveIntValue(65535) -- Light not implemented yet
MiG_29A:reserveIntValue(65535) -- Light not implemented yet
MiG_29A:reserveIntValue(65535) -- Light not implemented yet

-- Ejection handle

-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

-- Dispenser Check Button - Not Implemented

-- PC-31 Weapon Settings Panel - Not Implemented

return MiG_29A
