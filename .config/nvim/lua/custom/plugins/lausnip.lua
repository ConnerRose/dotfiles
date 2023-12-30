return {
  -- snippet plugin
  "L3MON4D3/LuaSnip",
  dependencies = "rafamadriz/friendly-snippets",
  opts = {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    exclude = { "tex" },
  },
  config = function(_, opts)
    require("plugins.configs.others").luasnip(opts)
  end,
}
