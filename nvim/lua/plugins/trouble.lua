return {
	"folke/trouble.nvim",
	opts = {
		auto_open = true,
	},
	cmd = "Trouble",
	keys = {
		{
			"<leader>xx",
			"<cmd>Trouble diagnostics toggle focus=false win.position=right filter.buf=0<cr>",
			desc = "Diagnostics (Trouble)",
		},
	},
}
