return {
  {
    "dkarter/bullets.vim",
    lazy = true,
    ft = { "markdown", "txt" },
  },
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
}
