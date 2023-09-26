module("Module", package.seeall)

local ActionArgument = require("ActionArgument")
local ActionInput = require("ActionInput")
local ApiVariant = require("ApiVariant")
local Control = require("Control")
local ControlType = require("ControlType")
local Documentation = require("Documentation")
local FixedStepInput = require("FixedStepInput")
local IntegerOutput = require("IntegerOutput")
local MemoryMap = require("MemoryMap")
local MomentaryPositions = require("MomentaryPositions")
local PhysicalVariant = require("PhysicalVariant")
local SetStateInput = require("SetStateInput")
local StringOutput = require("StringOutput")
local Suffix = require("Suffix")
local VariableStepInput = require("VariableStepInput")

--- @class Module
--- @field name string the name of the module
--- @field documentation Documentation TODO
--- @field inputProcessors { [string]: fun(value: string) } functions to run on receiving data
--- @field memoryMap MemoryMap a map of all memory allocations for sending and receiving data
--- @field exportHooks fun(value: any)[] functions to run on sending data
--- @field aircraftList string[] list of aircraft ids to export to
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
	}

	setmetatable(o, self)
	self.__index = self

	return o
end

--- Defines a gauge from floating-point data with limits
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param limits number[] a length-2 array with the lower and upper bounds of the data as used in dcs
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFloat(identifier, arg_number, limits, category, description)
	local intervalLength = limits[2] - limits[1]
	local max_value = 65535
	local alloc = self:allocateInt(max_value)

	self:addExportHook(function(dev0)
		alloc:setValue(((dev0:get_argument_value(arg_number) - limits[1]) / intervalLength) * max_value)
	end)

	-- todo: almost identical to below for allocating an int, just different descriptions?
	local control = Control:new(category, ControlType.analog_gauge, identifier, description, {}, {
		IntegerOutput:new(alloc, Suffix.none, "gauge position"),
	})
	self:addControl(control)

	return control
end

--- Adds a new indicator light control
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineIndicatorLight(identifier, arg_number, category, description)
	local value = self:allocateInt(1)

	assert(value.shiftBy ~= nil)
	self:addExportHook(function(dev0)
		if dev0:get_argument_value(arg_number) < 0.3 then
			value:setValue(0)
		else
			value:setValue(1)
		end
	end)

	local control = Control:new(category, ControlType.led, identifier, description, {}, {
		IntegerOutput:new(value, Suffix.none, "0 if light is off, 1 if light is on"),
	})
	self:addControl(control)

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
	control.physical_variant = PhysicalVariant.push_button
	control.api_variant = ApiVariant.momentary_last_position

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
	if limits == nil then
		limits = { 0, 1 }
	end
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

	local value = self:allocateInt(max_value)

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
	control.physical_variant = PhysicalVariant.toggle_switch

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
	control.physical_variant = PhysicalVariant.toggle_switch

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

	local value = self:allocateInt(max_value)

	local control = Control:new(category, ControlType.analog_dial, identifier, description, {
		VariableStepInput:new(3200, max_value, "turn the dial left or right"),
	}, {
		IntegerOutput:new(value, Suffix.knob_pos, "the rotation of the knob in the cockpit (not the value that is controlled by this knob!)"),
	}, nil, nil, ApiVariant.multiturn)
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
	control.physical_variant = PhysicalVariant.three_position_switch

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

--- Adds a new integer output based on a custom getter function
--- @param identifier string the unique identifier for the control
--- @param arg_number integer the dcs argument number
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineFloatFromDrawArgument(identifier, arg_number, category, description)
	return self:defineIntegerFromGetter(identifier, function()
		return math.floor(LoGetAircraftDrawArgumentValue(arg_number) * 65535)
	end, 65535, category, description)
end

--- Adds a new integer output based on a custom getter function
--- @param identifier string the unique identifier for the control
--- @param getter fun(): integer the getter function which will return an integer
--- @param maxValue integer the maximum value the getter will return
--- @param category string the category in which the control should appear
--- @param description string additional information about the control
--- @return Control control the control which was added to the module
function Module:defineIntegerFromGetter(identifier, getter, maxValue, category, description)
	local alloc = self:allocateInt(maxValue)
	self:addExportHook(function(_)
		alloc:setValue(getter())
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
	local enumAlloc = self:allocateInt(max_value)
	local strAlloc = nil
	if output_map then
		local max_len = 0
		for i = 1, #output_map, 1 do
			if max_len < output_map[i]:len() then
				max_len = output_map[i]:len()
			end
		end
		strAlloc = self:allocateString(max_len)
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

	local variant = cycle and PhysicalVariant.infinite_rotary or PhysicalVariant.limited_rotary

	local control = Control:new(category, ControlType.selector, identifier, description, inputs, outputs, MomentaryPositions.none, variant)

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
	local alloc = self:allocateInt(2)
	self:addExportHook(function(dev0)
		local val = dev0:get_argument_value(arg_number)
		if val == -1 then
			alloc:setValue(0)
		elseif val == 0 then
			alloc:setValue(1)
		elseif val == 1 then
			alloc:setValue(2)
		end
	end)

	local control = Control:new(category, ControlType.three_pos_two_command_switch_open_close, identifier, description, {
		SetStateInput:new(2, "set the switch position"),
	}, {
		IntegerOutput:new(alloc, Suffix.none, "switch position -- 0 = Down, 1 = Mid,  2 = Up"),
	})

	self:addControl(control)

	self:addInputProcessor(identifier, function(toState)
		local dev = GetDevice(device_id)
		if toState == "0" then --downSwitch
			dev:performClickableAction(down_switch, 0)
			dev:performClickableAction(up_switch, 0)
			dev:performClickableAction(down_switch, -1)
		elseif toState == "1" then --Stop
			dev:performClickableAction(down_switch, 0)
			dev:performClickableAction(up_switch, 0)
		elseif toState == "2" then --upSwitch
			dev:performClickableAction(down_switch, 0)
			dev:performClickableAction(up_switch, 0)
			dev:performClickableAction(up_switch, 1)
		end
	end)

	return control
end

--- Allocates space for a string to the memory map of the module
--- @param max_length integer the maximum length of the string
--- @return StringAllocation alloc the space allocated for the string
function Module:allocateString(max_length)
	return self.memoryMap:allocateString(max_length)
end

--- Allocates space for an integer to the memory map of the module
--- @param max_value integer the maximum value of the integer
--- @return MemoryAllocation alloc the space allocated for the integer
function Module:allocateInt(max_value)
	return self.memoryMap:allocateInt(max_value)
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

--- @private
--- @param control Control
function Module:addControl(control)
	local category = self.documentation:getOrAddCategory(control.category)

	-- todo: move this further down?
	if control.outputs then
		for _, output in ipairs(control.outputs) do
			output.address_identifier = self:addressDefineIdentifier(control.identifier)
			output.address_only_identifier = self:addressDefineIdentifier(control.identifier) .. "_ADDR"
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

return Module
