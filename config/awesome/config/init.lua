require(... .. ".autostart")
require(... .. ".tags")
require(... .. ".client")
require(... .. ".rules")
require(... .. ".keys")
require(... .. ".menu")

local naughty = require("naughty")

--[[ 
  Error handling:
  This will run if an error is encountered and 
  send a notification specifying what happened. 
  It's best to put this at the start of the file.
--]]
naughty.connect_signal("request::display_error", function(message, startup)
	naughty.notification({
		urgent = "critical",
		app_name = "Awesome",
		title = "An error occured" .. (startup and " during startup." or "."),
		message = message,
		ontop = true,
	})
end)
