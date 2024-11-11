return {
  {
    -- "simrat39/symbols-outline.nvim",
    "hedyhli/outline.nvim",
    cmd = { "Outline" },
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
        keymaps = {
          peek_location = "l",
          fold_toggle = "h",
          goto_location = "<Tab>",
          goto_and_close = "o",
        },

        symbol_folding = {
          -- 默认情况下，超过此深度的节点将折叠。设置为 false 时在打开时展开所有节点。
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
