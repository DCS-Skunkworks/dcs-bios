BIOS.util = {}

function BIOS.util.shallowCopy(source, dest)
	dest = dest or {}
	for k, v in pairs(source) do
		dest[k] = v
	end
	return dest
end

function BIOS.util.parse_indication(indicator_id)
	local ret = {}
	local li = list_indication(indicator_id)
	if li == "" then return nil end
	local m = li:gmatch("([^\n]+)\n")
	while true do
		local separator = m()
		if not separator then break end
		local name = m()
		local value = m()
		ret[name] = value
	end
	return ret
end

local function document(args)
	if not args.category then args.category = "No Category" end
	if not moduleBeingDefined.documentation[args.category] then moduleBeingDefined.documentation[args.category] = {} end
	moduleBeingDefined.documentation[args.category][args.msg] = args
end
BIOS.util.document = document

function BIOS.util.defineIndicatorLight(msg, arg_number, category, description)
	document { msg = msg, category = category, description = description, msg_type = "indicator", value_type = "enum", value_enum = {"0", "1"}, can_set = false, actions = {} }
	moduleBeingDefined.highFrequencyMap[msg] = function(dev0) return string.format("%.0f", dev0:get_argument_value(arg_number)) end
end

function BIOS.util.definePushButton(msg, device_id, device_command, arg_number, category, description)
	document { msg = msg, category = category, description = description, msg_type = "button", value_type = "enum", value_enum = {"0", "1"}, can_set = true, actions = {} }
	moduleBeingDefined.highFrequencyMap[msg] = function(dev0) return string.format("%.0f", dev0:get_argument_value(arg_number)) end
	moduleBeingDefined.inputProcessors[msg] = function(state)
		if type(state) == "string" then state = tonumber(state) end
		GetDevice(device_id):performClickableAction(device_command, state)
	end
end

function BIOS.util.definePotentiometer(msg, device_id, command, arg_number, limits, category, description)
	document { msg = msg, category = category, description = description, msg_type = "potentiometer", value_type = "float", value_range = limits, can_set = true, actions = {} }
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0) return string.format("%.4f", dev0:get_argument_value(arg_number)) end
	if limits == nil then limits = {0.0, 1.0} end
	moduleBeingDefined.inputProcessors[msg] = function(value)
		if type(value) == "string" then value = tonumber(value) end
		if value < limits[1] then value = limits[1] end
		if value > limits[2] then value = limits[2] end
		GetDevice(device_id):performClickableAction(command, value)
	end
end

function BIOS.util.defineRotary(msg, device_id, command, arg_number, category, description)
	document { msg = msg, category = category, description = description, msg_type = "rotary", value_type = "float", value_range = {0, 1}, can_set = false, actions = {"DEC", "INC"} }
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0) return string.format("%.4f", dev0:get_argument_value(arg_number)) end
	moduleBeingDefined.inputProcessors[msg] = function(state)
		if state == "INC" then
			GetDevice(device_id):performClickableAction(command, 0.1)
		elseif state == "DEC" then
			GetDevice(device_id):performClickableAction(command, -0.1)
		end
	end
end

local function cap(value, limits, cycle)
	if cycle then
		if value < limits[1] then return limits[2] end
		if value > limits[2] then return limits[1] end
	else
		if value <= limits[1] then return limits[1] end
		if value >= limits[2] then return limits[2] end
	end
	return value
end
BIOS.util.cap = cap

function BIOS.util.defineSetCommandTumb(msg, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	-- uses SetCommand and set_argument_value instead of performClickableAction()
	local span = limits[2] - limits[1]
	local last_n = tonumber(string.format("%.0f", span / step))

	local value_enum = output_map
	if not value_enum then
		value_enum = {}
		local n = 0
		while n <= last_n do
			value_enum[#value_enum+1] = tostring(n)
			n = n + 1
		end
	end
	document { msg = msg, category = category, description = description, msg_type = "tumb", value_type = "enum", value_enum = value_enum, can_set = true, actions = {"DEC", "INC"} }
	
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0)
		local value = dev0:get_argument_value(arg_number)		
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))
		
		if n > last_n then n = last_n end
		if not output_map then
			return tostring(n)
		else
			return output_map[n+1]
		end
	end
	
	moduleBeingDefined.inputProcessors[msg] = function(state)
		local value = GetDevice(0):get_argument_value(arg_number)		
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))
		local new_n = n
		if state == "INC" then
			new_n = cap(n+1, {0, last_n}, cycle)
			if cycle == "skiplast" and new_n == last_n then new_n = 0 end
		
			GetDevice(device_id):SetCommand(command, limits[1] + step*new_n)
			GetDevice(0):set_argument_value(arg_number, limits[1] + step*new_n)
		elseif state == "DEC" then
			new_n = cap(n-1, {0, last_n}, cycle)
			if cycle == "skiplast" and new_n == last_n then new_n = last_n - 1 end
			
			GetDevice(device_id):SetCommand(command, limits[1] + step*new_n)
			GetDevice(0):set_argument_value(arg_number, limits[1] + step*new_n)
		else
			if not output_map then
				n = tonumber(string.format("%.0f", tonumber(state)))
			else
				n = nil
				for i, v in ipairs(output_map) do
					if state == v then
						n = i - 1
					end
				end
			end
			if n == nil then return end
			GetDevice(device_id):SetCommand(command, limits[1] + step*cap(n, {0, last_n}, cycle))
			GetDevice(0):set_argument_value(arg_number, limits[1] + step*cap(n, {0, last_n}, cycle))
		end
	end
end

function BIOS.util.defineTumb(msg, device_id, command, arg_number, step, limits, output_map, cycle, category, description)
	local span = limits[2] - limits[1]
	local last_n = tonumber(string.format("%.0f", span / step))
	
	local value_enum = output_map
	if not value_enum then
		value_enum = {}
		local n = 0
		while n <= last_n do
			value_enum[#value_enum+1] = tostring(n)
			n = n + 1
		end
	end
	
	document { msg = msg, category = category, description = description, msg_type = "tumb", value_type = "enum", value_enum = value_enum, can_set = true, actions = {"DEC", "INC"} }
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0)
		local value = dev0:get_argument_value(arg_number)		
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))
		
		if n > last_n then n = last_n end
		if not output_map then
			return tostring(n)
		else
			return output_map[n+1]
		end
	end
	
	moduleBeingDefined.inputProcessors[msg] = function(state)
		local value = GetDevice(0):get_argument_value(arg_number)		
		local n = tonumber(string.format("%.0f", (value - limits[1]) / step))
		local new_n = n
		if state == "INC" then
			new_n = cap(n+1, {0, last_n}, cycle)
			if cycle == "skiplast" and new_n == last_n then new_n = 0 end
		
			GetDevice(device_id):performClickableAction(command, limits[1] + step*new_n)
		elseif state == "DEC" then
			new_n = cap(n-1, {0, last_n}, cycle)
			if cycle == "skiplast" and new_n == last_n then new_n = last_n - 1 end
			
			GetDevice(device_id):performClickableAction(command, limits[1] + step*new_n)
		else
			if not output_map then
				n = tonumber(string.format("%.0f", tonumber(state)))
			else
				n = nil
				for i, v in ipairs(output_map) do
					if state == v then
						n = i - 1
					end
				end
			end
			if n == nil then return end
			GetDevice(device_id):performClickableAction(command, limits[1] + step*cap(n, {0, last_n}, cycle))
		end
	end
end

function BIOS.util.defineToggleSwitch(msg, device_id, command, arg_number, category, description)
	BIOS.util.defineTumb(msg, device_id, command, arg_number, 1, {0, 1}, nil, false, category, description)
end

function BIOS.util.defineToggleSwitchToggleOnly(msg, device_id, command, arg_number, category, description)
	BIOS.util.defineTumb(msg, device_id, command, arg_number, 1, {0, 1}, nil, false, category, description)
	moduleBeingDefined.documentation[category][msg].msg_type = "toggle_only_switch"
	moduleBeingDefined.documentation[category][msg].can_set = false
	moduleBeingDefined.documentation[category][msg].actions = {"TOGGLE"}
	
	moduleBeingDefined.inputProcessors[msg] = function(state)
		if state == "TOGGLE" then
			GetDevice(device_id):performClickableAction(command, 1)
		end
	end
end

function BIOS.util.defineRelativeTumb(msg, device_id, command, arg_number, step, limits, rel_args, output_map, category, description)
	BIOS.util.defineTumb(msg, device_id, command, arg_number, step, limits, output_map, true, category, description)
	moduleBeingDefined.documentation[category][msg].msg_type = "relativetumb"
	moduleBeingDefined.documentation[category][msg].can_set = false
	
	moduleBeingDefined.inputProcessors[msg] = function(state)
		if state == "DEC" then
			GetDevice(device_id):performClickableAction(command, rel_args[1])
		elseif state == "INC" then
			GetDevice(device_id):performClickableAction(command, rel_args[2])
		end
	end
end

function BIOS.util.defineString(msg, getter, category, description)
	moduleBeingDefined.lowFrequencyMap[msg] = getter
	document { msg = msg, category = category, description = description, msg_type = "string", value_type = "string", can_set = false, actions = {} }
end

function BIOS.util.defineElectricallyHeldSwitch(msg, device_id, pos_command, neg_command, arg_number, category, description)
	document { msg = msg, category = category, description = description, msg_type = "electrically_held_switch", value_type = "enum", value_enum = {"0", "1"}, can_set = false, actions = {"PUSH", "RELEASE", "OFF"} }
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0) return string.format("%.0f", dev0:get_argument_value(arg_number)) end
	moduleBeingDefined.inputProcessors[msg] = function(action)
		if action == "PUSH" then GetDevice(device_id):performClickableAction(pos_command, 1) end
		if action == "RELEASE" then GetDevice(device_id):performClickableAction(neg_command, 0) end
		if action == "OFF" then GetDevice(device_id):performClickableAction(pos_command, 0) end
	end
end

function BIOS.util.defineRockerSwitch(msg, device_id, pos_command, pos_stop_command, neg_command, neg_stop_command, arg_number, category, description)
	document { msg = msg, category = category, description = description, msg_type = "rocker", value_type = "enum", value_enum = {"0", "1", "2"}, can_set = true, actions = {} }
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0)
		local lut = {["-1"] = "0", ["0"] = "1", ["1"] = "2"}
		return lut[string.format("%.0f", dev0:get_argument_value(arg_number))]
	end
	moduleBeingDefined.inputProcessors[msg] = function(toState)
		if type(toState) == "string" then toState = tonumber(toState) end
		local fromState = GetDevice(0):get_argument_value(arg_number)
		local dev = GetDevice(device_id)
		if fromState == 1 and toState == 2 then dev:performClickableAction(pos_command, 1) end
		if fromState == 2 and toState == 1 then dev:performClickableAction(pos_stop_command, 0) end
		if fromState == 1 and toState == 0 then dev:performClickableAction(neg_command, -1) end
		if fromState == 0 and toState == 1 then dev:performClickableAction(neg_stop_command, 0) end
	end
end

function BIOS.util.defineMultipositionSwitch(msg, device_id, device_command, arg_number, num_positions, increment, category, description)
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0) return string.format("%.0f", dev0:get_argument_value(arg_number) / increment) end
	moduleBeingDefined.inputProcessors[msg] = function(state)
		if type(state) == "string" then state = tonumber(state) end
		GetDevice(device_id):performClickableAction(device_command, state * increment)
	end
end

function BIOS.util.defineFloat(msg, arg_number, limits, category, description)
	document { msg = msg, category = category, description = description, msg_type = "float", value_type = "float", value_range = limits, can_set = false, actions = {} }
	moduleBeingDefined.lowFrequencyMap[msg] = function(dev0) return string.format("%.4f", dev0:get_argument_value(arg_number)) end
end