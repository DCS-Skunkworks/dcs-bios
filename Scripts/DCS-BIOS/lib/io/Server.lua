module("Server", package.seeall)

local socket = require "socket"

--- @class Server
--- @field connections table[] lua socket connections
local Server = {
    connections = {}
}

--- Constructs a new server
function Server:new()
    --- @type Server
    local o = {
        connections = {}
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function Server:init()
    error("init must be implemented by the Server subclass", 2)
end

function Server:step()
    error("step must be implemented by the Server subclass", 2)
end

function Server:send(msg)
    error("send must be implemented by the Server subclass", 2)
end

function Server:close()
    for _, conn in pairs(self.connections) do
        socket.try(conn:close())
    end
    self.connections = {}
end

return Server
