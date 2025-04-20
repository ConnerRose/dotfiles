return {
  {
    "rcarriga/nvim-dap-ui",
    event = "VeryLazy",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")
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
    "mfussenegger/nvim-dap",
    config = function(_, _)
      local dap = require("dap")
      dap.adapters.codelldb = {
        type = "server",
        port = "${port}",
        executable = {
          command = "codelldb",
          args = { "--port", "${port}" },
        },
      }
      local map = vim.keymap.set
      map(
        "n",
        "<leader>db",
        dap.toggle_breakpoint,
        { desc = "Toggle breakpoint" }
      )
      map("n", "<leader>dr", function()
        require("dap.ext.vscode").load_launchjs(
          nil,
          { codelldb = { "c", "cpp" }, lldb = { "c", "cpp" } }
        )
        require("dap").continue()
      end, { desc = "Continue" })
      map("n", "<leader>do", dap.step_over, { desc = "Step over" })
      map("n", "<leader>di", dap.step_into, { desc = "Step into" })
      map("n", "<leader>du", dap.step_out, { desc = "Step out" })
    end,
  },
}
