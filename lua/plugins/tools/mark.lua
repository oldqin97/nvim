return {
  {
    "tomasky/bookmarks.nvim",
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
          -- Telescope.bookmarks.list()
          require("plugins.conf.bookmarkConf").bookmarks_pick()
        end,
        { desc = "bookmark list" },
      },
    },

    config = function()
      require("bookmarks").setup({
        save_file = vim.fn.expand("~/.config/nvim/.bookmarks"),
        numhl = true,
        linehl = true,
        signs = {
          add = {
            hl = "BookMarksAdd",
            text = "󰄲",
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
