LPFClasses.DebugTexts = class()

function LPFClasses.DebugTexts:Constructor()
	return {
		PluginLoaded = "Plugin has been fully loaded!",
		PluginUnloaded = "Plugin has been unloaded!",
		PluginDataCreated = "Plugin data has been created.",
		PluginDataLoaded = "Plugin data has been loaded!",
		PluginDataSaved = "Plugin data has been saved!",
		ModuleNames = {
			UI = "User Interface",
			Parser = "Parser"
		},
		ModuleLoaded = function(module)
			return 'Module "' .. module .. '" has been loaded!'
		end,
	}
end