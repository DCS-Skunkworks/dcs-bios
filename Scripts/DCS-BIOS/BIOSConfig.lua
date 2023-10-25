module("BIOSConfig", package.seeall)

--- @class TCPConnectionConfig
--- @field address string
--- @field port integer

--- @class UDPConnectionConfig
--- @field send_address string
--- @field send_port integer
--- @field receive_address string
--- @field receive_port integer

--- @class BIOSConfig
--- @field tcp_config TCPConnectionConfig[]
--- @field udp_config UDPConnectionConfig[]
--- @field dev_mode boolean whether dev mode is enabled and json/header files should be written
local BIOSConfig = {
	tcp_config = {
		{
			address = "*",
			port = 7778,
		},
	},
	udp_config = {
		{
			send_address = "239.255.50.10",
			send_port = 5010,
			receive_address = "*",
			receive_port = 7778,
		},
	},
	dev_mode = true,
}

return BIOSConfig
