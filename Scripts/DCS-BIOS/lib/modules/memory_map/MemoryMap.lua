module("MemoryMap", package.seeall)

local MemoryMapEntry = require("Scripts.DCS-BIOS.lib.modules.memory_map.MemoryMapEntry")
local StringAllocation = require("Scripts.DCS-BIOS.lib.modules.memory_map.StringAllocation")

--- @class MemoryMap
--- @field baseAddress number the base address
--- @field lastAddress number TODO
--- @field autosyncPosition number TODO
--- @field entries { [number]: MemoryMapEntry } TODO
local MemoryMap = {}

--- Constructs a new memory map
--- @param baseAddress number the base address
--- @return MemoryMap
function MemoryMap:new(baseAddress)
	--- @type MemoryMap
	local o = {
		baseAddress = baseAddress,
		lastAddress = baseAddress,
		autosyncPosition = baseAddress,
		entries = {
			[baseAddress] = MemoryMapEntry:new(baseAddress),
		},
	}

	setmetatable(o, self)
	self.__index = self
	return o
end

function MemoryMap:autosyncStep()
	-- set a non-dirty value to dirty
	self.autosyncPosition = self.autosyncPosition + 2
	if self.autosyncPosition > self.lastAddress then
		self.autosyncPosition = self.baseAddress -- wrap around
	end
	local entry = self:getOrAddEntry(self.autosyncPosition)
	entry:setDirtyIfAble()
end

--- Gets all data that has been written and resets the dirty bit, marking it as read
--- @return string
function MemoryMap:flushData()
	-- Return a string containing a sequence of write accesses
	-- that contain all entries marked as dirty.
	-- Resets the "dirty bit".

	local ret = ""

	local address = self.baseAddress
	local entry = self:getOrAddEntry(address)

	-- advance to the first entry that has changed
	while address <= self.lastAddress do
		entry = self:getOrAddEntry(address)
		if entry.dirty then
			break
		end
		address = address + 2
	end
	if not entry.dirty then
		-- no changes at all
		return ""
	end

	-- prepare write access
	local writeStartAddress = address
	local writeLength = 2
	local writeData = MemoryMap.encodeInt(entry:getValue())
	local lastWriteDataAddress = address
	entry.dirty = false
	address = address + 2

	while address <= self.lastAddress do
		entry = self:getOrAddEntry(address)
		-- advance to the next changed value
		if entry.dirty then
			-- figure out whether to start a new write request
			if (address - lastWriteDataAddress <= 6) and entry:getValue() ~= 0x5555 then
				-- append to current write request
				local a = lastWriteDataAddress + 2
				while a <= address do
					writeLength = writeLength + 2
					writeData = writeData .. MemoryMap.encodeInt(self:getOrAddEntry(a):getValue())
					a = a + 2
				end
				lastWriteDataAddress = address
				assert(address == a - 2)
			else
				-- start new write request
				ret = ret .. MemoryMap.encodeInt(writeStartAddress) .. MemoryMap.encodeInt(writeLength) .. writeData
				writeStartAddress = address
				writeLength = 2
				writeData = MemoryMap.encodeInt(entry:getValue())
				lastWriteDataAddress = address
			end
			entry.dirty = false
		end
		address = address + 2
	end

	return ret .. MemoryMap.encodeInt(writeStartAddress) .. MemoryMap.encodeInt(writeLength) .. writeData
end

--- Retrieves an existing memory map entry for a given address, or creates a new one
--- @param address integer the memory address for which to retrieve an entry
--- @return MemoryMapEntry
function MemoryMap:getOrAddEntry(address)
	if self.entries[address] == nil then
		-- initialize new entry
		self.entries[address] = MemoryMapEntry:new(address)
		self.lastAddress = address
	end
	return self.entries[address]
end

--- Sets the values of all allocations within the map to nil
function MemoryMap:clearValues()
	for _, entry in pairs(self.entries) do
		for _, alloc in pairs(entry.allocations) do
			alloc.value = nil
			-- alloc.dirty = false -- TODO: seems unused?
		end
	end
end

--- Allocates space for a new integer value
--- @param max_value integer
--- @param debug_name string? the human-readable name to display for this allocation in logs
--- @return MemoryAllocation allocation the newly-created memory allocation
function MemoryMap:allocateInt(max_value, debug_name)
	return self:allocateData(max_value, false, false, debug_name)
end

--- Allocates space for a new string value
--- @param max_length number the max length of the string
--- @param debug_name string? the human-readable name to display for this allocation in logs
--- @return StringAllocation
function MemoryMap:allocateString(max_length, debug_name)
	--- @type MemoryAllocation[]
	local character_allocations = {}

	character_allocations[1] = self:allocateData(255, true, true, debug_name)
	for i = 2, max_length, 1 do
		character_allocations[i] = self:allocateData(255, true, false, debug_name)
	end

	return StringAllocation:new(character_allocations, max_length, debug_name)
end

--- @private
--- Allocates space in the memory map for data whose value may be between 0 and max_value
--- @param max_value integer the maximum integer value stored in the memory allocation
--- @param is_string_character boolean whether the space is being allocated for a string character
--- @param first_string_character boolean whether this is the first character of a string
--- @param debug_name string? the human-readable name to display for this allocation in logs
--- @return MemoryAllocation
function MemoryMap:allocateData(max_value, is_string_character, first_string_character, debug_name)
	-- allocate space for an integer value from 0 to maxValue in the memory map
	-- returns a MemoryAllocation object that has a setValue() method
	-- if is_string_character is true, the allocation will be in a byte-aligned
	-- position at the end of the memory map. Consecutive calls with is_string_character
	-- set will allocate consecutive bytes in the memory map.

	local address
	if is_string_character then
		address = self.lastAddress
	else
		address = self.baseAddress
	end

	while true do
		local entry = self:getOrAddEntry(address)

		if
			entry:canAllocate(max_value) -- make sure we have space for the value
			and ((not is_string_character) or entry:canAllocateStringCharacter(first_string_character)) -- string characters have special rules
		then
			-- found an entry that has enough space for the number of bits we want to allocate
			return entry:allocate(max_value, debug_name)
		else
			address = address + 2
		end
	end
end

--- @private
function MemoryMap.encodeInt(intval)
	assert(intval >= 0)
	assert(intval <= 65535)
	-- convert value (a float from 0.0 to 1.0) to a 16-bit signed integer from 0 to 65535
	local lowbyte = intval % 256
	local highbyte = (intval - lowbyte) / 256
	return string.char(lowbyte, highbyte)
end

return MemoryMap
