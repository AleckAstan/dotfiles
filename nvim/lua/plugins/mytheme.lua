if true then
	return {}
end
return {
	dir = "~/.config/nvim/lua/themes/latte-vivid.nvim",
	name = "latte-vivid",
	lazy = false,
	priority = 1000,
	config = function()
		vim.cmd("colorscheme latte_vivid")
	end,
}
