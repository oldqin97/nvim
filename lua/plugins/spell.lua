local cspell_files = {
  find_json = function()
    return vim.fn.expand("~/.config/cspell/cspell.json")
  end,
}

return {
  {
    "davidmh/cspell.nvim",
  },
  {
    "nvimtools/none-ls.nvim",
    opts = function(_, opts)
      local cspell = require("cspell")
      opts.sources = vim.list_extend(opts.sources or {}, {
        cspell.diagnostics.with({
          diagnostics_postprocess = function(diagnostic)
            diagnostic.severity = vim.diagnostic.severity["HINT"] -- ERROR, WARN, INFO, HINT
          end,
          config = cspell_files,
        }),
        cspell.code_actions.with({ config = cspell_files }),
      })
    end,
  },
}
