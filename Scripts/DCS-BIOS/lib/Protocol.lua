BIOS.protocol = {}

--- @type Module[]
local exportModules = {}
local aircraftNameToModuleNames = {}
local aircraftNameToModules = {}

function BIOS.protocol.setExportModuleAircrafts(acftList)
	-- first, delete moduleName from all mappings
	for _, moduleNames in pairs(aircraftNameToModuleNames) do
		local newModuleNames = {}
		for _, moduleName in pairs(moduleNames) do
			if moduleName ~= moduleBeingDefined.name then
				newModuleNames[#newModuleNames+1] = moduleName
			end
		end
	end

	-- next, add module name to all aircrafts it should be on
	for _, acftName in pairs(acftList) do
		if aircraftNameToModuleNames[acftName] == nil then
			aircraftNameToModuleNames[acftName] = {moduleBeingDefined.name}
		else
			local moduleList = aircraftNameToModuleNames[acftName]
			moduleList[#moduleList+1] = moduleBeingDefined.name
		end
	end

	-- recompute aircraftNameToModules
	aircraftNameToModules = {}
	for acftName, _ in pairs(aircraftNameToModuleNames) do
		local modules = {}
		aircraftNameToModules[acftName] = modules
		for _, moduleName in pairs(aircraftNameToModuleNames[acftName]) do
			modules[#modules+1] = exportModules[moduleName]
		end
	end

	BIOS.dbg.aircraftNameToModuleNames = aircraftNameToModuleNames
	BIOS.dbg.aircraftNameToModules = aircraftNameToModules
end

function BIOS.protocol.beginModule(name, baseAddress)
	moduleBeingDefined = {}
	moduleBeingDefined.name = name
	moduleBeingDefined.documentation = {}
	moduleBeingDefined.inputProcessors = {}
	moduleBeingDefined.memoryMap = BIOS.util.MemoryMap:create { baseAddress = baseAddress }
	moduleBeingDefined.exportHooks = {}
	exportModules[name] = moduleBeingDefined
end
function BIOS.protocol.endModule()
	if BIOSdevMode == 1 then
	local function saveDoc()
		local JSON = BIOS.json
		local file, err = io.open(lfs.writedir()..[[Scripts/DCS-BIOS/doc/json/]]..moduleBeingDefined.name..".json", "w")
		local json_string = JSON:encode_pretty(moduleBeingDefined.documentation)
		if file then
			file:write(json_string)
			file:close()
		end
		local file, err = io.open(lfs.writedir()..[[Scripts/DCS-BIOS/doc/json/]]..moduleBeingDefined.name..".jsonp", "w")
		if file then
			file:write('docdata["'..moduleBeingDefined.name..'"] =\n')
			file:write(json_string)
			file:write(";\n")
			file:close()
		end
	end
	pcall(saveDoc)
	moduleBeingDefined = nil
	end
end
function BIOS.protocol.saveAddresses()
	if BIOSdevMode == 1 then
		local addresses = {}

		local function addLine(identifier, line)
			if not addresses[identifier] then
				addresses[identifier] = line
			end
		end

		for moduleName, moduleBeingDefined in pairs(exportModules) do
			for _, category in pairs(moduleBeingDefined.documentation) do
				for identifier, args in pairs(category) do
					local outputs = args.outputs or {}
					for _, output in pairs(outputs) do
						local address_identifier = (output.address_mask_shift_identifier or BIOS.util.addressDefineIdentifier(moduleName, identifier)) .. "_A"
						local address_mask_identifier = (output.address_mask_shift_identifier or BIOS.util.addressDefineIdentifier(moduleName, identifier)) .. "_AM"
						local address_mask_shiftby_identifier = output.address_mask_shift_identifier or BIOS.util.addressDefineIdentifier(moduleName, identifier)
						local address = output.address and string.format("0x%04X", output.address) or ""
						local mask = output.mask and string.format("0x%04X", output.mask) or ""
						local shift_by = output.shift_by and tostring(output.shift_by) or ""

						local address_line = "#define " .. address_identifier .. " " .. address
						local address_mask_line = "#define " .. address_mask_identifier .. " " .. address .. ", " .. mask
						local address_mask_shiftby_line = "#define " .. address_mask_shiftby_identifier .. " " .. address .. ", " .. mask .. ", " .. shift_by

						-- #define lines based on type
						if output.type == "integer" then
							addLine(address_mask_shiftby_identifier, address_mask_shiftby_line)
							if output.max_value == 1 then
								addLine(address_mask_identifier, address_mask_line)
							elseif output.max_value == 65535 then
								addLine(address_identifier, address_line)
							end
						end
						if output.type == "string" then
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
		local address_header_file, err = io.open(lfs.writedir()..[[Scripts/DCS-BIOS/doc/Addresses.h]], "w")
		if err then
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
function BIOS.protocol.writeNewModule(mod)
	moduleBeingDefined = mod
	exportModules[mod.name] = mod
	BIOS.protocol.setExportModuleAircrafts(mod.aircraftList)
	BIOS.protocol.endModule()
end
