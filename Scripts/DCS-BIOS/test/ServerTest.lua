local MockSocket = require("Scripts.DCS-BIOS.test.io.MockSocket")
local ReadableConnection = require("Scripts.DCS-BIOS.lib.io.ReadableConnection")
local TCPConnection = require("Scripts.DCS-BIOS.lib.io.TCPConnection")
local TCPServer = require("Scripts.DCS-BIOS.lib.io.TCPServer")
local UDPListener = require("Scripts.DCS-BIOS.lib.io.UDPListener")
local UDPSender = require("Scripts.DCS-BIOS.lib.io.UDPSender")
local UDPServer = require("Scripts.DCS-BIOS.lib.io.UDPServer")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

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
end
