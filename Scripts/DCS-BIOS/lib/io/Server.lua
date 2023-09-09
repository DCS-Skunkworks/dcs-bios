module("Server", package.seeall)

local socket = require "socket"

--- @class Server
local Server = {
}

--- Constructs a new server
function Server:new()
    --- @type Server
    local o = {
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
    error("close must be implemented by the Server subclass", 2)
end

return Server
