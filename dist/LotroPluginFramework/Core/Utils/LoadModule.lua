LPF.LoadModule = function(module_name)
	if LPF.Modules == nil then
		import("LotroPluginFramework.Modules")
	end
	import("LotroPluginFramework.Modules." .. module_name)
	LPF.Shell.DebugMessage(LPF.Texts.LPF_Debug.ModuleLoaded(LPF.Dict.ModuleImports[module_name]))
end
