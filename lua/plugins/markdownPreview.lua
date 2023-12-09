return {
  "iamcco/markdown-preview.nvim",
  cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  keys = {
    {
      "<leader>mp",
      ft = "markdown",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview",
    },
    {
      "<leader>ms",
      ft = "markdown",
      "<cmd>MarkdownPreviewStop<cr>",
      desc = "Markdown Preview",
    },
  },
  config = function()
    vim.cmd([[
    do FileType
let g:mkdp_auto_close = 0
    ]])
  end,
}
