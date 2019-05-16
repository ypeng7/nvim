" MinPac Plugin Manager

function! PackInit() abort
    packadd minpac
    call minpac#init()
    call minpac#add('Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'})
    call minpac#add('deoplete-plugins/deoplete-go', {'do': 'make'})
    call minpac#add('deoplete-plugins/deoplete-jedi')

    call minpac#add('davidhalter/jedi-vim')
    call minpac#add('hynek/vim-python-pep8-indent')

    call minpac#add('ekalinin/Dockerfile.vim')
    call minpac#add('uarun/vim-protobuf')

    call minpac#add('SirVer/ultisnips')
    call minpac#add('honza/vim-snippets')
    call minpac#add('Shougo/neosnippet-snippets')
    call minpac#add('Shougo/neosnippet.vim', {'depends': ['neosnippet-snippets']})
    call minpac#add('Shougo/neco-vim')
    call minpac#add('Shougo/neco-syntax')
    call minpac#add('Shougo/neopairs.vim')
    call minpac#add('Shougo/echodoc.vim')

    call minpac#add('mattn/emmet-vim')
    call minpac#add('autozimu/LanguageClient-neovim', {
                \ 'branch': 'next',
                \ 'do': 'sh install.sh',
                \})

    call minpac#add('sheerun/vim-polyglot')
    call minpac#add('cinuor/vim-header')
    call minpac#add('jiangmiao/auto-pairs')
    " call minpac#add('vim-airline/vim-airline')
    " call minpac#add('vim-airline/vim-airline-themes')
    call minpac#add('itchyny/lightline.vim')
    call minpac#add('itchyny/lightline-powerful')
    call minpac#add('maximbaz/lightline-ale')
    call minpac#add('mgee/lightline-bufferline')
    call minpac#add('ryanoasis/vim-devicons')

    call minpac#add('Yggdroot/indentLine')
    call minpac#add('scrooloose/nerdcommenter')
    call minpac#add('scrooloose/nerdtree')
    call minpac#add('jistr/vim-nerdtree-tabs')
    call minpac#add('Xuyuanp/nerdtree-git-plugin')

    call minpac#add('airblade/vim-gitgutter')
    call minpac#add('lambdalisue/gina.vim')

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

" GlobalAutoCmd:

augroup GlobalAutoCmd
  autocmd!
augroup END
command! -nargs=* Gautocmd   autocmd GlobalAutoCmd <args>
command! -nargs=* Gautocmdft autocmd GlobalAutoCmd FileType <args>

" neovim global settings{

    " autocmd! BufWritePost $MYVIMRC source %

    set termguicolors
    set t_Co=256
    set nocompatible

    syntax enable
    filetype on
    filetype indent on
    filetype plugin on
    set magic

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

    let g:deoplete#sources#go#gocode_binary = "$GOPATH/bin/gocode"

    let g:AutoPairsMapCR=0
    let g:deoplete#auto_complete_start_length = 1
    let g:deoplete#enable_at_startup = 1
    let g:deoplete#enable_smart_case = 1
    imap <expr><TAB> pumvisible() ? "\<C-n>" : (neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>")
    imap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
    imap <expr><CR> pumvisible() ? deoplete#mappings#close_popup() : "\<CR>\<Plug>AutoPairsReturn"

" }


" LanguageClient-neovim {

    " Required for operations modifying multiple buffers like rename.
    set hidden

    function SetLSPShortcuts()
      nnoremap <leader>ld :call LanguageClient#textDocument_definition()<CR>
      nnoremap <leader>lr :call LanguageClient#textDocument_rename()<CR>
      nnoremap <leader>lf :call LanguageClient#textDocument_formatting()<CR>
      nnoremap <leader>lt :call LanguageClient#textDocument_typeDefinition()<CR>
      nnoremap <leader>lx :call LanguageClient#textDocument_references()<CR>
      nnoremap <leader>la :call LanguageClient_workspace_applyEdit()<CR>
      nnoremap <leader>lc :call LanguageClient#textDocument_completion()<CR>
      nnoremap <leader>lh :call LanguageClient#textDocument_hover()<CR>
      nnoremap <leader>ls :call LanguageClient_textDocument_documentSymbol()<CR>
      nnoremap <leader>lm :call LanguageClient_contextMenu()<CR>
    endfunction()

    augroup LSP
      autocmd!
      autocmd FileType cpp,c,python,go,objc call SetLSPShortcuts()
    augroup END

    let g:LanguageClient_serverCommands = {
        \ 'python': ['pyls'],
        \ 'go': ['gopls'],
        \ 'c': ['ccls'],
        \ 'cpp': ['ccls'],
        \ 'objc': ['ccls'],
        \ }

    nnoremap <silent> <leader>lc :call LanguageClient_contextMenu()<CR>
    " Or map each action separately
    nnoremap <silent> <leader>lh :call LanguageClient#textDocument_hover()<CR>
    nnoremap <silent> <leader>ld :call LanguageClient#textDocument_definition()<CR>
    nnoremap <silent> <leader>lr :call LanguageClient#textDocument_rename()<CR>
    autocmd BufWritePre *.go :call LanguageClient#textDocument_formatting_sync()

" }

" echodoc {
    set noshowmode
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'
" }

" lightline {
    " https://donniewest.com/a-guide-to-basic-neovim-plugins
    let g:lightline = {}
    if strftime('%H') >= 7 && strftime('%H') < 16
        let g:lightline.colorscheme = 'cosmic_latte_light'
    else
        let g:lightline.colorscheme = 'cosmic_latte_dark'
    endif


    " function! LightlineModified()
      " hi ModifiedColor ctermfg=167 guifg=#cf6a4c ctermbg=242 guibg=#666656 term=bold cterm=bold
      " return &modified ? '+' : &modifiable ? '' : '-'
    " endfunction

    " let g:lightline.component = {
          " \ 'absolutepath': '%F',
          " \ 'bufnum': '%n',
          " \ 'charvalue': '%b',
          " \ 'charvaluehex': '%B',
          " \ 'close': '%999X X ',
          " \ 'column': '%c',
          " \ 'fileencoding': '%{&fenc!=#""?&fenc:&enc}',
          " \ 'filename': '%{expand(''%:p'')}',
          " \ 'line': '%l',
          " \ 'lineinfo': '%3l%-2v',
          " \ 'mode': '%{lightline#mode()}',
          " \ 'modified': '%( %#ModifiedColor#%{LightlineModified()} %)',
          " \ 'paste': '%{&paste?"PASTE":""}',
          " \ 'percent': '%3p%%',
          " \ 'percentwin': '%P',
          " \ 'readonly': '%R',
          " \ 'relativepath': '%f',
          " \ 'spell': '%{&spell?&spelllang:""}',
          " \ 'winnr': '%{winnr()}',
          " \ }
    let g:lightline.component_expand = {
          \ 'linter_checking': 'lightline#ale#checking',
          \ 'linter_errors': 'lightline#ale#errors',
          \ 'linter_ok': 'lightline#ale#ok',
          \ 'linter_warnings': 'lightline#ale#warnings',
          \ }
    " let g:lightline.component_type = {
          " \ 'modified': 'raw',
          " \ 'linter_checking': 'left',
          " \ 'linter_errors': 'error',
          " \ 'linter_ok': 'left',
          " \ 'linter_warnings': 'warning',
          " \ }
    let g:lightline.component_function = {
          \ 'gitbranch': 'gina#component#repo#branch',
          \ }
    let g:lightline.active = {
          \ 'left': [ ['mode', 'paste'], ['filename', 'gitbranch'] ],
          \ 'right': [ [ 'lineinfo', 'percent' ], [ 'filetype', 'fileformat', 'fileencoding' ], [ 'linter_checking', 'linter_errors', 'linter_warnings', 'linter_ok' ] ]
          \ }
    " let g:lightline.inactive = {
          " \ 'left': [ [ 'filename' ] ],
          " \ 'right': [ [ 'lineinfo' ], [ 'percent' ] ]
          " \ }
    let g:lightline.tabline = {
          \ 'left': [ [ 'tabs' ] ],
          \ 'right': [ [ 'close' ] ]
          \ }
    " let g:lightline.tab = {
          " \ 'active': [ 'tabnum', 'filename', 'modified' ],
          " \ 'inactive': [ 'tabnum', 'filename', 'modified' ]
          " \ }
    let g:lightline.enable = { 'statusline': 1, 'tabline': 1 }
    let g:lightline.separator = { 'left': '', 'right': '' }
    let g:lightline.subseparator = { 'left': ' ', 'right': ' ' }
    let g:lightline#bufferline#shorten_path = 1
    let g:lightline#bufferline#enable_devicons = 1

    function! s:MaybeUpdateLightline()
      if exists('#lightline')
        call lightline#update()
      end
    endfunction
    Gautocmd User ALELint call s:MaybeUpdateLightline()
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

" VM {
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
"}

" VimAutoPep8 {
    let g:autopep8_aggressive = 2
    let g:autopep8_disable_show_diff = 1
    let g:autopep8_max_line_length = 99
"}

" indentLine {
    let g:indentLine_setColors = 0
    let g:indentLine_char = '¦'
    let g:indentLine_first_char = '┆'
    let g:indentLine_showFirstIndentLevel = 1
"}

" ALE {
    " Ale:
let g:ale_cache_executable_check_failures = 1
let g:ale_change_sign_column_color = 0
let g:ale_completion_enabled = 0
let g:ale_cursor_detail = 1
let g:ale_echo_cursor = 1
let g:ale_echo_delay = 20
let g:ale_fix_on_save = 1
let g:ale_keep_list_window_open = 0
let g:ale_lint_delay = 0
let g:ale_lint_on_enter = 0
let g:ale_lint_on_filetype_changed = 0
let g:ale_lint_on_insert_leave = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 10
let g:ale_open_list = 0
let g:ale_set_highlights = 0
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_use_global_executables = 1
let g:ale_virtualtext_cursor = 1
let g:ale_virtualtext_delay = 20
let g:ale_warn_about_trailing_blank_lines = 1
let g:ale_warn_about_trailing_whitespace = 1
"" linters
let g:ale_linters = {}
let g:ale_linters.go = []  " let g:ale_linters.go = ['gofmt', 'go vet', 'golint', 'goimports', 'golangci-lint']
let g:ale_linters.markdown = ['textlint']
let g:ale_linters.proto = ['protoc-gen-lint']  " ['prototool', 'protoc-gen-lint']
let g:ale_linters.python = ['flake8', 'mypy', 'pylint', 'pyls']
let g:ale_linters.sh = ['shellcheck', 'shfmt', 'sh-language-server', 'shell']
let g:ale_linters.yaml = ['yamllint']
let g:ale_linters.zsh = ['shell']  " ['shellcheck', 'shfmt', 'shell']
"" fixers
let g:ale_fixers = {
      \ '*': ['remove_trailing_lines', 'trim_whitespace'],
      \ 'markdown': [],
      \ }
"" Go:
let g:ale_go_gofmt_options = '-s'
let g:ale_go_govet_options = '-all'
"}
