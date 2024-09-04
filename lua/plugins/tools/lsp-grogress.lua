return {
  -- "linrongbin16/lsp-progress.nvim",
  -- event = "BufReadPost",
  -- dependencies = { "nvim-tree/nvim-web-devicons" },
  -- config = function()
  --   require("lsp-progress").setup({
  --     ---@diagnostic disable-next-line: unused-local
  --     format = function(messages)
  --       local active_clients = vim.lsp.get_active_clients()
  --       local client_count = #active_clients
  --       ---@diagnostic disable-next-line: unused-local
  --       for i, client in ipairs(active_clients) do
  --         if client and client.name ~= "" then
  --           return "󰐏: " .. client_count .. " " .. "" .. client.name
  --         end
  --       end
  --     end,
  --   })
  -- end,
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({
        progress = {
          ignore = {
            "null-ls",
          },
        },
        notification = {
          window = {
            normal_hl = "Comment",
            winblend = 0,
            border = "single",
            max_width = 0,
            max_height = 0,
            x_padding = 0,
            y_padding = 0,
            align = "bottom",
          },
        },
      })
    end,
  },
}
