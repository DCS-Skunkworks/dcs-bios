local MockServer = require("MockServer")
local ProtocolIO = require("ProtocolIO")

local lu = require("luaunit")

--- @class TestProtocolIO
TestProtocolIO = {}

function TestProtocolIO:setUp()
	ProtocolIO.connections = {}
end

function TestProtocolIO:testFlush()
	local testBuffer = "test"
	local server = MockServer:new()
	ProtocolIO.connections = {
		server,
	}

	ProtocolIO.queue(testBuffer)
	ProtocolIO.flush()

	lu.assertEquals(#server.sent_messages, 1)
	lu.assertEquals(server.sent_messages[1], testBuffer)
end

function TestProtocolIO:testFlushEmptyBuffer()
	local server = MockServer:new()
	ProtocolIO.connections = {
		server,
	}

	ProtocolIO.flush()

	lu.assertEquals(#server.sent_messages, 0)
end

function TestProtocolIO:testFlushOverMaxBuffer()
	local testBuffer = ""
	for _ = 1, 200, 1 do
		testBuffer = testBuffer .. "test" -- build testbuffer to be 800 bytes long
	end

	local server = MockServer:new()
	ProtocolIO.connections = {
		server,
	}

	ProtocolIO.queue(testBuffer)
	ProtocolIO.queue(testBuffer)
	ProtocolIO.queue(testBuffer)
	ProtocolIO.flush()

	lu.assertEquals(#server.sent_messages, 2)
	lu.assertEquals(server.sent_messages[1], testBuffer .. testBuffer) -- max buffer size is 2048 bytes, so two should be concatentated
	lu.assertEquals(server.sent_messages[2], testBuffer) -- but the third should overflow
end
