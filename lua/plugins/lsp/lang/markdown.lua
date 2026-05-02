-- Markdown 增强：列表符号自动补全 + 实时预览 + 所见即所得
return {
  -- Markdown 列表符号自动续行
  {
    "dkarter/bullets.vim",
    ft = { "markdown", "text" },
  },
  -- Markdown 所见即所得渲染
  {
    "MeanderingProgrammer/render-markdown.nvim",
    ft = { "markdown" },
    opts = {
      file_types = { "markdown" },
      render_modes = { "n", "c", "v" },
      anti_conceal = { enabled = false },
      heading = {
        sign = true,
        icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
      },
      code = {
        sign = true,
        width = "block",
        right_pad = 1,
      },
      checkbox = {
        enabled = true,
        unchecked = { icon = " 󰄱 " },
        checked = { icon = " 󰱒 " },
      },
      link = {
        enabled = true,
      },
      bullet = {
        enabled = true,
        icons = { "●", "○", "◆", "◇" },
      },
      pipe_table = {
        enabled = true,
      },
    },
  },
  -- Markdown 实时预览
  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    config = function()
      vim.cmd([[do FileType]])
      vim.cmd([[let g:mkdp_auto_close = 0]])
    end,
    keys = {
      { "<leader>mp", ft = "markdown", "<cmd>MarkdownPreviewToggle<cr>", desc = "Markdown Preview" },
      { "<leader>ms", ft = "markdown", "<cmd>MarkdownPreviewStop<cr>", desc = "Markdown Preview" },
    },
  },
}
