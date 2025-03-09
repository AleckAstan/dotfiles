return {
  "williamboman/mason-lspconfig.nvim",
  -- overrides `require("mason-lspconfig").setup(...)`
  opts = {
    ensure_installed = {
      "lua_ls",
      "ts_ls",
      "tailwindcss",
      -- add more arguments for adding more language servers
    },
  },
}
