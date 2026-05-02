-- 窗口分割与焦点自动调整
return {
  {
    "nvim-focus/focus.nvim",
    event = "VeryLazy",
    version = "*",
    config = function()
      local ignore_filetypes = {
        "snacks_picker_list", "snacks_terminal",
        "Outline", "AvanteSelectedFiles", "AvanteInput", "Avante",
        "dapui_console", "dapui_watches", "dapui_stacks", "dapui_breakpoints", "dapui_scopes",
        "OverseerList", "DiffviewFiles", "qf",
        "atone", "sidekick_terminal",
      }
      vim.api.nvim_create_autocmd("FileType", {
        group = augroup,
        callback = function(_)
          if vim.tbl_contains(ignore_filetypes, vim.bo.filetype) then
            vim.b.focus_disable = true
          else
            vim.b.focus_disable = false
          end
        end,
        desc = "Disable focus autoresize for FileType",
      })
      require("focus").setup({
        enable = true,
        commands = true,
        autoresize = {
          enable = true,
          width = 0,
          height = 0,
          minwidth = 0,
          minheight = 0,
          height_quickfix = 10,
        },
        split = {
          bufnew = false,
          tmux = false,
        },
        ui = {
          number = false,
          relativenumber = false,
          hybridnumber = false,
          absolutenumber_unfocussed = false,
          cursorline = false,
          cursorcolumn = false,
          colorcolumn = { enable = false, list = "+1" },
          signcolumn = false,
          winhighlight = false,
        },
      })
    end,
  },
}
