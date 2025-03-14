return {
  {
    "dkarter/bullets.vim",
    -- event = "VeryLazy",
    ft = { "markdown", "text" },
  },

  {
    -- markdown preview
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = {
      "MarkdownPreviewToggle",
      "MarkdownPreview",
      "MarkdownPreviewStop",
    },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.cmd([[do FileType]])
      vim.cmd([[
        let g:mkdp_auto_close = 0
      ]])
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
  },
}
