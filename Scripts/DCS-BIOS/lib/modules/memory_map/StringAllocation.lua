module("StringAllocation", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")

--- @class StringAllocation A class containing a set of memory allocations which make up a string
--- @field address integer the memory address
--- @field maxLength integer the maximum length of the string
--- @field characterAllocations MemoryAllocation[] the memory allocations which make up the string
--- @field debug_name string? the human-readable name to display for this allocation in logs
local StringAllocation = {}

--- Constructs a new StringAllocation
--- @param characterAllocations MemoryAllocation[] the memory allocations which make up the string
--- @param max_length integer the maximum length of the string
--- @param debug_name string? the human-readable name to display for this allocation in logs
--- @return StringAllocation
function StringAllocation:new(characterAllocations, max_length, debug_name)
	--- @type StringAllocation
	local o = {
		address = characterAllocations[1].address,
		maxLength = max_length,
		characterAllocations = characterAllocations,
		debug_name = debug_name,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Updates the constituent memory allocations to store the provided string
--- @param value string the new value to store
function StringAllocation:setValue(value)
	local i = 1

	if value == nil then
		local address_start = self.characterAllocations[1].address
		local address_end = self.characterAllocations[#self.characterAllocations].address
		Log:log_error(string.format("StringAllocation.lua: string for %s is sending a nil value (%d:%d)", self.debug_name or "n/a", address_start, address_end))
		return
	end

	while i <= value:len() and i <= #self.characterAllocations do
		self.characterAllocations[i]:setValue(value:byte(i))
		i = i + 1
	end
	while i <= #self.characterAllocations do
		self.characterAllocations[i]:setValue(32) -- space
		i = i + 1
	end
end

return StringAllocation
