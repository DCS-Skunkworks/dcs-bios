module("UDPServer", package.seeall)

local Server = require("Scripts.DCS-BIOS.lib.io.Server")
local UDPListener = require("Scripts.DCS-BIOS.lib.io.UDPListener")
local UDPSender = require("Scripts.DCS-BIOS.lib.io.UDPSender")

--- @class UDPServer: Server
--- @field private sender UDPSender
--- @field private listener UDPListener
local UDPServer = Server:new()

--- Creates a socket for receiving UDP packets
--- @param send_address string the address to send data to
--- @param send_port integer the port to send data to
--- @param receive_address string the address to receive data from
--- @param receive_port integer the port to receive data from
--- @param socket Socket the lua socket
--- @param on_receive fun(value: string) function to run when receiving data
--- @return UDPServer server the newly-created UDP server
function UDPServer:new(send_address, send_port, receive_address, receive_port, socket, on_receive)
	--- @type UDPServer
	local o = {
		sender = UDPSender:new(send_address, send_port, socket),
		listener = UDPListener:new(receive_address, receive_port, socket, on_receive),
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Initializes the sender and listener of the UDP server
function UDPServer:init()
	self.sender:init()
	self.listener:init()
end

--- Receives and processes incoming data
function UDPServer:step()
	self.listener:receive()
end

--- Sends data to the client
--- @param msg string the data to send
function UDPServer:send(msg)
	self.sender:send(msg)
end

--- Closes the sender and listener connections
function UDPServer:close()
	self.sender:close()
	self.listener:close()
end

return UDPServer
