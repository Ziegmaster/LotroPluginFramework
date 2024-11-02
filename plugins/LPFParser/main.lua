-- Importing LPF
import("LotroPluginFramework")

-- How to import modules
LPF.LoadModule(LPF.Dict.Modules.Parser)

-- How to initialize the plugin
LPF.InitPlugin({ Settings = {
	Enabled = true,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })

-- How to add callbacks to the parser

LPF.Modules.Parser.AddParseFunction(Turbine.ChatType.PlayerCombat, "OUT", function (sender, args)
    LPF.Shell.CommonText(args.Message)
end)

LPF.Modules.Parser.AddParseFunction(Turbine.ChatType.EnemyCombat, "IN", function (sender, args)
    LPF.Shell.CommonText(args.Message)
end)

-- How to remove callbacks

LPF.Modules.Parser.RemoveParseFunction(Turbine.ChatType.PlayerCombat, "OUT")
LPF.Modules.Parser.RemoveParseFunction(Turbine.ChatType.EnemyCombat, "IN")

LPF.Shell.DebugMessage(LPF.DumpTable(LPF.Modules.Parser.ParseFunctions))