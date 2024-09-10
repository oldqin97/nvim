return {
  "cpea2506/relative-toggle.nvim",
  config = function()
    require("relative-toggle").setup({
      require("relative-toggle").setup({
        pattern = "*",
        events = {
          on = { "BufEnter", "FocusGained", "InsertLeave", "WinEnter", "CmdlineLeave" },
          off = { "BufLeave", "FocusLost", "InsertEnter", "WinLeave", "CmdlineEnter" },
        },
      }),
    })
  end,
}
