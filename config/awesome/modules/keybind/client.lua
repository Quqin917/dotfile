local gears = require("gears")
local awful = require("awful")

local modkey = require("user").modkey

local client = {}

client.button = gears.table.join(
	awful.button({}, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
	end),

	awful.button({ modkey }, 1, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.move(c)
	end),

	awful.button({ modkey }, 3, function(c)
		c:emit_signal("request::activate", "mouse_click", { raise = true })
		awful.mouse.client.resize(c)
	end)
)

client.key = gears.table.join(
	awful.key({ modkey }, "f", function(c)
		c.fullscreen = not c.fullscreen
		c:raise()
	end, { description = "toggle fullscreen", group = "client" }),

	awful.key({ modkey }, "c", function(c)
		c:kill()
	end, { description = "close", group = "client" }),

	awful.key(
		{ modkey, "Control" },
		"space",
		awful.client.floating.toggle,
		{ description = "toggle floating", group = "client" }
	),

	awful.key({ modkey, "Control" }, "Return", function(c)
		c:swap(awful.client.getmaster())
	end, { description = "move to master", group = "client" }),

	awful.key({ modkey }, "o", function(c)
		c:move_to_screen()
	end, { description = "move to screen", group = "client" }),

	awful.key({ modkey }, "t", function(c)
		c.ontop = not c.ontop
	end, { description = "toggle keep on top", group = "client" }),

	awful.key({ modkey }, "n", function(c)
		c.minimized = true
	end, { description = "minimize", group = "client" }),

	awful.key({ modkey, "Control" }, "n", function()
		for _, c in ipairs(awful.screen.focused().clients) do
			if c.minimized then
				c.minimized = false

				c:emit_signal("request::activate", "key.unminimize", { raise = true })
				client.focus = c
				return
			end
		end
	end, { description = "restore minimized", group = "client" }),

	-- all minimized clients are restored
	awful.key({ modkey, "Shift" }, "n", function()
		local tag = awful.tag.selected()
		for _, c in ipairs(tag:clients()) do
			if c.minimized then
				c.minimized = false
				c:emit_signal("request::activate", "key.unminimize", { raise = true })
			end
		end
	end, { description = "restore all minimized", group = "client" }),

	awful.key({ modkey }, "m", function(c)
		c.maximized = not c.maximized
		c:raise()
	end, { description = "(un)maximize", group = "client" }),

	awful.key({ modkey, "Control" }, "m", function(c)
		c.maximized_vertical = not c.maximized_vertical
		c:raise()
	end, { description = "(un)maximize vertically", group = "client" }),

	awful.key({ modkey, "Shift" }, "m", function(c)
		c.maximized_horizontal = not c.maximized_horizontal
		c:raise()
	end, { description = "(un)maximize horizontally", group = "client" }),

	awful.key({ modkey, "Shift" }, "Right", function()
		awful.tag.incmwfact(0.05)
	end, { description = "Resize Right", group = "layout" }),

	awful.key({ modkey, "Shift" }, "Left", function()
		awful.tag.incmwfact(-0.05)
	end, { description = "Resize Left", group = "layout" }),

	awful.key({ modkey, "Shift" }, "Up", function()
		awful.client.incwfact(0.05)
	end, { description = "Resize Up", group = "layout" }),

	awful.key({ modkey, "Shift" }, "Down", function()
		awful.client.incwfact(-0.05)
	end, { description = "Resize Down", group = "layout" })
)

return client
