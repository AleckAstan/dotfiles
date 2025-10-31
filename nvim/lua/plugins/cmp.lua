return {
	"saghen/blink.cmp",
	dependencies = {
		"rafamadriz/friendly-snippets",
		"onsails/lspkind.nvim",
	},
	version = "1.*",
	opts = {
		keymap = {
			preset = "default",
			["<CR>"] = { "accept", "fallback" },
			-- ["<Tab>"] = {
			-- 	function(cmp)
			-- 		return cmp.select_next()
			-- 	end,
			-- 	"snippet_forward",
			-- 	"fallback",
			-- },
			-- ["<S-Tab>"] = {
			-- 	function(cmp)
			-- 		return cmp.select_prev()
			-- 	end,
			-- 	"snippet_backward",
			-- 	"fallback",
			-- },
		},
		appearance = {
			use_nvim_cmp_as_default = true,
			nerd_font_variant = "mono",
		},

		sources = {
			default = { "lsp", "path", "snippets", "buffer" },
			compat = { "supermaven" },
			providers = {
				supermaven = {
					name = "supermaven",
					module = "blink.compat.source",
					score_offset = 3,
				},
			},
		},

		completion = {
			accept = { auto_brackets = { enabled = false } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				treesitter_highlighting = true,
				window = { border = "rounded" },
			},

			menu = {
				border = "rounded",
				draw = {
					columns = {
						{ "kind_icon", "label", gap = 1 },
						{ "kind" },
					},
					components = {
						kind_icon = {
							text = function(item)
								local kind = require("lspkind").symbol_map[item.kind] or ""
								return kind .. " "
							end,
							highlight = "CmpItemKind",
						},
						label = {
							text = function(item)
								return item.label
							end,
							highlight = "CmpItemAbbr",
						},
						kind = {
							text = function(item)
								return item.kind
							end,
							highlight = "CmpItemKind",
						},
					},
				},
			},
		},
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},
	},
}
