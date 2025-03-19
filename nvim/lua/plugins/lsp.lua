-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  {
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
  },

  -- {
  --   "glepnir/lspsaga.nvim",
  --   config = function()
  --     require("lspsaga").setup({
  --       error_sign = "",
  --       warn_sign = "",
  --       hint_sign = "",
  --       inlay_hints = true,
  --       -- autres configurations si nécessaire
  --     })
  --   end,
  -- },
}
