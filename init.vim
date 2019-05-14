function! PackInit() abort
    packadd minpac
    call minpac#init()
    call minpac#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
    call minpac#add('deoplete-plugins/deoplete-go', {'do': 'make'})
    call minpac#add('SirVer/ultisnips')
    call minpac#add('honza/vim-snippets')
    call minpac#add('Shougo/neco-vim')
    call minpac#add('Shougo/neco-syntax')
    call minpac#add('Shougo/echodoc.vim')

    call minpac#add('mattn/emmet-vim')
    call minpac#add('autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'sh install.sh',
                \})

    call minpac#add('cinuor/vim-header')
    call minpac#add('jiangmiao/auto-pairs')
    call minpac#add('vim-airline/vim-airline')
    call minpac#add('vim-airline/vim-airline-themes')
    call minpac#add('Yggdroot/indentLine')
    call minpac#add('scrooloose/nerdcommenter')
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('jistr/vim-nerdtree-tabs')
    call minpac#add('Xuyuanp/nerdtree-git-plugin')

    call minpac#add('junegunn/vim-easy-align')
    call minpac#add('iamcco/mathjax-support-for-mkdp')
    call minpac#add('iamcco/markdown-preview.vim')
    call minpac#add('junegunn/fzf')
    call minpac#add('sebdah/vim-delve')
    call minpac#add('heavenshell/vim-pydocstring')
    call minpac#add('mg979/vim-visual-multi')

    call minpac#add('junegunn/seoul256.vim')
    call minpac#add('nightsense/cosmic_latte')
    call minpac#add('machakann/vim-highlightedyank')
    call minpac#add('ntpeters/vim-better-whitespace')
endfunction

command! PackUpdate call PackInit() | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus call PackInit() | call minpac#status()

" neovim {

    " autocmd! BufWritePost $MYVIMRC source %

    set termguicolors
    set t_Co=256
    set nocompatible

    syntax enable
    set magic
    filetype on
    filetype indent on
    filetype plugin on

    set foldenable
    set foldmethod=syntax
    set foldcolumn=0
    setlocal foldlevel=1
    set foldlevelstart=99

    set autowrite
    set autochdir
    set nobackup
    set noswapfile
    set nowritebackup
    set colorcolumn=80
    set nocursorline
    set encoding=utf-8
    set fileencodings=utf-8,gbk,gb18030,gk2312,chinese,latin-1
    set hidden
    set history=1000
    set linespace=0
    set scrolljump=5
    set scrolloff=3
    set autoindent
    set smartindent
    set completeopt+=preview
    set completeopt+=menuone
    set completeopt+=longest
    set completeopt+=noinsert
    set completeopt+=noselect
    set shortmess+=c
    set previewheight=5
    set noshowmode
    set cmdheight=2
    set noruler
    set noshowcmd
    set clipboard=unnamed,unnamedplus
    set mouse=a
    set mousehide
    set signcolumn=yes

    set hlsearch
    set ignorecase
    set incsearch
    set smartcase
    set showmatch

    set expandtab
    set shiftwidth=4
    set softtabstop=4
    set tabstop=4
    set smarttab

    set wrap
    set wrapmargin=2
    set linebreak
    set breakindent
    set noshiftround
    set number
    set relativenumber
    set laststatus=2
    " set spell spelllang=en_us
    set autoread

    " Highlight end of line whitespace.
    highlight WhitespaceEOL ctermbg=red guibg=red
    match WhitespaceEOL /\s\+$/

    set clipboard=unnamed,unnamedplus
    let mapleader = "\<SPACE>"
    let maplocalleader = ","


    if strftime('%H') >= 7 && strftime('%H') < 16
      colorscheme cosmic_latte
      set background=light
    else
      colorscheme monokai-soda
      set background=dark
    endif


    " nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
    if has('unix')
        let g:python3_host_prog='/usr/bin/python3'
    else
        let g:python3_host_prog='/usr/local/bin/python3'
    endif

    " hi Pmenu ctermfg=black ctermbg=gray  guibg=#444444
    " hi PmenuSel ctermfg=7 ctermbg=4 guibg=#555555 guifg=#ffffff
" }

" deoplete {
    let g:deoplete#enable_at_startup = 1
    function SetLSPShortcuts()
      nnoremap <leader>gd :call LanguageClient#textDocument_definition()<CR>
      nnoremap <leader>gr :call LanguageClient#textDocument_rename()<CR>
      nnoremap <leader>gf :call LanguageClient#textDocument_formatting()<CR>
      nnoremap <leader>gt :call LanguageClient#textDocument_typeDefinition()<CR>
      nnoremap <leader>gx :call LanguageClient#textDocument_references()<CR>
      nnoremap <leader>ga :call LanguageClient_workspace_applyEdit()<CR>
      nnoremap <leader>gc :call LanguageClient#textDocument_completion()<CR>
      nnoremap <leader>gh :call LanguageClient#textDocument_hover()<CR>
      nnoremap <leader>gs :call LanguageClient_textDocument_documentSymbol()<CR>
      nnoremap <leader>gm :call LanguageClient_contextMenu()<CR>
    endfunction()

    augroup LSP
      autocmd!
      autocmd FileType cpp,c,python,go call SetLSPShortcuts()
    augroup END

    let g:deoplete#sources#go#gocode_binary = "$GOPATH/bin/gocode"

" }


" LanguageClient-neovim {

    " Required for operations modifying multiple buffers like rename.
    set hidden

    let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls'],
        \ 'go': ['gopls'],
        \ 'c': ['ccls'],
        \ 'cpp': ['ccls'],
        \ 'objc': ['ccls'],
        \ }

    nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    " Or map each action separately
    nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" }

" echodoc {
    set noshowmode
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'
" }

" vim-airline {
    let g:airline_powerline_fonts = 1
    let g:airline_left_sep        = '>'
    let g:airline_right_sep       = '<'
    if strftime('%H') >= 7 && strftime('%H') < 16
        let g:airline_theme           = 'cosmic_latte_light'
    else
        let g:airline_theme           = 'cosmic_latte_dark'
    endif
" }

" nerdcommenter {
    let g:NERDSpaceDelims = 1
" }

" vim-header {
    let g:header_auto_add_header = 0
    let g:header_field_timestamp_format = '%Y-%m-%d'
    let g:header_field_author = 'Yue Peng'
    let g:header_field_author_email = 'yuepaang@gmail.com'
    map <F7> :AddHeader<CR>
" }


" NerdTree {
        " nnoremap <silent> <F2> :NERDTree<CR>
        " autocmd vimenter * NERDTree
        let g:NERDTreeDirArrowExpandable = '▸'
        let g:NERDTreeDirArrowCollapsible = '▾'
        map <leader>n :NERDTreeToggle<CR>

        autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
        let NERDTreeMinimalUI = 1
        let NERDTreeShowHidden = 1

        " let g:nerdtree_tabs_open_on_console_startup = 1
        let g:nerdtree_tabs_focus_on_files = 1

        let g:NERDTreeIndicatorMapCustom = {
          \ "Modified"  : "✹",
          \ "Staged"    : "✚",
          \ "Untracked" : "✭",
          \ "Renamed"   : "➜",
          \ "Unmerged"  : "═",
          \ "Deleted"   : "✖",
          \ "Dirty"     : "✗",
          \ "Clean"     : "✔︎",
          \ 'Ignored'   : '☒',
          \ "Unknown"   : "?"
          \ }

" }


" align {
        xmap ga <Plug>(EasyAlign)
        nmap ga <Plug>(EasyAlign)
" }

" windows {
        map <C-j> <C-w>j
        map <C-k> <C-w>k
        map <C-l> <C-w>l
        map <C-h> <C-w>h
" }

" markdown {
        nmap <silent> <F5> <Plug>MarkdownPreview
        imap <silent> <F5> <Plug>MarkdownPreview
        nmap <silent> <F6> <Plug>StopMarkdownPreview
        imap <silent> <F6> <Plug>StopMarkdownPreview
" }

" pydocstring {
        nmap <silent> <leader>pd <Plug>(pydocstring)
" }

" 打开文件自动定位到最后编辑的位置
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

" VM
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
let g:VM_maps["Select l"]           = '<S-Right>'       " start selecting left
let g:VM_maps["Select h"]           = '<S-Left>'        " start selecting right


let g:VM_clear_buffer_hl = 0

fun! VM_Start()
  HighlightedyankOff
endfun

fun! VM_Exit()
  HighlightedyankOn
endfun

" indentLine
let g:indentLine_setColors = 0


function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;()]*')
  let s:uri = shellescape(s:uri, 1)
  echom s:uri
  if s:uri != ""
    silent exec "!open '".s:uri."'"
    :redraw!
  else
    echo "No URI found in line."
  endif
endfunction

nnoremap <leader>ou :call HandleURL()<CR>¬

