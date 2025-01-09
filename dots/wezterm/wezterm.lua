-- See https://wezfurlong.org/wezterm/

local wezterm = require("wezterm")
local config = {}

config = {
	font = wezterm.font({ family = "JetBrainsMono Nerd Font" }),
	font_size = 18,
	color_scheme = "Catppuccin Mocha",
}

return config
