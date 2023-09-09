--- @func Gives the number of bits required to represent n
--- @param n number Value from bit length representation is wanted
--- @return integer result Number of bits required to represent n
function Bit_space_required(n)
	if(n == 0)  then return 0 end
	local result = math.floor(math.log(n) / math.log(2) + 1)
	return result
end

--- @func Takes the argument and returns it if not nil, otherwise sets it to empty string
--- @param value string String to be checked
--- @return string value A non nil string 
function Coerce_nil_to_string(value)
	if value == nil then value = "" end
	return value
end

---Constructs a string of the specified length with the left padded by whitespace if necessary.
---@param str string The base text
---@param len number The length the string should be
---@return string result A new string of length len, with whitespace padding added to the left as necessary
function PadLeft(str, len)
	str = BIOS.util.Coerce_nil_to_string(tostring(str))
    return string.rep(' ', len - #str)..str
end

function Parse_indication(indicator_id)
	local ret = {}
	local li = list_indication(indicator_id)
	if li == "" then return nil end
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		ret[name] = value
	end
	return ret
end