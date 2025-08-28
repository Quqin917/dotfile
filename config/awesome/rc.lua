pcall(require, "luarocks.loader")

local gears = require("gears")

local user = require("user")

-- Theme handling library
require("beautiful").init(require("gears").filesystem.get_configuration_dir() .. "themes/theme.lua")

require("config")

require("awful.autofocus")

-- Menubar configuration
require("menubar").utils.terminal = user.terminal -- Set the terminal for applications that require it

-- application hotkey help
awesome.emit_signal("signal::show_hotkey_app", false)

-- interface
require("widget")

local wibox = require("wibox")
local awful = require("awful")

-- Wallpaper setter per screen
local function create_awesome_wallpaper()
	local word_widget = wibox.layout.fixed.horizontal()
	word_widget.spacing = 15

	screen.connect_signal("request::wallpaper", function(s)
		awful.wallpaper({
			screen = s,
			bg = require("beautiful").background,
			widget = wibox.widget({
				word_widget,
				valign = "center",
				halign = "center",
				widget = wibox.container.place,
			}),
		})
	end)
end

local function wallpaper()
	awful.spawn.easy_async_with_shell("test -f " .. user.wallpaper .. " && echo '1' || echo '0'", function(stdout)
		if stdout:match("0") or user.wallpaper == "" then
			create_awesome_wallpaper()
		else
			gears.wallpaper.maximized(user.wallpaper, nil, true)
		end
	end)
end
wallpaper()

awesome.connect_signal("wallpaper::change", function()
	wallpaper()
end)
