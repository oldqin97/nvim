return {
  {
    "saghen/blink.cmp",
    dependencies = {
      -- "hrsh7th/nvim-cmp",
      -- "saadparwaiz1/cmp_luasnip",
      -- "hrsh7th/cmp-nvim-lua",
      -- "hrsh7th/cmp-nvim-lsp",
      -- "hrsh7th/cmp-buffer",
      -- "hrsh7th/cmp-path",
      "octaltree/cmp-look",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "saghen/blink.compat",
      "giuxtaposition/blink-cmp-copilot",
    },

    opts = {
      appearance = {
        kind_icons = {
          Supermaven = "",
          Codeium = "",
          Array = "󰅪",
          Boolean = "⊨",
          Key = "󰌆",
          Namespace = "󰅪",
          Null = "NULL",
          Number = "#",
          Object = "󰀚",
          Package = "󰏗",
          String = "󰀬",
          TypeParameter = "󰊄",
          Text = "󰉿",
          Method = "󰆧",
          Function = "󰊕",
          Constructor = "",
          Field = "󰜢",
          Variable = "󰀫",
          Class = "󰠱",
          Interface = "",
          Module = "",
          Property = "󰜢",
          Unit = "󰑭",
          Value = "󰎠",
          Enum = "",
          Keyword = "󰌋",
          Snippet = "",
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          Emoji = "󰞅",
          Math = "󰿉",
        },
      },

      completion = {
        trigger = {
          prefetch_on_insert = false,
          show_in_snippet = true,
          show_on_keyword = true,
          show_on_trigger_character = false,
          show_on_accept_on_trigger_character = false,
          show_on_insert_on_trigger_character = false,
          show_on_x_blocked_trigger_characters = {},
          show_on_blocked_trigger_characters = {},
        },
      },
      sources = {
        -- completion = {
        --   enabled_providers = {
        --     -- "cmp_nvim_lua",
        --     "cmdline",
        --     -- "look",
        --     "emoji",
        --     "calc",
        --   },
        -- },
        -- compat = {},
        default = { "lsp", "path", "snippets", "buffer", "emoji", "calc", "look", "copilot" },
        providers = {
          -- lsp = {
          --   name = "lsp",
          --   -- score_offset = 99,
          -- },
          snippets = {
            name = "snippets",
            module = "blink.cmp.sources.snippets",
            score_offset = -3,
            opts = {
              friendly_snippets = true,
              search_paths = { vim.fn.stdpath("config") .. "/snippet" },
              global_snippets = { "all" },
              extended_filetypes = {},
              ignored_filetypes = {},
            },
          },
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            kind = "Emoji",
          },
          calc = {
            name = "calc",
            module = "blink.compat.source",
            kind = "Math",
          },
          copilot = {
            name = "copilot",
            module = "blink-cmp-copilot",
            kind = "Copilot",
            score_offset = 100,
            async = true,
          },
          look = {
            name = "look",
            module = "blink.compat.source",
            kind = "Text",
          },
        },
        cmdline = {},
        -- cmdline = function()
        --   local type = vim.fn.getcmdtype()
        --   -- Search forward and backward
        --   if type == "/" or type == "?" then
        --     return { "buffer" }
        --   end
        --   -- Commands
        --   if type == ":" then
        --     return { "cmdline" }
        --   end
        --   return {}
        -- end,
      },
      keymap = {
        -- preset = "Tab",
        ["<Tab>"] = { "select_and_accept" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
        ["<C-n>"] = { "scroll_documentation_down", "fallback" },
      },
    },
  },
}
