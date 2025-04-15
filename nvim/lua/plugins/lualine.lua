return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("lualine").setup({
			options = {
				icons_enabled = true,
				-- theme = "ayu",
				component_separators = { left = "", right = "" },
				section_separators = { left = "", right = "" },
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				},
			},
			sections = {
				lualine_a = { "mode" },
				lualine_b = { "branch", "diff" },
				lualine_c = {},
				lualine_x = {},
				lualine_y = {},
				lualine_z = {},
			},
			inactive_sections = {},
			inactive_winbar = {},
			extensions = {
				"quickfix",
			},
			tabline = {},
			winbar = {
				lualine_c = {
					{
						"filename",
						path = 1,
					},
					"diagnostics",
				},
			},
		})
		vim.api.nvim_set_hl(0, "LualineCNormal", { bg = "none" })
	end,
}
