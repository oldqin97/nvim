return {
  "nvimtools/none-ls.nvim",
  opts = function(_, opts)
    local nls = require("null-ls")
    opts.sources = opts.sources or {}
    table.insert(opts.sources, nls.builtins.formatting.stylua)
    table.insert(opts.sources, nls.builtins.formatting.shfmt)
    table.insert(opts.sources, nls.builtins.formatting.black)
    table.insert(opts.sources, nls.builtins.formatting.sql_formatter)
    table.insert(
      opts.sources,
      nls.builtins.formatting.prettierd.with({
        filetypes = {
          "javascript",
          "javascriptreact",
          "typescript",
          "typescriptreact",
          "vue",
          "css",
          "scss",
          "less",
          "html",
          "json",
          "jsonc",
          "yaml",
          "markdown",
          "markdown.mdx",
          "graphql",
          "handlebars",
          "toml",
          "svelte",
          "wxss",
          "wxml",
        },
        extra_filetypes = { "wxml" },
        -- extra_args = function()
        --   return {
        --     "--jsx-single-quote=true",
        --     "--single-quote=false",
        --     "--print-width=90",
        --     "--arrow-parens=avoid",
        --     "--trailing-comma=all",
        --     "--bracket-same-line=true",
        --     "--vue-indent-script-and-style=true",
        --     "--embedded-language-formatting=auto",
        --     "--quote-props=consistent",
        --     "--tab-width=2",
        --     "--use-tabs=false",
        --     "--no-bracket-spacing=true",
        --     "--single-attribute-per-line=true",
        --     "--no-editorconfig=false",
        --   }
        -- end,
        extra_args = {
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
        },
      })
    )
  end,
}
