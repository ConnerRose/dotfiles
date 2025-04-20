return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = "Telescope",
    init = function()
      local builtin = require("telescope.builtin")
      local wk = require("which-key")
      wk.add({
        { "<leader>ff", builtin.find_files, desc = "Find File" },
        { "<leader>fb", builtin.buffers,    desc = "Find Buffer" },
        { "<leader>fg", builtin.live_grep,  desc = "Find with Grep" },
        { "<leader>fh", builtin.help_tags,  desc = "Find Help" },
        {
          "<leader>fn",
          ":Telescope file_browser path=%:p:help select_buffer=true<CR><Esc>",
          desc = "File Browser",
        },
      })

      vim.api.nvim_set_hl(0, "Telescope", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeMatching", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeSelection", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptPrefix", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewNormal", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePromptTitle", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopeResultsTitle", { bg = "none" })
      vim.api.nvim_set_hl(0, "TelescopePreviewTitle", { bg = "none" })
    end,
    opts = function()
      return {
        defaults = {
          vimgrep_arguments = {
            "rg",
            "-L",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
          },
          previewer = true,
          file_previewer = require("telescope.previewers").vim_buffer_cat.new,
          grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
          qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
        },
        extensions = {
          file_browser = {
            theme = "ivy",
            hijack_netrw = true,
            grouped = true,
          },
        },
        extensions_list = {
          "file_browser",
        },
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)

      -- load extensions
      for _, ext in ipairs(opts.extensions_list) do
        telescope.load_extension(ext)
      end
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },
}
