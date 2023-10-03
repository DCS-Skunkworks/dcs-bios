
---@func Returns the path of the calling script
---@return string
function ScriptPath()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
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




