local view_open = false

-- 定义一个函数切换 Diffview 打开和关闭状态
local function toggle_diffview()
  if view_open then
    vim.cmd("DiffviewClose")
    view_open = false
  else
    vim.cmd("DiffviewOpen")
    view_open = true
  end
end

local function close_diffview()
  if vim.bo.filetype == "DiffviewFiles" then -- 判断当前文件是否为 Diffview 打开的文件
    vim.cmd("DiffviewClose") -- 关闭 Diffview 打开的文件
  end
end

-- 设置快捷键来切换 Diffview 面板
-- api.nvim_set_keymap("n", "<leader>dv", ":lua toggle_diffview()<CR>", { noremap = true, silent = true })
return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen" },
  keys = {
    { "<leader>df", mode = { "n" }, toggle_diffview, desc = "toggle diffview window" },
    { "q", mode = { "n" }, close_diffview, desc = "close diffview window" },
  },
}
