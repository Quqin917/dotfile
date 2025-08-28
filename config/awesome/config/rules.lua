local ruled = require("ruled")
local awful = require("awful")
local beautiful = require("beautiful")

-- Notifications rules
ruled.notification.connect_signal("request::rules", function()
	ruled.notification.append_rule({
		rule = {},
		properties = {
			screen = awful.screen.preferred,
			implicit_timeout = 5,
		},
	})
end)

-- Client rules
ruled.client.connect_signal("request::rules", function()
	-- Global default rule
	ruled.client.append_rule({
		id = "global",
		rule = {},
		properties = {
			raise = true,
			border_width = beautiful.border_width,
			border_color = beautiful.border_normal,
			focus = awful.client.focus.filter,
			screen = awful.screen.preferred,
			placement = awful.placement.no_offscreen,
		},
	})

	-- Titlebars for normal and dialog clients
	ruled.client.append_rule({
		id = "titlebars",
		rule_any = { type = { "normal", "dialog" } },
		properties = { titlebars_enabled = false },
	})

	-- Steam games fullscreen
	ruled.client.append_rule({
		rule = { class = "^steam_game_" },
		properties = {
			fullscreen = true,
			floating = false,
			ontop = false,
			maximized = false,
		},
	})

	-- Floating Client
	ruled.client.append_rule({
		rule_any = {
			instance = {
				"DTA",
				"copyq",
				"pinentry",
			},
			class = {
				"Arandr",
				"Blueman-manager",
				"pavucontrol",
				"Gpick",
				"Kruler",
				"MessageWin",
				"Sxiv2",
				"Tor Browser",
				"Wpa_gui",
				"veromix",
				"xtightvncviewer",
				"Qalculate-gtk",
			},
			name = {
				"Event Tester",
			},
			role = {
				"AlarmWindow",
				"ConfigManager",
				"pop-up",
			},
		},
		properties = {
			floating = true,
			placement = awful.placement.centered,
		},
	})
end)
