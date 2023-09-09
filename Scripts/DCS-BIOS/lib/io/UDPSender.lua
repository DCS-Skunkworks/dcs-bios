module("UDPSender", package.seeall)

local socket = require "socket"
local Connection = require "Connection"

--- @class UDPSender: Connection
local UDPSender = Connection:new("", -1)

--- Creates a socket for sending UDP packets
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
function UDPSender:new(host, port)
	--- @type UDPSender
	local o = {
		host = host,
		port = port
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- initializes the socket connection
function UDPSender:init()
	---@diagnostic disable-next-line: undefined-field
	self.connection = socket.udp() -- this is correct, diagnostics disabled
	self.connection:setpeername(self.host, self.port)
end

---@param msg string the message to send
function UDPSender:send(msg)
	socket.try(self.connection:send(msg))
end

return UDPSender
