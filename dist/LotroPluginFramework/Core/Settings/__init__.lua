LPFClasses.Settings = class()

function LPFClasses.Settings:Constructor()
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
		Debug = {
			Locale = LPF.Dict.Locales.EN,
		},
		ShellColors = {
			PluginNameLabel = LPF.Dict.ShellColors.Platinum,
			DefaultText = LPF.Dict.ShellColors.Platinum,
			DebugMark = LPF.Dict.ShellColors.Azure,
			DebugText = LPF.Dict.ShellColors.Platinum,
			ErrorMark = LPF.Dict.ShellColors.Red,
			ErrorText = LPF.Dict.ShellColors.Amber,
		},
	}
end
