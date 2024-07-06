module("Protocol", package.seeall)

local BIOSConfig = require("Scripts.DCS-BIOS.BIOSConfig")
local JSONHelper = require("Scripts.DCS-BIOS.lib.common.JSONHelper")

--- @class Protocol
--- @field private aircraftNameToModuleNames { [string]: string[] }
--- @field private exportModules { [string]: Module }
local Protocol = {
	aircraftNameToModuleNames = {},
	exportModules = {},
}

--- @private
--- @param name string the name of the module to set export aircraft for
--- @param acftList string[]
function Protocol.set_export_module_aircraft(name, acftList)
	-- add module name to all aircrafts it should be on
	for _, acftName in ipairs(acftList) do
		if Protocol.aircraftNameToModuleNames[acftName] == nil then
			-- initialize this entry if it's empty
			Protocol.aircraftNameToModuleNames[acftName] = {}
		end

		table.insert(Protocol.aircraftNameToModuleNames[acftName], name)
	end
end

--- @return { [string]: Module[] }
function Protocol.aircraft_names_to_modules()
	local aircraftNameToModules = {}

	for acftName, _ in pairs(Protocol.aircraftNameToModuleNames) do
		aircraftNameToModules[acftName] = {}
		for _, moduleName in ipairs(Protocol.aircraftNameToModuleNames[acftName]) do
			table.insert(aircraftNameToModules[acftName], Protocol.exportModules[moduleName])
		end
	end

	return aircraftNameToModules
end

--- @private
--- Writes the json for a given module
--- @param module Module the module to write
function Protocol.write_module_json(module)
	module = module

	if BIOSConfig.dev_mode then
		local function saveDoc()
			local json_file_name = lfs.writedir() .. [[Scripts/DCS-BIOS/doc/json/]] .. module.name .. ".json"
			JSONHelper.encode_to_file(module.documentation, json_file_name)

			local jsonp_file_name = lfs.writedir() .. [[Scripts/DCS-BIOS/doc/doc_assets/]] .. module.name .. ".jsonp"
			local prefix = 'docdata["' .. module.name .. '"] =\n'
			local suffix = ";\n"
			JSONHelper.encode_to_jsonp_file(module.documentation, prefix, suffix, jsonp_file_name)
		end
		pcall(saveDoc)
	end
end

--- Writes the map of aircraft names to module names to a json file for use by 3rd party applications
function Protocol.saveAliases()
	local file = lfs.writedir() .. [[Scripts/DCS-BIOS/doc/json/AircraftAliases.json]]
	JSONHelper.encode_to_file(Protocol.aircraftNameToModuleNames, file)
end

--- Writes all addresses as constants in a C header file to by used by arduino devs
function Protocol.saveAddresses()
	if BIOSConfig.dev_mode then
		local addresses = {}

		local function addLine(identifier, line)
			if not addresses[identifier] then
				addresses[identifier] = line
			end
		end

		for _, export_module in pairs(Protocol.exportModules) do
			for _, category in pairs(export_module.documentation) do
				for _, args in pairs(category) do
					local outputs = args.outputs or {}
					for _, output in ipairs(outputs) do
						-- we redefine here for a few legacy plane controls using BIOS.util.defineTumb
						local address_identifier = output.address_identifier and output.address_identifier
						local address_mask_identifier = output.address_mask_identifier
						local address_mask_shiftby_identifier = output.address_mask_shift_identifier
						local address = output.address and string.format("0x%04X", output.address) or ""

						local address_line = address_identifier and ("#define " .. address_identifier .. " " .. address)

						-- #define lines based on type
						if address_mask_shiftby_identifier and output.type == "integer" then
							--- @cast output IntegerOutput
							local shift_by = tostring(output.shift_by)
							local mask = string.format("0x%04X", output.mask)

							local address_mask_shiftby_line = "#define " .. address_mask_shiftby_identifier .. " " .. address .. ", " .. mask .. ", " .. shift_by
							addLine(address_mask_shiftby_identifier, address_mask_shiftby_line)

							if address_mask_identifier and output.max_value == 1 then
								local address_mask_line = "#define " .. address_mask_identifier .. " " .. address .. ", " .. mask
								addLine(address_mask_identifier, address_mask_line)
							elseif address_identifier and output.max_value == 65535 then
								addLine(address_identifier, address_line)
							end
						elseif address_identifier and output.type == "string" then
							addLine(address_identifier, address_line)
						end
					end
				end
			end
		end

		-- Sort the identifiers before writing
		local sortedIdentifiers = {}
		for identifier in pairs(addresses) do
			table.insert(sortedIdentifiers, identifier)
		end
		table.sort(sortedIdentifiers)

		-- Write the header file
		local address_header_file, err = io.open(lfs.writedir() .. [[Scripts/DCS-BIOS/doc/Addresses.h]], "w")
		if err or not address_header_file then
			print("Error opening file:", err) -- Print error if unable to open file
			return
		else
			for _, identifier in ipairs(sortedIdentifiers) do
				address_header_file:write(addresses[identifier] .. "\n")
			end

			address_header_file:close() -- Close the header file
		end
	end
end

--- Adds a module to the set of all modules, and writes json data for the module.
---@param mod Module
function Protocol.writeNewModule(mod)
	Protocol.exportModules[mod.name] = mod
	Protocol.set_export_module_aircraft(mod.name, mod.aircraftList)
	Protocol.write_module_json(mod)
end

return Protocol
