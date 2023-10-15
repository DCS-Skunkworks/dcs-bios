module("MockSocket", package.seeall)

local MockTCPSocketConnection = require("Scripts.DCS-BIOS.test.io.MockTCPSocketConnection")
local MockUDPSocketConnection = require("Scripts.DCS-BIOS.test.io.MockUDPSocketConnection")

--- @class MockSocket: Socket
--- A lua socket
MockSocket = {}

--- @return Socket
function MockSocket:new()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Throws an acception if ret1 is falsy, using ret2 as the error message.
--- @param ret1 any? the first return value to determine whether to throw an error
--- @vararg string? remaining return values to add to the error message if necessary
function MockSocket.try(ret1, ...) end

--- Gets the current udp socket connection
--- @return UDPSocketConnection socket_connection the udp socket connection
function MockSocket.udp()
	return MockUDPSocketConnection:new()
end

--- Creates and returns a connection acceptor bound to the specified address
--- @param address string the address to bind to
--- @param port integer the port on the address to bind to
--- @param backlog integer? the number of allowed connectinos to be queued
--- @return TCPSocketConnection connection the server object which can accept connections
function MockSocket.bind(address, port, backlog)
	return MockTCPSocketConnection:new()
end

return MockSocket
