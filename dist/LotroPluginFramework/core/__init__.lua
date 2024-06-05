--[[
    Main LPF object.
]]
_G.LPF = {}

import("LotroPluginFramework.core.utils")
import("LotroPluginFramework.core.settings")
import("LotroPluginFramework.core.lang")

--[[
    Starting point of the entire LotroPluginFramework

    Creates plugin structure

    args: table = {
		DEBUG: boolean
	}
]]
LPF.Init = function(args)
	if type(args) ~= "table" then
		args = {}
	end
	LPF.DEBUG = not (args.DEBUG == false)

	LPF.DebugMessage(LPF.Texts.LPF_DEBUG.LPFGreeting)

	LPF.AddEventListener(plugin, "Load", function()
		LPF.DebugMessage(LPF.Texts.LPF_DEBUG.PluginLoad)
	end)
end
