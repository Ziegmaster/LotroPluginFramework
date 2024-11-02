LPF.Modules.Parser = {
    ParseFunctions = {},

    AddParseFunction = function (chat_type, func_name, func)
        if type(LPF.Modules.Parser.ParseFunctions[chat_type]) ~= "table" then
            LPF.Modules.Parser.ParseFunctions[chat_type] = {}
        end
        LPF.Modules.Parser.ParseFunctions[chat_type][func_name] = func
    end,

    --[[
        Remove a function from the array by its name.
    ]]
    RemoveParseFunction = function (chat_type, func_name)
        LPF.Modules.Parser.ParseFunctions[chat_type][func_name] = nil
    end,

    Receiver = LPF.Events.AddListener(Turbine.Chat, "Received", function (sender, args)
        if type(LPF.Modules.Parser.ParseFunctions[args.ChatType]) ~= "table" then return end
        for chat_type_name, parse_func in pairs(LPF.Modules.Parser.ParseFunctions[args.ChatType]) do
            parse_func(sender, args)
        end
    end)
}