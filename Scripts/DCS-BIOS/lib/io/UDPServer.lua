module("UDPServer", package.seeall)

local socket = require "socket"
local Server = require "Server"

--- @class UDPServer: Server
--- @field sender UDPSender
--- @field listener UDPListener
local UDPServer = Server:new()

--- Creates a socket for receiving UDP packets
--- @param sender UDPSender the UDP sender to use
--- @param listener UDPListener the UDPListener to use
function UDPServer:new(sender, listener)
    --- @type UDPServer
    local o = {
        sender = sender,
        listener = listener
    }
    setmetatable(o, self)
    self.__index = self
    return o
end

function UDPServer:init()
    self.sender:init()
    self.listener:init()
end

function UDPServer:step()
    self.listener:step()
end

function UDPServer:send(msg)
    self.sender:send(msg)
end

function UDPServer:close()
    self.sender:close()
    self.listener:close()
end

return UDPServer
