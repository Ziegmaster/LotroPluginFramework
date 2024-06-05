--[[
    Main LPF object.
]]
_G.LPF = {}

import("LotroPluginFramework.Core.Settings")
import("LotroPluginFramework.Core.Texts")
import("LotroPluginFramework.Core.Utils")

--[[
    Starting point of the entire LotroPluginFramework

    Creates plugin structure

    args: table = {
		DEBUG: boolean
	}
]]
LPF.InitPlugin = function(args)
	if type(args) ~= "table" then
		args = {}
	end
	LPF.DEBUG = not (args.DEBUG == false)

	LPF.DebugMessage(LPF.Texts.LPF_DEBUG.LPFGreeting)

	LPF.AddEventListener(plugin, "Load", function()
		LPF.DebugMessage(LPF.Texts.LPF_DEBUG.PluginLoaded(LPF.Settings.Plugin.Name))
	end)
end
