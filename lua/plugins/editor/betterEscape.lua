return {
  -- "max397574/better-escape.nvim",
  -- config = function()
  --   require("better_escape").setup({
  --     mapping = { "jj" }, -- 使用哪几个组合键
  --     timeout = 200, -- 最大时间间隔，单位毫秒
  --   })
  -- end,
  -- lua with lazy.nvim
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({
        default_mappings = false, -- setting this to false removes all the default mappings
        mappings = {
          i = {
            j = {
              j = "<Esc>",
            },
          },
          c = {
            j = {
              j = "<C-c>",
            },
          },
        },
      })
    end,
  },
}
