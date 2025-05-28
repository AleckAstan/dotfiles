-- return {
-- 	"ellisonleao/gruvbox.nvim",
-- 	priority = 1000,
-- 	config = true,
-- 	config = function()
-- 		-- Default options:
-- 		require("gruvbox").setup({
-- 			terminal_colors = true, -- add neovim terminal colors
-- 			undercurl = true,
-- 			underline = true,
-- 			bold = true,
-- 			italic = {
-- 				strings = true,
-- 				emphasis = true,
-- 				comments = true,
-- 				operators = false,
-- 				folds = true,
-- 			},
-- 			strikethrough = true,
-- 			invert_selection = false,
-- 			invert_signs = false,
-- 			invert_tabline = false,
-- 			inverse = true, -- invert background for search, diffs, statuslines and errors
-- 			contrast = "soft", -- can be "hard", "soft" or empty string
-- 			dim_inactive = false,
-- 			transparent_mode = true,
-- 		})
-- 		vim.cmd("colorscheme gruvbox")
-- 	end,
-- }
-- return {
-- 	"sainnhe/edge",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.edge_enable_italic = true
-- 		vim.g.edge_transparent_background = true
-- 		vim.g.edge_style = "aura"
-- 		vim.g.edge_diagnostic_text_highlight = true
-- 		vim.cmd.colorscheme("edge")
-- 	end,
-- }

-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	priority = 1000,
-- 	opts = {},
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "moon",
-- 			light_style = "day",
-- 			transparent = true,
-- 			terminal_colors = true,
-- 			styles = {
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = {},
-- 				variables = { italic = true },
-- 				sidebars = "transparent",
-- 				floats = "transparent",
-- 			},
-- 			hide_inactive_statusline = false,
-- 			dim_inactive = false,
-- 			lualine_bold = false,
-- 		})
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }
-- return {
-- 	"sainnhe/everforest",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.everforest_enable_italic = true
-- 		vim.g.everforest_transparent_background = true
-- 		vim.g.everforest_background = "hard"
-- 		vim.g.everforest_diagnostic_text_highlight = true
-- 		vim.cmd.colorscheme("everforest")
-- 	end,
-- }
-- return {
-- 	"rose-pine/neovim",
-- 	name = "rose-pine",
-- 	config = function()
-- 		require("rose-pine").setup({
-- 			variant = "auto", -- auto, main, moon, or dawn
-- 			dark_variant = "moon", -- main, moon, or dawn
-- 			dim_inactive_windows = false,
-- 			extend_background_behind_borders = true,
-- 			enable = {
-- 				terminal = true,
-- 				legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
-- 				migrations = true, -- Handle deprecated options automatically
-- 			},
--
-- 			styles = {
-- 				bold = true,
-- 				italic = true,
-- 				transparency = true,
-- 			},
--
-- 			groups = {
-- 				border = "muted",
-- 				link = "iris",
-- 				panel = "surface",
--
-- 				error = "love",
-- 				hint = "iris",
-- 				info = "foam",
-- 				note = "pine",
-- 				todo = "rose",
-- 				warn = "gold",
--
-- 				git_add = "foam",
-- 				git_change = "rose",
-- 				git_delete = "love",
-- 				git_dirty = "rose",
-- 				git_ignore = "muted",
-- 				git_merge = "iris",
-- 				git_rename = "pine",
-- 				git_stage = "iris",
-- 				git_text = "rose",
-- 				git_untracked = "subtle",
--
-- 				h1 = "iris",
-- 				h2 = "foam",
-- 				h3 = "rose",
-- 				h4 = "gold",
-- 				h5 = "pine",
-- 				h6 = "foam",
-- 			},
--
-- 			palette = {
-- 				-- Override the builtin palette per variant
-- 				-- moon = {
-- 				--     base = '#18191a',
-- 				--     overlay = '#363738',
-- 				-- },
-- 			},
--
-- 			-- NOTE: Highlight groups are extended (merged) by default. Disable this
-- 			-- per group via `inherit = false`
-- 			highlight_groups = {
-- 				-- Comment = { fg = "foam" },
-- 				-- StatusLine = { fg = "love", bg = "love", blend = 15 },
-- 				-- VertSplit = { fg = "muted", bg = "muted" },
-- 				-- Visual = { fg = "base", bg = "text", inherit = false },
-- 			},
--
-- 			before_highlight = function(group, highlight, palette)
-- 				-- Disable all undercurls
-- 				-- if highlight.undercurl then
-- 				--     highlight.undercurl = false
-- 				-- end
-- 				--
-- 				-- Change palette colour
-- 				-- if highlight.fg == palette.pine then
-- 				--     highlight.fg = palette.foam
-- 				-- end
-- 			end,
-- 		})
--
-- 		-- vim.cmd("colorscheme rose-pine-main")
-- 		-- vim.cmd("colorscheme rose-pine-moon")
-- 		-- vim.cmd("colorscheme rose-pine-dawn")
-- 		vim.cmd("colorscheme rose-pine")
-- 	end,
-- }
-- return {
-- 	"Shatur/neovim-ayu",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("ayu").setup({
-- 			overrides = {
-- 				Normal = { bg = "None" },
-- 				NormalFloat = { bg = "none" },
-- 				ColorColumn = { bg = "None" },
-- 				SignColumn = { bg = "None" },
-- 				Folded = { bg = "None" },
-- 				FoldColumn = { bg = "None" },
-- 				CursorLine = { bg = "None" },
-- 				CursorColumn = { bg = "None" },
-- 				VertSplit = { bg = "None" },
-- 			},
-- 		})
-- 		vim.g.ayucolor = "dark"
-- 		vim.cmd.colorscheme("ayu")
-- 	end,
-- }
--
return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto", -- latte, frappe, macchiato, mocha
			background = { -- :h background
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "dark",
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {},
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "italic" },
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {
				macchiato = {
					rosewater = "#F5B8AB",
					flamingo = "#F29D9D",
					pink = "#AD6FF7",
					mauve = "#FF8F40",
					red = "#E66767",
					maroon = "#EB788B",
					peach = "#FAB770",
					yellow = "#FACA64",
					green = "#70CF67",
					teal = "#4CD4BD",
					sky = "#61BDFF",
					sapphire = "#4BA8FA",
					blue = "#00BFFF",
					lavender = "#00BBCC",
					text = "#C1C9E6",
					subtext1 = "#A3AAC2",
					subtext0 = "#8E94AB",
					overlay2 = "#7D8296",
					overlay1 = "#676B80",
					overlay0 = "#464957",
					surface2 = "#3A3D4A",
					surface1 = "#2F313D",
					surface0 = "#1D1E29",
					base = "#0b0b12",
					mantle = "#11111a",
					crust = "#191926",
				},
			},
			highlight_overrides = {
				all = function(colors)
					return {
						CurSearch = { bg = colors.sky },
						IncSearch = { bg = colors.sky },
						CursorLineNr = { fg = colors.blue, style = { "bold" } },
						DashboardFooter = { fg = colors.overlay0 },
						TreesitterContextBottom = { style = {} },
						WinSeparator = { fg = colors.overlay0, style = { "bold" } },
						["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
						["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
						Headline = { style = { "bold" } },
						Headline1 = { fg = colors.blue, style = { "bold" } },
						Headline2 = { fg = colors.pink, style = { "bold" } },
						Headline3 = { fg = colors.lavender, style = { "bold" } },
						Headline4 = { fg = colors.green, style = { "bold" } },
						Headline5 = { fg = colors.peach, style = { "bold" } },
						Headline6 = { fg = colors.flamingo, style = { "bold" } },
						rainbow1 = { fg = colors.blue, style = { "bold" } },
						rainbow2 = { fg = colors.pink, style = { "bold" } },
						rainbow3 = { fg = colors.lavender, style = { "bold" } },
						rainbow4 = { fg = colors.green, style = { "bold" } },
						rainbow5 = { fg = colors.peach, style = { "bold" } },
						rainbow6 = { fg = colors.flamingo, style = { "bold" } },
					}
				end,
			},
			custom_highlights = function(C)
				return {
					CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
					CmpItemKindKeyword = { fg = C.base, bg = C.red },
					CmpItemKindText = { fg = C.base, bg = C.teal },
					CmpItemKindMethod = { fg = C.base, bg = C.blue },
					CmpItemKindConstructor = { fg = C.base, bg = C.blue },
					CmpItemKindFunction = { fg = C.base, bg = C.blue },
					CmpItemKindFolder = { fg = C.base, bg = C.blue },
					CmpItemKindModule = { fg = C.base, bg = C.blue },
					CmpItemKindConstant = { fg = C.base, bg = C.peach },
					CmpItemKindField = { fg = C.base, bg = C.green },
					CmpItemKindProperty = { fg = C.base, bg = C.green },
					CmpItemKindEnum = { fg = C.base, bg = C.green },
					CmpItemKindUnit = { fg = C.base, bg = C.green },
					CmpItemKindClass = { fg = C.base, bg = C.yellow },
					CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
					CmpItemKindFile = { fg = C.base, bg = C.blue },
					CmpItemKindInterface = { fg = C.base, bg = C.yellow },
					CmpItemKindColor = { fg = C.base, bg = C.red },
					CmpItemKindReference = { fg = C.base, bg = C.red },
					CmpItemKindEnumMember = { fg = C.base, bg = C.red },
					CmpItemKindStruct = { fg = C.base, bg = C.blue },
					CmpItemKindValue = { fg = C.base, bg = C.peach },
					CmpItemKindEvent = { fg = C.base, bg = C.blue },
					CmpItemKindOperator = { fg = C.base, bg = C.blue },
					CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
					CmpItemKindCopilot = { fg = C.base, bg = C.teal },
				}
			end,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				fzf = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
