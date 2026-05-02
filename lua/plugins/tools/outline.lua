-- 代码大纲/符号列表（优先使用 LSP，降级到 Treesitter）
return {
  {
    "hedyhli/outline.nvim",
    event = "VeryLazy",
    keys = {
      { "<A-o>", "<cmd>Outline<cr>", desc = "Toggle Outline" },
      { "<leader>cs", false },
    },
    opts = function()
      return {
        outline_window = {
          position = "left",
          width = 35,
          auto_jump = true,
          jump_highlight_duration = 100,
        },
        providers = {
          priority = { "lsp", "treesitter" }, -- 优先用 LSP，没响应就用 Treesitter
        },
        keymaps = {
          peek_location = "l",
          fold_toggle = "h",
          goto_and_close = { "o", "<Tab>" },
        },
        symbol_folding = {
          autofold_depth = false,
        },
        symbols = {
          icons = {
            File = { icon = "󰈔", hl = "Identifier" },
            Module = { icon = "󰆧", hl = "Include" },
            Namespace = { icon = "󰅪", hl = "Include" },
            Package = { icon = "󰏗", hl = "Include" },
            Class = { icon = "", hl = "Type" },
            Method = { icon = "ƒ", hl = "Function" },
            Property = { icon = "", hl = "Identifier" },
            Field = { icon = "󰆨", hl = "Identifier" },
            Constructor = { icon = "", hl = "Special" },
            Enum = { icon = "ℰ", hl = "Type" },
            Interface = { icon = "󰜰", hl = "Type" },
            Function = { icon = "", hl = "Function" },
            Variable = { icon = "", hl = "Constant" },
            Constant = { icon = "", hl = "Constant" },
            String = { icon = "", hl = "String" },
            Number = { icon = "#", hl = "Number" },
            Boolean = { icon = "⊨", hl = "Boolean" },
            Array = { icon = "󰅪", hl = "Constant" },
            Object = { icon = "⦿", hl = "Type" },
            Key = { icon = "", hl = "Type" },
            Null = { icon = "NULL", hl = "Type" },
            EnumMember = { icon = "", hl = "Identifier" },
            Struct = { icon = "", hl = "Structure" },
            Event = { icon = "", hl = "Type" },
            Operator = { icon = "+", hl = "Identifier" },
            TypeParameter = { icon = "𝙏", hl = "Identifier" },
            Component = { icon = "󰅴", hl = "Function" },
            Fragment = { icon = "󰅴", hl = "Constant" },
            TypeAlias = { icon = " ", hl = "Type" },
            Parameter = { icon = " ", hl = "Identifier" },
            StaticMethod = { icon = " ", hl = "Function" },
            Macro = { icon = " ", hl = "Function" },
          },
        },
      }
    end,
  },
}
