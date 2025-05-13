return {
	-- should install rg by running brew install rg
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local actions = require("fzf-lua").actions
		require("fzf-lua").setup({
			winopts = {
				height = 0.9, -- 80% de la hauteur de l'écran
				width = 1, -- 80% de la largeur de l'écran
				preview = {
					layout = "horizontal", -- 👈 pour avoir le preview à droite
					horizontal = "right:60%", -- 👈 taille du panneau preview
					scrollbar = false,
					wrap = true,
				},
			},
			files = {
				previewer = "builtin", -- ou "builtin"
			},
		})
		vim.keymap.set("n", "<leader>sf", require("fzf-lua").files, { desc = "fzf files" })
		vim.keymap.set("n", "<leader>sg", require("fzf-lua").live_grep, { desc = "fzf live grep" })
		vim.keymap.set("n", "<leader>sw", require("fzf-lua").grep_cword, { desc = "fzf word" })
		vim.keymap.set("n", "<leader>sr", require("fzf-lua").resume, { desc = "fzf resume" })
		vim.keymap.set("n", "<leader>ss", require("fzf-lua").spell_suggest, { desc = "spelling suggestions" })
		vim.keymap.set("n", "<leader>sc", require("fzf-lua").colorschemes, { desc = "spelling colorschemes" })
		vim.keymap.set("n", "<leader><leader>", require("fzf-lua").buffers, { desc = "fzf buffers" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>cd",
		-- 	":lua require'fzf-lua'.diagnostics_document({fzf_opts = { ['--wrap'] = true }})<cr>",
		-- 	{ desc = "document diagnostics" }
		-- )
	end,
}
