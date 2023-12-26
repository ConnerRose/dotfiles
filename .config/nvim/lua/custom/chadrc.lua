---@type ChadrcConfig
local M = {}
M.ui = {
  theme = "catppuccin",
  transparency = true,
  tabufline = {
    enabled = false,
  },
  hl_override = {
    Comment = { italic = true },
  },
}
M.plugins = "custom.plugins"
M.mappings = require "custom.mappings"
return M
