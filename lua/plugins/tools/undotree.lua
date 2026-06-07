-- 撤销树可视化（可视化查看和跳转编辑历史）
return {
  {
    "XXiaoA/atone.nvim",
    cmd = "Atone",
    keys = {
      { "md", "<cmd>Atone toggle<cr>", desc = "undoTree" },
    },
    opts = {
      layout = {
        direction = "left",
        width = 0.50,
      },
      diff_cur_node = {
        enabled = true,
        split_percent = 0.5,
      },
      keymaps = {
        tree = {
          undo_to = "o",
        },
      },
      ui = {
        node_label = {
          custom = true,
          ---@param ctx AtoneNodeLabelContext
          ---@return string
          formatter = function(ctx)
            local time_str
            if ctx.time == nil then
              time_str = "Original"
            else
              local diff = os.time() - ctx.time
              if diff < 60 then
                time_str = "<1 min ago"
              elseif diff < 3600 then
                local mins = math.floor(diff / 60)
                time_str = string.format("%d min%s ago", mins, mins > 1 and "s" or "")
              elseif diff < 86400 then
                local hrs = math.floor(diff / 3600)
                time_str = string.format("%d hr%s ago", hrs, hrs > 1 and "s" or "")
              else
                time_str = os.date("%Y-%m-%d %H:%M", ctx.time)
              end
            end
            return string.format("[%d] %s %s", ctx.seq, time_str, ctx.bookmark or "")
          end,
        },
      },
    },
  },
}
