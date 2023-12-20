return {
  "akinsho/flutter-tools.nvim",
  ft = "dart",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  config = function()
    require("flutter-tools").setup({
      widget_guides = {
        enabled = false,
      },
      outline = {
        auto_open = false,
      },
      lsp = {
        color = {
          enabled = true,
          background = true,
          background_color = nil,
          foreground = false,
          virtual_text = true,
          virtual_text_str = "■",
        },
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
  end,
}
