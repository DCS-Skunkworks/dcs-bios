
---@func Returns the path of the calling script
---@return string
function ScriptPath()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
 end

 --- @func Takes a string and checks for nil, returns 1 or 0
 --- @param str string
 --- @return integer
 function Nil_state_to_int_flag(str)
	if str ~= nil then
		return 1
	else
		return 0
	end
end

 --- @func Takes a string and checks for nil, returns string or new empty string
 --- @param str string
 --- @return string
function Coerce_nil_to_string(str)
    if str == nil then
        return ""
    else
        return str
    end
end




