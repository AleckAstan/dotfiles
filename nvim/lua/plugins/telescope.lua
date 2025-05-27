if true then
	return {}
end
return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",

			cond = function()
				return vim.fn.executable("make") == 1
			end,
		},
		{ "nvim-telescope/telescope-ui-select.nvim" },

		{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
	},
	config = function()
		require("telescope").setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
			},
			defaults = {
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"-u", -- thats the new thing
					"-i",
				},
			},
			pickers = {
				find_files = {
					find_command = { "rg", "--files", "-i", "--hidden", "-g", "!.git" },
					layout_config = {
						height = 0.70,
					},
				},
				buffers = {
					show_all_buffers = true,
				},
				live_grep = {
					previewer = false,
					theme = "dropdown",
				},
			},
		})

		-- Enable Telescope extensions if they are installed
		pcall(require("telescope").load_extension, "fzf")
		pcall(require("telescope").load_extension, "file_browser")
		pcall(require("telescope").load_extension, "ui-select")

		-- local builtin = require("telescope.builtin")
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sf",
		-- 	":lua require('telescope.builtin').find_files({ additional_args = function() return { '--hidden' } end })<cr>",
		-- 	{ silent = true, desc = "[S]earch [F]iles" }
		-- )
		-- vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		-- vim.keymap.set(
		-- 	"n",
		-- 	"<leader>sg",
		-- 	":lua require('telescope.builtin').live_grep({ additional_args = function() return { '--hidden' } end })<cr>",
		-- 	{ silent = true, desc = "Find in Files" }
		-- )
		-- vim.keymap.set("n", "<leader>sd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		-- vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		-- vim.keymap.set("n", "<leader>s.", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		-- vim.keymap.set("n", "<leader><leader>", function()
		-- 	builtin.buffers({ initial_mode = "normal" })
		-- end, { desc = "[ ] Find existing buffers" })
		--
		-- -- Slightly advanced example of overriding default behavior and theme
		-- vim.keymap.set("n", "<leader>/", function()
		-- 	builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
		-- 		winblend = 10,
		-- 		previewer = false,
		-- 		sorting_strategy = "ascending",
		-- 		prompt_title = "Search Current Buffer",
		-- 	}))
		-- end, { desc = "[/] Fuzzy find in current buffer" }) -- It's also possible to pass additional configuration options.
		-- -- Shortcut for searching your Neovim configuration files
		-- vim.keymap.set("n", "<leader>sn", function()
		-- 	builtin.find_files({ cwd = vim.fn.stdpath("config") })
		-- end, { desc = "[S]earch [N]eovim files" })
	end,
}
