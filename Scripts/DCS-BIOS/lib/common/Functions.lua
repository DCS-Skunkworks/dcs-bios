module("Functions", package.seeall)

local Functions = {}

---Returns the path of the calling script
---@return string
function Functions.ScriptPath()
	local str = debug.getinfo(2, "S").source:sub(2)
	return str:match("(.*/)")
end

---@func Returns value if not nil or an empty string
---@param value string
---@return string
function Functions.Coerce_nil_to_string(value)
	if value == nil then
		return ""
	else
		return value
	end
end

--Constructs a string of the specified length with the left padded by whitespace if necessary.
---@param str string The base text
---@param len number The length the string should be
---@return string result A new string of length len, with whitespace padding added to the left as necessary
function Functions.PadLeft(str, len)
	str = tostring(Functions.Coerce_nil_to_string(str))
	return string.rep(" ", len - #str) .. str
end

return Functions
