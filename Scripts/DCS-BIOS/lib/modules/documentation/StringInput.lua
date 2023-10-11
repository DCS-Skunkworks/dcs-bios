module("StringInput", package.seeall)

local InputType = require("InputType")

--- @class StringInput: Input
local StringInput = {}

--- An input which takes in a string value
--- @param description string
--- @return StringInput
function StringInput:new(description)
	--- @type StringInput
	local o = {
		interface = InputType.string,
		description = description,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return StringInput
