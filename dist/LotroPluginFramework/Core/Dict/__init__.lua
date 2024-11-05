LPFClasses.Dict = class()

function LPFClasses.Dict:Constructor()
	return {
		LPF_VERSION = "0.2.0",
		Locales = {
			EN = "EN",
			DE = "DE",
			FR = "FR",
			RU = "RU"
		},
		ShellColors = {
			Red = "#ff0000",
			Green = "#00ff00",
			Blue = "#0000ff",
			Amber = "#ffbf00",
			Azure = "#007fff",
			Lime = "#bfff00",
			Platinum = "#e5e4e2",
			BlueMagenta = "#5f4ffa",
		},
	}
end