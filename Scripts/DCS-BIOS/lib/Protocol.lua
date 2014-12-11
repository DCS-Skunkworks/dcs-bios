BIOS.protocol = {}
BIOS.protocol.maxBytesPerSecond = BIOS.protocol.maxBytesPerSecond or 11000
BIOS.protocol.maxBytesInTransit = BIOS.protocol.maxBytesPerSecond or 4000

local aircraftNameToModule = {}
BIOS.protocol.aircraftNameToModule = aircraftNameToModule

local globalMemoryMap = BIOS.util.MemoryMap:create{ baseAddress = 0x0000 }
BIOS.protocol.globalMemoryMap = globalMemoryMap
local currentAircraftStringExport = globalMemoryMap:allocateString{ maxLength = 16 }
local frameCounterExport = globalMemoryMap:allocateInt{ maxValue = 255 }
local frameCounter = 0
local frameSkipCounterExport = globalMemoryMap:allocateInt{ maxValue = 255 }
local frameSkipCounter = 0

function BIOS.protocol.beginModule(name, baseAddress)
	moduleBeingDefined = {}
	moduleBeingDefined.name = name
	moduleBeingDefined.documentation = {}
	moduleBeingDefined.inputProcessors = {}
	--moduleBeingDefined.lowFrequencyMap = {}
	--moduleBeingDefined.highFrequencyMap = {}
	--moduleBeingDefined.exportLowFrequency = function() return end
	--moduleBeingDefined.exportHighFrequency = function() return end
	moduleBeingDefined.memoryMap = BIOS.util.MemoryMap:create { baseAddress = baseAddress }
	moduleBeingDefined.exportHooks = {}
	aircraftNameToModule[name] = moduleBeingDefined
end
function BIOS.protocol.endModule()
	local function saveDoc()
		local JSON = loadfile([[Scripts\JSON.lua]])()
		local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\]]..moduleBeingDefined.name..".json", "w")
		local json_string = JSON:encode_pretty(moduleBeingDefined.documentation)
		if file then
			file:write(json_string)
			file:close()
		end
		local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\]]..moduleBeingDefined.name..".jsonp", "w")
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

local acftModule = nil
bytesInTransit = 0


function BIOS.protocol.processInputLine(line)
	local cmd, args = line:match("^([^ ]+) (.*)")
	if cmd == "SYNC" and args == "E" then
		argumentCache = {}
	end
	if cmd then
		if acftModule then
			if acftModule.inputProcessors[cmd] then
				acftModule.inputProcessors[cmd](args)
			end
		end
	end
end

local nextLowFreqStepTime = 0
local nextHighFreqStepTime = 0
local lastAcftName = ""

local lastFrameTime = LoGetModelTime()

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
	acftModule = aircraftNameToModule[acftName]
	if lastAcftName ~= acftName then
		if acftModule then acftModule.memoryMap:clearValues() end
		lastAcftName = acftName
		BIOS.mmap = acftModule.memoryMap
	end
	currentAircraftStringExport:setValue(acftName)
	
	-- export data
	if curTime >= nextLowFreqStepTime then
		-- runs 30 times per second
		frameCounter = (frameCounter + 1) % 256
		frameCounterExport:setValue(frameCounter)
		
		-- if the last frame update has not been completely transmitted, skip a frame
		if bytesInTransit > 0 then
			-- TODO: increase a frame skip counter for logging purposes
			frameSkipCounter = (frameSkipCounter + 1) % 256
			return
		end
		nextLowFreqStepTime = curTime + .033
		frameSkipCounterExport:setValue(frameSkipCounter)
		
		-- send frame sync sequence
		bytesInTransit = bytesInTransit + 4
		BIOS.protocol_io.queue(string.char(0x55, 0x55, 0x55, 0x55))
		
		-- export global / system data
		local data = globalMemoryMap:flushData()
		bytesInTransit = bytesInTransit + data:len()
		BIOS.protocol_io.queue(data)
		
		if acftModule then
			local dev0 = GetDevice(0)
			dev0:update_arguments()
			
			for k, v in pairs(acftModule.exportHooks) do
				v(dev0)
			end
			
			local data = acftModule.memoryMap:flushData()
			bytesInTransit = bytesInTransit + data:len()
			BIOS.protocol_io.queue(data)
		end
	end
	
end
