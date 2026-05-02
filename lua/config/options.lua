-- 启用真彩色终端支持
vim.o.termguicolors = true

-- 不同模式下的光标样式配置
vim.opt.guicursor = table.concat({
  "n-v-c:block-Cursor/lCursor",
  "n-v:block",
  "i:ver25",
  "i-ci:ver25",
  "r-cr:hor20",
  "o:hor50",
}, ",")

-- 禁用 perl 提供器以加快启动速度
vim.g.loaded_perl_provider = 0

-- 禁用自动格式化
vim.g.autoformat = false
-- 使用 blink.cmp 而非 lazyvim 默认的 blink 配置
vim.g.lazyvim_blink_main = false
-- 使用 snacks 作为默认选择器
vim.g.lazyvim_picker = "snacks"

-- 缩短写入延迟，提升响应速度
vim.opt.updatetime = 200
-- 切换 buffer 时光标不跳到行首
vim.opt.startofline = false
-- 禁用当前行高亮
vim.opt.cursorline = false
-- 启用自动换行
vim.opt.wrap = true

-- 折叠配置：使用 treesitter 语法折叠
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
-- 默认展开所有折叠
vim.opt.foldlevel = 99

-- 行号列宽度
vim.opt.numberwidth = 7
-- 不隐藏任何语法标记
vim.opt.conceallevel = 0

-- 跳过 treesitter 上下文注释字符串模块
vim.g.skip_ts_context_commentstring_module = true

-- 拼写检查语言：英文 + 中日韩
vim.opt.spelllang = { "en", "cjk" }
-- 启用 editorconfig 支持
vim.g.editorconfig = true

-- 禁用 AI 补全
vim.g.ai_cmp = false
