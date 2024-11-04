LPF.Modules.Parser.AddParseFunction(Turbine.ChatType.PlayerCombat, "Player", function (sender, args)
    if LPF.PluginGlobals.ActiveSession == nil and LPF.PluginGlobals.Player:IsInCombat() then
        LPF.PluginGlobals.StartSession()
    end
    local time = Turbine.Engine:GetGameTime()
    local attacker_name, hit_type, skill_name, target_name, damage_value, damage_type, attribute, fail_reason
    local pattern1 = "^(.+) scored a (.+) with (.+) on (.+) for (.+) (.+) damage to (.+)."
    local pattern2 = "^(.+) tried to use (.+) on (.+) but (.+) (.+) the attempt."
    local pattern3 = "^(.+) (.+) trying to use ^(.+) on ^(.+)."
    local pattern2_placeholder
    attacker_name, hit_type, skill_name, target_name, damage_value, damage_type, attribute = string.match(args.Message, pattern1);
    if attacker_name ~= nil and hit_type ~= nil and skill_name ~= nil and target_name ~= nil and damage_value ~= nil and damage_type ~= nil and attribute ~= nil then
        if skill_name == "a melee attack" then
            skill_name = "Melee attack"
        end
        if skill_name == "a ranged attack" then
            skill_name = "Ranged attack"
        end
        local name_check1 = string.sub(attacker_name, 1, 3)
        local name_check2 = string.sub(target_name, 1, 3)
        if name_check1 == "The" then
            attacker_name = string.sub(attacker_name, 5)
        end
        if name_check2 == "The" or name_check2 == "the" then
            target_name = string.sub(target_name, 5)
        end
        damage_value = string.gsub(damage_value, ",", "")
        if attacker_name == LPF.PluginGlobals.Player:GetName() then
            table.insert(LPF.PluginGlobals.ActiveSession.DamageDoneLog, {
                Time = time,
                AttackerName = attacker_name,
                HitType = hit_type,
                SkillName = skill_name,
                TargetName = target_name,
                DamageValue = damage_value,
                DamageType = damage_type,
                Attribute = attribute
            })
            LPF.PluginGlobals.ActiveSession.DamageDoneTotal = LPF.PluginGlobals.ActiveSession.DamageDoneTotal + damage_value
            LPF.PluginGlobals.ActiveSession.ActionsDone = LPF.PluginGlobals.ActiveSession.ActionsDone + 1
            LPF.PluginGlobals.ActiveSession.AttacksDone = LPF.PluginGlobals.ActiveSession.AttacksDone + 1
        else
            table.insert(LPF.PluginGlobals.ActiveSession.DamageTakenLog, {
                Time = time,
                AttackerName = attacker_name,
                HitType = hit_type,
                SkillName = skill_name,
                TargetName = target_name,
                DamageValue = damage_value,
                DamageType = damage_type,
                Attribute = attribute
            })
            LPF.PluginGlobals.ActiveSession.DamageTakenTotal = LPF.PluginGlobals.ActiveSession.DamageTakenTotal + damage_value
            LPF.PluginGlobals.ActiveSession.AttacksTaken = LPF.PluginGlobals.ActiveSession.AttacksTaken + 1
        end
        return
    end
    attacker_name, skill_name, target_name, pattern2_placeholder, fail_reason = string.match(args.Message, pattern2)
    if attacker_name ~= nil and skill_name ~= nil and target_name ~= nil and fail_reason ~= nil then
        local name_check1 = string.sub(attacker_name, 1, 3)
        local name_check2 = string.sub(target_name, 1, 3)
        if name_check1 == "The" then
            attacker_name = string.sub(attacker_name, 5)
        end
        if name_check2 == "The" or name_check2 == "the" then
            target_name = string.sub(target_name, 5)
        end
        if attacker_name == LPF.PluginGlobals.Player:GetName() then
            table.insert(LPF.PluginGlobals.ActiveSession.TargetBPEMRLog, {
                Time = time,
                AttackerName = attacker_name,
                SkillName = skill_name,
                TargetName = target_name,
                FailReason = fail_reason
            })
            LPF.PluginGlobals.ActiveSession.ActionsDone = LPF.PluginGlobals.ActiveSession.ActionsDone + 1
            LPF.PluginGlobals.ActiveSession.AttacksDone = LPF.PluginGlobals.ActiveSession.AttacksDone + 1
        else
            table.insert(LPF.PluginGlobals.ActiveSession.SelfBPEMRLog, {
                Time = time,
                AttackerName = attacker_name,
                SkillName = skill_name,
                TargetName = target_name,
                FailReason = fail_reason
            })
            LPF.PluginGlobals.ActiveSession.AttacksTaken = LPF.PluginGlobals.ActiveSession.AttacksTaken + 1
        end
        return
    end
    attacker_name, fail_reason, skill_name, target_name = string.match(args.Message, pattern3)
    if attacker_name ~= nil and skill_name ~= nil and target_name ~= nil and fail_reason ~= nil then
        local name_check1 = string.sub(attacker_name, 1, 3)
        local name_check2 = string.sub(target_name, 1, 3)
        if name_check1 == "The" then
            attacker_name = string.sub(attacker_name, 5)
        end
        if name_check2 == "The" or name_check2 == "the" then
            target_name = string.sub(target_name, 5)
        end
        if attacker_name == LPF.PluginGlobals.Player:GetName() then
            table.insert(LPF.PluginGlobals.ActiveSession.TargetBPEMRLog, {
                Time = time,
                AttackerName = attacker_name,
                SkillName = skill_name,
                TargetName = target_name,
                FailReason = fail_reason
            })
            LPF.PluginGlobals.ActiveSession.ActionsDone = LPF.PluginGlobals.ActiveSession.ActionsDone + 1
            LPF.PluginGlobals.ActiveSession.AttacksDone = LPF.PluginGlobals.ActiveSession.AttacksDone + 1
        else
            table.insert(LPF.PluginGlobals.ActiveSession.SelfBPEMRLog, {
                Time = time,
                AttackerName = attacker_name,
                SkillName = skill_name,
                TargetName = target_name,
                FailReason = fail_reason
            })
            LPF.PluginGlobals.ActiveSession.AttacksTaken = LPF.PluginGlobals.ActiveSession.AttacksTaken + 1
        end
        return
    end
end)

LPF.Modules.Parser.AddParseFunction(Turbine.ChatType.EnemyCombat, "Enemy", function (sender, args)
    LPF.Shell.CommonText(args.Message)
end)