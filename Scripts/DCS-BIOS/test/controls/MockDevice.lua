module("MockDevice", package.seeall)

--- @class MockDevice: CockpitDevice
--- @field value number the value that should be returned on the mocked call to get_argument_value
--- @field clickable_actions {[integer]: number}[] a cache of clickable action calls that have been made
--- @field set_commands {[integer]: number}[] a cache of SetCommand calls that have been made
--- @field set_arguments {[integer]: number}[] a cache of set argument calls that have been made
--- @field set_frequencies number[] a cache of set frequency calls that have been made
--- @field current_frequency number the current frequency
MockDevice = {
	value = 0,
	clickable_actions = {},
	set_commands = {},
	set_arguments = {},
	set_frequencies = {},
	current_frequency = 0,
}
--- Constructs a new mock cockpit device
--- @param value number the value that should be returned on the mocked call to get_argument_value
function MockDevice:new(value)
	--- @type MockDevice
	local o = {
		value = value,
		clickable_actions = {},
		set_commands = {},
		set_arguments = {},
		set_frequencies = {},
		current_frequency = 0,
	}

	setmetatable(o, self)
	self.__index = self

	return o
end

--- Mock of get a value of an argument. Returns mock value
--- @param argument_id integer
--- @returns number
function MockDevice:get_argument_value(argument_id)
	return self.value
end

-- noop
function MockDevice:update_arguments() end

--- Makes the device perform an action
--- @param command_id integer
--- @param argument number
function MockDevice:performClickableAction(command_id, argument)
	table.insert(self.clickable_actions, { [command_id] = argument })
end

--- Executes SetCommand on a device
--- @param command_id integer
--- @param value number
function MockDevice:SetCommand(command_id, value)
	table.insert(self.set_commands, { [command_id] = value })
end

--- Sets argument value
--- @param argument_id integer
--- @param value number
function MockDevice:set_argument_value(argument_id, value)
	table.insert(self.set_arguments, { [argument_id] = value })
end

--- Sets a frequency
--- @param value number
function MockDevice:set_frequency(value)
	table.insert(self.set_frequencies, value)
	self.current_frequency = value
end

--- Gets the device's frequency
--- @return number frequency
function MockDevice:get_frequency()
	return self.current_frequency
end

return MockDevice
