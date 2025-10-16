-- Catppuccin "borderless" Telescope style (NvChad-like)
local colors = {
	black = "#1e1e2e",
	black2 = "#181825",
	darker_black = "#11111b",
	one_bg = "#313244",
	red = "#f38ba8",
	blue = "#89b4fa",
	green = "#a6e3a1",
	white = "#cdd6f4",
}

-- Highlight groups
local telescope_hlgroups = {
	-- General background
	TelescopeNormal = { bg = colors.darker_black },
	TelescopeSelection = { bg = colors.one_bg, fg = colors.white },
	TelescopeMatching = { fg = colors.blue, bold = true },

	-- Prompt
	TelescopePromptNormal = { fg = colors.white, bg = colors.black2 },
	TelescopePromptBorder = { fg = colors.black2, bg = colors.black2 },
	TelescopePromptPrefix = { fg = colors.red, bg = colors.black2 },

	-- Results
	TelescopeResultsBorder = { fg = colors.darker_black, bg = colors.darker_black },
	TelescopeResultsNormal = { bg = colors.darker_black },

	-- Preview
	TelescopePreviewBorder = { fg = colors.darker_black, bg = colors.darker_black },
	TelescopePreviewNormal = { bg = colors.darker_black },

	-- ✅ Titles (fix)
	TelescopeResultsTitle = { fg = colors.black, bg = colors.green, bold = true },
	TelescopePreviewTitle = { fg = colors.black, bg = colors.blue, bold = true },
	TelescopePromptTitle = { fg = colors.black, bg = colors.red, bold = true },
}

for group, opts in pairs(telescope_hlgroups) do
	vim.api.nvim_set_hl(0, group, opts)
end

require("telescope").setup({
	defaults = {
		prompt_prefix = "   ",
		selection_caret = " ",
		entry_prefix = "  ",
		sorting_strategy = "ascending",
		layout_strategy = "flex",
		layout_config = {
			prompt_position = "top",
			horizontal = {
				mirror = false,
				preview_cutoff = 100,
				preview_width = 0.5,
			},
			flex = {
				flip_columns = 200,
			},
			height = 0.95,
			width = 0.95,
		},
		preview_cutoff = 1,
		borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
		winblend = 0,
		color_devicons = true,
	},
})
