local awful = require("awful")
local gears = require("gears")

-- Handle autostart of application
awful.spawn.with_shell(
	'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;'
		.. 'xrdb -merge <<< "awesome.started:true";'
		.. 'dex --environment Awesome --autostart --search-paths "${XDG_CONFIG_HOME:-$HOME/.config}/autostart:${XDG_CONFIG_DIRS:-/etc/xdg}/autostart";'
)

awful.spawn.with_shell(gears.filesystem.get_configuration_dir() .. "autostart.sh")
