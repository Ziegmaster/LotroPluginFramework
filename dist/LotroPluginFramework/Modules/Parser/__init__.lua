LPFClasses.Modules.Parser = class()

function LPFClasses.Modules.Parser:Constructor()
    self.ParseFunctions = {}
    self.Receiver = LPF.Events:AddListener(Turbine.Chat, "Received", function (sender, args)
        if type(self.ParseFunctions[args.ChatType]) ~= "table" then return end
        for chat_type_name, parse_func in pairs(self.ParseFunctions[args.ChatType]) do
            parse_func(sender, args)
        end
    end)
    return self
end

function LPFClasses.Modules.Parser:AddParseFunction(chat_type, func_name, func)
    if type(self.ParseFunctions[chat_type]) ~= "table" then
        self.ParseFunctions[chat_type] = {}
    end
    self.ParseFunctions[chat_type][func_name] = func
end

--[[
    Remove a function from the array by its name.
]]
function LPFClasses.Modules.Parser:RemoveParseFunction(chat_type, func_name)
    self.ParseFunctions[chat_type][func_name] = nil
end