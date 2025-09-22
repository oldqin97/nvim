-- 1. 注释检测函数（基于 commentstring）
local function buffer_has_comments()
  local cs = vim.bo.commentstring -- e.g. "-- %s"
  local prefix = cs:match("^(.*)%%s") or cs -- 提取注释前缀，如 "-- "
  local lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
  for _, line in ipairs(lines) do
    local trimmed = vim.trim(line)
    if vim.startswith(trimmed, prefix) then
      return true
    end
  end
  return false
end

-- 2. 用于隐藏/恢复注释的状态和切换函数
local function toggle_commentHide()
  if buffer_has_comments() then
    -- 如果检测到有注释
    vim.cmd("CommentHideSave") -- 隐藏注释
    print("🙈 已隐藏注释")
  else
    -- 如果检测不到注释，则确保状态同步为“已恢复”
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
      gitignore = true, -- Automatically add .annotations/ to .gitignore.
    })
  end,
}
