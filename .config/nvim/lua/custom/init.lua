-- Enable python3 provider
for _, provider in ipairs { "python3" } do
  vim.g["loaded_" .. provider .. "_provider"] = nil
end

local opt = vim.opt

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "tex",
--   callback = function()
--     opt.shiftwidth = 4
--     opt.tabstop = 4
--     opt.softtabstop = 4
--     require("cmp").setup.buffer { enabled = false }
--   end,
-- })

opt.clipboard = ""
opt.wrap = false

opt.relativenumber = true

opt.hlsearch = false
opt.incsearch = true

opt.termguicolors = true

opt.colorcolumn = "80"
