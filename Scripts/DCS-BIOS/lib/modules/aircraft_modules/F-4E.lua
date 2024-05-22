module("F-4E", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class F_4E: Module
local F_4E = Module:new("F-4E", 0x2A00, { "F-4E-45MC" })

-- weapons
local WEAPONS_DEVICE_ID = 27

-- pilot weapons panel
local PILOT_WEAPONS_PANEL = "PLT Weapons Panel"

F_4E:defineToggleSwitch("PLT_MASTER_ARM_SW", WEAPONS_DEVICE_ID, 3003, 247, PILOT_WEAPONS_PANEL, "PILOT Master Arm switch")

return F_4E
