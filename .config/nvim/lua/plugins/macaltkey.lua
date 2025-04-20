return {
  "clvnkhr/macaltkey.nvim",
  config = function()
    local mak = require("macaltkey")
    mak.keymap.set("n", "<a-i>", "bi", { desc = "Insert before word" })
    mak.keymap.set("n", "<a-a>", "ea", { desc = "Insert after word" })
    mak.keymap.set("n", "<c-i>", "Bi", { desc = "Insert before Word" })
    mak.keymap.set("n", "<c-a>", "Ea", { desc = "Insert after Word" })
    mak.setup()
  end,
}
