return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  keys = {},
  opts = function()
    return {
      extensions_list = { "bookmarks" },
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "bottom", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.7,
          height = 0.5,
          preview_cutoff = 120,
        },
        mappings = {
          n = { ["<ESC>"] = require("telescope.actions").close },
          i = {
            ["<ESC>"] = require("telescope.actions").close,
            ["<Tab>"] = require("telescope.actions").select_default,
          },
        },
      },
    }
  end,
}
