-- return {
-- 	"nvim-lualine/lualine.nvim",
-- 	dependencies = { "nvim-lua/plenary.nvim" },
-- 	opts = function(_, opts)
-- 		opts.options = {
-- 			section_separators = { left = "", right = "" },
-- 			component_separators = { left = "", right = "" },
-- 			theme = "catppuccin",
-- 		}
-- 		opts.sections = opts.sections
-- 			or {
-- 				lualine_a = {},
-- 				lualine_b = {},
-- 				lualine_y = {},
-- 				lualine_z = {},
-- 				lualine_c = {},
-- 				lualine_x = {},
-- 			}
--
-- 		opts.sections.lualine_a = {
-- 			{
-- 				function()
-- 					return ""
-- 				end,
-- 				padding = { left = 1, right = 0 },
-- 				separator = "",
-- 			},
-- 			"mode",
-- 		}
-- 		opts.sections.lualine_b = {
-- 			"branch",
-- 		}
-- 		opts.sections.lualine_c = {}
-- 		opts.sections.lualine_y = { "progress" }
-- 		opts.sections.lualine_z = {
-- 			{ "location", separator = "" },
-- 		}
-- 		opts.winbar = {
-- 			lualine_a = {},
-- 			lualine_b = {},
-- 			lualine_c = {
-- 				{ "filename", file_status = true, path = 1 },
-- 				{
-- 					"diagnostics",
-- 					sources = { "nvim_diagnostic" },
-- 					symbols = { error = " ", warn = " ", info = " " },
-- 				},
-- 			},
-- 			lualine_x = {},
-- 			lualine_y = {},
-- 			lualine_z = {},
-- 		}
--
-- 		opts.inactive_winbar = {
-- 			lualine_a = {},
-- 			lualine_b = {},
-- 			lualine_c = {
-- 				{ "filename", file_status = true, path = 1, color = { bg = "none" } },
-- 				{
-- 					"diagnostics",
-- 					sources = { "nvim_diagnostic" },
-- 					symbols = { error = " ", warn = " ", info = " " },
-- 				},
-- 			},
-- 			lualine_x = {},
-- 			lualine_y = {},
-- 			lualine_z = {},
-- 		}
-- 		vim.api.nvim_set_hl(0, "LualineCNormal", { bg = "none" })
-- 		return opts
-- 	end,
-- }
--
--
--
return {
	"nvim-lualine/lualine.nvim",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local lualine = require("lualine")

		local colors = {
			bg = "none",
			fg = "#bbc2cf",
			yellow = "#ECBE7B",
			cyan = "#008080",
			darkblue = "#081633",
			green = "#98be65",
			orange = "#FF8800",
			violet = "#a9a1e1",
			magenta = "#c678dd",
			blue = "#51afef",
			red = "#ec5f67",
		}

		local mode_color = {
			n = colors.red,
			i = colors.green,
			v = colors.blue,
			[""] = colors.blue,
			V = colors.blue,
			c = colors.magenta,
			no = colors.red,
			s = colors.orange,
			S = colors.orange,
			[""] = colors.orange,
			ic = colors.yellow,
			R = colors.violet,
			Rv = colors.violet,
			cv = colors.red,
			ce = colors.red,
			r = colors.cyan,
			rm = colors.cyan,
			["r?"] = colors.cyan,
			["!"] = colors.red,
			t = colors.red,
		}
		local conditions = {
			buffer_not_empty = function()
				return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
			end,
			hide_in_width = function()
				return vim.fn.winwidth(0) > 80
			end,
			check_git_workspace = function()
				local filepath = vim.fn.expand("%:p:h")
				local gitdir = vim.fn.finddir(".git", filepath .. ";")
				return gitdir and #gitdir > 0 and #gitdir < #filepath
			end,
		}

		-- Config
		local config = {
			options = {
				-- Disable sections and component separators
				component_separators = "",
				section_separators = "",
				theme = {
					-- We are going to use lualine_c an lualine_x as left and
					-- right section. Both are highlighted by c theme .  So we
					-- are just setting default looks o statusline
					normal = { c = { fg = colors.fg, bg = colors.bg } },
					inactive = { c = { fg = colors.fg, bg = colors.bg } },
				},
			},

			winbar = {
				-- these are to remove the defaults
				lualine_a = { { "filename", file_status = true, path = 1 } },
				lualine_b = {
					{
						"diagnostics",
						cond = conditions.buffer_not_empty,
						color = { fg = colors.magenta, gui = "bold" },
					},
				},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				-- These will be filled later
				lualine_c = {},
				lualine_x = {},
			},
			inactive_sections = {
				-- these are to remove the defaults
				lualine_a = {},
				lualine_b = {},
				lualine_y = {},
				lualine_z = {},
				lualine_c = {},
				lualine_x = {},
			},
		}

		-- Inserts a component in lualine_c at left section
		local function ins_left(component)
			table.insert(config.sections.lualine_c, component)
		end

		-- Inserts a component in lualine_x at right section
		local function ins_right(component)
			table.insert(config.sections.lualine_x, component)
		end

		ins_left({
			-- mode component
			function()
				return ""
			end,
			padding = { left = 1, right = 0 },
			separator = "",
			color = function()
				return { fg = mode_color[vim.fn.mode()] }
			end,
		})

		ins_left({
			"mode",
			color = function()
				return { fg = mode_color[vim.fn.mode()] }
			end,
		})

		ins_left({
			"branch",
			icon = "",
			color = { fg = colors.violet, gui = "bold" },
		})

		ins_left({
			function()
				return "%="
			end,
		})

		ins_right({
			"diff",
			-- Is it me or the symbol for modified us really weird
			symbols = { added = " ", modified = "󰝤 ", removed = " " },
			diff_color = {
				added = { fg = colors.green },
				modified = { fg = colors.orange },
				removed = { fg = colors.red },
			},
			cond = conditions.hide_in_width,
		})
		ins_right({ "location" })
		ins_right({ "progress", color = { fg = colors.fg, gui = "bold" } })
		lualine.setup(config)
		vim.api.nvim_set_hl(0, "LualineCNormal", { bg = "none" })
	end,
}
