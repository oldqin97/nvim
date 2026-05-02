-- 代码格式化配置：通过 none-ls 集成多个格式化工具
return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = vim.list_extend(opts.sources or {}, {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.shfmt,
      nls.builtins.formatting.black,
      nls.builtins.formatting.sql_formatter,
      nls.builtins.formatting.prettier.with({
        filetypes = {
          "javascript", "javascriptreact",
          "typescript", "typescriptreact",
          "vue", "css", "scss", "less", "html",
          "json", "jsonc", "yaml",
          "markdown", "markdown.mdx",
          "graphql", "handlebars",
          "toml", "svelte",
          "wxml", "wxss",
        },
        extra_args = function(params)
          -- 微信小程序 wxml 使用 html 解析器
          if params.bufname:match("%.wxml$") then
            return { "--parser", "html" }
          end
          return {
            "--jsx-single-quote=true",
            "--single-quote=false",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--embedded-language-formatting=auto",
            "--quote-props=consistent",
            "--tab-width=2",
            "--use-tabs=false",
            "--no-bracket-spacing=true",
            "--single-attribute-per-line=true",
            "--no-editorconfig=false",
          }
        end,
      }),
    })
  end,
}
