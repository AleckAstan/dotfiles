return {
	"catppuccin/nvim",
	name = "catppuccin",
	priority = 1000,
	config = function()
		require("catppuccin").setup({
			flavour = "auto",
			background = {
				light = "latte",
				dark = "macchiato",
			},
			transparent_background = true, -- disables setting the background color.
			show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
			term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
			dim_inactive = {
				enabled = false, -- dims the background color of inactive window
				shade = "transparent", -- sets the shade of the inactive window
				percentage = 0.15, -- percentage of the shade to apply to the inactive window
			},
			styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
				comments = { "italic" }, -- Change the style of comments
				conditionals = {},
				loops = {},
				functions = {},
				keywords = { "italic" },
				strings = {},
				variables = {},
				numbers = {},
				booleans = {},
				properties = {},
				types = { "italic" },
				operators = {},
				-- miscs = {}, -- Uncomment to turn off hard-coded styles
			},
			color_overrides = {
				macchiato = {
					rosewater = "#F5B8AB",
					flamingo = "#F29D9D",
					pink = "#AD6FF7",
					mauve = "#FF8F40",
					red = "#E66767",
					maroon = "#EB788B",
					peach = "#FAB770",
					yellow = "#FACA64",
					green = "#70CF67",
					teal = "#4CD4BD",
					sky = "#61BDFF",
					sapphire = "#4BA8FA",
					blue = "#00BFFF",
					lavender = "#00BBCC",
					text = "#C1C9E6",
					subtext1 = "#A3AAC2",
					subtext0 = "#8E94AB",
					overlay2 = "#7D8296",
					overlay1 = "#676B80",
					overlay0 = "#464957",
					surface2 = "#3A3D4A",
					surface1 = "#2F313D",
					surface0 = "#1D1E29",
					base = "#0b0b12",
					mantle = "#11111a",
					crust = "#191926",
				},

				latte = {
					rosewater = "#DC5E5E", -- dusty rose, vibrant but darker
					flamingo = "#E26D6D", -- strong coral
					pink = "#BA68F0", -- bold magenta-violet
					mauve = "#FF7A29", -- vibrant tangerine
					red = "#D94141", -- rich blood red
					maroon = "#D75D6F", -- deep rose
					peach = "#F89D4A", -- juicy readable peach
					yellow = "#E7B441", -- golden amber
					green = "#52B553", -- fresh green, darker for contrast
					teal = "#2EBFAF", -- saturated sea green
					sky = "#40AFFF", -- clear and legible blue
					sapphire = "#369AEF", -- softened blue
					blue = "#1A8FFF", -- strong readable azure
					lavender = "#1FBACC", -- bright cyan-turquoise
					text = "#2C2F42", -- dark slate for readable body text
					subtext1 = "#44475E",
					subtext0 = "#5E617A",
					overlay2 = "#7A7D92",
					overlay1 = "#A1A4B8",
					overlay0 = "#C5C7D6",
					surface2 = "#E2E4ED", -- subtle light gray-violet
					surface1 = "#EBEDF2",
					surface0 = "#F3F4F8",
					base = "#F8F9FB", -- gentle off-white
					mantle = "#F0F1F5",
					crust = "#E6E7EC",
				},
			},
			highlight_overrides = {
				all = function(colors)
					return {
						CurSearch = { bg = colors.sky },
						IncSearch = { bg = colors.sky },
						CursorLineNr = { fg = colors.blue, style = { "bold" } },
						DashboardFooter = { fg = colors.overlay0 },
						TreesitterContextBottom = { style = {} },
						WinSeparator = { fg = colors.overlay0, style = { "bold" } },
						["@markup.italic"] = { fg = colors.blue, style = { "italic" } },
						["@markup.strong"] = { fg = colors.blue, style = { "bold" } },
						Headline = { style = { "bold" } },
						Headline1 = { fg = colors.blue, style = { "bold" } },
						Headline2 = { fg = colors.pink, style = { "bold" } },
						Headline3 = { fg = colors.lavender, style = { "bold" } },
						Headline4 = { fg = colors.green, style = { "bold" } },
						Headline5 = { fg = colors.peach, style = { "bold" } },
						Headline6 = { fg = colors.flamingo, style = { "bold" } },
						rainbow1 = { fg = colors.blue, style = { "bold" } },
						rainbow2 = { fg = colors.pink, style = { "bold" } },
						rainbow3 = { fg = colors.lavender, style = { "bold" } },
						rainbow4 = { fg = colors.green, style = { "bold" } },
						rainbow5 = { fg = colors.peach, style = { "bold" } },
						rainbow6 = { fg = colors.flamingo, style = { "bold" } },
					}
				end,
			},
			custom_highlights = function(C)
				return {
					CmpItemKindSnippet = { fg = C.base, bg = C.mauve },
					CmpItemKindKeyword = { fg = C.base, bg = C.red },
					CmpItemKindText = { fg = C.base, bg = C.teal },
					CmpItemKindMethod = { fg = C.base, bg = C.blue },
					CmpItemKindConstructor = { fg = C.base, bg = C.blue },
					CmpItemKindFunction = { fg = C.base, bg = C.blue },
					CmpItemKindFolder = { fg = C.base, bg = C.blue },
					CmpItemKindModule = { fg = C.base, bg = C.blue },
					CmpItemKindConstant = { fg = C.base, bg = C.peach },
					CmpItemKindField = { fg = C.base, bg = C.green },
					CmpItemKindProperty = { fg = C.base, bg = C.green },
					CmpItemKindEnum = { fg = C.base, bg = C.green },
					CmpItemKindUnit = { fg = C.base, bg = C.green },
					CmpItemKindClass = { fg = C.base, bg = C.yellow },
					CmpItemKindVariable = { fg = C.base, bg = C.flamingo },
					CmpItemKindFile = { fg = C.base, bg = C.blue },
					CmpItemKindInterface = { fg = C.base, bg = C.yellow },
					CmpItemKindColor = { fg = C.base, bg = C.red },
					CmpItemKindReference = { fg = C.base, bg = C.red },
					CmpItemKindEnumMember = { fg = C.base, bg = C.red },
					CmpItemKindStruct = { fg = C.base, bg = C.blue },
					CmpItemKindValue = { fg = C.base, bg = C.peach },
					CmpItemKindEvent = { fg = C.base, bg = C.blue },
					CmpItemKindOperator = { fg = C.base, bg = C.blue },
					CmpItemKindTypeParameter = { fg = C.base, bg = C.blue },
					CmpItemKindCopilot = { fg = C.base, bg = C.teal },
				}
			end,
			default_integrations = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				fzf = true,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		})

		vim.cmd.colorscheme("catppuccin")
	end,
}
