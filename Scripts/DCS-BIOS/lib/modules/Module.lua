module("Module", package.seeall)

local ActionArgument = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionArgument")
local ActionInput = require("Scripts.DCS-BIOS.lib.modules.documentation.ActionInput")
local ApiVariant = require("Scripts.DCS-BIOS.lib.modules.documentation.ApiVariant")
local Control = require("Scripts.DCS-BIOS.lib.modules.documentation.Control")
local ControlType = require("Scripts.DCS-BIOS.lib.modules.documentation.ControlType")
local Documentation = require("Scripts.DCS-BIOS.lib.modules.documentation.Documentation")
local FixedStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.FixedStepInput")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")
local IntegerOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.IntegerOutput")
local Log = require("Scripts.DCS-BIOS.lib.common.Log")
local MemoryMap = require("Scripts.DCS-BIOS.lib.modules.memory_map.MemoryMap")
local SetStateInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStateInput")
local SetStringInput = require("Scripts.DCS-BIOS.lib.modules.documentation.SetStringInput")
local StringOutput = require("Scripts.DCS-BIOS.lib.modules.documentation.StringOutput")
local Suffix = require("Scripts.DCS-BIOS.lib.modules.documentation.Suffix")
local VariableStepInput = require("Scripts.DCS-BIOS.lib.modules.documentation.VariableStepInput")

local function assert_min_max(array, name)
	assert(#array == 2, string.format("%s may only contain a min and max value", name))
end

--- @class Module
--- @field name string the name of the module
--- @field documentation Documentation TODO
--- @field inputProcessors { [string]: fun(value: string) } functions to run on receiving data
--- @field memoryMap MemoryMap a map of all memory allocations for sending and receiving data
--- @field exportHooks fun(dev0: CockpitDevice)[] functions to run on sending data
--- @field aircraftList string[] list of aircraft ids to export to
--- @field dev0_required boolean
local Module = {}

--- Constructs a new module
--- @param name string the name of the module
--- @param baseAddress number the starting address for all controls in this module
--- @param acftList string[] any aircraft this modules should map to
function Module:new(name, baseAddress, acftList)
	--- @type Module
	local o = {
		name = name,
		documentation = Documentation:new(),
		inputProcessors = {},
		memoryMap = MemoryMap:new(baseAddress),
		exportHooks = {},
		aircraftList = acftList,
		dev0_required = true,
	}

	setmetatable(o, self)
	self.__index = self

	return o
end

--- Reserves space in the memory map for an integer with the specified max value
---@param max_value integer the max value of the integer to reserve space for
function Module:reserveIntValue(max_value)
	self:allocateInt(max_value)
end

--- Reserves space in the memory map for a string with the specified length
---@param length integer the length of the string to reserve space for
function Module:reserveStringValue(length)
	self:allocateString(length)
end

--- Uses SetCommand and set_argument_value instead of performClickableAction()
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param step number the amount to increase or decrease dcs data by with each step
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param output_map string[]? an array of string values to output for inputs across the range of values, or nil if none
--- @param cycle boolean | "skiplast" true if infinite rotary, false if limited rotary, skiplast functionality unclear
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineSetCommandTumb(identifier, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local span = limits[2] - limits[1]
	local last_n = tonumber(string.format("%.0f", span / step))
	last_n = last_n or 0

	local value_enum = output_map
	if not value_enum then
		value_enum = {}
		local n = 0
		while n <= last_n do
			value_enum[#value_enum + 1] = tostring(n)
			n = n + 1
		end
	end

	local enumAlloc = self:allocateInt(last_n, identifier)
	local strAlloc = nil
	if output_map then
		local max_len = 0
		for i = 1, #output_map, 1 do
			if max_len < output_map[i]:len() then
				max_len = output_map[i]:len()
			end
		end
		strAlloc = self:allocateString(max_len, identifier)
	end

	self:addExportHook(function(dev0)
		local value = dev0:get_argument_value(arg_number)
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))

		if n > last_n then
			n = last_n
		end
		if n == last_n and cycle == "skiplast" then
			n = 0
		end
		enumAlloc:setValue(n)
		if strAlloc and output_map then
			strAlloc:setValue(output_map[n + 1])
		end
	end)

	local max_value = last_n - (cycle == "skiplast" and 1 or 0)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(max_value, "set position"),
	}, {
		IntegerOutput:new(enumAlloc, Suffix.none, "selector position"),
	}, nil)

	if output_map and strAlloc then
		control.outputs[1].suffix = Suffix.int

		local output_description = "possible values: "
		for i = 1, #output_map, 1 do
			output_description = output_description .. '"' .. output_map[i] .. '" '
		end

		control.outputs[2] = StringOutput:new(strAlloc, Suffix.str, output_description)
	end

	self:addInputProcessor(identifier, function(state)
		local value = GetDevice(0):get_argument_value(arg_number)
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))
		local new_n

		if state == "INC" then
			new_n = Module.cap(n + 1, 0, last_n, cycle)
			if cycle == "skiplast" and new_n == last_n then
				new_n = 0
			end

			GetDevice(device_id):SetCommand(command, limits[1] + step * new_n)
			GetDevice(0):set_argument_value(arg_number, limits[1] + step * new_n)
		elseif state == "DEC" then
			new_n = Module.cap(n - 1, 0, last_n, cycle)
			if cycle == "skiplast" and new_n == last_n then
				new_n = last_n - 1
			end

			GetDevice(device_id):SetCommand(command, limits[1] + step * new_n)
			GetDevice(0):set_argument_value(arg_number, limits[1] + step * new_n)
		else
			n = tonumber(string.format("%.0f", tonumber(state)))
			if n == nil then
				return
			end
			GetDevice(device_id):SetCommand(command, limits[1] + step * Module.cap(n, 0, last_n, cycle))
			GetDevice(0):set_argument_value(arg_number, limits[1] + step * Module.cap(n, 0, last_n, cycle))
		end
	end)

	self:addControl(control)

	return control
end

--- Defines a gauge from floating-point data with limits. This generally is not used in any new modules and is used in existing modules to provide the integer output of a gauge
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param output_range number[] a length-2 array with the lower and upper bounds of the output data - lower bound must be greater than or equal to zero
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineGaugeValue(identifier, arg_number, output_range, category, description)
	assert_min_max(output_range, "output_range")
	assert(output_range[1] >= 0)

	local max_value = 65535
	local alloc = self:allocateInt(max_value, identifier)
	self:addExportHook(function(dev0)
		alloc:setValue(Module.valueConvert(dev0:get_argument_value(arg_number), { 0, 1 }, output_range))
	end)

	local control = Control:new(category, ControlType.metadata, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, description),
	})
	self:addControl(control)

	return control
end

--- Adds an infitely-looping rotary, like an encoder, with a multiplier for the variable step
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param step_multiplier number the amount to multiply the variable step by when applying an input
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineVariableStepTumb(identifier, device_id, command, arg_number, step_multiplier, category, description)
	local max_value = 65535
	self:addInputProcessor(identifier, function(value)
		local delta = tonumber(value) / max_value * step_multiplier
		GetDevice(device_id):performClickableAction(command, delta)
	end)

	local alloc = self:allocateInt(max_value, identifier)

	local control = Control:new(category, ControlType.variable_step_dial, identifier, description, {
		VariableStepInput:new(3200, max_value, description),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "rotation of the knob (not the value being manipulated!)"),
	})
	self:addControl(control)

	self:addExportHook(function(dev0)
		alloc:setValue(dev0:get_argument_value(arg_number) * max_value)
	end)

	return control
end

--- @private
--- Defines a gauge from floating-point data with limits
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param max_value integer maximum possible value
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFloatValue(identifier, arg_number, max_value, limits, category, description)
	assert_min_max(limits, "limits")
	local alloc = self:allocateInt(max_value, identifier)
	self:addExportHook(function(dev0)
		alloc:setValue(Module.valueConvert(dev0:get_argument_value(arg_number), limits, { 0, max_value }))
	end)

	local control = Control:new(category, ControlType.analog_gauge, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, "gauge position"),
	})
	self:addControl(control)

	return control
end

--- Defines a gauge from floating-point data with limits
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFloat(identifier, arg_number, limits, category, description)
	assert_min_max(limits, "limits")
	return self:defineFloatValue(identifier, arg_number, 65535, limits, category, description)
end

--- Adds a new Float but only but only allocates an 8-bit int. Max value is 255
--- @param identifier string the unique identifier for the control
--- @param argument_id integer the unique identifier for the control
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:define8BitFloat(identifier, argument_id, limits, category, description)
	assert_min_max(limits, "limits")
	return self:defineFloatValue(identifier, argument_id, 255, limits, category, description)
end

--- Adds a new Float but only but only allocates an 8-bit int. Max value is 255
--- @param identifier string the unique identifier for the control
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param getter function function to call to get values from game engine
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:define8BitFloatFromGetter(identifier, getter, limits, category, description)
	-- same as defineFloat, but only allocates an 8-bit int
	assert_min_max(limits, "limits")
	local max_value = 255
	local alloc = self:allocateInt(max_value, identifier)

	self:addExportHook(function()
		alloc:setValue(Module.valueConvert(getter(), limits, { 0, max_value }))
	end)

	local control = Control:new(category, ControlType.metadata, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, description),
	})
	self:addControl(control)

	return control
end

--- Adds a new indicator light control which will enable the LED when the argument value is greater than or equal to 0.3
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineIndicatorLight(identifier, arg_number, category, description)
	return self:defineGatedIndicatorLight(identifier, arg_number, 0.3, nil, category, description)
end

--- Adds a new indicator light control which will enable the LED when the argument value is less than 0.3
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineIndicatorLightInverted(identifier, arg_number, category, description)
	return self:defineGatedIndicatorLight(identifier, arg_number, nil, 0.3, category, description)
end

--- Adds a new indicator light control with specific min and max values for enabling the light
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param min number? the inclusive minimum value required in order to turn the light on (or nil if none)
--- @param max number? the exclusive maximum value allowed in order to turn the light on (or nil if none)
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineGatedIndicatorLight(identifier, arg_number, min, max, category, description)
	local alloc = self:allocateInt(1, identifier)

	local control = Control:new(category, ControlType.led, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, "0 if light is off, 1 if light is on"),
	})
	self:addControl(control)

	self:addExportHook(function(dev0)
		local arg_value = dev0:get_argument_value(arg_number)
		local greater_than_min = (not min) or arg_value >= min
		local less_than_max = (not max) or arg_value < max
		if greater_than_min and less_than_max then
			alloc:setValue(1)
		else
			alloc:setValue(0)
		end
	end)

	return control
end

--- Adds a new push button control
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:definePushButton(identifier, device_id, command, arg_number, category, description)
	local control = self:defineTumb(identifier, device_id, command, arg_number, 1, { 0, 1 }, nil, false, category, description)
	control.api_variant = ApiVariant.momentary_last_position

	return control
end

--- Adds a push button with no outputs
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command to move the switch up or down
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineInputOnlyPushButton(identifier, device_id, command, category, description)
	return self:defineInputOnlyPushButtonWithValues(identifier, device_id, command, 1, 0, category, description)
end

--- Adds a push button with no outputs that only sends 1, with no subsequent 0
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command to move the switch up or down
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineInputOnlyPushButtonNoOff(identifier, device_id, command, category, description)
	return self:defineInputOnlyPushButtonWithValues(identifier, device_id, command, 1, nil, category, description)
end

--- Adds a push button with no outputs and specific input values
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command to move the switch up or down
--- @param on_press integer? the value to send on press, if any
--- @param on_release integer? the value to send on release, if any
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineInputOnlyPushButtonWithValues(identifier, device_id, command, on_press, on_release, category, description)
	local control = Control:new(category, ControlType.action, identifier, description, {
		ActionInput:new(ActionArgument.toggle, "Triggers the action"),
	}, {})

	self:addControl(control)

	self:addInputProcessor(identifier, function(action)
		local dev = GetDevice(device_id)
		if dev and action == ActionArgument.toggle then
			if on_press then
				dev:performClickableAction(command, on_press)
			end
			if on_release then
				dev:performClickableAction(command, on_release)
			end
		end
	end)

	return control
end

--- Adds a push button with no outputs and which sends only a single specified input on press. This is useful when no draw arg is present to evaluate the state of a control.
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command to move the switch up or down
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineInputOnlySetStatePushButton(identifier, device_id, command, category, description)
	local control = Control:new(category, ControlType.action, identifier, description, {
		SetStateInput:new(1, "Sends the command"),
	}, {})

	self:addControl(control)

	self:addInputProcessor(identifier, function(value)
		local dev = GetDevice(device_id)
		local val = tonumber(value)
		if dev and val then
			dev:performClickableAction(command, val)
		end
	end)

	return control
end

--- Adds an input-only control which performs a specific LoSetCommand with no arguments
--- @param identifier string the unique identifier for the control
--- @param iCommand ICommand the dcs icommand to move the switch up or down
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineLoSetCommand(identifier, iCommand, category, description)
	local control = Control:new(category, ControlType.action, identifier, description, {
		ActionInput:new(ActionArgument.toggle, "Triggers the action"),
	}, {})

	self:addControl(control)

	self:addInputProcessor(identifier, function(action)
		if action == ActionArgument.toggle then
			LoSetCommand(iCommand)
		end
	end)

	return control
end

--- Adds an input-only control which performs a specific LoSetCommand with no arguments
--- @param identifier string the unique identifier for the control
--- @param iCommand_off ICommand the dcs icommand to move the switch down
--- @param iCommand_on ICommand the dcs icommand to move the switch up
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineLoSetCommand2Pos(identifier, iCommand_off, iCommand_on, category, description)
	local control = Control:new(category, ControlType.action, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(1, "set the switch position -- 0 = off, 1 = on"),
	}, {})

	self:addControl(control)

	self:addInputProcessor(identifier, function(action)
		if action == "1" or action == "INC" then
			LoSetCommand(iCommand_on)
		elseif action == "0" or action == "DEC" then
			LoSetCommand(iCommand_off)
		end
	end)

	return control
end

--- Adds a new rotary potentiometer with values between 0 and 65535
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param limits number[]? a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:definePotentiometer(identifier, device_id, command, arg_number, limits, category, description)
	local max_value = 65535
	limits = limits or { 0, 1 }
	assert_min_max(limits, "limits")

	local intervalLength = limits[2] - limits[1]
	self:addInputProcessor(identifier, function(value)
		local newValue = ((GetDevice(0):get_argument_value(arg_number) - limits[1]) / intervalLength) * max_value
		if value:match("-[0-9]+") or value:match("%+[0-9]+") then
			newValue = Module.cap(newValue + tonumber(value), 0, max_value)
		elseif value:match("[0-9]+") then
			newValue = Module.cap(tonumber(value) or 0, 0, max_value)
		end

		GetDevice(device_id):performClickableAction(command, newValue / max_value * intervalLength + limits[1])
	end)

	local value = self:allocateInt(max_value, identifier)

	self:addExportHook(function(dev0)
		value:setValue(((dev0:get_argument_value(arg_number) - limits[1]) / intervalLength) * max_value)
	end)

	local control = Control:new(category, ControlType.limited_dial, identifier, description, {
		SetStateInput:new(max_value, "set the position of the dial"),
		VariableStepInput:new(3200, max_value, "turn the dial left or right"),
	}, {
		IntegerOutput:new(value, Suffix.none, "position of the potentiometer"),
	})
	self:addControl(control)

	return control
end

--- Adds a two-position toggle switch
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineToggleSwitch(identifier, device_id, command, arg_number, category, description)
	local control = self:defineTumb(identifier, device_id, command, arg_number, 1, { 0, 1 }, nil, false, category, description)

	return control
end

--- Adds a two-position toggle switch which always sends 1 as a clickable action, so long as the switch state requires a change
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineToggleSwitchToggleOnly(identifier, device_id, command, arg_number, category, description)
	local alloc = self:allocateInt(1, identifier)

	local control = Control:new(category, ControlType.action, identifier, description, {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(1, "set the switch position -- 0 = off, 1 = on"),
		ActionInput:new(ActionArgument.toggle, "toggle switch state"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "selector position"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local fromState = GetDevice(0):get_argument_value(arg_number)
		if
			toState == "TOGGLE" -- if we're toggling, then always flip
			or fromState == 0 and (toState == "1" or toState == "INC") -- flip if we're going from off to on
			or fromState == 1 and (toState == "0" or toState == "DEC") -- flip if we're going from on to off
		then
			GetDevice(device_id):performClickableAction(command, 1)
		end
	end)

	self:addExportHook(function(dev0)
		alloc:setValue(dev0:get_argument_value(arg_number))
	end)

	return control
end

--- Adds an n-position switch
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param num_positions integer the number of positions the switch has
--- @param increment number the amount to increment the dcs data by with each step of the switch
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineMultipositionSwitch(identifier, device_id, command, arg_number, num_positions, increment, category, description)
	local control = self:defineTumb(identifier, device_id, command, arg_number, increment, { 0, increment * (num_positions - 1) }, nil, false, category, description)

	return control
end

--- Adds an infitely-looping rotary, like an encoder
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineRotary(identifier, device_id, command, arg_number, category, description)
	local max_value = 65535
	self:addInputProcessor(identifier, function(value)
		GetDevice(device_id):performClickableAction(command, tonumber(value) / max_value)
	end)

	local value = self:allocateInt(max_value, identifier)

	local control = Control:new(category, ControlType.analog_dial, identifier, description, {
		VariableStepInput:new(3200, max_value, "turn the dial left or right"),
	}, {
		IntegerOutput:new(value, Suffix.knob_pos, "the rotation of the knob in the cockpit (not the value that is controlled by this knob!)"),
	}, ApiVariant.multiturn)
	self:addControl(control)

	self:addExportHook(function(dev0)
		value:setValue(dev0:get_argument_value(arg_number) * max_value)
	end)

	return control
end

--- Adds a 3-position toggle switch with dcs data values between -1 and 1
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:define3PosTumb(identifier, device_id, command, arg_number, category, description)
	local control = self:defineTumb(identifier, device_id, command, arg_number, 1, { -1, 1 }, nil, false, category, description)

	return control
end

--- Adds a fixed-step rotary device
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param step number the amount to increase or decrease dcs data by with each step
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param rel_args number[] a length-2 array with the data to send to dcs on fixed-step inputs as [DEC, INC]
--- @param output_map string[]? an array of string values to output for inputs across the range of values, or nil if none
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFixedStepTumb(identifier, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
	assert_min_max(limits, "limits")
	assert_min_max(rel_args, "rel_args")
	local control = self:defineTumb(identifier, device_id, command, arg_number, step, limits, output_map, true, category, description)
	assert(control.inputs[2].interface == "set_state") -- todo: type if necessary
	control.inputs[2] = nil
	control.control_type = ControlType.discrete_dial

	self:addFixedStepInputProcessor(identifier, device_id, command, rel_args[1], rel_args[2])

	return control
end

--- Adds a fixed-step infinitely-looping rotary which may only be incremented or decremented
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param rel_args number[] a length-2 array with the data to send to dcs on fixed-step inputs as [DEC, INC]
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFixedStepInput(identifier, device_id, command, rel_args, category, description)
	assert_min_max(rel_args, "rel_args")
	self:addFixedStepInputProcessor(identifier, device_id, command, rel_args[1], rel_args[2])
	local control = Control:new(category, ControlType.fixed_step_dial, identifier, description, {
		FixedStepInput:new("turn left or right"),
	}, {
		-- these have no output as their position is effectively irrelevant - they loop infinitely
	})
	self:addControl(control)

	return control
end

--- @private
--- Adds a fixed-step input processor
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param decrement_value number the data to send to dcs when the step is decremented
--- @param increment_value number the data to send to dcs when the step is incremented
function Module:addFixedStepInputProcessor(identifier, device_id, command, decrement_value, increment_value)
	self:addTwoCommandFixedStepInputProcessor(identifier, device_id, command, command, decrement_value, increment_value)
end

--- @private
--- Adds a fixed-step input processor
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param decrement_command integer the dcs command when decrementing
--- @param increment_command integer the dcs command when incrementing
--- @param decrement_value number the data to send to dcs when the step is decremented
--- @param increment_value number the data to send to dcs when the step is incremented
function Module:addTwoCommandFixedStepInputProcessor(identifier, device_id, decrement_command, increment_command, decrement_value, increment_value)
	self:addInputProcessor(identifier, function(state)
		if state == "DEC" then
			GetDevice(device_id):performClickableAction(decrement_command, decrement_value)
		elseif state == "INC" then
			GetDevice(device_id):performClickableAction(increment_command, increment_value)
		end
	end)
end

--- Adds a new string output based on a custom getter function
--- @param identifier string the unique identifier for the control
--- @param getter fun(dev0: CockpitDevice): string the getter function which will return a string
--- @param max_length integer the maximum length of the string
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineString(identifier, getter, max_length, category, description)
	local alloc = self:allocateString(max_length, identifier)
	self:addExportHook(function(dev0)
		local value = getter(dev0) --ammo
		if value == nil then
			error("function " .. identifier .. " is sending a nil value from its getter")
		end

		alloc:setValue(value)
	end)

	local control = Control:new(category, ControlType.display, identifier, description, {}, {
		StringOutput:new(alloc, Suffix.none, description),
	})

	self:addControl(control)

	return control
end

--- Adds a rocker switch with momentary on and off positions
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param pos_command integer the dcs command to use when moving the switch up
--- @param pos_stop_command integer the dcs command to use when moving the switch down from the up position
--- @param neg_command integer the dcs command to use when moving the switch down
--- @param neg_stop_command integer the dcs command to use when moving the switch up from the down position
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control
function Module:defineRockerSwitch(identifier, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	local alloc = self:allocateInt(2, identifier)
	self:addExportHook(function(dev0)
		local lut = { [-1] = 0, [0] = 1, [1] = 2 }
		alloc:setValue(lut[Module.round(dev0:get_argument_value(arg_number))])
	end)

	local control = Control:new(category, ControlType.selector, identifier, description, {
		SetStateInput:new(2, "set the switch position -- 0 = held left/down, 1 = centered, 2 = held right/up"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "selector position"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		if toState == "0" then
			toState = -1
		elseif toState == "1" then
			toState = 0
		elseif toState == "2" then
			toState = 1
		else
			return
		end
		local fromState = GetDevice(0):get_argument_value(arg_number)
		local dev = GetDevice(device_id)
		if dev == nil then
			return
		end

		if fromState == 0 and toState == 1 then
			dev:performClickableAction(pos_command, 1)
		end
		if fromState == 1 and toState == 0 then
			dev:performClickableAction(pos_stop_command, 0)
		end
		if fromState == 0 and toState == -1 then
			dev:performClickableAction(neg_command, -1)
		end
		if fromState == -1 and toState == 0 then
			dev:performClickableAction(neg_stop_command, 0)
		end
		if fromState == -1 and toState == 1 then
			dev:performClickableAction(neg_stop_command, 0)
			dev:performClickableAction(pos_command, 1)
		end
		if fromState == 1 and toState == -1 then
			dev:performClickableAction(pos_stop_command, 0)
			dev:performClickableAction(neg_command, -1)
		end
	end)

	return control
end

--- Defines a two-command fixed-step rotary input
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param decrement_command integer the dcs command when decrementing
--- @param increment_command integer the dcs command when incrementing
--- @param rel_args number[] a length-2 array with the data to send to dcs on fixed-step inputs as [DEC, INC]
--- @param arg_number integer the dcs argument number
--- @param step number the amount to increase or decrease dcs data by with each step
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param output_map string[]? an array of string values to output for inputs across the range of values, or nil if none
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineRadioWheel(identifier, device_id, decrement_command, increment_command, rel_args, arg_number, step, limits, output_map, category, description)
	assert_min_max(rel_args, "rel_args")
	assert_min_max(limits, "limits")
	local control = self:defineTumb(identifier, device_id, decrement_command, arg_number, step, limits, output_map, "skiplast", category, description)
	assert(control.inputs[2].interface == "set_state")
	control.inputs[2] = nil
	control.control_type = ControlType.discrete_dial

	self:addTwoCommandFixedStepInputProcessor(identifier, device_id, decrement_command, increment_command, rel_args[1], rel_args[2])

	return control
end

--- Adds a new integer output based on a custom getter function
--- @param identifier string the unique identifier for the control
--- @param draw_arg_id integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineBitFromDrawArgument(identifier, draw_arg_id, category, description)
	return self:defineIntegerFromGetter(identifier, function()
		if LoGetAircraftDrawArgumentValue(draw_arg_id) > 0 then
			return 1
		else
			return 0
		end
	end, 1, category, description)
end

--- Adds a new integer output for an external draw argument ranging between 0 and 1
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFloatFromDrawArgument(identifier, arg_number, category, description)
	return self:defineFloatFromExternalDrawArgument(identifier, arg_number, { 0, 1 }, category, description)
end

--- Adds a new integer output for an external draw argument ranging between -1 and 1
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFullRangeFloatFromExternalDrawArgument(identifier, arg_number, category, description)
	return self:defineFloatFromExternalDrawArgument(identifier, arg_number, { -1, 1 }, category, description)
end

--- Adds a new integer output for an external draw argument ranging between -1 and 1
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFloatFromExternalDrawArgument(identifier, arg_number, limits, category, description)
	return self:defineIntegerFromGetter(identifier, function()
		return Module.valueConvert(LoGetAircraftDrawArgumentValue(arg_number), limits, { 0, 65535 })
	end, 65535, category, description)
end

--- Adds a new integer output based on a custom getter function
--- @param identifier string the unique identifier for the control
--- @param getter fun(dev0: CockpitDevice): integer the getter function which will return an integer
--- @param maxValue integer the maximum value the getter will return
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineIntegerFromGetter(identifier, getter, maxValue, category, description)
	local alloc = self:allocateInt(maxValue, identifier)
	self:addExportHook(function(dev0)
		alloc:setValue(getter(dev0))
	end)

	local control = Control:new(category, ControlType.metadata, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, description),
	})
	self:addControl(control)

	return control
end

-- todo: this will be fun. this god function needs to be refactored
--- Capable of adding pretty much every fixed-step input in the game, apparently
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param step number the amount to increase or decrease dcs data by with each step
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param output_map string[]? an array of string values to output for inputs across the range of values, or nil if none
--- @param cycle boolean | "skiplast" true if infinite rotary, false if limited rotary, skiplast functionality unclear
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineTumb(identifier, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	assert_min_max(limits, "limits")
	local span = limits[2] - limits[1]
	local last_n = tonumber(string.format("%.0f", span / step))
	assert(last_n)

	local value_enum = output_map
	if not value_enum then
		value_enum = {}
		local n = 0
		while n <= last_n do
			value_enum[#value_enum + 1] = tostring(n)
			n = n + 1
		end
	end

	-- todo: the A-10C is the sole user of the "skiplast" cycle argument
	--  also apparently anything with radio wheel
	--  It's unclear if that should affect allocateInt.maxValue, so we'll leave that for the future
	local max_value = last_n - (cycle == "skiplast" and 1 or 0)
	local enumAlloc = self:allocateInt(max_value, identifier)
	local strAlloc = nil
	if output_map then
		local max_len = 0
		for i = 1, #output_map, 1 do
			if max_len < output_map[i]:len() then
				max_len = output_map[i]:len()
			end
		end
		strAlloc = self:allocateString(max_len, identifier)
	end
	self:addExportHook(function(dev0)
		local value = dev0:get_argument_value(arg_number)
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))

		if n > last_n then
			n = last_n
		end
		if n == last_n and cycle == "skiplast" then
			n = 0
		end
		enumAlloc:setValue(n)
		if output_map and strAlloc then
			strAlloc:setValue(output_map[n + 1])
		end
	end)

	local inputs = {
		FixedStepInput:new("switch to previous or next state"),
		SetStateInput:new(max_value, "set position"),
	}

	if last_n == 1 then
		table.insert(inputs, ActionInput:new(ActionArgument.toggle, "Toggle switch state"))
	end

	local int_output_suffix = output_map and strAlloc and Suffix.int or Suffix.none

	local outputs = {
		IntegerOutput:new(enumAlloc, int_output_suffix, "selector position"),
	}

	if output_map and strAlloc then
		local output_description = "possible values:"
		for i = 1, #output_map, 1 do
			output_description = string.format([[%s "%s"]], output_description, output_map[i])
		end

		table.insert(outputs, StringOutput:new(strAlloc, Suffix.str, output_description))
	end

	local control = Control:new(category, ControlType.selector, identifier, description, inputs, outputs)

	self:addControl(control)

	self:addInputProcessor(identifier, function(state)
		local value = GetDevice(0):get_argument_value(arg_number)
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))
		local new_n = n
		if state == "INC" then
			new_n = Module.cap(n + 1, 0, last_n, cycle)
			if cycle == "skiplast" and new_n == last_n then
				new_n = 0
			end

			GetDevice(device_id):performClickableAction(command, limits[1] + step * new_n)
		elseif state == "DEC" then
			new_n = Module.cap(n - 1, 0, last_n, cycle)
			if cycle == "skiplast" and new_n == last_n then
				new_n = last_n - 1
			end

			GetDevice(device_id):performClickableAction(command, limits[1] + step * new_n)
		elseif state == "TOGGLE" then
			if n == 0 then
				new_n = 1
			elseif n == 1 then
				new_n = 0
			end
			GetDevice(device_id):performClickableAction(command, limits[1] + step * new_n)
		else
			n = tonumber(string.format("%.0f", tonumber(state)))
			if n == nil then
				return
			end
			GetDevice(device_id):performClickableAction(command, limits[1] + step * Module.cap(n, 0, last_n, cycle))
		end
	end)

	return control
end

--- Adds a 3-position switch with a spring-loaded return
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param down_switch integer the dcs command to move the switch down
--- @param up_switch integer the dcs command to move the switch up
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineSpringloaded_3PosTumb(identifier, device_id, down_switch, up_switch, arg_number, category, description)
	return self:defineSpringloaded_3PosTumbWithRange(identifier, device_id, down_switch, up_switch, arg_number, { -1, 1 }, category, description)
end

--- Adds a 3-position switch with a spring-loaded return
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param down_switch integer the dcs command to move the switch down
--- @param up_switch integer the dcs command to move the switch up
--- @param arg_number integer the dcs argument number
--- @param range number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineSpringloaded_3PosTumbWithRange(identifier, device_id, down_switch, up_switch, arg_number, range, category, description)
	assert_min_max(range, "range")

	local alloc = self:allocateInt(2, identifier)

	local lower = range[1]
	local upper = range[2]
	local mid = (lower + upper) / 2

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
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)
		if dev == nil then
			return
		end
		if toState == "0" then --downSwitch
			dev:performClickableAction(down_switch, mid)
			dev:performClickableAction(up_switch, mid)
			dev:performClickableAction(down_switch, lower)
		elseif toState == "1" then --Stop
			dev:performClickableAction(down_switch, mid)
			dev:performClickableAction(up_switch, mid)
		elseif toState == "2" then --upSwitch
			dev:performClickableAction(down_switch, mid)
			dev:performClickableAction(up_switch, mid)
			dev:performClickableAction(up_switch, upper)
		end
	end)

	return control
end

--- @param seat_param_name string the name of the parameter controlling the seat index
--- @param seat_count integer the total number of seats available
--- @param description string additional information about the control
--- @return Control
function Module:defineSeatPosition(seat_param_name, seat_count, description)
	return self:defineIntegerFromGetter("SEAT_POSITION", function(_)
		return tonumber(Module.parse_cockpit_params()[seat_param_name]) or 0
	end, seat_count - 1, "Seat", description)
end

--- Defines an ejection handle switch which performs a clickable action 3 times to trigger the ejection sequence in-game
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param command integer the dcs command
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control
function Module:defineEjectionHandleSwitch(identifier, device_id, command, arg_number, category, description)
	local alloc = self:allocateInt(1)
	self:addExportHook(function(dev0)
		if dev0:get_argument_value(arg_number) < 0.5 then
			alloc:setValue(0)
		else
			alloc:setValue(1)
		end
	end)

	local control = Control:new(category, ControlType.toggle_switch, identifier, description, {
		SetStateInput:new(1, "set the switch position -- 0 = off, 1 = on"),
	}, {
		IntegerOutput:new(alloc, "", "switch position -- 0 = off, 1 = on"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local fromState = GetDevice(0):get_argument_value(arg_number)
		if fromState == 0 and toState == "1" then
			GetDevice(device_id):performClickableAction(command, 1)
			GetDevice(device_id):performClickableAction(command, 1)
			GetDevice(device_id):performClickableAction(command, 1)
		end
	end)

	return control
end

--- Defines a control with an input for setting the frequency of a radio device and an output with the current radio frequency
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param max_length integer the max length of the reported frequency
--- @param decimal_places integer the number of decimal places in the reported frequency (i.e. how far from the right to place the decimal point)
--- @param scale_factor integer the amount to multiply the frequency by when setting, or divide by when getting
--- @param description string additional information about the control
--- @return Control
function Module:defineReadOnlyRadio(identifier, device_id, max_length, decimal_places, scale_factor, description)
	return self:defineRadio(identifier, device_id, max_length, decimal_places, scale_factor, true, description)
end

--- Defines a control with an input for setting the frequency of a radio device and an output with the current radio frequency
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param max_length integer the max length of the reported frequency
--- @param decimal_places integer the number of decimal places in the reported frequency (i.e. how far from the right to place the decimal point)
--- @param scale_factor integer the amount to multiply the frequency by when setting, or divide by when getting
--- @param description string additional information about the control
--- @return Control
function Module:defineReadWriteRadio(identifier, device_id, max_length, decimal_places, scale_factor, description)
	return self:defineRadio(identifier, device_id, max_length, decimal_places, scale_factor, false, description)
end

--- @private
--- Defines a control with an input for setting the frequency of a radio device and an output with the current radio frequency
--- @param identifier string the unique identifier for the control
--- @param device_id integer the dcs device id
--- @param max_length integer the max length of the reported frequency
--- @param decimal_places integer the number of decimal places in the reported frequency (i.e. how far from the right to place the decimal point)
--- @param scale_factor integer the amount to multiply the frequency by when setting, or divide by when getting
--- @param read_only boolean whether the radio does not support set_frequency()
--- @param description string additional information about the control
--- @return Control
function Module:defineRadio(identifier, device_id, max_length, decimal_places, scale_factor, read_only, description)
	local alloc = self:allocateString(max_length, identifier)

	local inputs = read_only and {} or { SetStringInput:new("The frequency to set, with or without a decimal place") }

	local control = Control:new("Radio Frequencies", ControlType.radio, identifier, description, inputs, {
		StringOutput:new(alloc, Suffix.none, "The current frequency the radio is set to"),
	})
	self:addControl(control)

	if not read_only then
		self:addInputProcessor(identifier, function(value)
			local match_decimal = value:find("%.")
			if match_decimal then
				local decimal_padding = decimal_places - value:sub(match_decimal + 1):len()
				if decimal_padding > 0 then
					value = value .. string.rep("0", decimal_padding)
				end
				value = value:gsub("%.", "")
			end

			local freq = tonumber(value) -- convert to number

			if not freq then
				Log:log_error(string.format("Module.lua: Attempted to set nil frequency for control %s (source value %s)", identifier, value))
				return
			end

			GetDevice(device_id):set_frequency(freq * scale_factor)
		end)
	end

	self:addExportHook(function()
		local frequency = tostring(math.floor(GetDevice(device_id):get_frequency() / scale_factor)) -- frequencies like 125.375 can come in as 125375435 (it's unknown what these last 3 digits are for)
		local decimal_location = frequency:len() - decimal_places
		frequency = Functions.pad_left(frequency:sub(1, decimal_location) .. "." .. frequency:sub(decimal_location + 1), max_length)
		alloc:setValue(frequency)
	end)

	return control
end

--- Allocates space for a string to the memory map of the module
--- @param max_length integer the maximum length of the string
--- @param identifier string? the identifier of the control being allocated
--- @return StringAllocation alloc the space allocated for the string
function Module:allocateString(max_length, identifier)
	return self.memoryMap:allocateString(max_length, string.format("%s:%s", self.name, identifier or ""))
end

--- Allocates space for an integer to the memory map of the module
--- @param max_value integer the maximum value of the integer
--- @param identifier string? the identifier of the control being allocated
--- @return MemoryAllocation alloc the space allocated for the integer
function Module:allocateInt(max_value, identifier)
	return self.memoryMap:allocateInt(max_value, string.format("%s:%s", self.name, identifier or ""))
end

--- Adds an export hook to the module
--- @param func fun(dev0: CockpitDevice) callback function called when exporting data, provided with device 0
function Module:addExportHook(func)
	table.insert(self.exportHooks, func)
end

--- adds an input processor to the module
--- @param msg string
--- @param func fun(value: string)
function Module:addInputProcessor(msg, func)
	self.inputProcessors[msg] = func
end

--- @param control Control
function Module:addControl(control)
	local category = self.documentation:getOrAddCategory(control.category)

	-- todo: move this further down?
	if control.outputs then
		for _, output in ipairs(control.outputs) do
			if output.type == "integer" then -- DcsBios::IntegerBuffer
				--- @cast output IntegerOutput
				output.address_mask_shift_identifier = self:addressDefineIdentifier(control.identifier)
				if output.max_value == 1 then -- DcsBios::LED
					output.address_mask_identifier = self:addressDefineIdentifier(control.identifier) .. "_AM"
				elseif output.max_value == 65535 then -- DcsBios::ServoOutput
					output.address_identifier = self:addressDefineIdentifier(control.identifier) .. "_A"
				end
			elseif output.type == "string" then -- DcsBios::StringBuffe
				--- @cast output StringOutput
				output.address_identifier = self:addressDefineIdentifier(control.identifier) .. "_A"
			end
		end
	end

	category:addControl(control)
end

--- Creates a full identifier, including the module name, for a given identifier
--- @param identifier string
--- @return string
function Module:addressDefineIdentifier(identifier)
	local full_identifier = self.name .. "_" .. identifier
	full_identifier = full_identifier:gsub("[^A-Za-z0-9_]", "_") -- Replace all characters that are not A-Z, a-z, 0-9, or _ with _
	full_identifier = full_identifier:gsub("_+", "_") -- Replace successive underscores with a single _

	return full_identifier
end

local indication_split = "-----------------------------------------"
local children_start_block = "children are {"
local children_end_block = "}"

--- @enum ParseIndicationState
local ParseIndicationState = {
	none = "none",
	child_block = "child_block",
	item_block = "item_block",
}

--- Parses a dcs indication from a string into a key-value table
--- Values are separated with "-----------------------------------------\n"
--- @param indicator_id integer
--- @return {[string|integer]: string}
function Module.parse_indication(indicator_id)
	local ret = {}
	local indication = list_indication(indicator_id)
	--- @type ParseIndicationState[]
	local state = {}
	--- @type string?
	local key = nil
	--- @type string[]
	local current_block_lines = {}
	local total_values = 0

	---@return ParseIndicationState
	local function current_state()
		return #state > 0 and state[#state] or ParseIndicationState.none
	end

	local function add_block_to_result()
		if not key then
			return
		end

		local value = ""
		while #current_block_lines > 0 do
			if value ~= "" then
				value = value .. "\n"
			end
			value = value .. table.remove(current_block_lines, 1)
		end
		ret[key] = value -- if there's nothing, then we intentionally add an empty string
		total_values = total_values + 1
		ret[total_values] = value

		key = nil
	end

	-- state machine to process indication
	for line in string.gmatch(indication, "([^\n]+)") do
		if line == indication_split then
			-- start a new item block
			if current_state() ~= ParseIndicationState.item_block then -- don't insert this if we're already in a block - state is already accurate
				table.insert(state, ParseIndicationState.item_block)
			else
				-- write old item and start a new one
				add_block_to_result()
			end
		elseif line == children_start_block then
			-- start a new child block
			if current_state() == ParseIndicationState.item_block then
				table.remove(state)
			end
			table.insert(state, ParseIndicationState.child_block)
			add_block_to_result() -- it's unclear if these items will never have values and are only for child blocks, so we'll add it to be safe
		elseif line == children_end_block and #state > 0 then
			-- end a child block if we're in one
			if current_state() == ParseIndicationState.item_block then
				-- write old item and start a new one
				add_block_to_result()
				table.remove(state)
			end
			if current_state() == ParseIndicationState.child_block then
				table.remove(state)
			end
		elseif line and current_state() == ParseIndicationState.item_block then
			-- these are actual line contents we need to deal with
			if key then
				table.insert(current_block_lines, line)
			else
				key = line
			end
		end
	end

	if current_state() == ParseIndicationState.item_block then
		add_block_to_result()
		table.remove(state)
	end

	ret[0] = total_values

	return ret
end

--- Parses the dcs cockpit params
--- Values are separated by newlines and split by ":"
--- @return {[string]: string}
function Module.parse_cockpit_params()
	local ret = {}
	local params = list_cockpit_params()

	for line in string.gmatch(params, "([^\n]+)") do
		local key = {}

		-- some entries are things like ExternalFM:HumanInfo:FinMx:0.000000, so we need to be able to handle colons in the keys
		while true do
			local separator_index = line:find(":")
			if separator_index == nil then
				break
			end

			local start = line:sub(1, separator_index - 1)
			table.insert(key, start)
			line = line:sub(separator_index + 1)
		end

		ret[table.concat(key, ":")] = line
	end

	return ret
end

--- Returns a vlue that is between the limits provided
--- @param value integer the value to cap
--- @param min_value integer the minimum value to return
--- @param max_value integer the maximum value to return
--- @param cycle boolean | "skiplast" | nil whether to roll values over which are outside the bounds (so values below min return max and vice-versa)
--- @return integer
function Module.cap(value, min_value, max_value, cycle)
	if cycle then
		if value < min_value then
			return max_value
		end
		if value > max_value then
			return min_value
		end
	else
		if value <= min_value then
			return min_value
		end
		if value >= max_value then
			return max_value
		end
	end
	return value
end

--- rounds a number because that's too difficult for the built-in math library
--- taken from https://stackoverflow.com/a/26777901
--- @param num number the number to round
--- @return integer number the rounded number
function Module.round(num)
	return num >= 0 and math.floor(num + 0.5) or math.ceil(num - 0.5)
end

--- rounds a number to certain decimal place
--- @param num number the number to round
--- @param decimal_places integer
--- @return number
function Module.round2(num, decimal_places)
	return tonumber(string.format("%." .. (decimal_places or 0) .. "f", num)) or 0
end

--- Maps value to from input_range to output_range
--- @param argument_value number the number to map
--- @param input_range number[] a length-2 array of the range of the input value
--- @param output_range number[] a length-2 array of the range the value should be mapped to
--- @return number
function Module.valueConvert(argument_value, input_range, output_range)
	assert_min_max(input_range, "input_range")
	assert_min_max(output_range, "output_range")

	-- if we're close enough to our input range, snap to that value
	-- this helps avoid out of range issues mapping from small input ranges to large output ranges
	local epsilon = 0.000072 -- for the smallest known range in dcs {0.822, 0.75} -> 0.072, this is about 0.1%

	local input_min = input_range[1]
	local input_max = input_range[2]
	local output_min = output_range[1]
	local output_max = output_range[2]

	if math.abs(argument_value - input_min) < epsilon then
		return output_min
	end
	if math.abs(argument_value - input_max) < epsilon then
		return output_max
	end

	local slope = 1.0 * (output_max - output_min) / (input_max - input_min)
	return output_min + slope * (argument_value - input_min)
end

--- Returns an integer from individual arguments ordered from least to most significant digit
--- @param dev0 CockpitDevice dcs device 0
--- @param arguments integer[] dcs arguments
--- @return integer
function Module.build_gauge_from_arguments(dev0, arguments)
	local result = 0

	for index, value in ipairs(arguments) do
		local arg_value = Module.round(dev0:get_argument_value(value) * 10) % 10 -- treat 10 as 0
		result = result + arg_value * math.pow(10, index - 1)
	end

	return result
end

return Module
