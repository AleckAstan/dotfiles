return {
	"sainnhe/edge",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.edge_enable_italic = true
		vim.g.edge_transparent_background = true
		vim.g.edge_style = "neon"
		vim.g.edge_diagnostic_text_highlight = true
		vim.cmd.colorscheme("edge")
	end,
}
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
--
-- return {
-- 	"catppuccin/nvim",
-- 	name = "catppuccin",
-- 	priority = 1000,
-- 	config = function()
-- 		require("catppuccin").setup({
-- 			flavour = "auto", -- latte, frappe, macchiato, mocha
-- 			background = { -- :h background
-- 				light = "latte",
-- 				dark = "macchiato",
-- 			},
-- 			transparent_background = true, -- disables setting the background color.
-- 			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
-- 			term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
-- 			dim_inactive = {
-- 				enabled = false, -- dims the background color of inactive window
-- 				shade = "dark",
-- 				percentage = 0.15, -- percentage of the shade to apply to the inactive window
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
-- 			color_overrides = {},
-- 			custom_highlights = {},
-- 			default_integrations = true,
-- 			integrations = {
-- 				cmp = true,
-- 				gitsigns = true,
-- 				nvimtree = true,
-- 				treesitter = true,
-- 				notify = false,
-- 				fzf = true,
-- 				mini = {
-- 					enabled = true,
-- 					indentscope_color = "",
-- 				},
-- 			},
-- 		})
--
-- 		vim.cmd.colorscheme("catppuccin")
-- 	end,
-- }
