module("FixedStepInput", package.seeall)

local InputType = require("InputType")

--- @class FixedStepInput: Input
local FixedStepInput = {}

--- TODO
--- @param description string
--- @return FixedStepInput
function FixedStepInput:new(description)
	--- @type FixedStepInput
	local o = {
		interface = InputType.fixed_step,
		description = description,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return FixedStepInput
