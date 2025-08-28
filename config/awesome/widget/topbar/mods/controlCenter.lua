local wibox = require("wibox")
local gears = require("gears")
-- local awful = require("awful")

local beautiful = require("beautiful")

local controlCenter = wibox.widget({
	image = beautiful.icon_path .. "tag/controlcenter.svg",
	valign = "center",
	widget = wibox.widget.imagebox,
})

local widget = wibox.widget({
	controlCenter,
	spacing = 28,
	layout = wibox.layout.fixed.horizontal,
})

return widget
