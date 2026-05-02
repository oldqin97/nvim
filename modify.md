# Neovim 配置优化记录

| 文件                                         | 优化项                                                                                   | 类型     |
| -------------------------------------------- | ---------------------------------------------------------------------------------------- | -------- |
| `lua/plugins/utils/treesitter_languages.lua` | 移除重复的 `"dart"` 和 `"toml"` 条目                                                     | Bug 修复 |
| `lua/plugins/ui/autolinenumber.lua`          | 修复双重嵌套 `require("relative-toggle").setup()` 调用                                   | Bug 修复 |
| `lua/plugins/tools/trouble.lua`              | 修复拼写错误 `"TroubleTogge"` → `"TroubleToggle"`                                        | Bug 修复 |
| `lua/plugins/tools/outline.lua`              | 修复 `Event` → `event`（属性名大小写）                                                   | Bug 修复 |
| `lua/plugins/tools/mark.lua`                 | 修复注释中 `"ture"` → `"true"`                                                           | Bug 修复 |
| `lua/plugins/git/git.lua`                    | 修复 Gitsigns 按键描述（"git graph" → "Preview Hunk"/"Reset Hunk"）                      | Bug 修复 |
| `lua/plugins/git/git.lua`                    | `lazy = false` → `event = { "BufReadPre", "BufNewFile" }` 正确延迟加载                   | 性能     |
| `lua/plugins/git/git-conflict.lua`           | 修复错误描述（"apply themes"/"apply ours" → "Conflict Ourselves"/"Conflict Themselves"） | Bug 修复 |
| `lua/plugins/git/diffview.lua`               | 重写切换逻辑，使用窗口检测代替不可靠的模块级布尔值                                       | Bug 修复 |
| `lua/config/options.lua`                     | `vim.cmd([[ let g:loaded_perl_provider...]])` → `vim.g.loaded_perl_provider = 0`         | 代码质量 |
| `lua/config/options.lua`                     | `vim.o.cursorline` → `vim.opt.cursorline` 保持一致性                                     | 代码质量 |
| `lua/config/autocmds.lua`                    | 遗留 `vim.cmd("autocmd...")` → `vim.api.nvim_create_autocmd`                             | 代码质量 |
| `lua/config/keymaps.lua`                     | 将 4 次重复的 `require("smart-splits")` 提升为文件级局部变量                             | 性能     |
| `lua/plugins/utils/log.lua`                  | 合并重复的 `javascript`/`typescript` 和 `jsx`/`tsx`/`vue` 格式化函数                     | 代码质量 |
| `lua/plugins/utils/utils.lua`                | 删除空文件                                                                               | 清理     |
| `lua/plugins/editor/auto-pairs.lua`          | 删除 12 行错误堆栈注释块                                                                 | 清理     |
| `lua/plugins/editor/betterEscape.lua`        | 删除已注释的旧配置块                                                                     | 清理     |
| `lua/plugins/editor/hex.lua`                 | 修复插件配置顺序（`cmd` 原来在仓库名之前）                                               | 代码质量 |
| `lua/plugins/editor/formatters.lua`          | 5 次 `table.insert` → 单次 `vim.list_extend`                                             | 代码质量 |
| `lua/plugins/editor/formatters.lua`          | 删除重复的已注释 `extra_args` 块                                                         | 清理     |
| `lua/plugins/editor/surround.lua`            | `event = "InsertEnter"` → `event = "VeryLazy"`                                           | 性能     |
| `lua/plugins/editor/stay-in-place.lua`       | `config = true` → `opts = {}`（无需 setup）                                              | 代码质量 |
| `lua/plugins/lsp/generatorDoc.lua`           | `vim.cmd([[ let g:...]])` → `vim.g.*`                                                    | 代码质量 |
| `lua/plugins/lsp/treesitter.lua`             | `ignore_install = { "" }` → `ignore_install = {}`（空字符串无意义）                      | Bug 修复 |
| `lua/plugins/tools/auto-save.lua`            | 简化 `config = function() require("auto-save").setup() end` → `opts = {}`                | 代码质量 |
