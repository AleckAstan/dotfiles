return {
	"stevearc/conform.nvim",
	config = function()
		require("conform").setup({
			formatters_by_ft = {
				javascript = { "prettier", "eslint_d" },
				javascriptreact = { "prettier", "eslint_d" },
				typescript = { "prettier", "eslint_d" },
				typescriptreact = { "prettier", "eslint_d" },
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
