--[[
    These messages will be displayed in debug mode only
]]
LPF.DebugMessage = function(text)
	if LPF.DEBUG == true then
		Turbine.Shell.WriteLine("[DEBUG]: " .. text)
	end
end
