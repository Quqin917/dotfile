local awful = require("awful")
local wibox = require("wibox")

local beautiful = require("beautiful")

local blur = require("script").blur
-- local control = require(... .. ".widgets.controlCenter")

-- Wibar builder function
return function(s)
	s.mylayoutbox = awful.widget.layoutbox(s)
	s.mypromptbox = awful.widget.prompt()
	s.mytaglist = awful.widget.taglist({
		screen = s,
		filter = awful.widget.taglist.filter.all,
	})
	s.mytasklist = awful.widget.tasklist({
		screen = s,
		filter = awful.widget.tasklist.filter.currenttags,
	})

	local wibar = awful.wibar({
		position = "top",
		height = 40,
		width = beautiful.width,
		bg = beautiful.background,
		ontop = false,
		screen = s,
		widget = {
			layout = wibox.layout.align.horizontal,

			{ -- Left
				layout = wibox.layout.fixed.horizontal,
				spacing = 10,
				{ -- Layouts
					s.mylayoutbox,
					left = 10,
					right = 5,
					top = 5,
					bottom = 5,
					widget = wibox.container.margin,
				},
				{ -- Tags
					s.mytaglist,
					right = 5,
					widget = wibox.container.margin,
				},
				s.mypromptbox,
			},

			nil, -- Middle (optional)
			nil, -- Right  (optional)
		},
	})

	-- Connect blur signal to dynamic background update
	awesome.connect_signal("signal::blur", function(status)
		local opacity, alpha = blur.opacity(80)
		wibar.bg = not status and beautiful.background .. alpha or beautiful.background .. opacity
	end)

	awesome.register_xproperty("WM_NAME", "string")
	wibar:set_xproperty("WM_NAME", "topbar")
	return wibar
end
