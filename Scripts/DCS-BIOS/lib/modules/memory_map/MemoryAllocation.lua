module("MemoryAllocation", package.seeall)

--- @class MemoryAllocation
--- @field address integer the memory address
--- @field maxValue integer the maximum value stored at this memory location
--- @field memoryMapEntry MemoryMapEntry the memory map entry
--- @field multiplier integer TODO
--- @field mask integer TODO
--- @field shiftBy integer TODO
--- @field value integer? the current value
local MemoryAllocation = {}

--- Creates a new memory allocation
--- @param max_value number
--- @param entry MemoryMapEntry
--- @param shift_by number
--- @param bits_required number
--- @return MemoryAllocation
function MemoryAllocation:new(max_value, entry, shift_by, bits_required)
	--- @type MemoryAllocation
	local o = {
		address = entry.address,
		maxValue = max_value,
		memoryMapEntry = entry,
		multiplier = math.pow(2, shift_by),
		mask = (math.pow(2, bits_required) - 1) * math.pow(2, shift_by),
		shiftBy = shift_by,
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
	value = math.floor(value)
	if value < 0 then
		Logg:log(string.format("Util.lua: value %f is too small for address %d mask %d", value, self.address, self.mask))
		return
	end
	if value > self.maxValue then
		Logg:log(string.format("Util.lua: value %f is too large for address %d mask %d", value, self.address, self.mask))
		return
	end
	assert(value >= 0)
	assert(value <= self.maxValue)
	if self.value ~= value then
		self.value = value
		self.memoryMapEntry.dirty = true
	end
end

return MemoryAllocation
