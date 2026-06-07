-- LeetCode 刷题插件（支持中文题目翻译）
return {
  {
    "kawre/leetcode.nvim",
    build = ":TSUpdate html",
    -- lazy = true,
    cmd = { "Leet" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      argument = "leetcode.nvim",
      picker = {
        provider = "snacks-picker",
      },
      lang = "javascript",
      cn = {
        enabled = true,
        translator = true,
        translate_problems = true,
      },
    },
  },
}
