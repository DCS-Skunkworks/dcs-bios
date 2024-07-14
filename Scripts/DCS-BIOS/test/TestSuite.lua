lfs = require("Scripts.DCS-BIOS.test.compile.lfs")

require("Scripts.DCS-BIOS.test.AircraftTest") -- high-level tests for specific aircraft
require("Scripts.DCS-BIOS.test.ConnectionManagerTest") -- unit tests for send/receive logic
require("Scripts.DCS-BIOS.test.MemoryMapTest") -- unit tests for the memory map
require("Scripts.DCS-BIOS.test.MemoryMapEntryTest") -- unit tests for memory map entries
require("Scripts.DCS-BIOS.test.ModuleTest") -- unit tests for core aircraft module functionality
require("Scripts.DCS-BIOS.test.ParseCockpitParamsTest") -- unit tests for the parse_cockpit_params function
require("Scripts.DCS-BIOS.test.ParseIndicationTest") -- unit tests for the parse_indication function
require("Scripts.DCS-BIOS.test.ServerTest") -- unit tests for tcp/udp server code
require("Scripts.DCS-BIOS.test.StateMachineTest") -- unit tests for the core state machine loop

local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")
os.exit(lu.LuaUnit:run())
