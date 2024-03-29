local M = {}

M.general = {
  n = {
    ["<C-h>"] = { "<cmd> TmuxNavigateLeft<CR>", "Window left" },
    ["<C-l>"] = { "<cmd> TmuxNavigateRight<CR>", "Window right" },
    ["<C-j>"] = { "<cmd> TmuxNavigateDown<CR>", "Window down" },
    ["<C-k>"] = { "<cmd> TmuxNavigateUp<CR>", "Window up" },
    ["J"] = { "mzJ`z", "Combine lines down" },
    ["<C-d>"] = { "<C-d>zz", "Half page down" },
    ["<C-u>"] = { "<C-u>zz", "Half page up" },
    ["n"] = { "nzzzv", "Next match" },
    ["N"] = { "Nzzzv", "Previous match" },
    ["<leader>y"] = { '"+y', "Yank to clipboard" },
    ["<leader>Y"] = { '"+Y', "Yank rest of line to clipboard" },
    ["<leader>d"] = { '"_d', "Delete without yanking" },
  },
  v = {
    ["J"] = { ":m '>+1<CR>gv=gv", "Move lines down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move lines up" },
    ["<leader>y"] = { '"+y', "Yank to clipboard" },
    ["<leader>d"] = { '"_d', "Delete without yanking" },
  },
  x = {
    ["<leader>p"] = { '"_dP', "Paste without yanking" },
  },
}

M.dap = {
  plugin = true,
  n = {
    ["<leader>b"] = {
      function()
        require("dap").toggle_breakpoint()
      end,
      "Toggle breakpoint",
    },
    ["<F5>"] = {
      function()
        require("dap.ext.vscode").load_launchjs(
          nil,
          { codelldb = { "c", "cpp" }, lldb = { "c", "cpp" } }
        )
        require("dap").continue()
      end,
      "Toggle breakpoint",
    },
    ["<F10>"] = {
      function()
        require("dap").step_over()
      end,
      "Step over",
    },
    ["<F11>"] = {
      function()
        require("dap").step_into()
      end,
      "Step into",
    },
    ["<F12>"] = {
      function()
        require("dap").step_out()
      end,
      "Step out",
    },
  },
}

M.dap_python = {
  plugin = true,
  n = {
    ["<leader>dpr"] = {
      function()
        require("dap-python").test_method()
      end,
      "Test python method",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>xx"] = {
      function()
        require("trouble").toggle()
      end,
      "Toggle trouble",
    },
    ["<leader>xw"] = {
      function()
        require("trouble").toggle "workspace_diagnostics"
      end,
      "Workspace diagnostics",
    },
    ["<leader>xd"] = {
      function()
        require("trouble").toggle "document_diagnostics"
      end,
      "Document diagnostics",
    },
    ["<leader>xq"] = {
      function()
        require("trouble").toggle "quickfix"
      end,
      "Trouble quickfix",
    },
    ["<leader>xl"] = {
      function()
        require("trouble").toggle "loclist"
      end,
      "Trouble loclist",
    },
    ["gR"] = {
      function()
        require("trouble").toggle "lsp_references"
      end,
      "Trouble lsp references",
    },
  },
}

return M
