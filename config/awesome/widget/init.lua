local awful = require("awful")
local user = require("user")

client.connect_signal("request::titlebars", function(c)
	if c.request_no_titlebar then
		return
	end
	require("widget.titlebar.macos")(c)
end)

screen.connect_signal("request::desktop_decoration", function(s)
	awful.tag(user.tag, s, awful.layout.layouts[1])

	s.wibar = require("widget.topbar")(s)
end)

awesome.emit_signal("signal::blur", true)
