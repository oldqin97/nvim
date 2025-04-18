return {
  -- diagnostics 提示
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach`
    priority = 1000, -- needs to be loaded in first
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
        transparent_bg = false,
      })
      vim.diagnostic.config({ virtual_text = false, signs = false })
    end,
  },
}
