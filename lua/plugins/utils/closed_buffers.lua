local Snacks = require("snacks")

local M = {}
local closed_buffers = {}

-- 记录关闭过的 buffer
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    local filepath = vim.api.nvim_buf_get_name(args.buf)
    if filepath ~= "" then
      local filename = vim.fn.fnamemodify(filepath, ":t") -- 只取文件名

      for i = #closed_buffers, 1, -1 do
        if closed_buffers[i].filename == filepath then
          table.remove(closed_buffers, i)
        end
      end

      table.insert(closed_buffers, 1, {
        filename = filepath, -- 文件绝对路径
        file = filepath, -- snacks 预览器识别的字段
        text = "   ", -- 前缀标志
        path = filename, -- 显示用的文件名
        time = os.time(),
      })
      if #closed_buffers > 10 then
        table.remove(closed_buffers)
      end
    end
  end,
})

-- 把时间差转成人类可读格式
local function reltime(t)
  local diff = os.difftime(os.time(), t)
  if diff < 60 then
    return diff .. "s ago"
  elseif diff < 3600 then
    return math.floor(diff / 60) .. "m ago"
  elseif diff < 86400 then
    return math.floor(diff / 3600) .. "h ago"
  else
    return math.floor(diff / 86400) .. "d ago"
  end
end

-- picker
function M.closed_buffers()
  Snacks.picker({
    title = "Recently Closed Buffers",
    items = closed_buffers,
    format = function(item)
      return {
        { item.text .. "", "ErrorMsg" }, -- 红色关闭标志
        { "[" .. reltime(item.time) .. "] ", "Comment" }, -- 相对时间
        { item.path, "Directory" }, -- 文件名
      }
    end,
    layout = { preset = "ivy" },
    sort = function(a, b)
      return a.time > b.time
    end,
    confirm = function(picker, item)
      picker:close()
      vim.cmd("edit " .. vim.fn.fnameescape(item.filename))
    end,
    preview = "file",
  })
end

return M
