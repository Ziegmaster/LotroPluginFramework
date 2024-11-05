LPFClasses.Shell = class()

function LPFClasses.Shell:Constructor()
    return self
end

function LPFClasses.Shell:CommonText(text)
    Turbine.Shell.WriteLine(text)
end

--[[
    These messages will be displayed in debug mode only
]]
function LPFClasses.Shell:DebugMessage(text)
    if LPF.Debug == true then
        Turbine.Shell.WriteLine(
            LPF.Shell:ColorizeText(
                "[" .. LPF.Settings.PluginDefaults.Name .. "] ",
                LPF.Settings.ShellColors.PluginNameLabel
            )
                .. LPF.Shell:ColorizeText("[DEBUG]: ", LPF.Settings.ShellColors.DebugMark)
                .. LPF.Shell:ColorizeText(text, LPF.Settings.ShellColors.DebugText)
        )
    end
end

function LPFClasses.Shell:Error(text, level)
    error(
        LPF.Shell:ColorizeText(
            "[" .. LPF.Settings.PluginDefaults.Name .. "] ",
            LPF.Settings.ShellColors.PluginNameLabel
        )
            .. LPF.Shell:ColorizeText("[ERROR]: ", LPF.Settings.ShellColors.ErrorMark)
            .. LPF.Shell:ColorizeText(text, LPF.Settings.ShellColors.ErrorText),
        level
    )
end

function LPFClasses.Shell:ColorizeText(text, color)
    return "<rgb=" .. color .. ">" .. text .. "</rgb>"
end