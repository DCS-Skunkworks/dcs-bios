module("MemoryAllocation", package.seeall)

--- @class MemoryAllocation Allocation for a control
--- @field address integer 
--- @field value number
--- @field memoryMapEntry MemoryMapEntry
--- @field maxValue integer
--- @field multiplier integer
--- @field mask integer
--- @field shiftBy integer
local MemoryAllocation = {
	address = 0,
	value = 0,
	memoryMapEntry = {}, -- how to propery set this?
	maxValue = 0,
	multiplier = 0,
	mask = 0,
	shiftBy = 0
}

--- @func Creates a MemoryAllocation for holding values at certain positions
--- @return MemoryAllocation
function MemoryAllocation:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
    return o
end

--- @func Tries to set the value of the MemoryAllocation to param. Checks that 0 <= param =< maxValue. Floors the value.
--- @param value number Value to be set to the MemoryAllocation
function MemoryAllocation:setValue(value)
	-- ignore nil values (on MP servers with player export disabled, some values are not available)
	if value == nil then return end
	if value ~= value then
        -- check for NaN (Not a Number)
        return
    end
	assert(self.maxValue)
	assert(value)
	value = math.floor(value)
	if value < 0 then
		BIOS.log(string.format("Util.lua: value %f is too small for address %d mask %d", value, self.address, self.mask))
		return
	end
	if value > self.maxValue then
		BIOS.log(string.format("Util.lua: value %f is too large for address %d mask %d", value, self.address, self.mask))
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



