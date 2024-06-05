LPF.Modules = {
	Parser = {
		Package = "parser",
		DisplayName = LPF.Texts.LPF_Modules,
	},
}

LPF.LoadModule = function(module)
	import("LotroPluginFramework.modules." .. module.Package)
	LPF.DebugMessage(LPF.Texts.LPF_DEBUG.ModuleLoad[1] .. module.DisplayName .. LPF.Texts.LPF_DEBUG.ModuleLoad[2])
end
