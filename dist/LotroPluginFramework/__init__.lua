import("Turbine")
import("Turbine.Class")
import("Turbine.Gameplay")
import("Turbine.Gameplay.Attributes")

_G.LPF_VERSION = "0_2_0"

_G.LPF_LOCALES = {
    EN = "EN",
    DE = "DE",
    FR = "FR",
    RU = "RU"
}

function _G.LPF_VERSION_PATH(path)
    return string.gsub(path, "LotroPluginFramework", "LotroPluginFramework." .. LPF_VERSION)
end

import(LPF_VERSION_PATH("LotroPluginFramework.Core"))