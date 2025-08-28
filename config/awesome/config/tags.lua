local awful = require("awful")
-- local beautiful = require("beautiful")

local user = require("user")

-- Table of layouts to cover with awful.layout.inc, order matters.
awful.layout.layouts = {
	awful.layout.suit.tile,
	awful.layout.suit.floating,
}
