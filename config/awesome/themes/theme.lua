local gears = require("gears")
local gfs = require("gears.filesystem")

local user = require("user")

local theme = {}

theme.icon_path = gfs.get_configuration_dir() .. "themes/icons"

-- Fonts
theme.font = user.font

-- Colors
theme.background = "#141414"
theme.foreground = "#FFFFFF"

theme.bg_normal = theme.background
theme.fg_normal = theme.foreground

theme.bg_focus = "#44475a"

-- Borders
theme.border_width = 0
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.border_marked = "#91231c"

theme.width = screen.primary.geometry.width
theme.height = screen.primary.geometry.height

-- macOS-style titlebar button colors
theme.lred = "#ff5f57" -- Light red (idle)
theme.red = "#ff3b30" -- Hover red
theme.dred = "#bf0000" -- Pressed red

theme.lyellow = "#edd682"
theme.yellow = "#ecc747"
theme.dyellow = "#c4a000"

theme.lgreen = "#c9ee5e"
theme.green = "#22d87a"
theme.dgreen = "#208c4e"

theme.lblue = "#7fb4ff"
theme.blue = "#2366c3"
theme.dblue = "#123c81"

theme.layout_floating = gears.filesystem.get_themes_dir() .. "default/layouts/floatingw.png"
theme.layout_tile = gears.filesystem.get_themes_dir() .. "default/layouts/tilew.png"

return theme
