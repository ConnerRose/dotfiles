vim.g.mapleader = " "
vim.g.maplocalleader = " "

local o = vim.opt

o.scrolloff = 10
o.number = true
o.relativenumber = true
o.tabstop = 2
o.expandtab = true
o.softtabstop = 2
o.shiftwidth = 2
o.mouse = "a"
o.undofile = true
o.ignorecase = true
o.smartcase = true
o.signcolumn = "yes"
o.spell = true
o.spelllang = "en_us"
o.wrap = false
o.cmdheight = 0
o.winborder = "rounded"

local map = vim.keymap.set

map("n", "J", "mzJ`z", { desc = "Combine lines down" })
map("n", "<C-d>", "<C-d>zz", { desc = "Half page down" })
map("n", "<C-u>", "<C-u>zz", { desc = "Half page up" })
map("n", "n", "nzzzv", { desc = "Next match" })
map("n", "N", "Nzzzv", { desc = "Previous match" })
map({ "n", "v" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
map("n", "<leader>Y", '"+Y', { desc = "Yank line to clipboard" })
map({ "n", "v" }, "<leader>d", '"_d', { desc = "Delete without yanking" })
map("x", "<leader>p", '"_dP', { desc = "Paste without yanking" })
map("n", "<leader>o", "<CMD>Oil --float<CR>", { desc = "Open Oil" })

vim.lsp.enable({
  "lua_ls",
  "clangd",
  "tinymist",
})

map("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format buffer" })
map("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
map("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
map("n", "gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
map("n", "gt", vim.lsp.buf.type_definition, { desc = "Go to type definition" })
map("n", "gr", vim.lsp.buf.references, { desc = "Show references" })
map("n", "<leader>ra", vim.lsp.buf.rename, { desc = "Rename symbol" })
map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })

vim.pack.add({
  "https://github.com/rose-pine/neovim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-mini/mini.nvim",
  "https://github.com/benomahony/oil-git.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-lualine/lualine.nvim",
  "https://github.com/nvim-lua/plenary.nvim",
  "https://github.com/nvim-telescope/telescope.nvim",
  "https://github.com/chomosuke/typst-preview.nvim",
  {
    src = "https://github.com/saghen/blink.cmp",
    version = vim.version.range("^1")
  },
  "https://github.com/christoomey/vim-tmux-navigator",
  "https://github.com/lewis6991/gitsigns.nvim",
})

local builtin = require("telescope.builtin")
map("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
map("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
map("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
map("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

require("rose-pine").setup({
  styles = {
    transparency = true,
  },
  highlight_groups = {
    NormalFloat = { bg = "#191723" },
    FloatBorder = { bg = "#191723" },
    FloatTitle = { bg = "#191723" },
    BlinkCmpMenu = { bg = "#191723" },
    BlinkCmpMenuBorder = { bg = "#191723" },
    BlinkCmpDocBorder = { bg = "#21202e" },
  }
})

require("nvim-treesitter").setup({
  ensure_installed = {
    "cpp",
    "lua",
  },
})

require("mini.icons").setup()
require("mini.pairs").setup()
require("mini.comment").setup({
  mappings = {
    comment = "<leader>/",
    comment_line = "<leader>/",
    comment_visual = "<leader>/",
    textobject = "<leader>/",
  }
})
require("mini.move").setup({
  mappings = {
    left = "",
    right = "",
    down = "J",
    up = "K",
  },
})

require("oil").setup({
  columns = {
    "icon",
    "permissions",
  },
  view_options = {
    show_hidden = true,
  },
})

require("nvim-web-devicons").setup()

require("lualine").setup({
  options = {
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "diff", "diagnostics" },
    lualine_c = { "filename" },
    lualine_x = { "lsp_status" },
    lualine_y = { "branch" },
    lualine_z = { "location" },
  },
})

require("blink.cmp").setup({
  signature = { enabled = true },
})

require("gitsigns").setup()

vim.cmd("colorscheme rose-pine")
