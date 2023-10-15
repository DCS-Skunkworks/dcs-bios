local BIOSStateMachine = require("Scripts.DCS-BIOS.lib.BIOSStateMachine")
local ConnectionManager = require("Scripts.DCS-BIOS.lib.ConnectionManager")
local MockDevice = require("Scripts.DCS-BIOS.test.controls.MockDevice")
local MockServer = require("Scripts.DCS-BIOS.test.io.MockServer")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestState
--- @field aircraft_name string?
--- @field lines_processed string[]
--- @field update_counter integer
--- @field update_skip_counter integer

-- Unit testing starts
--- @class TestStateMachine
--- @field state_machine BIOSStateMachine
--- @field state TestState
TestStateMachine = {}

-- global function used to retrieve the aircraft name
function LoGetSelfData()
	return {
		["Name"] = "My Module",
	}
end

Input_Processor_Device = MockDevice:new(0)

function GetDevice()
	return Input_Processor_Device
end

local model_time = 0

function LoGetModelTime()
	model_time = model_time + 0.01
	return model_time
end

function TestStateMachine:setUp()
	self.state = {
		lines_processed = {},
		update_counter = 0,
		update_skip_counter = 0,
	}

	model_time = 0

	local my_module = Module:new("My Module", 0x4200, { "My Module" })
	my_module:addInputProcessor("MY_CONTROL", function(value)
		table.insert(self.state.lines_processed, "MY_CONTROL " .. value)
	end)

	local metadata_start = Module:new("MetadataStart", 0x0000, {}) --[[@as MetadataStart]]
	metadata_start.setAircraftName = function(name)
		self.state.aircraft_name = name
	end

	local metadata_end = Module:new("MetadataEnd", 0xfffe, {}) --[[@as MetadataEnd]]
	metadata_end.setUpdateCounter = function(value)
		self.state.update_counter = value
	end
	metadata_end.setUpdateSkipCounter = function(value)
		self.state.update_skip_counter = value
	end

	self.state_machine = BIOSStateMachine:new({ ["My Module"] = { my_module } }, metadata_start, metadata_end, 11000, ConnectionManager:new(MockServer:new()))

	self.state_machine:init()
end

function TestStateMachine:testProcessInputLine()
	local state_machine = self.state_machine
	state_machine:step() -- sets the active module
	state_machine:processInputLine("MY_CONTROL 1")
	lu.assertEquals(#self.state.lines_processed, 1)
	lu.assertEquals("MY_CONTROL 1", self.state.lines_processed[1])
end
