module("MockUDPSocketConnection", package.seeall)

local MockSocketConnection = require("Scripts.DCS-BIOS.test.io.MockSocketConnection")

--- @class MockUDPSocketConnection: MockSocketConnection
--- A lua sockets UDP socket connection
MockUDPSocketConnection = MockSocketConnection:new()

--- @return UDPSocketConnection
function MockUDPSocketConnection:new()
	local o = MockSocketConnection:new()
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Binds the UDP object to a local address
--- @param address string the address to bind to
--- @param port integer the port at the address to bind to
--- @return integer? success_code
--- @return string? error
function MockUDPSocketConnection:setsockname(address, port) end

--- Changes the peer of the UDP object, turning it from unconnected to connected or vice-versa
--- @param address string the address to connect to
--- @param port integer the port at the address to connect to
--- @return integer? success_code
--- @return string? error
function MockUDPSocketConnection:setpeername(address, port) end

return MockUDPSocketConnection
