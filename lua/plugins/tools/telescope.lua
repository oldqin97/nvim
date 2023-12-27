local Util = require("lazyvim.util.init")
return {
  "nvim-telescope/telescope.nvim",
  keys = {
    { "<A-p>", Util.telescope("files"), desc = "Find files" },
    {
      "<A-f>",
      Util.telescope("live_grep"),
      desc = "live_grep",
    },
    {
      "<A-n>",
      Util.telescope("spell_suggest"),
      desc = "Spell suggest",
    },
    {
      "<leader>sd",
      Util.telescope("diagnostics"),
      desc = "spell suggest",
    },
    { "<leader>/", false },
    { "<leader><leader>", false },
    { "<leader>fc", false },
    { "<leader>sD", false },
    { "<leader>sm", false },
  },
  opts = {
    extensions_list = { "bookmarks" },
    defaults = {
      prompt_prefix = "  ",
      selection_caret = " ",
      initial_mode = "insert",
      mappings = {
        n = { ["<ESC>"] = require("telescope.actions").close },
        i = {
          ["<ESC>"] = require("telescope.actions").close,
          ["<Tab>"] = require("telescope.actions").select_default,
        },
      },
    },
  },
}
