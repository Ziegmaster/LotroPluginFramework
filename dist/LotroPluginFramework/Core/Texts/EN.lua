--[[
    General localization object
]]
LPF.Texts = {
	Debug = {
		LPFGreeting = "Greetings from LotroPluginFramework v" .. LPF.Dict.VERSION .. "!",
		PluginLoaded = "Plugin has been fully loaded!",
		PluginUnloaded = "Plugin has been unloaded!",
		PluginDataCreated = "Plugin data file has been created.",
		PluginDataLoaded = "Plugin data has been loaded!",
		PluginDataSaved = "Plugin data has been saved!",
		ModuleLoaded = function(module)
			return 'Module "' .. module .. '" has been loaded!'
		end,
	},
}

--[[
	Plugin localization object.
	Extend it as you need.
]]
LPF.Texts.Plugin = {}
