import("LotroPluginFramework")

LPF:InitPlugin({ PluginData = {
	Enabled = false,
	DataScope = Turbine.DataScope.Account,
}, Debug = true })

import("Exodia.Parser")

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
        PlayerAvoids = 0,
        PlayerPartialAvoids = 0,
        PlayerParries = 0,
        PlayerPartialParries = 0,
        PlayerBlocks = 0,
        PlayerPartialBlocks = 0,
        PlayerResists = 0,
        DamageDoneLog = {},
        DamageTakenLog = {},
        HealingDoneLog = {},
        HealingTakenLog = {},
        BubbleDoneLog = {},
        BubbleTakenLog = {},
        PlayerAvoidLog = {},
        TargetAvoidLog = {},
        DefeatLog = {},
        EventLog = {},
    }
end

LPF.Events:AddListener(LPF.PluginGlobals.Player, "InCombatChanged", function (sender, args)
    if LPF.PluginGlobals.Player:IsInCombat() then
        LPF.PluginGlobals.StartSession()
    else
        LPF.PluginGlobals.ActiveSession.EndedAt = Turbine.Engine:GetGameTime()
        LPF.Shell:DebugMessage(LPF.Utils:DumpTable(LPF.PluginGlobals.ActiveSession))
    end
end)