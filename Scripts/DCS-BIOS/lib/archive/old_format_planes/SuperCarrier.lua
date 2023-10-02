BIOS.protocol.beginModule("SuperCarrier", 0x0700)
BIOS.protocol.setExportModuleAircrafts(BIOS.ALL_PLAYABLE_AIRCRAFT)

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local definePushButton = BIOS.util.definePushButton
local defineIndicatorLight = BIOS.util.defineIndicatorLight

definePushButton("CVN_CUT_L", 0, 2, 27, "Panel", "Cut Lights")
definePushButton("CVN_WAVEOFF_L", 0, 3, 28, "Panel", "WaveOff Lights")
definePushButton("CVN_DECK_L", 0, 4, 34, "Panel", "DECK Lights On")

defineIndicatorLight("CVN_MASTER_IND", 10, "Lights", "Master Caution Light (yellow)")
defineIndicatorLight("CVN_CUT_IND", 11, "Lights", "CUT Light (green)")
defineIndicatorLight("CVN_WAVEOFF_IND", 12, "Lights", "CUT Light (red)")
defineIndicatorLight("CVN_ACLS_IND", 17, "Lights", "ACLS WaveOff Light (blue)")

BIOS.protocol.endModule()