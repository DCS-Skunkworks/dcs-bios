module("StringAllocation", package.seeall)


--- @class StringAllocation Allocation for a control
--- @field address integer 
--- @field value number
--- @field maxLength integer
--- @field characterAllocations table
StringAllocation = {
	address = 0,
	value = 0,
	maxLength = 0,
	characterAllocations = {}
}


--- @func Creates a StringAllocation for holding strings
--- @return StringAllocation
function StringAllocation:new()
    local o = {}
    setmetatable(o, self)
    self.__index = self
	o.characterAllocations = {}
    return o
end

function StringAllocation:setValue(value)
	local i = 1

	if value == nil then
		BIOS.log(string.format("Util.lua: item %s is sending a nil value", value or "nil")) -- value is temporary, should be possible to log control ID
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



