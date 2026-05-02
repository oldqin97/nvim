-- 使用 Tab 键跳出括号/引号包围
return {
  {
    "abecodes/tabout.nvim",
    event = "InsertEnter",
    config = function()
      require("tabout").setup({
        tabkey = "<Tab>",
        backwards_tabkey = "<S-Tab>",
        act_as_tab = true, -- 无法跳出时 Tab 充当普通缩进
        act_as_shift_tab = false,
        default_tab = "<C-t>", -- 行首时的默认 Tab 动作
        default_shift_tab = "<C-d>",
        enable_backwards = true, -- 启用 Shift-Tab 向后跳出
        completion = false, -- 补全菜单弹出时不拦截 Tab
        ignore_beginning = true, -- 光标在闭合符号最左侧时直接跳出
        exclude = {},
        tabouts = {
          { open = "'", close = "'" },
          { open = '"', close = '"' },
          { open = "`", close = "`" },
          { open = "(", close = ")" },
          { open = "[", close = "]" },
          { open = "{", close = "}" },
        },
      })
    end,
    priority = 1000,
  },
}
