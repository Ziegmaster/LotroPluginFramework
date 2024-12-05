__LPF_CLASSES__.Texts = class()

function __LPF_CLASSES__.Texts:Constructor()
    return {
        --[[
	        Plugin localization object.
	        Extend it as you need.
        ]]
        Plugin = {},
        Debug = {
            StartupMessage = "LotroPluginFramework v" .. LPF.__VERSION__ .. " by Ziegmaster",
            PluginLoaded = "Plugin has been fully loaded!",
            PluginUnloaded = "Plugin has been unloaded!",
            PluginDataCreated = "Plugin data has been created.",
            PluginDataLoaded = "Plugin data has been loaded!",
            PluginDataSaved = "Plugin data has been saved!",
            PluginRootError = "Plugin root must be a string and match your plugin folder's name!",
            ModuleLoaded = function(module)
                return 'Module "' .. module .. '" has been loaded!'
            end,
        }
    }
end