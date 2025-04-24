return {
	"olimorris/onedarkpro.nvim",
	priority = 1000,
	config = function()
		require("onedarkpro").setup({
			options = {
				transparency = true,
				lualine_transparency = true,
			},
			styles = {
				types = "italic",
				methods = "NONE",
				numbers = "NONE",
				strings = "NONE",
				comments = "italic",
				keywords = "italic",
				constants = "NONE",
				functions = "NONE",
				operators = "NONE",
				variables = "NONE",
				parameters = "NONE",
				conditionals = "NONE",
				virtual_text = "NONE",
			},
		})
		vim.cmd.colorscheme("onedark_dark")
	end,
}

-- return {
-- 	"sainnhe/everforest",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.everforest_enable_italic = true
-- 		vim.g.everforest_transparent_background = true
-- 		vim.g.everforest_diagnostic_text_highlight = true
-- 		vim.g.everforest_background = "hard"
-- 		vim.cmd.colorscheme("everforest")
-- 	end,
-- }
