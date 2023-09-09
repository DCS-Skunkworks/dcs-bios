module("TCPServer", package.seeall)

local socket = require "socket"
local Server = require "Server"
local Connection = require "Connection"

--- @class TCPServer: Server
--- @field acceptor table the TCP connection acceptor
--- @field tcpConnection Connection the connection information
--- @field connections table[] the active TCP socket connections
local TCPServer = Server:new()

--- Creates a server for sending and receiving TCP packets
--- @param host string? the host to connect to
--- @param port number? the port on the host to connect to
function TCPServer:new(host, port)
	--- @type TCPServer
    local o = {
		tcpConnection = Connection:new(host or "*", port or 7778),
		acceptor = {},
		connections = {}
	}
    setmetatable(o, self)
    self.__index = self
    return o
end

function TCPServer:init()
	self.acceptor = socket.bind(self.tcpConnection.host, self.tcpConnection.port, 10)
	self.acceptor:settimeout(0)
	self.connections = {}
end

function TCPServer:step()
	-- accept new connections
	local newconn = self.acceptor:accept()
	if newconn then
		newconn:settimeout(0)
		-- todo: tablify this
		local newconn_info = { conn = newconn, rxbuf = "" }
		self.connections[#self.connections+1] = newconn_info
	end

	local have_closed_connections = false
	-- receive data
	for _, conninfo in pairs(self.connections) do

		local data, err, partial = conninfo.conn:receive(4096)
		if data then
			conninfo.rxbuf = conninfo.rxbuf .. data
		elseif partial and #partial > 0 then
			conninfo.rxbuf = conninfo.rxbuf .. partial
		elseif err == "closed" then
			conninfo.closed = true
			have_closed_connections = true
		end

		while true do
			local line, rest = conninfo.rxbuf:match("^([^\n]*)\n(.*)")
			if line then
				conninfo.rxbuf = rest
				BIOS.protocol.processInputLine(line)
			else
				break
			end
		end
	end

	-- eliminate closed connections
	if have_closed_connections then
		local old_connections = self.connections
		self.connections = {}
		for _, conninfo in pairs(old_connections) do
			if not conninfo.closed then
				self.connections[#self.connections+1] = conninfo
			end
		end
	end
end

function TCPServer:send(msg)
	for k, conninfo in pairs(self.connections) do
		socket.try(conninfo.conn:send(msg))
	end
end

function TCPServer:close()
    for _, connInfo in pairs(self.connections) do
        socket.try(connInfo.conn:close())
    end
    self.connections = {}
end

return TCPServer
