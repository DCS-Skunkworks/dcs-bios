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

