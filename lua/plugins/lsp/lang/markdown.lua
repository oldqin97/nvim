return {
  -- {
  --   "lukas-reineke/headlines.nvim",
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   ft = "markdown",
  --   opts = {
  --     markdown = {
  --       fat_headline_lower_string = "▔",
  --     },
  --   },
  -- },

  {
    "dkarter/bullets.vim",
    lazy = true,
    ft = { "markdown", "txt" },
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
