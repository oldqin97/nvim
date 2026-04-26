---@diagnostic disable: missing-fields

return {
  -- {
  --   "yetone/avante.nvim",
  --   -- event = "VeryLazy",
  --   lazy = true,
  --   -- version = "v0.0.19",
  --   dependencies = require("plugins.conf.avanteConf").dependencies,
  --   keys = require("plugins.conf.avanteConf").keys,
  --   opts = require("plugins.conf.avanteConf").opts,
  --   -- if you want to build from source then do `make BUILD_FROM_SOURCE=true`
  --   build = "make",
  -- },
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        win = {
          layout = "float",
          float = {
            width = 0.5,
            height = 0.7,
          },
        },
        mux = {
          backend = "tmux",
          enabled = false,
        },
        prompts = {
          buffers = "当前buffers {buffers}",
          changes = "对我的代码改动进行审查",
          fix = "修复这段代码并说明原因：{this}",
          explain = "用中文解释这段代码：{this}",
          optimize = "优化这段代码（性能+可读性），给出修改后代码：{this}",
          tests = "为这段代码写测试用例（含边界情况）：{this}",
          document = "为这段代码补充规范注释：{function|line}",
          review = "做代码审查，指出问题和改进建议：{file}",
          diagnostics = "根据以下报错修复代码：{diagnostics}代码：{file}",
          refactor = "重构这段代码（保持功能不变）：{this}",
          commit = "根据修改生成规范 commit message：{this}",
          file = "当前文件 {file}",
          line = "当前行 {line}",
          position = "当前光标 {position}",
        },
      },
    },
    keys = {
      {
        "<C-t>",
        function()
          require("sidekick.cli").toggle({ name = "claude" })
        end,
        mode = { "n", "t", "i", "x" },
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select({ name = "claude" })
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ name = "claude", msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ name = "claude", msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ name = "claude", msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt({ name = "claude" })
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
