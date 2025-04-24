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
      -- 1. 读取当前目录并清理末尾多余斜杠
      local cwd = vim.fn.getcwd():gsub("/+$", "") -- 把 "/foo/bar///" 这种多斜杠情况统一为 "/foo/bar"

      -- 2. 从 cwd 里提取项目名
      local project_name = vim.fn.fnamemodify(cwd, ":t") -- 直接取尾部目录名称

      -- 3. 构造并创建保存书签的目录
      local bookmarks_dir = vim.fn.stdpath("data") .. "/bookmarks"
      vim.fn.mkdir(bookmarks_dir, "p") -- 递归创建，类似 `mkdir -p`

      -- 4. 最终拼出项目专属的文件路径
      local save_file = string.format("%s/%s.json", bookmarks_dir, project_name)

      require("bookmarks").setup({

        -- save_file = vim.fn.expand("~/.config/nvim/.bookmarks"),
        save_file = save_file,
        -- numhl = true,
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
