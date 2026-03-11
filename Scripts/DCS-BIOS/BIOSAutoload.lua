module("BIOSAutoload", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")

local function dirExists(path)
	local mode, errmsg
	mode, errmsg = lfs.attributes (path, "mode")

	return mode ~= nil and mode == "directory"
end

--- @class BIOSAutoload
local BIOSAutoload = {}

--- Look for DCS-BIOS/*.lua in each subfolders of given path
-- @param relPath path to look for autoloads (relative to lfs.writedir())
function BIOSAutoload.fetchAutoloadData(relPath)
	local absPath = lfs.writedir() .. relPath
	local dottedRelPath = relPath:gsub("/", "."):gsub("\\", ".")

	-- Check that the folder actually exists, if not then do nothing
	if not dirExists(absPath) then
		Log:log_error("AutoloadSearch(): path is not a directory or is null: '" .. absPath .. "'")
		return
	end

	Log:log_debug("Looking for autoloads in '" .. absPath .. "'")
	
	local autoloads = {}
	-- Process each available subfolders
	for folder in lfs.dir(absPath) do
		local candidateFolderAbsPath = absPath .. "\\" .. folder .. "\\"
		local candidateDCSBIOSAbsPath = candidateFolderAbsPath .. "DCS-BIOS\\"
		if dirExists(candidateDCSBIOSAbsPath) then
			local candidateDCSBIOSDottedPath = dottedRelPath .. "." .. folder .. ".DCS-BIOS."
			Log:log_debug("Looking for mods in '" .. candidateDCSBIOSAbsPath .. "'")
			for autoload in lfs.dir(candidateDCSBIOSAbsPath) do
				if autoload ~= "." and autoload ~= ".." and autoload:sub(-4) == ".lua" then
					autoloads[#autoloads+1] = {
						dotted_path = candidateDCSBIOSDottedPath .. autoload:sub(1, -5),
						current_mod_path = candidateFolderAbsPath
					}
				end
			end
		end
	end
	return autoloads
end

--- Require the autoload in a safe environment
-- @param autoloadData structure with current_mod_path and dotted_path attributes
-- @return the module if succeed otherwise nil
function BIOSAutoload.autoloadFromData(autoloadData)
	return BIOSAutoload.autoload(autoloadData.dotted_path, autoloadData.current_mod_path)
end

--- Require the autoload in a safe environment
-- @param dotted_path path of the DCS-BIOS module in require "dotted" format
-- @param current_mod_path path of the DCS mod the autoload come from
-- @return the module if succeed otherwise nil
function BIOSAutoload.autoload(dotted_path, current_mod_path)
	-- Call in a safe environment so an error in autoload doesn't corrupt all DCS-BIOS
	local old_current_mod_path = _G["current_mod_path"]
	local succeed, errorMsgOrModule = pcall(function()
		_G["current_mod_path"] = current_mod_path
		module = require(dotted_path)
		if type(module) ~= "table" or getmetatable(module) ~= Module then
			error("Should return a Module. Did you call Module:new(...)?")
		end
		return module
	end)
	_G["current_mod_path"] = old_current_mod_path

	if not succeed then
		Log:log_error("Failed autoloading '" .. dotted_path .. "'")
		Log:log_error(errorMsgOrModule) -- if failed errorMsgOrModule == errorMsg
	else
		Log:log_info("Autoloaded '" .. dotted_path .. "'")
		return errorMsgOrModule -- if succeed errorMsgOrModule == return value (the module)
	end
end

return BIOSAutoload
