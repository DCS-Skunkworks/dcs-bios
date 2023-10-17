module("StringOutput", package.seeall)

local OutputType = require("Scripts.DCS-BIOS.lib.modules.documentation.OutputType")

--- @class StringOutput: Output
--- @field max_length integer
local StringOutput = {}

--- TODO
--- @param allocation StringAllocation
--- @param suffix Suffix
--- @param description string
--- @return StringOutput
function StringOutput:new(allocation, suffix, description)
	assert(allocation ~= nil)
	assert(suffix ~= nil)
	assert(description ~= nil)

	--- @type StringOutput
	local o = {
		max_length = allocation.maxLength,
		address = allocation.address,
		suffix = suffix,
		description = description,
		type = OutputType.string,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return StringOutput
