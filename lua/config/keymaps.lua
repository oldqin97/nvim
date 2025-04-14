local map = LazyVim.safe_keymap_set

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

-- 同时绑定tab到neotab和supermaven上
-- local function smart_tab()
--   local suggestion = require("supermaven-nvim.completion_preview")
--   local keys = vim.api.nvim_replace_termcodes("<Plug>(neotab-out)", true, true, true)
--
--   vim.api.nvim_feedkeys(keys, "i", false)
--   -- vim.schedule(function() end)
--
--   if suggestion.has_suggestion() then
--     suggestion.on_accept_suggestion()
--   end
-- end
-- local function smart_tab()
--   local suggestion = require("supermaven-nvim.completion_preview")
--
--   -- 判断是否在括号或字符串内的辅助函数
--   local function is_inside_brackets_or_string()
--     local current_line = vim.api.nvim_get_current_line()
--     local col = vim.api.nvim_win_get_cursor(0)[2] + 1 -- 列索引从1开始
--     local syntax_group = vim.fn.synIDattr(vim.fn.synID(vim.fn.line("."), col, 1), "name")
--
--     -- 检查是否在字符串、注释或括号内
--     if syntax_group:match("String$") or syntax_group:match("Comment$") or syntax_group:match("Delimiter$") then
--       return true
--     end
--
--     -- 检查括号配对（需要nvim-treesitter或类似插件支持）
--     local pairs = { ["("] = ")", ["["] = "]", ["{"] = "}" }
--     local char = current_line:sub(col, col)
--
--     if pairs[char] then
--       local _, end_col = vim.fn.searchpairpos(char, "", pairs[char], "nW")
--       return end_col > 0 and end_col ~= col
--     end
--
--     return false
--   end
--
--   -- 优先执行neotab逻辑
--   vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(neotab-out)", true, true, true), "i", false)
--
--   -- 延迟检查建议（等待neotab执行完成）
--   vim.schedule(function()
--     if not is_inside_brackets_or_string() and suggestion.has_suggestion() then
--       suggestion.on_accept_suggestion()
--     end
--   end)
-- end

-- 使用表达式映射覆盖默认的 Tab 键绑定
-- map("i", "<Tab>", smart_tab, { desc = "tab" })

-- close page
map({ "n", "i", "v" }, "<C-q>", "<cmd>q<CR>", { desc = "close page" })

-- 移动行
map("n", "<S-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
map("n", "<S-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
map("v", "<S-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
map("v", "<S-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })
-- map("i", "<S-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
-- map("i", "<S-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })

-- 切换 buffer
-- if Util.has("bufferline.nvim") then
-- map("n", "<A-9>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev buffer" })
-- map("n", "<A-0>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" })
-- else
-- map("n", "<A-9>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
-- map("n", "<A-0>", "<cmd>bnext<cr>", { desc = "Next buffer" })
-- end

-- save
-- map({ "i", "x", "n", "s" }, "<A-s>", function()
--   -- vim.lsp.buf.format()
--   -- require("conform").format({ formatters = { "injected" }, timeout_ms = 3000 })
-- end, { desc = "format file" })
map({ "i", "x", "n", "s" }, "<A-s>", "<cmd>LazyFormat<cr>", { desc = "format file" })

-- map({ "i", "x", "n", "s" }, "<A-s>", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "format file" })

-- 移动光标
map("n", "<S-h>", "^", { desc = "move cursor to begin" })
map("n", "<S-l>", "$", { desc = "move cursor to end" })
map("v", "<S-h>", "^", { desc = "move cursor to begin" })
map("v", "<S-l>", "$h", { desc = "move cursor to end" })

-- 删除行
map("n", "dh", "d^x", { desc = "move cursor to start" })
map("n", "dl", "d$", { desc = "move cursor to end" })

-- w  b 跳过标点符号
map({ "x", "n", "s", "o" }, "w", "<cmd>lua require('spider').motion('w')<CR>", { desc = "spider-w" })
map({ "x", "n", "s", "o" }, "b", "<cmd>lua require('spider').motion('b')<CR>", { desc = "spider-b" })

-- fold
map("n", "zz", "zc", { desc = "fold close" })
map("n", "Z", "zR", { desc = "fold open" })

-- git conflict
map("n", "<leader>co", "<cmd>ConflictMarkerOurselves<CR>", { desc = "Todo list" })
map("n", "<leader>ct", "<cmd>ConflictMarkerThemselves<CR>", { desc = "Todo list" })
map("n", "<leader>cb", "<cmd>ConflictMarkerBoth<CR>", { desc = "Todo list" })

-- flash
map({ "x", "n", "o" }, "f", function()
  require("flash").jump()
end, { desc = "Flash" })

-- map({ "n", "o", "x" }, "R", function()
--   require("flash").treesitter_search()
-- end, { desc = "Toggle Flash Search" })

map("n", "s", "=", { desc = "replace s" })
map("n", "sh", "<cmd> vertical resize +5<CR>", { desc = "resize s" })
map("n", "sl", "<cmd> vertical resize -5<CR>", { desc = "resize s" })
map("n", "sk", "<cmd> resize +5<CR>", { desc = "resize s" })
map("n", "sj", "<cmd> resize -5<CR>", { desc = "resize s" })

-- nvim-spectre
-- vim.keymap.set("v", "<leader>sr", '<esc><cmd>lua require("spectre").open_visual()<CR>', {
--   desc = "Search current word",
-- })
-- vim.keymap.set("n", "<leader>sr", '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
--   desc = "Search on current file",
-- })

-- tmux navigator
map({ "n", "t" }, "<C-h>", function()
  require("smart-splits").move_cursor_left()
end, { desc = "Go to left window or tmux pane" })

map({ "n", "t" }, "<C-j>", function()
  require("smart-splits").move_cursor_down()
end, { desc = "Go to lower window or tmux pane" })

map({ "n", "t" }, "<C-k>", function()
  require("smart-splits").move_cursor_up()
end, { desc = "Go to upper window or tmux pane" })

map({ "n", "t" }, "<C-l>", function()
  require("smart-splits").move_cursor_right()
end, { desc = "Go to right window or tmux pane" })

-- vim-visual-multi
local function visual_cursors_with_delay()
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  vim.cmd("sleep 200m")
  vim.cmd('silent! execute "normal! A"')
end
map({ "n" }, "ma", "<Plug>(VM-Add-Cursor-At-Pos)", { desc = "Add Cursor At Pos" })
map({ "n" }, "mo", "<Plug>(VM-Toggle-Mappings)", { desc = "Toggle Mapping" })
map({ "v" }, "mv", visual_cursors_with_delay, { desc = "Visual Cursors" })

-- local use_coc = false -- 默认使用 CoC
-- -- switch coc & lsp
-- -- 切换函数
--
-- function ToggleCompletion()
--   local cmp = require("cmp")
--   use_coc = not use_coc
--   if use_coc then
--     vim.cmd("CocEnable") -- 启用 CoC
--     -- vim.lsp.stop_client(vim.lsp.get_active_clients()) -- 停止所有 LSP 客户端
--     cmp.setup({ enabled = false }) -- 禁用 cmp
--     -- map({ "n" }, "<A-r>", "<Plug>(coc-rename)", { desc = "rename" })
--     map({ "n" }, "<A-s>", "<cmd>call CocAction('format')<cr>", { desc = "format" })
--     vim.api.nvim_set_keymap(
--       "i",
--       "<leader><Tab>",
--       [[coc#_select_confirm()]],
--       { noremap = true, expr = true, silent = true }
--     )
--     -- vim.api.nvim_set_keymap("n", "<leader>gd", "<Plug>(coc-definition)", { noremap = true, silent = true }) -- 跳转到定义
--     -- vim.api.nvim_set_keymap("n", "gr", "<Plug>(coc-references)", { noremap = true, silent = true }) -- 查看引用
--     -- vim.api.nvim_set_keymap("n", "gy", "<Plug>(coc-type-definition)", { noremap = true, silent = true }) -- 跳转到类型定义
--     -- vim.api.nvim_set_keymap("n", "gi", "<Plug>(coc-implementation)", { noremap = true, silent = true }) -- 跳转到实现
--     print("Switched to CoC")
--   else
--     vim.cmd("CocDisable") -- 禁用 CoC
--     cmp.setup({ enabled = true }) -- 禁用 cmp
--     -- if #clients == 0 then
--     --   vim.cmd("LspStart") -- 启动 LSP
--     -- end
--     print("Switched to LSP")
--   end
-- end
-- vim.cmd("CocDisable") -- 禁用 CoC
-- 分配快捷键切换
-- map("n", "<leader>tc", "<cmd>lua ToggleCompletion()<CR>", { desc = "switch coc & lsp" })
-- vim.keymap.del({ "n" }, "<leader>bd")
-- vim.keymap.del({ "n" }, "<leader>-")
-- vim.keymap.del({ "n" }, "<leader>|")
-- vim.keymap.del({ "n" }, "<leader>us")
-- vim.keymap.del({ "n" }, "<leader>ft")
-- vim.keymap.del({ "n" }, "<leader>ft")

-- fast move
map("n", "j", "<Plug>(accelerated_jk_gj)", { desc = "fast move j" })
map("n", "k", "<Plug>(accelerated_jk_gk)", { desc = "fast move k" })
