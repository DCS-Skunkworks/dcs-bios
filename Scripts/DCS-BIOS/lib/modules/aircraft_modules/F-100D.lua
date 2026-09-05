module("F-100D", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_100D: Module
local F_100D = Module:new("F-100D Super Sabre", 0xa600, { "F-100D Super Sabre" })

-- Special Args:

local devices = {}

return F_100D
