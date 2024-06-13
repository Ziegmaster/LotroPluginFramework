--[[
    General localization object both for LPF and plugins

    Extend it as you wish
    BUT DO NOT TOUCH LPF RELATED STUFF!!!
]]
LPF.Texts = {
	LPF_Debug = {
		LPFGreeting = "Greetings from LotroPluginFramework!",
		PluginLoaded = "Plugin is fully loaded!",
		PluginUnloaded = "Plugin is unloaded!",
		PluginDataCreated = "Plugin data file has been created.",
		PluginDataLoaded = "Plugin data has been loaded!",
		PluginDataSaved = "Plugin data has been saved!",
		ModuleLoaded = function(module)
			return 'Module "' .. module .. '" has been loaded!'
		end,
	},
}
