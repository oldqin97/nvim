local M = {}

-- =========================
-- CONFIG
-- =========================
M.config = {
  marker = "[DEBUG]",
}

-- =========================
-- 工具函数
-- =========================

-- 当前变量 / expression
function M.get_var()
  local mode = vim.fn.mode()

  if mode == "v" or mode == "V" then
    local s = vim.fn.getpos("'<")
    local e = vim.fn.getpos("'>")

    if s[2] == e[2] then
      local line = vim.api.nvim_get_current_line()
      return line:sub(s[3], e[3])
    end
  end

  return vim.fn.expand("<cword>")
end

-- 当前函数名（轻量版）
function M.get_function_name()
  local line_num = vim.fn.line(".")

  for i = line_num, 1, -1 do
    local line = vim.fn.getline(i)

    local fn = line:match("function%s+([%w_]+)")
      or line:match("const%s+([%w_]+)%s*=%s*%(")
      or line:match("([%w_]+)%s*=%s*%(")
      or line:match("def%s+([%w_]+)")
      or line:match("fn%s+([%w_]+)")
      or line:match("func%s+([%w_]+)")

    if fn then
      return fn
    end
  end

  return "anonymous"
end

-- context
function M.get_context()
  return {
    file = vim.fn.expand("%:t"),
    line = vim.fn.line("."),
    func = M.get_function_name(),
  }
end

-- 获取缩进
function M.get_indent(line)
  return line:match("^%s*") or ""
end

-- =========================
-- 智能插入位置
-- =========================
function M.get_insert_position()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local line = vim.api.nvim_get_current_line()

  -- Python: block 行（以 : 结尾）
  if vim.bo.filetype == "python" and line:match(":%s*$") then
    return row + 1, true -- 下一行 + 需要多缩进
  end

  return row + 1, false
end

-- =========================
-- formatter
-- =========================
M.formatters = {

  javascript = function(var, ctx)
    return string.format(
      'console.log("%s [%s:%d] %s.%s:", %s)',
      M.config.marker,
      ctx.file,
      ctx.line,
      ctx.func,
      var,
      var
    )
  end,

  typescript = function(var, ctx)
    return string.format(
      'console.log("%s [%s:%d] %s.%s:", %s)',
      M.config.marker,
      ctx.file,
      ctx.line,
      ctx.func,
      var,
      var
    )
  end,

  typescriptreact = function(var)
    return string.format('console.log("[DEBUG]", { %s })', var)
  end,

  javascriptreact = function(var)
    return string.format('console.log("[DEBUG]", { %s })', var)
  end,

  vue = function(var)
    return string.format('console.log("[DEBUG]", { %s })', var)
  end,

  python = function(var, ctx)
    return string.format('print(f"%s [%s:%d] %s.%s: {%s}")', M.config.marker, ctx.file, ctx.line, ctx.func, var, var)
  end,

  rust = function(var, ctx)
    return string.format(
      'println!("%s [{}:{}] %s.%s: {{:?}}", file!(), line!(), %s);',
      M.config.marker,
      ctx.func,
      var,
      var
    )
  end,

  go = function(var, ctx)
    return string.format(
      'fmt.Printf("%s [%s:%d] %s.%s: %%+v\\n", %s)',
      M.config.marker,
      ctx.file,
      ctx.line,
      ctx.func,
      var,
      var
    )
  end,
}

-- =========================
-- 核心：插入 log
-- =========================
function M.insert_log()
  local ft = vim.bo.filetype
  local var = M.get_var()
  local ctx = M.get_context()

  local formatter = M.formatters[ft]
  if not formatter then
    formatter = function(v)
      return 'print("' .. v .. ':", ' .. v .. ")"
    end
  end

  local log_line = formatter(var, ctx)

  local row, need_extra_indent = M.get_insert_position()
  local current_line = vim.api.nvim_get_current_line()

  local indent = M.get_indent(current_line)

  -- Python block 额外缩进
  if need_extra_indent then
    indent = indent .. string.rep(" ", vim.o.shiftwidth)
  end

  vim.api.nvim_buf_set_lines(0, row - 1, row - 1, false, {
    indent .. log_line,
  })

  -- 自动 reindent
  vim.cmd("normal! ==")
end

-- =========================
-- log 函数入口
-- =========================
function M.log_function()
  local ctx = M.get_context()
  local ft = vim.bo.filetype

  local line

  if ft == "python" then
    line = string.format('print(f"%s Enter %s()")', M.config.marker, ctx.func)
  else
    line = string.format('console.log("%s Enter %s()")', M.config.marker, ctx.func)
  end

  local row = vim.api.nvim_win_get_cursor(0)[1]
  local indent = M.get_indent(vim.api.nvim_get_current_line())

  vim.api.nvim_buf_set_lines(0, row, row, false, {
    indent .. line,
  })
end

-- =========================
-- 清理 log
-- =========================
function M.clear_logs()
  vim.cmd(string.format("g/%s/d", M.config.marker))
end

-- =========================
-- Telescope 搜索
-- =========================
function M.search_logs()
  require("telescope.builtin").grep_string({
    search = M.config.marker,
  })
end

return M
