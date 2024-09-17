local logo = [[



    ___________
    < Love CC!  >
    -----------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||
    ]]

local function getGreeting(name)
  local tableTime = os.date("*t")
  local dateTime = os.date(" %Y-%m-%d   %H:%M:%S")
  local hour = tableTime.hour
  local greetingsTable = {
    [1] = "  Sleep well",
    [2] = "  Good morning",
    [3] = "  Good afternoon",
    [4] = "  Good evening",
    [5] = "󰖔  Good night",
  }
  local greetingIndex = 0
  if hour == 23 or hour < 7 then
    greetingIndex = 1
  elseif hour < 12 then
    greetingIndex = 2
  elseif hour >= 12 and hour < 18 then
    greetingIndex = 3
  elseif hour >= 18 and hour < 21 then
    greetingIndex = 4
  elseif hour >= 21 then
    greetingIndex = 5
  end
  return "\t\t\t" .. dateTime .. "\t" .. greetingsTable[greetingIndex] .. ", " .. name
end
-- local userName = "Qin"
-- local greeting = getGreeting(userName)
return {
  {
    "goolord/alpha-nvim",
    -- event = "VimEnter",
    lazy = vim.fn.argc() ~= 0,
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = function()
      local startify = require("alpha.themes.startify")
      startify.section.header.val = vim.split(logo .. "\n" .. getGreeting("Qin"), "\n")

      startify.section.top_buttons.val = {
        -- startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
        startify.button("l", "  Plugin manage", "<cmd>Lazy<CR>"),
        startify.button("s", "  Load session", "<cmd>lua require('persistence').load()<CR>"),
        startify.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
      }

      -- startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
      startify.section.mru.val = { { type = "padding", val = 0 } }

      startify.nvim_web_devicons.enabled = true

      startify.section.bottom_buttons.val = {
        startify.button("q", "󰅙  Quit", ":qa<CR>"),
      }

      return startify
    end,
    config = function(_, startify)
      -- if vim.o.filetype == "lazy" then
      --   vim.cmd.close()
      --   vim.api.nvim_create_autocmd("User", {
      --     once = true,
      --     pattern = "AlphaReady",
      --     callback = function()
      --       require("lazy").show()
      --     end,
      --   })
      -- end

      require("alpha").setup(startify.opts)

      vim.api.nvim_create_autocmd("User", {
        once = true,
        pattern = "LazyVimStarted",
        callback = function()
          local stats = require("lazy").stats()
          local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
          startify.section.footer.val = {
            { type = "padding", val = 1 },
            { type = "text", val = "The best way to explain it is to do it." },
            { type = "padding", val = 1 },
            {
              type = "text",
              val = "🚀 Neovim loaded " .. stats.loaded .. "/" .. stats.count .. " plugins in " .. ms .. "ms",
            },
          }
          pcall(vim.cmd.AlphaRedraw)
        end,
      })
    end,
  },
}
