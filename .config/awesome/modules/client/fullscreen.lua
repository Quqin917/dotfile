-- Fix: flameshot doesn't used the full window screen
client.connect_signal("manage", function(c)
	if c.class == "flameshot" then
		-- Force double click on fullscreen button
		for _ = 1, 2, 1 do
			c.fullscreen = not c.fullscreen
		end
		c:raise()
	end
end)
