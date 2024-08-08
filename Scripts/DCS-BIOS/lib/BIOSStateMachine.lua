module("BIOSStateMachine", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")

--- @class BIOSStateMachine
--- @field private modules_by_name {[string]: Module[]} a map of module names to the modules to send data for
--- @field private metadata_start MetadataStart the MetadataStart module
--- @field private metadata_end MetadataEnd the MetadataEnd module
--- @field private max_bytes_per_second integer the maximum amount of data per second to send
--- @field private connection_manager ConnectionManager a connection manager with all active connections
--- @field private active_aircraft_name string? the name of the current aircraft
--- @field private bytes_in_transit integer the number of bytes currently being sent over the wire
--- @field private active_modules Module[] modules which are currently being exported (i.e. modules associated with the active aircraft)
--- @field private update_counter integer a frame counter which ticks with every frame
--- @field private update_skip_counter integer a counter which increments for every skipped frame due to too much data being sent
--- @field private next_step_time number the time at which the next frame tick should occur
--- @field private last_frame_time number the time at which the last frame tick occurred
local BIOSStateMachine = {}

--- Constructs a new BIOS state machine
--- @param modules_by_name {[string]: Module[]} a map of module names to the modules to send data for
--- @param metadata_start MetadataStart the MetadataStart module
--- @param metadata_end MetadataEnd the MetadataEnd module
--- @param max_bytes_per_second integer the maximum amount of data per second to send
--- @param connection_manager ConnectionManager a connection manager with all active connections
--- @return BIOSStateMachine
function BIOSStateMachine:new(modules_by_name, metadata_start, metadata_end, max_bytes_per_second, connection_manager)
	--- @type BIOSStateMachine
	local o = {
		modules_by_name = modules_by_name,
		metadata_start = metadata_start,
		metadata_end = metadata_end,
		max_bytes_per_second = max_bytes_per_second,
		connection_manager = connection_manager,
		bytes_in_transit = 0,
		active_modules = {},
		update_counter = 0,
		update_skip_counter = 0,
		next_step_time = 0,
		last_frame_time = 0,
	}
	setmetatable(o, self)
	self.__index = self
	return o
end

function BIOSStateMachine:processInputLine(line)
	local cmd, args = line:match("^([^ ]+) (.*)")

	if cmd then
		for _, module in ipairs(self.active_modules) do
			local processor = module.inputProcessors[cmd]
			if processor then
				local success, err = pcall(processor, args)

				if not success then
					Log:log_error(string.format("error processing input for %s", cmd))
					Log:log_error(err)
				end
			end
		end
	end
end

--- @private
--- @param module Module
--- @param dev0 CockpitDevice?
function BIOSStateMachine:queue_module_data(module, dev0)
	dev0 = module.dev0_required and dev0 or {} -- if dev0 isn't required, just pass an empty object
	if dev0 ~= nil then
		for _, hook in ipairs(module.exportHooks) do
			local status, result = pcall(hook, dev0)

			if not status then
				Log:log_error(module.name .. ": error calling export hook")
				Log:log_error(result)
			end
		end
	end

	-- legacy behavior - for some reason, we seem to typically call this twice. Is this because modules are getting too big?
	module.memoryMap:autosyncStep()
	module.memoryMap:autosyncStep()
	local data = module.memoryMap:flushData()
	self.bytes_in_transit = self.bytes_in_transit + data:len()
	self.connection_manager:queue(data)
end

function BIOSStateMachine:init()
	for _, connection in ipairs(self.connection_manager.connections) do
		connection:init()
	end
end

function BIOSStateMachine:receive()
	for _, connection in ipairs(self.connection_manager.connections) do
		if connection.step then
			connection:step()
		end
	end
end

local frame_sync_sequence = string.char(0x55, 0x55, 0x55, 0x55)

function BIOSStateMachine:step()
	-- rate limiting
	local curTime = LoGetModelTime()
	self.bytes_in_transit = self.bytes_in_transit - ((curTime - self.last_frame_time) * self.max_bytes_per_second)
	self.last_frame_time = curTime
	if self.bytes_in_transit < 0 then
		self.bytes_in_transit = 0
	end

	-- determine active aircraft
	local self_data = LoGetSelfData()
	local current_aircraft_name = self_data and self_data["Name"] or "NONE"

	self.metadata_start.setAircraftName(current_aircraft_name)

	self.active_modules = self.modules_by_name[current_aircraft_name] or {}
	if self.active_aircraft_name ~= current_aircraft_name then
		for _, acftModule in ipairs(self.active_modules) do
			acftModule.memoryMap:clearValues()
		end
		self.active_aircraft_name = current_aircraft_name
	end

	-- export data
	if curTime < self.next_step_time then
		return -- runs 30 times per second
	end

	self.update_counter = (self.update_counter + 1) % 256
	self.metadata_end.setUpdateCounter(self.update_counter)

	-- if the last frame update has not been completely transmitted, skip a frame
	if self.bytes_in_transit > 0 then
		-- TODO: increase a frame skip counter for logging purposes
		self.update_skip_counter = (self.update_skip_counter + 1) % 256
		return
	end
	self.metadata_end.setUpdateSkipCounter(self.update_skip_counter)
	self.next_step_time = curTime + 0.033

	-- send frame sync sequence
	self.bytes_in_transit = self.bytes_in_transit + 4
	self.connection_manager:queue(frame_sync_sequence)

	local dev0 = GetDevice(0)
	if dev0 and type(dev0) ~= "number" then -- this type check is legacy code - unclear if this is still possible
		dev0:update_arguments()
	end

	-- export aircraft-independent data
	self:queue_module_data(self.metadata_start, dev0)

	-- Export aircraft data
	for _, module in ipairs(self.active_modules) do
		self:queue_module_data(module, dev0)
	end

	self:queue_module_data(self.metadata_end, dev0)

	self.connection_manager:send_queue()
end

function BIOSStateMachine:shutdown()
	local dev0 = GetDevice(0)

	-- Nullify the aircraft name and publish one last frame to identify end of mission.
	self.metadata_start.setAircraftName("")

	-- send frame sync sequence
	self.connection_manager:queue(frame_sync_sequence)

	-- export aircraft-independent data: MetadataStart
	self:queue_module_data(self.metadata_start, dev0)

	-- export aircraft-independent data: MetadataEnd
	self:queue_module_data(self.metadata_end, dev0)

	self.connection_manager:send_queue()

	-- close any open connections
	for _, connection in ipairs(self.connection_manager.connections) do
		connection:close()
	end
end

return BIOSStateMachine
