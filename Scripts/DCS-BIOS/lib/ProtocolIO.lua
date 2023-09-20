BIOS.protocol_io = {}
BIOS.protocol_io.connections = {}

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
