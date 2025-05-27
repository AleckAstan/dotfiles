if true then
	return {}
end
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
				name = "work",
				path = "/Volumes/PROJECTS/Obsidian/Documents/Work",
			},
		},
	},
}
