vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.opt.clipboard = "unnamedplus"
-- Set global tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.background = "dark"

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
-- Load plugins from lua/plugins
require("lazy").setup("plugins")
require("configs.keymaps")
require("configs.options")
