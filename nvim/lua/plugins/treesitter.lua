return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			ensure_installed = {
				"toml",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"tmux",
			},
			highlight = { enable = true },
			indent = { enable = true },
			autotag = { enable = true },
		})
	end,
}
