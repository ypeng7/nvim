let $NVIM_COC_LOG_LEVEL = 'debug'
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
Plug 'scrooloose/nerdcommenter'
Plug 'cinuor/vim-header'

" Using a non-master branch
" Language pack：一个包含了很多语言配置的包，有种 one thing to rule them all 的意思
Plug 'sheerun/vim-polyglot'
" Markdown 实时预览插件，很好用
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'neoclide/coc-neco'

Plug 'sebdah/vim-delve'

" Git operators：tpope 的经典插件，不解释
Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 成对符号编辑：好多编辑器也支持了这个特性，因为太好用
Plug 'tpope/vim-surround'
" 自动闭合括号，这个必须有
Plug 'jiangmiao/auto-pairs'
" 对齐：总是能治愈我的强迫症
Plug 'junegunn/vim-easy-align'
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-commentary'
Plug 'morhetz/gruvbox'
" Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
Plug 'w0rp/ale'
" Initialize plugin system
call plug#end()

" Snippets
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" use <tab> for trigger completion and navigate to next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use <Tab> and <S-Tab> for navigate completion list:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <cr> to confirm complete
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" To make <cr> select the first completion item and confirm completion when no item have selected:

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
" Close preview window when completion is done.

autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif

let g:coc_global_extensions = ['coc-snippets', 'coc-json']

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gn <Plug>(coc-rename)


let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

autocmd CursorHold * silent call CocActionAsync('highlight')

" g:coc_global_extensions = ['coc-json', 'coc-python', 'coc-highlight', 'coc-word', 'coc-dictionary', 'coc-snippets', 'coc-yank']
" ------------------- Self Configuration -----------------------
" Use <Leader> in global plugin.
let g:mapleader = "\<Space>"
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = ','

let $CONFIG = expand('~/.config')

set tabstop=4
set nobackup
set noswapfile
set signcolumn=yes
set softtabstop=4
set expandtab
set shiftwidth=4
set smarttab

set hlsearch
set incsearch
set ignorecase
set infercase
set smartcase

set shortmess=aFc
set completefunc=emoji#complete
set completeopt =longest,menu
set completeopt-=preview
filetype plugin indent on     " required!


" Switching Buffers
noremap <leader>[ :bp<return>
noremap <leader>] :bn<return>


autocmd FileType json syntax match Comment +\/\/.\+$+

" NerdTree
let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'
map <leader>f :NERDTreeToggle<CR>

" Themes
" Enable 256 color terminal
set t_Co=256
" Enable true color
if has('termguicolors')
	set termguicolors
endif

set background=dark
colorscheme gruvbox

highlight link CocErrorSign GruvboxRed
highlight Normal guibg=NONE ctermbg=None
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE
hi NeomakeVirtualtextError ctermfg=124 guifg=#af0000 guibg=NONE ctermbg=NONE

"only for PaperColor and gruvbox Colorscheme if use another colorscheme you should comment this
hi EndOfBuffer ctermfg=234 ctermbg=NONE guifg=#1c1c1c guibg=NONE guisp=NONE cterm=NONE gui=NONE

"for go
au BufNewFile,BufRead *.go set filetype=go  noexpandtab tabstop=4 shiftwidth=4
au BufNewFile,BufRead *.tmpl set filetype=html

"for python
au BufRead,BufNewFile *.py set shiftwidth=4 tabstop=4 softtabstop=4 expandtab smarttab autoindent

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
for f in split(glob('~/.config/nvim/rc/ftplugin/*.vim'), '\n')
    exe 'source' f
endfor


let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'python': ['autopep8'],
\}

let g:ale_linters = {
              \ 'python': ['/usr/local/bin/flake8', ],
              \ 'sh': ['language_server'],
              \}
let g:ale_enabled = 1
let g:ale_sign_error = '✖︎'
highlight ALEErrorSign guifg=red ctermfg=red
let g:ale_sign_warning = '✔︎'
highlight ALEWarningSign guifg=grey ctermfg=grey
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:move_key_modifier = 'N'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 1
let g:ale_lint_on_save = 1

" nerdcommenter {
    let g:NERDSpaceDelims = 1
    " }

" vim-header {
let g:header_auto_add_header = 0
let g:header_field_timestamp_format = '%Y-%m-%d'
let g:header_field_author = 'Yue Peng'
let g:header_field_author_email = 'yuepaang@gmail.com'
"map <F7> :AddHeader<CR>
map <leader>ah :AddHeader<CR>
" }
