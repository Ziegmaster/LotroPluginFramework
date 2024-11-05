LPFClasses.Modules = {}

Module = class()

function Module:Constructor(name, path)
    self.Name = name
    self.Path = path
    return self
end

function Module:Load()
    import(self.Path)
    local module = LPFClasses.Modules[self.Name]:Constructor()
    LPF.Shell:DebugMessage(LPF.Texts.Debug.ModuleLoaded(LPF.Texts.Debug.ModuleNames[self.Name]))
    return module
end

LPFClasses.ModuleDict = class()

function LPFClasses.ModuleDict:Constructor()
    return {
        UI = Module:Constructor("UI", "LotroPluginFramework.Modules.UI"),
        Parser = Module:Constructor("Parser", "LotroPluginFramework.Modules.Parser")
    }
end