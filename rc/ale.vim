let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'json': ['prettier'],
\   'python': ['autopep8'],
\}


let g:ale_linters = {
              \ 'python': ['flake8', 'pydocstyle', 'mypy', 'autopep8'],
              \ 'sh': ['language_server'],
              \ 'go': ['gopls'],
              \ 'zsh': ['shell'],
              \ 'vim': ['vint'],
              \}

let g:ale_enabled = 1
let g:ale_sign_column_always = 1
let g:ale_set_highlights = 0
"自定义error和warning图标
let g:ale_sign_error = '😡'
let g:ale_sign_warning = '😃'
highlight ALEErrorSign guifg=red ctermfg=red
highlight ALEWarningSign guifg=grey ctermfg=grey
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:move_key_modifier = 'N'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
"打开文件时不进行检查
let g:ale_lint_on_enter = 0
