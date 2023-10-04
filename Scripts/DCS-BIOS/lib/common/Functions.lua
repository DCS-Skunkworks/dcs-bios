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
--- @param str string?
--- @return integer
function Functions.nil_state_to_int_flag(str)
	return str and 1 or 0
end

--- @func Takes a strings, returns "1" if neither is nil, otherwise "0".
--- Please strongly consider using nil_state_to_int_flag instead of this function. This function exists for legacy purposes only.
--- @param str string?
--- @return string
function Functions.nil_state_to_str_flag(str)
	return str and "1" or "0"
end

return Functions
