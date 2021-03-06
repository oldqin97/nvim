-- 基础配置
require("basic")
-- 快捷键映射
require("keybindings")
-- Packer插件管理
require("plugins")
-- 主题设置
require("colorscheme")
-- 自动命令
require("autocmds")
-- 插件配置
require("plugin-config.nvim-tree")
require("plugin-config.bufferline")
require("plugin-config.lualine")
require("plugin-config.telescope")
require("plugin-config.dashboard")
require("plugin-config.project")
require("plugin-config.nvim-treesitter")
require("plugin-config.indent-blankline")
require("plugin-config.toggleterm")
require("plugin-config.surround")
require("plugin-config.comment")
require("plugin-config.nvim-autopairs")
require("plugin-config.fidget")
require("plugin-config.autosave")
require("plugin-config.lastplace")
-- require("plugin-config.auto-session")
require("plugin-config.autotag")
require("plugin-config.colorizer")
require("plugin-config.gomove")
--require("plugin-config.nvim-context")
require("plugin-config.book-mark")
require("plugin-config.undotree")
require("plugin-config.illuminate")
require("plugin-config.gitsigns")
require("plugin-config.todo-comments")
-- require("plugin-config.gitlens")
require("plugin-config.nvim-hop")
require("plugin-config.search-hlslens")
require("plugin-config.treesitter-ctx")
require("plugin-config.reg")
require("plugin-config.nvim-rest")
require("plugin-config.notify")
require("plugin-config.nvim-gps")
require("plugin-config.outline")

-- require("plugin-config.nvim-diff")

require("plugin-config.live-md")
require("plugin-config.nvim-confilict")
-- 内置LSP
require("lsp.setup")

require("lsp.cmp")
require("lsp.ui")
-- 格式化
require("lsp.formatter")
-- require("lsp.null-ls")
-- DAP
-- require("dap.vimspector")
--require("dap.nvim-dap")
-- utils
-- 复制到windows剪贴板
-- require('utils.fix-yank')
