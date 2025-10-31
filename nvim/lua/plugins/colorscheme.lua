-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "auto",
-- 			background = {
-- 				light = "latte",
-- 				dark = "mocha",
-- 			},
-- 			transparent_background = true, -- disables setting the background color.
-- 			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
-- 			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 			dim_inactive = {
-- 				enabled = false, -- dims the background color of inactive window
-- 				shade = "transparent", -- sets the shade of the inactive window
-- 				percentage = 0.50, -- percentage of the shade to apply to the inactive window
-- 			},
-- 			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 				comments = { "italic" }, -- Change the style of comments
-- 				conditionals = {},
-- 				loops = {},
-- 				functions = {},
-- 				keywords = { "italic" },
-- 				strings = {},
-- 				variables = {},
-- 				numbers = {},
-- 				booleans = {},
-- 				properties = {},
-- 				types = { "italic" },
-- 				operators = {},
-- 				-- miscs = {}, -- Uncomment to turn off hard-coded styles
-- 			},
-- 			color_overrides = {
-- 				mocha = {
-- 					rosewater = "#F5B8AB",
-- 					flamingo = "#F29D9D",
-- 					pink = "#AD6FF7",
-- 					mauve = "#FF8F40",
-- 					red = "#E66767",
-- 					maroon = "#EB788B",
-- 					peach = "#FAB770",
-- 					yellow = "#FACA64",
-- 					green = "#70CF67",
-- 					teal = "#4CD4BD",
-- 					sky = "#61BDFF",
-- 					sapphire = "#4BA8FA",
-- 					blue = "#00BFFF",
-- 					lavender = "#00BBCC",
-- 					text = "#C1C9E6",
-- 					subtext1 = "#A3AAC2",
-- 					subtext0 = "#8E94AB",
-- 					overlay2 = "#7D8296",
-- 					overlay1 = "#676B80",
-- 					overlay0 = "#464957",
-- 					surface2 = "#3A3D4A",
-- 					surface1 = "#2F313D",
-- 					surface0 = "#1D1E29",
-- 					base = "#0b0b12",
-- 					mantle = "#11111a",
-- 					crust = "#191926",
-- 				},
-- 				latte = {
-- 					rosewater = "#DC6A60",
-- 					flamingo = "#E55A63",
-- 					pink = "#9B5DE5",
-- 					mauve = "#FF7B00",
-- 					red = "#D43C3C",
-- 					maroon = "#CC4C5D",
-- 					peach = "#F5973C",
-- 					yellow = "#E9AE30",
-- 					green = "#4CAF50",
-- 					teal = "#2FC9A3",
-- 					sky = "#38A7FF",
-- 					sapphire = "#2E90F2",
-- 					blue = "#008CE3",
-- 					lavender = "#009BB8",
--
-- 					text = "#2B2D3A",
-- 					subtext1 = "#515561",
-- 					subtext0 = "#6D707A",
-- 					overlay2 = "#858892",
-- 					overlay1 = "#A3A6B1",
-- 					overlay0 = "#BFC2CD",
--
-- 					surface2 = "#EAEAEA",
-- 					surface1 = "#F2F2F5",
-- 					surface0 = "#FAFAFD",
-- 					base = "#FFFFFF",
-- 					mantle = "#F5F6FA",
-- 					crust = "#E6E8F0",
-- 				},
-- 			},
-- 			highlight_overrides = {
-- 				all = function(colors)
-- 					return {
-- 						CurSearch = { bg = colors.sky },
-- 						IncSearch = { bg = colors.sky },
-- 						CursorLineNr = { fg = colors.blue, style = { "bold" } },
-- 						DashboardFooter = { fg = colors.overlay0 },
-- 						TreesitterContextBottom = { style = {} },
-- 						WinSeparator = { fg = colors.overlay0, style = { "bold" } },
-- 						["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
-- 						["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
-- 						Headline = { style = { "bold" } },
-- 						Headline1 = { fg = colors.blue, style = { "bold" } },
-- 						Headline2 = { fg = colors.pink, style = { "bold" } },
-- 						Headline3 = { fg = colors.lavender, style = { "bold" } },
-- 						Headline4 = { fg = colors.green, style = { "bold" } },
-- 						Headline5 = { fg = colors.peach, style = { "bold" } },
-- 						Headline6 = { fg = colors.flamingo, style = { "bold" } },
-- 						rainbow1 = { fg = colors.blue, style = { "bold" } },
-- 						rainbow2 = { fg = colors.pink, style = { "bold" } },
-- 						rainbow3 = { fg = colors.lavender, style = { "bold" } },
-- 						rainbow4 = { fg = colors.green, style = { "bold" } },
-- 						rainbow5 = { fg = colors.peach, style = { "bold" } },
-- 						rainbow6 = { fg = colors.flamingo, style = { "bold" } },
-- 					}
-- 				end,
-- 			},
-- 			custom_highlights = function(C)
-- 				return {
-- 					CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
-- 					CmpItemKindKeyword = { fg = C.base, bg = C.red },
-- 					CmpItemKindText = { fg = C.base, bg = C.teal },
-- 					CmpItemKindMethod = { fg = C.base, bg = C.blue },
-- 					CmpItemKindConstructor = { fg = C.base, bg = C.blue },
-- 					CmpItemKindFunction = { fg = C.base, bg = C.blue },
-- 					CmpItemKindFolder = { fg = C.base, bg = C.blue },
-- 					CmpItemKindModule = { fg = C.base, bg = C.blue },
-- 					CmpItemKindConstant = { fg = C.base, bg = C.peach },
-- 					CmpItemKindField = { fg = C.base, bg = C.green },
-- 					CmpItemKindProperty = { fg = C.base, bg = C.green },
-- 					CmpItemKindEnum = { fg = C.base, bg = C.green },
-- 					CmpItemKindUnit = { fg = C.base, bg = C.green },
-- 					CmpItemKindClass = { fg = C.base, bg = C.yellow },
-- 					CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
-- 					CmpItemKindFile = { fg = C.base, bg = C.blue },
-- 					CmpItemKindInterface = { fg = C.base, bg = C.yellow },
-- 					CmpItemKindColor = { fg = C.base, bg = C.red },
-- 					CmpItemKindReference = { fg = C.base, bg = C.red },
-- 					CmpItemKindEnumMember = { fg = C.base, bg = C.red },
-- 					CmpItemKindStruct = { fg = C.base, bg = C.blue },
-- 					CmpItemKindValue = { fg = C.base, bg = C.peach },
-- 					CmpItemKindEvent = { fg = C.base, bg = C.blue },
-- 					CmpItemKindOperator = { fg = C.base, bg = C.blue },
-- 					CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
-- 					CmpItemKindCopilot = { fg = C.base, bg = C.teal },
-- 				}
-- 			end,
-- 			default_integrations = true,
-- 			integrations = {
-- 				fzf = { enabled = true, border = false },
-- 				cmp = { enabled = true, border = false },
-- 				gitsigns = true,
-- 				nvimtree = true,
-- 				treesitter = true,
-- 				notify = false,
-- 				mini = {
-- 					enabled = true,
-- 					indentscope_color = "",
-- 				},
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("catppuccin")
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
-- 	"sainnhe/edge",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.edge_better_performance = true
-- 		vim.g.edge_style = "aura"
-- 		vim.g.edge_enable_italic = true
-- 		vim.g.edge_transparent_background = 2
-- 		vim.g.edge_float_style = "none"
-- 		vim.cmd.colorscheme("edge")
-- 	end,
-- }
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	config = function()
		require("tokyonight").setup({
			style = "night",
			light_style = "day",
			transparent = true,
			terminal_colors = true,
			styles = {
				comments = { italic = true },
				keywords = { italic = true },
				functions = {},
				variables = {},
				sidebars = "transparent",
				floats = "transparent",
			},
		})

		vim.cmd.colorscheme("tokyonight")
	end,
}
