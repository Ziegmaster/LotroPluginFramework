--[[
    LPF modules
]]
import("LotroPluginFramework.core.settings")
import("LotroPluginFramework.core.lang")
import("LotroPluginFramework.core.utils")

--[[
    These messages will be displayed in debug mode only
]]
LPF.DebugMessage = function(text)
	if LPF.Settings.DEBUG.Enabled then
		Turbine.Shell.WriteLine("[DEBUG]: " .. text)
	end
end

LPF.AddListener(plugin, "Load", function()
	LPF.DebugMessage(LPF.Texts.LPFGreeting)
	LPF.DebugMessage(LPF.Texts.PluginLoadSuccess)
end)
