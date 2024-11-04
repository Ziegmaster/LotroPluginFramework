import("LotroPluginFramework")
import("LotroPluginFramework.Utils.DumpTable")

LPF:InitPlugin({ PluginData = {
	Enabled = false,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })

LPF.PluginGlobals.Parser = LPF.Modules.Parser:Load()

LPF.PluginGlobals.Player = Turbine.Gameplay.LocalPlayer:GetInstance()
LPF.PluginGlobals.ActiveSession = nil
LPF.PluginGlobals.SessionLog = {}
LPF.PluginGlobals.StartSession = function ()
    LPF.PluginGlobals.ActiveSession = {
        StartedAt = Turbine.Engine:GetGameTime(),
        EndedAt = nil,
        DamageDoneTotal = 0,
        DamageTakenTotal = 0,
        HealingDoneTotal = 0,
        HealingTakenTotal = 0,
        BubbleDoneTotal = 0,
        BubbleTakenTotal = 0,
        ActionsDone = 0,
        AttacksDone = 0,
        AttacksTaken = 0,
        DamageDoneLog = {},
        DamageTakenLog = {},
        HealingDoneLog = {},
        HealingTakenLog = {},
        BubbleDoneLog = {},
        BubbleTakenLog = {},
        SelfBPEMRLog = {},
        TargetBPEMRLog = {},
        DefeatLog = {},
        EventLog = {},
    }
end

LPF.Events.AddListener(LPF.PluginGlobals.Player, "InCombatChanged", function (sender, args)
    if LPF.PluginGlobals.Player:IsInCombat() then
        LPF.PluginGlobals.StartSession()
    else
        LPF.PluginGlobals.ActiveSession.EndedAt = Turbine.Engine:GetGameTime()
        LPF.Shell.DebugMessage(DumpTable(LPF.PluginGlobals.ActiveSession))
    end
end)