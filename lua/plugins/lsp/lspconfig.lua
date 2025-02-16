return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = {
      "gh",
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Hover",
    }
    keys[#keys + 1] = {
      "gi",
      function()
        require("telescope.builtin").lsp_implementations({ reuse_win = true })
      end,
      desc = "Goto Implementation",
    }
    keys[#keys + 1] = {
      "ca",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
    }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "<A-r>", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<a-p>", false }
  end,

  opts = {
    servers = {
      rust_analyzer = {
        keys = {
          { "gh", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
          { "<leader>ca", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
          { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
        },
      },
      taplo = {
        keys = {
          {
            "gh",
            function()
              if vim.fn.expand("%:t") == "Cargo.toml" and require("crates").popup_available() then
                require("crates").show_popup()
              else
                vim.lsp.buf.hover()
              end
            end,
            desc = "Show Crate Documentation",
          },
        },
      },
      tailwindcss = {
        filetypes_exclude = { "markdown", "javascript", "typescript" },
      },
      vtsls = {
        settings = {
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            suggest = {
              completeFunctionCalls = true,
            },
            inlayHints = {
              enumMemberValues = { enabled = true },
              functionLikeReturnTypes = { enabled = true },
              -- parameterNames = { enabled = "literals" },
              parameterNames = { enabled = true },
              parameterTypes = { enabled = true },
              propertyDeclarationTypes = { enabled = true },
              variableTypes = { enabled = true },
            },
          },
        },
      },
      html = {
        filetypes = { "html", "wxml" },
      },
      cssls = {
        filetypes = { "css", "wxss" },
      },
      ltex = {
        language = "en-US",
        filetypes = { "markdown", "text" },
      },
      custom_elements_ls = {
        filetypes = { "html" },
      },
      volar = {
        init_options = {
          -- preferences = {
          --   preferredTagNameCase = "kebab", -- 设置为kebab-case
          --   preferredAttrNameCase = "kebab-case", -- Props属性名也使用kebab-case
          --   -- 可选：其他偏好设置
          -- },
          vue = {
            hybridMode = false,
          },
        },
      },
    },
  },
}
