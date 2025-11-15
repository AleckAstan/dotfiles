return {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
        { "williamboman/mason.nvim", config = true },
        "williamboman/mason-lspconfig.nvim",
        "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
        local lspconfig = require("lspconfig")
        local capabilities = vim.lsp.protocol.make_client_capabilities()
        local servers = {
            lua_ls = {
                settings = {
                    Lua = {
                        completion = { callSnippet = "Replace" },
                        diagnostics = { globals = { "vim" } },
                    },
                },
            },
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
                },
            },
            tailwindcss = {},
            cssls = {},
            html = {},
        }
        require("mason-lspconfig").setup({
            ensure_installed = vim.tbl_keys(servers),
            handlers = {
                function(server_name)
                    lspconfig[server_name].setup({
                        capabilities = capabilities,
                        settings = servers[server_name] and servers[server_name].settings or {},
                    })
                end,
            },
        })

        vim.diagnostic.config({
            virtual_text = true,
            underline = true,
            severity_sort = true,
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(ev)
                local opts = { buffer = ev.buf }
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local map = vim.keymap.set
                map("n", "gd", vim.lsp.buf.definition, opts)
                map("n", "gr", vim.lsp.buf.references, opts)
                map("n", "K", vim.lsp.buf.hover, opts)
                map("n", "<leader>rn", vim.lsp.buf.rename, opts)
                -- map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
                if vim.lsp.inlay_hint then
                    vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
                end
            end,
        })
    end,
}
