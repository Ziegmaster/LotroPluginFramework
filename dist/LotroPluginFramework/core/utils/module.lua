LPF.LoadModule = function(module)
	import("LotroPluginFramework.Modules." .. module.Package)
	LPF.DebugMessage(LPF.Texts.LPF_DEBUG.ModuleLoaded(module.DisplayName))
end
