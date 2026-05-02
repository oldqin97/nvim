-- HTTP REST 客户端（支持 .http 文件发送请求）
return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    keys = {
      { "<F1>", "<cmd>lua require('kulala').run()<cr>", desc = "rest" },
    },
    opts = {
      default_view = "body",
      display_mode = "float",
    },
  },
}
