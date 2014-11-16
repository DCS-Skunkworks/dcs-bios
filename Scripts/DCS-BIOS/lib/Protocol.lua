BIOS.protocol = {}
BIOS.protocol.maxBytesPerSecond = 11000
BIOS.protocol.maxBytesInTransit = 4000

local aircraftNameToModule = {}
BIOS.protocol.aircraftNameToModule = aircraftNameToModule
function BIOS.protocol.beginModule(name)
	moduleBeingDefined = {}
	moduleBeingDefined.name = name
	moduleBeingDefined.documentation = {}
	moduleBeingDefined.inputProcessors = {}
	moduleBeingDefined.lowFrequencyMap = {}
	moduleBeingDefined.highFrequencyMap = {}
	moduleBeingDefined.intMap = {} -- list of getter functions for int values
	moduleBeingDefined.nextIntIdx = nil -- index of next int value to be exported
	moduleBeingDefined.maxIntIdx = 0 -- length of intMap
	moduleBeingDefined.exportLowFrequency = function() return end
	moduleBeingDefined.exportHighFrequency = function() return end
	aircraftNameToModule[name] = moduleBeingDefined
end
function BIOS.protocol.endModule()
	local function saveDoc()
		local JSON = loadfile([[Scripts\JSON.lua]])()
		local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\]]..moduleBeingDefined.name..".json", "w")
		if file then
			file:write(JSON:encode(moduleBeingDefined.documentation))
			file:close()
		end
		local file, err = io.open(lfs.writedir()..[[Scripts\DCS-BIOS\doc\]]..moduleBeingDefined.name..".jsonp", "w")
		if file then
			file:write('docdata["'..moduleBeingDefined.name..'"] =\n')
			file:write(JSON:encode(moduleBeingDefined.documentation))
			file:write(";\n")
			file:close()
		end
	end
	pcall(saveDoc)
	moduleBeingDefined = nil
end

local acftModule = nil
bytesInTransit = 0

local argumentCache = {}
function BIOS.protocol.setMsgArg(msg, arg)
	local oldArg = argumentCache[msg]
	if oldArg == arg then return end
	argumentCache[msg] = arg
	local txstr = nil
	if arg == nil then
		txstr = msg.."\n"
	else
		txstr = msg.." "..arg.."\n"
	end
	bytesInTransit = bytesInTransit + txstr:len()
	BIOS.protocol_io.queue(txstr)
end

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
	if bytesInTransit < 0 then bytesInTransit = 0 end
	
	-- determine active aircraft
	local acftName = "NONE"
	local selfData = LoGetSelfData()
	if selfData then
		acftName = selfData["Name"]
	end
	BIOS.protocol.setMsgArg("AIRCRAFT", acftName)
	if lastAcftName ~= acftName then
		argumentCache = {}
		lastAcftName = acftName
	end
	acftModule = aircraftNameToModule[acftName]

	-- export high frequency messages
	if curTime >= nextHighFreqStepTime then
		-- runs 100 times per second
		nextHighFreqStepTime = curTime + .01
					
		if acftModule then
			local dev0 = GetDevice(0)
			dev0:update_arguments()
			local setMsgArg = BIOS.protocol.setMsgArg
			
			for k, v in pairs(acftModule.highFrequencyMap) do
				setMsgArg(k, v(dev0))
			end
		
			acftModule.exportHighFrequency()
		end
	end
	
	-- export low frequency messages
	if curTime >= nextLowFreqStepTime then
		-- runs 30 times per second
		nextLowFreqStepTime = curTime + .033
		
		if acftModule then
			local dev0 = GetDevice(0)
			dev0:update_arguments()
			local setMsgArg = BIOS.protocol.setMsgArg
			
			for k, v in pairs(acftModule.lowFrequencyMap) do
				setMsgArg(k, v(dev0))
			end
			
			acftModule.exportLowFrequency()
			
			if acftModule.maxIntIdx > 0 then
				if acftModule.nextIntIdx > acftModule.maxIntIdx then
					acftModule.nextIntIdx = 1
				end
			end
		end
	end
	
	-- export ints
	if acftModule then
		local dev0 = GetDevice(0)
		local intCapacity = math.floor((BIOS.protocol.maxBytesInTransit - bytesInTransit - 4)/2)
		local intData = ""
		if intCapacity > 2 and acftModule.nextIntIdx <= acftModule.maxIntIdx then
			local firstIntIdx = acftModule.nextIntIdx
			while intCapacity > 0 and acftModule.nextIntIdx <= acftModule.maxIntIdx do
				intCapacity = intCapacity - 1
				local intval = math.floor(acftModule.intMap[acftModule.nextIntIdx](dev0))
				if intval < 0 then intval = 0 end
				if intval > 65535 then intval = 65535 end
				local lowbyte = intval % 256
				local highbyte = (intval - lowbyte) / 256
				intData = intData .. string.char(lowbyte, highbyte)
				acftModule.nextIntIdx = acftModule.nextIntIdx + 1
			end
			
			bytesInTransit = bytesInTransit + 4 + intData:len() -- overhead: 'i', start index, number of ints byte, \n terminator
			BIOS.protocol_io.queue('i')
			BIOS.protocol_io.queue(string.char(firstIntIdx))
			BIOS.protocol_io.queue(string.char(intData:len() / 2))
			BIOS.protocol_io.queue(intData)
			BIOS.protocol_io.queue('\n')
		end
	end
	
	lastFrameTime = curTime
end