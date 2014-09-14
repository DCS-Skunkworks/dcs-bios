BIOS.util = {}

function BIOS.util.shallowCopy(source, dest)
	dest = dest or {}
	for k, v in pairs(source) do
		dest[k] = v
	end
	return dest
end

function BIOS.util.parse_indication(indicator_id)
	local ret = {}
	local li = list_indication(indicator_id)
	if li == "" then return nil end
	local m = li:gmatch("([^\n]+)\n")
	while true do
		local separator = m()
		if not separator then break end
		local name = m()
		local value = m()
		ret[name] = value
	end
	return ret
end
