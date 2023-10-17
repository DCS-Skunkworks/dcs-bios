module("SetStringInput", package.seeall)

local InputType = require("Scripts.DCS-BIOS.lib.modules.documentation.InputType")

--- @class SetStringInput: Input
local SetStringInput = {}

--- An input which takes in a string value
--- @param description string
--- @return SetStringInput
function SetStringInput:new(description)
	assert(description ~= nil)

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
