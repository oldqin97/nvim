-- Flutter/Dart 开发工具配置
return {
  {
    "akinsho/flutter-tools.nvim",
    ft = "dart",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function()
      require("flutter-tools").setup({
        widget_guides = { enabled = false },
        outline = { auto_open = false },
        closing_tags = { enabled = false },
        lsp = {
          settings = {
            autostart = true,
            showTodos = true,
            completeFunctionCalls = true,
            renameFilesWithClasses = "always",
            enableSnippets = true,
            updateImportsOnRename = true,
          },
        },
      })
      vim.lsp.document_color.enable()
    end,
  },
}
