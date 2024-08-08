-- This is a special module: its data will always be exported
-- and its export hooks will be called regardless of aircraft.
-- It cannot access any cockpit arguments, because it will also
-- be called when there is no active aircraft.
module("MetadataEnd", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MetadataEnd : Module
--- setUpdateCounter
--- setUpdateSkipCounter
local MetadataEnd = Module:new("MetadataEnd", 0xfffe, {})
MetadataEnd.dev0_required = false

local updateCounter = 0
local updateSkipCounter = 0

--- Called from protocol
--- @param new_counter number
function MetadataEnd.setUpdateCounter(new_counter)
	updateCounter = new_counter
end

--- Called from protocol
--- @param new_counter number
function MetadataEnd.setUpdateSkipCounter(new_counter)
	updateSkipCounter = new_counter
end

-- "data" will be set by the Protocol module

-- place update counters at address 0xfffe
-- DCS-BIOS guarantees that the value for address 0xfffe
-- will be the last one that is written in each update.
-- Clients can use that as an "update complete" signal.
-- At the point when the write access to 0xfffe has been received,
-- all string values have been completely updated (so the client
-- can assume they are in a consistent state) and some time will
-- pass until the next update has to be processed, so it is a good
-- trigger to update graphical displays and do other time-consuming
-- operations.
MetadataEnd:defineIntegerFromGetter("_UPDATE_COUNTER", function()
	return updateCounter
end, 255, "Metadata", "Update Counter")
MetadataEnd:defineIntegerFromGetter("_UPDATE_SKIP_COUNTER", function()
	return updateSkipCounter
end, 255, "Metadata", "Update Skip Counter")

return MetadataEnd
