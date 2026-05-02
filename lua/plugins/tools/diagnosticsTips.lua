-- 行内诊断信息提示插件
return {
  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    priority = 1000,
    config = function()
      require("tiny-inline-diagnostic").setup({
        preset = "simple",
        transparent_bg = false,
      })
      vim.diagnostic.config({ virtual_text = false, signs = false })
    end,
  },
}
