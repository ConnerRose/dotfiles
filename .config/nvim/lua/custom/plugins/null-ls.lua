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
        formatting.black,
        formatting.clang_format,
        formatting.latexindent,
        formatting.stylua,
        formatting.prettier,

        diagnostics.eslint,
        diagnostics.mypy,
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
