-- Avante AI 助手插件配置
return {
  opts = {
    provider = "openai",
    providers = {
      openai = {
        endpoint = "https://api.deepseek.com/v1",
        model = "deepseek-chat",
        timeout = 30000,
        max_tokens = 4096,
        api_key_name = "OPENAI_API_KEY",
        extra_request_body = {},
      },
    },
    auto_suggestions_provider = "openai",
    -- 禁用内联提示
    hints = { enabled = false },
    behaviour = {
      enable_token_counting = false,
    },
    windows = {
      position = "left",
      ask = {},
    },
    mappings = {
      ask = "<c-t>",
      edit = "<leader>ae",
      refresh = "<leader>ar",
      focus = "<leader>af",
      toggle = {
        debug = "<leader>ad",
        hint = "<leader>ah",
        suggestion = "<leader>asqwe",
        repomap = "<leader>aR",
      },
      sidebar = {
        apply_all = "A",
        apply_cursor = "a",
        switch_windows = "<Tab>",
        reverse_switch_windows = "<S-Tab>",
        remove_file = "d",
        add_file = "@",
        close = { "<Esc>", "q" },
      },
      submit = {
        normal = "<CR>",
        insert = "<C-s>",
      },
    },
  },

  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "stevearc/dressing.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
    "nvim-tree/nvim-web-devicons",
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        default = {
          embed_image_as_base64 = false,
          prompt_for_file_name = false,
          drag_and_drop = {
            insert_mode = true,
          },
          use_absolute_path = true,
        },
      },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
    },
  },

  -- 自定义快捷键绑定
  keys = function(_, keys)
    local opts =
      require("lazy.core.plugin").values(require("lazy.core.config").spec.plugins["avante.nvim"], "opts", false)

    local mappings = {
      {
        opts.mappings.ask,
        function()
          if vim.bo.filetype == "AvanteInput" then
            vim.cmd("AvanteToggle")
            vim.schedule(function()
              vim.api.nvim_feedkeys("\27", "n", false)
            end)
          else
            vim.cmd("AvanteToggle")
          end
        end,
        desc = "avante: toggle",
        mode = { "n", "i" },
      },
      {
        "<C-c>",
        "<cmd>AvanteClear<CR>",
        mode = { "n", "v" },
        desc = "clear avante history",
      },
    }
    mappings = vim.tbl_filter(function(m)
      return m[1] and #m[1] > 0
    end, mappings)
    return vim.list_extend(mappings, keys)
  end,
}
