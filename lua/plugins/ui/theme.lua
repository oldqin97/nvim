return {
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
        invert_selection = true,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        contrast = "",
        palette_overrides = {},
        overrides = {
          Comment = { fg = "#83cbac" },
          Search = { bg = "#51afef", fg = "#eeeeee" },
          IncSearch = { bg = "#FF8800", fg = "#eeeeee" },
          MatchParen = { bg = "#458588" },
          -- LspReferenceText = { bg = "#f9d27d", fg = "#ffffff" },
          -- LspReferenceRead = { bg = "#f9d27d", fg = "#ffffff" },
          -- LspReferenceWrite = { bg = "#f9d27d", fg = "#ffffff" },
        },
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },
  -- {
  --   "Mofiqul/vscode.nvim",
  --   lazy = true,
  --   name = "vscode",
  --   config = function()
  --     require("vscode").setup({
  --       style = "dark",
  --       transparent = false,
  --     })
  --   end,
  -- },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "vscode",
    },
  },
}
