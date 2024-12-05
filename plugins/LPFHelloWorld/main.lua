-- Importing LPF
import("LPFHelloWorld.LotroPluginFramework")

-- How to initialize the plugin
LPF:InitPlugin("LPFHelloWorld", { Debug = true })

-- How to Import and use modules
LPF:LoadModule("Parser")
LPF.Modules.Parser:AddParseFunction(Turbine.ChatType.World, "World parser", function (sender, args)
	LPF.Shell:CommonText(LPF.Shell:ColorizeText("Another message in WC", LPF.Dict.HexColors.BlueMagenta))
end)