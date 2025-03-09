-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- ESLint configuration
      eslint = {
        settings = {
          format = true,
        },
      },
      tsserver = {},
    },
  },
}
