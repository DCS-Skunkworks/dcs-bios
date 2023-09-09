module("UDPSender", package.seeall)

local socket = require "socket"
local Connection = require "Connection"

--- @class UDPSender: Connection
local UDPSender = Connection:new("239.255.50.10", 5010)

--- Creates a socket for sending UDP packets
--- @param host string? the host to connect to
--- @param port number? the port on the host to connect to
function UDPSender:new(host, port)
    --- @type UDPSender
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.host = host or o.host
    o.port = port or o.port
    return o
end

--- initializes the socket connection
function UDPSender:init()
	self.connection = socket.udp()
    self.connection:setpeername(self.host, self.port)
end

---@param msg string the message to send
function UDPSender:send(msg)
	socket.try(self.connection:send(msg))
end

return UDPSender
