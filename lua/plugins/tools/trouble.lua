-- 诊断信息列表与导航
return {
  "folke/trouble.nvim",
  cmd = { "TroubleToggle", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    { "<leader>bb", false },
    { "<leader>dd", false },
    { "<leader>xL", false },
    { "<leader>xQ", false },
    { "<leader>xx", false },
    { "<leader>xX", false },
    -- 上一个诊断/quickfix 项
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    -- 下一个诊断/quickfix 项
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then vim.notify(err, vim.log.levels.ERROR) end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}
