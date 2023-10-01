module("ProtocolIO", package.seeall)

--- @class ProtocolIO
--- @field connections Server[] the connections to send messages to
--- @field private msg_buf string[] the buffer of messages to send
--- @field private MAX_PAYLOAD_SIZE integer the maximum payload that can be accepted and sent
local ProtocolIO = {
	connections = {},
	msg_buf = {},
	MAX_PAYLOAD_SIZE = 2048
}

--- Queues a message to be sent to any connections
---@param msg string the message to send
function ProtocolIO.queue(msg)
	assert(msg:len() <= ProtocolIO.MAX_PAYLOAD_SIZE, "Message exceeded max buffer size! " .. msg)
	table.insert(ProtocolIO.msg_buf, msg)
end

--- Flushes the message buffer, sending any queued messages
function ProtocolIO.flush()
	local packet = ""
	for _, msg in ipairs(ProtocolIO.msg_buf) do
		if packet:len() + msg:len() > ProtocolIO.MAX_PAYLOAD_SIZE then
			-- packet would be too big, so send what we have now
			ProtocolIO.send_packet(packet)
			packet = ""
		end
		packet = packet .. msg
	end
	if packet:len() > 0 then
		ProtocolIO.send_packet(packet)
	end
	ProtocolIO.msg_buf = {}
end

--- @private
--- Sends a packet to all open connections
--- @param packet string
function ProtocolIO.send_packet(packet)
	for _, conn in ipairs(ProtocolIO.connections) do
		if conn.send then conn:send(packet) end
	end
end

return ProtocolIO
