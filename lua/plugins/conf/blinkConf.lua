return {
  keymaps = {
    -- preset = "<Tab>",
    ["<Tab>"] = { "select_and_accept", "fallback" },
    ["<C-p>"] = { "scroll_documentation_up", "fallback" },
    ["<C-n>"] = { "scroll_documentation_down", "fallback" },
    ["<Up>"] = { "select_prev", "fallback" },
    ["<Down>"] = { "select_next", "fallback" },
  },
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

  completion = {
    menu = {
      draw = {
        treesitter = { "lsp" },
        components = {},
      },
      scrollbar = false,
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
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
      show_on_blocked_trigger_characters = { " ", "\n", "\t" },
      show_on_accept_on_trigger_character = true,
      show_on_insert_on_trigger_character = true,
      show_on_x_blocked_trigger_characters = { "'", '"', "(" },
    },
  },
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
      "css_vars",
      "crates",
      "omni",
      "ripgrep",
      -- "supermaven",
      -- "ecolog",
      -- "env",
    },
    -- per_filetype = {
    -- env = {
    --   "env",
    --   "omni",
    --   "lsp",
    --   "snippets",
    --   "buffer",
    --   "dictionary",
    -- },
    -- toml = {
    --   "crates",
    --   "lsp",
    --   "path",
    --   "snippets",
    --   "buffer",
    -- },
    -- lua = {
    --   "lazydev",
    --   "lsp",
    --   "path",
    --   "snippets",
    --   "buffer",
    --   "calc",
    --   "dictionary",
    -- },
    -- },
    providers = {
      lsp = {
        name = "LSP",
        enabled = true,
        module = "blink.cmp.sources.lsp",
        score_offset = 10,
        opts = { tailwind_color_icon = "██" },
      },
      snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        score_offset = -10,
      },

      emoji = {
        module = "blink-emoji",
        name = "Emoji",
        score_offset = 15,
        opts = { insert = true },
        should_show_items = function()
          return vim.tbl_contains({ "gitcommit", "markdown", "text" }, vim.o.filetype)
        end,
      },
      calc = {
        name = "calc",
        module = "blink.compat.source",
        kind = "Math",
      },
      -- dictionary = {
      --   name = "dictionary",
      --   module = "blink.compat.source",
      --   score_offset = -5,
      --   min_keyword_length = 5,
      --   kind = "Dic",
      -- },
      dictionary = {
        module = "blink-cmp-dictionary",
        name = "Dict",
        score_offset = 5, -- the higher the number, the higher the priority
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
          -- To disable the definitions comment this
        },
        kind = "Dic",
      },
      css_vars = {
        name = "css-vars",
        module = "css-vars.blink",
        kind = "Css",
        opts = {
          search_extensions = { ".js", ".ts", ".jsx", ".tsx" },
        },
      },
      crates = {
        name = "crates",
        module = "blink.compat.source",
        score_offset = 100,
        -- async = true,
      },
      omni = {
        module = "blink.cmp.sources.complete_func",
        enabled = function()
          return vim.bo.omnifunc ~= "v:lua.vim.lsp.omnifunc"
        end,
        ---@type blink.cmp.CompleteFuncOpts
        opts = {
          complete_func = function()
            return vim.bo.omnifunc
          end,
        },
      },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        kind = "String",
        score_offset = -11,
        opts = {
          prefix_min_len = 3,
          context_size = 5,
          max_filesize = "1M",
          project_root_marker = vim.g.root_markers,
          search_casing = "--smart-case",
          project_root_fallback = false,
          additional_rg_options = {},
          fallback_to_regex_highlighting = true,
        },
      },
    },
  },
  cmdline = {
    enabled = true,
    keymap = {
      ["<Tab>"] = { "select_and_accept" },
      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
    },
    sources = function()
      local type = vim.fn.getcmdtype()
      -- Search forward and backward
      -- if type == "/" or type == "?" then
      if type == "?" then
        return { "buffer" }
      end
      -- Commands
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
          -- When `true`, will automatically select the first item in the completion list
          preselect = true,
          -- When `true`, inserts the completion item automatically when selecting it
          auto_insert = true,
        },
      },
      -- Whether to automatically show the window when new completion items are available
      menu = { auto_show = true },
      -- Displays a preview of the selected item on the current line
      ghost_text = { enabled = false },
    },
  },
}
