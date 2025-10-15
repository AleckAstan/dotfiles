local icons = {
	Text = "",
	Method = "󰆧",
	Function = "󰊕",
	Constructor = "",
	Field = "󰇽",
	Variable = "󰂡",
	Class = "󰠱",
	Interface = "",
	Module = "",
	Property = "󰜢",
	Unit = "",
	Value = "󰎠",
	Enum = "",
	Keyword = "󰌋",
	Snippet = "",
	Color = "󰏘",
	File = "󰈙",
	Reference = "󰈇",
	Folder = "󰉋",
	EnumMember = "",
	Constant = "󰏿",
	Struct = "",
	Event = "",
	Operator = "󰆕",
	TypeParameter = "󰅲",
}
return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"L3MON4D3/LuaSnip",
		"saadparwaiz1/cmp_luasnip",
		"hrsh7th/cmp-nvim-lsp",
		"hrsh7th/cmp-path",
		"hrsh7th/cmp-nvim-lsp-signature-help",
		"onsails/lspkind-nvim",
		"supermaven-inc/supermaven-nvim",
	},
	config = function()
		local lspkind = require("lspkind")
		lspkind.init({
			symbol_map = icons,
		})
		local cmp = require("cmp")

		vim.api.nvim_set_hl(0, "CmpItemKindMethod", { fg = "#cba6f7" }) -- purple
		vim.api.nvim_set_hl(0, "CmpItemKindVariable", { fg = "#89b4fa" }) -- blue
		vim.api.nvim_set_hl(0, "CmpItemKindClass", { fg = "#fab387" }) -- orange
		vim.api.nvim_set_hl(0, "CmpItemKindKeyword", { fg = "#f38ba8" }) -- pink
		vim.api.nvim_set_hl(0, "CmpItemAbbr", { fg = "#cdd6f4" })
		vim.api.nvim_set_hl(0, "CmpItemMenu", { fg = "#C792EA", italic = true })
		vim.api.nvim_set_hl(0, "CmpItemAbbrMatch", { fg = "#89dceb", bold = true })

		local luasnip = require("luasnip")
		luasnip.config.setup({})
		cmp.setup({
			snippet = {
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			completion = { completeopt = "menu,menuone,noinsert" },
			window = {
				completion = cmp.config.window.bordered({
					border = "single",
				}),
				winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
				documentation = cmp.config.window.bordered(),
			},
			formatting = {
				fields = { "abbr", "kind", "menu" },
				format = function(entry, vim_item)
					-- local kind = vim_item.kind
					-- vim_item.kind = icons[kind] or ""
					-- vim_item.menu = " (" .. kind .. ")"
					-- return vim_item
					local kind = require("lspkind").cmp_format({
						mode = "symbol_text",
						maxwidth = 40,
						ellipsis_char = "...",
					})(entry, vim_item)

					local strings = vim.split(kind.kind, "%s", { trimempty = true })
					kind.kind = string.format(" %s ", strings[1] or "")
					kind.menu = string.format(" (%s)", strings[2] or "")
					return kind
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<CR>"] = cmp.mapping.confirm({ select = true }),
				["<C-Space>"] = cmp.mapping.complete({}),
				["<C-l>"] = cmp.mapping(function()
					if luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					end
				end, { "i", "s" }),
				["<C-h>"] = cmp.mapping(function()
					if luasnip.locally_jumpable(-1) then
						luasnip.jump(-1)
					end
				end, { "i", "s" }),
			}),
			sources = {
				{ name = "supermaven", group_index = 2 },
				{
					name = "lazydev",
				},
				{ name = "nvim_lsp" },
				{ name = "luasnip" },
				{ name = "path" },
				{ name = "nvim_lsp_signature_help" },
			},
		})
		require("luasnip.loaders.from_lua").lazy_load({ paths = "~/.config/nvim/lua/snippets" })
	end,
}
