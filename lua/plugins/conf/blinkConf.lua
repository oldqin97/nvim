-- blink.cmp 补全详细配置：按键映射、外观、模糊搜索、签名提示、补全菜单、补全源、命令行补全
-- local supermaven
return {
  -- 补全快捷键映射
  keymaps = {
    ["<Tab>"] = {
      function(cmp)
        if cmp.is_visible() then
          return cmp.select_and_accept()
        end
        -- if supermaven == nil then
        --   local ok, mod = pcall(require, "supermaven-nvim.completion_preview")
        --   supermaven = ok and mod or false
        -- end
        -- if supermaven and supermaven.has_suggestion() then
        --   vim.schedule(supermaven.on_accept_suggestion)
        --   return true
        -- end
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
      Text = "",
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
  -- 各 source 作用说明：
  --   lsp        - LSP 语言服务器补全（函数、变量、类型等）
  --   path       - [内置] 文件路径补全，输入 / 或 . 时触发
  --   snippets   - 代码片段模板补全
  --   buffer     - [内置] 当前缓冲区单词补全，从已打开文件中收集
  --   dictionary - 词典单词补全（自定义单词列表）
  --   calc       - 数学表达式计算补全（输入算式自动计算结果）
  --   emoji      - Emoji 表情符号补全（:xxx:）
  --   crates     - Rust Cargo 包名/版本补全
  --   omni       - Vim omnifunc 后备补全
  --   ripgrep    - Ripgrep 项目文本搜索补全
  --   ecolog     - 环境变量名称补全（.env 文件）
  --   css_vars   - CSS 自定义变量补全
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
      -- LSP 补全：语言服务器提供的代码补全（函数、变量、类型等），优先级最高
      lsp = {
        name = "LSP",
        enabled = true,
        module = "blink.cmp.sources.lsp",
        score_offset = 100,
        opts = { tailwind_color_icon = "██" },
      },
      -- 代码片段补全：LSP 或自定义的代码片段模板（如函数模板、for 循环模板等）
      snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        score_offset = 1,
        -- 在注释区域不显示代码片段
        should_show_items = function()
          local ok, node = pcall(vim.treesitter.get_node)
          if ok and node and vim.tbl_contains({ "comment" }, node:type()) then
            return false
          end
          return true
        end,
      },
      -- Emoji 表情补全：输入 :xxx 自动补全为对应的 emoji 表情符号
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
      -- 数学计算补全：输入数学表达式自动计算结果并插入（如 2+3= → 5）
      calc = {
        name = "calc",
        module = "blink.compat.source",
        kind = "Math",
      },
      -- 词典补全：从自定义单词列表文件中补全英文单词，使用 ripgrep 搜索匹配
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
      -- CSS 变量补全：在 JS/TS/CSS/SCSS 等文件中补全自定义 CSS 变量（var(--xxx)）
      css_vars = {
        name = "css-vars",
        module = "css-vars.blink",
        kind = "Css",
        opts = {
          search_extensions = { ".js", ".ts", ".jsx", ".tsx", ".css", ".scss", ".less" },
        },
      },
      -- Rust Crate 补全：在 Cargo.toml 中补全 Rust 包名和版本号
      crates = {
        name = "crates",
        module = "blink.compat.source",
        score_offset = 100,
      },
      -- Omni 补全：调用 vim 的 omnifunc 作为后备补全，仅在未使用 LSP omnifunc 时启用
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
      -- 环境变量补全：在 .env 文件和代码中补全环境变量名称
      ecolog = {
        name = "ecolog",
        score_offset = 11,
        module = "ecolog.integrations.cmp.blink_cmp",
      },
      -- Ripgrep 文本补全：使用 ripgrep 在当前项目中搜索匹配文本作为补全候选项
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
