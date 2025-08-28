-- Add a titlebar if titlebars_enabled is set to true in the rules.
-- Enable titlebars with close, minimize, maximize buttons

local awful = require("awful")
local gears = require("gears")
local wibox = require("wibox")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

-- macOS-style Close Button (red)
local function create_close_button(c)
	local icon = wibox.widget({
		widget = wibox.widget.textbox,
		text = "",
		font = "IBM Plex Sans 10",
		align = "center",
		valign = "center",
	})

	local button = wibox.widget({
		{
			icon,
			widget = wibox.container.margin,
			margins = dpi(2),
		},
		id = "background_role",
		widget = wibox.container.background,
		shape = gears.shape.circle,
		bg = beautiful.lred,
		forced_width = dpi(20),
		forced_height = dpi(20),
	})

	button:connect_signal("mouse::enter", function()
		button.bg = beautiful.red
		icon.text = ""
	end)

	button:connect_signal("mouse::leave", function()
		button.bg = beautiful.lred
		icon.text = ""
	end)

	button:connect_signal("button::press", function()
		button.bg = beautiful.dred
	end)

	button:connect_signal("button::release", function()
		c:kill()
	end)

	return button
end

-- macOS-style Minimize Button (yellow)
local function create_minimize_button(c)
	local icon = wibox.widget({
		widget = wibox.widget.textbox,
		text = "",
		font = "IBM Plex Sans 7",
		align = "center",
		valign = "center",
		forced_width = dpi(12),
		forced_height = dpi(12),
	})

	local button = wibox.widget({
		{
			icon,
			widget = wibox.container.margin,
			margins = dpi(2),
		},
		id = "background_role",
		widget = wibox.container.background,
		shape = gears.shape.circle,
		bg = beautiful.lyellow,
		forced_width = dpi(20),
		forced_height = dpi(20),
	})

	button:connect_signal("mouse::enter", function()
		button.bg = beautiful.yellow
		icon.text = " "
	end)

	button:connect_signal("mouse::leave", function()
		button.bg = beautiful.lyellow
		icon.text = ""
	end)

	button:connect_signal("button::press", function()
		button.bg = beautiful.dyellow or beautiful.yellow
	end)

	button:connect_signal("button::release", function()
		c.minimized = true
	end)

	return button
end

-- macOS-style Maximize/Unmaximize Button (green)
local function create_maximize_button(c)
	local icon = wibox.widget({
		widget = wibox.widget.textbox,
		text = "",
		font = "IBM Plex Sans 10",
		align = "center",
		valign = "center",
	})

	local button = wibox.widget({
		{
			icon,
			widget = wibox.container.margin,
			margins = dpi(2),
		},
		id = "background_role",
		widget = wibox.container.background,
		shape = gears.shape.circle,
		bg = beautiful.lgreen,
		forced_width = dpi(20),
		forced_height = dpi(20),
	})

	button:connect_signal("mouse::enter", function()
		button.bg = beautiful.green
		icon.text = "󰘖" -- Nerd Font maximize icon (you can change)
	end)

	button:connect_signal("mouse::leave", function()
		button.bg = beautiful.lgreen
		icon.text = ""
	end)

	button:connect_signal("button::press", function()
		button.bg = beautiful.dgreen or beautiful.green
	end)

	button:connect_signal("button::release", function()
		c.maximized = not c.maximized
		c:raise()
	end)

	return button
end

-- Connect to titlebar request signal
return function(c)
	awful.titlebar(c, { size = dpi(30), bg = "#fffffffff" }):setup({
		{ -- Left: macOS-style traffic light buttons
			{
				create_close_button(c),
				create_minimize_button(c),
				create_maximize_button(c),
				spacing = dpi(6),
				layout = wibox.layout.fixed.horizontal,
			},
			margins = dpi(4),
			widget = wibox.container.margin,
		},
		nil,
		{ -- Right: empty or extra buttons (optional)
			layout = wibox.layout.fixed.horizontal,
		},
		layout = wibox.layout.align.horizontal,
	})
end
