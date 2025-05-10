return {
  {
    "folke/tokyonight.nvim",
    name = "tokyonight",
    priority = 1000,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    priority = 1000,
    config = function()
      vim.cmd([[colorscheme rose-pine]])
      vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "#908caa", bold = false })
      vim.api.nvim_set_hl(0, "LineNr", { fg = "#e0def4", bold = true })
      vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "#908caa", bold = false })
    end,
  },
}
