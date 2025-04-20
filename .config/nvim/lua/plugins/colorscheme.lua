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
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
    end,
  },
}
