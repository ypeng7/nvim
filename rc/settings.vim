" Use <Leader> in global plugin.
let g:mapleader = "\<Space>"
" Use <LocalLeader> in filetype plugin.
let g:maplocalleader = ','

set nobackup
set cursorcolumn
set encoding=utf8
set fillchars=vert:│

" Uses tpope's vim-sensible defaults
set hidden
set notimeout
set noswapfile
set nowritebackup
set nowrap
set nofoldenable
set lazyredraw
set number
set expandtab
set ignorecase
set smartcase
set noshowmode
set modeline
set nospell


set nobackup
set cursorcolumn
set pyx=3

let g:indent_guides_auto_colors = 0
" Set split separator to Unicode box drawing character
set encoding=utf8
set fillchars=vert:│

" Uses tpope's vim-sensible defaults
set hidden
set notimeout
set noswapfile
set nowritebackup
set nowrap
set nofoldenable
set lazyredraw
set number
set expandtab
set ignorecase
set smartcase
set noshowmode
set modeline
set nospell

" Enable popup transparency (neovim >= 0.4)
set pumblend=22
set wildoptions=pum

" Make it obvious where 80 characters is
set textwidth=120
set colorcolumn=+1
let &colorcolumn = '80,' . join(range(120, 999), ',')

set ttyfast
set ttimeout
set backspace=indent,eol,start
set matchpairs+=<:>

set encoding=utf-8
set mouse=a
set mousehide

set number
set relativenumber
set colorcolumn=79
set laststatus=2

set hidden
set history=1000
set nocursorline

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set autoindent
set smartindent
set wrapscan
set shiftround

set autowrite
set nobackup
set noswapfile
set nowritebackup
" set signcolumn=yes
set signcolumn=no

set hlsearch
set incsearch
set ignorecase
set infercase
set smartcase

set shortmess=aFc
set completefunc=emoji#complete
set completeopt=noinsert,noselect,menuone

filetype plugin indent on     " required!

"Better display for messages
set cmdheight=2
set noshowmode
set noruler
set noshowcmd

set splitbelow
set splitright

set wildmenu
set wildmode=longest:full,full

set clipboard+=unnamedplus
set updatetime=300

set whichwrap+=h,l,<,>,[,],b,s,~
if exists('+breakindent')
    let &showbreak = '↳ '
    set breakindent
    set wrap
else
    set nowrap
endif

" Switching Buffers
noremap <leader>[ :bp<return>
noremap <leader>] :bn<return>

" Themes
" Enable 256 color terminal
set t_Co=256
" Enable true color
if has('termguicolors')
	set termguicolors
endif

" Switch
" colorscheme cosmic_latte
colorscheme seoul256
" let g:gruvbox_italic = 1
if strftime('%H') >= 7 && strftime('%H') < 10
  set background=light
else
  set background=dark
endif


highlight WhitespaceEOL ctermbg=red guibg=red
match WhitespaceEOL /\s\+$/

hi Whitespace ctermfg=96 guifg=#725972 guibg=NONE ctermbg=NONE

hi NeomakeVirtualtextError ctermfg=124 guifg=#af0000 guibg=NONE ctermbg=NONE

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif
for f in split(glob('~/.config/nvim/rc/ftplugin/*.vim'), '\n')
    exe 'source' f
endfor

" windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

imap <C-j>     <Plug>(neosnippet_expand_or_jump)
smap <C-j>     <Plug>(neosnippet_expand_or_jump)
xmap <C-j>     <Plug>(neosnippet_expand_target)

if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

let g:neosnippet#snippets_directory = expand('~/.config/nvim/plugged/vim-snippets/snippets')

" Clear current-search highlighting by hitting <CR> in normal mode.
nnoremap <silent> <CR> :nohlsearch<CR><CR>
