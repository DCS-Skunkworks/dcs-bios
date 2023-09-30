module("Server", package.seeall)

--- @class Server
local Server = {}

--- Constructs a new server
function Server:new()
	--- @type Server
	local o = {}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- @abstract
--- Initializes any socket connections
function Server:init()
	error("init must be implemented by the Server subclass", 2)
end

--- @abstract
--- Receives incoming data to be processed
function Server:step()
	error("step must be implemented by the Server subclass", 2)
end

--- @abstract
--- Sends a message to the client
--- @param message string the message to send
function Server:send(message)
	error("send must be implemented by the Server subclass", 2)
end

--- @abstract
--- Closes any socket connections
function Server:close()
	error("close must be implemented by the Server subclass", 2)
end

return Server
