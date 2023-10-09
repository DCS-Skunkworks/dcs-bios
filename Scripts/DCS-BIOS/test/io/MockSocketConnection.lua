module("MockSocketConnection", package.seeall)

--- @class MockSocketConnection: SocketConnection
--- A lua sockets socket connection
MockSocketConnection = {}

--- @return SocketConnection
function MockSocketConnection:new()
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Changes the connection timeout value
--- @param value integer the timeout to set
function MockSocketConnection:settimeout(value) end

--- Sends data to the socket
--- @param data string the data to send
--- @return integer? success_code
--- @return string? error
function MockSocketConnection:send(data)
	return 1
end

--- Receives data from the socket
--- @param buffer_size integer? the max amount of data to receive
--- @return string? data the data received
--- @return string? error whether there was an error receiving data
--- @return string? partial any partial data received
function MockSocketConnection:receive(buffer_size)
	return nil, nil, nil
end

--- Closes the socket connection
function MockSocketConnection:close() end

return MockSocketConnection
