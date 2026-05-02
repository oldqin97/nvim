-- 书签管理配置：使用 snacks.picker 浏览和跳转书签
local Snacks = require("snacks")
local bk_config = require("bookmarks.config").config

return {
  bookmarks_pick = function()
    local items = {}
    -- 遍历所有书签数据（全局持久化存储）
    for filepath, marks in pairs(bk_config.cache.data) do
      for lnum_str, mark in pairs(marks) do
        local lnum = tonumber(lnum_str)
        local text = mark.m or ""
        local ann = mark.a and ("[ " .. mark.a .. "]") or "[󰄲 none]"
        local path = vim.fn.fnamemodify(filepath, ":.")
        table.insert(items, {
          filename = filepath,
          file = filepath,
          pos = { lnum, 0 },
          lnum = lnum,
          text = ann,
          ann = text,
          path = path,
        })
      end
    end

    -- 调用 snacks.nvim 的 picker 展示书签列表
    Snacks.picker({
      title = "Bookmarks",
      items = items,
      -- 列表中每一项的渲染格式
      format = function(item)
        return {
          { "" .. item.text, "BookMarksSign" },
          { "   " .. item.path, "Directory" },
          { ":" .. item.lnum, "Directory" },
        }
      end,
      layout = { preset = "ivy" },
      -- 选中后跳转到对应文件和行
      confirm = function(picker, item)
        picker:close()
        vim.cmd("edit " .. vim.fn.fnameescape(item.filename))
        vim.api.nvim_win_set_cursor(0, { item.lnum, 0 })
      end,
    })
  end,
}
