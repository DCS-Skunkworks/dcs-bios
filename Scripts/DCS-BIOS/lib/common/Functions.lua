
---@func Returns the path of the calling script
---@return string
function ScriptPath()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
 end

 ---@func Returns value if not nil or an empty string
 ---@param value string
 ---@return string
 function Coerce_nil_to_string(value)
	if value == nil then
		return ""
	else
		return value
	end
end




