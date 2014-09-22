BIOS.protocol = {}

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
local aircraftNameToModule = {
	["A-10C"] = BIOS.a10c,
	["UH-1H"] = BIOS.uh1h
}
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
		
		if acftModule then acftModule.exportHighFrequency() end
	end
	
	if curTime >= nextLowFreqStepTime then
		-- runs 10 times per second
		nextLowFreqStepTime = curTime + .1
		
		if acftModule then acftModule.exportLowFrequency() end		
	end

end