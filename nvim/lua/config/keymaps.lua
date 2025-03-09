-- if true then
--   return {}
-- end
-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Neo-tree" })
-- vim.keymap.set("n", "<leader>r", "<cmd>Neotree reveal<cr>", { desc = "Reveal file in Neo-tree" })
vim.keymap.set("n", "<C-h>", "^", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "g_", { noremap = true, silent = true })
