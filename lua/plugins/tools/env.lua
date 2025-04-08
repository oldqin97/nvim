return {
  "philosofonusus/ecolog.nvim",
  keys = {
    { "<leader>ge", "<cmd>EcologGoto<cr>", desc = "Go to env file" },
    { "<leader>ep", "<cmd>EcologPeek<cr>", desc = "Ecolog peek variable" },
    { "<leader>es", "<cmd>EcologSelect<cr>", desc = "Switch env file" },
  },
  -- Lazy loading is done internally
  lazy = false,
  opts = {
    integrations = {
      blink_cmp = true,
    },
    -- Enables shelter mode for sensitive values
    shelter = {
      configuration = {
        partial_mode = {
          show_start = 3, -- Show first 3 characters
          show_end = 3, -- Show last 3 characters
          min_mask = 3, -- Minimum masked characters
        },
        mask_char = "*", -- Character used for masking
        mask_length = nil, -- Optional: fixed length for masked portion (defaults to value length)
      },
      modules = {
        cmp = false, -- Enabled to mask values in completion
        peek = false, -- Enable to mask values in peek view
        files = false, -- Enabled to mask values in file buffers
        telescope = false, -- Enable to mask values in telescope integration
        telescope_previewer = false, -- Enable to mask values in telescope preview buffers
        fzf = false, -- Enable to mask values in fzf picker
        fzf_previewer = false, -- Enable to mask values in fzf preview buffers
        snacks_previewer = false, -- Enable to mask values in snacks previewer
        snacks = false, -- Enable to mask values in snacks picker
      },
    },
    -- true by default, enables built-in types (database_url, url, etc.)
    types = true,
    path = vim.fn.getcwd(), -- Path to search for .env files
    preferred_environment = "development", -- Optional: prioritize specific env files
    -- Controls how environment variables are extracted from code and how cmp works
    provider_patterns = true, -- true by default, when false will not check provider patterns
  },
}
