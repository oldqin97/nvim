return {
  "nvim-telescope/telescope.nvim",
  event = "VeryLazy",
  keys = {},
  -- keys = function()
  --   return {
  --     { "<A-p>", false },
  --     {
  --       "<A-f>",
  --       false,
  --     },
  --     {
  --       "<C-f>",
  --       false,
  --     },
  --
  --     { "<leader>r", false },
  --     -- {
  --     --   "<leader>ss",
  --     --   function()
  --     --     require("telescope.builtin").lsp_document_symbols({
  --     --       symbols = LazyVim.config.get_kind_filter(),
  --     --     })
  --     --   end,
  --     --   desc = "Goto Symbol",
  --     -- },
  --     -- {
  --     --   "<C-n>",
  --     --   LazyVim.telescope("spell_suggest"),
  --     --   desc = "Spell suggest",
  --     -- },
  --     {
  --       "<leader>sd",
  --       false,
  --     },
  --     { "<leader>/", false },
  --     { "<leader>gc", false },
  --     { "<leader><leader>", false },
  --     { "<leader>fc", false },
  --     { "<leader>sD", false },
  --     { "<leader>sm", false },
  --     { "<leader>fr", false },
  --   }
  -- end,
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
