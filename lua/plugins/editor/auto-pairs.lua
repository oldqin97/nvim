return {
  -- "windwp/nvim-autopairs",
  -- event = "VeryLazy",
  -- opts = {
  --   fast_wrap = {},
  -- },
  -- config = function(_, opts)
  --   require("nvim-autopairs").setup(opts)
  --   -- setup cmp for autopairs
  --   local cmp_autopairs = require("nvim-autopairs.completion.cmp")
  --   -- require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
  -- end,

  -- Error executing lua callback: ...e/nvim/lazy/blink.cmp/lua/blink/cmp/sources/lib/init.lua:74: Requested provider "look" has not been configured. Available providers: luasnip, lsp, path, snippets, calc, emoji, dadbod, lazydev, buffer
  -- stack traceback:
  -- 	[C]: in function 'assert'
  -- 	...e/nvim/lazy/blink.cmp/lua/blink/cmp/sources/lib/init.lua:74: in function 'get_provider_by_id'
  -- 	...e/nvim/lazy/blink.cmp/lua/blink/cmp/sources/lib/init.lua:67: in function 'get_enabled_providers'
  -- 	...e/nvim/lazy/blink.cmp/lua/blink/cmp/sources/lib/init.lua:94: in function 'get_trigger_characters'
  -- 	...lazy/blink.cmp/lua/blink/cmp/completion/trigger/init.lua:121: in function 'is_trigger_character'
  -- 	...lazy/blink.cmp/lua/blink/cmp/completion/trigger/init.lua:51: in function 'on_char_added'
  -- 	.../nvim/lazy/blink.cmp/lua/blink/cmp/lib/buffer_events.lua:60: in function <.../nvim/lazy/blink.cmp/lua/blink/cmp/lib/buffer_events.lua:50>
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = true,
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
}
