module("socket", package.seeall)

local MockSocket = require("Scripts.DCS-BIOS.test.io.MockSocket")

---@diagnostic disable-next-line: lowercase-global
socket = MockSocket:new()

return socket
