LPFClasses.Texts = class()

function LPFClasses.Texts:Constructor()
    import(LPF_VERSION_PATH("LotroPluginFramework.Core.Texts." .. LPF.Settings.Debug.Locale))
    return {
        --[[
	        Plugin localization object.
	        Extend it as you need.
        ]]
        Plugin = {},
        Debug = LPFClasses.DebugTexts:Constructor()
    }
end
