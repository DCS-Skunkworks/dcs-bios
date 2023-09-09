module("UDPListener", package.seeall)

local socket = require "socket"
local ReadableConnection = require "ReadableConnection"

--- @class TCPConnection: ReadableConnection
local TCPConnection = ReadableConnection:new("", -1)

--- Creates a socket for sending and receiving TCP packets
--- @param connection table the TCP connection
function TCPConnection:new(connection)
    --- @type TCPConnection
    local o = {
		rxbuf = "",
        connection = connection
	}
    setmetatable(o, self)
    self.__index = self
    return o
end

--- Stores the connection
--- @param connection table the TCP connection
function TCPConnection:setConnection(connection)
    self.connection = connection
end

--- Sends data to the TCP socket connection
--- @param data string the data to send
function TCPConnection:send(data)
    socket.try(self.connection:send(data))
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
