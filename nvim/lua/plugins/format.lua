-- ~/.config/nvim/lua/plugins/format.lua
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      javascript = { "eslint_d", "prettier" },
      typescript = { "eslint_d", "prettier" },
      javascriptreact = { "eslint_d", "prettier" },
      typescriptreact = { "eslint_d", "prettier" },
    },
    -- Optional: Enable format on save
    format_on_save = {
      lsp_fallback = true,
    },
  },
}
