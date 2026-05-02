-- blink.cmp 补全详细配置：按键映射、外观、模糊搜索、签名提示、补全菜单、补全源、命令行补全
return {
  -- 补全快捷键映射
  keymaps = {
    ["<Tab>"] = {
      function(cmp)
        if cmp.is_visible() then
          return cmp.select_and_accept()
        end
        local supermaven = require("supermaven-nvim.completion_preview")
        if supermaven.has_suggestion() then
          vim.schedule(supermaven.on_accept_suggestion)
          return true
        end
      end,
      "fallback",
    },
    ["<C-p>"] = { "scroll_documentation_up", "fallback" },
    ["<C-n>"] = { "scroll_documentation_down", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },

  -- 外观配置
  appearance = {
    nerd_font_variant = "normal",
    kind_icons = {
      Snippet = "󰩫",
      Emoji = "󰞅",
      Math = "",
      Dic = "",
      Css = "",
      String = "",
      AI = "",
    },
  },

  -- 模糊匹配排序
  fuzzy = {
    sorts = {
      "exact",
      "score",
      "sort_text",
    },
  },

  -- 函数签名提示窗口配置
  signature = {
    enabled = true,
    window = {
      min_width = 20,
      max_width = 80,
      max_height = 8,
      border = "rounded",
      winblend = 0,
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      scrollbar = false,
      treesitter_highlighting = true,
      show_documentation = true,
    },
  },

  -- 补全菜单配置
  completion = {
    menu = {
      draw = {
        treesitter = { "lsp" },
        components = {},
        columns = { { "kind_icon" }, { "label", "label_description", gap = 1 }, { "kind" } },
      },
      scrollbar = false,
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      draw = function(opts)
        opts.default_implementation(opts)
      end,
      window = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
      },
    },

    accept = {
      auto_brackets = {
        enabled = true,
        semantic_token_resolution = {
          enabled = true,
          blocked_filetypes = { "java", "vue" },
          timeout_ms = 400,
        },
      },
    },
    list = {
      max_items = 100,
    },
    trigger = {
      prefetch_on_insert = false,
      show_in_snippet = true,
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_blocked_trigger_characters = { " ", "\n", "\t", ":" },
      show_on_accept_on_trigger_character = true,
      show_on_insert_on_trigger_character = true,
      show_on_x_blocked_trigger_characters = { "'", '"', "(", ">", "<" },
    },
  },

  -- 补全源配置
  sources = {
    compat = {},
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
      "dictionary",
      "calc",
      "emoji",
      "crates",
      "omni",
      "ripgrep",
      "ecolog",
      "css_vars",
    },
    providers = {
      lsp = {
        name = "LSP",
        enabled = true,
        module = "blink.cmp.sources.lsp",
        score_offset = 100,
        opts = { tailwind_color_icon = "██" },
      },
      snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        score_offset = 1,
        -- 在注释区域不显示代码片段
        should_show_items = function()
          local ok, node = pcall(vim.treesitter.get_node)
          if ok and node and vim.tbl_contains({ "comment", "line_comment", "block_comment" }, node:type()) then
            return false
          end
          return true
        end,
      },
      emoji = {
        module = "blink-emoji",
        name = "Emoji",
        score_offset = 15,
        opts = { insert = true },
        -- 仅在 gitcommit、markdown、text 文件类型中显示表情符号补全
        should_show_items = function()
          return vim.tbl_contains({ "gitcommit", "markdown", "text" }, vim.o.filetype)
        end,
      },
      calc = {
        name = "calc",
        module = "blink.compat.source",
        kind = "Math",
      },
      dictionary = {
        module = "blink-cmp-dictionary",
        name = "Dict",
        score_offset = -1,
        max_items = 5,
        min_keyword_length = 5,
        opts = {
          get_command = "rg",
          get_command_args = function(prefix)
            return {
              "--color=never",
              "--no-line-number",
              "--no-messages",
              "--no-filename",
              "--ignore-case",
              "--",
              prefix,
            }
          end,
          dictionary_files = { vim.fn.expand("~/.config/nvim/dictionary/words.txt") },
        },
        kind = "Dic",
      },
      css_vars = {
        name = "css-vars",
        module = "css-vars.blink",
        kind = "Css",
        opts = {
          search_extensions = { ".js", ".ts", ".jsx", ".tsx", ".css", ".scss", ".less" },
        },
      },
      crates = {
        name = "crates",
        module = "blink.compat.source",
        score_offset = 100,
      },
      omni = {
        module = "blink.cmp.sources.complete_func",
        enabled = function()
          return vim.bo.omnifunc ~= "v:lua.vim.lsp.omnifunc"
        end,
        opts = {
          complete_func = function()
            return vim.bo.omnifunc
          end,
        },
      },
      ecolog = {
        name = "ecolog",
        score_offset = 11,
        module = "ecolog.integrations.cmp.blink_cmp",
      },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        score_offset = 1,
        opts = {},
      },
    },
  },

  -- 命令行补全
  cmdline = {
    enabled = true,
    keymap = {
      ["<Tab>"] = { "select_and_accept" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
    sources = function()
      local type = vim.fn.getcmdtype()
      -- 反向搜索时使用 buffer 源
      if type == "?" then
        return { "buffer" }
      end
      -- 命令模式使用 cmdline 源
      if type == ":" or type == "@" then
        return { "cmdline" }
      end
      return {}
    end,
    completion = {
      trigger = {
        show_on_blocked_trigger_characters = {},
        show_on_x_blocked_trigger_characters = {},
      },
      list = {
        selection = {
          preselect = true,
          auto_insert = true,
        },
      },
      menu = { auto_show = true },
      ghost_text = { enabled = false },
    },
  },
}
