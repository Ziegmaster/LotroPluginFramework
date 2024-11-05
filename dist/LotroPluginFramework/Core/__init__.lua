--[[
    LPF class object. Not for use in plugins!
]]
_G.LPFClasses = {}

LPFClasses.LotroPluginFramework = class()

function LPFClasses.LotroPluginFramework:Constructor()
	return self
end

function LPFClasses.LotroPluginFramework:Load()
	import("LotroPluginFramework.Utils")
	import("LotroPluginFramework.Core.Dict")
	import("LotroPluginFramework.Core.Settings")
	import("LotroPluginFramework.Core.Texts")
	import("LotroPluginFramework.Core.Shell")
	import("LotroPluginFramework.Core.Events")
	import("LotroPluginFramework.Core.PluginData")
	import("LotroPluginFramework.Modules")
	--[[
		Your plugin object.
	]]
	self.Plugin = plugin
	--[[
		Your plugin variables accessible everywhere.
	]]
	self.PluginGlobals = {}
	self.Utils = LPFClasses.Utils:Constructor()
	self.Dict = LPFClasses.Dict:Constructor()
	--[[
    	General LPF Settings
	]]
	self.Settings = LPFClasses.Settings:Constructor()
	--[[
    	General localization object
	]]
	self.Texts = LPFClasses.Texts:Constructor()
	self.Shell = LPFClasses.Shell:Constructor()
	self.Events = LPFClasses.Events:Constructor()
	self.PluginData = LPFClasses.PluginData:Constructor()
	self.Modules = LPFClasses.ModuleDict:Constructor()
end

--[[
    Starting point of the entire LotroPluginFramework

    Creates plugin structure

    init_args: table = {
		Debug: boolean
	}
]]
function LPFClasses.LotroPluginFramework:InitPlugin(init_args)
	self:Load()

	if type(init_args) ~= "table" then
		init_args = {}
	end

	self.Debug = not (init_args.Debug == false)

	self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.LPFGreeting, self.Dict.ShellColors.Amber))

	if init_args.PluginData and type(init_args.PluginData) == "table" and init_args.PluginData.Enabled == true then
		if init_args.PluginData.DataScope == nil then
			self.Settings.Plugin = self.PluginData:Load(Turbine.DataScope.Account, "")
			if self.Settings.Plugin == nil then
				self.Settings.FirstLaunch = true
				self.Settings.Plugin = self.Settings.PluginDefaults
				self.Shell:DebugMessage(
					self.Shell:ColorizeText(self.Texts.Debug.PluginDataCreated, self.Dict.ShellColors.Green)
				)
			else
				self.Shell:DebugMessage(
					self.Shell:ColorizeText(self.Texts.Debug.PluginDataLoaded, self.Dict.ShellColors.Green)
				)
			end
		else
			if type(init_args.PluginData.DataScope) == "number" then
				self.Settings.Plugin = self.PluginData:Load(init_args.PluginData.DataScope, "")
				if self.Settings.Plugin == nil then
					self.Settings.FirstLaunch = true
					self.Settings.Plugin = self.Settings.PluginDefaults
					self.Shell:DebugMessage(
						self.Shell:ColorizeText(self.Texts.Debug.PluginDataCreated, self.Dict.ShellColors.Green)
					)
				else
					self.Shell:DebugMessage(
						self.Shell:ColorizeText(self.Texts.Debug.PluginDataLoaded, self.Dict.ShellColors.Green)
					)
				end
			else
				self.Shell:Error("Provided DataScope has incorrect value type. Please check LPF documentation.", 0)
			end
		end
	else
		self.Settings.Plugin = self.Settings.PluginDefaults
	end

	self.Events:AddListener(plugin, "Load", function()
		self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.PluginLoaded, self.Dict.ShellColors.Green))
	end)

	self.Events:AddListener(plugin, "Unload", function()
		if init_args.PluginData and type(init_args.PluginData) == "table" and init_args.PluginData.Enabled == true then
			if self.Settings.ResetToDefaults then
				self.Settings.Plugin = self.Settings.PluginDefaults
			end
			self.PluginData:Save(init_args.PluginData.DataScope, "", self.Settings.Plugin)
			self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.PluginDataSaved, self.Dict.ShellColors.Green))
			self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.PluginUnloaded, self.Dict.ShellColors.Amber))
		end
	end)
end

--[[
    Main LPF object.
]]
_G.LPF = LPFClasses.LotroPluginFramework:Constructor()