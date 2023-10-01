module("Logger", package.seeall)

--- @class Logger
--- @field private logfile file*
--- @field private maxBytesToLog number Used by log_table
--- @field private bytesLogged number Used by log_table
local Logger = {}

--- @func Returns new Logger
--- @return Logger
function Logger:new(logfile)
	local o = {
		logfile = io.open(logfile, "w"),
		maxBytesToLog = 50000,
		bytesLogged = 0
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- @func Tries to log the object
--- @param obj any Object
function Logger:log(obj)
	if(obj == nil) then return end

	if (type(obj) == "table") then
		self:log_simple("Logging table, consider using setting maxBytesToLog and call log_table() directly.")	
		self:log_table(obj, 10)
	elseif (type(obj) == "string" or type(obj) == "number") then
		self:log_simple(obj)	
	end
end

--- @func Logs string or number
--- @param data string|number
function Logger:log_simple(data)
	if(data == nil) then return end
	if (type(data) == "table") then self:log_simple("Error log_simple cannot log table") return end

	if (type(data) == "string" or type(data) == "number") then
		if self.logfile then
			self.logfile:write(data.."\n")
			self.logfile:flush()
		end
	end	
end

--- @func Logs whether variable is nilstring or number
--- @param variableName string
--- @param variable any
function Logger:log_is_nil(variableName, variable)

	if(variable == nil) then
		self:log_simple(variableName.." is nil")
		return
	end

	self:log_simple(variableName.." is not nil")
end

--- @func Logs the type of the variable
--- @param name string Name of variable
--- @param variable any The variable to determine type of
function Logger:log_type(name, variable)
	if (type(variable) == "table") then
		self:log_simple(name.." is of type table")
	elseif (type(variable) == "string") then
		self:log_simple(name.." is of type string")
	elseif (type(variable) == "number" and math.floor(variable) == variable) then
		self:log_simple(name.." is of type integer")
	elseif (type(variable) == "number") then
		self:log_simple(name.." is of type number")
	elseif (type(variable) == "boolean") then
		self:log_simple(name.." is of type boolean")
	end
end

-- Careful, this can cause GB logfile in no time
-- Future improvements :
-- Skip data in start x bytes
-- Break ALL when max depth reached
-- Break when data logged exceeds limit

--- @func Logs a table (recursively if table contains tables)
--- @param tab table Table to dump/log
--- @param max_depth integer How deep recursively to go
function Logger:log_table(tab, max_depth, max_bytes_to_log)
	self.bytesLogged = 0
	local return_code, buffer = self:dump_table(tab, max_depth, max_bytes_to_log)
	self:log(buffer)
end

function Logger:dump_table(tab, max_depth, max_bytes_to_log)
	self.bytesLogged = 0
	-- Inner function just to hide the depth argument
	--- @func Recursive table dump
	--- @param tablex table
	--- @param depth number
	--- @param max_depth number
	--- @return number, string
	local function log_tablex(tablex, depth, max_depth)
		
		local return_value = 0
		local return_buffer = ""

		if (depth > max_depth) then
			local str = "Depth reached in log_table() : "..max_depth
			self.bytesLogged = self.bytesLogged + string.len(str)
			return_buffer = return_buffer.."\n"..str
			-- This doesn't mean the recursion should stop, just that the current excursion stops
			return 0, return_buffer
		end
		if (self.bytesLogged > self.maxBytesToLog) then
			return_buffer = return_buffer.."\n".."Max data reached in dump_table() : "..self.maxBytesToLog.."   "..self.bytesLogged
			return 1, return_buffer
		end
		
		for k,v in pairs(tablex) do
			if(return_value ~= 0) then
				break
			end
			if(v ~= nil) then
				if (type(v) == "table") then
					local str = string.rep("\t", depth)..k..":"
					self.bytesLogged = self.bytesLogged + string.len(str)
					return_buffer = return_buffer.."\n"..str
					local tmp_buffer
					return_value, tmp_buffer = log_tablex(v, depth+1, max_depth)
					if(tmp_buffer ~= nil) then return_buffer = return_buffer..tmp_buffer end
				elseif(type(v) == "string" or type(v) == "number") then
					local str = string.rep("\t", depth)..k..": "..v
					self.bytesLogged = self.bytesLogged + string.len(str)
					return_buffer = return_buffer.."\n"..str
				end
			end
		end
		return return_value, return_buffer
	end
	local result_code, result_buffer = log_tablex(tab, 0, max_depth)		
	return result_code, result_buffer
end

--- @func Logs a table's indexes
--- @require tab table Table to dump/log
function Logger:log_table_indexes(tab)
	if(tab == nil) then self:log_simple("Table to log was nil") return end
	
	self:log_simple("Indexes :")
	for k,v in pairs(tab) do
		if(k ~= nil) then
			if(type(k) == "string" or type(k) == "number") then
				self:log_simple(k)
			elseif(type(k) == "table") then
				self:log_simple("<table>")
			elseif(type(k) == "function") then
				self:log_simple("<function>")
			end
		end
	end

end

return Logger