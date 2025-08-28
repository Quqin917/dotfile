local awful = require("awful")
local hotkey = require("awful.hotkeys_popup")
local user = require("user")

local mod = "Mod4"
local alt = "Mod1"
local shift = "Shift"
local ctrl = "Control"

-- === GLOBAL KEYBINDINGS ===
awful.keyboard.append_global_keybindings({
	-- Layout
	awful.key({ mod }, "space", function()
		awful.layout.inc(1)
	end, { description = "Next layout", group = "Layout" }),

	-- Applications
	awful.key({ mod }, "Return", function()
		awful.spawn.with_shell(user.terminal)
	end, { description = "Open terminal", group = "Launcher" }),

	awful.key({ mod }, "p", function()
		awful.spawn.with_shell(user.launcher .. " -show drun")
	end, { description = "Application launcher", group = "Launcher" }),

	awful.key({ mod }, "w", function()
		awful.spawn.with_shell(user.launcher .. " -show window")
	end, { description = "Window switcher", group = "Launcher" }),

	-- Awesome control
	awful.key({ mod, ctrl }, "r", awesome.restart, { description = "Reload config", group = "Awesome" }),
	awful.key({ mod, ctrl }, "q", awesome.quit, { description = "Quit Awesome", group = "Awesome" }),

	-- Help
	awful.key({ mod }, "s", hotkey.show_help, { description = "Show help", group = "Awesome" }),
})

-- === CLIENT KEYBINDINGS ===
client.connect_signal("request::default_keybindings", function()
	awful.keyboard.append_client_keybindings({
		awful.key({ mod }, "f", function(c)
			c.fullscreen = not c.fullscreen
			c:raise()
		end, { description = "Toggle fullscreen", group = "Client" }),

		awful.key({ mod }, "m", function(c)
			c.maximized = not c.maximized
			c:raise()
		end, { description = "Toggle maximized", group = "Client" }),

		awful.key({ mod }, "c", function(c)
			c:kill()
		end, { description = "Close client", group = "Client" }),

		awful.key({ mod }, "Tab", function()
			awful.client.focus.history.previous()
			if client.focus then
				client.focus:raise()
			end
		end, { description = "Focus previous client", group = "Client" }),
	})
end)

-- === TAG KEYBINDINGS ===
for i = 1, #user.tag do
	local keycode = "#" .. (i + 9)
	awful.keyboard.append_global_keybindings({
		-- View tag
		awful.key({ mod }, keycode, function()
			local tag = awful.screen.focused().tags[i]
			if tag then
				tag:view_only()
			end
		end, { description = "View tag #" .. i, group = "Tag" }),

		-- Toggle tag view
		awful.key({ mod, ctrl }, keycode, function()
			local tag = awful.screen.focused().tags[i]
			if tag then
				awful.tag.viewtoggle(tag)
			end
		end, { description = "Toggle tag #" .. i, group = "Tag" }),

		-- Move client to tag
		awful.key({ mod, shift }, keycode, function()
			if client.focus then
				local tag = client.focus.screen.tags[i]
				if tag then
					client.focus:move_to_tag(tag)
				end
			end
		end, { description = "Move client to tag #" .. i, group = "Tag" }),
	})
end

-- === MOUSE KEYBINDINGS ===
client.connect_signal("request::default_mousebindings", function()
	awful.mouse.append_global_mousebindings({
		awful.button({}, 3, function()
			require("config.menu").menu:toggle()
		end),
	})

	awful.mouse.append_client_mousebindings({
		awful.button({ mod }, 1, awful.mouse.client.move),
		-- awful.button({ mod }, 3, awful.mouse.client.resize),
	})
end)
