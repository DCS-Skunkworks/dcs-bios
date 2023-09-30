module("SuperCarrier", package.seeall)

local Module = require("Module")

--- @class SuperCarrier: Module
local SuperCarrier = Module:new("SuperCarrier", 0x0700, BIOS.ALL_PLAYABLE_AIRCRAFT)

SuperCarrier:definePushButton("CVN_CUT_L", 0, 2, 27, "Panel", "Cut Lights")
SuperCarrier:definePushButton("CVN_WAVEOFF_L", 0, 3, 28, "Panel", "WaveOff Lights")
SuperCarrier:definePushButton("CVN_DECK_L", 0, 4, 34, "Panel", "DECK Lights On")

SuperCarrier:defineIndicatorLight("CVN_MASTER_IND", 10, "Lights", "Master Caution Light (yellow)")
SuperCarrier:defineIndicatorLight("CVN_CUT_IND", 11, "Lights", "CUT Light (green)")
SuperCarrier:defineIndicatorLight("CVN_WAVEOFF_IND", 12, "Lights", "CUT Light (red)")
SuperCarrier:defineIndicatorLight("CVN_ACLS_IND", 17, "Lights", "ACLS WaveOff Light (blue)")

return SuperCarrier
