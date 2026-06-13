local map = vim.keymap.set
map("n", "<leader>ll", ":TypstPreview<CR>", { buffer = 0 })
map({ "n", "x", "v" }, "j", "gj", { buffer = 0 })
map({ "n", "x", "v" }, "k", "gk", { buffer = 0 })
map("n", "<leader>fm", function()
  local file = vim.fn.expand("%:p")
  if file == "" then
    return
  end
  vim.cmd("silent !typstyle -i " .. vim.fn.shellescape(file))
  vim.cmd("edit!")
end, { buffer = true, desc = "Format Typst file with typstyle" })

vim.opt_local.textwidth = 80
vim.opt_local.wrapmargin = 0
vim.opt_local.formatoptions:append("t")
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt_local.wrap = true
