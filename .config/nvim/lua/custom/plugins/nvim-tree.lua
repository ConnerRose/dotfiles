return {
  "nvim-tree/nvim-tree.lua",
  init = function()
    require("core.utils").load_mappings "nvimtree"
  end,
  opts = function()
    return require "plugins.configs.nvimtree"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "nvimtree")
    opts.sort = {}
    opts.sort.sorter = "extension"
    require("nvim-tree").setup(opts)
  end,
}
