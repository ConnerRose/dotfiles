local map = vim.keymap.set
map("n", "<leader>ll", ":TypstPreview<CR>", { buffer = 0 })
map({ "n", "x", "v" }, "j", "gj", { buffer = 0 })
map({ "n", "x", "v" }, "k", "gk", { buffer = 0 })

vim.opt_local.textwidth = 80
vim.opt_local.wrapmargin = 0
vim.opt_local.formatoptions:append("t")
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt_local.wrap = true
