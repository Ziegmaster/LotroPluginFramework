--[[
    Safely add a listener without overwriting any existing ones
]]
function LPF.AddListener(object, event, listener)
	if object[event] == nil then
		object[event] = listener
	else
		if type(object[event]) == "table" then
			table.insert(object[event], listener)
		else
			object[event] = { object[event], listener }
		end
	end
	return listener
end

--[[
    Safely remove a listener without clobbering any extras
]]
function LPF.RemoveListener(object, event, listener)
	if object[event] == listener then
		object[event] = nil
	else
		if type(object[event]) == "table" then
			local size = #object[event]
			for i = 1, size do
				if object[event][i] == listener then
					table.remove(object[event], i)
					break
				end
			end
		end
	end
end

--[[
    Safely execute a listener whether it be an array of functions or a single one
]]
function LPF.ExecuteListener(object, event, args)
	if type(object[event]) == "function" then
		object[event](object, args)
	else
		if type(object[event]) == "table" then
			local size = #object[event]
			for i = 1, size do
				if type(object[event][i]) == "function" then
					object[event][i](object, args)
				end
			end
		end
	end
end
