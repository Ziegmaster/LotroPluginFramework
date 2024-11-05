-- Importing LPF

import("LotroPluginFramework")

-- How to import modules

LPF.M.Parser = LPF.Modules.Parser:Load()

-- How to initialize the plugin

LPF:InitPlugin({ PluginData = {
	Enabled = false,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })

-- How to add parse functions

LPF.M.Parser:AddParseFunction(Turbine.ChatType.PlayerCombat, "Player", function (sender, args)
    LPF.Shell:CommonText(args.Message)
end)

LPF.M.Parser:AddParseFunction(Turbine.ChatType.EnemyCombat, "Enemy", function (sender, args)
    LPF.Shell:CommonText(args.Message)
end)

LPF.Shell:DebugMessage(LPF.Utils:DumpTable(LPF.M.Parser.ParseFunctions))

-- How to remove parse functions

LPF.M.Parser:RemoveParseFunction(Turbine.ChatType.PlayerCombat, "Player")
LPF.M.Parser:RemoveParseFunction(Turbine.ChatType.EnemyCombat, "Enemy")

LPF.Shell:DebugMessage(LPF.Utils:DumpTable(LPF.M.Parser.ParseFunctions))