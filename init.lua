-- 启用 Lua 模块加载器，加速启动
vim.loader.enable()

-- 加载 lazy.nvim 插件管理器配置
require("config.lazy")
