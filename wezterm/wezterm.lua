local wezterm = require("wezterm")
local config = wezterm.config_builder()

local function get_appearance()
	if wezterm.gui then
		return wezterm.gui.get_appearance()
	end
	return "Dark"
end

local function scheme_for_appearance(appearance)
	if appearance:find("Dark") then
		-- return "Ayu Dark (Gogh)"
		return "Everforest Dark Hard (Gogh)"
	else
		return "Everforest Light Hard (Gogh)"
		-- return "Ayu Light (Gogh)"
	end
end

---Colorscheme
config.color_scheme = scheme_for_appearance(get_appearance())

--- Font settings
config.font_size = 25
config.harfbuzz_features = { "calt", "liga", "clig", "dlig" }
config.line_height = 0.9
config.font_rules = {
	{
		intensity = "Normal",
		italic = false,
		font = wezterm.font({
			italic = false,
			family = "Cascadia Code NF",
			weight = 500,
		}),
	},
	{
		intensity = "Normal",
		italic = true,
		font = wezterm.font({
			family = "Cascadia Code NF",
			-- family = "Victor Mono",
			italic = true,
			weight = 500,
		}),
	},
}

--- Colors
config.colors = {
	cursor_bg = "red",
	cursor_border = "green",
}

---Appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.8
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
	left = 25,
	right = 15,
	top = 15,
	bottom = 0,
}
config.macos_window_background_blur = 80

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true
return config
