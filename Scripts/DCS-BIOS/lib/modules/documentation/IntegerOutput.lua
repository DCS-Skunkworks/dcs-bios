module("IntegerOutput", package.seeall)

local OutputType = require("OutputType")

--- @class IntegerOutput: Output
--- @field mask integer
--- @field max_value integer
--- @field shift_by integer
local IntegerOutput = {}

--- TODO
--- @param allocation MemoryAllocation
--- @param suffix Suffix
--- @param description string
--- @return IntegerOutput
function IntegerOutput:new(allocation, suffix, description)
	--- @type IntegerOutput
	local o = {
		mask = allocation.mask,
		max_value = allocation.maxValue,
		shift_by = allocation.shiftBy,
		address = allocation.address,
		suffix = suffix,
		description = description,
		type = OutputType.integer,
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

return IntegerOutput
