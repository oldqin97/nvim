-- 快速退出插入模式：双击 jj 映射为 Esc
return {
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup({
        default_mappings = false,
        mappings = {
          i = {
            j = { j = "<Esc>" },
          },
          c = {
            j = { j = "<C-c>" },
          },
        },
      })
    end,
  },
}
