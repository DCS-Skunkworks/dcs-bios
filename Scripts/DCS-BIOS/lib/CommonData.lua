-- This is a special module: its data will always be exported
-- and its export hooks will be called regardless of aircraft.
-- It cannot access any cockpit arguments, because it will also
-- be called when there is no active aircraft.

BIOS.protocol.beginModule("CommonData", 0x0000)

local documentation = moduleBeingDefined.documentation
local document = BIOS.util.document

local defineString = BIOS.util.defineString
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

-- "metadata" will be set by the Protocol module
moduleBeingDefined.metadata = {}
local metadata = moduleBeingDefined.metadata

defineString("_ACFT_NAME", function() return metadata.acftName end, 16, "Metadata", "Aircraft Name (or NONE)")
defineIntegerFromGetter("_UPDATE_COUNTER", function() return metadata.updateCounter end, 255, "Metadata", "Update Counter")
defineIntegerFromGetter("_UPDATE_SKIP_COUNTER", function() return metadata.updateSkipCounter end, 255, "Metadata", "Update Skip Counter")

BIOS.protocol.endModule()
