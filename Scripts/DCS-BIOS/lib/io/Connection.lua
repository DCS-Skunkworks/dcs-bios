module("Connection", package.seeall)

--- @class Connection
--- @field host string the host to connect to
--- @field port number the port on the host to connect to
--- @field connection SocketConnection the lua socket connection
--- @field socket Socket the lua socket
local Connection = {}

--- Creates a connection for sending packets
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
--- @param socket Socket the socket to use
function Connection:new(host, port, socket)
	--- @type Connection
	local o = {
		host = host,
		port = port,
		connection = {},
		socket = socket,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- @abstract
--- Initializes the connection
function Connection:init() -- luacheck: ignore 212
	error("init must be implemented by the Connection subclass", 2)
end

--- Closes the connection
function Connection:close()
	self.socket.try(self.connection:close())
end

return Connection
