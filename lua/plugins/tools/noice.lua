return {
  "folke/noice.nvim",
  event = "VeryLazy",
  keys = { { "<c-f>", false }, { "<c-b>", false } },
  opts = {
    views = {
      cmdline_popup = {
        position = {
          row = 5,
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
      },
    },
    cmdline = {
      enabled = true, -- 启用 cmdline
      opts = {}, -- 使用默认设置
      view = "cmdline_popup", -- 使用默认 cmdline 显示
      -- view = "cmdline_popup", -- 使用默认 cmdline 显示
      -- 过滤指定命令，不显示浮动命令行，直接执行
      -- format = {
      --   cmdline = { pattern = "^:", icon = ">", conceal = false, view = "cmdline" }, -- 保持浮动显示
      --   search_down = { kind = "search", pattern = "^/", icon = "🔍⌄", lang = "regex" },
      --   search_up = { kind = "search", pattern = "^%?", icon = "🔍⌃", lang = "regex" },
      --   -- 禁用某些命令的 cmdline 浮动显示
      --   filter_cmd = { pattern = "^:!.*", icon = "", conceal = true, view = "mini" }, -- 例如，不显示外部命令 (:! 开头的)
      --   -- 禁用特定命令
      --   disable_cmd = { pattern = "^:SomeCmd", icon = "", conceal = true }, -- 将 ':SomeCmd' 禁止 cmdline 浮动
      -- },
    },
    smart_move = {
      enabled = true,
      excluded_filetypes = { "cmp_menu", "cmp_docs", "notify", "vim-doge" },
    },
    lsp = {
      progress = {
        enabled = true,
      },
      hover = {
        enabled = false,
      },
      signature = {
        enabled = false,
      },
      override = {
        ["vim.lsp.util.convert_input_to_markdown_lines"] = false,
        ["vim.lsp.util.stylize_markdown"] = false,
        ["cmp.entry.get_documentation"] = false,
      },
    },
    notify = {
      enabled = false,
      view = "notify",
    },
    routes = {
      {
        filter = {
          any = {
            { find = "%d+L, %d+B" },
            { find = "; after #%d+" },
            { find = "; before #%d+" },
            { find = "No information available" },
            { find = "AutoSave: saved at %d+:%d+:%d+" },
            { find = "Failed to attach to volar for current buffer. Already attached to html" },
            { find = "Failed to attach to html for current buffer. Already attached to volar" },
            { find = "Exited Visual-Multi." },
            { find = "^少了 %d+ 行$" },
            { find = "^%d+ more lines$" },
            { find = "^%d+ fewer lines$" },
            { find = "^%d+ lines yanked$" },
            -- { find = "is not attached to client" },
            -- { find = "Client with id" },
            -- {
            --   cond = function(message)
            --     local client = vim.tbl_get(message.opts, "progress", "client")
            --     return client == "null-ls"
            --   end,
            -- },
          },
        },
        opts = { stop = true },
      },
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progress", "client")
            return client == "null-ls"
          end,
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = "lsp",
          kind = "progress",
          cond = function(message)
            local client = vim.tbl_get(message.opts, "progress", "client")
            return client == "ltex"
          end,
        },
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
