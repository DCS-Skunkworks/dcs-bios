module("MockTCPSocketConnection", package.seeall)

local MockSocketConnection = require("Scripts.DCS-BIOS.test.io.MockSocketConnection")

--- @class MockTCPSocketConnection: MockSocketConnection
--- A lua sockets TCP socket connection
MockTCPSocketConnection = MockSocketConnection:new()

--- @return TCPSocketConnection
function MockTCPSocketConnection:new()
	local o = MockSocketConnection:new()
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Accepts any pending incoming connection
--- @return TCPSocketConnection? connection a new socket connection for the incoming connection
--- @return string? error the error message, if any
function MockTCPSocketConnection:accept()
	return MockTCPSocketConnection:new()
end

return MockTCPSocketConnection
