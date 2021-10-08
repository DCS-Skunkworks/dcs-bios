BIOS = {}
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\AircraftList.lua]])

BIOSdevMode = 1 -- 1 DevMode / 0 UserMode

BIOS.dbg = {}
BIOS.logfile = io.open(lfs.writedir()..[[Logs\DCS-BIOS.log]], "w")
function BIOS.log(str) 
	if BIOS.logfile then
		BIOS.logfile:write(str.."\n")
		BIOS.logfile:flush()
	end
end
--in the Plane lua's to log any variables value to the BIOS.log  - BIOS.log(VARIABLE_NAME) Example: BIOS.log(freq)

package.path  = package.path..";.\\LuaSocket\\?.lua"
package.cpath = package.cpath..";.\\LuaSocket\\?.dll"
  
socket = require("socket")

dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Util.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\ProtocolIO.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Protocol.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\MetadataEnd.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\MetadataStart.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\CommonData.lua]])
----------------------------------------------------------------------------Modules Start------------------------------------
-- Following text : Example (case sensitive!) : -- ID = x, ProperName = <pretty name>
-- is used by DCSFlightpanels GUI to pick up DCS-BIOS modules
-- ID range 1-3 is used internally in DCSFlightpanels.
-- New modules must have an uniques ID.
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\A-4E-C.lua]]) -- ID = 6, ProperName = A-4E Skyhawk
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\A-10C.lua]]) -- ID = 5, ProperName = A-10C Thunderbolt/II
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\A-29B.lua]]) -- ID = 41, ProperName = A-29B Super Tucano
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\AH-6J.lua]]) -- ID = 7, ProperName = AH-6J Littlebird
--dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\AH-64D.lua]]) -- ID = 46, ProperName = AH-64D Apache
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\AJS37.lua]]) -- ID = 8, ProperName = AJS-37 Viggen
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Alphajet.lua]]) -- ID = 9, ProperName = Alphajet
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\AV8BNA.lua]]) -- ID = 10, ProperName = AV-8B Night Attack
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Bf-109K-4.lua]]) -- ID = 11, ProperName = Bf 109 K-4 Kurfurst
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\C-101CC.lua]]) -- ID = 12, ProperName = C-101 Aviojet
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Hercules.lua]]) -- ID = 13, ProperName = C-130 Hercules
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Christen Eagle II.lua]]) -- ID = 14, ProperName = Christen Eagle II
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Edge540.lua]]) -- ID = 15, ProperName = Edge 540
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\F-14B.lua]]) -- ID = 16, ProperName = F-14A/B Tomcat
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\F-16C_50.lua]]) -- ID = 17, ProperName = F-16C Viper
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\F-22A.lua]]) -- ID = 40, ProperName = F-22A Raptor
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\F-5E-3.lua]]) -- ID = 18, ProperName = F-5E Tiger II
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\F-86F Sabre.lua]]) -- ID = 19, ProperName = F-86F Sabre
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\FA-18C_hornet.lua]]) -- ID = 20, ProperName = F/A-18C Hornet
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\FC3.lua]]) -- ID = 4, ProperName = Flaming Cliffs 3
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\FW-190A8.lua]]) -- ID = 21, ProperName = Fw 190 A-8 Anton
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\FW-190D9.lua]]) -- ID = 22, ProperName = Fw 190 D-9 Dora
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\I-16.lua]]) -- ID = 23, ProperName = I-16 
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\JF-17.lua]]) -- ID = 24, ProperName = JF-17 Thunder
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Ka-50.lua]]) -- ID = 25, ProperName = Ka-50 Black Shark
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\L-39ZA.lua]]) -- ID = 26, ProperName = L-39 Albatros
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\M-2000C.lua]]) -- ID = 27, ProperName = M-2000C
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\MB-339PAN.lua]]) -- ID = 28, ProperName = MB-339PAN
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Mi-8MT.lua]]) -- ID = 29, ProperName = Mi-8MT
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Mi-24P.lua]]) -- ID = 42, ProperName = Mi-24P HIND
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Mig-15bis.lua]]) -- ID = 30, ProperName = MiG-15bis
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Mig-19P.lua]]) -- ID = 31, ProperName = MiG-19P Farmer
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Mig-21Bis.lua]]) -- ID = 32, ProperName = MiG-21bis
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Mosquito.lua]]) -- ID = 45, ProperName = Mosquito FB Mk. VI
--dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\NS430.lua]]) -- ID = 33, ProperName = NS 430 GPS
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\P-47D.lua]]) -- ID = 34, ProperName = P-47D Thunderbolt
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\P-51D.lua]]) -- ID = 35, ProperName = TF/P-51D Mustang
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\SA342M.lua]]) -- ID = 36, ProperName = SA342 Gazelle
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\SpitfireLFMkIX.lua]]) -- ID = 37, ProperName = Spitfire LF Mk. IX
--dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\SuperCarrier.lua]]) -- ID = 44, ProperName = Super Carrier
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\UH-1H.lua]]) -- ID = 38, ProperName = UH-1H Huey
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\VNAO_Room.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\VNAO_T-45.lua]]) -- ID = 43, ProperName = T-45 Goshawk
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Yak-52.lua]]) -- ID = 39, ProperName = Yak-52
----------------------------------------------------------------------------Modules End--------------------------------------
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\BIOSConfig.lua]])

--Saves all aliases for each aircraft for consumption by others
local function saveAliases()
	local JSON = loadfile([[Scripts\JSON.lua]])()
	local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\json\AircraftAliases.json]], "w")
	local json_string = JSON:encode_pretty(BIOS.dbg.aircraftNameToModuleNames)
	if file then
		file:write(json_string)
		file:close()
	end
end
pcall(saveAliases)

-- Prev Export functions.
local PrevExport = {}
PrevExport.LuaExportStart = LuaExportStart
PrevExport.LuaExportStop = LuaExportStop
PrevExport.LuaExportBeforeNextFrame = LuaExportBeforeNextFrame
PrevExport.LuaExportAfterNextFrame = LuaExportAfterNextFrame

-- Lua Export Functions
LuaExportStart = function()
	
	for _, v in pairs(BIOS.protocol_io.connections) do v:init() end
	BIOS.protocol.init()
	
	-- Chain previously-included export as necessary
	if PrevExport.LuaExportStart then
		PrevExport.LuaExportStart()
	end
end

LuaExportStop = function()
	
	for _, v in pairs(BIOS.protocol_io.connections) do v:close() end
	
	-- Chain previously-included export as necessary
	if PrevExport.LuaExportStop then
		PrevExport.LuaExportStop()
	end
end

function LuaExportBeforeNextFrame()
	
	for _, v in pairs(BIOS.protocol_io.connections) do
		if v.step then v:step() end
	end
	
	-- Chain previously-included export as necessary
	if PrevExport.LuaExportBeforeNextFrame then
		PrevExport.LuaExportBeforeNextFrame()
	end
	
end

function LuaExportAfterNextFrame()
	
	BIOS.protocol.step()
	BIOS.protocol_io.flush()

	-- Chain previously-included export as necessary
	if PrevExport.LuaExportAfterNextFrame then
		PrevExport.LuaExportAfterNextFrame()
	end
end