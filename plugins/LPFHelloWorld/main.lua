-- Importing LPF
import("LotroPluginFramework")

-- How to initialize the plugin
LPF.InitPlugin({ Settings = {
	Enabled = true,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })
