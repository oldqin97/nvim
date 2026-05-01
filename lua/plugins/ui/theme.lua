return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    name = "gruvbox",
    config = function()
      require("gruvbox").setup({
        terminal_colors = false,
        undercurl = true,
        underline = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = true,
          comments = true,
          operators = false,
          folds = false,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        contrast = "",
        palette_overrides = {},
        dim_inactive = false,
        transparent_mode = true,

        overrides = {
          -- ══ Base UI ═══════════════════════════════════
          Cursor = { fg = "#282828", bg = "#fe8019", bold = false },
          FlashBackdrop = { fg = "#83cbac", bold = true },
          Search = { bg = "#51afef", fg = "#eeeeee" },
          IncSearch = { bg = "#FF8800", fg = "#eeeeee" },
          MatchParen = { bg = "#458588" },
          SnippetTabstop = { fg = vim.NONE, bg = vim.NONE },

          -- ══ Syntax / Treesitter ═══════════════════════
          Comment = { fg = "#83cbac", bold = true },
          TSComment = { fg = "#83cbac", italic = false, bold = true },
          ["@comment"] = { fg = "#83cbac", bold = true },

          String = { fg = "#C5967D" },
          ["@string"] = { link = "String" },
          ["@string.special.url"] = { underline = false },

          Number = { fg = "#BECDAB", bold = true },
          ["@number"] = { link = "Number" },

          Boolean = { fg = "#fbf1c7" },
          ["@boolean"] = { link = "Boolean" },

          Keyword = { fg = "#D3869B", bold = true },
          ["@keyword"] = { link = "Keyword" },
          ["@keyword.function"] = { fg = "#ea6962" },

          Function = { fg = "#FFD700", bold = true },
          ["@function"] = { link = "Function" },
          ["@function.call"] = { link = "FunctionCall" },

          ["@constructor"] = { fg = "#FE8019", bold = true },
          Type = { fg = "#FE8019" },

          ["@parameter"] = { fg = "#8EC07C" },
          ["@variable"] = { fg = "#B3DAFB" },
          ["@lsp.typemod.variable.readonly"] = { fg = "#6FBFFA" },
          ["@lsp.type.class"] = { fg = "#71C7B1", italic = false, bold = true },

          ["@include"] = { fg = "#83A598" },
          ["@namespace"] = { fg = "#83A598" },

          ["@markup.link"] = { underline = false },
          ["@markup.link.url"] = { underline = false },

          Error = { fg = "#FB4934", undercurl = true },
          Warning = { fg = "#D79921", bold = true },

          -- ══ LSP / Diagnostics ═════════════════════════
          LspReferenceText = { bg = "#7c6f64" },
          LspReferenceRead = { bg = "#7c6f64" },
          LspReferenceWrite = { bg = "#7c6f64" },
          LspInlayHint = { fg = "#a2a2a2", bg = "#3C3836" },
          BlinkCmpKind = { link = "GruvboxYellow" },
          DiagnosticUnnecessary = { fg = "#bdaead", strikethrough = true },
          DiagnosticLineError = { bg = "#5c0000" },
          DiagnosticLineWarn = { bg = "#5c5c00" },
          DiagnosticLineInfo = { bg = "#005c5c" },
          DiagnosticLineHint = { bg = "#005c00" },

          -- ══ Plugins ════════════════════════════════════
          SnacksPickerListCursorLine = { link = "Visual" },
          AvanteConflictCurrentLabel = { bg = "#B71C1C", fg = "#FFFFFF" },
          AvanteConflictCurrent = { bg = "#9e5d55" },
          AvanteConflictIncoming = { bg = "#6d8fa6" },
          AvanteConflictIncomingLabel = { bg = "#2376b7", fg = "#FFFFFF" },
          BookMarksAdd = { fg = "#FFD700" },
          BookMarksAnn = { fg = "#FFD700" },
          BookMarksSign = { bg = "#504945", fg = "#eeeeee" },
          BookMarksAnnLn = { bg = "#504945" },
          BookMarksAddLn = { bg = "#504945" },
        },
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
    },
  },
}
