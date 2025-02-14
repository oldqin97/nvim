return {

  -- run :BookmarksInfo to see the running status of the plugin
  {
    "tomasky/bookmarks.nvim",
    -- after = "telescope.nvim",
    event = "VeryLazy",
    keys = {
      {
        "mm",
        function()
          require("bookmarks").bookmark_toggle()
        end,
        desc = "bookmark_toggle",
      },
      {
        "mi",
        function()
          require("bookmarks").bookmark_ann()
        end,
        desc = "bookmark_ann",
      },
      {
        "mc",
        function()
          require("bookmarks").bookmark_clean()
        end,
        desc = "bookmark_clean",
      },
      {
        "<A-b>",
        function()
          require("telescope").extensions.bookmarks.list()
        end,
        { desc = "bookmark list" },
      },
    },

    config = function()
      require("telescope").load_extension("bookmarks")
      require("bookmarks").setup({
        save_file = vim.fn.expand("~/.config/nvim/.bookmarks"),
        signs = {
          add = {
            hl = "BookMarksAdd",
            text = "🏷️",
            numhl = "BookMarksAddNr",
            linehl = "BookMarksAddLn",
          },
          ann = {
            hl = "BookMarksAnn",
            text = "",
            numhl = "BookMarksAnnNr",
            linehl = "BookMarksAnnLn",
          },
        },
      })
    end,
  },
}
