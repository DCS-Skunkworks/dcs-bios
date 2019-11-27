dofile(BIOS.LuaScriptDir..[[lib\AircraftList.lua]])

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

dofile(BIOS.LuaScriptDir..[[lib\Util.lua]])
dofile(BIOS.LuaScriptDir..[[lib\ProtocolIO.lua]])
dofile(BIOS.LuaScriptDir..[[lib\Protocol.lua]])


local JSON = loadfile([[Scripts\JSON.lua]])()
local plugin_index_file = io.open(BIOS.PluginDir..[[dcs-lua-index.json]], "r")
if plugin_index_file ~= nil then
	local plugin_index = JSON:decode(plugin_index_file:read("*a"))
	plugin_index_file:close()

	for _, plugin in pairs(plugin_index) do
		BIOS.CurrentPluginDir = plugin.pluginDir
		dofile(plugin.luaFile)
	end
	BIOS.CurrentPluginDir = nil
end

dofile(BIOS.LuaScriptDir..[[lib\MetadataEnd.lua]])
dofile(BIOS.LuaScriptDir..[[lib\MetadataStart.lua]])

dofile(BIOS.LuaScriptDir..[[BIOSConfig.lua]])

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