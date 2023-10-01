
---@func Returns path of scripts calling it
---@return string
function ScriptPath()
    local str = debug.getinfo(2, "S").source:sub(2)
    return str:match("(.*/)")
 end