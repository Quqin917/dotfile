local awful = require("awful")
local beautiful = require("beautiful")

local wibox = require("wibox")

local user = require("user")

return function(wallpaper, control)
	awful.screen.connect_for_each_screen(function(s)
		wallpaper(beautiful.wallpaper)

		awful.tag(user.tag, s, awful.layout.layouts[1])

		s.mypromptbox = awful.widget.prompt()
		s.mylayoutbox = awful.widget.layoutbox(s)
		s.mytaglist = awful.widget.taglist({
			screen = s,
			filter = awful.widget.taglist.filter.all,
		})
		s.mytasklist = awful.widget.tasklist({
			screen = s,
			filter = awful.widget.tasklist.filter.currenttags,
		})

		s.mywibox = awful.wibar({
			position = "top",
			bg = beautiful.background,
			screen = s,
		})

		s.mywibox:setup({
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

			nil,
			-- 	{
			-- 		control,
			-- 		spacing = 30,
			-- 		layout = wibox.layout.fixed.horizontal,
			-- 	},
			-- 	right = 10,
			-- 	widget = wibox.container.margin,
			-- },
			nil,
		})

		local blur = require("script").blur
		local opacity, alpha = blur.opacity()

		-- OPTIONAL: Using blurred background with signal
		awesome.connect_signal("signal::blur", function(status)
			s.mywibox.bg = not status and beautiful.background .. opacity or beautiful.background .. alpha
		end)
	end)
end
