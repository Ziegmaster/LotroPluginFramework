--[[
    Main LPF object.
]]
_G.LPF = {
	--[[
		Your plugin object.
	]]
	Plugin = plugin,
	--[[
		Your plugin variables accessible everywhere.
	]]
	PluginGlobals = {}
}

import("LotroPluginFramework.Core.Dict")
import("LotroPluginFramework.Core.Settings")
import("LotroPluginFramework.Core.Texts")
import("LotroPluginFramework.Core.Utils")

--[[
    Starting point of the entire LotroPluginFramework

    Creates plugin structure

    args: table = {
		Debug: boolean
	}
]]
LPF.InitPlugin = function(args)
	if type(args) ~= "table" then
		args = {}
	end

	LPF.Debug = not (args.Debug == false)

	LPF.Shell.DebugMessage(LPF.Shell.ColorizeText(LPF.Texts.Debug.LPFGreeting, LPF.Dict.ShellColors.Amber))

	if args.PluginData and type(args.PluginData) == "table" and args.PluginData.Enabled == true then
		if args.PluginData.DataScope == nil then
			LPF.Settings.PluginData = LPF.PluginData.Load(Turbine.DataScope.Account, "")
			if LPF.Settings.PluginData == nil then
				LPF.Settings.PluginData = LPF.Settings.PluginDataDefaults
				LPF.Shell.DebugMessage(
					LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginDataCreated, LPF.Dict.ShellColors.Green)
				)
			else
				LPF.Shell.DebugMessage(
					LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginDataLoaded, LPF.Dict.ShellColors.Green)
				)
			end
		else
			if type(args.PluginData.DataScope) == "number" then
				LPF.Settings.PluginData = LPF.PluginData.Load(args.PluginData.DataScope, "")
				if LPF.Settings.PluginData == nil then
					LPF.Shell.DebugMessage(
						LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginDataCreated, LPF.Dict.ShellColors.Green)
					)
				else
					LPF.Shell.DebugMessage(
						LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginDataLoaded, LPF.Dict.ShellColors.Green)
					)
				end
			else
				LPF.Shell.Error("Provided DataScope has incorrect value type. Please check LPF documentation.", 0)
			end
		end
	end

	LPF.Events.AddListener(plugin, "Load", function()
		LPF.Shell.DebugMessage(LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginLoaded, LPF.Dict.ShellColors.Green))
	end)

	LPF.Events.AddListener(plugin, "Unload", function()
		if LPF.Settings.ResetToDefaults then
			LPF.Settings.PluginData = LPF.Settings.PluginDataDefaults
		end
		LPF.PluginData.Save(args.Settings.DataScope, "", LPF.Settings.PluginData)
		LPF.Shell.DebugMessage(LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginDataSaved, LPF.Dict.ShellColors.Green))
		LPF.Shell.DebugMessage(LPF.Shell.ColorizeText(LPF.Texts.Debug.PluginUnloaded, LPF.Dict.ShellColors.Amber))
	end)
end
