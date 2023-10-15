module("UDPSender", package.seeall)

local Connection = require("Scripts.DCS-BIOS.lib.io.Connection")

--- @class UDPSender: Connection
local UDPSender = Connection:new("", -1, {})

--- Creates a socket for sending UDP packets
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
--- @param socket Socket the lua socket
--- @return UDPSender udp_sender the new UDP Sender
function UDPSender:new(host, port, socket)
	local o = Connection:new(host, port, socket)
	setmetatable(o, self)
	self.__index = self
	---@cast o UDPSender
	return o
end

--- initializes the socket connection
function UDPSender:init()
	self.connection = self.socket.udp()
	self.connection:setpeername(self.host, self.port)
end

--- sends data to the udp socket
--- @param msg string the message to send
function UDPSender:send(msg)
	self.socket.try(self.connection:send(msg))
end

return UDPSender
