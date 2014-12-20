BIOS.protocol_io = {}
BIOS.protocol_io.connections = {}

BIOS.protocol_io.LuaSocketConnection = {
	conn = nil,
	rxbuf = ""
}
function BIOS.protocol_io.LuaSocketConnection:create(args)
	local self = BIOS.util.shallowCopy(BIOS.protocol_io.LuaSocketConnection)
	return self
end
function BIOS.protocol_io.LuaSocketConnection:close()
	self.conn:close()
end

BIOS.protocol_io.TCPServer = {}
function BIOS.protocol_io.TCPServer:create(args)
	args = args or {}
	local self = BIOS.protocol_io.LuaSocketConnection:create()
	BIOS.util.shallowCopy(BIOS.protocol_io.TCPServer, self)
	self.host = args.host or "*"
	self.port = args.port or 7778
	return self
end
function BIOS.protocol_io.TCPServer:init()
	self.acceptor = socket.bind(self.host, self.port, 10)
	self.acceptor:settimeout(0)
	self.connections = {}
end
function BIOS.protocol_io.TCPServer:step()
	-- accept new connections
	local newconn = self.acceptor:accept()
	if newconn then
		newconn:settimeout(0)
		local newconn_info = { conn = newconn, txbuf = "", rxbuf = "" }
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
function BIOS.protocol_io.TCPServer:send(msg)
	for _, conninfo in pairs(self.connections) do
		socket.try(conninfo.conn:send(msg))
	end
end
function BIOS.protocol_io.TCPServer:close()
	for _, conninfo in pairs(self.connections) do
		socket.try(conninfo.conn:close())
	end
	self.connections = {}
end

BIOS.protocol_io.DefaultMulticastSender = {}
function BIOS.protocol_io.DefaultMulticastSender:create()
	local self = BIOS.protocol_io.LuaSocketConnection:create()
	BIOS.util.shallowCopy(BIOS.protocol_io.DefaultMulticastSender, self)
	return self
end
function BIOS.protocol_io.DefaultMulticastSender:init()
	self.conn = socket.udp()
	self.conn:settimeout(0)
end
function BIOS.protocol_io.DefaultMulticastSender:send(msg)
	socket.try(self.conn:sendto(msg, "239.255.50.10", 5010))
end


BIOS.protocol_io.UDPListener = {}
function BIOS.protocol_io.UDPListener:create(args)
	local self = BIOS.protocol_io.LuaSocketConnection:create()
	BIOS.util.shallowCopy(BIOS.protocol_io.UDPListener, self)
	self.port = args.port or 7778
	self.host = args.host or "*"
	return self
end
function BIOS.protocol_io.UDPListener:init()
	self.conn = socket.udp()
	self.conn:setsockname("*", self.port)
	self.conn:settimeout(0)
end
function BIOS.protocol_io.UDPListener:step()
	local lInput = nil
	
	while true do
		lInput = self.conn:receive()
		if not lInput then break end
		self.rxbuf = self.rxbuf .. lInput
	end
	
	while true do
		local line, rest = self.rxbuf:match("^([^\n]*)\n(.*)")
		if line then
			self.rxbuf = rest
			BIOS.protocol.processInputLine(line)
		else
			break
		end
	end
end

BIOS.protocol_io.UDPSender = {}
function BIOS.protocol_io.UDPSender:create(args)
	local self = BIOS.protocol_io.LuaSocketConnection:create()
	BIOS.util.shallowCopy(BIOS.protocol_io.UDPSender, self)
	self.port = args.port or 7777
	self.host = args.host or "127.0.0.1"
	return self
end
function BIOS.protocol_io.UDPSender:init()
	self.conn = socket.udp()
	self.conn:settimeout(0)
end
function BIOS.protocol_io.UDPSender:send(msg)
	socket.try(self.conn:sendto(msg, self.host, self.port))
end

local msg_buf = {}
function BIOS.protocol_io.queue(msg)
	msg_buf[#msg_buf+1] = msg
end
function BIOS.protocol_io.flush()
	local MAX_PAYLOAD_SIZE = 2048
	
	local packet = ""
	for _, v in pairs(msg_buf) do
		if packet:len() + v:len() > MAX_PAYLOAD_SIZE then
			for _, v in pairs(BIOS.protocol_io.connections) do
				if v.send then v:send(packet) end
			end			
			packet = ""
		end
		packet = packet .. v
	end
	if packet:len() > 0 then
		for _, v in pairs(BIOS.protocol_io.connections) do
			if v.send then v:send(packet) end
		end
	end
	msg_buf = {}
end

