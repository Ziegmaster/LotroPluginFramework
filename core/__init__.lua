--[[
    Main LPF object.
]]
_G.LPF = {}

import("LotroPluginFramework.core.utils")
import("LotroPluginFramework.core.settings")
import("LotroPluginFramework.core.lang")

--[[
    Starting point of entire LotroPluginFramework

    Creates plugin structure

    @args = {
		@debug = true/false
	}
]]
LPF.Init = function(args)
	if type(args) ~= "table" then
		args = {}
	end
	LPF.DEBUG = not (args.debug == false)

	LPF.DebugMessage(LPF.Texts.LPF_DEBUG.LPFGreeting)

	LPF.AddEventListener(plugin, "Load", function()
		LPF.DebugMessage(LPF.Texts.LPF_DEBUG.PluginLoad)
	end)
end
