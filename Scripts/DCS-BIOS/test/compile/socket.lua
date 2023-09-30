module("socket", package.seeall)

local MockSocket = require("MockSocket")

---@diagnostic disable-next-line: lowercase-global
socket = MockSocket:new()

return socket
