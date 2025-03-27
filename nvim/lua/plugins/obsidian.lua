return {
	"epwalsh/obsidian.nvim",
	version = "*",
	lazy = true,
	ft = "markdown",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	opts = {
		workspaces = {
			{
				name = "personal",
				path = "/Volumes/PROJECTS/NOTES",
			},
			{
				name = "work",
				path = "/Volumes/PROJECTS/NOTES",
			},
		},
	},
}
