BIOS = {}
BIOS.logfile = io.open(lfs.writedir()..[[Logs\dcs-bios.log]], "w")
function BIOS.log(str)
	if BIOS.logfile then
		BIOS.logfile:write(str.."\n")
		BIOS.logfile:flush()
	end
end

package.path  = package.path..";.\\LuaSocket\\?.lua"
package.cpath = package.cpath..";.\\LuaSocket\\?.dll"
  
socket = require("socket")

dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Util.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\ProtocolIO.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\Protocol.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\CommonData.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\A10C.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\lib\UH1H.lua]])

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


