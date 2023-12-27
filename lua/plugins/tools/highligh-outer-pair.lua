return {
  "utilyre/sentiment.nvim",
  version = "*",
  event = "BufReadPost",
  opts = {},
  init = function()
    vim.g.loaded_matchparen = 1
  end,
}
