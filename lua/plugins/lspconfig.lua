local util = require("lspconfig.util")

local function get_typescript_server_path(root_dir)
  local global_ts = "/Users/qin/.nvm/versions/node/v16.16.0/lib/node_modules/typescript/lib"
  local found_ts = ""
  local function check_dir(path)
    found_ts = util.path.join(path, "node_modules", "typescript", "lib")
    if util.path.exists(found_ts) then
      return path
    end
  end
  if util.search_ancestors(root_dir, check_dir) then
    return found_ts
  else
    return global_ts
  end
end

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
    keys[#keys + 1] = { "K", false }
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
    keys[#keys + 1] = { "gI", false }
    keys[#keys + 1] = { "<A-r>", vim.lsp.buf.rename, desc = "Rename", has = "rename" }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cl", false }
  end,
  opts = {
    servers = {
      rust_analyzer = {
        keys = {
          { "gh", "<cmd>RustHoverActions<cr>", desc = "Hover Actions (Rust)" },
          { "<leader>cr", "<cmd>RustCodeAction<cr>", desc = "Code Action (Rust)" },
          { "<leader>dr", "<cmd>RustDebuggables<cr>", desc = "Run Debuggables (Rust)" },
        },
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              loadOutDirsFromCheck = true,
              runBuildScripts = true,
            },

            checkOnSave = {
              allFeatures = true,
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
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

      volar = {
        settings = {
          vue = {
            autoInsert = {
              dotValue = true,
              bracketSpacing = true,
            },
            codeLens = {
              enable = true,
            },
            complete = {
              casing = {
                props = "kebab",
                tags = "kebab",
              },
            },
          },
        },

        on_new_config = function(new_config, new_root_dir)
          new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
        end,
      },
    },
  },

  -- setup = {
  --   volar = function(_, opts)
  --     opts.filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" }
  --
  --     opts.on_new_config = function(new_config, new_root_dir)
  --       new_config.init_options.typescript.tsdk = get_typescript_server_path(new_root_dir)
  --     end
  --
  --     opts.settings = {
  --       vue = {
  --         complete = {
  --           casing = {
  --             tags = "kebab",
  --             props = "kebab",
  --           },
  --         },
  --       },
  --     }
  --   end,
  -- },
}
