local map = LazyVim.safe_keymap_set

local del = vim.keymap.del

-- close page
map("n", "qq", "<cmd>q<CR>", { desc = "close page" })

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

-- 移动光标
map("n", "<S-h>", "^", { desc = "move cursor to begin" })
map("n", "<S-l>", "$", { desc = "move cursor to end" })
map("v", "<S-h>", "^", { desc = "move cursor to begin" })
map("v", "<S-l>", "$h", { desc = "move cursor to end" })

-- 删除行
map("n", "dh", "d^x", { desc = "move cursor to end" })
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

map({ "n", "o", "x" }, "R", function()
  require("flash").treesitter_search()
end, { desc = "Toggle Flash Search" })

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
  -- Execute the vm-visual-cursors command.
  vim.cmd('silent! execute "normal! \\<Plug>(VM-Visual-Cursors)"')
  -- Introduce delay via VimScript's 'sleep' (set to 500 milliseconds here).
  vim.cmd("sleep 200m")
  -- Press 'A' in normal mode after the delay.
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
