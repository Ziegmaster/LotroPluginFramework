LPF.Shell = {
	--[[
    	These messages will be displayed in debug mode only
	]]
	DebugMessage = function(text)
		if LPF.Debug == true then
			Turbine.Shell.WriteLine(
				LPF.Shell.ColorizeText(
					"[" .. LPF.Settings.PluginDataDefaults.Name .. "] ",
					LPF.Settings.ShellColors.PluginNameLabel
				)
					.. LPF.Shell.ColorizeText("[DEBUG]: ", LPF.Settings.ShellColors.DebugMark)
					.. LPF.Shell.ColorizeText(text, LPF.Settings.ShellColors.DebugText)
			)
		end
	end,

	Error = function(text, level)
		error(
			LPF.Shell.ColorizeText(
				"[" .. LPF.Settings.PluginDataDefaults.Name .. "] ",
				LPF.Settings.ShellColors.PluginNameLabel
			)
				.. LPF.Shell.ColorizeText("[ERROR]: ", LPF.Settings.ShellColors.ErrorMark)
				.. LPF.Shell.ColorizeText(text, LPF.Settings.ShellColors.ErrorText),
			level
		)
	end,

	ColorizeText = function(text, color)
		return "<rgb=" .. color .. ">" .. text .. "</rgb>"
	end,
}
