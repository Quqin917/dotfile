local awful = require("awful")

local function run_once(cmd)
  awful.spawn.with_shell(
    string.format("pgrep -u $USER -x %s > /dev/null || (%s)", cmd, cmd)
  )
end

run_once("picom --config ~/.config/picom/picom.conf")
run_once("xset r rate 250 40")
run_once("copyq &")
run_once("nm-applet")
run_once("wireplumber")
run_once("xss-lock -- i3lock -c 000000 --nofork")
