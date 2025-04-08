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
-- 	config = function()
-- 		require("ayu").setup({
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
--
-- 				-- font
-- 				Keyword = { italic = true },
-- 			},
-- 		})
-- 		vim.cmd.colorscheme("ayu-light")
-- 	end,
-- }
--
