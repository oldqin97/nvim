local status, formatter = pcall(require, "formatter")
if not status then
  vim.notify("没有找到 formatter")
  return
end

formatter.setup({
  filetype = {
    lua = {
      function()
        return {
          exe = "stylua",
          args = {
            "--config-path " .. "/home/oq/.config/nvim/.stylua.toml",
            "-",
          },
          stdin = true,
        }
      end,
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = { "--emit=stdout" },
          stdin = true,
        }
      end,
    },
    javascript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    html = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    markdown = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    yaml = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    graphql = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    json = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    javascriptreact = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    typescriptreact = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    typescript = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    vue = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    less = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    scss = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
    css = {
      -- prettier
      function()
        return {
          exe = "prettier",
          args = {
            "--stdin-filepath",
            vim.fn.fnameescape(vim.api.nvim_buf_get_name(0)),
            "--jsx-single-quote",
            "--single-quote",
            "--print-width=90",
            "--arrow-parens=avoid",
            "--trailing-comma=all",
            "--bracket-same-line=true",
            "--vue-indent-script-and-style=true",
            "--bracket-same-line",
          },
          stdin = true,
        }
      end,
    },
  },
})

-- format on save
-- vim.api.nvim_exec(
--   [[
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.js,*.rs,*.lua FormatWrite
-- augroup END
-- ]],
--   true
-- )
