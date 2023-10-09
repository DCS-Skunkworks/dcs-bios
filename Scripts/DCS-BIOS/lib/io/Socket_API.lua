--- @meta

--- @class SocketConnection
--- A lua sockets socket connection
SocketConnection = {}

--- Changes the connection timeout value
--- @param value integer the timeout to set
function SocketConnection:settimeout(value) end

--- Sends data to the socket
--- @param data string the data to send
--- @return integer? success_code
--- @return string? error
function SocketConnection:send(data) end

--- Receives data from the socket
--- @param buffer_size integer? the max amount of data to receive
--- @return string? data the data received
--- @return string? error whether there was an error receiving data
--- @return string? partial any partial data received
function SocketConnection:receive(buffer_size) end

--- Closes the socket connection
function SocketConnection:close() end

--- @class UDPSocketConnection: SocketConnection
--- A lua sockets UDP socket connection
UDPSocketConnection = {}

--- Binds the UDP object to a local address
--- @param address string the address to bind to
--- @param port integer the port at the address to bind to
--- @return integer? success_code
--- @return string? error
function UDPSocketConnection:setsockname(address, port) end

--- Changes the peer of the UDP object, turning it from unconnected to connected or vice-versa
--- @param address string the address to connect to
--- @param port integer the port at the address to connect to
--- @return integer? success_code
--- @return string? error
function UDPSocketConnection:setpeername(address, port) end

--- @class Socket
--- A lua socket
Socket = {}

--- Throws an acception if ret1 is falsy, using ret2 as the error message.
--- @param ret1 any? the first return value to determine whether to throw an error
--- @vararg string? remaining return values to add to the error message if necessary
function Socket.try(ret1, ...) end

--- Gets the current udp socket connection
--- @return UDPSocketConnection socket_connection the udp socket connection
function Socket.udp()
	return {}
end

--- Creates and returns a connection acceptor bound to the specified address
--- @param address string the address to bind to
--- @param port integer the port on the address to bind to
--- @param backlog integer? the number of allowed connectinos to be queued
--- @return TCPSocketConnection connection the server object which can accept connections
function Socket.bind(address, port, backlog)
	return {}
end

--- @class TCPSocketConnection: SocketConnection
--- A lua sockets TCP socket connection
TCPSocketConnection = {}

--- Accepts any pending incoming connection
--- @return TCPSocketConnection? connection a new socket connection for the incoming connection
--- @return string? error the error message, if any
function TCPSocketConnection:accept() end
