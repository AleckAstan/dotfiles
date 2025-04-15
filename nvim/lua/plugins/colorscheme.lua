-- return {
-- 	"olimorris/onedarkpro.nvim",
-- 	priority = 1000,
-- 	config = function()
-- 		require("onedarkpro").setup({
-- 			options = {
-- 				transparency = true,
-- 			},
-- 			styles = {
-- 				types = "italic",
-- 				methods = "NONE",
-- 				numbers = "NONE",
-- 				strings = "NONE",
-- 				comments = "italic",
-- 				keywords = "italic",
-- 				constants = "NONE",
-- 				functions = "NONE",
-- 				operators = "NONE",
-- 				variables = "NONE",
-- 				parameters = "NONE",
-- 				conditionals = "NONE",
-- 				virtual_text = "NONE",
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("onelight")
-- 	end,
-- }
-- return {
-- 	"sainnhe/edge",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		vim.g.edge_enable_italic = true
-- 		vim.g.edge_transparent_background = false
-- 		vim.g.edge_diagnostic_text_highlight = true
-- 		vim.g.edge_style = "neon"
-- 		vim.cmd.colorscheme("edge")
-- 	end,
-- }
--
return {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		vim.g.everforest_enable_italic = true
		vim.g.everforest_transparent_background = true
		vim.g.everforest_diagnostic_text_highlight = true
		vim.g.everforest_background = "hard"
		vim.cmd.colorscheme("everforest")
	end,
}
-- return {
-- 	"Shatur/neovim-ayu",
-- 	lazy = false,
-- 	priority = 1000,
-- 	config = function()
-- 		require("ayu").setup({
-- 			mirage = true, -- Set to `true` to use `mirage` variant instead of `dark` for dark background.
-- 			terminal = true, -- Set to `false` to let terminal manage its own colors.
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
-- 		vim.cmd.colorscheme("ayu-light")
-- 	end,
-- }
--
