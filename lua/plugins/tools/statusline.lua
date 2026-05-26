---@diagnostic disable: undefined-field, deprecated, missing-parameter, need-check-nil

-- 跟踪各 LSP client 的待处理任务数及进度（带平滑动画）
local lsp_pending = {}
local lsp_progress = {}
local lsp_target = {}
local lsp_anim_timers = {}
local lsp_done = {}
local lsp_done_pending = {}

local function start_anim(client_id, target)
  lsp_target[client_id] = target
  if lsp_anim_timers[client_id] then
    return -- 动画已在运行，下一帧会自动拾取新 target
  end
  local timer = vim.uv.new_timer()
  lsp_anim_timers[client_id] = timer
  timer:start(0, 16, vim.schedule_wrap(function()
    if lsp_anim_timers[client_id] ~= timer then
      return -- timer 已被新的 begin 事件替换
    end
    local cur = lsp_progress[client_id] or 0
    local tgt = lsp_target[client_id] or target
    if cur >= tgt then
      lsp_progress[client_id] = tgt
      timer:stop()
      timer:close()
      lsp_anim_timers[client_id] = nil
      if lsp_done_pending[client_id] and tgt >= 100 then
        lsp_done_pending[client_id] = nil
        lsp_done[client_id] = true
        vim.defer_fn(function()
          lsp_done[client_id] = nil
          lsp_progress[client_id] = nil
        end, 500)
      end
      return
    end
    lsp_progress[client_id] = math.min(tgt, cur + 4)
  end))
end

pcall(vim.api.nvim_create_autocmd, "LspProgress", {
  group = vim.api.nvim_create_augroup("user_lualine_lsp", {}),
  callback = function(args)
    local client_id = args.data.client_id
    local kind = args.data.params.value.kind
    if kind == "begin" then
      lsp_done[client_id] = nil
      lsp_done_pending[client_id] = nil
      local old = lsp_anim_timers[client_id]
      if old then
        lsp_anim_timers[client_id] = nil
        pcall(function() old:stop() end)
        pcall(function() old:close() end)
      end
      lsp_progress[client_id] = 0
      lsp_target[client_id] = 0
      lsp_pending[client_id] = (lsp_pending[client_id] or 0) + 1
    elseif kind == "end" then
      lsp_pending[client_id] = math.max((lsp_pending[client_id] or 1) - 1, 0)
      if lsp_pending[client_id] == 0 then
        lsp_done_pending[client_id] = true
        start_anim(client_id, 100)
      end
    elseif kind == "report" then
      local pct = args.data.params.value.percentage
      if pct then
        start_anim(client_id, pct)
      end
    end
  end,
})

-- 状态栏配置（lualine）
return {
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    lazy = true,
    event = { "LspAttach" },
    opts = {
      options = {
        globalstatus = true,
        component_separators = { left = "|", right = "|" },
        section_separators = { left = " ", right = "" },
        disabled_filetypes = {
          "dashboard",
          "lspinfo",
          "mason",
          "startuptime",
          "checkhealth",
          "help",
          "toggleterm",
          "alpha",
          "lazy",
          "packer",
          "NvimTree",
          "sagaoutline",
          "TelescopePrompt",
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          "diagnostics",
          {
            function()
              local reg = vim.fn.reg_recording()
              if reg ~= "" then
                return "Recording @" .. reg
              end
              return ""
            end,
            color = { fg = "#ff9e64" },
          },
        },
        lualine_c = {
          "bo:filetype",
          -- lsp 命令状态
          {
            function()
              local clients = vim.lsp.get_clients({ bufnr = 0 })
              if #clients == 0 then
                return ""
              end
              local names = {}
              for _, client in ipairs(clients) do
                if not client.is_stopped() then
                  local pending = lsp_pending[client.id] or 0
                  if pending > 0 then
                    local pct = lsp_progress[client.id]
                    if pct then
                      table.insert(names, string.format("%s %d%%%%", client.name, pct))
                    else
                      table.insert(names, client.name)
                    end
                  elseif lsp_done[client.id] then
                    table.insert(names, string.format("%s done", client.name))
                  end
                end
              end
              return #names > 0 and table.concat(names, " ") or ""
            end,
            icon = "",
          },
        },
        lualine_x = {
          -- noice 命令状态
          -- {
          --   function()
          --     return require("noice").api.status.command.get()
          --   end,
          --   cond = function()
          --     return package.loaded["noice"] and require("noice").api.status.command.has()
          --   end,
          --   color = function()
          --     return { fg = Snacks.util.color("Statement") }
          --   end,
          -- },
          -- DAP 调试状态
          {
            function()
              return "  " .. require("dap").status()
            end,
            cond = function()
              return package.loaded["dap"] and require("dap").status() ~= ""
            end,
          },
          -- Git 差异状态
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return { added = gitsigns.added, modified = gitsigns.changed, removed = gitsigns.removed }
              end
            end,
          },
        },
        lualine_y = { { "location", padding = { left = 0, right = 1 } } },
        lualine_z = { "filesize" },
      },
    },
  },
}
