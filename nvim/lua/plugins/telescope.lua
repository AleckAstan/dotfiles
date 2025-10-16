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
		local telescope = require("telescope")
		telescope.setup({
			extensions = {
				["ui-select"] = {
					require("telescope.themes").get_dropdown(),
				},
				extensions = {
					fzf = {
						fuzzy = true, -- recherche floue rapide
						override_generic_sorter = true, -- remplace le tri par défaut
						override_file_sorter = true,
						case_mode = "smart_case",
					},
				},
			},
			defaults = {
				path_display = { "truncate" },
				vimgrep_arguments = {
					"rg",
					"--color=never",
					"--no-heading",
					"--with-filename",
					"--line-number",
					"--column",
					"--smart-case",
					"--hidden", -- inclut les fichiers cachés
					"--glob",
					"!**/.git/*",
					"--glob",
					"!**/node_modules/*",
					"--glob",
					"!**/dist/*",
					"--glob",
					"!**/.cache/*",
					"--glob",
					"!**/build/*",
					"--glob",
					"!**/coverage/*",
				},
				file_ignore_patterns = {
					"node_modules",
					".git",
					"dist",
					".cache",
					"build",
					"coverage",
				},
			},
			pickers = {
				find_files = {
					previewer = false,
					-- 	find_command = {
					-- 		"rg",
					-- 		"--files",
					-- 		"--hidden",
					-- 		"--ignore",
					-- 		"--glob",
					-- 		"!**/.git/*",
					-- 		"--glob",
					-- 		"!**/node_modules/*",
					-- 		"--glob",
					-- 		"!**/dist/*",
					-- 		"--glob",
					-- 		"!**/.cache/*",
					-- 		"--glob",
					-- 		"!**/build/*",
					-- 		"--glob",
					-- 		"!**/coverage/*",
					-- 	},
					-- },
					find_command = {
						"fd",
						"--type",
						"f",
						"--hidden",
						"--exclude",
						".git",
						"--exclude",
						"node_modules",
						"--exclude",
						"dist",
						"--exclude",
						".cache",
						"--exclude",
						"build",
					},
				},
				buffers = {
					show_all_buffers = true,
				},
				live_grep = {
					previewer = true,
				},
			},
		})

		telescope.load_extension("ui-select")
		telescope.load_extension("fzf")

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
		vim.keymap.set("n", "<leader>gr", function()
			builtin.lsp_references()
		end, { desc = "[G]oto [R]eferences" })
		vim.keymap.set("n", "gd", function()
			builtin.lsp_definitions()
		end, { desc = "[G]oto [D]efinition" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
		vim.keymap.set(
			"n",
			"<leader>ca",
			":lua vim.lsp.buf.code_action()<cr>",
			{ silent = true, desc = "[C]ode [A]ction" }
		)
	end,
}
