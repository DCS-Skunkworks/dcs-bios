module("VariableStepInput", package.seeall)

local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")

--- @class VariableStepInput: SetStateInput
--- @field suggested_step integer
local VariableStepInput = {}

--- TODO
--- @param suggestedStep number
--- @param maxValue number
--- @param description string
--- @return VariableStepInput
function VariableStepInput:new(suggestedStep, maxValue, description)
	assert(suggestedStep ~= nil)
	assert(maxValue ~= nil)
	assert(description ~= nil)

	--- @type VariableStepInput
	local o = {
		interface = InputType.variable_step,
		suggested_step = suggestedStep,
		max_value = maxValue,
		description = description,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return VariableStepInput
