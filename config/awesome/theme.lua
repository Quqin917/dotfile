-- Your theme file: theme.lua

local gears = require("gears")

local theme = {}

-- Fonts
theme.font = "FireCode Nerd Font 10"

-- Colors
theme.bg_normal = "#222222"
theme.bg_focus = "#535d6c"
theme.bg_urgent = "#ff0000"
theme.bg_minimize = "#444444"
theme.bg_systray = theme.bg_normal

theme.fg_normal = "#aaaaaa"
theme.fg_focus = "#ffffff"
theme.fg_urgent = "#ffffff"
theme.fg_minimize = "#ffffff"

-- Borders
theme.useless_gap = 0
theme.border_width = 1
theme.border_normal = "#000000"
theme.border_focus = "#535d6c"
theme.border_marked = "#91231c"

-- Wallpaper
theme.wallpaper = "~/wallpaper/pokemon_firered_wm_dark.png"

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

-- Optional: icons
theme.layout_floating = gears.filesystem.get_themes_dir() .. "default/layouts/floatingw.png"
theme.layout_tile = gears.filesystem.get_themes_dir() .. "default/layouts/tilew.png"

return theme
