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
      {
        "<C-f>",
        LazyVim.pick("grep_string"),
        desc = "grep_string",
      },

      { "<C-r>", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      -- {
      --   "<leader>ss",
      --   function()
      --     require("telescope.builtin").lsp_document_symbols({
      --       symbols = LazyVim.config.get_kind_filter(),
      --     })
      --   end,
      --   desc = "Goto Symbol",
      -- },
      -- {
      --   "<C-n>",
      --   LazyVim.telescope("spell_suggest"),
      --   desc = "Spell suggest",
      -- },
      {
        "<leader>sd",
        LazyVim.pick("diagnostics"),
        desc = "diagnostics",
      },
      { "<leader>/", false },
      { "<leader>gc", false },
      { "<leader><leader>", false },
      { "<leader>fc", false },
      { "<leader>sD", false },
      { "<leader>sm", false },
      { "<leader>fr", false },
    }
  end,
  opts = function()
    return {
      extensions_list = { "bookmarks" },
      defaults = {
        prompt_prefix = "  ",
        selection_caret = " ",
        initial_mode = "insert",
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = { prompt_position = "top", preview_width = 0.55 },
          vertical = { mirror = false },
          width = 0.87,
          height = 0.80,
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
