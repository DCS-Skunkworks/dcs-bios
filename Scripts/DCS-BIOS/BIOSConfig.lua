local UDPServer = require "lib.io.UDPServer"
local UDPSender = require "lib.io.UDPSender"
local UDPListener = require "lib.io.UDPListener"
local TCPServer = require "lib.io.TCPServer"

BIOS.protocol_io.connections = {
	UDPServer:new(
		UDPSender:new(),
		UDPListener:new()
	),
	TCPServer:new()
}
