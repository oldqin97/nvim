return {
  "tomasky/bookmarks.nvim",
  after = "telescope.nvim",
  event = "BufReadPost",
  config = function()
    require("bookmarks").setup({
      save_file = vim.fn.expand("~/.config/nvim/.bookmarks"),
      on_attach = function()
        local bm = require("bookmarks")
        local map = vim.keymap.set
        map("n", "mm", bm.bookmark_toggle)
        map("n", "mi", bm.bookmark_ann)
        map("n", "mc", bm.bookmark_clean)
      end,
    })
  end,
}
