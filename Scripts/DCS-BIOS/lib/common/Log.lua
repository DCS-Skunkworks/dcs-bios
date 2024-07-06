module("Log", package.seeall)

local Logger = require("Scripts.DCS-BIOS.lib.common.Logger")

--- @type Logger
local Log = Logger:new(lfs.writedir() .. [[Logs/DCS-BIOS.log]])

return Log
