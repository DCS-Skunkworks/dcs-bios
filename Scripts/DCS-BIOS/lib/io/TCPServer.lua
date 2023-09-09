module("TCPServer", package.seeall)

local socket = require "socket"
local Server = require "Server"
local TCPConnection = require "TCPConnection"

--- @class TCPServer: Server
--- @field private acceptor table the TCP connection acceptor
--- @field private host string the host to connect to
--- @field private port number the port on the host to connect to
--- @field private connections TCPConnection[] the active TCP socket connections
local TCPServer = Server:new()

--- Creates a server for sending and receiving TCP packets
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
function TCPServer:new(host, port)
	--- @type TCPServer
	local o = {
		host = host,
		port = port,
		acceptor = {},
		connections = {}
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Initializes the TCP server with a connection acceptor to receive any incoming connections
function TCPServer:init()
	---@diagnostic disable-next-line: assign-type-mismatch
	self.acceptor = socket.bind(self.host, self.port, 10) -- this is correct, diagnostics disabled
	self.acceptor:settimeout(0)
	self.connections = {}
end

--- Accpets new connections, receives incoming data, and removes old connections
function TCPServer:step()
	self:acceptConnections()

	local itemsToRemove = {}
	-- receive data
	for i, conninfo in ipairs(self.connections) do
		local success, err = conninfo:receive()

		if not success and err == "closed" then
			table.insert(itemsToRemove, i)
		end
	end

	-- eliminate closed connections
	for _, indexToremove in ipairs(itemsToRemove) do
		table.remove(self.connections, indexToremove)
	end
end

--- @private
--- Accepts any incoming connections
function TCPServer:acceptConnections()
	local newconn = self.acceptor:accept()
	if newconn then
		newconn:settimeout(0)
		table.insert(self.connections, TCPConnection:new(newconn))
	end
end

--- Sends a message to all TCP connections connected to the server
--- @param msg string the message to send
function TCPServer:send(msg)
	for _, conninfo in ipairs(self.connections) do
		conninfo:send(msg)
	end
end

--- Closes all TCP connections connected to the server
function TCPServer:close()
	for _, connInfo in ipairs(self.connections) do
		connInfo:close()
	end
	self.connections = {}
end

return TCPServer
