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
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
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
    for _, client in ipairs(vim.lsp.get_clients({ bufnr = bufnr })) do
      if client.server_capabilities.documentHighlightProvider then
        pcall(vim.lsp.buf.clear_references)
        break
      end
    end
  end,
})

-- 文件类型自动识别
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

-- 创建 namespace，用于清除和更新高亮
local ns_id = vim.api.nvim_create_namespace("diagnostic_line_highlight")

-- 定义函数：更新整个 buffer 的 diagnostic line 高亮
local function update_diagnostic_line_highlights(bufnr)
  vim.api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

  local diagnostics = vim.diagnostic.get(bufnr)

  -- 为每一条 diagnostic 添加高亮（仅高亮整行一次）
  local seen_lines = {}
  for _, diagnostic in ipairs(diagnostics) do
    local lnum = diagnostic.lnum
    local severity = diagnostic.severity

    if not seen_lines[lnum] then
      seen_lines[lnum] = true

      local hl_group = ({
        [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
        [vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
      })[severity or vim.diagnostic.severity.ERROR]

      if hl_group then
        -- vim.api.nvim_buf_add_highlight(bufnr, ns_id, hl_group, lnum, 0, -1)

        -- 获取行文本
        local line_text = vim.api.nvim_buf_get_lines(bufnr, lnum, lnum + 1, false)[1]

        -- 找到非空字符结束的列（忽略尾部空白）
        local end_col = #(line_text:match("^(.-)%s*$") or "")

        -- 设置精确高亮
        vim.api.nvim_buf_set_extmark(bufnr, ns_id, lnum, 0, {
          end_col = end_col,
          hl_group = hl_group,
        })
      end
    end
  end
end

-- 自动在 diagnostic 更新时调用上面的函数
vim.api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function(args)
    local bufnr = args.buf
    if vim.api.nvim_buf_is_valid(bufnr) then
      update_diagnostic_line_highlights(bufnr)
    end
  end,
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
