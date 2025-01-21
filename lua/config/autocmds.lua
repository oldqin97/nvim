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

-- 将 .wxml 文件识别为 html 文件类型
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.wxml" },
  command = "setfiletype html",
})

-- 将 .wxss 文件识别为 css 文件类型
vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "*.wxss" },
  command = "setfiletype css",
})

-- 关闭文件时自动保存
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

-- -- 设置相同单词的背景高亮颜色
-- -- vim.cmd([[ highlight LspReferenceText guibg=#FF8800 guifg=#EEEEEE ]])
-- vim.cmd([[ highlight LspReferenceRead guibg=#FF8800 guifg=#EEEEEE ]])
-- vim.cmd([[ highlight LspReferenceWrite guibg=#FF8800 guifg=#EEEEEE ]])
--
-- -- 自动高亮当前光标下的单词
-- vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--   callback = function()
--     vim.lsp.buf.document_highlight()
--   end,
-- })
-- vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--   callback = function()
--     vim.lsp.buf.clear_references()
--   end,
-- })
if
  client
  and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
  and vim.bo.filetype ~= "bigfile"
then
  local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
  vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
    buffer = event.buf,
    group = highlight_augroup,
    callback = vim.lsp.buf.document_highlight,
  })

  vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
    buffer = event.buf,
    group = highlight_augroup,
    callback = vim.lsp.buf.clear_references,
  })

  vim.api.nvim_create_autocmd("LspDetach", {
    group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
    callback = function(event2)
      vim.lsp.buf.clear_references()
      vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
    end,
  })
end

-- 重新定义 LSP 高亮颜色
vim.cmd([[
  highlight LspReferenceText guibg=#7c6f64 gui=bold
  highlight LspReferenceRead guibg=#7c6f64 gui=bold
  highlight LspReferenceWrite guibg=#7c6f64 gui=bold
]])
