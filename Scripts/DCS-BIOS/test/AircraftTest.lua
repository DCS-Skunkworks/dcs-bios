local lu = require("luaunit")

-- Unit testing starts
TestAircraft = {} --class

function TestAircraft:testA4EC()
	self:validateModule(require("A-4E-C"), "A-4E-C", 0x8400)
end

function TestAircraft:testI16()
	self:validateModule(require("I-16"), "I-16", 0x4000)
end

function TestAircraft:testP51D()
	self:validateModule(require("P-51D"), "P-51D", 0x5000)
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
			--   start with a letter
			--   end with a letter or number
			--   contain only letters, numbers, and underscores
			local identifier_pattern = "^%u[%u%d_]*[%u%d]$"
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
