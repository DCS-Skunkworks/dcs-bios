module("ConnectionManager", package.seeall)

--- @class ConnectionManager
--- @field connections Server[] the connections to send messages to
--- @field private msg_buf string[] the buffer of messages to send
--- @field private MAX_PAYLOAD_SIZE integer the maximum payload that can be accepted and sent
local ConnectionManager = {}

--- Constructs a new connection handler
--- @param connections Server[] the connections to send messages to
--- @return ConnectionManager
function ConnectionManager:new(connections)
	--- @type ConnectionManager
	local o = {
		connections = connections,
		msg_buf = {},
		MAX_PAYLOAD_SIZE = 2048,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Adds a new connection
--- @param server Server
function ConnectionManager:addConnection(server)
	table.insert(self.connections, server)
end

--- Queues a message to be sent to any connections
---@param msg string the message to send
function ConnectionManager:queue(msg)
	if msg:len() > self.MAX_PAYLOAD_SIZE then
		error("Message exceeded max buffer size! " + msg)
	end

	table.insert(self.msg_buf, msg)
end

--- Flushes the message buffer, sending any queued messages
function ConnectionManager:send_queue()
	local packet = ""
	while #self.msg_buf > 0 do
		local msg = table.remove(self.msg_buf, 1)
		if packet:len() + msg:len() > self.MAX_PAYLOAD_SIZE then
			-- packet would be too big, so send what we have now
			self:send_packet(packet)
			packet = ""
		end
		packet = packet .. msg
	end

	if packet:len() > 0 then
		self:send_packet(packet)
	end
end

--- @private
--- Sends a packet to all open connections
--- @param packet string
function ConnectionManager:send_packet(packet)
	for _, conn in ipairs(self.connections) do
		if conn.send then
			conn:send(packet)
		end
	end
end

return ConnectionManager
