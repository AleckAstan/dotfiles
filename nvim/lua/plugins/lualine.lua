if true then
	return {}
end
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = function(_, opts)
		opts.options = {
			section_separators = { left = "", right = "" },
			component_separators = { left = "", right = "" },
			theme = "catppuccin",
		}
		opts.sections = opts.sections
			or {
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			}

		opts.sections.lualine_a = {
			{
				function()
					return ""
				end,
				padding = { left = 1, right = 0 },
				separator = "",
			},
			"mode",
		}
		opts.sections.lualine_b = {
			"branch",
		}
		opts.sections.lualine_c = {
			{ "filename", file_status = false, path = 1 },
			{
				"diagnostics",
				sources = { "nvim_diagnostic" },
				symbols = { error = " ", warn = " ", info = " " },
				-- diagnostics_color = {
				-- 	error = { fg = colors.red },
				-- 	warn = { fg = colors.yellow },
				-- 	info = { fg = colors.cyan },
				-- },
			},
		}
		opts.sections.lualine_y = { "progress" }
		opts.sections.lualine_z = {
			{ "location", separator = "" },
			{
				function()
					return ""
				end,
				padding = { left = 0, right = 1 },
			},
		}
		return opts
	end,
}
