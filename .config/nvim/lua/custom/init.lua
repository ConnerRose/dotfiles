-- Enable python3 provider
for _, provider in ipairs { "python3" } do
  vim.g["loaded_" .. provider .. "_provider"] = nil
end

local opt = vim.opt

opt.clipboard = ""
opt.wrap = false

opt.relativenumber = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.colorcolumn = "80"
