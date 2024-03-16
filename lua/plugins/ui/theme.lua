return {
  {
    "catppuccin/nvim",
    -- lazy = true,
    enabled = false,
    name = "catppuccin",
    config = function()
      require("catppuccin").setup({
        custom_highlights = function()
          return {
            Comment = {
              fg = "#83cbac",
              style = { "bold" },
            },
            Visual = {
              fg = "#eef7f2",
              bg = "#8abcd1",
            },
            TabLineSel = { bg = "#8abcd1" },
          }
        end,
        transparent_background = true,
        integrations = {
          alpha = true,
          rainbow_delimiters = true,
          cmp = true,
          flash = true,
          gitsigns = true,
          illuminate = true,
          indent_blankline = { enabled = true },
          lsp_trouble = true,
          mason = true,
          mini = true,
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              hints = { "undercurl" },
              warnings = { "undercurl" },
              information = { "undercurl" },
            },
          },
          navic = { enabled = true, custom_bg = "lualine" },
          neotest = true,
          noice = true,
          notify = true,
          neotree = true,
          semantic_tokens = true,
          telescope = true,
          treesitter = true,
          which_key = true,
        },
      })
    end,
  },

  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        terminal_colors = true, -- add neovim terminal colors
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = false,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = true,
        contrast = "",
        palette_overrides = {},
        overrides = {
          Comment = { fg = "#83cbac" },
          -- TabLineSel = { bg = "#ff9900" },
        },
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },

  {
    "navarasu/onedark.nvim",
    name = "onedark",
    config = function()
      require("onedark").setup({
        style = "dark", -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
        transparent = true, -- Show/hide background
        term_colors = true, -- Change terminal color as per the selected theme style
        ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
        cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

        -- toggle theme style ---
        toggle_style_key = nil, -- keybind to toggle theme style. Leave it nil to disable it, or set it to a string, for example "<leader>ts"
        toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

        -- Change code style ---
        -- Options are italic, bold, underline, none
        -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
        code_style = {
          comments = "italic",
          keywords = "bold",
          functions = "bold",
          strings = "bold",
          variables = "bold",
        },

        -- Lualine options --
        lualine = {
          transparent = true, -- lualine center bar transparency
        },

        -- Custom Highlights --
        colors = {}, -- Override default colors
        highlights = {}, -- Override highlight groups

        -- Plugins Config --
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = true, -- use background color for virtual text
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
    },
  },
}
