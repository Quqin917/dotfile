local home = os.getenv("HOME")

local M = {}

-- User Based Theme Variable
M.wallpaper = home .. "/wallpaper/pokemon_firered_wm_dark.png"
M.font = "FireCode Nerd Font 10"

M.terminal = "kitty"
M.editor = "nvim"
M.launcher = "rofi"
M.tag = { "1", "2", "3", "4", "5" }

return M
