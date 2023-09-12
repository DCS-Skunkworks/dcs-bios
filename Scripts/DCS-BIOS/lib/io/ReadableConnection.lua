module("UDPListener", package.seeall)

local Connection = require("Connection")

--- @class ReadableConnection: Connection
--- @field private rxbuf string buffer which stores received data until it can be processed
local ReadableConnection = Connection:new("", -1)

--- Creates a socket for receiving UDP packets
--- @param host string the host to listen to
--- @param port number the port to listen on
function ReadableConnection:new(host, port)
	--- @type ReadableConnection
	local o = {
		host = host,
		port = port,
		rxbuf = "",
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- @abstract
--- Receives and processes data
--- @return boolean, string? success whether the step was successful, and the error code if not
function ReadableConnection:receive()
	error("receive must be implemented by the ReadableConnection subclass", 2)
end

--- Adds data to the buffer to be processed
--- @param data string the data to be processed
function ReadableConnection:appendToBuffer(data)
	self.rxbuf = self.rxbuf .. data
end

--- @protected
--- Processes the contents of rxbuf
function ReadableConnection:processBuffer()
	while true do
		local line, rest = self.rxbuf:match("^([^\n]*)\n(.*)")
		if line then
			self.rxbuf = rest
			BIOS.protocol.processInputLine(line) -- uses acftModules which is mutated in Protocol.lua
		else
			break
		end
	end
end

return ReadableConnection
