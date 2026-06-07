return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  priority = 1000,
  opts = {
    -- 预设主题：classic（经典）/ modern（现代）/ helix（helix 风格）
    preset = "helix",

    -- 弹出窗口延迟（毫秒），插件触发时立即显示，手动触发延迟 200ms
    delay = function(ctx)
      return ctx.plugin and 0 or 500
    end,

    -- 过滤不需要显示的按键映射
    filter = function(mapping)
      -- 排除 which-key 自身的映射
      return true
    end,

    -- 手动添加的按键映射分组
    spec = {},

    -- 检测到映射配置问题时是否发出警告
    notify = true,

    -- 自动触发的 Triggers（显示当前可用的按键提示）
    triggers = {
      { "<auto>", mode = "nxso" },
    },

    -- 在可视块模式等场景下延迟显示
    defer = function(ctx)
      return ctx.mode == "V" or ctx.mode == "<C-V>"
    end,

    -- 展开分组：当分组内映射数 <= 1 时自动展开
    expand = 0,

    -- 底部命令行显示使用说明
    show_help = true,

    -- 显示当前按下的按键序列
    show_keys = true,

    -- 调试模式
    debug = false,

    -- 内置插件
    plugins = {
      -- 标记列表（按 ' 或 ` 显示）
      marks = true,
      -- 寄存器列表（按 " 显示）
      registers = true,
      -- 拼写建议（按 z= 显示）
      spelling = {
        enabled = true,
        suggestions = 20,
      },
      -- 预设帮助
      presets = {
        -- 操作符帮助（d, y 等）
        operators = true,
        -- 移动命令帮助
        motions = true,
        -- 文本对象帮助（操作符后触发）
        text_objects = true,
        -- 窗口操作帮助（<c-w> 前缀）
        windows = true,
        -- 导航相关帮助
        nav = true,
        -- z 前缀绑定（折叠、拼写等）
        z = true,
        -- g 前缀绑定
        g = true,
      },
    },

    -- 弹出窗口配置
    win = {
      -- 窗口不遮挡光标所在行
      no_overlap = true,
      -- 内边距 [上下, 左右]
      padding = { 1, 2 },
      -- 显示窗口标题
      title = true,
      -- 标题位置
      title_pos = "center",
      -- 窗口层级
      zindex = 1000,
      -- 附加窗口 buffer 选项
      bo = {},
      -- 附加窗口选项
      wo = {},
    },

    -- 布局配置
    layout = {
      width = {
        -- 每列最小/最大宽度
        min = 20,
      },
      -- 列间距
      spacing = 3,
    },

    -- 弹出窗口内导航按键
    keys = {
      scroll_down = "<c-d>", -- 向下滚动
      scroll_up = "<c-u>", -- 向上滚动
    },

    -- 排序规则
    sort = { "local", "order", "group", "alphanum", "mod" },

    -- 图标配置
    icons = {
      -- 面包屑导航分隔符
      breadcrumb = "»",
      -- 按键与描述之间的分隔符
      separator = "➜",
      -- 分组符号
      group = "+",
      -- 截断符号
      ellipsis = "…",
      -- 是否显示按键映射图标
      mappings = true,
      -- 使用 mini.icons 的颜色高亮
      colors = true,
      -- 图标替换规则
      rules = {},
      -- 特殊按键图标
      keys = {
        Up = " ",
        Down = " ",
        Left = " ",
        Right = " ",
        C = "󰘴 ",
        M = "󰘵 ",
        D = "󰘳 ",
        S = "󰘶 ",
        CR = "󰌑 ",
        Esc = "󱊷 ",
        ScrollWheelDown = "󱕐 ",
        ScrollWheelUp = "󱕑 ",
        NL = "󰌑 ",
        BS = "󰁮",
        Space = "󱁐 ",
        Tab = "󰌒 ",
        F1 = "󱊫",
        F2 = "󱊬",
        F3 = "󱊭",
        F4 = "󱊮",
        F5 = "󱊯",
        F6 = "󱊰",
        F7 = "󱊱",
        F8 = "󱊲",
        F9 = "󱊳",
        F10 = "󱊴",
        F11 = "󱊵",
        F12 = "󱊶",
      },
    },

    -- 替换显示格式
    replace = {
      key = {
        function(key)
          return require("which-key.view").format(key)
        end,
      },
      desc = {
        { "<Plug>%(?(.*)%)?", "%1" },
        { "^%+", "" },
        { "<[Cc]md>", "" },
        { "<[Cc][Rr]>", "" },
        { "<[Ss]ilent>", "" },
        { "^lua%s+", "" },
        { "^call%s+", "" },
        { "^:%s*", "" },
      },
    },

    -- 禁用条件
    disable = {
      -- 在这些文件类型下禁用 which-key
      ft = {},
      -- 在这些 buffer 类型下禁用 which-key
      bt = {},
    },
  },
}
