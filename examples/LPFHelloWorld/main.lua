import("LotroPluginFramework.Core")
import("LotroPluginFramework.Modules")

LPF.InitPlugin({ Settings = {
	Enabled = true,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })
LPF.LoadModule(LPF.Dict.ModuleImports.Parser)
LPF.LoadModule(LPF.Dict.ModuleImports.UI)
