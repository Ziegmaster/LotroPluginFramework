local function tableEncode(tbl)
	if type(tbl) == "number" then
		local text = tostring(tbl)

		return "#" .. string.gsub(text, ",", ".")
	elseif type(tbl) == "string" then
		return "$" .. tbl
	elseif type(tbl) == "table" then
		local new = {}

		for k, v in pairs(tbl) do
			new[tableEncode(k)] = tableEncode(v)
		end

		return new
	else
		return tbl
	end
end

local function tableDecode(tbl)
	if type(tbl) == "string" then
		local prefix = string.sub(tbl, 1, 1)

		if prefix == "$" then
			return string.sub(tbl, 2)
		elseif prefix == "#" then
			return loadstring("return " .. string.sub(tbl, 2))()
		else
			return tbl
		end
	elseif type(tbl) == "table" then
		local new = {}

		for k, v in pairs(tbl) do
			new[tableDecode(k)] = tableDecode(v)
		end

		return new
	else
		return tbl
	end
end

LPFClasses.LPFPluginData = _G.class()

function LPFClasses.LPFPluginData:Constructor(lpf)
    function LPFClasses.LPFPluginData:Load(turbine_data_scope, file_name_suffix)
        local data = Turbine.PluginData.Load(
            turbine_data_scope,
            lpf.Settings.PluginDataDefaults.Name .. file_name_suffix,
            function() end
        )
        return tableDecode(data)
    end
    
    function LPFClasses.LPFPluginData:Save(turbine_data_scope, file_name_suffix, data_object)
        Turbine.PluginData.Save(
            turbine_data_scope,
            lpf.Settings.PluginDataDefaults.Name .. file_name_suffix,
            tableEncode(data_object),
            function() end
        )
    end
end