module("MockDevice", package.seeall)

--- @class MockDevice: CockpitDevice
--- @field value number the value that should be returned on the mocked call to get_argument_value
--- @field clickable_actions {[integer]: number}[] a cache of clickable action calls that have been made
MockDevice = {
	value = 0,
	clickable_actions = {},
}
--- Constructs a new mock cockpit device
--- @param value number the value that should be returned on the mocked call to get_argument_value
function MockDevice:new(value)
	--- @type MockDevice
	local o = {
		value = value,
		clickable_actions = {},
	}

	setmetatable(o, self)
	self.__index = self

	return o
end

function MockDevice:get_argument_value(device_id)
	return self.value
end

--- Makes the device perform an action
--- @param command_id integer
--- @param argument number
function MockDevice:performClickableAction(command_id, argument)
	table.insert(self.clickable_actions, { [command_id] = argument })
end

return MockDevice
