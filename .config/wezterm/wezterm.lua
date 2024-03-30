-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

config.font = wezterm.font 'Hack Nerd Font'
config.color_scheme = 'Catppuccin Mocha'
config.enable_tab_bar = false
config.default_cursor_style = "BlinkingUnderline"
config.window_close_confirmation = 'NeverPrompt'

config.window_padding = {
	left = 25,
	right = 25,
	top = 25,
	bottom = 25,
}

-- and finally, return the configuration to wezterm
return config
