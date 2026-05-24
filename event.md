# Neovim 内置事件 (Autocommand Events)

## 启动/初始化 (Startup / Init)

| 事件             | 触发时机                            |
| ---------------- | ----------------------------------- |
| `BufWinEnter`    | buffer 显示在窗口中                 |
| `BufRead`        | 读取文件到 buffer                   |
| `BufReadPre`     | 读取文件之前                        |
| `BufReadPost`    | 读取文件之后                        |
| `BufNewFile`     | 创建新文件                          |
| `BufReadCmd`     | 用自定义命令读取文件前              |
| `FileReadPre`    | `:read` 命令读取文件之前            |
| `FileReadPost`   | `:read` 命令读取文件之后            |
| `FileReadCmd`    | 用自定义命令读取文件前（`:read`）   |
| `FilterReadPre`  | filter 命令读取文件之前             |
| `FilterReadPost` | filter 命令读取文件之后             |
| `StdinReadPre`   | 从 stdin 读取之前                   |
| `StdinReadPost`  | 从 stdin 读取之后                   |
| `SwapExists`     | 检测到 swap 文件存在时              |
| `SourcePre`      | `:source` 命令执行前                |
| `SourcePost`     | `:source` 命令执行后                |
| `SourceCmd`      | 用自定义命令执行 `:source` 前       |
| `VimEnter`       | Neovim 启动完成                     |
| `UIEnter`        | UI 已连接并初始化                   |
| `UILeave`        | UI 断开连接                         |
| `VimLeave`       | 退出 Neovim 前（写入 viminfo 之前） |
| `VimLeavePre`    | 退出 Neovim 前（写入 viminfo 之后） |
| `VimSuspend`     | Neovim 挂起时                       |
| `VimResume`      | Neovim 从挂起恢复时                 |
| `FocusGained`    | Neovim 获得焦点                     |
| `FocusLost`      | Neovim 失去焦点                     |
| `TerminalOpen`   | 打开终端 buffer                     |
| `TerminalClose`  | 关闭终端 buffer                     |
| `RecordingEnter` | 开始录制宏                          |
| `RecordingLeave` | 停止录制宏                          |
| `SearchWrapped`  | 搜索到达底部/顶部回绕时             |

## Buffer 操作

| 事件                   | 触发时机                     |
| ---------------------- | ---------------------------- |
| `BufAdd`               | buffer 被添加到列表          |
| `BufDelete`            | buffer 被删除前              |
| `BufWipeout`           | buffer 被完全删除前          |
| `BufUnload`            | buffer 被卸载                |
| `BufEnter`             | 切换到某个 buffer            |
| `BufLeave`             | 离开某个 buffer              |
| `BufNew`               | 创建新 buffer                |
| `BufModifiedSet`       | buffer 的 modified 状态改变  |
| `BufWritePre`          | 写入 buffer 到文件之前       |
| `BufWritePost`         | 写入 buffer 到文件之后       |
| `BufWriteCmd`          | 用自定义命令写入 buffer 前   |
| `BufFilePre`           | buffer 文件名改变之前        |
| `BufFilePost`          | buffer 文件名改变之后        |
| `FileAppendPre`        | `:w >>` 追加写入之前         |
| `FileAppendPost`       | `:w >>` 追加写入之后         |
| `FileAppendCmd`        | 用自定义命令追加写入前       |
| `FileWritePre`         | `:w file` 写入文件之前       |
| `FileWritePost`        | `:w file` 写入文件之后       |
| `FileWriteCmd`         | 用自定义命令写入文件前       |
| `FileChangedRO`        | 文件从只读变为可写时         |
| `FileChangedShell`     | 文件在外部被修改时           |
| `FileChangedShellPost` | 处理完 `FileChangedShell` 后 |

## 窗口 (Window)

| 事件             | 触发时机                         |
| ---------------- | -------------------------------- |
| `WinNew`         | 创建新窗口                       |
| `WinClosed`      | 窗口关闭后                       |
| `WinEnter`       | 进入某个窗口                     |
| `WinLeave`       | 离开某个窗口                     |
| `WinScrolled`    | 窗口滚动                         |
| `WinResized`     | 窗口大小改变                     |
| `TabNew`         | 创建新 tab 页                    |
| `TabNewEntered`  | 进入新创建的 tab 页              |
| `TabClosed`      | tab 页关闭后                     |
| `TabEnter`       | 进入某个 tab 页                  |
| `TabLeave`       | 离开某个 tab 页                  |
| `CmdwinEnter`    | 进入命令行窗口                   |
| `CmdwinLeave`    | 离开命令行窗口                   |
| `CmdlineEnter`   | 进入命令行模式（光标移到命令行） |
| `CmdlineLeave`   | 离开命令行模式                   |
| `CmdlineChanged` | 命令行内容改变                   |
| `ModeChanged`    | 模式改变（N:12）                 |

## 文本/编辑 (Text/Edit)

| 事件             | 触发时机                                   |
| ---------------- | ------------------------------------------ |
| `TextChanged`    | 普通模式下文本改变                         |
| `TextChangedI`   | 插入模式下文本改变                         |
| `TextChangedP`   | 插入模式弹出菜单可见时文本改变             |
| `TextChangedT`   | 终端模式下文本改变                         |
| `TextYankPost`   | yank/delete/change 文本后                  |
| `InsertEnter`    | 进入插入模式                               |
| `InsertLeave`    | 离开插入模式                               |
| `InsertChange`   | 插入模式下文本改变（与 TextChangedI 不同） |
| `InsertCharPre`  | 插入模式下输入字符之前                     |
| `InsertLeavePre` | 即将离开插入模式时（可取消）               |
| `TextChangedN`   | 普通模式下文本改变                         |
| `SafeState`      | 等待用户输入时（无待处理事件）             |
| `SafeStateAgain` | 再次进入 SafeState 时                      |

## 语法/高亮/诊断 (Syntax/Highlight/Diagnostics)

| 事件                | 触发时机                 |
| ------------------- | ------------------------ |
| `Syntax`            | 设置语法高亮时           |
| `ColorScheme`       | colorscheme 改变时       |
| `ColorSchemePre`    | colorscheme 改变前       |
| `OptionSet`         | 选项被设置时             |
| `LspAttach`         | LSP 客户端绑定到 buffer  |
| `LspDetach`         | LSP 客户端与 buffer 解绑 |
| `LspTokenUpdate`    | LSP 语义 token 更新      |
| `DiagnosticChanged` | 诊断信息改变             |

## 补全 (Completion)

| 事件              | 触发时机           |
| ----------------- | ------------------ |
| `MenuPopup`       | 弹出菜单显示       |
| `CompleteChanged` | 补全菜单选中项改变 |
| `CompleteDonePre` | 补全完成之前       |
| `CompleteDone`    | 补全完成之后       |

## QuickFix / Location List

| 事件              | 触发时机            |
| ----------------- | ------------------- |
| `QuickFixCmdPre`  | quickfix 命令执行前 |
| `QuickFixCmdPost` | quickfix 命令执行后 |

## 会话/历史 (Session/History)

| 事件              | 触发时机        |
| ----------------- | --------------- |
| `SessionLoadPost` | 加载 session 后 |
| `SessionWritePre` | 写入 session 前 |

## 目录/环境 (Dir/Environment)

| 事件              | 触发时机                         |
| ----------------- | -------------------------------- |
| `DirChangedPre`   | 工作目录改变前                   |
| `DirChanged`      | 工作目录改变后                   |
| `ShellCmdPost`    | `:!cmd` shell 命令完成后         |
| `ShellFilterPost` | `:{range}!cmd` filter 命令完成后 |

## 远程/信号 (Remote/Signal)

| 事件          | 触发时机                  |
| ------------- | ------------------------- |
| `RemoteReply` | 收到远程回复时            |
| `SigUSR1`     | 收到 SIGUSR1 信号         |
| `Signal`      | 收到信号时（SIGWINCH 等） |

## GUI / UI (Neovim UI)

| 事件      | 触发时机        |
| --------- | --------------- |
| `UIEnter` | UI 连接并初始化 |
| `UILeave` | UI 断开连接     |

## 杂项 (Misc)

| 事件              | 触发时机                                      |
| ----------------- | --------------------------------------------- |
| `User`            | 自定义事件（通过 `:doautocmd User XXX` 触发） |
| `EncodingChanged` | 编码改变                                      |
| `TermChanged`     | 终端类型改变                                  |
| `TermRequest`     | 终端响应请求                                  |
| `TermResponse`    | 收到终端响应                                  |

---

## 常用事件组合速查

```lua
-- 文件打开时执行
{ "BufReadPost", "BufNewFile" }

-- 保存后执行
{ "BufWritePost" }

-- 进入 buffer 时执行
{ "BufEnter" }

-- 模式切换时执行
{ "ModeChanged" }

-- LSP 绑定后执行
{ "LspAttach" }

-- 文本改变后执行
{ "TextChanged", "TextChangedI" }

-- yank/d 之后执行
{ "TextYankPost" }

-- 插入模式进入/离开
{ "InsertEnter", "InsertLeave" }

-- 窗口滚动时
{ "WinScrolled" }
```
