-- 启用 Lua 模块加载器，加速启动
vim.loader.enable()

-- Shim: blink.cmp v1.10+ 移除了 blink.lib.task，但部分旧插件（如 css-vars.nvim）仍依赖它
-- 将旧路径重定向到新的 async.task API
package.preload["blink.lib.task"] = function()
  return require("blink.cmp.lib.async").task
end

-- 加载 lazy.nvim 插件管理器配置
require("config.lazy")
