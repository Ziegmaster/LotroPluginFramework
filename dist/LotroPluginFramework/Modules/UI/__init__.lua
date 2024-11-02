import("Turbine.UI")
import("Turbine.UI.Lotro")

LPF.Modules.UI = {
	Fonts = {
		Common = {
			[1] = {
				name = "Arial",
				size = {
					12,
				},
			},
			[2] = {
				name = "BookAntiqua",
				size = {
					12,
					14,
					16,
					18,
					20,
					22,
					24,
					26,
					28,
					32,
					36,
				},
			},
			[3] = {
				name = "BookAntiquaBold",
				size = {
					12,
					14,
					18,
					19,
					22,
					24,
				},
			},
			[4] = {
				name = "FixedSys",
				size = {
					15,
				},
			},
			[5] = {
				name = "LucidaConsole",
				size = {
					12,
				},
			},
			[6] = {
				name = "TrajanPro",
				size = {
					13,
					14,
					15,
					16,
					18,
					19,
					20,
					21,
					23,
					24,
					25,
					26,
					28,
				},
			},
			[7] = {
				name = "TrajanProBold",
				size = {
					16,
					22,
					24,
					25,
					30,
					36,
				},
			},
			[8] = {
				name = "Verdana",
				size = {
					10,
					12,
					14,
					16,
					18,
					20,
					22,
					23,
				},
			},
			[9] = {
				name = "VerdanaBold",
				size = {
					16,
				},
			},
			[10] = {
				name = "TimesRoman",
				size = {
					18,
					20,
					22,
					26,
					28,
					30,
					36,
				},
			},
			[11] = {
				name = "TimesRomanBold",
				size = {
					20,
					22,
				},
			},
			[12] = {
				name = "Courier",
				size = {
					12,
				},
			},
		},
		Special = {
			[10] = { --TimesRoman
				0x4200000e,
				0x420000f1,
				0x420000f4,
				0x42000169,
				0x42000168,
				0x4200016a,
				0x4200016b,
			},
			[11] = { --TimesRomanBold
				0x4200000f,
				0x42000010,
			},
			[12] = { --Courier12
				0x42000028,
			},
		},
	},
	GetFont = function(type, size)
		if LPF.Modules.UI.Fonts.Special[type] then
			return LPF.Modules.UI.Fonts.Special[type][size]
		else
			return Turbine.UI.Lotro.Font[LPF.Modules.UI.Fonts.Common[type].name .. LPF.Modules.UI.Fonts.Common[type].size[size]]
		end
	end,
	Controls = {},
}
