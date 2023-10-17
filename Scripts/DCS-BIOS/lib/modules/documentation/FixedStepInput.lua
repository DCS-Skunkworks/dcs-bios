module("FixedStepInput", package.seeall)

local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")

--- @class FixedStepInput: Input
local FixedStepInput = {}

--- TODO
--- @param description string
--- @return FixedStepInput
function FixedStepInput:new(description)
	assert(description ~= nil)

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
