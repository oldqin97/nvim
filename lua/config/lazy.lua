local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

-- 如果 lazy.nvim 尚未安装，则通过 git clone 引导安装
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable",
    lazypath })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    -- 导入 LazyVim 核心及内置插件
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },

    -- 代码相关
    { import = "lazyvim.plugins.extras.coding.luasnip" },
    { import = "lazyvim.plugins.extras.coding.blink" },

    -- 调试器支持
    { import = "lazyvim.plugins.extras.dap.core" },
    { import = "lazyvim.plugins.extras.dap.nlua" },

    -- 编辑器增强
    { import = "lazyvim.plugins.extras.editor.dial" },
    { import = "lazyvim.plugins.extras.editor.outline" },
    { import = "lazyvim.plugins.extras.editor.overseer" },

    -- 格式化
    { import = "lazyvim.plugins.extras.formatting.black" },

    -- 语言支持
    { import = "lazyvim.plugins.extras.lang.angular" },
    { import = "lazyvim.plugins.extras.lang.astro" },
    { import = "lazyvim.plugins.extras.lang.docker" },
    { import = "lazyvim.plugins.extras.lang.json" },
    { import = "lazyvim.plugins.extras.lang.python" },
    { import = "lazyvim.plugins.extras.lang.rust" },
    { import = "lazyvim.plugins.extras.lang.svelte" },
    { import = "lazyvim.plugins.extras.lang.tailwind" },
    { import = "lazyvim.plugins.extras.lang.toml" },
    { import = "lazyvim.plugins.extras.lang.typescript" },
    { import = "lazyvim.plugins.extras.lang.vue" },
    { import = "lazyvim.plugins.extras.lang.yaml" },
    { import = "lazyvim.plugins.extras.lang.prisma" },
    { import = "lazyvim.plugins.extras.lang.git" },
    { import = "lazyvim.plugins.extras.lang.clangd" },
    { import = "lazyvim.plugins.extras.lang.cmake" },
    { import = "lazyvim.plugins.extras.lang.nushell" },
    { import = "lazyvim.plugins.extras.lang.sql" },

    -- 代码检查
    { import = "lazyvim.plugins.extras.linting.eslint" },
    -- LSP
    { import = "lazyvim.plugins.extras.lsp.none-ls" },
    -- 测试
    { import = "lazyvim.plugins.extras.test.core" },
    -- 工具
    { import = "lazyvim.plugins.extras.util.project" },
    { import = "lazyvim.plugins.extras.util.startuptime" },
    { import = "lazyvim.plugins.extras.util.rest" },
    -- 导入自定义插件
    { import = "plugins" },
  },
  defaults = {
    -- 默认延迟加载以加快启动速度
    lazy = true,
    -- 不使用版本锁定，跟踪最新提交
    version = false,
  },
  install = { colorscheme = { "gruvbox", "habamax" } },
  -- 自动检查插件更新
  checker = { enabled = true },
  performance = {
    rtp = {
      -- 禁用部分内置插件以提升性能
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
