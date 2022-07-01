local myAutoGroup = vim.api.nvim_create_augroup("myAutoGroup", {
  clear = true,
})

local autocmd = vim.api.nvim_create_autocmd

-- nvim-tree 自动关闭
autocmd("BufEnter", {
  nested = true,
  group = myAutoGroup,
  callback = function()
    vim.api.nvim_command("EditorConfigEnable")
    if #vim.api.nvim_list_wins() == 1 and vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil then
      vim.cmd("quit")
    end
  end,
})

-- 进入Terminal 自动进入插入模式
autocmd("TermOpen", {
  group = myAutoGroup,
  command = "startinsert",
})

-- 保存时自动格式化
-- autocmd("BufWritePre", {
--   group = myAutoGroup,
--   pattern = {
--     "*.lua",
--     "*.py",
--     "*.sh",
--     "*.js",
--     "*.ts",
--     "*.jsx",
--     "*.tsx",
--     "*.html",
--     "*.css",
--     "*.scss",
--     "*.less",
--     "*.vue",
--   },
--   callback = vim.lsp.buf.formatting_sync,
-- })

-- 修改lua/plugins.lua 自动更新插件
-- autocmd("BufWritePost", {
--   group = myAutoGroup,
--   -- autocmd BufWritePost plugins.lua source <afile> | PackerSync
--   callback = function()
--     if vim.fn.expand("<afile>") == "lua/plugins.lua" then
--       vim.api.nvim_command("source lua/plugins.lua")
--       vim.api.nvim_command("PackerSync")
--     end
--   end,
-- })

-- Highlight on yank
autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = myAutoGroup,
  pattern = "*",
})

-- 用o换行不要延续注释
autocmd("BufEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      + "r" -- But do continue when pressing enter.
  end,
})

-- 进入Insert模式切换为绝对行号
autocmd("InsertEnter", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = false
  end,
})

-- 退出Insert模式切换为相对行号
autocmd("InsertLeave", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.wo.relativenumber = true
  end,
})

-- 退出关闭md预览服务器
autocmd("QuitPre", {
  group = myAutoGroup,
  pattern = "*",
  callback = function()
    vim.api.nvim_command("LivedownKill")
  end,
})
