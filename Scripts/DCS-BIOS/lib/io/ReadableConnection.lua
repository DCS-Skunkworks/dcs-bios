module("UDPListener", package.seeall)

local Connection = require "Connection"

--- @class ReadableConnection: Connection
--- @field private rxbuf string a receiver buffer
local ReadableConnection = Connection:new("", -1)

--- Creates a socket for receiving UDP packets
--- @param host string the host to listen to
--- @param port number the port to listen on
function ReadableConnection:new(host, port)
    --- @type ReadableConnection
    local o = {
		host = host,
		port = port,
		rxbuf = ""
	}
    setmetatable(o, self)
    self.__index = self
    return o
end

--- Processes the contents of rxbuf
function ReadableConnection:processBuffer()
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

return ReadableConnection
