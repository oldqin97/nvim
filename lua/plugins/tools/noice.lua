-- 增强的命令行 UI（通知、输入框美化）
return {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = { { "<c-f>", false }, { "<c-b>", false } },
  opts = {
    views = {
      cmdline_popup = {
        position = { row = 5, col = "50%" },
        size = { width = 60, height = "auto" },
      },
    },
    cmdline = {
      enabled = true,
      opts = {},
      view = "cmdline_popup",
    },
    smart_move = {
      enabled = true,
      excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "vim-doge" },
    },
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
      view_search = "virtualtext",
    },
    lsp = {
      progress = { enabled = true },
      hover = { enabled = true },
      signature = { enabled = false },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
        ["vim.lsp.util.stylize_markdown"] = true,
        ["cmp.entry.get_documentation"] = true,
      },
    },
    notify = {
      enabled = true,
      view = "notify",
    },
    -- 消息路由：过滤不需要显示的噪音消息
    routes = {
      {
        filter = {
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "No information available" },
            { find = "AutoSave: saved at %d+:%d+:%d+" },
            { find = "Exited Visual-Multi." },
            { find = "^少了 %d+ 行$" },
            { find = "^%d+ more lines$" },
            { find = "^%d+ fewer lines$" },
            { find = "^%d+ lines yanked$" },
            { find = "Plugin Updates" },
          },
        },
        opts = { stop = true },
      },
      -- 跳过 null-ls 的 LSP 进度消息
      {
        filter = { event = "lsp", kind = "progress", cond = function(message) local client = vim.tbl_get(message.opts, "progress", "client"); return client == "null-ls" end },
        opts = { skip = true },
      },
      -- 跳过 ltex 的 LSP 进度消息
      {
        filter = { event = "lsp", kind = "progress", cond = function(message) local client = vim.tbl_get(message.opts, "progress", "client"); return client == "ltex" end },
        opts = { skip = true },
      },
    },
    presets = {
      bottom_search = false,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
      lsp_doc_border = false,
    },
  },
}
