return {
  "folke/tokyonight.nvim",
  opts = {
    transparent = true,
    styles = {
      sidebars = "transparent",
      floats = "transparent",
    },
  },
}
-- return {
--   "Shatur/neovim-ayu",
--   priority = 1000,
--   config = function()
--     require("ayu").setup({
--       mirage = true, -- Set to false for Ayu Light (true for Ayu Mirage)
--     })
--     vim.cmd("colorscheme ayu-light")
--   end,
-- }
