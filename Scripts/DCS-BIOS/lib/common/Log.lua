module("Log", package.seeall)

Logger = require("Logger")
--- @type Logger
local Log = Logger:new(lfs.writedir() .. [[Logs/DCS-BIOS.log]])

return Log
