LPFClasses.LPFModules = {}

Module = _G.class()

function Module:Constructor(lpf, name, path)
    self.LPF = lpf
    self.Name = name
    self.Path = path
    return self
end

function Module:Load()
    import(self.Path)
    local module = LPFClasses.LPFModules[self.Name]:Constructor(self.LPF)
    self.LPF.Shell.DebugMessage(self.LPF.Texts.Debug.ModuleLoaded(self.LPF.Texts.Debug.ModuleNames[self.Name]))
    return module
end

LPFClasses.LPFModuleDict = _G.class()

function LPFClasses.LPFModuleDict:Constructor(lpf)
    return {
        UI = Module:Constructor(lpf, "UI", "LotroPluginFramework.Modules.UI"),
        Parser = Module:Constructor(lpf, "Parser", "LotroPluginFramework.Modules.Parser")
    }
end