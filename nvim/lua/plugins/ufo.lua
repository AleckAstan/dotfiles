vim.o.foldenable = true -- Activer le folding
vim.o.foldlevel = 99 -- Empêcher le repli total à l'ouverture
vim.o.foldlevelstart = 99 -- Déplier tout à l'ouverture
return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		"kevinhwang91/promise-async",
	},
	config = function()
		require("ufo").setup({
			provider_selector = function()
				return { "treesitter", "indent" }
			end,
		})
	end,
}
