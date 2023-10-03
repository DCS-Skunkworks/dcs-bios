module("JSONHelper", package.seeall)

local json = loadfile([[Scripts/JSON.lua]]) -- try to load json from dcs
local JSON = json and json() or require("JSON") -- if that fails, fall back to module that we can define

--- @class JSONHelper
local JSONHelper = {}

--- @func Encodes to JSON and writes to file
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
		file = nil
	end
end

--- @func Encodes to JSON and writes to file
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
		file = nil
	end

	return json_table or {}
end

return JSONHelper
