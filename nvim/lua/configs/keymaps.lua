vim.keymap.set("n", "<leader>e", "<Cmd>Neotree toggle<CR>")
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

vim.keymap.set("n", "<leader>lg", "<Cmd>LazyGit<CR>")

vim.keymap.set("n", "<leader>cd", function()
	vim.diagnostic.open_float(nil, { focus = true })
end, { desc = "Show diagnostics in floating window" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })

local modes = { "i", "v", "n" }
for _, mode in ipairs(modes) do
	vim.api.nvim_set_keymap(mode, "<Up>", "<Nop>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(mode, "<Down>", "<Nop>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(mode, "<Left>", "<Nop>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(mode, "<Right>", "<Nop>", { noremap = true, silent = true })
end
