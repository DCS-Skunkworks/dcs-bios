module("MiG-29A", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MiG_29A: Module
local MiG_29A = Module:new("MiG-29A", 0x3c00, { "MiG-29A" })

local devices = {}

return MiG_29A
