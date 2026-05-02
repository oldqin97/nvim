-- 自动配对（括号、引号等）插件配置
return {
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    opts = {
      map_bs = false,
    },
  },
}
