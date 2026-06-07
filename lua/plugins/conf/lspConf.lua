-- LSP 服务器配置：各语言服务器的独立设置
return {
  servers = {
    -- 全局 LSP 按键映射
    ["*"] = {
      keys = {
        {
          "ca",
          function()
            vim.lsp.buf.code_action()
          end,
          desc = "Code Action",
        },
        { "<A-r>", vim.lsp.buf.rename, desc = "Rename", has = "rename" },
        {
          "gh",
          function()
            require("pretty_hover").hover()
          end,
          desc = "Hover",
        },
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
    -- vue
    vue_ls = {
      settings = {
        vue = {
          -- 自动插入
          autoInsert = {
            bracketSpacing = true, -- {{ expression }} 花括号内侧自动加空格
            dotValue = true, -- 自动补全时不自动插入 .value（ref 解包）
          },
          -- 代码操作
          codeActions = {
            askNewComponentName = true, -- 提取组件时询问组件名
          },
          -- 编辑器行为
          editor = {
            focusMode = false, -- 焦点模式：只高亮当前组件语法
            reactivityVisualization = true, -- gutter 显示响应式变量标记
            templateInterpolationDecorators = true, -- 模板插值位置显示装饰标记
          },
          -- 格式化
          format = {
            script = { enabled = true, initialIndent = false }, -- <script> 块格式化
            style = { enabled = true, initialIndent = false }, -- <style> 块格式化
            template = { enabled = true, initialIndent = true }, -- <template> 块格式化
            wrapAttributes = "auto", -- 属性换行：auto / force / force-aligned / preserve
          },
          -- 悬停提示
          hover = {
            rich = true, -- 是否显示丰富的类型信息
          },
          -- 内联提示
          inlayHints = {
            destructuredProps = true, -- 解构 props 时显示类型提示
            inlineHandlerLeading = true, -- 事件处理函数的参数名提示
            missingProps = true, -- 缺失的必传 prop 名提示
            optionsWrapper = true, -- 显示 defineOptions 包装
            vBindShorthand = true, -- v-bind 简写的属性名提示
          },
          -- 服务端
          server = {
            includeLanguages = { "vue" }, -- 当作 Vue SFC 处理的语言
          },
          -- 建议/补全
          suggest = {
            componentNameCasing = "alwaysKebabCase", -- 组件名补全偏好
            defineAssignment = true, -- 自动插入 defineProps/defineEmits 赋值补全
            propNameCasing = "alwaysKebabCase", -- prop 名补全偏好
          },
        },
      },
    },
    -- Emmet 支持
    emmet_language_server = {
      filetypes = { "html", "css", "javascriptreact", "typescriptreact" },
    },
    -- 微信小程序 wxml 文件类型映射
    html = {
      filetypes = { "html", "wxml" },
    },
    -- 微信小程序 wxss 文件类型映射
    cssls = {
      filetypes = { "css", "wxss" },
    },
    -- HTTP 文件语法支持（.http / .rest）
    kulala_ls = {},
    -- 英语语法和拼写检查（markdown / text）
    ltex_plus = {
      filetypes = { "markdown", "text" },
      settings = {
        ltex = {
          language = "en-US",
          disabledRules = {
            ["en-US"] = { "MORFOLOGIK_RULE_EN_US" },
          },
        },
      },
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
