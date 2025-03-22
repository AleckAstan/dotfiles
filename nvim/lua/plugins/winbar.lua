if true then
	return {}
end
return {
	"fgheng/winbar.nvim",
	config = function()
		require("winbar").setup({
			enabled = true,
			show_file_path = true,
			show_symbols = true,
		})
	end,
}
