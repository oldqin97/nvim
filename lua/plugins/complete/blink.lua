return {
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "hrsh7th/cmp-emoji",
      "hrsh7th/cmp-calc",
      "saghen/blink.compat",
      -- "giuxtaposition/blink-cmp-copilot",

      {
        "uga-rosa/cmp-dictionary",
        config = function()
          require("cmp_dictionary").setup({
            paths = { "/usr/share/dict/words" },
            exact_length = 5,
          })
        end,
      },
    },
    opts = {
      keymap = {
        -- preset = "<Tab>",
        ["<Tab>"] = { "select_and_accept", "fallback" },
        ["<C-p>"] = { "scroll_documentation_up", "fallback" },
        ["<C-n>"] = { "scroll_documentation_down", "fallback" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
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
          Function = "󰿉",
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
          Color = "󰏘",
          File = "󰈙",
          Reference = "󰈇",
          Folder = "󰉋",
          EnumMember = "",
          Constant = "󰏿",
          Struct = "󰙅",
          Event = "",
          Operator = "󰆕",
          Snippet = "",
          Emoji = "󰞅",
          Math = "",
          Dic = "",
        },
      },
      completion = {
        menu = {
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
          -- prefetch_on_insert = false,
          -- show_in_snippet = true,
          -- show_on_keyword = true,
          -- show_on_trigger_character = true,
          -- show_on_accept_on_trigger_character = false,
          -- show_on_insert_on_trigger_character = false,
          -- show_on_x_blocked_trigger_characters = { "-" },
          show_on_blocked_trigger_characters = {
            " ",
            "'",
            '"',
            "=",
            "--",
            -- ".",
            ",",
            "/",
            ":",
            "{",
            "(",
            ")",
            "#",
            "*",
            "@",
          },
        },
      },
      sources = {
        compat = {},
        default = {
          "lsp",
          "path",
          "snippets",
          "buffer",
          "emoji",
          "calc",
          -- "copilot",
          "dictionary",
        },
        providers = {
          lsp = {
            name = "lsp",
            score_offset = 1,
          },
          snippets = {
            score_offset = -1,
            -- score_offset = 9,
          },
          emoji = {
            name = "emoji",
            module = "blink.compat.source",
            score_offset = 10,
            kind = "Emoji",
          },
          calc = {
            name = "calc",
            module = "blink.compat.source",
            kind = "Math",
          },
          dictionary = {
            name = "dictionary",
            module = "blink.compat.source",
            score_offset = -3,
            min_keyword_length = 5,
            kind = "Dic",
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
    },
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

      -- add ai_accept to <Tab> key
      -- if not opts.keymap["<S-Tab>"] then
      --   if opts.keymap.preset == "super-tab" then -- super-tab
      --     opts.keymap["<S-Tab>"] = {
      --       require("blink.cmp.keymap.presets")["super-tab"][1],
      --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
      --       "fallback",
      --     }
      --   else -- other presets
      --     opts.keymap["<S-Tab>"] = {
      --       LazyVim.cmp.map({ "snippet_forward", "ai_accept" }),
      --       "fallback",
      --     }
      --   end
      -- end

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
