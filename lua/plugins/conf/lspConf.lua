return {
  lspKes = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    keys[#keys + 1] = {
      "gh",
      function()
        vim.lsp.buf.hover()
      end,
      desc = "Hover",
    }
    -- keys[#keys + 1] = {
    --   "gi",
    --   function()
    --     require("telescope.builtin").lsp_implementations({ reuse_win = true })
    --   end,
    --   desc = "Goto Implementation",
    -- }
    keys[#keys + 1] = {
      "ca",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Action",
    }
    keys[#keys + 1] = { "<A-r>", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    keys[#keys + 1] = { "K", false }
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<a-p>", false }

    vim.list_extend(keys, {
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
        has = "definition",
      },
      {
        "gr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gi",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      { "<leader>ss", false },
      { "<leader>sS", false },
    })
  end,

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
            functionLikeReturnTypes = { enabled = false },
            parameterNames = { enabled = false },
            -- parameterNames = { enabled = "literals" },
            -- parameterNames = { enabled = "all" },
            parameterTypes = { enabled = false },
            propertyDeclarationTypes = { enabled = true },
            variableTypes = { enabled = false },
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
        vue = {
          hybridMode = false,
        },
      },
    },
  },
}
