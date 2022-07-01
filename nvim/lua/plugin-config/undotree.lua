-- https://github.com/mbbill/undotree
-- /home/oq/.local/share/nvim/site/pack/packer/start/undotree/autoload/autoload 修改快捷键

vim.cmd([[
if has("persistent_undo")
    " 在 config.lua 中定义好了 undotree_dir 全局变量
    let target_path = expand(undotree_dir)

    if !isdirectory(target_path)
        call mkdir(target_path, "p", 0700)
    endif

    let &undodir = target_path
    set undofile

    if !exists('g:undotree_DiffpanelHeight')
        let g:undotree_DiffpanelHeight = 20
    endif

    if !exists('g:undotree_WindowLayout')
        let g:undotree_WindowLayout = 2
    endif

    if !exists('g:undotree_SetFocusWhenToggle')
        let g:undotree_SetFocusWhenToggle = 1
    endif

    if !exists('g:undotree_RelativeTimestamp')
      let g:undotree_RelativeTimestamp = 0
    endif
]])
