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
	local function saveAddresses()
		local moduleName = moduleBeingDefined.name

		local path = lfs.writedir()..[[Scripts\DCS-BIOS\doc\Addresses.h]]
		local existingDefines = {}
		local lineOrder = {} -- To maintain the order of lines

		-- Read existing content
		local fileRead, errRead = io.open(path, "r")
		if fileRead then
			for line in fileRead:lines() do
				local identifier = line:match("#define%s+([%w_]+)")
				if identifier then
					existingDefines[identifier] = line
					table.insert(lineOrder, identifier)
				end
			end
			fileRead:close()
		end

		for _, category in pairs(moduleBeingDefined.documentation) do
			for identifier, args in pairs(category) do
				local outputs = args.outputs or {}
				for _, output in pairs(outputs) do
					local full_identifier = moduleName .. "_" .. identifier
					-- Replace all characters that are not A-Z, a-z, 0-9, or _ with _
					full_identifier = full_identifier:gsub("[^A-Za-z0-9_]", "_")
					-- Replace successive underscores with a single _
					full_identifier = full_identifier:gsub("_+", "_")

					local addressStr = output.address and string.format("0x%X", output.address) or "nil"
					local maskStr = output.mask and string.format("0x%X", output.mask) or "nil"
					local shiftByStr = output.shift_by and tostring(output.shift_by) or "nil"

					local line = "#define " .. full_identifier .. " " .. addressStr .. ", " .. maskStr .. ", " .. shiftByStr

					if not existingDefines[full_identifier] then
						table.insert(lineOrder, full_identifier)
					end

					existingDefines[full_identifier] = line
				end
			end
		end

		-- Write the updated content to the file
		local address_header_file, err = io.open(path, "w")
		if err then
			print("Error opening file:", err) -- Print error if unable to open file
			return
		end
		for _, identifier in ipairs(lineOrder) do
			address_header_file:write(existingDefines[identifier] .. "\n")
		end
		address_header_file:close() -- Close the header file
	end
	pcall(saveDoc)
	pcall(saveAddresses)
	moduleBeingDefined = nil
  end
end


local metadataStartModule = nil
local metadataEndModule = nil
function BIOS.protocol.init()
	-- called after all aircraft modules have been loaded
	metadataStartModule = exportModules["MetadataStart"]
	metadataEndModule = exportModules["MetadataEnd"]
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

