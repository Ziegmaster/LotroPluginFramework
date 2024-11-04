-- Importing LPF

import("LotroPluginFramework")

-- How to initialize the plugin

LPF:InitPlugin({ PluginData = {
	Enabled = false,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })