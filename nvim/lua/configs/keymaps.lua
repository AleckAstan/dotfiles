vim.keymap.set("n", "<leader>e", ":Neotree toggle<CR>")
vim.keymap.del("n", "<C-j>")
vim.keymap.del("n", "<C-k>")
vim.keymap.set("v", "<C-h>", "^", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "^", { noremap = true, silent = true })
vim.keymap.set("v", "<C-l>", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "$", { noremap = true, silent = true })

vim.keymap.set("n", "<leader>bd", "<Cmd>bd<CR>")
vim.keymap.set("n", "<C-j>", function()
	require("mini.move").move_line("down")
end, { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", function()
	require("mini.move").move_line("up")
end, { noremap = true, silent = true })

vim.keymap.set("n", "<leader>lg", "<Cmd>LazyGit<CR>")
-- maintain current yanked to register
vim.keymap.set("x", "<leader>p", '"_dP')

vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")
-- vim.keymap.set("n", "<leader>cd", function()
-- 	vim.diagnostic.open_float(nil, { focus = true })
-- end, { desc = "Show diagnostics in floating window" })
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
-- console.log selection
vim.api.nvim_set_keymap("v", "<leader>cl", '"zyoconsole.log("<C-R>z", <C-R>z);<Esc>', { noremap = true, silent = true })

local modes = { "i", "v", "n" }
for _, mode in ipairs(modes) do
	vim.api.nvim_set_keymap(mode, "<Up>", "<Nop>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(mode, "<Down>", "<Nop>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(mode, "<Left>", "<Nop>", { noremap = true, silent = true })
	vim.api.nvim_set_keymap(mode, "<Right>", "<Nop>", { noremap = true, silent = true })
end
