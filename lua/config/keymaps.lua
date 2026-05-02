local map = LazyVim.safe_keymap_set
local smart_splits = require("smart-splits")

-- 自定义注释行函数：空行追加注释符号，否则切换注释
local function comment_line()
  local line = vim.api.nvim_get_current_line()
  local row = vim.api.nvim_win_get_cursor(0)[1]
  local commentstring = vim.bo.commentstring
  local comment = commentstring:gsub("%%s", "")
  local index = vim.bo.commentstring:find("%%s")

  if not line:find("%S") then
    vim.api.nvim_buf_set_lines(0, row - 1, row, false, { line .. comment })
    vim.api.nvim_win_set_cursor(0, { row, #line + index - 1 })
  else
    require("vim._comment").toggle_lines(row, row, { row, 0 })
  end
end

map("n", "gk", comment_line)

-- 打印变量日志
map({ "v", "n" }, "<leader>pb", function()
  require("plugins.utils.log").insert_log()
end, { desc = "print variable" })

-- 关闭当前页面
map({ "n", "i", "v" }, "<C-q>", "<cmd>q<CR>", { desc = "close page" })

-- 移动行：S-j 下移，S-k 上移
map("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- 格式化文件
map({ "i", "x", "n", "s" }, "<A-s>", "<cmd>LazyFormat<cr>", { desc = "format file" })

-- 光标移动：S-h 到行首，S-l 到行尾
map("n", "<S-h>", "^", { desc = "move cursor to begin" })
map("n", "<S-l>", "$", { desc = "move cursor to end" })
map("v", "<S-h>", "^", { desc = "move cursor to begin" })
map("v", "<S-l>", "$h", { desc = "move cursor to end" })

-- 删除操作
map("n", "dh", "d^x", { desc = "move cursor to start" })
map("n", "dl", "d$", { desc = "move cursor to end" })

-- spider 驼峰跳转
map({ "x", "n", "s", "o" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "spider-w" })
map({ "x", "n", "s", "o" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "spider-b" })

-- 折叠：zz 关闭，Z 全部展开
map("n", "zz", "zc", { desc = "fold close" })
map("n", "Z", "zR", { desc = "fold open" })

-- Git 冲突解决
map("n", "<leader>co", "<cmd>ConflictMarkerOurselves<CR>", { desc = "Conflict Ourselves" })
map("n", "<leader>ct", "<cmd>ConflictMarkerThemselves<CR>", { desc = "Conflict Themselves" })
map("n", "<leader>cb", "<cmd>ConflictMarkerBoth<CR>", { desc = "Conflict Both" })

-- Flash 快速跳转
map({ "x", "n", "o" }, "f", function()
  require("flash").jump()
end, { desc = "Flash" })

-- 窗口大小调整
map("n", "s", "=", { desc = "replace s" })
map("n", "sh", "<cmd> vertical resize +5<CR>", { desc = "increase width" })
map("n", "sl", "<cmd> vertical resize -5<CR>", { desc = "decrease width" })
map("n", "sk", "<cmd> resize +5<CR>", { desc = "increase height" })
map("n", "sj", "<cmd> resize -5<CR>", { desc = "decrease height" })

-- tmux 导航：使用 C-h/j/k/l 在 nvim 窗口和 tmux 面板间移动
map({ "n", "t" }, "<C-h>", function()
  smart_splits.move_cursor_left()
end, { desc = "Go to left window or tmux pane" })

map({ "n", "t" }, "<C-j>", function()
  smart_splits.move_cursor_down()
end, { desc = "Go to lower window or tmux pane" })

map({ "n", "t" }, "<C-k>", function()
  smart_splits.move_cursor_up()
end, { desc = "Go to upper window or tmux pane" })

map({ "n", "t" }, "<C-l>", function()
  smart_splits.move_cursor_right()
end, { desc = "Go to right window or tmux pane" })

-- vim-visual-multi 多光标操作
local function visual_cursors_with_delay()
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  vim.cmd("sleep 200m")
  vim.cmd('silent! execute "normal! A"')
end
map({ "n" }, "ma", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add Cursor At Pos" })
map({ "n" }, "mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mapping" })
map({ "v" }, "mv", visual_cursors_with_delay, { desc = "Visual Cursors" })
