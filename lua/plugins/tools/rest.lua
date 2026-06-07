-- HTTP REST 客户端（支持 .http 文件发送请求）
return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      {
        "<F1>",
        function()
          return require("kulala").run()
        end,
        -- "<cmd>lua require('kulala').run()<cr>",
        desc = "rest",
      },
    },
    opts = {
      default_view = "body",
      display_mode = "float",
    },
    -- config = function(_, opts)
    --   require("kulala").setup(opts)
    --
    --   -- WORKAROUND: 修复 kulala.nvim 的 bug — set_buffer_contents 中
    --   -- vim.treesitter.start(0, filetype) 会用 0 (当前buf=HTTP)
    --   -- 而不是实际的 response buffer，导致 HTTP 文件的 treesitter
    --   -- 高亮被覆盖。详见 kulala/ui/init.lua:133
    --   --
    --   -- 此 autocmd 在 kulala 响应 buffer 创建后，
    --   -- 重新在所有 HTTP buffer 上启动 treesitter。
    --   --
    --   -- 如果上游已修复，可删除此 workaround。
    --   vim.api.nvim_create_autocmd("BufWinEnter", {
    --     pattern = "kulala://*",
    --     once = false,
    --     callback = function()
    --       vim.schedule(function()
    --         for _, win in ipairs(vim.api.nvim_list_wins()) do
    --           local buf = vim.api.nvim_win_get_buf(win)
    --           if vim.bo[buf].filetype == "http" then
    --             pcall(vim.treesitter.start, buf, "http")
    --           end
    --         end
    --       end)
    --     end,
    --   })
    -- end,
  },
}
