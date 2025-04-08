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
    "jsonc",
  },
  callback = function()
    vim.b.autoformat = false
  end,
})

-- snacks_input 插件关闭窗口
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*", -- 匹配所有缓冲区
  callback = function()
    -- 确认当前窗口是 snacks_input 的窗口（通过文件类型或其他标识）
    if vim.bo.filetype == "snacks_input" then
      vim.api.nvim_win_close(0, true) -- 关闭当前窗口
    end
  end,
})

-- 自动高亮当前光标下的单词
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

vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
      if client.server_capabilities.documentHighlightProvider then
        pcall(vim.lsp.buf.document_highlight)
        break
      end
    end
  end,
})

vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
  callback = function()
    local bufnr = vim.api.nvim_get_current_buf()
    for _, client in ipairs(vim.lsp.get_active_clients({ bufnr = bufnr })) do
      if client.server_capabilities.documentHighlightProvider then
        pcall(vim.lsp.buf.clear_references)
        break
      end
    end
  end,
})

vim.filetype.add({
  pattern = {
    [".env.*"] = "sh",
    [".env"] = "sh",
    -- ["*.wxml"] = "html",
    -- ["*.wxss"] = "css",
  },
  extension = {
    wxml = "html",
    wxss = "css",
  },
})

-- 大文件自动关闭treesitter
-- if
--   client
--   and client.supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight)
--   and vim.bo.filetype ~= "bigfile"
-- then
--   local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
--   vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--     buffer = event.buf,
--     group = highlight_augroup,
--     callback = vim.lsp.buf.document_highlight,
--   })
--
--   vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--     buffer = event.buf,
--     group = highlight_augroup,
--     callback = vim.lsp.buf.clear_references,
--   })
--
--   vim.api.nvim_create_autocmd("LspDetach", {
--     group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
--     callback = function(event2)
--       vim.lsp.buf.clear_references()
--       vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event2.buf })
--     end,
--   })
-- end
