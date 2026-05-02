-- 书签标记插件：标记/跳转/管理代码位置
return {
  {
    "tomasky/bookmarks.nvim",
    event = "VeryLazy",
    keys = {
      { "mm", function() require("bookmarks").bookmark_toggle() end, desc = "bookmark_toggle" },
      { "mi", function() require("bookmarks").bookmark_ann() end, desc = "bookmark_ann" },
      { "mc", function() require("bookmarks").bookmark_clean() end, desc = "bookmark_clean" },
      { "<A-b>", function() require("plugins.conf.bookmarkConf").bookmarks_pick() end, { desc = "bookmark list" } },
    },
    config = function()
      -- 从当前工作目录提取项目名
      local cwd = vim.fn.getcwd():gsub("/+$", "")
      local project_name = vim.fn.fnamemodify(cwd, ":t")

      -- 构造项目专属书签存储路径
      local bookmarks_dir = vim.fn.stdpath("data") .. "/bookmarks"
      vim.fn.mkdir(bookmarks_dir, "p")
      local save_file = string.format("%s/%s.json", bookmarks_dir, project_name)

      require("bookmarks").setup({
        save_file = save_file,
        linehl = true,
        signs = {
          add = {
            hl = "BookMarksAdd",
            text = "󰄲 ",
            numhl = "BookMarksAddNr",
            linehl = "BookMarksAddLn",
          },
          ann = {
            hl = "BookMarksAnn",
            text = " ",
            numhl = "BookMarksAnnNr",
            linehl = "BookMarksAnnLn",
          },
        },
      })
    end,
  },
}
