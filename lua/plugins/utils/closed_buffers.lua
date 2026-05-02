-- 已关闭 Buffer 历史记录与快速恢复
local Snacks = require("snacks")

local M = {}
local closed_buffers = {}

-- 记录关闭过的 buffer
vim.api.nvim_create_autocmd("BufDelete", {
  callback = function(args)
    local filepath = vim.api.nvim_buf_get_name(args.buf)
    if filepath ~= "" then
      local filename = vim.fn.fnamemodify(filepath, ":t")

      -- 去重：删除旧记录
      for i = #closed_buffers, 1, -1 do
        if closed_buffers[i].filename == filepath then
          table.remove(closed_buffers, i)
        end
      end

      -- 插入到列表头部
      table.insert(closed_buffers, 1, {
        filename = filepath,
        file = filepath,
        text = "   ",
        path = filename,
        time = os.time(),
      })
      -- 最多保留 10 条记录
      if #closed_buffers > 10 then
        table.remove(closed_buffers)
      end
    end
  end,
})

-- 时间差转人类可读格式
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

-- 显示已关闭 buffer 列表的 picker
function M.closed_buffers()
  Snacks.picker({
    title = "Recently Closed Buffers",
    items = closed_buffers,
    format = function(item)
      return {
        { item.text .. "", "ErrorMsg" },
        { "[" .. reltime(item.time) .. "] ", "Comment" },
        { item.path, "Directory" },
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
