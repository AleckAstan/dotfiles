return {
  {
    "echasnovski/mini.move",
    version = "*",
    config = function()
      require("mini.move").setup({
        mappings = {
          -- Move visual selection in Visual mode. Defaults are Alt (Meta) + hjkl.
          down = "<C-j>",
          up = "<C-k>",

          -- Move current line in Normal mode
          line_down = "<C-j>",
          line_up = "<C-k>",
        },

        options = {
          reindent_linewise = true,
        },
      })
    end,
  },
  {
    "echasnovski/mini.surround",
    version = "*",
    config = function()
      require("mini.surround").setup()
    end,
  },
}
