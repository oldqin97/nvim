return {
  {
    "lukas-reineke/headlines.nvim",
    dependencies = "nvim-treesitter/nvim-treesitter",
    ft = "markdown",
    opts = {
      markdown = {
        fat_headline_lower_string = "▔",
      },
    },
  },

  {
    "dkarter/bullets.vim",
    lazy = true,
    ft = { "markdown", "txt" },
  },

  {
    -- markdown preview
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
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
