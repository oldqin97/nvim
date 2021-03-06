-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NOTE
-- TODO
-- FIX
-- HACK
-- WARN
-- PERF

local opt = {
  noremap = true,
  silent = true,
}

-- 本地变量
local map = vim.api.nvim_set_keymap

-- leader key 为空
vim.g.mapleader = " "
vim.g.maplocalleader = " "

map("i", "jj", "<Esc>", opt)
map("v", "u", "<Esc>", opt)

-- todo
map("n", "to", "<cmd>TodoTelescope<cr>", opt)

-- markbooks
map("n", "ma", "<cmd>Telescope vim_bookmarks current_file<cr>", opt)
map("n", "mA", "<cmd>Telescope vim_bookmarks all<cr>", opt)

-- translate
map("n", "th", "<cmd>TranslateW<cr>", opt)

-- $跳到行尾不带空格 (交换$ 和 g_)

map("v", "H", "^", opt)
map("v", "L", "$", opt)
map("n", "H", "^", opt)
map("n", "L", "$", opt)

map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-l>", "<C-w>l", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)

-- hop
map("n", "fw", "<cmd>HopWord<cr>", opt)
map("n", "fs", "<cmd>HopChar2<cr>", opt)

-- git conflict
map("n", "co", "<cmd>:ConflictMarkerOurselves<cr>", opt)
map("n", "ct", "<cmd>:ConflictMarkerThemselves<cr>", opt)
map("n", "cb", "<cmd>:ConflictMarkerBoth<cr>", opt)

-- 命令行下 Alt+j/k  上一个下一个

map("c", "<A-j>", "<C-n>", { noremap = false })
map("c", "<A-k>", "<C-p>", { noremap = false })

map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)

-- 按键绑定，查看 undotree
map("n", "<leader>3", ":UndotreeToggle<CR>", opt)

-- gitgraph
map("n", "<leader>2", "<cmd>Flog<cr>", opt)

-- rest
map("n", "<F3>", "<Plug>RestNvim", opt)

-- outline
map("n", "<F4>", "<cmd>SymbolsOutline<cr>", opt)

-- 上下滚动浏览
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
map("n", "<C-u>", "10k", opt)
map("n", "<C-d>", "10j", opt)

-- magic search
-- map("n", "/", "/\\v", { noremap = true, silent = false })
-- map("v", "/", "/\\v", { noremap = true, silent = false })

-- 正常模式下按 ESC 取消高亮显示
map("n", "<ESC>", ":nohlsearch<CR>", opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)

-- 在visual模式上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在normal模式下上移动选择文本
map("n", "<S-j>", "<Plug>GoNSMDown", opt)
map("n", "<S-k>", "<Plug>GoNSMUp", opt)

-- 在visual mode 里粘贴不要复制
map("v", "p", '"_dP', opt)

-- 预览md文件
map("n", "<F5>", ":LivedownPreview<CR>", opt)

-- 退出
map("n", "qq", ":q!<CR>", opt)
map("n", "<C-c>", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)

-- insert 模式下，跳到行首行尾
-- map("i", "<c-h>", "<esc>i", opt)
-- map("i", "<c-l>", "<esc>a", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
map("n", "s", "", opt)
-- map("n", "sv", ":vsp<cr>", opt)
-- map("n", "sh", ":sp<CR>", opt)

-- 关闭当前
map("n", "sc", "<C-w>c", opt)
-- 关闭其他
map("n", "so", "<C-w>o", opt) -- close others

-- Highlight variable
map("n", "<leader>w", ":lua require'mywords'.hl_toggle()<cr>", opt)
map("n", "<leader>c", ":lua require'mywords'.uhl_all()<cr>", opt)

-- 左右比例控制keykeykey
map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
map("n", "sh", ":vertical resize -10<CR>", opt)
map("n", "sl", ":vertical resize +10<CR>", opt)
-- 上下比例
map("n", "sj", ":resize +10<CR>", opt)
map("n", "sk", ":resize -10<CR>", opt)
map("n", "<C-Down>", ":resize -2<CR>", opt)
map("n", "<C-Up>", ":resize +2<CR>", opt)
-- 相等比例
map("n", "s=", "<C-w>=", opt)

-- Terminal相关
--map("n", "st", ":sp | terminal<CR>", opt)
--map("n", "stv", ":vsp | terminal<CR>", opt)

-- Esc 回 Normal 模式
--map("t", "<Esc>", "<C-\\><C-n>", opt)

map("n", "<F1>", ":AddFileHeader<CR>", opt)
map("v", "<F1>", ":AddFileHeader<CR>", opt)

map("n", "<F2>", ":DogeGenerate jsdoc<CR>", opt)
map("v", "<F2>", ":DogeGenerate jsdoc<CR>", opt)

--------------------------------------------------------------------
-- 插件快捷键
local pluginKeys = {}

-- 折叠
map("n", "zz", ":foldclose<CR>", opt)
map("n", "Z", ":foldopen<CR>", opt)

-- nvim-tree
map("n", "<leader>e", ":NvimTreeToggle<CR>", opt)
map("n", "<A-e>", ":NvimTreeToggle<CR>", opt)

-- 列表快捷键
pluginKeys.nvimTreeList = { -- 打开文件或文件夹
  { key = { "o", "<2-LeftMouse>", "<CR>" }, action = "edit" },
  -- { key = "<CR>", action = "system_open" },
  -- v分屏打开文件
  { key = "v", action = "vsplit" },
  -- h分屏打开文件
  { key = "h", action = "split" },
  -- Ignore (node_modules)
  { key = "i", action = "toggle_ignored" },
  -- Hide (dotfiles)
  { key = ".", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  -- 文件操作
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "r", action = "rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "I", action = "toggle_file_info" },
  { key = "n", action = "tabnew" },
  { key = "<C-k>", action = "toggle_file_info" },
  -- 进入下一级
  { key = { "]" }, action = "cd" },
  -- 进入上一级
  { key = { "[" }, action = "dir_up" },
}
-- bufferline
-- 左右Tab切换
map("n", "<A-h>", ":BufferLineCyclePrev<CR>", opt)
map("n", "<A-l>", ":BufferLineCycleNext<CR>", opt)

-- "moll/vim-bbye" 关闭当前 buffer
map("n", "<C-q>", ":Bdelete!<CR>", opt)

-- 关闭左/右侧标签页
-- map("n", "<leader>bh", ":BufferLineCloseLeft<CR>", opt)
-- map("n", "<leader>bl", ":BufferLineCloseRight<CR>", opt)
-- -- 关闭其他标签页
-- map("n", "<leader>bo", ":BufferLineCloseRight<CR>:BufferLineCloseLeft<CR>", opt)
-- -- 关闭选中标签页
-- map("n", "<leader>bp", ":BufferLinePickClose<CR>", opt)

-- Telescope
map("n", "<C-p>", ":Telescope find_files<CR>", opt)
map("n", "<C-f>", ":Telescope live_grep<CR>", opt)

-- Telescope 列表中 插入模式快捷键
pluginKeys.telescopeList = {
  i = {
    -- 上下移动
    ["<A-j>"] = "move_selection_next",
    ["<A-k>"] = "move_selection_previous",
    -- 历史记录
    ["<Down>"] = "cycle_history_next",
    ["<Up>"] = "cycle_history_prev",
    -- 关闭窗口
    ["<esc>"] = "close",
    ["<C-c>"] = "close",
    -- 预览窗口上下滚动
    ["<C-u>"] = "preview_scrolling_up",
    ["<C-d>"] = "preview_scrolling_down",
  },
}

-- 代码注释插件
-- see ./lua/plugin-config/comment.lua
pluginKeys.comment = {
  -- Normal 模式快捷键
  toggler = {
    line = "gcc", -- 行注释
    block = "gbc", -- 块注释
  },
  -- Visual 模式
  opleader = {
    line = "gc",
    bock = "gb",
  },
}

-- ctrl + /
map("n", "<C-_>", "gcc<Esc>", { noremap = false })
map("v", "<C-_>", "gcc<Esc>", { noremap = false })

-- lsp 回调函数快捷键设置
pluginKeys.mapLSP = function(mapbuf)
  -- rename
  --[[
  Lspsaga 替换 rn
  --]]

  mapbuf("n", "<leader>rn", "<cmd>Lspsaga rename<CR>", opt)
  -- mapbuf("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
  -- code action
  mapbuf("n", "<leader>ca", "<cmd>Lspsaga code_action<CR>", opt)
  -- mapbuf("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
  -- go xx

  -- mapbuf("n", "gd", "<cmd>Lspsaga preview_definition<CR>", opt)
  mapbuf("n", "gd", "<cmd>lua require'telescope.builtin'.lsp_definitions({ initial_mode = 'normal', })<CR>", opt)

  mapbuf("n", "gh", "<cmd>Lspsaga hover_doc<cr>", opt)
  mapbuf("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
  -- mapbuf("n", "gr", "<cmd>Lspsaga lsp_finder<CR>", opt)
  -- diagnostic
  mapbuf("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opt)
  -- mapbuf("n", "gp", "<cmd>Lspsaga show_line_diagnostics<CR>", opt)

  -- 格式化
  -- mapbuf("n", "<C-s>", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", opt)
  -- mapbuf("v", "<C-s>", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", opt)
  -- mapbuf("i", "<C-s>", "<cmd>lua vim.lsp.buf.formatting_sync(nil, 2000)<CR>", opt)

  mapbuf("n", "<C-s>", "<cmd>Format<CR>", opt)
  mapbuf("v", "<C-s>", "<cmd>Format<CR>", opt)
  mapbuf("i", "<C-s>", "<cmd>Format<CR>", opt)

  -- 未用
  -- mapbuf("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
  -- mapbuf("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
  -- mapbuf("n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opt)
  -- mapbuf("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opt)
  -- mapbuf("n", "<space>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
  -- mapbuf("n", "<space>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
  -- mapbuf("n", "<space>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
  -- mapbuf("n", "gd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
end

-- typescript 快捷键
pluginKeys.mapTsLSP = function(mapbuf)
  mapbuf("n", "gs", ":TSLspOrganize<CR>", opt)
  -- mapbuf("n", "gR", ":TSLspRenameFile<CR>", opt)
  -- mapbuf("n", "gi", ":TSLspImportAll<CR>", opt)
end

-- nvim-dap
pluginKeys.mapDAP = function()
  -- 开始
  map("n", "<leader>dd", ":RustDebuggables<CR>", opt)
  -- 结束
  map(
    "n",
    "<leader>de",
    ":lua require'dap'.close()<CR>"
      .. ":lua require'dap'.terminate()<CR>"
      .. ":lua require'dap.repl'.close()<CR>"
      .. ":lua require'dapui'.close()<CR>"
      .. ":lua require('dap').clear_breakpoints()<CR>"
      .. "<C-w>o<CR>",
    opt
  )
  -- 继续
  map("n", "<leader>dc", ":lua require'dap'.continue()<CR>", opt)
  -- 设置断点
  map("n", "<leader>dt", ":lua require('dap').toggle_breakpoint()<CR>", opt)
  map("n", "<leader>dT", ":lua require('dap').clear_breakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", ":lua require'dap'.step_over()<CR>", opt)
  map("n", "<leader>dk", ":lua require'dap'.step_out()<CR>", opt)
  map("n", "<leader>dl", ":lua require'dap'.step_into()<CR>", opt)
  -- 弹窗
  map("n", "<leader>dh", ":lua require'dapui'.eval()<CR>", opt)
end

-- vimspector
pluginKeys.mapVimspector = function()
  -- 开始
  map("n", "<leader>dd", ":call vimspector#Launch()<CR>", opt)
  -- 结束
  map("n", "<Leader>de", ":call vimspector#Reset()<CR>", opt)
  -- 继续
  map("n", "<Leader>dc", ":call vimspector#Continue()<CR>", opt)
  -- 设置断点
  map("n", "<Leader>dt", ":call vimspector#ToggleBreakpoint()<CR>", opt)
  map("n", "<Leader>dT", ":call vimspector#ClearBreakpoints()<CR>", opt)
  --  stepOver, stepOut, stepInto
  map("n", "<leader>dj", "<Plug>VimspectorStepOver", opt)
  map("n", "<leader>dk", "<Plug>VimspectorStepOut", opt)
  map("n", "<leader>dl", "<Plug>VimspectorStepInto", opt)
end

-- nvim-cmp 自动补全
pluginKeys.cmp = function(cmp)
  local feedkey = function(key, mode)
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
  end
  local has_words_before = function()
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
  end

  return {
    -- 上一个
    ["<A-k>"] = cmp.mapping.select_prev_item(),
    -- 下一个
    ["<A-j>"] = cmp.mapping.select_next_item(),
    -- 出现补全
    ["<A-.>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    -- 取消
    -- ["<Esc>"] = cmp.mapping({
    --   i = cmp.mapping.abort(),
    --   c = cmp.mapping.close(),
    -- }),
    ["<C-c>"] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- 确认
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm({
      select = true,
      behavior = cmp.ConfirmBehavior.Replace,
    }),
    -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    -- 如果窗口内容太多，可以滚动
    ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
    ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
    -- snippets 跳转
    ["<C-l>"] = cmp.mapping(function(_)
      if vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      end
    end, { "i", "s" }),
    ["<C-h>"] = cmp.mapping(function()
      if vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),

    -- super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
        if not entry then
          cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
        end
        cmp.confirm()
      else
        fallback()
      end
    end, { "i", "s", "c" }),
  }
end

-- 自定义 toggleterm 3个不同类型的命令行窗口
-- <leader>ta 浮动
-- <leader>tb 右侧
-- <leader>tc 下方
-- 特殊lazygit 窗口，需要安装lazygit
-- <leader>tg lazygit
pluginKeys.mapToggleTerm = function(toggleterm)
  -- vim.keymap.set({ "n" }, "<leader>ta", toggleterm.toggleA)
  -- vim.keymap.set({ "n" }, "<leader>tb", toggleterm.toggleB)
  -- vim.keymap.set({ "n" }, "<leader>tc", toggleterm.toggleC)
  vim.keymap.set({ "n" }, "<leader>tg", toggleterm.toggleG)
end

return pluginKeys
