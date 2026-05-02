-- 相对/绝对行号自动切换：编辑时自动切换为绝对行号
return {
  "cpea2506/relative-toggle.nvim",
  event = "BufReadPre",
  config = function()
    require("relative-toggle").setup({
      pattern = "*",
      events = {
        on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
        off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
      },
    })
  end,
}
