module("BIOSAutoload", package.seeall)

local Log = require("Scripts.DCS-BIOS.lib.common.Log")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- Does the given path is an existing directory
-- @param path string
-- @return true if path is an existing directory, otherwise false
local function dirExists(path)
	local mode = lfs.attributes(path, "mode")

	return mode ~= nil and mode == "directory"
end

--- @class AutoloadData
--- @field dotted_path string
--- @field mod_path string

--- @class BIOSAutoload
local BIOSAutoload = {}

--- Look for DCS-BIOS/*.lua in each subfolders of given path
-- @param relPath string path to look for autoloads (relative to lfs.writedir())
-- @return AutoloadData[]
function BIOSAutoload.fetchAutoloadData(relPath)
	local absPath = lfs.writedir() .. relPath
	local dottedRelPath = relPath:gsub("/", "."):gsub("\\", ".")

	-- Check that the folder actually exists, if not then do nothing
	if not dirExists(absPath) then
		Log:log_error("fetchAutoloadData(): path is not a directory or is nil: '" .. absPath .. "'")
		return {}
	end

	Log:log_debug("Looking for autoloads in '" .. absPath .. "'")

	--- @type AutoloadData[]
	local datum = {}
	-- Process each available subfolders
	for folder in lfs.dir(absPath) do
		local candidateFolderAbsPath = absPath .. "\\" .. folder .. "\\"
		local candidateDCSBIOSAbsPath = candidateFolderAbsPath .. "DCS-BIOS\\"
		if dirExists(candidateDCSBIOSAbsPath) then
			local candidateDCSBIOSDottedPath = dottedRelPath .. "." .. folder .. ".DCS-BIOS."
			Log:log_debug("Looking for mods in '" .. candidateDCSBIOSAbsPath .. "'")
			for autoload in lfs.dir(candidateDCSBIOSAbsPath) do
				if autoload ~= "." and autoload ~= ".." and autoload:sub(-4) == ".lua" then
					--- @type AutoloadData
					local data = {
						dotted_path = candidateDCSBIOSDottedPath .. autoload:sub(1, -5),
						mod_path = candidateFolderAbsPath,
					}
					datum[#datum + 1] = data
				end
			end
		end
	end
	
	Log:log_debug(tostring(#datum) .. " autoloads found")
	
	return datum
end

--- Require the autoload in a safe environment
-- @param data AutoloadData
-- @return Module?
function BIOSAutoload.autoloadFromData(data)
	return BIOSAutoload.autoload(data.dotted_path, data.mod_path)
end

--- Require the autoload in a safe environment
-- @param dotted_path string path of the DCS-BIOS module in require "dotted" format
-- @param mod_path string path of the DCS mod the autoload come from
-- @return Module?
function BIOSAutoload.autoload(dotted_path, mod_path)
	-- Call in a safe environment so an error in autoload doesn't corrupt all DCS-BIOS
	local old_current_mod_path = _G["current_mod_path"]
	local succeed, errorMsgOrModule = pcall(function()
		_G["current_mod_path"] = mod_path
		local module = require(dotted_path)
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
