-- 禁用 LazyVim 中不需要的内置插件，使用自定义替代方案
return {
  -- 使用自定义 gruvbox 主题替代 tokyonight
  { "folke/tokyonight.nvim", enabled = false },
  -- 使用自定义 catppuccin 主题
  { "catppuccin/nvim", enabled = false },
  -- 使用 nvim-surround 替代 mini.surround
  { "nvim-mini/mini.surround", enabled = false },
  -- 使用 snacks.nvim 的 which-key 替代
  { "folke/which-key.nvim", enabled = false },
  -- 使用 auto-pairs 替代 mini.pairs
  { "nvim-mini/mini.pairs", enabled = false },
  -- 使用 flash.nvim 替代 flit
  { "ggandor/flit.nvim", enabled = false },
  -- 禁用 treesitter-context
  { "nvim-treesitter/nvim-treesitter-context", enabled = false },
  -- 禁用 dashboard
  { "nvimdev/dashboard-nvim", enabled = false },
  -- 禁用 mini.starter
  { "nvim-mini/mini.starter", enabled = false },
  -- 使用自定义格式化方案替代 conform.nvim
  { "stevearc/conform.nvim", enabled = false },
  -- 使用 snacks.indent 替代 indent-blankline
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  -- 禁用 onedark 主题
  { "navarasu/onedark.nvim", enabled = false },
  -- 禁用 luarocks
  { "vhyrro/luarocks.nvim", enabled = false },
  -- 禁用 vim-illuminate
  { "RRethy/vim-illuminate", enabled = false },
  -- 使用 snacks.picker 替代 telescope
  { "nvim-telescope/telescope-fzf-native.nvim", enabled = false },
  { "nvim-telescope/telescope.nvim", enabled = false },
  -- 颜色拾取器
  { "max397574/colortils.nvim", enabled = false },
  -- 使用 blink.cmp 替代 nvim-cmp
  { "hrsh7th/nvim-cmp", enabled = false },
  -- 使用 snacks.notifier 替代 nvim-notify
  { "rcarriga/nvim-notify", enabled = false },
  -- none-ls 保持启用
  { "nvimtools/none-ls.nvim", enabled = true },
  -- 使用 snacks.explorer 替代 neo-tree
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  -- 使用 snacks.picker 替代 project.nvim
  { "ahmedkhalf/project.nvim", enabled = false },
  -- 禁用 nvim-lint
  { "mfussenegger/nvim-lint", enabled = false },
}
