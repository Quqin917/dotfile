local wibox = require("wibox")

local ICONS = {
	brightness = {
		[90] = "󰃠 ",
		[60] = "󰃝 ",
		[30] = "󰃟 ",
		[10] = "󰃞 ",
	},
	volume = {
		high = " ",
		medium = "󰕾 ",
		low = " ",
		muted = "󰖁 ",
	},
	mic = {
		on = " ",
		off = " ",
	},
}
