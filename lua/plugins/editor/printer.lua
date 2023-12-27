return {
  -- print
  "rareitems/printer.nvim",
  event = "BufReadPost",
  config = function()
    require("printer").setup({
      keymap = "<leader>pb",     -- Plugin doesn't have any keymaps by default
      behavior = "insert_below", -- how operator should behave

      formatters = {
        lua = function(inside, variable)
          return string.format('print("%s: " .. %s)', inside, variable)
        end,
      },
      add_to_inside = function(text)
        return string.format("[%s:%s] %s", vim.fn.expand("%"), vim.fn.line("."), text)
      end,
    })

    vim.keymap.set("n", "<leader>pb", "<Plug>(printer_below)iw")
    vim.keymap.set("v", "<leader>pb", "<Plug>(printer_below)iw")
  end,
}
