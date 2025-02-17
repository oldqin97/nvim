return {
  keys = {
    --terminal
    -- {
    --   "<C-o>",
    --   mode = { "n", "i", "t" },
    --   function()
    --     Snacks.terminal.open()
    --   end,
    --   desc = "terminal open",
    -- },
    -- explorer
    {
      "<A-w>",
      function()
        Snacks.explorer()
      end,
      desc = "explorer",
    },
    -- diagnostics
    {
      "<leader>bb",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Notification History",
    },
    {
      "<leader>dd",
      function()
        Snacks.picker.diagnostics_buffer()
      end,
      desc = "Notification History",
    },
    {
      "<leader>hh",
      function()
        Snacks.notifier.show_history()
      end,
      desc = "Notification History",
    },
    -- fihd
    {
      "<a-p>",
      function()
        Snacks.picker.smart()
      end,
      desc = "Find Files (Root Dir)",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },

    -- Grep
    { "<A-f>", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
    { "<C-f>", LazyVim.pick("grep_word"), desc = "Visual selection or word (Root Dir)", mode = { "n", "x" } },
    -- search
    {
      "<leader>sc",
      function()
        Snacks.picker.command_history()
      end,
      desc = "Command History",
    },
    {
      "<leader>:",
      function()
        Snacks.picker.commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>sd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Diagnostics",
    },
    {
      "<leader>sh",
      function()
        Snacks.picker.search_history()
      end,
      desc = "search history",
    },
    {
      "<leader>sj",
      function()
        Snacks.picker.jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>sk",
      function()
        Snacks.picker.keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>sl",
      function()
        Snacks.picker.loclist()
      end,
      desc = "Location List",
    },
    {
      "<leader>sq",
      function()
        Snacks.picker.qflist()
      end,
      desc = "Quickfix List",
    },
    {
      "<leader>qp",
      function()
        Snacks.picker.projects()
      end,
      desc = "Projects",
    },

    {
      "<leader>un",
      function()
        Snacks.notifier.hide()
      end,
      desc = "Dismiss All Notifications",
    },
    {
      "<A-q>",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete Buffer",
    },
    -- git
    {
      "<leader>fg",
      function()
        Snacks.picker.git_files()
      end,
      desc = "Find Files (git-files)",
    },
    { "<leader>fr", LazyVim.pick("oldfiles"), desc = "Recent" },
    {
      "<leader>gc",
      function()
        Snacks.picker.git_log()
      end,
      desc = "Git Log",
    },
    {
      "<leader>gs",
      function()
        Snacks.picker.git_status()
      end,
      desc = "Git Status",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>bl",
      function()
        Snacks.git.blame_line()
      end,
      desc = "Git Blame Line",
    },
    {
      "<leader>bg",
      function()
        Snacks.gitbrowse()
      end,
      desc = "Git Browse",
    },
    {
      "<leader>gf",
      function()
        Snacks.lazygit.log_file()
      end,
      desc = "Lazygit Current File History",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "<leader>gb",
      function()
        Snacks.picker.git_branches()
      end,
      desc = "Lazygit Log (cwd)",
    },
    {
      "]]",
      function()
        Snacks.words.jump(vim.v.count1)
      end,
      desc = "Next Reference",
      mode = { "n", "t" },
    },
    {
      "[[",
      function()
        Snacks.words.jump(-vim.v.count1)
      end,
      desc = "Prev Reference",
      mode = { "n", "t" },
    },
    { "<leader>,", false },
    { "<leader><space>", false },
    { "<leader>/", false },
    { "<leader>s/", false },
    { "<leader>fc", false },
    { "<leader>ff", false },
    { "<leader>fF", false },
    { "<leader>fR", false },
    -- { "<leader>sb", false },
    { "<leader>sB", false },
    { "<leader>sG", false },
    { "<leader>sW", false },
    { '<leader>s"', false },
    { "<leader>sa", false },
    { "<leader>sC", false },
    { "<leader>sH", false },
    { "<leader>sM", false },
    { "<leader>sm", false },
    { "<leader>sR", false },
    { "<leader>uC", false },
    { "<leader>bd", false },
    { "<leader>sd", false },
    { "<leader>sD", false },
    { "<leader>ss", false },
    { "<leader>sS", false },
  },
  picker = {
    -- sources = require("plugins.conf.snacksConf").sources,
    sources = {
      explorer = {
        finder = "explorer",
        sort = { fields = { "sort" } },
        tree = true,
        git_status = true,
        git_status_open = false,
        supports_live = true,
        follow_file = true,
        focus = "list",
        auto_close = true,
        jump = { close = false },
        formatters = {
          file = { filename_only = true },
          severity = { pos = "right" },
        },
        matcher = { sort_empty = false },
        config = function(opts)
          return require("snacks.picker.source.explorer").setup(opts)
        end,
        win = {
          list = {
            keys = {
              ["o"] = "confirm",
              ["<c-o>"] = "explorer_open", -- open with system application
              ["<BS>"] = "explorer_up",
              ["l"] = "confirm",
              ["h"] = "explorer_close", -- close directory
              ["a"] = "explorer_add",
              ["d"] = "explorer_del",
              ["r"] = "explorer_rename",
              ["c"] = "explorer_copy",
              ["m"] = "explorer_move",
              ["P"] = "toggle_preview",
              ["y"] = "explorer_yank",
              ["u"] = "explorer_update",
              ["<c-c>"] = "explorer_cd",
              ["."] = "explorer_focus",
              ["I"] = "toggle_ignored",
              ["H"] = "toggle_hidden",
              ["Z"] = "explorer_close_all",
              ["]g"] = "explorer_git_next",
              ["[g"] = "explorer_git_prev",
              ["/"] = "toggle_focus",
              ["<2-LeftMouse>"] = "confirm",
              ["<CR>"] = "confirm",
              ["<Down>"] = "list_down",
              ["<Esc>"] = "close",
              ["<S-CR>"] = { { "pick_win", "jump" } },
              ["<S-Tab>"] = { "select_and_prev", mode = { "n", "x" } },
              ["<Tab>"] = { "select_and_next", mode = { "n", "x" } },
              ["<Up>"] = "list_up",
              ["<a-d>"] = "inspect",
              ["<a-f>"] = "toggle_follow",
              ["<a-h>"] = "toggle_hidden",
              ["<a-i>"] = "toggle_ignored",
              ["<a-m>"] = "toggle_maximize",
              ["<a-p>"] = "toggle_preview",
              ["<a-w>"] = { "cycle_win", mode = { "i" } },
              ["<c-a>"] = "select_all",
              ["<c-b>"] = "preview_scroll_up",
              ["<c-d>"] = "list_scroll_down",
              ["<c-f>"] = "preview_scroll_down",
              ["<c-j>"] = "list_down",
              ["<c-k>"] = "list_up",
              ["<c-n>"] = "list_down",
              ["<c-p>"] = "list_up",
              ["<c-s>"] = "edit_split",
              ["<c-u>"] = "list_scroll_up",
              ["<c-v>"] = "edit_vsplit",
              ["?"] = "toggle_help_list",
              ["G"] = "list_bottom",
              ["gg"] = "list_top",
              ["i"] = "focus_input",
              ["j"] = "list_down",
              ["k"] = "list_up",
              ["q"] = "close",
              ["zb"] = "list_scroll_bottom",
              ["zt"] = "list_scroll_top",
              ["zz"] = "list_scroll_center",
            },
          },
        },
        layout = {
          preset = "sidebar",
          preview = false,
          layout = {
            position = "right",
          },
        },
      },
      projects = {
        finder = "recent_projects",
        format = "file",
        dev = { "~/Library/Rime" },
        confirm = "load_session",
        patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "package.json", "Makefile", "qyx.config" },
        recent = true,
      },
    },
    win = {
      input = {
        keys = {
          -- ["<CR>"] = { "confirm", mode = { "n", "i" } },
          ["<Tab>"] = { "confirm", mode = { "i", "n" } },
          ["<Esc>"] = { "close", mode = { "n", "i" } },
          ["<a-g>"] = { "toggle_ignored", mode = { "i", "n" } },
          ["<c-g>"] = { "toggle_hidden", mode = { "i", "n" } },
        },
      },
      list = {
        keys = {
          ["<CR>"] = { "confirm", mode = { "n", "i" } },
        },
      },
    },
  },
  scope = {
    enabled = true, -- enable highlighting the current scope
    priority = 200,
    char = "┊",
    underline = false, -- underline the start of the scope
    only_current = true, -- only show scope in the current window
    hl = {
      "SnacksIndent1",
      "SnacksIndent2",
      "SnacksIndent3",
      "SnacksIndent4",
      "SnacksIndent5",
      "SnacksIndent6",
      "SnacksIndent7",
      "SnacksIndent8",
    },
  },
  indent = {
    enabled = true,
    chunk = {
      enabled = true,
      -- only show chunk scopes in the current window
      only_current = false,
      priority = 200,
      -- hl = "SnacksIndentChunk", ---@type string|string[] hl group for chunk scopes
      hl = {
        "SnacksIndent1",
        "SnacksIndent2",
        "SnacksIndent3",
        "SnacksIndent4",
        "SnacksIndent5",
        "SnacksIndent6",
        "SnacksIndent7",
        "SnacksIndent8",
      },
      char = {
        -- corner_top = "┌",
        -- corner_bottom = "└",
        corner_top = "╭",
        corner_bottom = "╰",
        horizontal = "─",
        vertical = "│",
        arrow = "─",
      },
    },
  },
  dashboard = {
    formats = {
      key = function(item)
        return { { "[", hl = "special" }, { item.key, hl = "key" }, { "]", hl = "special" } }
      end,
    },
    sections = {
      { section = "terminal", cmd = "cowsay 'hello'", hl = "header", padding = 1, indent = 0, width = 50 },
      { title = " Recent", section = "recent_files", cwd = true, limit = 3, padding = 1 },

      { title = " Projects", section = "projects", padding = 1 },
      { title = " Menu", section = "keys", padding = 1 },
      { section = "startup" },
    },
  },
  bigfile = {
    enabled = true,
    notify = true,
    size = 1 * 1024 * 1024, -- 1MB
    ---@param ctx {buf: number, ft:string}
    setup = function(ctx)
      vim.cmd([[NoMatchParen]])
      Snacks.util.wo(0, { foldmethod = "manual", statuscolumn = "", conceallevel = 0 })
      vim.b.minianimate_disable = true
      vim.schedule(function()
        vim.bo[ctx.buf].syntax = ctx.ft

        -- Tree-sitter 智能加载
        local is_ts_supported = function(ft)
          return #vim.treesitter.language.get_lang(ft) > 0
        end

        if is_ts_supported(ctx.ft) then
          -- 启用增量更新模式
          vim.b[ctx.buf].treesitter_disable_incremental = nil

          -- 安全启动 Tree-sitter
          pcall(vim.treesitter.start, ctx.buf, ctx.ft)

          -- 添加高亮引用
          -- if vim.treesitter.highlighter then
          --   vim.bo[ctx.buf].syntax = "off"
          --   vim.treesitter.highlighter.new(ctx.buf, ctx.ft)
          -- end
        end
      end)
    end,
  },
}
