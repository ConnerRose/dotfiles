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
        { "<leader>fb", builtin.buffers, desc = "Find Buffer" },
        { "<leader>fg", builtin.live_grep, desc = "Find with Grep" },
        { "<leader>fh", builtin.help_tags, desc = "Find Help" },
        { "<leader>fq", builtin.quickfix, desc = "Find Quickfix" },
        {
          "<leader>fr",
          builtin.lsp_references,
          desc = "Find LSP References",
        },
        {
          "<leader>fd",
          builtin.diagnostics,
          desc = "Find Diagnostics",
        },
        {
          "<leader>fi",
          builtin.lsp_implementations,
          desc = "Find LSP Implementations",
        },
        { "<leader>fs", builtin.treesitter, desc = "Find Symbols" },
      })
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
      }
    end,
    config = function(_, opts)
      local telescope = require("telescope")
      telescope.setup(opts)
    end,
  },
}
