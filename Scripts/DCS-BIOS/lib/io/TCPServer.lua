module("TCPServer", package.seeall)

local Server = require("Scripts.DCS-BIOS.lib.io.Server")
local TCPConnection = require("Scripts.DCS-BIOS.lib.io.TCPConnection")

--- @class TCPServer: Server
--- @field private acceptor TCPSocketConnection the TCP connection acceptor
--- @field private host string the host to connect to
--- @field private port number the port on the host to connect to
--- @field private connections TCPConnection[] the active TCP socket connections
--- @field private socket Socket the lua socket
--- @field private on_receive fun(value: string) function to run when receiving data
local TCPServer = Server:new()

--- Creates a server for sending and receiving TCP packets
--- @param host string the host to connect to
--- @param port number the port on the host to connect to
--- @param socket Socket the lua socket
--- @param on_receive fun(value: string) function to run when receiving data
function TCPServer:new(host, port, socket, on_receive)
	--- @type TCPServer
	local o = {
		host = host,
		port = port,
		socket = socket,
		acceptor = {},
		connections = {},
		on_receive = on_receive,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Initializes the TCP server with a connection acceptor to receive any incoming connections
function TCPServer:init()
	self.acceptor = self.socket.bind(self.host, self.port, 10)
	self.acceptor:settimeout(0)
	self.connections = {}
end

--- Accpets new connections, receives incoming data, and removes old connections
function TCPServer:step()
	self:acceptConnections()

	local items_to_remove = {}
	-- receive data
	for i, connection_info in ipairs(self.connections) do
		local success, err = connection_info:receive()

		if not success and err == "closed" then
			table.insert(items_to_remove, i)
		end
	end

	-- eliminate closed connections
	for _, index_to_remove in ipairs(items_to_remove) do
		table.remove(self.connections, index_to_remove)
	end
end

--- @private
--- Accepts any incoming connections
function TCPServer:acceptConnections()
	local new_connection = self.acceptor:accept()
	if new_connection then
		new_connection:settimeout(0)
		table.insert(self.connections, TCPConnection:new(new_connection, self.socket, self.on_receive))
	end
end

--- Sends a message to all TCP connections connected to the server
--- @param msg string the message to send
function TCPServer:send(msg)
	for _, connection_info in ipairs(self.connections) do
		connection_info:send(msg)
	end
end

--- Closes all TCP connections connected to the server
function TCPServer:close()
	for _, connection_info in ipairs(self.connections) do
		connection_info:close()
	end
	self.connections = {}
end

return TCPServer
