-- Importing LPF

import("LotroPluginFramework")

-- How to import modules

LPF.PluginGlobals.Parser = LPF.Modules.Parser:Load()

-- How to initialize the plugin

LPF:InitPlugin({ PluginData = {
	Enabled = false,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })

-- How to add parse functions

LPF.PluginGlobals.Parser:AddParseFunction(Turbine.ChatType.PlayerCombat, "Player", function (sender, args)
    LPF.Shell.CommonText(args.Message)
end)

LPF.PluginGlobals.Parser:AddParseFunction(Turbine.ChatType.EnemyCombat, "Enemy", function (sender, args)
    LPF.Shell.CommonText(args.Message)
end)

import("LotroPluginFramework.Utils.DumpTable")
LPF.Shell.DebugMessage(DumpTable(LPF.PluginGlobals.Parser.ParseFunctions))

-- How to remove parse functions

LPF.PluginGlobals.Parser:RemoveParseFunction(Turbine.ChatType.PlayerCombat, "Player")
LPF.PluginGlobals.Parser:RemoveParseFunction(Turbine.ChatType.EnemyCombat, "Enemy")

LPF.Shell.DebugMessage(DumpTable(LPF.PluginGlobals.Parser.ParseFunctions))