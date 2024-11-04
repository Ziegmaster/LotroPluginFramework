LPFClasses.LPFShell = _G.class()

function LPFClasses.LPFShell:Constructor(lpf)
    return {
        CommonText = function (text)
            Turbine.Shell.WriteLine(text)
        end,

        --[[
            These messages will be displayed in debug mode only
        ]]
        DebugMessage = function(text)
            if lpf.Debug == true then
                Turbine.Shell.WriteLine(
                    lpf.Shell.ColorizeText(
                        "[" .. lpf.Settings.PluginDefaults.Name .. "] ",
                        lpf.Settings.ShellColors.PluginNameLabel
                    )
                        .. lpf.Shell.ColorizeText("[DEBUG]: ", lpf.Settings.ShellColors.DebugMark)
                        .. lpf.Shell.ColorizeText(text, lpf.Settings.ShellColors.DebugText)
                )
            end
        end,
    
        Error = function(text, level)
            error(
                lpf.Shell.ColorizeText(
                    "[" .. lpf.Settings.PluginDefaults.Name .. "] ",
                    lpf.Settings.ShellColors.PluginNameLabel
                )
                    .. lpf.Shell.ColorizeText("[ERROR]: ", lpf.Settings.ShellColors.ErrorMark)
                    .. lpf.Shell.ColorizeText(text, lpf.Settings.ShellColors.ErrorText),
                level
            )
        end,
    
        ColorizeText = function(text, color)
            return "<rgb=" .. color .. ">" .. text .. "</rgb>"
        end,
    }
end