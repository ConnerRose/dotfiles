---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "catppuccin",
  transparency = true,
  tabufline = {
    enabled = false,
  },
  hl_override = {
    Comment = { italic = true, fg = "light_grey" },
    LineNr = { fg = "light_grey" },
    CursorLineNr = { bold = true, fg = "white" },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
