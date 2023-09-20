local MockSocket = require("MockSocket")
local ReadableConnection = require("ReadableConnection")
local TCPConnection = require("TCPConnection")
local TCPServer = require("TCPServer")
local UDPListener = require("UDPListener")
local UDPSender = require("UDPSender")
local UDPServer = require("UDPServer")

local lu = require("luaunit")

-- Unit testing starts
--- @class TestServer
TestServer = {}

function TestServer:testCreateReadableConnection()
	local listener = ReadableConnection:new("*", 0, MockSocket:new(), function() end)
	listener:appendToBuffer("foo")
end

function TestServer:testCreateUDPListener()
	local linesProcessed = {}
	local line1 = "line 1"
	local line2 = "line 2"
	local listener = UDPListener:new("*", 0, MockSocket:new(), function(val)
		table.insert(linesProcessed, val)
	end)
	listener:init()
	listener:appendToBuffer(line1 .. "\n" .. line2 .. "\n") -- add two lines of data to the buffer
	listener:receive() -- should process buffer line-by-line
	lu.assertEquals(linesProcessed[1], line1)
	lu.assertEquals(linesProcessed[2], line2)
	listener:close()
end

function TestServer:testCreateUDPSender()
	local sender = UDPSender:new("*", 0, MockSocket:new())
	sender:init()
	sender:send("foo")
	sender:close()
end

function TestServer:testCreateUDPServer()
	local server = UDPServer:new("*", 0, "*", 0, MockSocket:new(), function() end)
	server:init()
	server:step()
	server:send("foo")
	server:close()
end

function TestServer:testCreateTCPConnection()
	local s = MockSocket:new()
	local connection = TCPConnection:new(s.bind("", 0), MockSocket:new(), function() end)
	connection:send("foo")
	connection:receive()
	connection:close()
end

function TestServer:testCreateTCPServer()
	local server = TCPServer:new("*", 0, MockSocket:new(), function() end)
	server:init()
	server:step()
	server:send("foo")
	server:close()
	lu.assertIsFalse(true, "test failure")
end
