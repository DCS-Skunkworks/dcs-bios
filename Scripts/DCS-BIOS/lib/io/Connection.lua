module("Connection", package.seeall)

--- @class Connection
--- @field host string the host to connect to
--- @field port number the port on the host to connect to
local Connection = {
    host = "",
    port = -1
}

--- Creates a connection for sending packets
--- @param host string? the host to connect to
--- @param port number? the port on the host to connect to
function Connection:new(host, port)
    local o = {}
    setmetatable(o, self)
    self.__index = self
    o.host = host or o.host
    o.port = port or o.port
    return o
end

return Connection
