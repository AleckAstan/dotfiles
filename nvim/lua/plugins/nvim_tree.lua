return {
	"nvim-tree/nvim-tree.lua",
	dependencies = { "nvim-tree/nvim-web-devicons" }, -- pour les icônes
	config = function()
		require("nvim-tree").setup({
			disable_netrw = false,
			hijack_netrw = true,
			view = {
				width = 30,
				side = "right",
			},
			git = {
				enable = true,
				ignore = false,
			},
			filters = {
				dotfiles = true,
			},
			update_focused_file = {
				enable = true,
				update_cwd = false, -- Ne pas changer le répertoire de travail global
			},
		})
	end,
}
