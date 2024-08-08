-- This is a special module: its data will always be exported
-- and its export hooks will be called regardless of aircraft.
-- It cannot access any cockpit arguments, because it will also
-- be called when there is no active aircraft.

module("MetadataStart", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MetadataStart: Module
--- @field setAircraftName  function
local MetadataStart = Module:new("MetadataStart", 0x0000, {})
MetadataStart.dev0_required = false

-- "data" will be set by the Protocol module
local aircraft_name

--- Sets the name of the aircraft
--- @param new_aircraft_name string
function MetadataStart.setAircraftName(new_aircraft_name)
	aircraft_name = new_aircraft_name
end

MetadataStart:defineString("_ACFT_NAME", function()
	return aircraft_name .. string.char(0)
end, 24, "Metadata", "Aircraft Name (or NONE), null-terminated")

return MetadataStart
