return {

  {
    "LintaoAmons/bookmarks.nvim",
    event = "VeryLazy",
    -- pin the plugin at specific version for stability
    -- backup your bookmark sqlite db when there are breaking changes
    -- tag = "v2.3.0",
    keys = {
      {
        "mm",
        "<cmd>BookmarksMark<cr>",
        desc = "bookmark_toggle",
      },
      {
        "mc",
        function()
          require("bookmarks.commands").delete_mark_of_current_file()
        end,
        desc = "bookmark_clean",
      },
      {
        "<A-b>",
        "<cmd>BookmarksGoto<cr>",
        { desc = "bookmark list" },
      },
    },
    dependencies = {
      { "kkharji/sqlite.lua" },
      { "nvim-telescope/telescope.nvim" },
      { "stevearc/dressing.nvim" }, -- optional: better UI
    },
    config = function()
      local opts = {} -- check the "./lua/bookmarks/default-config.lua" file for all the options
      require("bookmarks").setup(opts) -- you must call setup to init sqlite db
    end,
  },

  -- run :BookmarksInfo to see the running status of the plugin
  -- {
  --   "tomasky/bookmarks.nvim",
  --   -- after = "telescope.nvim",
  --   event = "VeryLazy",
  --   keys = {
  --     {
  --       "mm",
  --       function()
  --         require("bookmarks").bookmark_toggle()
  --       end,
  --       desc = "bookmark_toggle",
  --     },
  --     {
  --       "mi",
  --       function()
  --         require("bookmarks").bookmark_ann()
  --       end,
  --       desc = "bookmark_ann",
  --     },
  --     {
  --       "mc",
  --       function()
  --         require("bookmarks").bookmark_clean()
  --       end,
  --       desc = "bookmark_clean",
  --     },
  --     {
  --       "<A-b>",
  --       function()
  --         require("telescope").extensions.bookmarks.list()
  --         -- Telescope.bookmarks.list()
  --       end,
  --       { desc = "bookmark list" },
  --     },
  --   },
  --
  --   config = function()
  --     require("bookmarks").setup({
  --       save_file = vim.fn.expand("~/.config/nvim/.bookmarks"),
  --       signs = {
  --         add = {
  --           hl = "BookMarksAdd",
  --           text = "󰄲",
  --           numhl = "BookMarksAddNr",
  --           linehl = "BookMarksAddLn",
  --         },
  --         ann = {
  --           hl = "BookMarksAnn",
  --           text = "",
  --           numhl = "BookMarksAnnNr",
  --           linehl = "BookMarksAnnLn",
  --         },
  --       },
  --     })
  --   end,
  -- },
}
