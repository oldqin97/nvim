return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  keys = function()
    return {
      { "<A-p>", LazyVim.pick("files"), desc = "Find Files (Root Dir)" },
      {
        "<A-f>",
        LazyVim.pick("live_grep"),
        desc = "live_grep",
      },
      -- {
      --   "<C-n>",
      --   LazyVim.telescope("spell_suggest"),
      --   desc = "Spell suggest",
      -- },
      {
        "<leader>sd",
        LazyVim.pick("diagnostics"),
        desc = "spell suggest",
      },
      { "<leader>/", false },
      { "<leader>gc", false },
      { "<leader><leader>", false },
      { "<leader>fc", false },
      { "<leader>sD", false },
      { "<leader>sm", false },
    }
  end,
  opts = {
    extensions_list = { "bookmarks" },
    defaults = {
      prompt_prefix = "  ",
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
