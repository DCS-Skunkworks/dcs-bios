module("JSONHelper", package.seeall)

--- @class JSONHelper
local JSONHelper = {}

--- @func Encodes to JSON and writes to file
--- @param value any
--- @param filename string File name including path
function JSONHelper.encode_to_file(value, filename)
	local JSON = BIOS.json
	local file, err = io.open(filename, "w")

	if(err ~= nil)then
		error("Failed to open file "..filename.." for writing => "..err, 1)
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
--- @return any
function JSONHelper.decode_from_file(filename)
	local JSON = BIOS.json
	local json_string

	local file, err = io.open(filename, "r")

	if(err ~= nil)then
		error("Failed to open file "..filename.." for reading. => "..err, 1)
	end

	if(file ~= nil) then
		json_string = JSON:decode(file:read("*a"))
		file:close()
		file = nil
	end

	return json_string
end

return JSONHelper
