BIOS.protocol = {}
BIOS.protocol.maxBytesPerSecond = BIOS.protocol.maxBytesPerSecond or 11000
BIOS.protocol.maxBytesInTransit = BIOS.protocol.maxBytesPerSecond or 4000

local exportModules = {}
local aircraftNameToModuleNames = {}
local aircraftNameToModules = {}
local lastAcftName = ""

function BIOS.protocol.setExportModuleAircrafts(acftList)
	-- first, delete moduleName from all mappings
	local newAircraftNameToModuleNames = {}
	for acftName, moduleNames in pairs(aircraftNameToModuleNames) do
		local newModuleNames = {}
		newAircraftNameToModuleNames[acftName] = newModuleNames
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
	for acftName, moduleNames in pairs(aircraftNameToModuleNames) do
		local modules = {}
		aircraftNameToModules[acftName] = modules
		for _, moduleName in pairs(aircraftNameToModuleNames[acftName]) do
			modules[#modules+1] = exportModules[moduleName]
		end
	end

	BIOS.dbg.aircraftNameToModuleNames = aircraftNameToModuleNames
	BIOS.dbg.aircraftNameToModules = aircraftNameToModules
	BIOS.dbg.exportModules = exportModules

	lastAcftName = ""
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
		local JSON = loadfile([[Scripts\JSON.lua]])()
		local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\json\]]..moduleBeingDefined.name..".json", "w")
		local json_string = JSON:encode_pretty(moduleBeingDefined.documentation)
		if file then
			file:write(json_string)
			file:close()
		end
		local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\json\]]..moduleBeingDefined.name..".jsonp", "w")
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
		local address_header_file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\Addresses.h]], "w")
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

local metadataStartModule = nil
local metadataEndModule = nil
function BIOS.protocol.init()
	-- called after all aircraft modules have been loaded
	metadataStartModule = exportModules["MetadataStart"]
	metadataEndModule = exportModules["MetadataEnd"]

	BIOS.protocol.saveAddresses()
end

local acftModules = nil
bytesInTransit = 0

function BIOS.protocol.processInputLine(line)
	local cmd, args = line:match("^([^ ]+) (.*)")
	if cmd == "SYNC" and args == "E" then
		argumentCache = {}
	end
	if cmd then
		if acftModules then
			for _, acftModule in pairs(acftModules) do
				if acftModule.inputProcessors[cmd] then
					acftModule.inputProcessors[cmd](args)
				end
			end
		end
	end
end

local nextLowFreqStepTime = 0
local nextHighFreqStepTime = 0

local lastFrameTime = LoGetModelTime()

local updateCounter = 0
local updateSkipCounter = 0
function BIOS.protocol.step()
	-- rate limiting
	local curTime = LoGetModelTime()
	bytesInTransit = bytesInTransit - ((curTime - lastFrameTime) * BIOS.protocol.maxBytesPerSecond)
	lastFrameTime = curTime
	if bytesInTransit < 0 then bytesInTransit = 0 end

	-- determine active aircraft
	local acftName = "NONE"
	local selfData = LoGetSelfData()
	if selfData then
		acftName = selfData["Name"]
	end
	metadataStartModule.data.acftName = acftName
	acftModules = aircraftNameToModules[acftName]
	if lastAcftName ~= acftName then
		if acftModules then
			for _, acftModule in pairs(acftModules) do
				acftModule.memoryMap:clearValues()
			end
		end
		lastAcftName = acftName
	end

	-- export data
	if curTime >= nextLowFreqStepTime then
		-- runs 30 times per second
		updateCounter = (updateCounter + 1) % 256
		metadataEndModule.data.updateCounter = updateCounter

		-- if the last frame update has not been completely transmitted, skip a frame
		if bytesInTransit > 0 then
			-- TODO: increase a frame skip counter for logging purposes
			updateSkipCounter = (updateSkipCounter + 1) % 256
			return
		end
		metadataEndModule.data.updateSkipCounter = updateSkipCounter
		nextLowFreqStepTime = curTime + .033

		-- send frame sync sequence
		bytesInTransit = bytesInTransit + 4
		BIOS.protocol_io.queue(string.char(0x55, 0x55, 0x55, 0x55))

		-- export aircraft-independent data
		for k, v in pairs(metadataStartModule.exportHooks) do v() end
		metadataStartModule.memoryMap:autosyncStep()
		local data = metadataStartModule.memoryMap:flushData()
		bytesInTransit = bytesInTransit + data:len()
		BIOS.protocol_io.queue(data)

		if acftModules then
			for _, acftModule in pairs(acftModules) do
				local dev0 = GetDevice(0)
				if dev0 ~= nil and type(dev0) ~= "number" then
					dev0:update_arguments()
				end

				for k, v in pairs(acftModule.exportHooks) do
					v(dev0)
				end

				acftModule.memoryMap:autosyncStep()
				acftModule.memoryMap:autosyncStep()
				local data = acftModule.memoryMap:flushData()
				bytesInTransit = bytesInTransit + data:len()
				BIOS.protocol_io.queue(data)
			end
		end

		for k, v in pairs(metadataEndModule.exportHooks) do v() end
		metadataEndModule.memoryMap:autosyncStep()
		local data = metadataEndModule.memoryMap:flushData()
		bytesInTransit = bytesInTransit + data:len()
		BIOS.protocol_io.queue(data)
	end

end

function BIOS.protocol.shutdown()
	-- Nullify the aircraft name and publish one last frame to identify end of mission.
	metadataStartModule.data.acftName = ""

	-- send frame sync sequence
	BIOS.protocol_io.queue(string.char(0x55, 0x55, 0x55, 0x55))

	-- export aircraft-independent data: MetadataStart
	for k, v in pairs(metadataStartModule.exportHooks) do v() end
	metadataStartModule.memoryMap:autosyncStep()
	local data = metadataStartModule.memoryMap:flushData()
	BIOS.protocol_io.queue(data)

	-- export aircraft-independent data: MetadataEnd
	for k, v in pairs(metadataEndModule.exportHooks) do v() end
	metadataEndModule.memoryMap:autosyncStep()
	local data = metadataEndModule.memoryMap:flushData()
	BIOS.protocol_io.queue(data)
end

