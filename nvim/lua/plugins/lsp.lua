return {
	{
		"neovim/nvim-lspconfig",
		config = function()
			local lspconfig = require("lspconfig")
			-- lspconfig.tsserver.setup({})
			lspconfig.ts_ls.setup({})
			lspconfig.lua_ls.setup({})
			lspconfig.cssls.setup({})
			lspconfig.tailwindcss.setup({})
		end,
	},
}
