return {
  "neovim/nvim-lspconfig",
  config = function()
    local base = require "plugins.configs.lspconfig"

    local on_attach = base.on_attach
    local capabilities = base.capabilities

    local lspconfig = require "lspconfig"

    lspconfig.pyright.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "python" },
      settings = {
        python = {
          analysis = {
            typeCheckingMode = "off",
          },
        },
      },
    }

    lspconfig.clangd.setup {
      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end,
      capabilities = capabilities,
      cmd = {
        "clangd",
        "--offset-encoding=utf-16",
      },
    }

    lspconfig.tsserver.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      init_options = {
        preferences = {
          disableSuggestions = true,
        },
      },
    }

    lspconfig.bashls.setup {
      on_attach = on_attach,
      capabilities = capabilities,
      filetypes = { "sh", "bash" },
    }
  end,
}
