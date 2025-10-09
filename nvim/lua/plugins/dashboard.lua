if true then
	return {}
end
return {
	"nvimdev/dashboard-nvim",
	lazy = false,
	opts = function()
		local logo = [[
         ██╗      █████╗ ███████╗██╗   ██╗██╗   ██╗██╗███╗   ███╗          Z
         ██║     ██╔══██╗╚══███╔╝╚██╗ ██╔╝██║   ██║██║████╗ ████║      Z    
         ██║     ███████║  ███╔╝  ╚████╔╝ ██║   ██║██║██╔████╔██║   z       
         ██║     ██╔══██║ ███╔╝    ╚██╔╝  ╚██╗ ██╔╝██║██║╚██╔╝██║ z         
         ███████╗██║  ██║███████╗   ██║    ╚████╔╝ ██║██║ ╚═╝ ██║           
         ╚══════╝╚═╝  ╚═╝╚══════╝   ╚═╝     ╚═══╝  ╚═╝╚═╝     ╚═╝           
    ]]

		logo = string.rep("\n", 8) .. logo .. "\n\n"

		local opts = {
			theme = "doom",
			hide = {
				statusline = false,
			},
			config = {
				header = vim.split(logo, "\n"),
				center = {
					-- { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
					-- { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
					-- { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
					-- { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
					-- { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
					-- { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
					-- { action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
					-- { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
					-- ,
				},
				footer = nil,
			},
		}

		for _, button in ipairs(opts.config.center) do
			button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
			button.key_format = "  %s"
		end

		-- open dashboard after closing lazy
		if vim.o.filetype == "lazy" then
			vim.api.nvim_create_autocmd("WinClosed", {
				pattern = tostring(vim.api.nvim_get_current_win()),
				once = true,
				callback = function()
					vim.schedule(function()
						vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
					end)
				end,
			})
		end

		return opts
	end,
}
-- return {
-- 	"letieu/btw.nvim",
-- 	config = function()
-- 		require("btw").setup()
-- 	end,
-- }
