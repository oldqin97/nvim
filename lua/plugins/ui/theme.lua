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
          comments = true,
          operators = false,
          folds = true,
        },
        strikethrough = true,
        invert_selection = true,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        contrast = "",
        palette_overrides = {},
        overrides = {
          Comment = { fg = "#83cbac" },
        },
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      -- colorscheme = "onedark",
      colorscheme = "gruvbox",
    },
  },
}
