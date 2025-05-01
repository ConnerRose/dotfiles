return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPost", "BufNewFile" },
  cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
  build = ":TSUpdate",
  dependencies = {
    "apple/pkl-neovim",
    "windwp/nvim-ts-autotag",
  },
  opts = {
    ensure_installed = {
      "go",
      "lua",
      "pkl",
      "rust",
      "gleam",
      "templ",
    },
    highlight = {
      enable = true,
      use_languagetree = true,
    },
    indent = { enable = true },
    autotag = {
      enable = true,
      enable_rename = true,
      enable_close = true,
      enable_close_on_slash = true,
      filetypes = { "html", "xml" },
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)

    local ts_utils = require("nvim-treesitter.ts_utils")

    local function get_node_text_under_cursor()
      local node = ts_utils.get_node_at_cursor()
      while node do
        local type = node:type()
        if
            type == "identifier"
            or type == "primitive_type"
            or type == "type_identifier"
        then
          return vim.treesitter.get_node_text(node, 0)
        end
        node = node:parent()
      end
      return nil
    end

    local function open_man_page_floating(name)
      local output = vim.fn.systemlist("man " .. name .. " | col -b")

      if vim.v.shell_error ~= 0 or #output == 0 then
        vim.notify("No man page found for: " .. name, vim.log.levels.WARN)
        return
      end

      local buf = vim.api.nvim_create_buf(false, true)
      vim.api.nvim_buf_set_lines(buf, 0, -1, false, output)
      vim.api.nvim_buf_set_option(buf, "filetype", "man")
      vim.api.nvim_buf_set_option(buf, "modifiable", false)
      vim.api.nvim_buf_set_option(buf, "bufhidden", "wipe")

      local width = math.floor(vim.o.columns * 0.8)
      local height = math.floor(vim.o.lines * 0.8)
      local row = math.floor((vim.o.lines - height) / 2)
      local col = math.floor((vim.o.columns - width) / 2)

      vim.api.nvim_open_win(buf, true, {
        relative = "editor",
        width = width,
        height = height,
        row = row,
        col = col,
        style = "minimal",
        border = "rounded",
      })
    end

    local function open_man_page_under_cursor()
      local name = get_node_text_under_cursor()
      if name then
        open_man_page_floating(name)
      else
        vim.notify("No identifier found under cursor.", vim.log.levels.WARN)
      end
    end

    vim.keymap.set(
      "n",
      "<leader>m",
      open_man_page_under_cursor,
      { desc = "Man page in floating window" }
    )
  end,
}
