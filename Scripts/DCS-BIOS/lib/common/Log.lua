module("Log", package.seeall)

Logger = require("Scripts.DCS-BIOS.lib.common.Logger")
--- @type Logger
local Log = Logger:new(lfs.writedir() .. [[Logs/DCS-BIOS.log]])

return Log
