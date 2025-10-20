local floating = {
	height = 0.9,
	width = 0.9,
	preview = {
		hidden = true,
	},
}
return {
	-- should install rg by running brew install rg
	"ibhagwan/fzf-lua",
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		local fzf = require("fzf-lua")
		fzf.setup({
			winopts = {
				height = 0.9,
				width = 0.9,
				preview = {
					layout = "horizontal",
					horizontal = "right:60%",
					scrollbar = false,
					wrap = true,
				},
			},
			files = {
				previewer = "builtin",
				fd_opts = "--type f --hidden --exclude .git --exclude node_modules --exclude dist --exclude .next --strip-cwd-prefix",
				winopts = {
					height = 0.9,
					width = 0.9,
					border = "rounded",
					title = "   Find Files ",
					title_pos = "center",
					preview = {
						hidden = true,
					},
				},
			},
			fzf_opts = {
				["--prompt"] = "   ",
				["--pointer"] = "",
				["--marker"] = "✓",
				["--layout"] = "reverse",
			},
			grep = {
				rg_opts = "--hidden --column --line-number --no-heading --color=always --smart-case --max-columns=512 --glob '!**/{.git,node_modules,dist,.next}/*'",
			},
			buffers = {
				winopts = {
					height = 0.9,
					width = 0.9,
					preview = {
						hidden = true,
					},
				},
			},
			oldfiles = {
				winopts = {
					height = 0.9,
					width = 0.9,
					preview = {
						hidden = true,
					},
				},
				prompt = "Recent files❯ ",
				cwd_only = true,
				stat_file = true, -- verify files exist on disk
				include_current_session = true, -- include bufs from current session
			},
			lsp = {
				jump_to_single_result = true,
				ignore_current_line = true,
				include_declaration = false,
			},
		})
		vim.keymap.set("n", "<leader>sf", require("fzf-lua").files, { desc = "fzf files" })
		vim.keymap.set("n", "<leader>sg", require("fzf-lua").live_grep, { desc = "fzf live grep" })
		vim.keymap.set("n", "<leader>sw", require("fzf-lua").grep_cword, { desc = "fzf word" })
		vim.keymap.set("n", "<leader>sr", require("fzf-lua").resume, { desc = "fzf resume" })
		vim.keymap.set("n", "<leader>ss", require("fzf-lua").spell_suggest, { desc = "spelling suggestions" })
		vim.keymap.set("n", "<leader>sc", require("fzf-lua").colorschemes, { desc = "spelling colorschemes" })
		vim.keymap.set("n", "<leader>sh", require("fzf-lua").oldfiles, { desc = "fzf oldfiles" })
		vim.keymap.set("n", "<leader><leader>", require("fzf-lua").buffers, { desc = "fzf buffers" })
		vim.keymap.set("n", "<leader>gr", function()
			fzf.lsp_references({ silent = true })
		end, { desc = "[G]oto [R]eferences" })
		vim.keymap.set("n", "gd", function()
			require("fzf-lua").lsp_definitions({ silent = true })
		end, { desc = "[G]oto [D]efinition" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
		vim.keymap.set("n", "<leader>ca", function()
			require("fzf-lua").lsp_code_actions({
				winopts = floating,
				silent = true,
			})
		end, { desc = "[C]ode [A]ction" })
	end,
}
