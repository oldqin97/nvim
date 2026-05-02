-- 注释隐藏/显示切换插件
-- 检测当前 buffer 是否包含注释
local function buffer_has_comments()
  local cs = vim.bo.commentstring
  local prefix = cs:match("^(.*)%%s") or cs
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(lines) do
    local trimmed = vim.trim(line)
    if vim.startswith(trimmed, prefix) then
      return true
    end
  end
  return false
end

-- 切换注释的隐藏与恢复
local function toggle_commentHide()
  if buffer_has_comments() then
    vim.cmd("CommentHideSave")
    print("🙈 已隐藏注释")
  else
    vim.cmd("CommentHideRestore")
    print("ℹ️ 恢复注释")
  end
end

return {
  "jiangxue-analysis/nvim.comment-hide",
  name = "comment-hide",
  lazy = true,
  keys = {
    { "<leader>ch", toggle_commentHide, desc = "comment toggle" },
  },
  config = function()
    require("comment-hide").setup({
      gitignore = true,
    })
  end,
}
