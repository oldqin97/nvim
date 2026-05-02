-- styled-components CSS-in-JS 语法高亮与补全支持
return {
  "neovim/nvim-lspconfig",
  opts = function(_, opts)
    -- styled-components 补全插件
    LazyVim.extend(opts.servers.vtsls, "settings.vtsls.tsserver.globalPlugins", {
      {
        name = "@styled/typescript-styled-plugin",
        location = "/Users/qin/.volta/tools/image/node/22.13.1/lib/node_modules",
        enableForWorkspaceTypeScriptVersions = true,
      },
    })
  end,
}
