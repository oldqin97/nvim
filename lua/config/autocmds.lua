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
    "jsonc",
  },
  callback = function()
    vim.b.autoformat = false
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

-- 当 LSP 附加到缓冲区时，启用光标悬停高亮
-- vim.api.nvim_create_autocmd("LspAttach", {
--   callback = function(args)
--     local bufnr = args.buf
--     local clients = vim.lsp.get_clients({ bufnr = bufnr })
--
--     -- 关键检查 1: 立即过滤无 LSP 的缓冲区
--     if #clients == 0 then
--       return
--     end
--
--     -- 定义安全操作函数
--     local function safe_highlight()
--       -- 关键检查 2: 确认缓冲区仍然有效
--       if not vim.api.nvim_buf_is_valid(bufnr) then
--         return
--       end
--       -- 关键检查 3: 实时检测 LSP 客户端
--       if vim.tbl_isempty(vim.lsp.buf_get_clients(bufnr)) then
--         return
--       end
--       -- 关键措施 4: 异常捕获
--       pcall(vim.lsp.buf.document_highlight)
--     end
--
--     local function safe_clear()
--       if not vim.api.nvim_buf_is_valid(bufnr) then
--         return
--       end
--       if vim.tbl_isempty(vim.lsp.buf_get_clients(bufnr)) then
--         return
--       end
--       pcall(vim.lsp.buf.clear_references)
--     end
--
--     -- 设置自动命令组便于清理
--     local group_name = "LspHighlightGroup_" .. bufnr
--     vim.api.nvim_create_augroup(group_name, { clear = true })
--
--     -- 高亮触发
--     vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
--       group = group_name,
--       buffer = bufnr,
--       callback = safe_highlight,
--     })
--
--     -- 清除触发
--     vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
--       group = group_name,
--       buffer = bufnr,
--       callback = safe_clear,
--     })
--
--     -- 关键措施 5: 缓冲区卸载时自动清理
--     vim.api.nvim_create_autocmd("BufUnload", {
--       group = group_name,
--       buffer = bufnr,
--       callback = function()
--         pcall(vim.lsp.buf.clear_references)
--         vim.api.nvim_del_augroup_by_name(group_name)
--       end,
--     })
--   end,
-- })
-- 大文件自动关闭treesitter
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
