module("JSONHelper", package.seeall)

local JSON = require("Scripts.DCS-BIOS.lib.ext.JSON")

--- @class JSONHelper
local JSONHelper = {}

--- Encodes to JSON and writes to file
--- @param value any
--- @param filename string File name including path
function JSONHelper.encode_to_file(value, filename)
	local file, err = io.open(filename, "w")

	if err ~= nil then
		error("Failed to open file " .. filename .. " for writing => " .. err, 1)
	end

	local json_string = JSON:encode_pretty(value)
	if file then
		file:write(json_string)
		file:close()
	end
end

--- Encodes to JSONP data and writes to file
--- @param value any
--- @param prefix string data that should be written before the main value
--- @param suffix string data that should be written after the main value
--- @param filename string File name including path
function JSONHelper.encode_to_jsonp_file(value, prefix, suffix, filename)
	local file, err = io.open(filename, "w")

	if err ~= nil then
		error("Failed to open file " .. filename .. " for writing => " .. err, 1)
	end

	local json_string = JSON:encode_pretty(value)
	if file then
		file:write(prefix)
		file:write(json_string)
		file:write(suffix)
		file:close()
	end
end

--- @deprecated
--- Encodes to JSON and writes to file
--- @param filename string File name including path
--- @return table
function JSONHelper.decode_from_file(filename)
	local json_table

	local file, err = io.open(filename, "r")

	if err ~= nil then
		error("Failed to open file " .. filename .. " for reading. => " .. err, 1)
	end

	if file ~= nil then
		--- @type table
		json_table = JSON:decode(file:read("*a"))
		file:close()
	end

	return json_table or {}
end

return JSONHelper
