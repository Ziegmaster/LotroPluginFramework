__LPF_CLASSES__.PluginData = class()

function __LPF_CLASSES__.PluginData:Constructor()
	return self
end

function __LPF_CLASSES__.PluginData:Load(turbine_data_scope, file_name_suffix)
	local data = Turbine.PluginData.Load(
		turbine_data_scope,
		LPF.Settings.PluginDefaults.Name .. file_name_suffix,
		function() end
	)
	return LPF.Utils:TableDecode(data)
end

function __LPF_CLASSES__.PluginData:Save(turbine_data_scope, file_name_suffix, data_object)
	Turbine.PluginData.Save(
		turbine_data_scope,
		LPF.Settings.PluginDefaults.Name .. file_name_suffix,
		LPF.Utils:TableEncode(data_object),
		function() end
	)
end