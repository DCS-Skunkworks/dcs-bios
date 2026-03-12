local ConnectionManager = require("Scripts.DCS-BIOS.lib.ConnectionManager")
local MockServer = require("Scripts.DCS-BIOS.test.io.MockServer")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestConnectionManager
--- @field connection_manager ConnectionManager
TestConnectionManager = {}

function TestConnectionManager:setUp()
	self.connection_manager = ConnectionManager:new({})
end

function TestConnectionManager:testFlush()
	local testBuffer = "test"
	local server = MockServer:new()
	self.connection_manager:addConnection(server)

	self.connection_manager:queue(testBuffer)
	self.connection_manager:send_queue()

	lu.assertEquals(#server.sent_messages, 1)
	lu.assertEquals(server.sent_messages[1], testBuffer)
end

function TestConnectionManager:testFlushEmptyBuffer()
	local server = MockServer:new()
	self.connection_manager:addConnection(server)

	self.connection_manager:send_queue()

	lu.assertEquals(#server.sent_messages, 0)
end

function TestConnectionManager:testFlushOverMaxBuffer()
	local testBuffer = ""
	for _ = 1, 200, 1 do
		testBuffer = testBuffer .. "test" -- build testbuffer to be 800 bytes long
	end

	local server = MockServer:new()
	self.connection_manager:addConnection(server)

	self.connection_manager:queue(testBuffer)
	self.connection_manager:queue(testBuffer)
	self.connection_manager:queue(testBuffer)
	self.connection_manager:send_queue()

	lu.assertEquals(#server.sent_messages, 3)
	lu.assertEquals(server.sent_messages[1], testBuffer) -- max buffer size is 1460 bytes, so each 800-byte buffer gets its own packet
	lu.assertEquals(server.sent_messages[2], testBuffer)
	lu.assertEquals(server.sent_messages[3], testBuffer)
end
