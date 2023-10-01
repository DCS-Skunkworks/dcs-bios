module("MockServer", package.seeall)

--- @class MockServer: Server
--- @field sent_messages string[] an array of messages that have been sent
MockServer = {}

--- @return MockServer
function MockServer:new()
	--- @type MockServer
	local o = {
		sent_messages = {},
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- Initializes any socket connections
function MockServer:init()
	-- noop
end

--- Receives incoming data to be processed
function MockServer:step()
	-- noop
end

--- Sends a message to the client
--- @param message string the message to send
function MockServer:send(message)
	table.insert(self.sent_messages, message)
end

--- Closes any socket connections
function MockServer:close()
	-- noop
end

return MockServer
