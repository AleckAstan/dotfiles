local wezterm = require("wezterm")
local config = wezterm.config_builder()
---Colorscheme
config.color_scheme = "Atom One Dark"

--- Font settings
config.font_size = 23
config.harfbuzz_features = { "calt", "liga", "clig", "dlig" }
config.line_height = 1
-- config.font = wezterm.font("Maple Mono NF", { weight = 500 })
config.font = wezterm.font("Cascadia Code NF")
config.font_rules = {
	{
		intensity = "Normal",
		italic = false,
		font = wezterm.font({
			family = "Cascadia Code NF",
			italic = false,
			weight = 400,
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "Victor Mono",
			italic = true,
			weight = 600,
		}),
	},
}

--- Colors
config.colors = {
	cursor_bg = "red",
	cursor_border = "red",
}

---Appearance
config.window_decorations = "RESIZE"
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 25,
	right = 15,
	top = 15,
	bottom = 0,
}
-- config.window_background_image = constants.bg_image
config.background = {
	-- {
	-- 	source = {
	-- 		File = wezterm.config_dir .. "/assets/bg.jpg",
	-- 	},
	-- },
	{
		source = {
			Color = "rgba(10, 14, 20, 0.4)",
			-- Color = "#0A0E14",
		},
		height = "100%",
		width = "100%",
	},
}
config.macos_window_background_blur = 100

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true
return config
