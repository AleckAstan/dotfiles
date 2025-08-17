return {
	"sindrets/diffview.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		require("diffview").setup({
			use_icons = true,
			view = {
				merge_tool = {
					disable_diagnostics = true,
				},
			},
		})

		vim.keymap.set("n", "<leader>gd", ":DiffviewOpen<CR>")
	end,
}
