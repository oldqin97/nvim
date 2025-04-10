-- styled-components syntax highlight and completion support for neovim's built-in LSP client

-- styled-components syntax highlight support treesitter install styled
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- styled-components completion support
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@styled/typescript-styled-plugin",
        location = "/Users/qin/.volta/tools/image/node/22.13.1/lib/node_modules",
        -- location = LazyVim.get_pkg_path("@styled/typescript-styled-plugin", "/node_modules/@vue/language-server"),
        enableForWorkspaceTypeScriptVersions = true,
      },
    })
  end,
}
