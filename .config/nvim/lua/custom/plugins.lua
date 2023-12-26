local plugins = {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = "mfussenegger/nvim-dap",
    config = function()
      local dap = require "dap"
      local dapui = require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "mfussenegger/nvim-dap",
    config = function(_, _)
      require("core.utils").load_mappings "dap"
    end,
  },
  {
    "mfussenegger/nvim-dap-python",
    ft = "python",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, _)
      local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      require("dap-python").setup(path)
      require("core.utils").load_mappings "dap_python"
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    -- "jose-elias-alvarez/null-ls.nvim",
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "black",
        "clang-format",
        "clangd",
        "codelldb",
        "debugpy",
        "latexindent",
        "lua-language-server",
        "mypy",
        "pyright",
        "ruff",
        "stylua",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    init = function()
      local harpoon = require "harpoon"

      -- REQUIRED
      harpoon:setup()
      -- REQUIRED

      vim.keymap.set("n", "<leader>a", function()
        harpoon:list():append()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

      vim.keymap.set("n", "<C-i>", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<C-o>", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<C-p>", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<C-[>", function()
        harpoon:list():select(4)
      end)
    end,
  },
  {
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
  },
  {
    "SirVer/ultisnips",
    lazy = false,
    init = function()
      vim.g.UltiSnipsExpandTrigger = "<tab>"
      vim.g.UltiSnipsJumpForwardTrigger = "<tab>"
      vim.g.UltiSnipsJumpBackwardTrigger = "<s-tab>"
      vim.g.UltiSnipsSnippetDirectories = { "~/.config/UltiSnips/" }
    end,
  },
  {
    "lervag/vimtex",
    dependencies = {
      "xuhdev/vim-latex-live-preview",
    },
    ft = { "tex" },
    config = function()
      vim.cmd [[
        "
        " let g:vimtex_compiler_progname = "nvr"
        " let g:vimtex_view_method = "skim"
        " let g:vimtex_imaps_enabled = 0           
        " let g:vimtex_complete_enabled = 0        
        "
        " call vimtex#init()
        "
        " set conceallevel=2
        " let g:vimtex_syntax_conceal["math_super_sub"]=0
        " highlight Conceal guifg=#d19a66 guibg=NONE
        "

        " autocmd FileType tex nmap <buffer> <C-T> :!latexmk -pvc -pdf %<CR>
        " let g:latexindent_opt = '-m -y="~/.indentconfig.yaml"'
        let maplocalleader = " "
        let g:tex_flavor='latex'
        let g:vimtex_view_method='skim'
        let g:vimtex_quickfix_mode=0
        set conceallevel=1
        let g:tex_conceal='abdmg'

        augroup vimtex_config
        au!
        au User VimtexEventQuit call vimtex#compiler#clean(0)
        augroup END
        ]]
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },
}
return plugins
