module("TCPConnection", package.seeall)

local ReadableConnection = require("Scripts.DCS-BIOS.lib.io.ReadableConnection")

--- @class TCPConnection: ReadableConnection
local TCPConnection = ReadableConnection:new("", -1, {}, function() end)

--- Creates a socket for sending and receiving TCP packets
--- @param connection TCPSocketConnection the TCP connection
--- @param socket Socket the lua socket
--- @param on_receive fun(value: string) function to run when receiving data
--- @return TCPConnection connection the newly-created TCP connection
function TCPConnection:new(connection, socket, on_receive)
	local o = ReadableConnection:new("", -1, socket, on_receive)
	setmetatable(o, self)
	---@cast o TCPConnection
	o.connection = connection
	self.__index = self
	return o
end

--- Sends data to the TCP socket connection
--- @param data string the data to send
function TCPConnection:send(data)
	self.socket.try(self.connection:send(data))
end

--- Receives data from the connection and processes it
--- @return boolean, string? success whether the reception was successful, and the error if not
function TCPConnection:receive()
	local data, err, partial = self.connection:receive(4096)
	if data then
		self.rxbuf = self.rxbuf .. data
	elseif partial and #partial > 0 then
		self.rxbuf = self.rxbuf .. partial
	elseif err then
		return false, err
	end

	self:processBuffer()

	return true
end

return TCPConnection
