if true then
	return {}
end
return {
	dir = "~/.config/nvim/lua/themes/latte-vivid.nvim",
	name = "latte-vivid",
	lazy = false, -- (ou true si tu veux charger à la demande)
	priority = 1000, -- pour qu’il se charge avant les autres plugins
	config = function()
		vim.cmd("colorscheme latte_vivid")
	end,
}
