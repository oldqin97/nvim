-- 对齐插件与图标支持
--
-- mini.ai: 智能文本对象插件
-- 基于 treesitter 提供更精确的文本对象，超越 vim 内置的单词/句子/段落级对象
--
-- 内置文本对象：
--   ia / aa   — 函数参数 (inner argument / around argument)
--   i? / a?   — 用户交互式选择范围
--   i) / a)   — 圆括号内/周围
--   i] / a]   — 方括号内/周围
--   i} / a}   — 花括号内/周围
--   i> / a>   — 尖括号内/周围
--   i' / a' i" / a" i` / a` — 引号内/周围
--   it / at   — 标签内/周围 (inner tag / around tag)
--   id / ad   — 数字内/周围
--   iW / aW   — WORD (包含空格分隔)
--   ib / ab   — 括号 (任意类型)
--   iq / aq   — 引号 (任意类型)
--   ic / ac   — 注释 (使用 treesitter 检测)
--   iC / aC   — 缩进块 (按缩进层级)
--   iD / aD   — 诊断消息区域
--   if / af   — 函数调用 (treesitter)
--   iF / aF   — 整个函数体 (treesitter)
--   il / al   — 循环体 (treesitter)
--   io / ao   — 条件语句体 (treesitter)
--   in / an   — 当前 treesitter 节点
--   iN / aN   — 上一次选择的 treesitter 节点
--   iu / au   — 连续非空白行 (类似 paragraph)
--   ie / ae   — 整个缓冲区
--
-- 常用操作示例：
--   cia   — 修改一个函数参数 (change inner argument)
--   daa   — 删除一个函数参数 (delete around argument)
--   yin   — 复制当前 treesitter 节点
--   cin   — 修改当前 treesitter 节点内容
--   va)   — 选中圆括号内内容
--   di"   — 删除双引号内内容
--
-- 自定义文本对象（在配置中通过 custom_textobjects 添加）:
--   require('mini.ai').setup({
--     custom_textobjects = {
--       -- Lua pattern 示例: 匹配 Markdown 标题
--       h = { '^#+%s+.*$', '^$' },
--     },
--   })
--
return {
  -- mini.ai 文本对象（用于对齐等操作）
  -- {
  -- "nvim-mini/mini.ai",
  -- version = false,
  -- event = "VeryLazy",
  -- config 可选，也可用 require('mini.ai').setup() 在别处配置
  -- },
  -- mini.icons 图标支持
  {
    "nvim-mini/mini.icons",
    event = "VeryLazy",
  },
}
