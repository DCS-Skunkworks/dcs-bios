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

	-- check if value is close enough to our min/max that it could be a rounding error
	local clean_value = self:clean_value(value)

	clean_value = math.floor(clean_value)
	if clean_value < 0 or clean_value > self.maxValue then
		Log:log_memory_error(self.debug_name or "n/a", value, self.maxValue, clean_value, self.address, self.mask)
		return
	else
		Log:reset_control_memory_errors(self.debug_name or "n/a")
	end

	assert(clean_value >= 0)
	assert(clean_value <= self.maxValue)
	if self.value ~= clean_value then
		self.value = clean_value
		self.memoryMapEntry.dirty = true
	end
end

function MemoryAllocation:clean_value(value)
	local THRESHOLD = 0.01 -- within 1% is fine

	if value < 0 then
		return math.abs(value) / self.maxValue < THRESHOLD and 0 or value
	elseif value > self.maxValue then
		return (value - self.maxValue) / self.maxValue < THRESHOLD and self.maxValue or value
	end

	return value
end

return MemoryAllocation
