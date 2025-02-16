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
    kind_icons = {
      Snippet = "",
      Emoji = "󰞅",
      Math = "",
      Dic = "",
    },
  },
  completion = {
    menu = {
      draw = {
        treesitter = { "lsp" },
      },
      scrollbar = false,
      border = "rounded",
      winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = {
        border = "rounded",
        scrollbar = false,
        winhighlight = "Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
      },
    },
    trigger = {
      prefetch_on_insert = true,
      show_in_snippet = true,
      show_on_keyword = true,
      show_on_trigger_character = true,
      show_on_accept_on_trigger_character = true,
      show_on_insert_on_trigger_character = false,
      -- show_on_x_blocked_trigger_characters = { "-" },
      show_on_blocked_trigger_characters = {
        " ",
        "'",
        '"',
        "=",
        -- "-",
        -- ".",
        ",",
        "/",
        -- ":",
        "{",
        "}",
        "(",
        ")",
        "#",
        "*",
      },
    },
  },
  sources = {
    -- compat = {},
    default = {
      "lsp",
      "path",
      "snippets",
      "buffer",
      -- "calc",
      -- "dictionary",
    },
    providers = {
      lsp = {
        name = "LSP",
        enabled = true,
        module = "blink.cmp.sources.lsp",
        score_offset = 1,
      },
      snippets = {
        name = "Snippets",
        module = "blink.cmp.sources.snippets",
        score_offset = -1,
        -- score_offset = 9,
      },

      -- emoji = {
      --   name = "emoji",
      --   module = "blink.compat.source",
      --   score_offset = 10,
      --   kind = "Emoji",
      -- },
      -- emoji = {
      --   module = "blink-emoji",
      --   name = "Emoji",
      --   score_offset = 15, -- the higher the number, the higher the priority
      --   opts = { insert = true }, -- Insert emoji (default) or complete its name
      -- },
      -- calc = {
      --   name = "calc",
      --   module = "blink.compat.source",
      --   kind = "Math",
      -- },
      -- dictionary = {
      --   name = "dictionary",
      --   module = "blink.compat.source",
      --   score_offset = -3,
      --   min_keyword_length = 5,
      --   kind = "Dic",
      -- },
    },
  },
  cmdline = {
    enabled = true,
    keymap = nil, -- Inherits from top level `keymap` config when not set
    sources = function()
      local type = vim.fn.getcmdtype()
      -- Search forward and backward
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
        show_on_x_blocked_trigger_characters = nil,
      },
      menu = {
        auto_show = nil,
        draw = {
          columns = { { "label", "label_description", gap = 1 } },
        },
      },
    },
  },
}
