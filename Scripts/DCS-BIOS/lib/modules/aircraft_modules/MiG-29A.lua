module("MiG-29A", package.seeall)

local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local ICommand = require("Scripts.DCS-BIOS.lib.modules.ICommand")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")

--- @class MiG_29A: Module
local MiG_29A = Module:new("MiG-29 Fulcrum", 0x3c00, { "MiG-29 Fulcrum" })

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
function MiG_29A:defineIntegerFromArg(identifier, arg_number, max_value, category, description)
	self:defineIntegerFromGetter(identifier, function(dev0)
		return Module.round(dev0:get_argument_value(arg_number) * max_value)
	end, max_value, category, description)
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
function MiG_29A:defineMultipositionManualRange(identifier, device_id, command, arg_number, count, limits, category, description)
	self:defineTumb(identifier, device_id, command, arg_number, 1 / (count - 1), limits, nil, false, category, description)
end

--- Adds an n-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param positions integer the number of switch positions
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function MiG_29A:defineMultipositionSwitch0To1(identifier, device_id, command, arg_number, positions, category, description)
	self:defineMultipositionSwitch(identifier, device_id, command, arg_number, positions, 1 / (positions - 1), category, description)
end

--- Adds a 3-position toggle switch with dcs data values between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
function MiG_29A:define3PosTumb0To1(identifier, device_id, command, arg_number, category, description)
	self:defineMultipositionSwitch0To1(identifier, device_id, command, arg_number, 3, category, description)
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

function MiG_29A:defineCabinTempSwitch(identifier, device_id, arg_number, category, description)
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
	})
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

function MiG_29A:defineGunTrigger(identifier, device_id, arg_number, category, description)
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
	})
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
--- @return Control control the control which was added to the module
function MiG_29A:defineBrakeLever(identifier, iCommand, arg_number, category, description)
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
	})
	self:addControl(control)

	return control
end

-- Unit system set by the user settings, true if "metric", false if "imperial"
local unit_metric = nil

MiG_29A:addExportHook(function(dev0)
	if unit_metric == nil then
		local val = dev0:get_argument_value(1)

		if val >= 0.01 then
			unit_metric = false
		else
			unit_metric = true
		end
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
function MiG_29A:defineMultiUnitFloatManualRange(identifier, arg_number_metric, arg_number_imperial, metric_limits, imperial_limits, category, description)
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
	})
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
function MiG_29A:defineMultiUnitFloat(identifier, arg_number_metric, arg_number_imperial, limits, category, description)
	self:defineMultiUnitFloatManualRange(identifier, arg_number_metric, arg_number_imperial, limits, limits, category, description)
end

-- Stick
local STICK = "Stick Controls"

MiG_29A:defineRockerSwitch("STICK_TRIM_HORIZ", devices.HOTAS, 3007, 3006, 3006, 3007, 52, STICK, "Trim Hat Switch Horizontal (LEFT/MIDDLE/RIGHT)")
MiG_29A:defineRockerSwitch("STICK_TRIM_VERT", devices.HOTAS, 3004, 3005, 3005, 3004, 51, STICK, "Trim Hat Switch Vertical (UP/MIDDLE/DOWN)")
MiG_29A:definePushButton("STICK_LEVELING_BUTTON", devices.HOTAS, 3008, 55, STICK, "Leveling Button")
MiG_29A:defineGatedIndicatorLight("STICK_LEVELING_LIGHT", 49, 0.5, nil, STICK, "Leveling Light")
MiG_29A:definePushButton("STICK_ACFS_OFF_BUTTON", devices.HOTAS, 3009, 48, STICK, "ACFS Modes Off Button")
MiG_29A:definePushButton("STICK_TARGET_ACQUISITION_DEPRESS_BUTTON", devices.HOTAS, 3016, 472, STICK, "Target Acquisition Depress Button")
MiG_29A:definePotentiometer("STICK_TARGET_ACQUISITION_HORIZ", devices.HOTAS, 3010, 471, { -1, 1 }, STICK, "Target Acquisition Horizontal Axis")
MiG_29A:definePotentiometer("STICK_TARGET_ACQUISITION_VERT", devices.HOTAS, 3011, 470, { -1, 1 }, STICK, "Target Acquisition Vertical Axis")
MiG_29A:definePushButton("STICK_BREAK_LOCK_BUTTON", devices.HOTAS, 3017, 54, STICK, "Break-lock Button")
MiG_29A:definePushButton("STICK_AP_CUTOFF_BUTTON", devices.HOTAS, 3018, 70, STICK, "Autopilot Cut-Off Button")
MiG_29A:defineGunTrigger("STICK_GUN_TRIGGER", devices.HOTAS, 442, STICK, "Gun Trigger")
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

-- Control & Test pannel

-- Electrical power pannel

-- System power pannel

-- Engine & APU start pannel

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

-- Altimiter

-- Flaps / Landing gear indicator

-- ADI

-- HSI

-- Combined indicator (VVI/Turn/Slip indicator)

-- TAS indicator

-- Clock

-- ADF mode toggle switch

-- Nose wheel brake
local NOSE_WHEEL_BRAKE = "Nose Wheel Brake (Instrument Panel)"

MiG_29A:defineToggleSwitch("NOSE_WHEEL_BRAKE_HANDLE", devices.INPUT_PANEL, 3035, 23, NOSE_WHEEL_BRAKE, "Nose Wheel Brake Handle (ON/OFF)")

-- Radar altimiter

-- Counter measure pannel

-- Gas temperature meters

-- Fuel flow indicator

-- Combined oxygen indicator

-- Combined pressure indicator

-- Air duct ramp indicator

-- RPM indicator

-- Voltmeter

-- Hydrolique pressure

-- SPO-15 RWR

-- Canopy jettison

-- Canopy indicator

-- Cabine air controls

-- Tally light pannel

-- A-323 Navigation control pannel

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

MiG_29A:defineToggleSwitch("AIR_CONDITIONING_SUIT_VENTILATION_TOGGLE", devices.AIR_INTERFACE, 3016, 108, AIR_CONDITIONING, "Suit Ventilation (OPEN/CLOSE)")
MiG_29A:definePotentiometer("AIR_CONDITIONING_SUIT_VENTILATION_KNOB", devices.AIR_INTERFACE, 3030, 109, { 0, 0.6 }, AIR_CONDITIONING, "Suit Ventilation Temperature Knob")
MiG_29A:defineToggleSwitch("AIR_CONDITIONING_COCKPIT_BLOW_DISTRIBUTION_LEVER", devices.AIR_INTERFACE, 3010, 254, AIR_CONDITIONING, "Cockpit air distribution lever (OPEN/PILOT)")
MiG_29A:defineToggleSwitch("AIR_CONDITIONING_COCKPIT_AIR_SUPPLY_LEVER", devices.AIR_INTERFACE, 3012, 246, AIR_CONDITIONING, "Cockpit air supply lever (OPEN/CLOSED)")
MiG_29A:definePotentiometer("AIR_CONDITIONING_CABIN_TEMP_CONTROL_KNOB", devices.AIR_INTERFACE, 3007, 114, { 0, 0.5 }, AIR_CONDITIONING, "Cabin Temperature Control Knob (OFF/AUTO/HOT/COLD)")
MiG_29A:defineCabinTempSwitch("AIR_CONDITIONING_CABIN_TEMP_SWITCH", devices.AIR_INTERFACE, 555, AIR_CONDITIONING, "Cabin Temperature Switch (OFF/AUTO/HOT/COLD)")

-- Flaps controls
local FLAPS_CONTROL = "Flaps Controls"

MiG_29A:definePushButton("FLAPS_CONTROL_UP_BUTTON", devices.HYDRO_INTERFACE, 3002, 222, FLAPS_CONTROL, "Flaps Up Button")
MiG_29A:definePushButton("FLAPS_CONTROL_DOWN_TAKEOFF_BUTTON", devices.HYDRO_INTERFACE, 3003, 223, FLAPS_CONTROL, "Flaps Down Takeoff Button")
MiG_29A:definePushButton("FLAPS_CONTROL_DOWN_LANDING_BUTTON", devices.HYDRO_INTERFACE, 3004, 224, FLAPS_CONTROL, "Flaps Down Landing Button")
MiG_29A:definePushButton("FLAPS_CONTROL_OFF_BUTTON", devices.HYDRO_INTERFACE, 3005, 219, FLAPS_CONTROL, "Flaps Off Button")

-- R-862 VHF / UHF control pannel
local R_862 = "R-862 VHF/UHF"

MiG_29A:reserveIntValue(1) -- Guard frequency lamp indicator
MiG_29A:defineToggleSwitch("R862_GUARD_RECEIVER_SWITCH", devices.VHF_UHF_R862, 3006, 248, R_862, "Guard Receiver Select Switch (ON/OFF)")
MiG_29A:defineToggleSwitch("R862_ADF_SWITCH", devices.VHF_UHF_R862, 3005, 249, R_862, "ADF Switch (ON/OFF)")
MiG_29A:defineToggleSwitch("R862_SQUELCH_SWITCH", devices.VHF_UHF_R862, 3003, 250, R_862, "Squelch Switch (ON/OFF)")
MiG_29A:definePotentiometer("R862_VOLUME_KNOB", devices.VHF_UHF_R862, 3004, 251, { 0, 1 }, R_862, "Volume Control Knob")
MiG_29A:defineMultipositionSwitch("R862_CHANNEL_SELECTOR", devices.VHF_UHF_R862, 3002, 252, 20, 0.05, R_862, "Channel Selector (0-19)")
MiG_29A:defineIntegerFromArg("R862_SELECTED_CHANNEL_INDICATOR", 284, 20, R_862, "Selected Channel Indicator")

-- ADF control pannel

-- Engine emergency pannel

-- PSR-31 Weapon controls panel
local WEAPONS_CONTROL = "PSR-31 Weapon Control Panel"

MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_MASTER_ARM", devices.INPUT_PANEL, 3011, 526, WEAPONS_CONTROL, "Master Arm Switch")
MiG_29A:define3PosTumb("WEAPONS_CONTROL_RADAR_ZONE_SWITCH", devices.INPUT_PANEL, 3006, 525, WEAPONS_CONTROL, "Radar Operating Zone Wwitch (LEFT/CENTER/RIGHT)")
MiG_29A:definePotentiometer("WEAPONS_CONTROL_IR_GAIN_HEML_BRIGHT_KNOB", devices.INPUT_PANEL, 3008, 524, { 0, 1 }, WEAPONS_CONTROL, "IR Gain / Helmet Brightness Knob")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_MISSILE_PREPARE_SWITCH", devices.INPUT_PANEL, 3013, 527, WEAPONS_CONTROL, "Missile Launch Preparation Mode (AUTO/MAN)")
MiG_29A:defineToggleSwitch("WEAPONS_CONTROL_BURST_MODE_SWITCH", devices.WP, 3012, 521, WEAPONS_CONTROL, "Burst Mode Switch (ALL/SINGLE 0.5 ALL)")
MiG_29A:definePotentiometer("WEAPONS_CONTROL_WING_SPAN_KNOB", devices.INPUT_PANEL, 3001, 520, { 0, 1 }, WEAPONS_CONTROL, "Target Wing Span Knob")
MiG_29A:defineMultipositionSwitch("WEAPONS_CONTROL_WCS_MODES_SELECTOR", devices.INPUT_PANEL, 3004, 523, 8, 0.1, WEAPONS_CONTROL, "WCS Modes Selector Knob (TOSS/NAV/RAD/IR/CC/HELM/OPT/BS)")

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

MiG_29A:defineMultipositionManualRange("RADAR_CONTROLS_ANTENNA_ELEV_SELECTOR", devices.INPUT_PANEL, 3025, 294, 11, { -0.4, 0.6 }, PUR_31, "Radar Antenna Elevation Selector (-6/+10)")
MiG_29A:defineMultipositionSwitch("RADAR_CONTROLS_MODE_SWITCH", devices.INPUT_PANEL, 3021, 295, 4, 0.1, PUR_31, "Radar Mode Selector (AUTO/CLOSE CMBT/HEAD ON/P)")
MiG_29A:define3PosTumb("RADAR_CONTROLS_ILLUMINATION_SWITCH", devices.INPUT_PANEL, 3029, 296, PUR_31, "Radar Illumination Switch (OFF/DUMMY/ILLUM)")
MiG_29A:define3PosTumb("RADAR_CONTROLS_ECCM_SWITCH", devices.INPUT_PANEL, 3031, 299, PUR_31, "Radar ECCM Counteraction Switch (CAJ/OFF/AJ)")
MiG_29A:defineToggleSwitch("RADAR_CONTROLS_TWF_SWITCH", devices.INPUT_PANEL, 3023, 298, PUR_31, "Radar TWF Switch (FHS/RHS)")
MiG_29A:defineToggleSwitch("RADAR_CONTROLS_COMPENSATION_SWITCH", devices.INPUT_PANEL, 3027, 297, PUR_31, "Radar Compensation Switch")

-- HUD control pannel (With sun visor controls)

-- HDD control pannel

-- Canopy controls
local CANOPY_CONTROLS = "Canopy Controls"

MiG_29A:define3PosTumb0To1("LEFT_WALL_CANOPY_HANDLE", devices.AIR_INTERFACE, 3008, 810, CANOPY_CONTROLS, "Canopy Control Handle (CLOSE/TAXI/OPEN)")
MiG_29A:defineIndicatorLight("LEFT_WALL_CANOPY_LOCK_INDICATOR", 383, CANOPY_CONTROLS, "Canopy Lock Indicator")

-- Refueling pannel

-- EKRAN warning system

-- Voice information and warning system (VIWAS) controls

-- Left wall
local LEFT_WALL = "Left Wall"

MiG_29A:defineToggleSwitch("LEFT_WALL_EXT_STORES_SWITCH", devices.WP, 3010, 29, LEFT_WALL, "External Stores Selector Switch (INBD/OUTBD)")

-- Bottom left console auxiliary controls
local BOTTOM_LEFT_AUXILIARY = "Bottom Left Console Auxiliary Controls"

MiG_29A:definePotentiometer("LEFT_WALL_IR_VOLUME", devices.INTERCOM, 3001, 98, { 0, 1 }, BOTTOM_LEFT_AUXILIARY, "IR Volume Control Knob")
MiG_29A:defineSpringloaded_3PosTumb("LEFT_WALL_RUDDER_TRIM_SWITCH", devices.CONTROL_INTERFACE, 3001, 3002, 99, BOTTOM_LEFT_AUXILIARY, "Rudder Trim Switch (LEFT/OFF/RIGHT)")

-- Top left console auxiliary controls
local TOP_LEFT_AUXILIARY = "Top Left Console Auxiliary Controls"

MiG_29A:define3PosTumb("LEFT_WALL_TAXI_LIGHT_SWITCH", devices.EXTLIGHTS_SYSTEM, 3003, 178, TOP_LEFT_AUXILIARY, "Taxi Light Switch (OFF/TAXI/LAND LIGHT)")
MiG_29A:definePushButton("LEFT_WALL_MISSILE_EMERGENCY_JETTISON_BUTTON", devices.WP, 3004, 95, TOP_LEFT_AUXILIARY, "Emergency Missile Jettison Button")

-- Chute controls
local DRAG_CHUTE = "Drag Chute"

MiG_29A:definePushButton("CHUTE_JETTISON_BUTTON", devices.INPUT_PANEL, 3038, 243, DRAG_CHUTE, "Drag Chute Jettison Button")
MiG_29A:definePushButton("CHUTE_LAUNCH_BUTTON", devices.INPUT_PANEL, 3037, 28, DRAG_CHUTE, "Drag Chute Launch Button")

-- Mirrors

-- Landing gear controls
local LANDING_GEAR = "Landing Gear Controls"

MiG_29A:defineToggleSwitch("LANDING_GEAR_HANDLE", devices.HYDRO_INTERFACE, 3001, 80, LANDING_GEAR, "Landing Gear Handle (EXTENDED/RETRACTED)")
MiG_29A:reserveIntValue(1) -- Emergency Landing Gear Handle

-- PU-S31 Weapon settings panel
local WEAPONS_SETTINGS = "PU-S31 Weapon Settings Panel"

MiG_29A:defineToggleSwitch("WEAPON_SETTINGS_COOP_SWITCH", devices.INPUT_PANEL, 3019, 287, WEAPONS_SETTINGS, "Coop Switch (NO RETARD/COOP RETARD)")
MiG_29A:defineToggleSwitch("WEAPON_SETTINGS_AG_SWITCH", devices.INPUT_PANEL, 3015, 286, WEAPONS_SETTINGS, "A/G Mode Switch (AIR/GROUND)")
MiG_29A:defineToggleSwitch("WEAPON_SETTINGS_BOMB_JETTISON_ARM_SWITCH", devices.WP, 3008, 290, WEAPONS_SETTINGS, "Bombs Jettison Arm Switch (SAFE/ARMED)")
MiG_29A:defineToggleSwitch("WEAPON_SETTINGS_EMERGENCY_JETTISON_COVER", devices.WP, 3006, 291, WEAPONS_SETTINGS, "Emergency Jettison Button Cover")
MiG_29A:definePushButton("WEAPON_SETTINGS_EMERGENCY_JETTISON_BUTTON", devices.WP, 3005, 292, WEAPONS_SETTINGS, "Emergency Jettison Button")
MiG_29A:defineToggleSwitch("WEAPON_SETTINGS_GUIDANCE_MODE_SWITCH", devices.INPUT_PANEL, 3017, 289, WEAPONS_SETTINGS, "Guidance Mode Switch")
MiG_29A:defineToggleSwitch("WEAPON_SETTINGS_LOCK_SWITCH", devices.INPUT_PANEL, 3033, 288, WEAPONS_SETTINGS, "Lock Switch (FOE/FRIEND)")

-- Ejection handle

-- Interior Lights

-- Interior Model

-- Exterior Lights

-- Exterior Model

-- Radios

return MiG_29A
