package.path = package.path .. ";.\\LuaSocket\\?.lua"
package.cpath = package.cpath .. ";.\\LuaSocket\\?.dll"

package.path = lfs.writedir() .. "?.lua;" .. package.path

-- all requires must come after updates to package.path
local BIOSConfig = require("Scripts.DCS-BIOS.BIOSConfig")
local BIOSStateMachine = require("Scripts.DCS-BIOS.lib.BIOSStateMachine")
local ConnectionManager = require("Scripts.DCS-BIOS.lib.ConnectionManager")
local Log = require("Scripts.DCS-BIOS.lib.common.Log")
local Protocol = require("Scripts.DCS-BIOS.lib.Protocol")
local TCPServer = require("Scripts.DCS-BIOS.lib.io.TCPServer")
local UDPServer = require("Scripts.DCS-BIOS.lib.io.UDPServer")
local socket = require("socket") --[[@as Socket]]

local MetadataEnd = require("Scripts.DCS-BIOS.lib.modules.common_modules.MetadataEnd")
local MetadataStart = require("Scripts.DCS-BIOS.lib.modules.common_modules.MetadataStart")

----------------------------------------------------------------------------Modules Start------------------------------------

local modules = {
	MetadataEnd,
	MetadataStart,
	require("Scripts.DCS-BIOS.lib.modules.common_modules.CommonData"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.A-10C"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.A-29B"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.A-4E-C"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AH-6J"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AH-64D"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AJS37"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Alphajet"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AV8BNA"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Bf-109K-4"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.C-101"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.CH-47F"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Christen Eagle II"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Edge540"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-14"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-15E"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-16C_50"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-22A"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-4E"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-5E-3"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-86F Sabre"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FA-18C_hornet"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FC3"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FW-190A8"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FW-190D9"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.I-16"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.JF-17"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Ka-50"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.L-39"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.M-2000C"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MB-339"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MH-60R"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Mi-24P"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Mi-8MT"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MirageF1"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MiG-15bis"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MiG-19P"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MiG-21Bis"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Mosquito"),
	require("Scripts.DCS-BIOS.lib.modules.common_modules.NS430"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.OH-58D"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.P-47D"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.P-51D"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.SA342"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.SpitfireLFMkIX"),
	-- require("Scripts.DCS-BIOS.lib.modules.common_modules.SuperCarrier"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.UH-1H"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.VNAO_Room"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.VNAO_T-45"),
	require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Yak-52"),
}

for _, module in ipairs(modules) do
	Protocol.writeNewModule(module)
end

----------------------------------------------------------------------------Modules End--------------------------------------
--Saves aliases for each aircraft for external programs
pcall(Protocol.saveAliases)
-- save constants for arduino devs to a header file
pcall(Protocol.saveAddresses)

-- Prev Export functions.
local PrevExport = {}
PrevExport.LuaExportStart = LuaExportStart
PrevExport.LuaExportStop = LuaExportStop
PrevExport.LuaExportBeforeNextFrame = LuaExportBeforeNextFrame
PrevExport.LuaExportAfterNextFrame = LuaExportAfterNextFrame

local connection_manager = ConnectionManager:new({})

local state_machine = BIOSStateMachine:new(Protocol.aircraft_names_to_modules(), MetadataStart, MetadataEnd, 11000, connection_manager)

local function process_input_line(line)
	state_machine:processInputLine(line)
end

for _, udp in ipairs(BIOSConfig.udp_config) do
	connection_manager:addConnection(UDPServer:new(udp.send_address, udp.send_port, udp.receive_address, udp.receive_port, socket, process_input_line))
end

for _, tcp in ipairs(BIOSConfig.tcp_config) do
	connection_manager:addConnection(TCPServer:new(tcp.address, tcp.port, socket, process_input_line))
end

-- track whether we successfully initialized dcs-bios, so we don't try exporting if something went wrong
local initialized = false

--- @param func function? the nested function to call
local function call_function_safe(func)
	if func then
		local status, result = pcall(func)
		if not status then
			Log:log_error("error calling export function from another script")
			Log:log_error(result)
		end
	end
end

-- Lua Export Functions
LuaExportStart = function()
	local status, result = pcall(state_machine.init, state_machine)

	if not status then
		Log:log_error("error initializing export server")
		Log:log_error(result)
	end

	initialized = true

	-- Chain previously-included export as necessary
	call_function_safe(PrevExport.LuaExportStart)
end

LuaExportStop = function()
	local status, result = pcall(state_machine.shutdown, state_machine)

	if not status then
		Log:log_error("error shutting down export server")
		Log:log_error(result)
	end

	initialized = false

	-- Chain previously-included export as necessary
	call_function_safe(PrevExport.LuaExportStop)
end

function LuaExportBeforeNextFrame()
	if initialized then
		local status, result = pcall(state_machine.receive, state_machine)

		if not status then
			Log:log_error("error receiving data from network connections")
			Log:log_error(result)
		end
	end

	-- Chain previously-included export as necessary
	call_function_safe(PrevExport.LuaExportBeforeNextFrame)
end

function LuaExportAfterNextFrame()
	if initialized then
		local status, result = pcall(state_machine.step, state_machine)

		if not status then
			Log:log_error("error exporting cockpit data")
			Log:log_error(result)
		end
	end

	-- Chain previously-included export as necessary
	call_function_safe(PrevExport.LuaExportAfterNextFrame)
end
