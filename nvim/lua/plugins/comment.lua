return {
	"numToStr/Comment.nvim",
	dependencies = {
		"JoosepAlviste/nvim-ts-context-commentstring",
	},
	config = function()
		require("Comment").setup({
			pre_hook = function(ctx)
				return require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()(ctx)
			end,
		})
	end,
}
