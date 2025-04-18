local Snacks = require("snacks")
local bk_config = require("bookmarks.config").config

return {
  bookmarks_pick = function()
    local items = {}
    -- 遍历所有书签数据（全局持久化存储）
    for filepath, marks in pairs(bk_config.cache.data) do
      for lnum_str, mark in pairs(marks) do
        local lnum = tonumber(lnum_str)
        -- mark.m 是当时行内容，mark.a 是可选的注释
        local ann = mark.a or ""
        local text = mark.m or ""
        -- 显示格式：相对路径:行号 [注释] 行内容
        local display = string.format(
          "%s:%d %s %s",
          vim.fn.fnamemodify(filepath, ":."),
          lnum,
          ann ~= "" and ("[" .. ann .. "]") or "",
          text
        )
        table.insert(items, {
          filename = filepath,
          lnum = lnum,
          display = display,
        })
      end
    end

    -- 调用 snacks.nvim 的 picker
    Snacks.picker({
      title = "Bookmarks",
      items = items,
      -- 如何在列表中渲染每一项
      -- format = function(item)
      --   return { { item.display, "" } }
      -- end,
      format = function(item)
        return {
          { item.display or vim.fn.fnamemodify(item.file, ":."), "" },
        }
      end,
      -- 强制使用包含预览面板的布局
      layout = { preset = "select", preview = false },
      -- 选中后跳转到对应文件和行
      confirm = function(picker, item)
        picker:close()
        -- 打开文件
        vim.cmd("edit " .. vim.fn.fnameescape(item.filename))
        -- 设置光标到指定行、列（列从 0 开始），这里取第 1 列
        vim.api.nvim_win_set_cursor(0, { item.lnum, 0 })
      end,
    })
  end,
}
