module("SetStringInput", package.seeall)

local InputType = require("InputType")

--- @class SetStringInput: Input
local SetStringInput = {}

--- An input which takes in a string value
--- @param description string
--- @return SetStringInput
function SetStringInput:new(description)
	--- @type SetStringInput
	local o = {
		interface = InputType.set_string,
		description = description,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return SetStringInput
