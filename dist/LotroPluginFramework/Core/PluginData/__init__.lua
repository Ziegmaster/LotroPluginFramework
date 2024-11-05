LPFClasses.PluginData = class()

function LPFClasses.PluginData:Constructor()
	return self
end

function LPFClasses.PluginData:Load(turbine_data_scope, file_name_suffix)
	local data = Turbine.PluginData.Load(
		turbine_data_scope,
		LPF.Settings.PluginDefaults.Name .. file_name_suffix,
		function() end
	)
	return LPF.Utils:TableDecode(data)
end

function LPFClasses.PluginData:Save(turbine_data_scope, file_name_suffix, data_object)
	Turbine.PluginData.Save(
		turbine_data_scope,
		LPF.Settings.PluginDefaults.Name .. file_name_suffix,
		LPF.Utils:TableEncode(data_object),
		function() end
	)
end