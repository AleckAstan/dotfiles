return {
	"nvim-telescope/telescope.nvim",
	event = "VimEnter",
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
			-- defaults = {
			-- 	vimgrep_arguments = {
			-- 		"rg",
			-- 		"--color=never",
			-- 		"--no-heading",
			-- 		"--with-filename",
			-- 		"--line-number",
			-- 		"--column",
			-- 		"--smart-case",
			-- 		"-u",
			-- 		"-i",
			-- 	},
			-- },
			-- pickers = {
			-- 	find_files = {
			-- 		find_command = { "rg", "--files", "-i", "--hidden", "-g", "!.git" },
			-- 	},
			-- 	buffers = {
			-- 		show_all_buffers = true,
			-- 	},
			-- 	live_grep = {
			-- 		previewer = false,
			-- 		theme = "dropdown",
			-- 	},
			-- },
		})

		-- Enable Telescope extensions if they are installed
		-- pcall(require("telescope").load_extension, "fzf")
		-- pcall(require("telescope").load_extension, "file_browser")
		-- pcall(require("telescope").load_extension, "ui-select")

		require("telescope").load_extension("ui-select")

		local builtin = require("telescope.builtin")
		vim.keymap.set(
			"n",
			"<leader>sf",
			":lua require('telescope.builtin').find_files({ additional_args = function() return { '--hidden' } end })<cr>",
			{ silent = true, desc = "[S]earch [F]iles" }
		)
		vim.keymap.set("n", "<leader>sw", builtin.grep_string, { desc = "[S]earch current [W]ord" })
		vim.keymap.set(
			"n",
			"<leader>sg",
			":lua require('telescope.builtin').live_grep({ additional_args = function() return { '--hidden' } end })<cr>",
			{ silent = true, desc = "Find in Files" }
		)
		vim.keymap.set("n", "<leader>cd", builtin.diagnostics, { desc = "[S]earch [D]iagnostics" })
		vim.keymap.set("n", "<leader>sr", builtin.resume, { desc = "[S]earch [R]esume" })
		vim.keymap.set("n", "<leader>sh", builtin.oldfiles, { desc = '[S]earch Recent Files ("." for repeat)' })
		vim.keymap.set("n", "<leader><leader>", function()
			builtin.buffers({ initial_mode = "normal" })
		end, { desc = "[ ] Find existing buffers" })
		vim.keymap.set("n", "<leader>sn", function()
			builtin.find_files({ cwd = vim.fn.stdpath("config") })
		end, { desc = "[S]earch [N]eovim files" })

		-- LSP References
		vim.keymap.set("n", "<leader>gr", function()
			builtin.lsp_references()
		end, { desc = "[G]oto [R]eferences" })

		-- LSP Definitions
		vim.keymap.set("n", "gd", function()
			builtin.lsp_definitions()
		end, { desc = "[G]oto [D]efinition" })

		-- LSP Rename
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })

		-- LSP Code Actions (Telescope n'a pas de floating intégré par défaut comme fzf-lua)

		vim.keymap.set(
			"n",
			"<leader>ca",
			":lua vim.lsp.buf.code_action()<cr>",
			{ silent = true, desc = "[C]ode [A]ction" }
		)
	end,
}
