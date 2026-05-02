-- 环境变量管理插件（支持 .env 文件查看和补全）
return {
  "philosofonusus/ecolog.nvim",
  event = { "BufReadPost" },
  keys = {
    { "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
    { "<leader>ep", "<cmd>EcologPeek<cr>", desc = "Ecolog peek variable" },
    { "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
  },
  lazy = false,
  opts = {
    integrations = { blink_cmp = true },
    -- 敏感值遮蔽模式配置
    shelter = {
      configuration = {
        partial_mode = {
          show_start = 3,
          show_end = 3,
          min_mask = 3,
        },
        mask_char = "*",
        mask_length = nil,
      },
      modules = {
        cmp = false,
        peek = false,
        files = false,
        telescope = false,
        telescope_previewer = false,
        fzf = false,
        fzf_previewer = false,
        snacks_previewer = false,
        snacks = false,
      },
    },
    types = true,
    path = vim.fn.getcwd(),
    preferred_environment = "development",
    provider_patterns = true,
  },
}
