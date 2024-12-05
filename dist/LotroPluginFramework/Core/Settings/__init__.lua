__LPF_CLASSES__.Settings = class()

function __LPF_CLASSES__.Settings:Constructor()
	return {
		--[[
			Flag for plugin creators.
			It indicates that the plugin data file did not exist, and a new plugin data object was created during loading.
			It mainly helps to implement custom initial settings for the plugin.
		]]
		FirstLaunch = false,
		ResetToDefaults = false,
		Plugin = nil,
		PluginDefaults = {
			Name = LPF.Plugin:GetName(),
			Version = LPF.Plugin:GetVersion(),
			Locale = LPF.Dict.Locales.EN,
		},
		ShellColors = {
			PluginNameLabel = LPF.Dict.HexColors.Platinum,
			DefaultText = LPF.Dict.HexColors.Platinum,
			DebugMark = LPF.Dict.HexColors.Azure,
			DebugText = LPF.Dict.HexColors.Platinum,
			ErrorMark = LPF.Dict.HexColors.Red,
			ErrorText = LPF.Dict.HexColors.Amber,
		},
	}
end
