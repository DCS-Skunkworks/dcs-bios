local MemoryMap = require("Scripts.DCS-BIOS.lib.modules.memory_map.MemoryMap")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestMemoryMap
--- @field memory_map MemoryMap
TestMemoryMap = {}
local memory_map_address = 0x4200

function TestMemoryMap:setUp()
	self.memory_map = MemoryMap:new(memory_map_address)
end

function TestMemoryMap:testCreateMemoryMap()
	local map = self.memory_map
	lu.assertEquals(map.baseAddress, memory_map_address)
	lu.assertEquals(#map.entries, 0)
	lu.assertEquals(map.lastAddress, memory_map_address)
	lu.assertEquals(map.autosyncPosition, memory_map_address)
end

function TestMemoryMap:testAllocateInt()
	local map = self.memory_map
	local allocation = map:allocateInt(255)

	lu.assertEquals(allocation.address, memory_map_address)

	allocation:setValue(10)

	lu.assertEquals(allocation.value, 10)

	lu.assertEquals(map.lastAddress, memory_map_address)

	local allocation2 = map:allocateInt(65535)

	lu.assertEquals(map.lastAddress, memory_map_address + 2)
	lu.assertEquals(allocation2.address, memory_map_address + 2)
end

function TestMemoryMap:testAllocateString()
	local map = self.memory_map
	local allocation = map:allocateString(5)
	allocation:setValue("hello")

	lu.assertEquals(allocation.address, memory_map_address)
	lu.assertEquals(map.lastAddress, memory_map_address + 4) -- incremented by two every two characters
	lu.assertNotIsNil(map.entries[memory_map_address]) -- he
	lu.assertNotIsNil(map.entries[memory_map_address + 2]) -- ll
	lu.assertNotIsNil(map.entries[memory_map_address + 4]) -- o
	lu.assertIsNil(map.entries[memory_map_address - 2])
	lu.assertIsNil(map.entries[memory_map_address + 6])
end

function TestMemoryMap:testClearValues()
	local map = self.memory_map
	local entry = map:getOrAddEntry(memory_map_address)
	local allocation = entry:allocate(255)
	allocation:setValue(128)

	lu.assertEquals(allocation.value, 128)
	lu.assertEquals(entry:getValue(), 128)

	map:clearValues()

	entry = map:getOrAddEntry(memory_map_address)
	lu.assertEquals(entry:getValue(), 0)
	lu.assertIsNil(allocation.value)
end
