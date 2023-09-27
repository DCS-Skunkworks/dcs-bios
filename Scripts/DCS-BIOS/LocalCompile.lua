-- This can be used to run the DCS-BIOS JSON generation locally without
-- starting a DCS mission
-- DCS-BIOS wiki have information on how to install the lua interpreter. No need to install
-- additional lua modules such as socket etc.
-- Execute => lua LocalCompile-lua

local dcs_variant = "DCS"
DCS_USER_DIR_ROOT = os.getenv ("USERPROFILE").."\\Saved Games\\"..dcs_variant.."\\"
DCS_INSTALLATION_ROOT = [[D:\DCS World]]

lfs = {}
---@diagnostic disable-next-line: duplicate-set-field
lfs.writedir = function() return DCS_USER_DIR_ROOT end

-- Include these that will mock the DCS APIs and the socket.
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\test\mocking_compile\DCS_API_mocks.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\test\mocking_compile\socket.lua]])
dofile(lfs.writedir()..[[Scripts\DCS-BIOS\BIOS.lua]])