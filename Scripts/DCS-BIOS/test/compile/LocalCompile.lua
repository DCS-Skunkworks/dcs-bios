-- This can be used to run the DCS-BIOS JSON generation locally without
-- starting a DCS mission
-- DCS-BIOS wiki Developer Guide have information on how to install the lua interpreter. No need to install
-- additional lua modules such as socket etc.
-- Execute => lua LocalCompile-lua or run it via VS Code task

package.path = "./Scripts/DCS-BIOS/test/compile/?.lua;" .. package.path

lfs = require("Scripts.DCS-BIOS.test.compile.lfs")

-- Include these that will mock the DCS APIs and the socket.
dofile([[Scripts/DCS-BIOS/BIOS.lua]])
