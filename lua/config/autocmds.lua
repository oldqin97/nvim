local api = vim.api

-- 进入 buffer 时，禁止注释自动插入续行
api.nvim_create_autocmd("BufEnter", {
  pattern = "*",
  callback = function()
    vim.opt.formatoptions = vim.opt.formatoptions - "o"
  end,
})

-- 将 .org 文件识别为 org 文件类型
api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = "*.org",
  callback = function()
    vim.bo.filetype = "org"
  end,
})

-- 根据模式切换光标颜色：普通模式为橙色，可视模式为白色
local function set_cursor_color(mode)
  if mode == "n" then
    api.nvim_set_hl(0, "Cursor", { fg = "#282828", bg = "#fe8019" })
  elseif mode == "v" or mode == "V" or mode == "\22" then
    api.nvim_set_hl(0, "Cursor", { fg = "#282828", bg = "#ebdbb2" })
  end
end

api.nvim_create_autocmd("ModeChanged", {
  callback = function()
    set_cursor_color(vim.fn.mode())
  end,
})

-- 离开插入模式时，自动关闭 snacks 输入窗口
api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    if vim.bo.filetype == "snacks_input" then
      api.nvim_win_close(0, true)
    end
  end,
})

-- 文件类型检测：env 文件识别为 sh，微信小程序文件类型映射
vim.filetype.add({
  pattern = {
    [".env.*"] = "sh",
    [".env"] = "sh",
  },
  extension = {
    wxml = "html",
    wxss = "css",
  },
})

-- 诊断信息行高亮：在包含诊断信息的行上添加背景高亮
local ns_id = api.nvim_create_namespace("diagnostic_line_highlight")

local function update_diagnostic_line_highlights(bufnr)
  api.nvim_buf_clear_namespace(bufnr, ns_id, 0, -1)

  local diagnostics = vim.diagnostic.get(bufnr)
  local seen_lines = {}
  for _, diagnostic in ipairs(diagnostics) do
    local lnum = diagnostic.lnum
    local severity = diagnostic.severity

    if not seen_lines[lnum] then
      seen_lines[lnum] = true

      -- 根据诊断严重程度选择不同的高亮组
      local hl_group = ({
        [vim.diagnostic.severity.ERROR] = "DiagnosticLineError",
        [vim.diagnostic.severity.WARN] = "DiagnosticLineWarn",
        [vim.diagnostic.severity.INFO] = "DiagnosticLineInfo",
        [vim.diagnostic.severity.HINT] = "DiagnosticLineHint",
      })[severity or vim.diagnostic.severity.ERROR]

      if hl_group then
        local lines = api.nvim_buf_get_lines(bufnr, lnum, lnum + 1, false)
        local line_text = lines[1]
        if not line_text then
          return
        end

        local end_col = #(line_text:match("^(.-)%s*$") or "")

        api.nvim_buf_set_extmark(bufnr, ns_id, lnum, 0, {
          end_col = end_col,
          hl_group = hl_group,
        })
      end
    end
  end
end

api.nvim_create_autocmd("DiagnosticChanged", {
  callback = function(args)
    local bufnr = args.buf
    if api.nvim_buf_is_valid(bufnr) then
      update_diagnostic_line_highlights(bufnr)
    end
  end,
})
