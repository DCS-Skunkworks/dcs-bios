module("MemoryMapEntry", package.seeall)

local MemoryAllocation = require("Scripts.DCS-BIOS.lib.modules.memory_map.MemoryAllocation")

--- @class MemoryMapEntry
--- @field address number the memory address of the entry
--- @field private allocatedBitCounter integer the number of bits currently allocated
--- @field dirty boolean whether any value in the entry has changed since the last update
--- @field allocations MemoryAllocation[] TODO is this just memoryallocation? what about stringallocation?
local MemoryMapEntry = {}

--- Creates a new memory map entry
--- @param address number the memory address
--- @return MemoryMapEntry
function MemoryMapEntry:new(address)
	--- @type MemoryMapEntry
	local o = {
		address = address,
		allocatedBitCounter = 0,
		dirty = false,
		allocations = {},
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

function MemoryMapEntry:getValue()
	local ret = 0
	for _, alloc in ipairs(self.allocations) do
		if alloc.value ~= nil then
			ret = ret + (alloc.value * alloc.multiplier)
		end
	end
	return ret
end

function MemoryMapEntry:setDirtyIfAble()
	for _, alloc in ipairs(self.allocations) do
		if alloc.value ~= nil then
			self.dirty = true
			return
		end
	end
end

--- Allocates space in this entry to store a value which is less than or equal to the provided max value
--- @param max_value integer the maximum value that will be stored in this space
--- @param debug_name string? the human-readable name to display for this allocation in logs
--- @return MemoryAllocation allocation the new memory allocation for the provided value
function MemoryMapEntry:allocate(max_value, debug_name)
	assert(self:canAllocate(max_value))
	local bits_required = MemoryMapEntry.bitsRequiredForValue(max_value)
	local shift_by = self.allocatedBitCounter
	local alloc = MemoryAllocation:new(max_value, self, shift_by, bits_required, debug_name)
	self.allocatedBitCounter = self.allocatedBitCounter + bits_required
	table.insert(self.allocations, alloc)
	return alloc
end

--- Determines whether the entry has enough space available to allocate more for a given max value
--- @param max_value integer the maximum value that will be stored
--- @return boolean can_allocate whether the entry has space available to allocate for the provided max value
function MemoryMapEntry:canAllocate(max_value)
	local bits_required = MemoryMapEntry.bitsRequiredForValue(max_value)
	return (16 - self.allocatedBitCounter) >= bits_required
end

--- Determines whether the entry has enough space available to allocate a string character
--- @param first_character boolean whether the character to be allocated is the first character of a string
--- @return boolean can_allocate whether the entry has space available to allocate a string character
function MemoryMapEntry:canAllocateStringCharacter(first_character)
	if first_character then
		return self.allocatedBitCounter == 0
	end -- the first character of a string must start at 0
	return self.allocatedBitCounter == 0 or self.allocatedBitCounter == 8 -- if it's not the first character, we can double up if needed
end

--- @private
function MemoryMapEntry.bitsRequiredForValue(max_value)
	return math.ceil(MemoryMapEntry.log2(max_value + 1))
end

--- @private
function MemoryMapEntry.log2(n)
	return math.log(n) / math.log(2)
end

return MemoryMapEntry
