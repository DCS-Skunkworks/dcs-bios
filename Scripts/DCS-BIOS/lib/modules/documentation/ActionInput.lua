module("ActionInput", package.seeall)

local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")

--- @class ActionInput: Input
--- @field argument ActionArgument
local ActionInput = {}

--- TODO
--- @param argument ActionArgument
--- @param description string
--- @return ActionInput
function ActionInput:new(argument, description)
	assert(argument ~= nil)
	assert(description ~= nil)

	--- @type ActionInput
	local o = {
		interface = InputType.action,
		argument = argument,
		description = description,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return ActionInput
