return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    local harpoon = require("harpoon")

    harpoon:setup({
      settings = {
        save_on_toggle = true,
      },
    })

    local map = vim.keymap.set
    map("n", "<leader>a", function()
      harpoon:list():add()
    end)
    map("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)
  end,
}
