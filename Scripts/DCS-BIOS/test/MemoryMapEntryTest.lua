local MemoryMapEntry = require("Scripts.DCS-BIOS.lib.modules.memory_map.MemoryMapEntry")
local StringAllocation = require("Scripts.DCS-BIOS.lib.modules.memory_map.StringAllocation")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestMemoryMapEntry
--- @field entry MemoryMapEntry
TestMemoryMapEntry = {}
local entry_address = 0x4200

function TestMemoryMapEntry:setUp()
	self.entry = MemoryMapEntry:new(entry_address)
end

function TestMemoryMapEntry:testCreateMemoryMapEntry()
	local entry = self.entry
	lu.assertEquals(entry.address, entry_address)
	lu.assertEquals(#entry.allocations, 0)
	lu.assertIsFalse(entry.dirty)
end

function TestMemoryMapEntry:testCanAllocate()
	local entry = self.entry
	lu.assertIsTrue(entry:canAllocate(42)) -- this should be well below the available space
	lu.assertIsTrue(entry:canAllocate(65535)) -- the limit of the space available
	lu.assertIsFalse(entry:canAllocate(65536)) -- one above the limit of the space available

	local allocation = entry:allocate(255)
	lu.assertEquals(allocation.address, entry.address)
	lu.assertEquals(allocation.mask, 255)
	lu.assertEquals(allocation.maxValue, 255)
	lu.assertEquals(allocation.multiplier, 1)
	lu.assertEquals(allocation.shiftBy, 0)
	lu.assertIsNil(allocation.value)
	lu.assertEquals(#entry.allocations, 1)

	lu.assertIsTrue(entry:canAllocate(255)) -- we can still fit more
	lu.assertIsFalse(entry:canAllocate(65535)) -- but not the max anymore

	local allocation2 = entry:allocate(255)
	lu.assertEquals(allocation2.address, entry.address)
	lu.assertEquals(allocation2.mask, 65280)
	lu.assertEquals(allocation2.maxValue, 255)
	lu.assertEquals(allocation2.multiplier, 256)
	lu.assertEquals(allocation2.shiftBy, 8)
	lu.assertIsNil(allocation2.value)
	lu.assertEquals(#entry.allocations, 2)
end

function TestMemoryMapEntry:testCanAllocateString()
	local entry = self.entry
	lu.assertIsTrue(entry:canAllocateStringCharacter(true)) -- nothing has been allocated, so this is fine
	lu.assertIsTrue(entry:canAllocateStringCharacter(false)) -- nothing has been allocated, so this is fine

	entry:allocate(255)
	lu.assertIsFalse(entry:canAllocateStringCharacter(true)) -- can't allocate the first character anymore
	lu.assertIsTrue(entry:canAllocateStringCharacter(false)) -- but we can still stack on top of this

	entry:allocate(255)
	lu.assertIsFalse(entry:canAllocateStringCharacter(true)) -- now we can't fit anything anymore
	lu.assertIsFalse(entry:canAllocateStringCharacter(false))
end

function TestMemoryMapEntry:testGetValue()
	local entry = self.entry
	local allocation = entry:allocate(255)
	allocation:setValue(10)

	lu.assertEquals(entry:getValue(), 10)

	local allocation2 = entry:allocate(255)
	allocation2:setValue(5)

	lu.assertEquals(entry:getValue(), 1290) -- 10 + (5 * 255)
end

function TestMemoryMapEntry:testMemoryAllocation()
	local entry = self.entry

	local alloc = entry:allocate(255)

	alloc:setValue(300) -- values larger than max shouldn't work
	lu.assertEquals(entry:getValue(), 0)
	lu.assertIsFalse(entry.dirty)

	alloc:setValue(-1) -- nor should any below zero
	lu.assertEquals(entry:getValue(), 0)
	lu.assertIsFalse(entry.dirty)

	alloc:setValue(10)
	lu.assertEquals(entry:getValue(), 10)
	lu.assertIsTrue(entry.dirty)
end

function TestMemoryMapEntry:testStringAllocation()
	local entry = self.entry

	local alloc1 = entry:allocate(255)
	local alloc2 = entry:allocate(255)

	local allocation = StringAllocation:new({ alloc1, alloc2 }, 2)
	allocation:setValue("hi")

	lu.assertEquals(alloc1.value, string.byte("h"))
	lu.assertEquals(alloc2.value, string.byte("i"))
	lu.assertIsTrue(entry.dirty)
end
