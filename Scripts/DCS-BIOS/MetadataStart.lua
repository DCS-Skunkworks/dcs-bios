-- This is a special module: its data will always be exported
-- and its export hooks will be called regardless of aircraft.
-- It cannot access any cockpit arguments, because it will also
-- be called when there is no active aircraft.

BIOS.protocol.beginModule("MetadataStart", 0x0000)

local defineString = BIOS.util.defineString

-- "mdata" will be set by the Protocol module
moduleBeingDefined.data = {}
local mdata = moduleBeingDefined.data

defineString("_ACFT_NAME", function() return data.acftName .. string.char(0) end, 24, "Metadata", "Aircraft Name (or NONE), null-terminated")

BIOS.protocol.endModule()