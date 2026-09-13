vim.opt.termguicolors = true
vim.o.background = "light"

-- ============================================================================
-- OPTIONS
-- ============================================================================
vim.opt.number = true -- line number
vim.opt.relativenumber = true -- relative line numbers
vim.opt.cursorline = true -- highlight current line
vim.opt.wrap = false -- do not wrap lines by default
vim.opt.scrolloff = 10 -- keep 10 lines above/below cursor
vim.opt.sidescrolloff = 10 -- keep 10 lines to left/right of cursor

vim.opt.tabstop = 2 -- tabwidth
vim.opt.shiftwidth = 2 -- indent width
vim.opt.softtabstop = 2 -- soft tab stop not tabs on tab/backspace
vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line

vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true -- case sensitive if uppercase in string
vim.opt.hlsearch = true -- highlight search matches
vim.opt.incsearch = true -- show matches as you type

vim.opt.signcolumn = "yes" -- always show a sign column
-- vim.opt.colorcolumn = "100" -- show a column at 100 position chars
vim.opt.showmatch = true -- highlights matching brackets
vim.opt.cmdheight = 1 -- single line command line
vim.opt.completeopt = "menuone,noinsert,noselect" -- completion options
vim.opt.showmode = false -- do not show the mode, instead have it in statusline
vim.opt.pumheight = 10 -- popup menu height
vim.opt.pumblend = 10 -- popup menu transparency
vim.opt.winblend = 0 -- floating window transparency
vim.opt.conceallevel = 0 -- do not hide markup
vim.opt.concealcursor = "" -- do not hide cursorline in markup
vim.opt.lazyredraw = false -- do not redraw during macros
vim.opt.synmaxcol = 300 -- syntax highlighting limit
vim.opt.fillchars = { eob = " " } -- hide "~" on empty lines

local undodir = vim.fn.expand("~/.vim/undodir")
if
	vim.fn.isdirectory(undodir) == 0 -- create undodir if nonexistent
then
	vim.fn.mkdir(undodir, "p")
end

vim.opt.backup = false -- do not create a backup file
vim.opt.writebackup = true -- protect files while they are being written
vim.opt.swapfile = true -- preserve unsaved changes after a crash
vim.opt.undofile = true -- do create an undo file
vim.opt.undodir = undodir -- set the undo directory
vim.opt.updatetime = 300 -- faster completion
vim.opt.timeoutlen = 500 -- timeout duration
vim.opt.ttimeoutlen = 0 -- key code timeout
vim.opt.autoread = true -- auto-reload changes if outside of neovim
vim.opt.autowrite = false -- do not auto-save

vim.opt.hidden = true -- allow hidden buffers
vim.opt.errorbells = false -- no error sounds
vim.opt.backspace = "indent,eol,start" -- better backspace behaviour
vim.opt.autochdir = false -- do not autochange directories
-- vim.opt.iskeyword:append("-") -- include - in words
vim.opt.path:append("**") -- include subdirs in search
vim.opt.selection = "inclusive" -- include last char in selection
vim.opt.mouse = "a" -- enable mouse support
vim.opt.clipboard:append("unnamedplus") -- use system clipboard
vim.opt.modifiable = true -- allow buffer modifications
vim.opt.encoding = "utf-8" -- set encoding

-- Folding: requires treesitter available at runtime; safe fallback if not
vim.opt.foldmethod = "expr" -- use expression for folding
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()" -- use treesitter for folding
vim.opt.foldlevel = 99 -- start with all folds open

vim.opt.splitbelow = true -- horizontal splits go below
vim.opt.splitright = true -- vertical splits go right

vim.opt.wildmenu = true -- tab completion
vim.opt.wildmode = "longest:full,full" -- complete longest common match, full completion list, cycle through with Tab
vim.opt.diffopt:append("linematch:60") -- improve diff display
vim.opt.redrawtime = 10000 -- increase neovim redraw tolerance
vim.opt.maxmempattern = 20000 -- increase max memory

-- ============================================================================
-- KEYMAPS
-- ============================================================================
vim.g.mapleader = " " -- space for leader
vim.g.maplocalleader = " " -- space for localleader

-- vim.keymap.set("n", "<leader>c", ":nohlsearch<CR>", { desc = "Clear search highlights" })
vim.keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
vim.keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

vim.keymap.set("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
vim.keymap.set({ "n", "v" }, "<leader>x", '"_d', { desc = "Delete without yanking" })

vim.keymap.set("n", "<C-k>", ":m .-2<CR>==", { desc = "Move line up" })
vim.keymap.set("n", "<C-j>", ":m .+1<CR>==", { desc = "Move line down" })
vim.keymap.set("v", "<C-j>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
vim.keymap.set("v", "<C-k>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

vim.keymap.set("v", "<C-h>", "^", { noremap = true, silent = true })
vim.keymap.set("n", "<C-h>", "^", { noremap = true, silent = true })
vim.keymap.set("v", "<C-l>", "$", { noremap = true, silent = true })
vim.keymap.set("n", "<C-l>", "$", { noremap = true, silent = true })

-- console.log selection
vim.api.nvim_set_keymap("v", "<leader>cl", '"zyoconsole.log("<C-R>z", <C-R>z);<Esc>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>pa", function() -- show file path
	local path = vim.fn.expand("%:p")
	vim.fn.setreg("+", path)
	print("file:", path)
end, { desc = "Copy full file path" })

-- ============================================================================
-- AUTOCMDS
-- ============================================================================

local augroup = vim.api.nvim_create_augroup("UserConfig", { clear = true })

-- Format on save (ONLY real file buffers, ONLY when efm is attached)
vim.api.nvim_create_autocmd("BufWritePre", {
	group = augroup,
	pattern = {
		"*.lua",
		"*.js",
		"*.jsx",
		"*.ts",
		"*.tsx",
		"*.json",
		"*.css",
		"*.scss",
		"*.html",
		"*.sh",
		"*.bash",
		"*.zsh",
	},
	callback = function(args)
		-- avoid formatting non-file buffers (helps prevent weird write prompts)
		if vim.bo[args.buf].buftype ~= "" then
			return
		end
		if not vim.bo[args.buf].modifiable then
			return
		end
		if vim.api.nvim_buf_get_name(args.buf) == "" then
			return
		end

		local has_efm = false
		for _, c in ipairs(vim.lsp.get_clients({ bufnr = args.buf })) do
			if c.name == "efm" then
				has_efm = true
				break
			end
		end
		if not has_efm then
			return
		end

		pcall(vim.lsp.buf.format, {
			bufnr = args.buf,
			timeout_ms = 2000,
			filter = function(c)
				return c.name == "efm"
			end,
		})
	end,
})

-- Format schema.prisma on save with the Prisma CLI (formats in place, so reload)
vim.api.nvim_create_autocmd("BufWritePost", {
	group = augroup,
	pattern = "*.prisma",
	callback = function(args)
		if vim.bo[args.buf].buftype ~= "" or not vim.bo[args.buf].modifiable then
			return
		end
		local path = vim.api.nvim_buf_get_name(args.buf)
		if path == "" then
			return
		end

		vim.fn.system({ "npx", "prisma", "format", "--schema", path })
		if vim.v.shell_error ~= 0 then
			return
		end

		local win = vim.api.nvim_get_current_win()
		local is_current = vim.api.nvim_get_current_buf() == args.buf
		local cursor = is_current and vim.api.nvim_win_is_valid(win) and vim.api.nvim_win_get_cursor(win) or nil
		vim.api.nvim_buf_call(args.buf, function()
			vim.cmd("silent edit!")
		end)
		if cursor then
			pcall(vim.api.nvim_win_set_cursor, win, cursor)
		end
	end,
})

-- highlight yanked text
vim.api.nvim_create_autocmd("TextYankPost", {
	group = augroup,
	callback = function()
		vim.hl.on_yank()
	end,
})

-- return to last cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
	group = augroup,
	desc = "Restore last cursor position",
	callback = function()
		if vim.o.diff then -- except in diff mode
			return
		end

		local last_pos = vim.api.nvim_buf_get_mark(0, '"') -- {line, col}
		local last_line = vim.api.nvim_buf_line_count(0)

		local row = last_pos[1]
		if row < 1 or row > last_line then
			return
		end

		pcall(vim.api.nvim_win_set_cursor, 0, last_pos)
	end,
})

-- wrap, linebreak and spellcheck on markdown and text files
vim.api.nvim_create_autocmd("FileType", {
	group = augroup,
	pattern = { "markdown", "text", "gitcommit" },
	callback = function()
		vim.opt_local.wrap = true
		vim.opt_local.linebreak = true
		vim.opt_local.spell = true
	end,
})

-- ============================================================================
-- PLUGINS (vim.pack)
-- ============================================================================
vim.api.nvim_create_autocmd("PackChanged", {
	group = augroup,
	callback = function(ev)
		if ev.data.spec.name == "avante.nvim" and (ev.data.kind == "install" or ev.data.kind == "update") then
			vim.system({ "make", "BUILD_FROM_SOURCE=true" }, { cwd = ev.data.path }):wait()
		end
	end,
})

vim.pack.add({
	"https://www.github.com/lewis6991/gitsigns.nvim",
	"https://www.github.com/echasnovski/mini.nvim",
	"https://www.github.com/ibhagwan/fzf-lua",
	"https://github.com/mikavilpas/yazi.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/folke/flash.nvim",
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		branch = "main",
		build = ":TSUpdate",
	},
	"https://www.github.com/neovim/nvim-lspconfig",
	"https://github.com/mason-org/mason.nvim",
	"https://github.com/creativenull/efmls-configs-nvim",
	{
		src = "https://github.com/saghen/blink.cmp",
		version = vim.version.range("1.*"),
	},
	"https://github.com/L3MON4D3/LuaSnip",
	"https://github.com/sindrets/diffview.nvim",
	"https://github.com/akinsho/git-conflict.nvim",
	"https://github.com/supermaven-inc/supermaven-nvim",
	"https://github.com/windwp/nvim-ts-autotag",
	"https://github.com/AleckAstan/bearded-nvim",
	"https://github.com/folke/noice.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	"https://github.com/JoosepAlviste/nvim-ts-context-commentstring",
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
	"https://github.com/prisma/vim-prisma",
	"https://github.com/yelog/i18n.nvim",
	"https://github.com/yetone/avante.nvim",
})

local function packadd(name)
	vim.cmd("packadd " .. name)
end

packadd("nvim-treesitter")
packadd("gitsigns.nvim")
packadd("mini.nvim")
packadd("fzf-lua")
-- LSP
packadd("nvim-lspconfig")
packadd("mason.nvim")
packadd("efmls-configs-nvim")
packadd("blink.cmp")
packadd("LuaSnip")
packadd("diffview.nvim")
packadd("git-conflict.nvim")
packadd("supermaven-nvim")
packadd("nvim-ts-autotag")
packadd("bearded-nvim")
packadd("noice.nvim")
packadd("nui.nvim")
packadd("nvim-ts-context-commentstring")
packadd("render-markdown.nvim")
packadd("vim-prisma")
packadd("i18n.nvim")
packadd("avante.nvim")

local setup_colorscheme = function()
	require("bearded").setup({
		flavor = "arc", -- see flavor list below
		transparent = true,
		bold = true,
		italic = true,
		dim_inactive = false,
		terminal_colors = true,
		on_highlights = function(set, palette, opts)
			set("Normal", { fg = palette.ui.default })
		end,
	})
	vim.cmd.colorscheme("bearded-classics-light")
end

setup_colorscheme()

local setup_treesitter = function()
	local treesitter = require("nvim-treesitter")
	treesitter.setup({
		auto_install = true,
		highlight = {
			enable = true,
		},
	})
	local ensure_installed = {
		"vim",
		"vimdoc",
		"html",
		"css",
		"javascript",
		"json",
		"lua",
		"markdown",
		"typescript",
		"tsx",
		"bash",
	}

	local config = require("nvim-treesitter.config")

	local already_installed = config.get_installed()
	local parsers_to_install = {}

	for _, parser in ipairs(ensure_installed) do
		if not vim.tbl_contains(already_installed, parser) then
			table.insert(parsers_to_install, parser)
		end
	end

	if #parsers_to_install > 0 then
		treesitter.install(parsers_to_install)
	end

	local group = vim.api.nvim_create_augroup("TreeSitterConfig", { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		callback = function(args)
			if vim.list_contains(treesitter.get_installed(), vim.treesitter.language.get_lang(args.match)) then
				vim.treesitter.start(args.buf)
			end
		end,
	})
end

setup_treesitter()

require("flash").setup({})

require("render-markdown").setup({
	file_types = { "markdown", "Avante" },
})

local avante_provider = vim.env.AVANTE_PROVIDER or "ollama"
local local_model = vim.env.AVANTE_LOCAL_MODEL or "qwen2.5-coder:7b"

require("avante").setup({
	provider = avante_provider,
	selector = {
		provider = "fzf_lua",
	},
	providers = {
		openai = {
			endpoint = vim.env.OPENAI_BASE_URL or "https://api.openai.com/v1",
			api_key_name = "OPENAI_API_KEY",
			model = vim.env.AVANTE_OPENAI_MODEL or "gpt-4o-mini",
			timeout = 60000,
		},
		ollama = {
			endpoint = vim.env.OLLAMA_HOST or "http://127.0.0.1:11434",
			model = vim.env.AVANTE_OLLAMA_MODEL or local_model,
			timeout = 120000,
			is_env_set = require("avante.providers.ollama").check_endpoint_alive,
			extra_request_body = {
				options = {
					num_ctx = 32768,
				},
			},
		},
		lmstudio = {
			__inherited_from = "openai",
			endpoint = vim.env.LM_STUDIO_BASE_URL or "http://127.0.0.1:1234/v1",
			api_key_name = "",
			model = vim.env.AVANTE_LMSTUDIO_MODEL or local_model,
			timeout = 120000,
			is_env_set = function()
				return true
			end,
		},
	},
})

vim.keymap.set({ "n", "v" }, "<leader>aa", "<Cmd>AvanteAsk<CR>", { desc = "Avante ask" })
vim.keymap.set("n", "<leader>at", "<Cmd>AvanteToggle<CR>", { desc = "Avante toggle" })
vim.keymap.set("n", "<leader>ap", "<Cmd>AvanteSwitchProvider<CR>", { desc = "Avante switch provider" })

require("nvim-ts-autotag").setup({})
require("noice").setup({
	cmdline = {
		view = "cmdline", -- Affiche la commande en bas, mais de façon stylée
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true, -- use a classic bottom cmdline for search
		command_palette = true, -- position the cmdline and popupmenu together
		long_message_to_split = true, -- long messages will be sent to a split
		inc_rename = false, -- enables an input dialog for inc-rename.nvim
		lsp_doc_border = false, -- add a border to hover docs and signature help
	},
})

vim.g.skip_ts_context_commentstring_module = true
require("ts_context_commentstring").setup({
	enable_autocmd = false,
})

require("fzf-lua").setup({})

vim.keymap.set("n", "<leader>sf", function()
	require("fzf-lua").files()
end, { desc = "FZF Files" })

vim.keymap.set("n", "<leader>sD", function()
	require("fzf-lua").lsp_workspace_diagnostics()
end)

vim.keymap.set("n", "<leader>sg", function()
	require("fzf-lua").live_grep()
end, { desc = "FZF Live Grep" })

vim.keymap.set("n", "<leader>sh", function()
	require("fzf-lua").oldfiles()
end, { desc = "FZF OldFiles" })

vim.keymap.set("n", "<leader>sr", function()
	require("fzf-lua").resume()
end, { desc = "FZF Resume" })

vim.keymap.set("n", "<leader><leader>", function()
	require("fzf-lua").buffers()
end, { desc = "FZF Buffers" })

require("yazi").setup({})

vim.keymap.set("n", "<leader>e", "<Cmd>Yazi<CR>")

require("mini.ai").setup({})
require("mini.comment").setup({
	options = {
		custom_commentstring = function()
			local status, ts_comment = pcall(function()
				return require("ts_context_commentstring.internal").calculate_commentstring()
			end)
			if status and ts_comment then
				return ts_comment
			end
			return vim.bo.commentstring
		end,
	},
})
require("mini.move").setup({})
require("mini.surround").setup({})
require("mini.cursorword").setup({})
require("mini.indentscope").setup({})
require("mini.pairs").setup({})
require("mini.trailspace").setup({})
require("mini.bufremove").setup({})
-- require("mini.notify").setup({})
require("mini.icons").setup({})

require("diffview").setup({
	use_icons = true,
	view = {
		merge_tool = {
			disable_diagnostics = true,
		},
	},
})

require("git-conflict").setup()

require("gitsigns").setup({
	signs = {
		add = { text = "\u{2590}" }, -- ▏
		change = { text = "\u{2590}" }, -- ▐
		delete = { text = "\u{2590}" }, -- ◦
		topdelete = { text = "\u{25e6}" }, -- ◦
		changedelete = { text = "\u{25cf}" }, -- ●
		untracked = { text = "\u{25cb}" }, -- ○
	},
	signcolumn = true,
	current_line_blame = false,
})

vim.keymap.set("n", "<leader>gb", ":Gitsigns toggle_current_line_blame<CR>")

require("mason").setup({})

local clicar_i18n_modules = {
	"agency",
	"alert",
	"auth",
	"booking-contract",
	"client",
	"client-material",
	"client-typology",
	"common",
	"condition-report-accessory",
	"driver",
	"driver-planning",
	"errors",
	"head-office",
	"kpi",
	"maintenance-schedule",
	"maintenance-type",
	"role",
	"sidebar",
	"statistics",
	"tracking",
	"user",
	"vehicle",
	"vehicle-category",
	"vehicle-immobilization",
	"vehicle-maintenance",
}

local clicar_i18n_sources = vim.tbl_map(function(module)
	local namespace = module:gsub("%-(%l)", string.upper)
	return {
		pattern = "src/locales/{locales}/" .. module .. ".json",
		prefix = namespace .. ":",
	}
end, clicar_i18n_modules)

require("i18n").setup({
	locales = { "fr", "en" },
	sources = clicar_i18n_sources,
	auto_detect = false,
	namespace_resolver = "auto",
	namespace_separator = ":",
	i18n_keys = { popup_type = "fzf-lua" },
	usage = { popup_type = "fzf-lua" },
})

-- Keep already-qualified i18next keys intact when useTranslation() is also in scope.
local i18n_namespace = require("i18n.namespace")
if not i18n_namespace._preserves_qualified_keys then
	local resolve = i18n_namespace.resolve
	local resolve_key_from_content = i18n_namespace.resolve_key_from_content

	i18n_namespace.resolve = function(bufnr, key, line, col)
		if key:find(":", 1, true) then
			return key
		end
		return resolve(bufnr, key, line, col)
	end

	i18n_namespace.resolve_key_from_content = function(lines, key, line, filetype)
		if key:find(":", 1, true) then
			return key
		end
		return resolve_key_from_content(lines, key, line, filetype)
	end

	i18n_namespace._preserves_qualified_keys = true
end

-- I18nAddKey extracts raw keys on its own; reuse the namespace-aware extractor.
local i18n_add_key = require("i18n.add_key")
if not i18n_add_key._resolves_namespaces then
	for index = 1, 20 do
		local upvalue = debug.getupvalue(i18n_add_key.add_key_interactive, index)
		if not upvalue then
			break
		end
		if upvalue == "get_key_under_cursor" then
			debug.setupvalue(i18n_add_key.add_key_interactive, index, function()
				return require("i18n.display").get_key_under_cursor()
			end)
			i18n_add_key._resolves_namespaces = true
			break
		end
	end
end

local function i18n_or_lsp_definition()
	if require("i18n").i18n_definition() then
		return
	end
	require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
end

local function i18n_or_lsp_hover()
	local key = require("i18n.display").get_key_under_cursor()
	if key and require("i18n").show_popup() then
		return
	end
	vim.lsp.buf.hover()
end

vim.keymap.set("n", "gd", i18n_or_lsp_definition, { desc = "i18n or LSP definition" })
vim.keymap.set("n", "K", i18n_or_lsp_hover, { desc = "i18n translations or LSP hover" })
vim.keymap.set("n", "<leader>si", function()
	require("i18n").i18n_keys()
end, { desc = "FZF i18n keys" })

-- require("supermaven-nvim").setup({
-- 	keymaps = {
-- 		accept_suggestion = "<Tab>",
-- 		clear_suggestion = "<C-]>",
-- 		accept_word = "<C-j>",
-- 	},
-- 	ignore_filetypes = {}, -- Add filetypes to ignore if needed
-- 	color = {
-- 		suggestion_color = "#808080",
-- 		cterm = 244,
-- 	},
-- 	log_level = "info", -- set to "off" to disable logging completely
-- 	disable_inline_completion = false, -- enable inline completion when not using cmp
-- 	disable_keymaps = false, -- disable built-in keymaps for manual control
-- 	-- end,
-- })
-- ============================================================================
-- LSP, Linting, Formatting & Completion
-- ============================================================================
local diagnostic_signs = {
	Error = " ",
	Warn = " ",
	Hint = "",
	Info = "",
}

vim.diagnostic.config({
	virtual_text = { prefix = "●", spacing = 4 },
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
			[vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
			[vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
			[vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
		},
	},
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = "always",
		header = "",
		prefix = "",
		focusable = true,
		style = "minimal",
	},
})

do
	local orig = vim.lsp.util.open_floating_preview
	function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
		opts = opts or {}
		opts.border = opts.border or "rounded"
		return orig(contents, syntax, opts, ...)
	end
end

local function lsp_on_attach(ev)
	local client = vim.lsp.get_client_by_id(ev.data.client_id)
	if not client then
		return
	end

	local bufnr = ev.buf
	local opts = { noremap = true, silent = true, buffer = bufnr }

	vim.keymap.set(
		"n",
		"gd",
		i18n_or_lsp_definition,
		vim.tbl_extend("force", opts, { desc = "i18n or LSP definition" })
	)

	vim.keymap.set("n", "<leader>ca", function()
		require("fzf-lua").lsp_code_actions({
			winopts = {
				relative = "cursor",
				row = 1,
				col = 0,
				height = 0.4,
				width = 0.6,
			},
		})
	end, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

	vim.keymap.set("n", "<leader>D", function()
		vim.diagnostic.open_float({ scope = "line" })
	end, opts)
	vim.keymap.set("n", "<leader>nd", function()
		vim.diagnostic.jump({ count = 1 })
	end, opts)

	vim.keymap.set("n", "<leader>pd", function()
		vim.diagnostic.jump({ count = -1 })
	end, opts)

	vim.keymap.set(
		"n",
		"K",
		i18n_or_lsp_hover,
		vim.tbl_extend("force", opts, { desc = "i18n translations or LSP hover" })
	)

	vim.keymap.set("n", "<leader>fd", function()
		require("fzf-lua").lsp_definitions({ jump_to_single_result = true })
	end, opts)
	vim.keymap.set("n", "<leader>gr", function()
		require("fzf-lua").lsp_references()
	end, opts)
	vim.keymap.set("n", "<leader>gt", function()
		require("fzf-lua").lsp_typedefs()
	end, opts)
	vim.keymap.set("n", "<leader>gs", function()
		require("fzf-lua").lsp_document_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>gw", function()
		require("fzf-lua").lsp_workspace_symbols()
	end, opts)
	vim.keymap.set("n", "<leader>gi", function()
		require("fzf-lua").lsp_implementations()
	end, opts)

	if client.supports_method("textDocument/inlayHint") then
		vim.lsp.inlay_hint.enable(true, { bufnr = bufnr })
	end

	vim.keymap.set("n", "<leader>th", function()
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = 0 }))
	end, { desc = "Toggle Inlay Hints" })

	vim.keymap.set("n", "<leader>d", function()
		vim.diagnostic.open_float({
			scope = "cursor",
			focusable = true,
			border = "rounded",
		})
	end, opts)

	vim.keymap.set("n", "[d", function()
		vim.diagnostic.jump({ count = -1, float = { border = "rounded", focusable = true } })
	end, opts)

	vim.keymap.set("n", "]d", function()
		vim.diagnostic.jump({ count = 1, float = { border = "rounded", focusable = true } })
	end, opts)

	if client:supports_method("textDocument/codeAction", bufnr) then
		vim.keymap.set("n", "<leader>oi", function()
			vim.lsp.buf.code_action({
				context = { only = { "source.organizeImports" }, diagnostics = {} },
				apply = true,
				bufnr = bufnr,
			})
			vim.defer_fn(function()
				vim.lsp.buf.format({ bufnr = bufnr })
			end, 50)
		end, opts)
	end
end

vim.api.nvim_create_autocmd("LspAttach", { group = augroup, callback = lsp_on_attach })

require("blink.cmp").setup({
	keymap = {
		preset = "none",
		["<C-Space>"] = { "show", "hide" },
		["<CR>"] = { "accept", "fallback" },
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
	},
	appearance = { nerd_font_variant = "mono" },
	completion = { menu = { auto_show = true } },
	sources = { default = { "lsp", "path", "buffer", "snippets" } },
	snippets = {
		expand = function(snippet)
			require("luasnip").lsp_expand(snippet)
		end,
	},

	fuzzy = {
		implementation = "prefer_rust",
		prebuilt_binaries = { download = true },
	},
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = { globals = { "vim" } },
			telemetry = { enable = false },
		},
	},
})

vim.lsp.config("vtsls", {
	settings = {
		typescript = {
			preferences = {
				importModuleSpecifierEnding = "minimal",
				importModuleSpecifier = "non-relative",
			},
			inlayHints = {
				parameterNames = { enabled = "all" },
				parameterTypes = { enabled = true },
				variableTypes = { enabled = true },
				propertyDeclarationTypes = { enabled = true },
				enumMemberValues = { enabled = true },
				functionLikeReturnTypes = { enabled = false },
			},
			updateImportsOnFileMove = { enabled = "always" },
			suggest = {
				completeFunctionCalls = true,
			},
		},
	},
})

vim.lsp.config("tailwindcss", {})
vim.lsp.config("eslint_lsp", {})

do
	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	local prettier_d = require("efmls-configs.formatters.prettier_d")
	local eslint = require("efmls-configs.linters.eslint")

	local fixjson = require("efmls-configs.formatters.fixjson")

	local shellcheck = require("efmls-configs.linters.shellcheck")
	local shfmt = require("efmls-configs.formatters.shfmt")

	vim.lsp.config("efm", {
		filetypes = {
			"html",
			"javascript",
			"javascriptreact",
			"json",
			"jsonc",
			"lua",
			"markdown",
			"sh",
			"typescript",
			"typescriptreact",
		},
		init_options = { documentFormatting = true },
		settings = {
			languages = {
				css = { prettier_d },
				html = { prettier_d },
				javascript = { eslint, prettier_d },
				javascriptreact = { eslint, prettier_d },
				json = { eslint, fixjson },
				jsonc = { eslint, fixjson },
				lua = { luacheck, stylua },
				markdown = { prettier_d },
				sh = { shellcheck, shfmt },
				typescript = { eslint, prettier_d },
				typescriptreact = { eslint, prettier_d },
			},
		},
	})
end

vim.lsp.enable({
	"lua_ls",
	"bashls",
	"eslint",
	"tailwindcss",
	"efm",
	"vtsls",
})
