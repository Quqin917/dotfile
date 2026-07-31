-- ~/.config/awesome/modules/polybar.lua

local awful = require("awful")

local function update_layout()
	local s = awful.screen.focused()
	if not s or not s.selected_tag then
		return
	end

	-- Grab the actual layout object, not just its name
	local current_layout = s.selected_tag.layout
	local text = ""

	if current_layout == awful.layout.suit.tile then
		text = "%{F#89b4fa}󰙀%{F-}  Tile"
	elseif current_layout == awful.layout.suit.tile.left then
		text = "%{F#89b4fa}󰙂%{F-}  Tile Left"
	elseif current_layout == awful.layout.suit.max then
		text = "%{F#89b4fa}󰍉%{F-}  Max"
	elseif current_layout == awful.layout.suit.floating then
		text = "%{F#89b4fa}󱂬%{F-}  Float"
	else
		text = awful.layout.getname(current_layout) or "Unknown"
	end

	local file = io.open("/tmp/awesome_layout", "w")
	if file then
		file:write(text .. "\n")
		file:close()
	end
end

-- Update on layout switch, tag switch, or window focus changes
tag.connect_signal("property::layout", update_layout)
tag.connect_signal("property::selected", update_layout)
client.connect_signal("focus", update_layout)
