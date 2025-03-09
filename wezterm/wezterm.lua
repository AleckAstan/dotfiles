local wezterm = require("wezterm")
local config = wezterm.config_builder()

---Colorscheme
config.color_scheme = "Ayu Light"

--- Font settings
config.font_size = 19
config.line_height = 1.2
config.font = wezterm.font("Maple Mono NF")

--- Colors
config.colors = {
	cursor_bg = "red",
	cursor_border = "red",
}

---Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 0,
	right = 0,
	top = 0,
	bottom = 0,
}
-- config.window_background_image = constants.bg_image
config.background = {
	{
		source = {
			File = wezterm.config_dir .. "/assets/bg.jpg",
		},
	},
	{
		source = {
			Color = "rgba(26, 27, 38, 0.90)",
		},
		height = "100%",
		width = "100%",
	},
}
config.macos_window_background_blur = 60

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true
return config
