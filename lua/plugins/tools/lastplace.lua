-- 记住上次编辑位置，打开文件时自动跳转
return {
  "ethanholz/nvim-lastplace",
  event = "BufRead",
  config = function()
    require("nvim-lastplace").setup({
      -- 不记录光标位置的 buffer 类型
      lastplace_ignore_buftype = { "quickfix", "nofile", "help" },
      -- 不记录光标位置的文件类型
      lastplace_ignore_filetype = { "gitcommit", "gitrebase", "svn", "hgcommit" },
      lastplace_open_folds = true,
    })
  end,
}
