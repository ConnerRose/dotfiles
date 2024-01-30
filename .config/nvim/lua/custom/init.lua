-- Enable python3 provider
for _, provider in ipairs { "python3" } do
  vim.g["loaded_" .. provider .. "_provider"] = nil
end

-- Remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  callback = function(ev)
    save_cursor = vim.fn.getpos "."
    vim.cmd [[%s/\s\+$//e]]
    vim.fn.setpos(".", save_cursor)
  end,
})

local opt = vim.opt

opt.clipboard = ""
opt.wrap = false

opt.relativenumber = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.colorcolumn = "80"

opt.spell = true
opt.spelllang = "en_us"
