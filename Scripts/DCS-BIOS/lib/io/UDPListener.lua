module("UDPListener", package.seeall)

local socket = require "socket"
local UDPConnection = require "UDPConnection"

--- @class UDPListener: UDPConnection
--- @field rxbuf string a receiver buffer
local UDPListener = UDPConnection:new("*", 7778)

--- Creates a socket for receiving UDP packets
--- @param host string? the host to listen to
--- @param port number? the port to listen on
function UDPListener:new(host, port)
    --- @type UDPListener
    local o = {
		rxbuf = ""
	}
    setmetatable(o, self)
    self.__index = self
    o.host = host or o.host
    o.port = port or o.port
    return o
end

--- initializes the socket connection
function UDPListener:init()
    local conn = socket.udp()
    conn:setsockname(self.host, self.port)
    conn:settimeout(0)
    self.connection = conn
end

function UDPListener:step()
	local lInput = nil

	while true do
		lInput = self.connection:receive()
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

return UDPListener
