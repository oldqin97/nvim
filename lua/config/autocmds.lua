local augroup = vim.api.nvim_create_augroup("highlight_cmds", { clear = true })
local vim = vim
local api = vim.api
api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions
      - "o" -- O and o, don't continue comments
      - "r" -- But do continue when pressing enter.
  end,
})

vim.cmd([[ autocmd BufRead,BufNewFile *.org set filetype=org ]])

-- api.nvim_create_autocmd("BufReadPost", {
--   command = "HlSearchLensDisable",
-- })

-- 进入Insert模式切换为绝对行号
-- api.nvim_create_autocmd("InsertEnter", {
--   group = augroup,
--   pattern = "*",
--   callback = function()
--     vim.wo.relativenumber = false
--   end,
-- })
--
-- -- 退出Insert模式切换为相对行号
-- api.nvim_create_autocmd("InsertLeave", {
--   group = augroup,
--   pattern = "*",
--   callback = function()
--     vim.wo.relativenumber = true
--   end,
-- })
-- -- 切换到普通模式时启用相对行号
-- vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
--   pattern = "*",
--   command = "set relativenumber",
-- })
--
-- -- 切换到插入模式时启用绝对行号
-- vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
--   pattern = "*",
--   command = "set norelativenumber",
-- })
vim.api.nvim_create_autocmd({ "FileType" }, {
  pattern = {
    "lua",
    "javascript",
    "typescript",
    "vue",
    "html",
    "css",
    "scss",
    "less",
    "javascriptreact",
    "typescriptreact",
    "rust",
    "python",
    "json",
    "markdown",
    "c",
    "cpp",
    "yaml",
    "dart",
    "sql",
  },
  callback = function()
    vim.b.autoformat = false
  end,
})
