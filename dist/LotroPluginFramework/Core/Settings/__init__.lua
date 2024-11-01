--[[
    General LPF Settings
]]
LPF.Settings = {
	PluginDataDefaults = {
		Name = plugin:GetName(),
		Version = plugin:GetVersion(),
		Locale = LPF.Dict.Locales.EN,
	},
	PluginData = nil,
	ResetToDefaults = false,
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
