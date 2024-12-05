import("Turbine")
import("Turbine.Class")
import("Turbine.Gameplay")
import("Turbine.Gameplay.Attributes")

--[[
    LPF class object. Not for use in plugins!
]]
_G.__LPF_CLASSES__ = {}

__LPF_CLASSES__.LotroPluginFramework = class()

function __LPF_CLASSES__.LotroPluginFramework:Constructor()
    self.__VERSION__ = "0.3.0"
    return self
end

function __LPF_CLASSES__.LotroPluginFramework:__ImportScript__(path)
    import (self.__LPF_ROOT__ .. "." .. path)
end

function __LPF_CLASSES__.LotroPluginFramework:__Load__()
    --[[
		Your plugin object.
	]]
	self.Plugin = plugin
	--[[
		Your plugin variables accessible everywhere.
	]]
	self.PluginVars = {}

	self:__ImportScript__("LotroPluginFramework.Core.Utils")
	self:__ImportScript__("LotroPluginFramework.Core.Dict")
	self:__ImportScript__("LotroPluginFramework.Core.Settings")
	self:__ImportScript__("LotroPluginFramework.Core.Texts")
	self:__ImportScript__("LotroPluginFramework.Core.Shell")
	self:__ImportScript__("LotroPluginFramework.Core.Events")
	self:__ImportScript__("LotroPluginFramework.Core.PluginData")

	self.Utils = __LPF_CLASSES__.Utils:Constructor()
	self.Dict = __LPF_CLASSES__.Dict:Constructor()
	--[[
    	General LPF Settings
	]]
	self.Settings = __LPF_CLASSES__.Settings:Constructor()
	--[[
    	General localization object
	]]
	self.Texts = __LPF_CLASSES__.Texts:Constructor()
	self.Shell = __LPF_CLASSES__.Shell:Constructor()
	self.Events = __LPF_CLASSES__.Events:Constructor()
	self.PluginData = __LPF_CLASSES__.PluginData:Constructor()
    self.Modules = {}
end

--[[
    Starting point of the entire LotroPluginFramework.
    Creates the plugin sture.
    
    Path to the location of LotroPluginFramework inside your plugin folder.
    Examples -> "HelloWorld" | "PluginAuthor" | "PluginAuthor.HelloWorld"
    lpf_root: string

    init_args: table = {
		Debug: boolean
	}
]]
function __LPF_CLASSES__.LotroPluginFramework:InitPlugin(lpf_root, init_args)
    if type(lpf_root) == "string" then
        self.__LPF_ROOT__ = lpf_root
        self:__Load__()
    else
        self.Shell:Error(self.Shell:ColorizeText(self.Texts.Debug.PluginRootError, self.Dict.HexColors.Red))
    end

	if type(init_args) ~= "table" then
		init_args = {}
	end

	self.__DEBUG__ = not (init_args.Debug == false)

	self.Shell:DebugMessage(self.Shell:ColorizeText(self.Texts.Debug.StartupMessage, self.Dict.HexColors.Amber))

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

function __LPF_CLASSES__.LotroPluginFramework:LoadModule(modue_name)
    LPF:__ImportScript__("LotroPluginFramework.Modules." .. modue_name)
    LPF.Shell:DebugMessage(LPF.Texts.Debug.ModuleLoaded(modue_name))
    return LPF.Modules[modue_name]:Constructor()
end

--[[
    Main LPF object.
]]
_G.LPF = __LPF_CLASSES__.LotroPluginFramework:Constructor()