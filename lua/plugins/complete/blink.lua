return {
  {
    "saghen/blink.cmp",
    version = not vim.g.lazyvim_blink_main and "*",
    build = vim.g.lazyvim_blink_main and "cargo build --release",
    opts_extend = {
      "sources.completion.enabled_providers",
      "sources.compat",
      "sources.default",
    },
    dependencies = {
      "rafamadriz/friendly-snippets",
      -- add blink.compat to dependencies
      {
        "saghen/blink.compat",
        optional = true, -- make optional so it's only enabled if any extras need it
        opts = {},
        version = not vim.g.lazyvim_blink_main and "*",
      },
      "octaltree/cmp-look",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "saghen/blink.compat",
      "giuxtaposition/blink-cmp-copilot",
    },

    event = { "InsertEnter", "CmdlineEnter" },
    -- event = "InsertEnter",

    ---@module 'blink.cmp'
    ---@type blink.cmp.Config
    opts = {
      snippets = {
        expand = function(snippet, _)
          return LazyVim.cmp.expand(snippet)
        end,
      },
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
          show_on_trigger_character = true,
          show_on_accept_on_trigger_character = false,
          show_on_insert_on_trigger_character = false,
          show_on_x_blocked_trigger_characters = {},
          show_on_blocked_trigger_characters = {},
        },
        -- list = {
        --   selection = "manual",
        -- },
      },

      -- experimental signature help support
      -- signature = { enabled = true },

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
        compat = {},
        default = { "lsp", "path", "cmdline", "snippets", "buffer", "emoji", "calc", "look", "copilot" },
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
        cmdline = function()
          local type = vim.fn.getcmdtype()
          -- Search forward and backward
          -- if type == "/" or type == "?" then
          --   return { "buffer" }
          -- end
          -- Commands
          if type == ":" then
            return { "cmdline" }
          end
          return {}
        end,
      },

      keymap = {
        -- preset = "Tab",
        ["<Tab>"] = { "select_and_accept" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
        ["<C-n>"] = { "scroll_documentation_down", "fallback" },
      },
    },
    ---@param opts blink.cmp.Config | { sources: { compat: string[] } }
    config = function(_, opts)
      -- setup compat sources
      local enabled = opts.sources.default
      for _, source in ipairs(opts.sources.compat or {}) do
        opts.sources.providers[source] = vim.tbl_deep_extend(
          "force",
          { name = source, module = "blink.compat.source" },
          opts.sources.providers[source] or {}
        )
        if type(enabled) == "table" and not vim.tbl_contains(enabled, source) then
          table.insert(enabled, source)
        end
      end

      if not opts.keymap["<S-Tab>"] then
        if opts.keymap.preset == "super-tab" then -- super-tab
          opts.keymap["<S-Tab>"] = {
            require("blink.cmp.keymap.presets")["super-tab"]["<Tab>"][1],
            LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
            "fallback",
          }
        else -- other presets
          opts.keymap["<S-Tab>"] = {
            LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
            "fallback",
          }
        end
      end

      -- Unset custom prop to pass blink.cmp validation
      opts.sources.compat = nil

      -- check if we need to override symbol kinds
      for _, provider in pairs(opts.sources.providers or {}) do
        ---@cast provider blink.cmp.SourceProviderConfig|{kind?:string}
        if provider.kind then
          local CompletionItemKind = require("blink.cmp.types").CompletionItemKind
          local kind_idx = #CompletionItemKind + 1

          CompletionItemKind[kind_idx] = provider.kind
          ---@diagnostic disable-next-line: no-unknown
          CompletionItemKind[provider.kind] = kind_idx

          ---@type fun(ctx: blink.cmp.Context, items: blink.cmp.CompletionItem[]): blink.cmp.CompletionItem[]
          local transform_items = provider.transform_items
          ---@param ctx blink.cmp.Context
          ---@param items blink.cmp.CompletionItem[]
          provider.transform_items = function(ctx, items)
            items = transform_items and transform_items(ctx, items) or items
            for _, item in ipairs(items) do
              item.kind = kind_idx or item.kind
            end
            return items
          end

          -- Unset custom prop to pass blink.cmp validation
          provider.kind = nil
        end
      end

      require("blink.cmp").setup(opts)
    end,
  },
}
