return {
  on_setup = function(server)
    server.setup({
      capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
      cmd = { "vue-language-server", "--stdio" },
      init_options = {
        documentFeatures = {
          documentColor = false,
          documentFormatting = {
            defaultPrintWidth = 100,
          },
          documentSymbol = true,
          foldingRange = true,
          linkedEditingRange = true,
          selectionRange = true,
        },
        languageFeatures = {
          callHierarchy = true,
          codeAction = true,
          codeLens = true,
          completion = {
            defaultAttrNameCase = "kebabCase",
            defaultTagNameCase = "kebabCase",
          },
          definition = true,
          diagnostics = true,
          documentHighlight = true,
          documentLink = true,
          hover = true,
          implementation = true,
          references = true,
          rename = true,
          renameFileRefactoring = true,
          schemaRequestService = true,
          semanticTokens = false,
          signatureHelp = true,
          typeDefinition = true,
        },
      },
      on_attach = function(client, bufnr)
        -- 禁用格式化功能，交给专门插件插件处理
        client.resolved_capabilities.document_formatting = false
        client.resolved_capabilities.document_range_formatting = false
        local function buf_set_keymap(...)
          vim.api.nvim_buf_set_keymap(bufnr, ...)
        end
        -- 绑定快捷键
        require("keybindings").mapLSP(buf_set_keymap)
      end,
    })
  end,
}
