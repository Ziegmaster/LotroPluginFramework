--[[
    LPF class object. Not for use in plugins!
]]
_G.LPFClasses = {}

LPFClasses.LotroPluginFramework = class()

function LPFClasses.LotroPluginFramework:Constructor()
	return self
end

function LPFClasses.LotroPluginFramework:Load()
	import(LPF_VERSION_PATH("LotroPluginFramework.Utils"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Core.Dict"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Core.Settings"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Core.Texts"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Core.Shell"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Core.Events"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Core.PluginData"))
	import(LPF_VERSION_PATH("LotroPluginFramework.Modules"))
	--[[
		Your plugin object.
	]]
	self.Plugin = plugin
	--[[
		Your plugin variables accessible everywhere.
	]]
	self.PluginGlobals = {}
	--[[
		It's recommended to load modules into this object.
	]]
	self.M = {}
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

	local startup_message = "LotroPluginFramework v" .. string.gsub(LPF_VERSION, "_", ".") .. " by Ziegmaster"
	self.Shell:DebugMessage(self.Shell:ColorizeText(startup_message, self.Dict.HexColors.Amber))

	if init_args.PluginData and type(init_args.PluginData) == "table" and init_args.PluginData.Enabled == true then
		if init_args.PluginData.DataScope == nil then
			self.Settings.Plugin = self.PluginData:Load(Turbine.DataScope.Account, "")
			if self.Settings.Plugin == nil then
				self.Settings.FirstLaunch = true
				self.Settings.Plugin = self.Settings.PluginDefaults
				self.Shell:DebugMessage(
					self.Shell:ColorizeText(self.Texts.Debug.PluginDataCreated, self.Dict.HexColors.Green)
				)
			else
				self.Shell:DebugMessage(
					self.Shell:ColorizeText(self.Texts.Debug.PluginDataLoaded, self.Dict.HexColors.Green)
				)
			end
		else
			if type(init_args.PluginData.DataScope) == "number" then
				self.Settings.Plugin = self.PluginData:Load(init_args.PluginData.DataScope, "")
				if self.Settings.Plugin == nil then
					self.Settings.FirstLaunch = true
					self.Settings.Plugin = self.Settings.PluginDefaults
					self.Shell:DebugMessage(
						self.Shell:ColorizeText(self.Texts.Debug.PluginDataCreated, self.Dict.HexColors.Green)
					)
				else
					self.Shell:DebugMessage(
						self.Shell:ColorizeText(self.Texts.Debug.PluginDataLoaded, self.Dict.HexColors.Green)
					)
				end
			else
				self.Shell:Error("Provided DataScope has incorrect value type. Please check LPF documentation.", 0)
			end
		end
	else
		self.Settings.Plugin = self.Settings.PluginDefaults
		if init_args.DefaultLocale then
			self.Settings.Debug.Locale = init_args.DefaultLocale
			self.Settings.Plugin.Locale = init_args.DefaultLocale
		end
	end

	self.Events:AddListener(plugin, "Load", function()
		self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.PluginLoaded, self.Dict.HexColors.Green))
	end)

	self.Events:AddListener(plugin, "Unload", function()
		if init_args.PluginData and type(init_args.PluginData) == "table" and init_args.PluginData.Enabled == true then
			if self.Settings.ResetToDefaults then
				self.Settings.Plugin = self.Settings.PluginDefaults
			end
			self.PluginData:Save(init_args.PluginData.DataScope, "", self.Settings.Plugin)
			self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.PluginDataSaved, self.Dict.HexColors.Green))
			self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.PluginUnloaded, self.Dict.HexColors.Amber))
		end
	end)
end

--[[
    Main LPF object.
]]
_G.LPF = LPFClasses.LotroPluginFramework:Constructor()