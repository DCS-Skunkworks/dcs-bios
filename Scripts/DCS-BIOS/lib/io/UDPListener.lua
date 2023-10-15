module("UDPListener", package.seeall)

local ReadableConnection = require("Scripts.DCS-BIOS.lib.io.ReadableConnection")

--- @class UDPListener: ReadableConnection
local UDPListener = ReadableConnection:new("", -1, {}, function() end)

--- Creates a socket for receiving UDP packets
--- @param host string the host to listen to
--- @param port number the port to listen on
--- @param socket Socket the lua socket
--- @param on_receive fun(value: string) function to run when receiving data
--- @return UDPListener udp_listener the new UDP listener
function UDPListener:new(host, port, socket, on_receive)
	local o = ReadableConnection:new(host, port, socket, on_receive)
	setmetatable(o, self)
	self.__index = self
	---@cast o UDPListener
	return o
end

--- initializes the socket connection
function UDPListener:init()
	local conn = self.socket.udp()
	conn:setsockname(self.host, self.port)
	conn:settimeout(0)
	self.connection = conn
end

--- Receives data from the connection and processes it
--- @return boolean, string? success whether the reception was successful, and the error if not (UDP reception is always successful)
function UDPListener:receive()
	while true do
		local l_input = self.connection:receive()
		if not l_input then
			break
		end
		self:appendToBuffer(l_input)
	end

	self:processBuffer()

	return true
end

return UDPListener
