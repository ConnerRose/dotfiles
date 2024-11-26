return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  opts = function()
    local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
    local null_ls = require("null-ls")

    return {
      sources = {
        null_ls.builtins.formatting.black,
        null_ls.builtins.formatting.clang_format,
        null_ls.builtins.formatting.golines,
        null_ls.builtins.formatting.goimports_reviser,
        require("none-ls.formatting.latexindent").with({
          extra_args = { "-m" },
        }),
        null_ls.builtins.formatting.prettier,
        null_ls.builtins.formatting.stylua,
        -- require("none-ls.diagnostics.eslint_d").with({
        --   name = "eslint_d",
        --   meta = {
        --     url = "https://github.com/mantoni/eslint_d.js/",
        --     description = "Like ESLint, but faster.",
        --     notes = {
        --       "Once spawned, server will continue to run in the background.",
        --     },
        --   },
        --   command = "eslint_d",
        -- }),
      },
      on_attach = function(client, bufnr)
        if client.supports_method("textDocument/formatting") then
          vim.api.nvim_clear_autocmds({
            group = augroup,
            buffer = bufnr,
          })
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({ bufnr = bufnr })
            end,
          })
        end
      end,
    }
  end,
}
