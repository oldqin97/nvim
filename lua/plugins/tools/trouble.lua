return {
  "folke/trouble.nvim",
  cmd = { "TroubleTogge", "Trouble" },
  opts = { use_diagnostic_signs = true },
  keys = {
    -- { "<leader>bb", "<cmd>Trouble diagnostics toggle focus=true<cr>", desc = "Document Diagnostics (Trouble)" },
    -- {
    --   "<leader>dd",
    --   "<cmd>Trouble diagnostics toggle filter.buf=0 focus=true<cr>",
    --   desc = "Buffer Diagnostics (Trouble)",
    -- },
    { "<leader>bb", false },
    { "<leader>dd", false },
    { "<leader>xL", false },
    { "<leader>xQ", false },
    { "<leader>xx", false },
    { "<leader>xX", false },
    {
      "[q",
      function()
        if require("trouble").is_open() then
          require("trouble").previous({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cprev)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Previous trouble/quickfix item",
    },
    {
      "]q",
      function()
        if require("trouble").is_open() then
          require("trouble").next({ skip_groups = true, jump = true })
        else
          local ok, err = pcall(vim.cmd.cnext)
          if not ok then
            vim.notify(err, vim.log.levels.ERROR)
          end
        end
      end,
      desc = "Next trouble/quickfix item",
    },
  },
}
