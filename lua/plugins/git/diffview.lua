-- Git Diff 视图：可视化比较代码差异
local function toggle_diffview()
  local diffview_open = false
  for _, win in ipairs(vim.api.nvim_tabpage_list_wins(0)) do
    local buf = vim.api.nvim_win_get_buf(win)
    if vim.bo[buf].filetype == "DiffviewFiles" then
      diffview_open = true
      break
    end
  end
  if diffview_open then
    vim.cmd("DiffviewClose")
  else
    vim.cmd("DiffviewOpen")
  end
end

return {
  "sindrets/diffview.nvim",
  cmd = { "DiffviewOpen" },
  keys = {
    { "<leader>df", mode = { "n" }, toggle_diffview, desc = "toggle diffview window" },
  },
}
