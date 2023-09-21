package.path = "./Scripts/DCS-BIOS/test/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/test/ext/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/test/io/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/io/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/modules/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/modules/aircraft_modules/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/modules/common_modules/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/modules/documentation/?.lua;" .. package.path
package.path = "./Scripts/DCS-BIOS/lib/modules/memory_map/?.lua;" .. package.path

-- global functions that haven't been refactored yet
BIOS = {}
function BIOS.log(str) end -- noop

require("ServerTest") -- unit tests for tcp/udp server code

local lu = require("luaunit")
os.exit(lu.LuaUnit:run())
