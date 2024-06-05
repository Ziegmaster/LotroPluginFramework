LPF.Texts.LPF_DEBUG = {
	LPFGreeting = "Greetings from LotroPluginFramework!",
	PluginLoaded = function(plugin)
		return 'Plugin "' .. plugin .. '" has been loaded!'
	end,
	ModuleLoaded = function(module)
		return 'Module "' .. module .. '" has been loaded!'
	end,
}

LPF.Texts.LPF_Modules = {
	Parser = "Chat Parser",
	UI = "User Interface",
}
