return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  init = function()
    local harpoon = require "harpoon"

    -- REQUIRED
    harpoon:setup {
      settings = {
        save_on_toggle = true,
      },
    }
    -- REQUIRED

    vim.keymap.set("n", "<leader>a", function()
      harpoon:list():append()
    end)
    vim.keymap.set("n", "<C-e>", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end)

    vim.keymap.set("n", "<C-i>", function()
      harpoon:list():select(1)
    end)
    vim.keymap.set("n", "<C-o>", function()
      harpoon:list():select(2)
    end)
    vim.keymap.set("n", "<C-p>", function()
      harpoon:list():select(3)
    end)
    vim.keymap.set("n", "<C-[>", function()
      harpoon:list():select(4)
    end)
  end,
}
