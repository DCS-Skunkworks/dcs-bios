-- This can be used to run the DCS-BIOS JSON generation locally without
-- starting a DCS mission
-- DCS-BIOS wiki Developer Guide have information on how to install the lua interpreter. No need to install
-- additional lua modules such as socket etc.
-- Execute => lua LocalCompile-lua or run it via VS Code task

local dcs_variant = "DCS"
DCS_USER_DIR_ROOT = os.getenv("USERPROFILE") .. "\\Saved Games\\" .. dcs_variant .. "\\"

lfs = {}
---@diagnostic disable-next-line: duplicate-set-field
lfs.writedir = function()
	return DCS_USER_DIR_ROOT
end

-- Include these that will mock the DCS APIs and the socket.
dofile(lfs.writedir() .. [[Scripts\my_dcs_location.lua]])
dofile(lfs.writedir() .. [[Scripts\DCS-BIOS\test\compile\DCS_API_mocks.lua]])
dofile(lfs.writedir() .. [[Scripts\DCS-BIOS\test\compile\socket.lua]])
dofile(lfs.writedir() .. [[Scripts\DCS-BIOS\BIOS.lua]])

-- READ THIS!
-- Create the file my_dcs_location.lua under Scripts
-- Here you specify your location of your DCS installation
-- Example (without -- in your file):

--DCS_INSTALLATION_ROOT = "e:\my games\DCS World"
