module("Connection", package.seeall)

local socket = require("socket")

--- @class Connection
--- @field host string the host to connect to
--- @field port number the port on the host to connect to
--- @field connection table the lua socket connection
local Connection = {}

--- Creates a connection for sending packets
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
function Connection:new(host, port)
	--- @type Connection
	local o = {
		host = host,
		port = port,
		connection = {},
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- @abstract
--- Initializes the connection
function Connection:init()
	error("init must be implemented by the Connection subclass", 2)
end

--- Closes the connection
function Connection:close()
	socket.try(self.connection:close())
end

return Connection
