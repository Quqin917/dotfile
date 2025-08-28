local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local gears = require("gears")

local user = require("user")

-- Menu theme
local menu_theme = {
	height = 28,
	width = 160,

	bg_normal = "#1a1a1a",
	fg_normal = "#bbbbbb",
	bg_focus = "#5294e2",
	fg_focus = "#ffffff",

	submenu_icon = "",
	submenu = "",
}

-- Main menu items
local main_menu_items = {
	{
		"Awesome",
		{
			{
				"Hotkeys",
				function()
					hotkeys_popup.show_help(nil, awful.screen.focused())
				end,
			},
			{ "Manual", user.terminal .. " -e man awesome" },
			{ "Restart", awesome.restart },
			{ "Quit", awesome.quit },
		},
	},
	{
		"System",
		{
			{
				"Suspend",
				function()
					awful.spawn("systemctl suspend")
				end,
			},
			{
				"Shutdown",
				function()
					awful.spawn("systemctl poweroff")
				end,
			},
		},
	},
	{ "Terminal", user.terminal },
}

awful.menu.original_new = awful.menu.new
function awful.menu.new(...)
	local ret = awful.menu.original_new(...)

	-- Rounded corners
	ret.wibox.shape = function(cr, w, h)
		gears.shape.rounded_rect(cr, w, h, 6)
	end

	-- Submenu positioning
	local orig_show = ret.show
	function ret:show(...)
		orig_show(self, ...)

		if self.parent and self.parent.wibox and self.wibox then
			if self._reposition_timer then
				self._reposition_timer:stop()
				self._reposition_timer = nil
			end

			self._reposition_timer = gears.timer.start_new(0.1, function()
				local gap = 2
				self.wibox.x = self.parent.wibox.x + self.parent.wibox.width + gap
				self.wibox.y = self.parent.wibox.y
				self._reposition_timer = nil
				return false
			end)
		end
	end

	return ret
end

-- Create main menu
local main_menu = awful.menu({
	items = main_menu_items,
	theme = menu_theme,
})

-- Launcher widget (use `menu` key here, not `mainMenu`)
local mylauncher = awful.widget.launcher({
	-- image = beautiful.awesome_icon,
	menu = main_menu,
})

-- Return menu and launcher for external use
return {
	menu = main_menu,
	launcher = mylauncher,
}
