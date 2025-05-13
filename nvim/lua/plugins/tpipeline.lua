if true then
	return {}
end
return {
	"vimpostor/vim-tpipeline",
	lazy = false, -- Load immediately
	config = function()
		vim.g.tpipeline_autoembed = 0
		-- vim.g.tpipeline_restore = 1
		-- vim.g.tpipeline_clearstl = 1
	end,
}
