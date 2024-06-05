import("LotroPluginFramework.Core")
import("LotroPluginFramework.Modules")

LPF.InitPlugin({ DEBUG = true })
LPF.LoadModule(LPF.Modules.Parser)
LPF.LoadModule(LPF.Modules.UI)

LPF.ShellDumpTable(LPF.Modules.UI[">>"])
