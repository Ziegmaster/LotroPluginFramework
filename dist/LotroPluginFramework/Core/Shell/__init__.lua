__LPF_CLASSES__.Shell = class()

function __LPF_CLASSES__.Shell:Constructor()
    return self
end

function __LPF_CLASSES__.Shell:CommonText(text)
    Turbine.Shell.WriteLine(text)
end

--[[
    These messages will be displayed in debug mode only
]]
function __LPF_CLASSES__.Shell:DebugMessage(text)
    if LPF.__DEBUG__ == true then
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

function __LPF_CLASSES__.Shell:Error(text, level)
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

function __LPF_CLASSES__.Shell:ColorizeText(text, color)
    return "<rgb=" .. color .. ">" .. text .. "</rgb>"
end