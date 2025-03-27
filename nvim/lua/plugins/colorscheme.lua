return {
	"sainnhe/edge",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.edge_enable_italic = true
		vim.g.edge_cursor = "purple"
		vim.g.edge_transparent_background = true
		vim.g.edge_style = "aura"
		vim.g.edge_diagnostic_text_highlight = true
		vim.cmd.colorscheme("edge")
	end,
}
-- return {
-- 	"folke/tokyonight.nvim",
-- 	lazy = false,
-- 	opts = {},
-- 	priority = 1000,
-- 	config = function()
-- 		require("tokyonight").setup({
-- 			style = "night",
-- 			transparent = true,
-- 			terminal_colors = true,
-- 			styles = {
-- 				comments = { italic = true },
-- 				keywords = { italic = true },
-- 				functions = { italic = true },
-- 				variables = { italic = true },
-- 				sidebars = "transparent", -- style for sidebars, see below
-- 				floats = "transparent", -- style for floating windows
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("tokyonight")
-- 	end,
-- }
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000, -- Ensure it loads first
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
-- 			transparent_background = true,
-- 			term_colors = true,
-- 			comments = { "italic" }, -- Change the style of comments
-- 			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
-- 				conditionals = { "italic" },
-- 				loops = { "italic" },
-- 				functions = {},
-- 				keywords = { "italic" },
-- 				strings = {},
-- 				variables = {},
-- 				numbers = {},
-- 				booleans = { "italic" },
-- 				properties = {},
-- 				types = {},
-- 				operators = {},
-- 				-- miscs = {}, -- Uncomment to turn off hard-coded styles
-- 			},
-- 			integrations = {
-- 				treesitter = true,
-- 				native_lsp = { enabled = true },
-- 				cmp = true,
-- 				gitsigns = true,
-- 				telescope = true,
-- 				nvimtree = true,
-- 				indent_blankline = { enabled = true },
-- 				mini = {
-- 					enabled = true,
-- 					indentscope_color = "",
-- 				},
-- 			},
-- 		})
-- 		vim.cmd("colorscheme catppuccin")
-- 	end,
-- }
