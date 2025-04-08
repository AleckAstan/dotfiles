if true then
	return {}
end
return {
	"feline-nvim/feline.nvim",
	config = function()
		local line_ok, feline = pcall(require, "feline")
		if not line_ok then
			return
		end
		local one_monokai = {
			fg = "#abb2bf",
			bg = "none",
			green = "#98c379",
			yellow = "#e5c07b",
			purple = "#c678dd",
			orange = "#d19a66",
			peanut = "#f6d5a4",
			red = "#e06c75",
			aqua = "#61afef",
			darkblue = "#282c34",
			dark_red = "#f75f5f",
		}

		local vi_mode_colors = {
			NORMAL = "green",
			OP = "green",
			INSERT = "yellow",
			VISUAL = "purple",
			LINES = "orange",
			BLOCK = "dark_red",
			REPLACE = "red",
			COMMAND = "aqua",
		}

		local c = {
			vim_mode = {
				provider = {
					name = "vi_mode",
					opts = {
						show_mode_name = true,
					},
				},
				hl = function()
					return {
						fg = require("feline.providers.vi_mode").get_mode_color(),
						name = "NeovimModeHLColor",
					}
				end,
				right_sep = " ",
			},
			gitBranch = {
				provider = "git_branch",
				left_sep = "",
				right_sep = "",
				hl = {
					fg = "peanut",
				},
			},
			gitDiffAdded = {
				provider = "git_diff_added",
				hl = {
					fg = "green",
				},
				left_sep = "",
				right_sep = "",
			},
			gitDiffRemoved = {
				provider = "git_diff_removed",
				hl = {
					fg = "red",
				},
				left_sep = " ",
				right_sep = " ",
			},
			gitDiffChanged = {
				provider = "git_diff_changed",
				hl = {
					fg = "fg",
				},
				left_sep = "",
				right_sep = "",
			},
			separator = {
				provider = "",
			},
			fileinfo = {
				provider = {
					name = "file_info",
					-- opts = {
					-- 	type = "relative",
					-- },
				},
				left_sep = " ",
				right_sep = " ",
			},
			diagnostic_errors = {
				provider = "diagnostic_errors",
				hl = {
					fg = "red",
				},
			},
			diagnostic_warnings = {
				provider = "diagnostic_warnings",
				hl = {
					fg = "yellow",
				},
			},
			diagnostic_hints = {
				provider = "diagnostic_hints",
				hl = {
					fg = "aqua",
				},
			},
			diagnostic_info = {
				provider = "diagnostic_info",
			},
			lsp_client_names = {
				provider = "lsp_client_names",
				hl = {
					fg = "purple",
				},
				left_sep = " ",
				right_sep = " ",
			},
			file_type = {
				provider = {
					name = "file_type",
					opts = {
						filetype_icon = true,
						case = "titlecase",
					},
				},
				hl = {
					fg = "red",
				},
				left_sep = " ",
				right_sep = " ",
			},
			file_encoding = {
				provider = "file_encoding",
				hl = {
					fg = "orange",
					style = "italic",
				},
				left_sep = " ",
				right_sep = " ",
			},
			position = {
				provider = "position",
				hl = {
					fg = "green",
				},
				left_sep = " ",
				right_sep = " ",
			},
			line_percentage = {
				provider = "line_percentage",
				hl = {
					fg = "aqua",
				},
				left_sep = " ",
				right_sep = " ",
			},
			scroll_bar = {
				provider = "scroll_bar",
				hl = {
					fg = "yellow",
				},
			},
		}
		local left = {
			c.vim_mode,
			c.gitBranch,
			c.gitDiffAdded,
			c.gitDiffRemoved,
			c.gitDiffChanged,
			c.separator,
			c.fileinfo,
			c.diagnostic_errors,
			c.diagnostic_warnings,
			c.diagnostic_info,
			c.diagnostic_hints,
			-- c.lsp_client_names,
		}
		local components = {
			active = {
				left,
			},
			inactive = {
				left,
			},
		}

		feline.setup({
			components = components,
			theme = one_monokai,
			vi_mode_colors = vi_mode_colors,
		})
	end,
}
