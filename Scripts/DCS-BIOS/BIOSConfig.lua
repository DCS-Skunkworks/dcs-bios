local ProtocolIO = require("ProtocolIO")
local TCPServer = require("TCPServer")
local UDPServer = require("UDPServer")
local socket = require("socket") --[[@as Socket]]

local udp_send_address = "239.255.50.10"
local udp_send_port = 5010
local udp_receive_address = "*"
local udp_receive_port = 7778

local tcp_address = "*"
local tcp_port = 7778

ProtocolIO.connections = {
	UDPServer:new(udp_send_address, udp_send_port, udp_receive_address, udp_receive_port, socket, BIOS.protocol.processInputLine),
	TCPServer:new(tcp_address, tcp_port, socket, BIOS.protocol.processInputLine),
}
