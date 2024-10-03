return {
  {
    "folke/which-key.nvim",
    dependencies = {
      "echasnovski/mini.icons",
    },
    keys = { "<leader>", "<c-r>", "<c-w>", '"', "'", "`", "c", "v", "g" },
    cmd = "WhichKey",
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      -- wk.register({
      --   ["f"] = { name = "Find" },
      -- }, { prefix = "<leader>" })
    end,
  },
}
