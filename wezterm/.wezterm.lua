-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- Font settings
config.font = wezterm.font("JetBrains Mono")
config.font_size = 14

-- color scheme
config.color_scheme = 'rose-pine-moon'

config.enable_tab_bar = false

config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.macos_window_background_blur = 10

config.keys = {
	{
		key = "Backspace",
		mods = "CMD",
		action = wezterm.action.SendKey({
			key = "u",
			mods = "CTRL",
		}),
	},
}


-- and finally, return the configuration to wezterm
return config