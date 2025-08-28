local awful = require("awful")
local beautiful = require("beautiful")

-- Signal function to execute when a new client appears.
client.connect_signal("request::manage", function(c)
	if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
		awful.placement.no_offscreen(c)
	end
end)

-- No borders if only one window on screen
local function border_adjust(c)
	if #c.screen.clients == 1 then
		c.border_width = beautiful.border_width
	end
end

-- No gaps if only one window on screen
local function gap_adjust(c)
	if #c.screen.clients == 1 then
		beautiful.useless_gap = 3
	end
end

-- Enable sloppy focus, so that focus follows mouse.
client.connect_signal("mouse::enter", function(c)
	c:emit_signal("request::activate", "mouse_enter", { raise = false })
end)

client.connect_signal("focus", function(c)
	border_adjust(c)
end)

client.connect_signal("focus", function(c)
	gap_adjust(c)
end)
