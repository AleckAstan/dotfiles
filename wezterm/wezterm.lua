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
        -- return "Ef-Deuteranopia-Dark"
        return "tokyonight"
    else
        return "Edge Light (base16)"
    end
end

---Colorscheme
config.color_scheme = scheme_for_appearance(get_appearance())
config.font = wezterm.font("MonoLisa", { weight = "Medium" })
config.font_size = 25
config.harfbuzz_features = { "ss02", "zero", "ss08", "ss07", "ss09" }
config.colors = {
    cursor_bg = "lightgreen",
    cursor_border = "green",
}

---Appearance
config.window_decorations = "RESIZE"
config.window_background_opacity = 1
config.hide_tab_bar_if_only_one_tab = true
config.window_padding = {
    left = 25,
    right = 15,
    top = 0,
    bottom = 0,
}
config.macos_window_background_blur = 80

-- Miscellaneous settings
config.max_fps = 120
config.prefer_egl = true

config.front_end = "WebGpu"

config.scrollback_lines = 5000

config.check_for_updates = false

config.enable_wayland = false
return config
