-- 自动安装 Packer.nvim
-- 插件安装目录
-- ~/.local/share/nvim/site/pack/packer/
local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
local paccker_bootstrap
if fn.empty(fn.glob(install_path)) > 0 then
  vim.notify("正在安装Pakcer.nvim，请稍后...")
  paccker_bootstrap = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    -- "https://gitcode.net/mirrors/wbthomason/packer.nvim",
    install_path,
  })

  -- https://github.com/wbthomason/packer.nvim/issues/750
  local rtp_addition = vim.fn.stdpath("data") .. "/site/pack/*/start/*"
  if not string.find(vim.o.runtimepath, rtp_addition) then
    vim.o.runtimepath = rtp_addition .. "," .. vim.o.runtimepath
  end
  vim.notify("Pakcer.nvim 安装完毕")
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("没有安装 packer.nvim")
  return
end

packer.startup({
  function(use)
    -- Packer 可以升级自己
    use("wbthomason/packer.nvim")
    -------------------------- plugins -------------------------------------------

    -- notify
    use("rcarriga/nvim-notify")

    -- 大纲
    use("simrat39/symbols-outline.nvim")

    use("dinhhuy258/vim-local-history")

    -- 添加头文件
    use("ahonn/vim-fileheader")

    -- markdown

    use("shime/vim-livedown")

    -- rest
    use("NTBBloodbath/rest.nvim")

    -- gielens
    use("APZelos/blamer.nvim")

    -- jsdoc
    use("kkoomen/vim-doge")

    -- bookmark
    use("MattesGroeger/vim-bookmarks")
    use("tom-anders/telescope-vim-bookmarks.nvim")

    -- 自动保存
    use("Pocco81/AutoSave.nvim")

    -- 自动恢复光标位置
    use("ethanholz/nvim-lastplace")

    -- 自动会话管理
    --use("rmagatti/auto-session")

    -- auto-tag
    use("windwp/nvim-ts-autotag")

    -- 显示颜色
    use("norcalli/nvim-colorizer.lua") -- nvim-tree

    -- 文本
    use("haringsrob/nvim_context_vt")

    -- diff
    use("sindrets/diffview.nvim")

    -- 移动文本
    use("booperlv/nvim-gomove")

    -- 搜索文本
    use({ "kevinhwang91/nvim-hlslens" })

    -- 记录历史变更
    use("mbbill/undotree")

    -- use 显示光标下相同词汇
    use("RRethy/vim-illuminate")

    -- multiple operator
    use("mg979/vim-visual-multi")

    -- translate
    use("voldikss/vim-translator")

    -- hop
    use("phaazon/hop.nvim")

    -- TODO
    use("folke/todo-comments.nvim")

    use({
      "kyazdani42/nvim-tree.lua",
      requires = "kyazdani42/nvim-web-devicons",
    })

    -- editconfig
    use("editorconfig/editorconfig-vim")

    -- bufferline
    use({
      "akinsho/bufferline.nvim",
      requires = { "kyazdani42/nvim-web-devicons", "moll/vim-bbye" },
    })

    -- lualine
    use({
      "nvim-lualine/lualine.nvim",
      requires = { "kyazdani42/nvim-web-devicons" },
    })

    use("arkav/lualine-lsp-progress")

    -- telescope
    use({
      "nvim-telescope/telescope.nvim",
      requires = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim" },
    })

    -- telescope extensions
    use("LinArcX/telescope-env.nvim")
    use("nvim-telescope/telescope-ui-select.nvim")

    -- dashboard-nvim
    use("glepnir/dashboard-nvim")

    -- project
    use("ahmedkhalf/project.nvim")

    -- treesitter
    use({
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
    })
    use("SmiteshP/nvim-gps")

    use({
      "nvim-treesitter/nvim-treesitter-context",
      run = ":TSContextEnable",
    })

    -- reg
    use({
      "bennypowers/nvim-regexplainer",
      requires = {
        "MunifTanjim/nui.nvim",
      },
    })

    use("p00f/nvim-ts-rainbow")

    -- indent-blankline
    use("lukas-reineke/indent-blankline.nvim")

    --------------------- LSP --------------------
    -- use({ "williamboman/nvim-lsp-installer", commit = "36b44679f7cc73968dbb3b09246798a19f7c14e0" })
    use({ "williamboman/nvim-lsp-installer" })
    -- Lspconfig
    use({ "neovim/nvim-lspconfig" })
    -- 补全引擎
    use("hrsh7th/nvim-cmp")
    -- Snippet 引擎
    use("hrsh7th/vim-vsnip")
    -- 补全源
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lsp") -- { name = nvim_lsp }
    use("hrsh7th/cmp-buffer") -- { name = 'buffer' },

    use("hrsh7th/cmp-path") -- { name = 'path' }
    use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
    use("hrsh7th/cmp-emoji")
    --use("f3fora/cmp-spell")
    use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
    use({
      "tzachar/cmp-tabnine",
      run = "./install.sh",
    })

    -- 常见编程语言代码段
    use("rafamadriz/friendly-snippets")
    -- UI 增强
    use("onsails/lspkind-nvim")
    use("tami5/lspsaga.nvim")
    -- 代码格式化
    use("jose-elias-alvarez/null-ls.nvim")
    -- TypeScript 增强
    use("jose-elias-alvarez/nvim-lsp-ts-utils")

    -- Lua 增强
    use("folke/lua-dev.nvim")
    -- JSON 增强
    use("b0o/schemastore.nvim")
    -- Rust 增强
    use("simrat39/rust-tools.nvim")

    --------------------- colorschemes --------------------
    -- onedark
    use("ful1e5/onedark.nvim")
    --use("LunarVim/darkplus.nvim")

    -------------------------------------------------------
    use({ "akinsho/toggleterm.nvim" })
    -- surround
    use("ur4ltz/surround.nvim")

    -- Comment
    use("numToStr/Comment.nvim")

    -- nvim-autopairs
    use("windwp/nvim-autopairs")

    -- git
    use({ "lewis6991/gitsigns.nvim" })

    -- vimspector
    use("puremourning/vimspector")
    ----------------------------------------------
    use("mfussenegger/nvim-dap")
    use("theHamsta/nvim-dap-virtual-text")
    use("rcarriga/nvim-dap-ui")
    -- use("Pocco81/DAPInstall.nvim")
    -- use("jbyuki/one-small-step-for-vimkind")

    use("j-hui/fidget.nvim")
    if paccker_bootstrap then
      packer.sync()
    end
  end,
  config = {
    -- 锁定插件版本在snapshots目录
    snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
    -- 这里锁定插件版本在v1，不会继续更新插件
    snapshot = "v1",

    -- 最大并发数plu
    max_jobs = 16,
    -- 自定义源
    git = {
      -- default_url_format = "https://hub.fastgit.xyz/%s",
      -- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
      -- default_url_format = "https://gitcode.net/mirrors/%s",
      -- default_url_format = "https://gitclone.com/github.com/%s",
    },
    -- display = {
    -- 使用浮动窗口显示
    --   open_fn = function()
    --     return require("packer.util").float({ border = "single" })
    --   end,
    -- },
  },
})

-- 每次保存 plugins.lua 自动安装插件
-- move to autocmds.lua
-- pcall(
--   vim.cmd,
--   [[
-- augroup packer_user_config
-- autocmd!
-- autocmd BufWritePost plugins.lua source <afile> | PackerSync
-- augroup end
-- ]]
-- )
