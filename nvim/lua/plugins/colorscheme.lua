return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000, -- Ensure it loads first
	config = function()
		require("catppuccin").setup({
			flavour = "mocha", -- Options: latte, frappe, macchiato, mocha
			-- transparent_background = true,
			term_colors = true,
			comments = { "italic" }, -- Change the style of comments
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				conditionals = { "italic" },
				loops = { "italic" },
				functions = {},
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = { "italic" },
				properties = {},
				types = {},
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			integrations = {
				treesitter = true,
				native_lsp = { enabled = true },
				cmp = true,
				gitsigns = true,
				telescope = true,
				nvimtree = true,
				indent_blankline = { enabled = true },
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})
		vim.cmd("colorscheme catppuccin")
	end,
}
