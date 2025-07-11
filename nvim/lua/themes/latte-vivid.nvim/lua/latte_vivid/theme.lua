-- lua/latte_vivid/theme.lua
local groups = require("latte_vivid.groups")

local function apply(group)
  for name, settings in pairs(group) do
    vim.api.nvim_set_hl(0, name, settings)
  end
end

local function load()
  apply(groups.ui)
  apply(groups.syntax)
  apply(groups.treesitter)
end

return {
  load = load
}
