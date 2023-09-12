module("UDPListener", package.seeall)

local ReadableConnection = require("ReadableConnection")
local socket = require("socket")

--- @class UDPListener: ReadableConnection
local UDPListener = ReadableConnection:new("", -1)

--- Creates a socket for receiving UDP packets
--- @param host string the host to listen to
--- @param port number the port to listen on
function UDPListener:new(host, port)
	--- @type UDPListener
	local o = {
		host = host,
		port = port,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- initializes the socket connection
function UDPListener:init()
	---@diagnostic disable-next-line: undefined-field
	local conn = socket.udp() -- this is correct, diagnostics disabled
	conn:setsockname(self.host, self.port)
	conn:settimeout(0)
	self.connection = conn
end

--- Receives data from the connection and processes it
--- @return boolean, string? success whether the reception was successful, and the error if not (UDP reception is always successful)
function UDPListener:receive()
	while true do
		local lInput = self.connection:receive()
		if not lInput then
			break
		end
		self:appendToBuffer(lInput)
	end

	self:processBuffer()

	return true
end

return UDPListener
