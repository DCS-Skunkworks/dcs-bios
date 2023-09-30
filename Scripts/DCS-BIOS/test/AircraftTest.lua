local lu = require("luaunit")

-- Unit testing starts
TestAircraft = {} --class

function TestAircraft:testA29B()
	self:validateModule(require("A-29B"), "A-29B", 0x8800)
end

function TestAircraft:testA4EC()
	self:validateModule(require("A-4E-C"), "A-4E-C", 0x8400)
end

function TestAircraft:testAH6J()
	self:validateModule(require("AH-6J"), "AH-6J", 0x6200)
end

function TestAircraft:testAlphajet()
	self:validateModule(require("Alphajet"), "Alphajet", 0x6400)
end

function TestAircraft:testBf109K4()
	self:validateModule(require("Bf-109K-4"), "Bf-109K-4", 0x4200)
end

function TestAircraft:testCEII()
	self:validateModule(require("Christen Eagle II"), "Christen Eagle II", 0x2800)
end

function TestAircraft:testCommonData()
	self:validateModule(require("CommonData"), "CommonData", 0x0400)
end

function TestAircraft:Edge540()
	self:validateModule(require("Edge540"), "Edge540", 0x5600)
end

function TestAircraft:testF22A()
	self:validateModule(require("F-22A"), "F-22A", 0x6600)
end

function TestAircraft:testFC3()
	self:validateModule(require("FC3"), "FC3", 0x6000)
end

function TestAircraft:testFW190A8()
	self:validateModule(require("FW-190A8"), "FW-190A8", 0x3800)
end

function TestAircraft:testFW190D9()
	self:validateModule(require("FW-190D9"), "FW-190D9", 0x3400)
end

function TestAircraft:testI16()
	self:validateModule(require("I-16"), "I-16", 0x4000)
end

function TestAircraft:testMetadataStart()
	self:validateModule(require("MetadataStart"), "MetadataStart", 0x0000)
end

function TestAircraft:testMetadataEnd()
	self:validateModule(require("MetadataEnd"), "MetadataEnd", 0xfffe)
end

function TestAircraft:testMi_24P()
	self:validateModule(require("Mi-24P"), "Mi-24P", 0x6800)
end

function TestAircraft:testMiG_15bis()
	self:validateModule(require("MiG-15bis"), "MiG-15bis", 0x2400)
end

function TestAircraft:testMiG_19P()
	self:validateModule(require("MiG-19P"), "MiG-19P", 0x1600)
end

function TestAircraft:testNS430()
	self:validateModule(require("NS430"), "NS430", 0x0600)
end

function TestAircraft:testP47D()
	self:validateModule(require("P-47D"), "P-47D", 0x5200)
end

function TestAircraft:testP51D()
	self:validateModule(require("P-51D"), "P-51D", 0x5000)
end

function TestAircraft:testSpitfireLFMkIX()
	self:validateModule(require("SpitfireLFMkIX"), "SpitfireLFMkIX", 0x5400)
end

function TestAircraft:testSuperCarrier()
	self:validateModule(require("SuperCarrier"), "SuperCarrier", 0x0700)
end

function TestAircraft:testVNAORoom()
	self:validateModule(require("VNAO_Room"), "VNAO_Room", 0x0500)
end

function TestAircraft:testVNAOT45()
	self:validateModule(require("VNAO_T-45"), "VNAO_T-45", 0x9000)
end

function TestAircraft:testYak52()
	self:validateModule(require("Yak-52"), "Yak-52", 0x2000)
end

--- Validates a module is as expected and that control names are valid
--- @param module Module
--- @param expected_name string
--- @param expected_address integer
function TestAircraft:validateModule(module, expected_name, expected_address)
	lu.assertEquals(module.name, expected_name)
	lu.assertEquals(module.memoryMap.baseAddress, expected_address)
	self:validateControlNames(module.name, module.documentation)
end

--- Validates that all control names follow the defined pattern and that there are no duplicates
--- @param documentation Documentation
function TestAircraft:validateControlNames(module_name, documentation)
	local all_keys = {}
	for _, category in pairs(documentation) do
		for identifier in pairs(category) do
			-- ensure all codes:
			--   are all uppercase
			--   start with a letter, number, or underscore
			--   end with a letter or number
			--   contain only letters, numbers, and underscores
			local identifier_pattern = "^[%u%d_]*[%u%d]$"
			lu.assertNotIsNil(identifier:match(identifier_pattern), module_name .. ": " .. "id " .. identifier .. " did not meet id requirements")
			--   don't have any consecutive underscores
			lu.assertNotStrContains(identifier, "__", false)

			-- verify this key is not a duplicate
			lu.assertNotIsTrue(all_keys[identifier], "identifier " .. identifier .. " already exists")
			all_keys[identifier] = true
		end
	end
end

-- class TestModule
