-- LSP 服务器配置：各语言服务器的独立设置
return {
  servers = {
    -- 全局 LSP 按键映射
    ["*"] = {
      keys = {
        { "ca", function() vim.lsp.buf.code_action() end, desc = "Code Action" },
        { "<A-r>", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
        { "gh", function() require("pretty_hover").hover() end, desc = "Hover" },
        { "gd", function() Snacks.picker.lsp_definitions() end, desc = "Goto Definition", has = "definition" },
        { "gr", function() Snacks.picker.lsp_references() end, nowait = true, desc = "References" },
        { "gi", function() Snacks.picker.lsp_implementations() end, desc = "Goto Implementation" },
        { "gy", function() Snacks.picker.lsp_type_definitions() end, desc = "Goto T[y]pe Definition" },
        -- 禁用 LazyVim 默认按键映射
        { "K", false },
        { "gI", false },
        { "<leader>cr", false },
        { "<leader>ca", false },
        { "<leader>cl", false },
        { "<a-p>", false },
        { "<a-n>", false },
      },
    },

    rust_analyzer = {
      keys = {
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
    angularls = {
      -- 仅在存在 angular.json 时启用
      root_dir = function(fname)
        local util = require("lspconfig.util")
        return util.root_pattern("angular.json")(fname)
      end,
    },
    -- TypeScript/JavaScript LSP 配置
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
            parameterTypes = { enabled = false },
            propertyDeclarationTypes = { enabled = false },
            variableTypes = { enabled = false },
          },
        },
      },
    },
    -- 微信小程序 wxml 文件类型映射
    html = {
      filetypes = { "html", "wxml" },
    },
    -- 微信小程序 wxss 文件类型映射
    cssls = {
      filetypes = { "css", "wxss" },
    },
    -- LaTeX 语法检查
    ltex = {
      language = "en-US",
      filetypes = { "markdown", "text" },
    },
    -- JSON 模式支持，包括微信小程序配置
    jsonls = {
      settings = {
        json = {
          schemas = {
            {
              description = "微信小程序配置",
              fileMatch = { "app.json", "project.config.json", "**/page.json" },
              url = "https://raw.githubusercontent.com/wechat-miniprogram/schemas/master/app.schema.json",
            },
          },
        },
      },
    },
  },
}
