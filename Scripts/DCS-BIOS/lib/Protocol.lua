BIOS.protocol = {}

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
	if BIOS.a10c.inputProcessors[cmd] then
		BIOS.a10c.inputProcessors[cmd](args)
	end
end

local nextLowFreqStepTime = 0
local nextHighFreqStepTime = 0
function BIOS.protocol.step()
	
	local curTime = LoGetModelTime()

	if curTime >= nextHighFreqStepTime then
		-- runs 100 times per second
		nextHighFreqStepTime = curTime + .01
		
		BIOS.a10c.exportHighFrequency()
	end
	
	if curTime >= nextLowFreqStepTime then
		-- runs 10 times per second
		nextLowFreqStepTime = curTime + .1
		
		BIOS.a10c.exportLowFrequency()
	end

end