LPFClasses.LPFSettings = _G.class()

function LPFClasses.LPFSettings:Constructor(lpf)
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
			Name = lpf.Plugin:GetName(),
			Version = lpf.Plugin:GetVersion(),
			Locale = lpf.Dict.Locales.EN,
		},
		Debug = {
			Locale = lpf.Dict.Locales.EN,
		},
		ShellColors = {
			PluginNameLabel = lpf.Dict.ShellColors.Platinum,
			DefaultText = lpf.Dict.ShellColors.Platinum,
			DebugMark = lpf.Dict.ShellColors.Azure,
			DebugText = lpf.Dict.ShellColors.Platinum,
			ErrorMark = lpf.Dict.ShellColors.Red,
			ErrorText = lpf.Dict.ShellColors.Amber,
		},
	}
end
