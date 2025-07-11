-- lua/latte_vivid/groups.lua
local c = require("latte_vivid.palette").colors

local M = {}

M.syntax = {
  Comment        = { fg = c.comment, italic = true },
  String         = { fg = c.orange },
  Number         = { fg = c.teal },
  Boolean        = { fg = c.red },
  Keyword        = { fg = c.magenta, bold = true },
  Function       = { fg = c.blue },
  Constant       = { fg = c.yellow },
  Identifier     = { fg = c.fg },
  Type           = { fg = c.green },
  Operator       = { fg = c.magenta },
}

M.ui = {
  Normal         = { fg = c.fg, bg = c.bg },
  LineNr         = { fg = c.muted },
  CursorLine     = { bg = c.surface },
  Visual         = { bg = c.surface },
  StatusLine     = { fg = c.fg, bg = c.surface },
  Pmenu          = { fg = c.fg, bg = c.surface },
}

M.treesitter = {
  ["@comment"]     = M.syntax.Comment,
  ["@string"]      = M.syntax.String,
  ["@number"]      = M.syntax.Number,
  ["@boolean"]     = M.syntax.Boolean,
  ["@function"]    = M.syntax.Function,
  ["@keyword"]     = M.syntax.Keyword,
  ["@type"]        = M.syntax.Type,
  ["@constant"]    = M.syntax.Constant,
  ["@variable"]    = M.syntax.Identifier,
  ["@operator"]    = M.syntax.Operator,
}

return M
