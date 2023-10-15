module("MemoryAllocation", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")

--- @class MemoryAllocation
--- @field address integer the memory address
--- @field maxValue integer the maximum value stored at this memory location
--- @field memoryMapEntry MemoryMapEntry the memory map entry
--- @field multiplier integer TODO
--- @field mask integer TODO
--- @field shiftBy integer TODO
--- @field value integer? the current value
--- @field private debug_name? string the human-readable name to display for this allocation in logs
local MemoryAllocation = {}

--- Creates a new memory allocation
--- @param max_value number
--- @param entry MemoryMapEntry
--- @param shift_by number
--- @param bits_required number
--- @param debug_name string? the human-readable name to display for this allocation in logs
--- @return MemoryAllocation
function MemoryAllocation:new(max_value, entry, shift_by, bits_required, debug_name)
	--- @type MemoryAllocation
	local o = {
		address = entry.address,
		maxValue = max_value,
		memoryMapEntry = entry,
		multiplier = math.pow(2, shift_by),
		mask = (math.pow(2, bits_required) - 1) * math.pow(2, shift_by),
		shiftBy = shift_by,
		debug_name = debug_name,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Stores a new value in the current memory allocation
--- @param value number?
function MemoryAllocation:setValue(value)
	-- ignore nil values (on MP servers with player export disabled, some values are not available)
	if value == nil then
		return
	end
	if value ~= value then
		-- check for NaN (Not a Number)
		return
	end
	assert(self.maxValue)
	assert(value)

	-- check if value is close enough to our min that it could be a rounding error
	local clean_value = value < 0 and value + 0.01 >= 0 and 0 or value

	clean_value = math.floor(clean_value)
	if clean_value < 0 then
		Log:log_error(string.format("MemoryAllocation.lua: value %f (originally %f) is too small for %s (address %d mask %d)", clean_value, value, self.debug_name or "n/a", self.address, self.mask))
		return
	end
	if clean_value > self.maxValue then
		Log:log_error(string.format("MemoryAllocation.lua: value %f (originally %f) is larger than max %d for %s (address %d mask %d)", clean_value, value, self.maxValue, self.debug_name or "n/a", self.address, self.mask))
		return
	end
	assert(clean_value >= 0)
	assert(clean_value <= self.maxValue)
	if self.value ~= clean_value then
		self.value = clean_value
		self.memoryMapEntry.dirty = true
	end
end

return MemoryAllocation
