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

  fuzzy = {
    sorts = {
      "exact",
      "score",
      "sort_text",
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
      draw = function(opts)
        -- if opts.item and opts.item.documentation then
        --   local out = require("pretty_hover.parser").parse(opts.item.documentation.value)
        --   opts.item.documentation.value = out:string()
        -- end

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
      show_on_blocked_trigger_characters = { " ", "\n", "\t" },
      show_on_accept_on_trigger_character = true,
      show_on_insert_on_trigger_character = true,
      show_on_x_blocked_trigger_characters = { "'", '"', "(", ">", "<" },
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
      "crates",
      "omni",
      "ripgrep",
      "ecolog",
      "css_vars",
    },
    -- per_filetype = {
    --   -- env = {
    --   --   "env",
    --   --   "omni",
    --   --   "lsp",
    --   --   "snippets",
    --   --   "buffer",
    --   --   "dictionary",
    --   -- },
    --   -- toml = {
    --   --   "crates",
    --   --   "lsp",
    --   --   "path",
    --   --   "snippets",
    --   --   "buffer",
    --   -- },
    --   -- lua = {
    --   --   "lazydev",
    --   --   "lsp",
    --   --   "path",
    --   --   "snippets",
    --   --   "buffer",
    --   --   "ripgrep",
    --   --   "calc",
    --   --   "dictionary",
    --   -- },
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
        score_offset = 10,
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
        score_offset = 5,
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
          search_extensions = { ".js", ".ts", ".jsx", ".tsx", ".css", ".scss", ".less" },
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
        opts = {
          complete_func = function()
            return vim.bo.omnifunc
          end,
        },
      },
      ecolog = {
        name = "ecolog",
        module = "ecolog.integrations.cmp.blink_cmp",
      },
      ripgrep = {
        module = "blink-ripgrep",
        name = "Ripgrep",
        kind = "String",
        score_offset = 5,
        opts = {
          prefix_min_len = 3,
          context_size = 5,
          max_filesize = "1M",
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
