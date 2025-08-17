vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
-- Set global tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.background = "light"

vim.opt.wrap = false

vim.opt.signcolumn = "yes"

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.scrolloff = 8

vim.opt.laststatus = 3

vim.opt.cmdheight = 0

vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.number = true -- Show the current absolute line number
-- undotree persists between sessions
vim.opt.undofile = true
vim.opt.undodir = vim.fn.expand("~/.local/share/nvim/undo")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- -- accent
-- _G.accent_menu = function()
-- 	local line = vim.api.nvim_get_current_line()
-- 	local col = vim.fn.col(".") - 1
-- 	local last_char = "e"
-- 	local accents = {
-- 		["e"] = { "é", "è", "ê", "ë" },
-- 	}
--
-- 	local options = accents[last_char]
-- 	if not options then
-- 		vim.notify("Pas d'accents pour '" .. last_char .. "'", vim.log.levels.INFO)
-- 		return
-- 	end
--
-- 	local menu = {}
-- 	for i, a in ipairs(options) do
-- 		table.insert(menu, string.format("%d. %s", i, a))
-- 	end
--
-- 	local choice = vim.fn.inputlist(menu)
-- 	if choice >= 1 and choice <= #options then
-- 		local new_line = line:sub(1, col - 1) .. options[choice] .. line:sub(col + 1)
-- 		vim.api.nvim_set_current_line(new_line)
-- 		vim.api.nvim_win_set_cursor(0, { vim.fn.line("."), col })
-- 	end
-- end
--
-- vim.keymap.set("n", "<C-f>", function()
-- 	vim.cmd("lua accent_menu()")
-- end, { desc = "Menu accents depuis insert mode" })
-- accents
-- Load plugins from lua/plugins
require("lazy").setup("plugins")
require("configs.keymaps")
require("configs.options")

vim.cmd.highlight("Visual ctermbg=Green guibg=LightGreen")
