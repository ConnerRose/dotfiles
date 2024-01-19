return {
  -- "jose-elias-alvarez/null-ls.nvim",
  "nvimtools/none-ls.nvim",
  event = "VeryLazy",
  opts = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require "null-ls"

    local formatting = null_ls.builtins.formatting
    local diagnostics = null_ls.builtins.diagnostics

    return {
      sources = {
        formatting.black.with {
          extra_args = { "--config", vim.fn.expand "~/.config/black" },
        },
        formatting.clang_format,
        formatting.djlint.with {
          extra_args = { "--indent", 2 },
        },
        formatting.isort,
        formatting.latexindent,
        formatting.stylua,
        formatting.prettier.with {
          disabled_filetypes = { "jinja.html" },
        },

        diagnostics.djlint,
        diagnostics.eslint,
        diagnostics.mypy.with {
          extra_args = function()
            local virtual = os.getenv "VIRTUAL_ENV" or os.getenv "CONDA_PREFIX"
            if virtual then
              return {
                "--python-executable",
                virtual .. "/bin/python3",
              }
            end
            return {
              "--python-executable",
              "~/.pyenv/shims/python3",
            }
          end,
        },
        diagnostics.ruff,
      },
      on_attach = function(client, bufnr)
        if client.supports_method "textDocument/formatting" then
          vim.api.nvim_clear_autocmds {
            group = augroup,
            buffer = bufnr,
          }
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format { bufnr = bufnr }
            end,
          })
        end
      end,
    }
  end,
}
