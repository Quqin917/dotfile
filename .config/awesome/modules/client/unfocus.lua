local awful = require("awful")
local gears = require("gears")

local timers = {}

client.connect_signal("unfocus", function(c)
  if not (c.class and c.class:lower():find("bitwarden")) then return end

  -- start a short timer; if it gets focus back, we cancel
  timers[c] = gears.timer.start_new(0.3, function()
    if c.valid then c:kill() end
    timers[c] = nil
    return false
  end)
end)

client.connect_signal("focus", function(c)
  if timers[c] then
    timers[c]:stop()
    timers[c] = nil
  end
end)
