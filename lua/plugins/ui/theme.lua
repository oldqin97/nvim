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
          emphasis = true,
          comments = true,
          operators = true,
          folds = true,
        },
        strikethrough = true,
        invert_selection = false,
        invert_signs = false,
        invert_tabline = false,
        invert_intend_guides = false,
        inverse = false,
        contrast = "",
        palette_overrides = {},
        overrides = {
          Comment = { fg = "#83cbac" },
          FlashBackdrop = { fg = "#83cbac" },
          Search = { bg = "#51afef", fg = "#eeeeee" },
          IncSearch = { bg = "#FF8800", fg = "#eeeeee" },
          MatchParen = { bg = "#458588" },

          -- Cursor = { bg = "#FF0000", fg = "#FFFFFF", bold = true },

          BlinkCmpKind = { link = "GruvboxYellow" },
          -- 函数定义/调用（黄色加强版）
          Function = { fg = "#FFD700", bold = true }, -- 亮金色
          ["@function.call"] = { link = "FunctionCall" },
          ["@function"] = { link = "Function" }, -- Treesitter 同步
          ["@keyword.function"] = { fg = "#ea6962" },

          BookMarksAdd = { fg = "#FFD700" },
          BookMarksAnn = { fg = "#FFD700" },
          BookMarksSign = { bg = "#504945", fg = "#eeeeee" },
          BookMarksAnnLn = { bg = "#504945" },
          BookMarksAddLn = { bg = "#504945" },

          AvanteConflictCurrentLabel = { bg = "#B71C1C", fg = "#FFFFFF" },
          AvanteConflictCurrent = { bg = "#9e5d55" },
          AvanteConflictIncoming = { bg = "#6d8fa6" },
          AvanteConflictIncomingLabel = { bg = "#2376b7", fg = "#FFFFFF" },

          LspReferenceText = { bg = "#7c6f64" },
          LspReferenceRead = { bg = "#7c6f64" },
          LspReferenceWrite = { bg = "#7c6f64" },

          -- 对象/类定义（橙色突出）
          ["@constructor"] = { fg = "#FE8019", bold = true }, -- 亮橙色
          Type = { fg = "#FE8019" }, -- 类型提示

          -- 清除代码片段跳转高亮
          SnippetTabstop = { fg = NONE, bg = NONE },

          LspInlayHint = {
            fg = "#a2a2a2", -- Gruvbox 深灰色（与注释协调）
            bg = "#3C3836", -- 深灰背景（可选）
          },

          ["@lsp.type.class"] = { fg = "#71C7B1", italic = true },

          -- 对象变量专项配置
          ["@variable"] = { fg = "#B3DAFB" },
          ["@lsp.typemod.variable.readonly"] = { fg = "#6FBFFA" },

          -- unused
          DiagnosticUnnecessary = { fg = "#bdaead", strikethrough = true },
          DiagnosticLineError = { bg = "#3c0000" },
          DiagnosticLineWarn = { bg = "#3c3c00" },
          DiagnosticLineInfo = { bg = "#003c3c" },
          DiagnosticLineHint = { bg = "#003c00" },

          -- 字符串
          String = { fg = "#C5967D" },
          -- String = { fg = "#FFFFFF" },
          ["@string"] = { link = "String" },

          -- 关键字（粉色醒目）
          Keyword = { fg = "#D3869B", bold = true }, -- 粉紫色
          ["@keyword"] = { link = "Keyword" },

          ["@parameter"] = { fg = "#8EC07C" }, -- 浅绿

          -- 数字高亮
          Number = { fg = "#BECDAB", bold = true }, -- 琥珀黄
          ["@number"] = { link = "Number" },

          -- boolean
          Boolean = { fg = "#fbf1c7" },
          ["@boolean"] = { link = "Boolean" },

          TSComment = { fg = "#83cbac", italic = true },
          ["@comment"] = { fg = "#83cbac" },

          -- ========== 特殊增强 ==========

          -- 错误/警告（红色系）
          Error = { fg = "#FB4934", undercurl = true }, -- 错误提示
          Warning = { fg = "#D79921", bold = true }, -- 警告提示

          -- 导入/模块（蓝绿色）
          ["@include"] = { fg = "#83A598" }, -- 导入语句
          ["@namespace"] = { fg = "#83A598" }, -- 命名空间
        },
        dim_inactive = false,
        transparent_mode = true,
      })
    end,
  },
  {
    -- "Mofiqul/vscode.nvim",
    -- lazy = true,
    -- name = "vscode",
    -- config = function()
    --   require("vscode").setup({
    --     style = "dark",
    --     transparent = true,
    --   })
    -- end,
  },

  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox",
      -- colorscheme = "catppuccin",
      -- colorscheme = "vscode",
    },
  },
}
