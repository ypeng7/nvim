" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-master branch
" Language pack：一个包含了很多语言配置的包，有种 one thing to rule them all 的意思
Plug 'sheerun/vim-polyglot'
" Markdown 实时预览插件，很好用
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }}
Plug 'honza/vim-snippets'
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
Plug 'Shougo/echodoc.vim'
Plug 'Shougo/neco-vim'
Plug 'neoclide/coc-neco'

" Git operators：tpope 的经典插件，不解释
Plug 'tpope/vim-fugitive'
" GitHub(fugitive :Gbrose support)
Plug 'tpope/vim-rhubarb'
" Git commit browser：实时预览 git commit修改
Plug 'cohama/agit.vim'
" Git diff：diff文本 超级方便方便了
Plug 'mhinz/vim-signify'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
" 成对符号编辑：好多编辑器也支持了这个特性，因为太好用
Plug 'tpope/vim-surround'
" 自动闭合括号，这个必须有
Plug 'jiangmiao/auto-pairs'
" 对齐：总是能治愈我的强迫症
Plug 'junegunn/vim-easy-align'

Plug 'morhetz/gruvbox'
Plug 'machakann/vim-highlightedyank'
Plug 'itchyny/lightline.vim'
" Initialize plugin system
call plug#end()

" Snippets
inoremap <expr> <TAB> pumvisible() ? "\<C-y>" : "\<TAB>"
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

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

" Themes
" Enable 256 color terminal
set t_Co=256
" Enable true color
if has('termguicolors')
	set termguicolors
endif

set background=dark
colorscheme gruvbox

highlight Normal guibg=NONE ctermbg=None
highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE
hi NeomakeVirtualtextError ctermfg=124 guifg=#af0000 guibg=NONE ctermbg=NONE

"only for PaperColor and gruvbox Colorscheme if use another colorscheme you should comment this
hi EndOfBuffer ctermfg=234 ctermbg=NONE guifg=#1c1c1c guibg=NONE guisp=NONE cterm=NONE gui=NONE
