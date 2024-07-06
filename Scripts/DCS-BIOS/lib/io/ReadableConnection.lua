module("ReadableConnection", package.seeall)

local Connection = require("Scripts.DCS-BIOS.lib.io.Connection")

--- @class ReadableConnection: Connection
--- @field private rxbuf string buffer which stores received data until it can be processed
--- @field private on_receive fun(value: string) function to run when receiving data
local ReadableConnection = Connection:new("", -1, {}) -- todo: can we remove the new? can we just have a blank object?

--- Creates a socket for receiving UDP packets
--- @param host string the host to listen to
--- @param port number the port to listen on
--- @param socket Socket the socket to use
--- @param on_receive fun(value: string) function to run when receiving data
--- @return ReadableConnection connection the new readable connection
function ReadableConnection:new(host, port, socket, on_receive)
	local o = Connection:new(host, port, socket)
	setmetatable(o, self)
	self.__index = self
	---@cast o ReadableConnection
	o.rxbuf = ""
	o.on_receive = on_receive
	return o
end

--- @abstract
--- Receives and processes data
--- @return boolean, string? success whether the step was successful, and the error code if not
function ReadableConnection:receive() -- luacheck: ignore 212
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
			self.on_receive(line)
		else
			break
		end
	end
end

return ReadableConnection
