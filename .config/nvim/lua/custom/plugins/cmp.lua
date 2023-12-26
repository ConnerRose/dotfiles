return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  config = function()
    local cmp = require "cmp"
    local opts = require "plugins.configs.cmp"

    opts.mapping["<C-p>"] = cmp.mapping.select_prev_item()
    opts.mapping["<C-n>"] = cmp.mapping.select_next_item()
    opts.mapping["<C-d>"] = cmp.mapping.scroll_docs(-4)
    opts.mapping["<C-f>"] = cmp.mapping.scroll_docs(4)
    opts.mapping["<C-Space>"] = cmp.mapping.complete()
    opts.mapping["<C-e>"] = cmp.mapping.close()
    opts.mapping["<CR>"] = nil
    opts.mapping["<C-y>"] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    }
    opts.mapping["<Tab>"] = function(fallback)
      if require("luasnip").expand_or_jumpable() then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
      else
        fallback()
      end
    end
    opts.mapping["<S-Tab>"] = function(fallback)
      if require("luasnip").jumpable(-1) then
        vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
      else
        fallback()
      end
    end

    cmp.setup(opts)
  end,
}
