local gears = require("gears")

-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:
awesome.connect_signal("signal::show_hotkey_app", function(status)
	if status then
		require("awful.hotkeys_popup.keys")
	end
end)

-- Global bindings
-- local globalkeys = require(... .. ".global")

-- Mouse bindings
-- require(... .. ".mouse")

-- Tag binding
-- local tagsKey = require(... .. ".tags")
--
-- root.keys(gears.table.join(tagsKey))
