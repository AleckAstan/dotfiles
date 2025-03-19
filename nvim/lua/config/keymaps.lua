-- if true then
--   return {}
-- end
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
-- vim.keymap.set("n", "<leader>r", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in Neo-tree" })
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.set("v", "<C-h>", "g^", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "g^", { noremap = true, silent = true })
vim.keymap.set("v", "<C-l>", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "$", { noremap = true, silent = true })

vim.keymap.set("n", "<C-j>", function()
  require("mini.move").move_line("down")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", function()
  require("mini.move").move_line("up")
end, { noremap = true, silent = true })

local modes = { "i", "v", "n" }
for _, mode in ipairs(modes) do
  vim.api.nvim_set_keymap(mode, "<Up>", "<Nop>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap(mode, "<Down>", "<Nop>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap(mode, "<Left>", "<Nop>", { noremap = true, silent = true })
  vim.api.nvim_set_keymap(mode, "<Right>", "<Nop>", { noremap = true, silent = true })
end
