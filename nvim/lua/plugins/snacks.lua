local logo = [[
                                                                         
	 ██████   █████                   █████   █████  ███                  
	░░██████ ░░███                   ░░███   ░░███  ░░░                   
	 ░███░███ ░███   ██████   ██████  ░███    ░███  ████  █████████████   
	 ░███░░███░███  ███░░███ ███░░███ ░███    ░███ ░░███ ░░███░░███░░███  
	 ░███ ░░██████ ░███████ ░███ ░███ ░░███   ███   ░███  ░███ ░███ ░███  
	 ░███  ░░█████ ░███░░░  ░███ ░███  ░░░█████░    ░███  ░███ ░███ ░███  
	 █████  ░░█████░░██████ ░░██████     ░░███      █████ █████░███ █████ 
	░░░░░    ░░░░░  ░░░░░░   ░░░░░░       ░░░      ░░░░░ ░░░░░ ░░░ ░░░░░  
	]]
local nvimLogo = [[


          -%#.             -#:          
        -#@@@%:            -@@*:        
      -#@@@@@@@=           -@@@@*:      
   .-:*@@@@@@@@@*.         -@@@@@@*:    
   =++-=@@@@@@@@@#:        -@@@@@@@@-   
   +-.=+-%@@@@@@@@@-       -@@@@@@@@+   
   +-  -+-*@@@@@@@@@+.     -@@@@@@@@=   
   +-   .+==@@@@@@@@@#:    -@@@@@@@@+   
   +-    .=+-%@@@@@@@@%-   -@@@@@@@@+   
   +-      #..#@@@@@@@@@+. -@@@@@@@@+   
   +-      *: .+@@@@@@@@@#.:@@@@@@@@+   
   +-      *:   -@@@@@@@@@%-*@@@@@@@+   
   +-      *:    :#@@@@@@@@@==@@@@@@+   
   +-      *:     .+@@@@@@@@@*-%@@@@+   
   +-      *:       =@@@@@@@@@%-*@@@+   
   =+.     *:        :#@@@@@@@@@==@@=   
   .-+-.   *:         .*@@@@@@@@@+--.   
     .-+-. *:           =@@@@@@@#-      
       .-+-#:            :%@@@#-        
         .-#.             .#%-          
]]
logo = string.rep("\n", 4) .. logo .. "\n\n"
nvimLogo = string.rep("\n", 4) .. nvimLogo .. "\n\n"

return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
      explorer = {
        enabled = true,
      },
      picker = {
        enabled = true,
        ---@class snacks.picker.sources.Config
        sources = {
          files = {
            hidden = true, -- show hidden files
            follow = true,
            ignored = true,
          },
          explorer = {
            layout = {
              preset = "default",
              layout = {
                position = "right",
                width = 0.2,
                -- box = "vertical",
                -- border = "none",
              },
            },
            actions = {
              select = {
                ["<CR>"] = "edit", -- Open file normally
                ["<C-x>"] = "split", -- Open file in a horizontal split
                ["<C-v>"] = "vsplit", -- Open file in a vertical split
              },
            },
            files = {
              hidden = true, -- show hidden files
              follow = true,
              ignored = true,
            },
          },
        },
        -------@class snacks.picker.layout.Config
        layout = {
          preset = "telescope",
        },
        win = {
          input = {
            keys = {
              -- Close picker
              ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
      },
      dashboard = {
        enabled = true,
        preset = {
          -- header = nvimLogo,
          header = logo,
        },
        sections = {
          { section = "header" },
          { section = "keys", gap = 1, padding = 1 },
          { icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
          section = "terminal",
          {
            icon = " ",
            title = "Git Status",
            enabled = function()
              return Snacks.git.get_root() ~= nil
            end,
            cmd = "git status --short --branch --renames",
            height = 5,
            padding = 1,
            ttl = 5 * 60,
            indent = 3,
          },
        },
      },
    },
  },
}
