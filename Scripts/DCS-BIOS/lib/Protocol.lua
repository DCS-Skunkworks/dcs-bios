BIOS.protocol = {}

local aircraftNameToModule = {}
BIOS.protocol.aircraftNameToModule = aircraftNameToModule
function BIOS.protocol.beginModule(name)
	moduleBeingDefined = {}
	moduleBeingDefined.name = name
	moduleBeingDefined.documentation = {}
	moduleBeingDefined.inputProcessors = {}
	moduleBeingDefined.lowFrequencyMap = {}
	moduleBeingDefined.highFrequencyMap = {}
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

local argumentCache = {}
function BIOS.protocol.setMsgArg(msg, arg)
	local oldArg = argumentCache[msg]
	if oldArg == arg then return end
	argumentCache[msg] = arg
	if arg == nil then
		BIOS.protocol_io.queue(msg.."\n")
	else
		BIOS.protocol_io.queue(msg.." "..arg.."\n")
	end
end

function BIOS.protocol.processInputLine(line)
	local cmd, args = line:match("^([^ ]+) (.*)")
	if cmd == "SYNC" and args == "E" then
		argumentCache = {}
	end
	if acftModule then
		if acftModule.inputProcessors[cmd] then
			acftModule.inputProcessors[cmd](args)
		end
	end
end

local nextLowFreqStepTime = 0
local nextHighFreqStepTime = 0
local lastAcftName = ""

function BIOS.protocol.step()
	
	local curTime = LoGetModelTime()
	
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
	
	if curTime >= nextLowFreqStepTime then
		-- runs 10 times per second
		nextLowFreqStepTime = curTime + .1
		
		if acftModule then
			local dev0 = GetDevice(0)
			dev0:update_arguments()
			local setMsgArg = BIOS.protocol.setMsgArg
			
			for k, v in pairs(acftModule.lowFrequencyMap) do
				setMsgArg(k, v(dev0))
			end
			
			acftModule.exportLowFrequency()
		end
	end

end