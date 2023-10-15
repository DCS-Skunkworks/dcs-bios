BIOS = {}

BIOSdevMode = 1 -- 1 DevMode / 0 UserMode

BIOS.dbg = {}

package.path  = package.path..";.\\LuaSocket\\?.lua"
package.cpath = package.cpath..";.\\LuaSocket\\?.dll"

package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/io/?.lua;]] .. package.path

package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/io/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/common/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/modules/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/modules/aircraft_modules/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/modules/common_modules/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/modules/documentation/?.lua;]] .. package.path
package.path = lfs.writedir() .. [[Scripts/DCS-BIOS/lib/modules/memory_map/?.lua;]] .. package.path

-- all requires must come after updates to package.path
local BIOSConfig = require("Scripts.DCS-BIOS.BIOSConfig")
local BIOSStateMachine = require("Scripts.DCS-BIOS.lib.BIOSStateMachine")
local ConnectionManager= require("Scripts.DCS-BIOS.lib.ConnectionManager")
local TCPServer = require("Scripts.DCS-BIOS.lib.io.TCPServer")
local UDPServer = require("Scripts.DCS-BIOS.lib.io.UDPServer")
local socket = require("socket") --[[@as Socket]]

local json = loadfile([[Scripts/JSON.lua]]) -- try to load json from dcs
BIOS.json = json and json() or require("JSON") -- if that fails, fall back to module that we can define

dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/Util.lua]])
dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/Protocol.lua]])
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/MetadataEnd.lua]])
local MetadataEnd = require("Scripts.DCS-BIOS.lib.modules.common_modules.MetadataEnd")
BIOS.protocol.writeNewModule(MetadataEnd)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/MetadataStart.lua]])
local MetadataStart = require("Scripts.DCS-BIOS.lib.modules.common_modules.MetadataStart")
BIOS.protocol.writeNewModule(MetadataStart)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/CommonData.lua]])
local CommonData = require("Scripts.DCS-BIOS.lib.modules.common_modules.CommonData")
BIOS.protocol.writeNewModule(CommonData)
----------------------------------------------------------------------------Modules Start------------------------------------
-- Following text: Example (case sensitive!): -- ID = x, ProperName = <pretty name>
-- is used by DCSFlightpanels GUI to pick up DCS-BIOS modules
-- ID range 1-3 is used internally in DCSFlightpanels. New modules must have an uniques ID.

-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/A-10C.lua]]) -- ID = 5, ProperName = A-10C Thunderbolt/II
local A_10C = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.A-10C")
BIOS.protocol.writeNewModule(A_10C)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/A-29B.lua]]) -- ID = 41, ProperName = A-29B Super Tucano
local A_29B = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.A-29B")
BIOS.protocol.writeNewModule(A_29B)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/A-4E-C.lua]]) -- ID = 6, ProperName = A-4E Skyhawk
local A_4E_C = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.A-4E-C")
BIOS.protocol.writeNewModule(A_4E_C)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/AH-6J.lua]]) -- ID = 7, ProperName = AH-6J Littlebird
local AH_6J = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AH-6J")
BIOS.protocol.writeNewModule(AH_6J)
--dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/AH-64D.lua]]) -- ID = 46, ProperName = AH-64D Apache
local AH_64D = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AH-64D")
BIOS.protocol.writeNewModule(AH_64D)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/AJS37.lua]]) -- ID = 8, ProperName = AJS-37 Viggen
local AJS37 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AJS37")
BIOS.protocol.writeNewModule(AJS37)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Alphajet.lua]]) -- ID = 9, ProperName = Alphajet
local Alphajet = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Alphajet")
BIOS.protocol.writeNewModule(Alphajet)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/AV8BNA.lua]]) -- ID = 10, ProperName = AV-8B Night Attack
local AV8BNA = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.AV8BNA")
BIOS.protocol.writeNewModule(AV8BNA)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Bf-109K-4.lua]]) -- ID = 11, ProperName = Bf 109 K-4 Kurfurst
local Bf_109K_4 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Bf-109K-4")
BIOS.protocol.writeNewModule(Bf_109K_4)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/C-101.lua]]) -- ID = 12, ProperName = C-101 Aviojet
local C_101 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.C-101")
BIOS.protocol.writeNewModule(C_101)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Christen Eagle II.lua]]) -- ID = 14, ProperName = Christen Eagle II
local Christen_Eagle_II = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Christen Eagle II")
BIOS.protocol.writeNewModule(Christen_Eagle_II)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Edge540.lua]]) -- ID = 15, ProperName = Edge 540
local Edge540 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Edge540")
BIOS.protocol.writeNewModule(Edge540)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/F-14.lua]]) -- ID = 16, ProperName = F-14A/B Tomcat
local F_14 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-14")
BIOS.protocol.writeNewModule(F_14)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/F-15E.lua]]) -- ID = 44, ProperName = F-15E Strike Eagle
local F_15E = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-15E")
BIOS.protocol.writeNewModule(F_15E)
dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/F-16C_50.lua]]) -- ID = 17, ProperName = F-16C Viper
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/F-22A.lua]]) -- ID = 40, ProperName = F-22A Raptor
local F_22A = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-22A")
BIOS.protocol.writeNewModule(F_22A)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/F-5E-3.lua]]) -- ID = 18, ProperName = F-5E Tiger II
local F_5E_3 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-5E-3")
BIOS.protocol.writeNewModule(F_5E_3)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/F-86F Sabre.lua]]) -- ID = 19, ProperName = F-86F Sabre
local F_86F_Sabre = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.F-86F Sabre")
BIOS.protocol.writeNewModule(F_86F_Sabre)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/FA-18C_hornet.lua]]) -- ID = 20, ProperName = F/A-18C Hornet
local FA_18C_hornet = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FA-18C_hornet")
BIOS.protocol.writeNewModule(FA_18C_hornet)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/FC3.lua]]) -- ID = 4, ProperName = Flaming Cliffs 3
local FC3 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FC3")
BIOS.protocol.writeNewModule(FC3)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/FW-190A8.lua]]) -- ID = 21, ProperName = Fw 190 A-8 Anton
local FW_190A8 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FW-190A8")
BIOS.protocol.writeNewModule(FW_190A8)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/FW-190D9.lua]]) -- ID = 22, ProperName = Fw 190 D-9 Dora
local FW_190D9 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.FW-190D9")
BIOS.protocol.writeNewModule(FW_190D9)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/I-16.lua]]) -- ID = 23, ProperName = I-16 
local I_16 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.I-16")
BIOS.protocol.writeNewModule(I_16)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/JF-17.lua]]) -- ID = 24, ProperName = JF-17 Thunder
local JF_17 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.JF-17")
BIOS.protocol.writeNewModule(JF_17)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Ka-50.lua]]) -- ID = 25, ProperName = Ka-50 Black Shark/III
local Ka_50 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Ka-50")
BIOS.protocol.writeNewModule(Ka_50)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/L-39.lua]]) -- ID = 26, ProperName = L-39 Albatros
local L_39 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.L-39")
BIOS.protocol.writeNewModule(L_39)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/M-2000C.lua]]) -- ID = 27, ProperName = M-2000C
local M_2000C = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.M-2000C")
BIOS.protocol.writeNewModule(M_2000C)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/MB-339.lua]]) -- ID = 28, ProperName = MB-339A/PAN
local MB_339 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MB-339")
BIOS.protocol.writeNewModule(MB_339)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/MH-60R.lua]]) -- ID = 50, ProperName = MH-60R SeaHawk
local MH_60R = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MH-60R")
BIOS.protocol.writeNewModule(MH_60R)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Mi-24P.lua]]) -- ID = 42, ProperName = Mi-24P HIND
local Mi_24P = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Mi-24P")
BIOS.protocol.writeNewModule(Mi_24P)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Mi-8MT.lua]]) -- ID = 29, ProperName = Mi-8MT
local Mi_8MT = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Mi-8MT")
BIOS.protocol.writeNewModule(Mi_8MT)
dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/MirageF1.lua]]) -- ID = 13, ProperName = Mirage F1
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/MiG-15bis.lua]]) -- ID = 30, ProperName = MiG-15bis
local MiG_15bis = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MiG-15bis")
BIOS.protocol.writeNewModule(MiG_15bis)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/MiG-19P.lua]]) -- ID = 31, ProperName = MiG-19P Farmer
local MiG_19P = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MiG-19P")
BIOS.protocol.writeNewModule(MiG_19P)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/MiG-21Bis.lua]]) -- ID = 32, ProperName = MiG-21bis
local MiG_21Bis = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.MiG-21Bis")
BIOS.protocol.writeNewModule(MiG_21Bis)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Mosquito.lua]]) -- ID = 45, ProperName = Mosquito FB Mk. VI
local Mosquito = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Mosquito")
BIOS.protocol.writeNewModule(Mosquito)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/NS430.lua]]) -- ID = 33, ProperName = NS 430 GPS
local NS430 = require("Scripts.DCS-BIOS.lib.modules.common_modules.NS430")
BIOS.protocol.writeNewModule(NS430)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/P-47D.lua]]) -- ID = 34, ProperName = P-47D Thunderbolt
local P_47D = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.P-47D")
BIOS.protocol.writeNewModule(P_47D)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/P-51D.lua]]) -- ID = 35, ProperName = TF/P-51D Mustang
local P_51D = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.P-51D")
BIOS.protocol.writeNewModule(P_51D)
dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/SA342.lua]]) -- ID = 36, ProperName = SA342 Gazelle
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/SpitfireLFMkIX.lua]]) -- ID = 37, ProperName = Spitfire LF Mk. IX
local SpitfireLFMkIX = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.SpitfireLFMkIX")
BIOS.protocol.writeNewModule(SpitfireLFMkIX)
--dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/SuperCarrier.lua]])
-- local SuperCarrier = require("Scripts.DCS-BIOS.lib.modules.common_modules.SuperCarrier")
-- BIOS.protocol.writeNewModule(SuperCarrier)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/UH-1H.lua]]) -- ID = 38, ProperName = UH-1H Huey
local UH_1H = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.UH-1H")
BIOS.protocol.writeNewModule(UH_1H)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/VNAO_Room.lua]])
local VNAO_Room = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.VNAO_Room")
BIOS.protocol.writeNewModule(VNAO_Room)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/VNAO_T-45.lua]]) -- ID = 43, ProperName = T-45 Goshawk
local VNAO_T_45 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.VNAO_T-45")
BIOS.protocol.writeNewModule(VNAO_T_45)
-- dofile(lfs.writedir()..[[Scripts/DCS-BIOS/lib/archive/old_format_planes/Yak-52.lua]]) -- ID = 39, ProperName = Yak-52
local Yak_52 = require("Scripts.DCS-BIOS.lib.modules.aircraft_modules.Yak-52")
BIOS.protocol.writeNewModule(Yak_52)
----------------------------------------------------------------------------Modules End--------------------------------------
--Saves aliases for each aircraft for external programs
local function saveAliases()
	local JSON = BIOS.json
	local file, err = io.open(lfs.writedir()..[[Scripts/DCS-BIOS/doc/json/AircraftAliases.json]], "w")
	local json_string = JSON:encode_pretty(BIOS.dbg.aircraftNameToModuleNames)
	if file then
		file:write(json_string)
		file:close()
	end
end
pcall(saveAliases)
-- save constants for arduino devs to a header file
pcall(BIOS.protocol.saveAddresses)

-- Prev Export functions.
local PrevExport = {}
PrevExport.LuaExportStart = LuaExportStart
PrevExport.LuaExportStop = LuaExportStop
PrevExport.LuaExportBeforeNextFrame = LuaExportBeforeNextFrame
PrevExport.LuaExportAfterNextFrame = LuaExportAfterNextFrame

local connection_manager = ConnectionManager:new({})

local state_machine = BIOSStateMachine:new(BIOS.dbg.aircraftNameToModules, MetadataStart, MetadataEnd, 11000, connection_manager)

local function process_input_line(line)
	state_machine:processInputLine(line)
end

for _, udp in ipairs(BIOSConfig.udp_config) do
	connection_manager:addConnection(UDPServer:new(udp.send_address, udp.send_port, udp.receive_address, udp.receive_port, socket, process_input_line))
end

for _, tcp in ipairs(BIOSConfig.tcp_config) do
	connection_manager:addConnection(TCPServer:new(tcp.address, tcp.port, socket, process_input_line))
end

-- Lua Export Functions
LuaExportStart = function()
	state_machine:init()

	-- Chain previously-included export as necessary
	if PrevExport.LuaExportStart then
		PrevExport.LuaExportStart()
	end
end

LuaExportStop = function()
	state_machine:shutdown()

	-- Chain previously-included export as necessary
	if PrevExport.LuaExportStop then
		PrevExport.LuaExportStop()
	end
end

function LuaExportBeforeNextFrame()
	state_machine:receive()

	-- Chain previously-included export as necessary
	if PrevExport.LuaExportBeforeNextFrame then
		PrevExport.LuaExportBeforeNextFrame()
	end
	
end

function LuaExportAfterNextFrame()
	state_machine:step()

	-- Chain previously-included export as necessary
	if PrevExport.LuaExportAfterNextFrame then
		PrevExport.LuaExportAfterNextFrame()
	end
end