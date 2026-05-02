-- AI 代码助手：supermaven 代码补全 + sidekick 对话
return {
  -- AI 行内代码补全
  {
    "supermaven-inc/supermaven-nvim",
    event = "VeryLazy",
    config = function()
      require("supermaven-nvim").setup({
        keymaps = {
          accept_suggestion = "<Tab>",
          accept_word = "<C-j>",
          clear_suggestion = "<C-]>",
        },
        ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
        color = {
          suggestion_color = "#928374", -- gruvbox 灰色
          cterm = 245,
        },
        log_level = "off",
        disable_inline_completion = false,
        disable_keymaps = false,
      })
    end,
  },
  -- AI 对话助手（集成 Claude Code）
  {
    "folke/sidekick.nvim",
    opts = {
      cli = {
        win = {
          layout = "float",
          float = { width = 0.5, height = 0.7 },
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
          require("sidekick.cli").select({ name = "claude", auto = true })
        end,
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
          require("sidekick.cli").prompt({
            cb = function(_, text)
              if text then
                require("sidekick.cli").send({ text = text, name = "claude" })
              end
            end,
          })
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
    },
  },
}
