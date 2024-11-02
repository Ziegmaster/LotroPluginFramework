--[[
	Loads LPF Module
]]
LPF.LoadModule = function(module_name)
	if LPF.Modules == nil then
		import("LotroPluginFramework.Modules")
	end
	import("LotroPluginFramework.Modules." .. module_name)
	LPF.Shell.DebugMessage(LPF.Texts.Debug.ModuleLoaded(LPF.Dict.Modules[module_name]))
end