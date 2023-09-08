module("UDPConnection", package.seeall)

local socket = require "socket"
local Connection = require "Connection"

--- @class UDPConnection: Connection
--- @field connection table the lua socket connection
local UDPConnection = Connection:new()

--- Creates a new UDP connection
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
function UDPConnection:new(host, port)
    local o = {
        connection = {}
    }
    setmetatable(o, self)
    self.__index = self
    o.host = host
    o.port = port
    return o
end

function UDPConnection:init()
    error("init must be implemented by the UDPConnection subclass", 2)
end

function UDPConnection:close()
    socket.try(self.connection:close())
end

return UDPConnection
