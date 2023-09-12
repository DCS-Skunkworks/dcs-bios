local TCPServer = require("lib.io.TCPServer")
local UDPListener = require("lib.io.UDPListener")
local UDPSender = require("lib.io.UDPSender")
local UDPServer = require("lib.io.UDPServer")

BIOS.protocol_io.connections = {
	UDPServer:new(
		UDPSender:new("239.255.50.10", 5010),
		UDPListener:new("*", 7778)
	),
	TCPServer:new("*", 7778),
}
