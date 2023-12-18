local leet_arg = "leetcode.nvim"
return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-treesitter/nvim-treesitter",
    "rcarriga/nvim-notify",
    "nvim-tree/nvim-web-devicons",
  },
  lazy = leet_arg ~= vim.fn.argv()[1],
  opts = {
    arg = leet_arg,
    lang = "js",
    cn = { -- leetcode.cn
      enabled = true,
      translator = true,
      translate_problems = true,
    },

    directory = vim.fn.stdpath("data") .. "/leetcode/",

    logging = true,

    cache = {
      update_interval = 60 * 60 * 24 * 7,
    },

    console = {
      open_on_runcode = true,
      dir = "row",
      size = {
        width = "90%",
        height = "75%",
      },

      result = {
        size = "60%",
      },

      testcase = {
        virt_text = true,

        size = "50%",
      },
    },
    description = {
      position = "left",
      width = "40%",
      show_stats = true,
    },

    hooks = {
      LeetEnter = {},
      LeetQuestionNew = {},
    },

    image_support = false, -- setting this to `true` will disable question description wrap
  },
}
