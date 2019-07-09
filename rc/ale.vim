" ale {
    "  yapf python
    let g:ale_fixers = {
        \   '*': ['remove_trailing_lines', 'trim_whitespace'],
        \   'python': ['autopep8'],
        \   'javascript': ['eslint', 'prettier'],
        \   'typescript': ['tslint', 'prettier'],
        \   'css': ['prettier'],
        \   'c': ['clang-format'],
        \   'cpp': ['clang-format'],
        \   'rust': ['rustfmt'],
        \   'json': ['fixjson'],
        \}
    " Set this variable to 1 to fix files when you save them.
    let g:ale_fix_on_save = 1

    let g:ale_linters = {
        \       'c': ['cppcheck', 'flawfinder'],
        \       'cpp': ['cppcheck', 'flawfinder'],
        \       'css': ['stylelint'],
        \       'html': ['tidy'],
        \       'json': [],
        \       'markdown': ['languagetool'],
        \       'python': ['flake8', 'mypy', 'pydocstyle', 'pylint'],
        \       'rust': ['cargo'],
        \       'sh': ['shellcheck'],
        \       'text': ['languagetool'],
        \       'vim': ['vint'],
        \       'go': ['gopls'],
        \}

    "查看上一个错误
    nnoremap <silent> [a :ALEPrevious<CR>
    "查看下一个错误
    nnoremap <silent> ]a :ALENext<CR>
    "自定义error和warning图标
    " let g:ale_sign_error="\uf05e"
    " let g:ale_sign_warning="\uf071"
    let g:ale_sign_error = '😡'
    let g:ale_sign_warning = '😃'
    let g:ale_sign_column_always=1

    "显示Linter名称,出错或警告等相关信息
    let g:ale_echo_msg_error_str = 'E'
    let g:ale_echo_msg_warning_str = 'W'
    let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
    " 光标移动到错误的地方时立即显示错误
    let g:ale_echo_delay = 0

    autocmd ColorScheme * highlight ALEErrorSign ctermfg=red ctermbg=18
    highlight ALEErrorSign ctermbg=NONE ctermfg=red
    highlight ALEWarningSign ctermbg=NONE ctermfg=yellow
" }
