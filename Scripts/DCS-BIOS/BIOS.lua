BIOS = {}
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\AircraftList.lua]])

BIOS.dbg = {}
BIOS.logfile = io.open(lfs.writedir()..[[Logs\DCS-BIOS.log]], "w")
function BIOS.log(str) 
	if BIOS.logfile then
		BIOS.logfile:write(str.."\n")
		BIOS.logfile:flush()
	end
end
--in the Plane lua's to log any variables value to the BIOS.log  - BIOS.log(VARIABLE_NAME) ex: BIOS.log(freq)

package.path  = package.path..";.\\LuaSocket\\?.lua"
package.cpath = package.cpath..";.\\LuaSocket\\?.dll"
  
socket = require("socket")

dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Util.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\ProtocolIO.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Protocol.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\MetadataEnd.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\MetadataStart.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\CommonData.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\A-4E-C.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\A10C.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\AJS37.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\AV8BNA.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Bf109k4.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\C-101CC.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\ChristenEagle.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\F-14B.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\F-5E-3.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\F86.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\FA-18C_hornet.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\FC3.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\FW190A8.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\FW190D9.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\I-16.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Ka50.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\L-39ZA.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\M2000C.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\MB-339PAN.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Mi8MT.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Mig15.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Mig19.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Mig21.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\NS430.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\P-51D.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\SA342M.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\SpitfireLFMkIX.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\UH1H.lua]])
dofile(lfs.writedir()..[[scripts\DCS-BIOS\lib\Yak-52.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\BIOSConfig.lua]])

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