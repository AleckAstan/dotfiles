return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{ "williamboman/mason.nvim", opts = {} },
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		"hrsh7th/cmp-nvim-lsp",
	},
	config = function()
		local lspconfig = require("lspconfig")
		local cmp_nvim_lsp = require("cmp_nvim_lsp")
		local capabilities = cmp_nvim_lsp.default_capabilities()
		lspconfig.sourcekit.setup({
			capabilities = capabilities,
		})
		vim.api.nvim_create_autocmd("LspAttach", {
			group = vim.api.nvim_create_augroup("kickstart-lsp-attach", { clear = true }),
			callback = function(event)
				local map = function(keys, func, desc, mode)
					mode = mode or "n"
					vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
				end

				map("gI", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
				map("<leader>D", require("telescope.builtin").lsp_type_definitions, "Type [D]efinition")
				map("<leader>ds", require("telescope.builtin").lsp_document_symbols, "[D]ocument [S]ymbols")
				map("<leader>ws", require("telescope.builtin").lsp_dynamic_workspace_symbols, "[W]orkspace [S]ymbols")
				map("gD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
				-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
				---@param client vim.lsp.Client
				---@param method vim.lsp.protocol.Method
				---@param bufnr? integer some lsp support methods only in specific files
				---@return boolean
				local function client_supports_method(client, method, bufnr)
					return client.supports_method(method, { bufnr = bufnr })
				end
				local client = vim.lsp.get_client_by_id(event.data.client_id)
				-- Intégration avec nvim-lsp-file-operations
				local status_ok, file_operations = pcall(require, "nvim-lsp-file-operations")
				if status_ok then
					file_operations.on_attach(client)
				end
				if
					client
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
				then
					local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
					vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.document_highlight,
					})

					vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
						buffer = event.buf,
						group = highlight_augroup,
						callback = vim.lsp.buf.clear_references,
					})

					vim.api.nvim_create_autocmd("LspDetach", {
						group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
						callback = function(event2)
							vim.lsp.buf.clear_references()
							vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
						end,
					})
				end

				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					map("<leader>th", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "[T]oggle Inlay [H]ints")
				end
			end,
		})

		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		local capabilities = vim.lsp.protocol.make_client_capabilities()
		capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())
		local servers = {
			-- ts_ls = {
			-- 	filetypes = {
			-- 		"javascript",
			-- 		"javascriptreact",
			-- 		"javascript.jsx",
			-- 		"typescript",
			-- 		"typescriptreact",
			-- 		"typescript.tsx",
			-- 	},
			-- 	init_options = {
			-- 		preferences = {
			-- 			includeCompletionsForModuleExports = true,
			-- 			includeCompletionsForImportStatements = true,
			-- 			importModuleSpecifierPreference = "non-relative",
			-- 		},
			-- 	},
			-- 	settings = {
			-- 		-- all the other stuff …
			-- 		typescript = {
			-- 			inlayHints = {
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			-- 				includeInlayFunctionParameterTypeHints = true,
			-- 				includeInlayVariableTypeHints = true,
			-- 				includeInlayPropertyDeclarationTypeHints = true,
			-- 				includeInlayEnumMemberValueHints = true,
			-- 				includeInlayFunctionLikeReturnTypeHints = false,
			-- 			},
			-- 			updateImportsOnFileMove = { enabled = "always" },
			-- 			suggest = { completeFunctionCalls = true },
			-- 		},
			-- 		javascript = {
			-- 			inlayHints = {
			-- 				includeInlayParameterNameHints = "all",
			-- 				includeInlayParameterNameHintsWhenArgumentMatchesName = false,
			-- 			},
			-- 		},
			-- 	},
			-- },
			vtsls = {
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescriptreact",
					"typescript.tsx",
				},
				init_options = {
					disableSuggestions = false,
					hostInfo = "neovim",
					maxTsServerMemory = 4096,
					preferences = {
						includeCompletionsForModuleExports = true,
						includeCompletionsForImportStatements = true,
						importModuleSpecifierPreference = "non-relative",
					},
				},
				settings = {
					typescript = {
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
					javascript = {
						inlayHints = {
							parameterNames = { enabled = "all" },
							parameterTypes = { enabled = false }, -- Not specified in your original config
							variableTypes = { enabled = false }, -- Not specified either
							functionLikeReturnTypes = { enabled = false }, -- safe default
							propertyDeclarationTypes = { enabled = false },
							enumMemberValues = { enabled = false },
						},
					},
					vtsls = {
						enableMoveToFileCodeAction = true,
					},
				},
			},
			lua_ls = {
				settings = {
					Lua = {
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			},
		}

		local ensure_installed = vim.tbl_keys(servers or {})
		vim.list_extend(ensure_installed, {
			"stylua",
			"tailwindcss",
			"css-lsp",
			"prettier",
			"vtsls",
			-- "ts_ls",
		})
		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = {}, -- explicitly set to an empty table (Kickstart populates installs via mason-tool-installer)
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = servers[server_name] or {}
					server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
