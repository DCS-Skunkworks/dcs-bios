module("Logger", package.seeall)

local BIOSConfig = require("Scripts.DCS-BIOS.BIOSConfig")
local Functions = require("Scripts.DCS-BIOS.lib.common.Functions")

--- @class Logger
--- @field private logfile file*
--- @field private max_bytes_to_log number Used by log_table
--- @field private bytes_logged number Used by log_table
--- @field private last_message string Last logged message
--- @field private last_message_level string Level of last message
--- @field private last_message_time number Unix timestamp of last message
--- @field private last_message_duplicate_count number Count of duplicate messages
--- @field private skipped_message_time_interval number Max number of seconds between two duplicate messages
--- @field private memory_error_cache table<string, {minValue: number, maxValue: number, count: integer}> Cache for memory errors messages
local Logger = {}

--2023-10-08 09:20:49
local timeformat_length = 19

local default_log_size_limit = 50000000
local default_max_depth = 100

--ERROR
local pad_after_level = 5

--- @enum
Logger.logging_level = {
	debug = "DEBUG",
	info = "INFO",
	warn = "WARN",
	error = "ERROR",
	fatal = "FATAL",
}

--- returns timestamp in format 2023-10-08 09:26:58
--- @return string
local function getTimestamp()
	return tostring(os.date("%Y-%m-%d %X"))
end

--- Returns new Logger
--- @return Logger
function Logger:new(logfile)
	local o = {
		logfile = io.open(logfile, "w"),
		max_bytes_to_log = default_log_size_limit,
		bytes_logged = 0,
		last_message = nil,
		last_level = nil,
		last_message_time = nil,
		last_message_duplicate_count = 0,
		skipped_message_time_interval = 5,
		memory_error_cache = {},
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

--- @private
--- Tries to log the object
--- @param level string
--- @param obj any Object
function Logger:log(level, obj)
	if obj == nil then
		return
	end

	if type(obj) == "table" then
		self:log_simple(level, "Logging table, consider using setting max_bytes_to_log default=(" .. default_log_size_limit .. "), max_depth default=(" .. default_max_depth .. ") and call log_table() directly.")
		self:log_table(level, obj, 40)
	elseif type(obj) == "string" or type(obj) == "number" then
		self:log_simple(level, obj)
	end
end

--- Tries to log the object with debug level
--- @param obj any
function Logger:log_debug(obj)
	self:log(Logger.logging_level.debug, obj)
end

--- Tries to log the object with info level
--- @param obj any
function Logger:log_info(obj)
	self:log(Logger.logging_level.info, obj)
end

--- Tries to log the object with warn level
--- @param obj any
function Logger:log_warn(obj)
	self:log(Logger.logging_level.warn, obj)
end

--- Tries to log the object with error level
--- @param obj any
function Logger:log_error(obj)
	self:log(Logger.logging_level.error, obj)
end

--- Tries to log the object with fatal level
--- @param obj any
function Logger:log_fatal(obj)
	self:log(Logger.logging_level.fatal, obj)
end

--- @private
--- Logs string or number
--- @param data string|number
function Logger:log_simple(level, data)
	if data == nil then
		return
	end

	if type(data) == "table" then
		self:log_simple(level, "Error log_simple cannot log table")
		return
	end

	if type(data) == "string" or type(data) == "number" then
		if self.logfile then
			local data_str = tostring(data)
			local current_time = os.time()

			-- Check if data is duplicate and less than 5 seconds after last message
			if BIOSConfig.clean_logs and self.last_message == data_str and self.last_message_time and (current_time - self.last_message_time) < self.skipped_message_time_interval then
				self.last_message_duplicate_count = self.last_message_duplicate_count + 1
				self.last_message_time = current_time
			-- Write skipped messages summary, the new message and reset tracking variables
			else
				if BIOSConfig.clean_logs then
					if self.last_message_duplicate_count > 0 then
						self.logfile:write(Functions.pad_right(getTimestamp(), timeformat_length + 2) .. Functions.pad_right(self.last_level, pad_after_level + 2) .. self.last_message_duplicate_count .. " duplicate message(s) skipped.\n")
						self.last_message_duplicate_count = 0
					end

					self.last_message = data_str
					self.last_level = level
					self.last_message_time = current_time
				end

				self.logfile:write(Functions.pad_right(getTimestamp(), timeformat_length + 2) .. Functions.pad_right(level, pad_after_level + 2) .. data .. "\n")
			end

			self.logfile:flush()
		end
	end
end

--- Logs whether variable is nilstring or number
--- @param variableName string
--- @param variable any
function Logger:log_is_nil(variableName, variable)
	if variable == nil then
		self:log_simple(Logger.logging_level.debug, variableName .. " is nil")
		return
	end

	self:log_simple(Logger.logging_level.debug, variableName .. " is not nil")
end

--- Logs the type of the variable
--- @param name string Name of variable
--- @param variable any The variable to determine type of
function Logger:log_type(name, variable)
	local level = Logger.logging_level.debug
	if type(variable) == "table" then
		self:log_simple(level, name .. " is of type table")
	elseif type(variable) == "string" then
		self:log_simple(level, name .. " is of type string")
	elseif type(variable) == "number" and math.floor(variable) == variable then
		self:log_simple(level, name .. " is of type integer")
	elseif type(variable) == "number" then
		self:log_simple(level, name .. " is of type number")
	elseif type(variable) == "boolean" then
		self:log_simple(level, name .. " is of type boolean")
	end
end

--- Logs a table (recursively if table contains tables)
--- @param tab table Table to dump/log
--- @param max_depth integer How deep recursively to go
function Logger:log_table(level, tab, max_depth, max_bytes_to_log)
	self.bytes_logged = 0
	self.max_bytes_to_log = max_bytes_to_log or default_log_size_limit
	max_depth = max_depth or default_max_depth
	local _, buffer = self:dump_table(tab, max_depth)
	self:log_simple(level, "\n" .. buffer .. "\n")
end

--- @private
--- Dumps a table (recursively if table contains tables)
--- @param tab table Table to dump/log
--- @param max_depth integer How deep recursively to go
function Logger:dump_table(tab, max_depth)
	self.bytes_logged = 0
	-- Inner function just to hide the depth argument
	--- Recursive table dump
	--- @param tablex table
	--- @param depth number
	--- @return number, string
	local function log_tablex(tablex, depth)
		local return_value = 0
		local return_buffer = ""

		if depth > max_depth then
			local str = string.rep("\t", max_depth) .. "Depth reached in log_table() : " .. max_depth
			self.bytes_logged = self.bytes_logged + string.len(str)
			return_buffer = return_buffer .. "\n" .. str
			-- This doesn't mean the recursion should stop, just that the current excursion stops
			return 0, return_buffer
		end
		if self.bytes_logged > self.max_bytes_to_log then
			return_buffer = return_buffer .. "\n" .. "Max data reached in dump_table() : " .. self.max_bytes_to_log .. "   " .. self.bytes_logged
			return 1, return_buffer
		end

		for k, v in pairs(tablex) do
			if return_value ~= 0 then
				break
			end
			if v ~= nil then
				if type(v) == "table" then
					local str = string.rep("\t", depth) .. k .. ":"
					self.bytes_logged = self.bytes_logged + string.len(str)
					return_buffer = return_buffer .. "\n" .. str
					local tmp_buffer
					return_value, tmp_buffer = log_tablex(v, depth + 1)
					if tmp_buffer ~= nil then
						return_buffer = return_buffer .. tmp_buffer
					end
				elseif type(v) == "string" or type(v) == "number" then
					local str = string.rep("\t", depth) .. k .. ": " .. v
					self.bytes_logged = self.bytes_logged + string.len(str)
					return_buffer = return_buffer .. "\n" .. str
				end
			end
		end
		return return_value, return_buffer
	end
	local result_code, result_buffer = log_tablex(tab, 0)
	return result_code, result_buffer
end

--- Logs a table's indexes
--- @require tab table Table to dump/log
function Logger:log_table_indexes(tab)
	local level = Logger.logging_level.debug

	if tab == nil then
		self:log_simple(level, "Table to log was nil")
		return
	end

	local output = "Indexes :\n"

	for k, _ in pairs(tab) do
		if k ~= nil then
			if type(k) == "string" or type(k) == "number" then
				output = output .. k .. "\n"
			elseif type(k) == "table" then
				output = output .. "<table>" .. "\n"
			elseif type(k) == "function" then
				output = output .. "<function>" .. "\n"
			end
		end
	end

	self:log_simple(level, "\n" .. output .. "\n")
end

--- Logs an array
--- @require array to log
function Logger:log_array(array)
	local level = Logger.logging_level.debug

	if array == nil then
		self:log_simple(level, "Array to log was nil")
		return
	end

	local output = "Array :\n"
	for k, v in pairs(array) do
		if k ~= nil then
			if type(k) == "string" or type(k) == "number" then
				output = output .. k .. " : "
			elseif type(k) == "table" then
				output = output .. "<table> : "
			elseif type(k) == "function" then
				output = output .. "<function> : "
			end

			if v ~= nil then
				if type(v) == "string" or type(v) == "number" then
					output = output .. v .. "\n"
				elseif type(v) == "table" then
					output = output .. "<table>" .. "\n"
				elseif type(v) == "function" then
					output = output .. "<function>" .. "\n"
				end
			else
				output = output .. "\n"
			end
		end
	end
	self:log_simple(level, "\n" .. output .. "\n")
end

--- @param control_id string Id of the control sending a memory error
--- @param value number The current value of the control
--- @param maxAcceptedValue integer The maximum acceptable value for the control
--- @param clean_value integer
--- @param address integer
--- @param mask integer
function Logger:log_memory_error(control_id, value, maxAcceptedValue, clean_value, address, mask)
	if BIOSConfig.clean_logs then
		local cachedControlError = self.memory_error_cache[control_id]

		if not cachedControlError then
			self:log_error(string.format("MemoryAllocation.lua: value %f (originally %f) is outside of range [0, %d] for %s (address %d mask %d)", clean_value, value, maxAcceptedValue, control_id or "n/a", address, mask))

			self.memory_error_cache[control_id] = {
				minValue = value,
				maxValue = value,
				count = 1,
			}
		else
			cachedControlError.count = cachedControlError.count + 1

			if value < cachedControlError.minValue then
				cachedControlError.minValue = value
			elseif value > cachedControlError.maxValue then
				cachedControlError.maxValue = value
			end
		end
	else
		self:log_error(string.format("MemoryAllocation.lua: value %f (originally %f) is outside of range [0, %d] for %s (address %d mask %d)", clean_value, value, maxAcceptedValue, control_id or "n/a", address, mask))
	end
end

--- @param control_id string Id of the control sending a memory error
function Logger:reset_control_memory_errors(control_id)
	local cachedControlError = self.memory_error_cache[control_id]

	if cachedControlError then
		self:log_simple(Logger.logging_level.error, string.format("MemoryAllocation.lua: Skipped %d value errors for %s - Min recorded value: %f, Max recorded value: %f", cachedControlError.count, control_id, cachedControlError.minValue, cachedControlError.maxValue))
		self.memory_error_cache[control_id] = nil
	end
end

function Logger:flush_memory_error()
	for control_id, cachedControlError in pairs(self.memory_error_cache) do
		self:log_simple(Logger.logging_level.error, string.format("MemoryAllocation.lua: Skipped %d value errors for %s - Min recorded value: %f, Max recorded value: %f", cachedControlError.count, control_id, cachedControlError.minValue, cachedControlError.maxValue))
	end

	self.memory_error_cache = {}
end

return Logger
