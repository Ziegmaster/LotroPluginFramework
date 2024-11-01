import("LotroPluginFramework")

LPF.InitPlugin({ Settings = {
	Enabled = true,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })
LPF.LoadModule(LPF.Dict.Modules.Parser)
LPF.LoadModule(LPF.Dict.Modules.UI)
