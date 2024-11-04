LPFClasses.LPFTexts = _G.class()

function LPFClasses.LPFTexts:Constructor(lpf)
    import("LotroPluginFramework.Core.Texts." .. lpf.Settings.Debug.Locale)
    return {
        --[[
	        Plugin localization object.
	        Extend it as you need.
        ]]
        Plugin = {},
        Debug = LPFClasses.LPFDebugTexts:Constructor(lpf)
    }
end
