LPF.Modules = {
	Parser = "Parser",
}

LPF.LoadModule = function(module)
	import("LotroPluginFramework.modules." .. module)
	LPF.DebugMessage(LPF.Texts.LPF_DEBUG.ModuleLoad[1] .. module .. LPF.Texts.LPF_DEBUG.ModuleLoad[2])
end
