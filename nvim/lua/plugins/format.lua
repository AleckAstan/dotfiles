return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier", "eslint-lsp" },
				javascriptreact = { "prettier", "eslint-lsp" },
				typescript = { "prettier", "eslint-lsp" },
				typescriptreact = { "prettier", "eslint-lsp" },
				json = { "prettier" },
				yaml = { "prettier" },
				lua = { "stylua" },
			},
			format_on_save = {
				lsp_format = "fallback",
			},
		})
	end,
}
