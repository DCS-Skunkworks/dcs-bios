module("Functions", package.seeall)

local Functions = {}

--- @func Returns the path of the calling script
--- @return string
function Functions.scriptPath()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

--- @func Returns value if not nil or an empty string
--- @param value string?
--- @return string
function Functions.coerce_nil_to_string(value)
	return value and value or ""
end

--- @func Constructs a string of the specified length with the left padded by whitespace if necessary.
--- @param str string? The base text
--- @param len number The length the string should be
--- @return string result A new string of length len, with whitespace padding added to the left as necessary
function Functions.padLeft(str, len)
	str = tostring(Functions.coerce_nil_to_string(str))
	return string.rep(" ", len - #str) .. str
end

--- @func Takes a string and checks for nil, returns 1 or 0
--- @param str string
--- @return integer
function Functions.nil_state_to_int_flag(str)
	if str ~= nil then
		return 1
	else
		return 0
	end
end

--- @func Takes two strings, returns "1" if neither is nil, otherwise "0"
--- @param str1 string | nil
--- @param str2 string | nil
--- @return string
function Functions.nil_states_to_str_flag(str1, str2)
	if str1 == nil or str2 == nil then
		return "0"
	end
	return "1"
end

return Functions
