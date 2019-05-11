function! PackInit() abort
    packadd minpac
    call minpac#init()
    call minpac#add('ncm2/ncm2')
    call minpac#add('roxma/nvim-yarp')

    call minpac#add('filipekiss/ncm2-look.vim')
    call minpac#add('ncm2/ncm2-bufword')
    call minpac#add('ncm2/ncm2-path')
    call minpac#add('ncm2/ncm2-ultisnips')
    call minpac#add('ncm2/ncm2-go')
    call minpac#add('SirVer/ultisnips')
    call minpac#add('honza/vim-snippets')
    call minpac#add('ncm2/ncm2-vim')
    call minpac#add('Shougo/neco-vim')
    call minpac#add('Shougo/neco-syntax')
    call minpac#add('ncm2/ncm2-syntax')
    call minpac#add('Shougo/echodoc.vim')
    call minpac#add('prabirshrestha/async.vim')
    call minpac#add('prabirshrestha/vim-lsp')
    call minpac#add('ncm2/ncm2-vim-lsp')
    call minpac#add('leafgarland/typescript-vim')

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
    set termguicolors
    set t_Co=256

    syntax enable
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
    set showmatch
    set autoindent
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

    set hlsearch
    set ignorecase
    set incsearch
    set smartcase
    set showmatch

    set expandtab
    set shiftwidth=0
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


" ncm2 {
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    set completeopt=noinsert,menuone,noselect
    set shortmess+=c
    " Ctrl+C 退回到普通模式
    inoremap <C-c> <ESC>
    au TextChangedI * call ncm2#auto_trigger()

    " inoremap <expr> <CR> (pumvisible() ? "\<c-y>\<CR>" : "\<CR>")

    " " Use <TAB> to select the popup menu:
    " inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
    " inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" }


" look {
    let g:ncm2_look_enabled = 0

    function! Ncm2_look_trigger()
        if !exists("g:ncm2_look_enabled")
            let g:ncm2_look_enabled = 0
        endif
        if g:ncm2_look_enabled==0
            let g:ncm2_look_enabled = 1
        else
            let g:ncm2_look_enabled = 0
        endif
    endfunction

    nnoremap <leader>lo :call Ncm2_look_trigger()<CR>
" }

"{
    function! Close_signcolumn()
        if &signcolumn == "no"
            set signcolumn=yes
        else
            set signcolumn=no
        endif
    endfunction
    nnoremap <silent> <leader>sc :call Close_signcolumn()<CR>
"}

" ncm2-ultisnips {
    " inoremap <silent> <expr> <C-k> ncm2_ultisnips#expand_or("\<CR>", 'n')
    inoremap <silent> <expr> <CR> ncm2_ultisnips#expand_or("\<CR>", 'n')

    " imap <C-k> <Plug>(ultisnips_expand)
    " let g:UltiSnipsExpandTrigger            = "<Plug>(ultisnips_expand)"
    let g:UltiSnipsJumpForwardTrigger       = "<C-j>"
    let g:UltiSnipsJumpBackwardTrigger      = "<C-k>"
    " let g:UltiSnipsRemoveSelectModeMappings = 0
    " let g:snips_no_mappings = 1
    " let g:UltiSnipsSnippetDirectories = ['~/.config/nvim/UltiSnips', 'UltiSnips']
" }

" vim-lsp {

    let g:lsp_signs_enabled = 1
    let g:lsp_diagnostics_enabled = 1
    let g:lsp_diagnostics_echo_cursor = 1
    let g:lsp_signs_error = {'text': 'x', 'icon': '~/.config/nvim/icon/error.svg'}
    let g:lsp_signs_warning = {'text': '!', 'icon': '~/.config/nvim/icon/warning.svg'}
    let g:lsp_signs_information = {'text': '@', 'icon': '~/.config/nvim/icon/info.svg'}
    let g:lsp_signs_hint = {'text': '$'}

    function! s:configure_lsp() abort
        setlocal omnifunc=lsp#complete
        nnoremap <buffer> gd :<C-u>LspDefinition<CR>
        nnoremap <buffer> gh :<C-u>LspHover<CR>
        nnoremap <buffer> gt :<C-u>LspTypeDefinition<CR>
        nnoremap <buffer> gr :<C-u>LspReferences<CR>
        nnoremap <buffer> grn :<C-u>LspRename<CR>

        nnoremap <buffer> gs :<C-u>LspDocumentSymbol<CR>
        nnoremap <buffer> gws :<C-u>LspWorkspaceSymbol<CR>

        nnoremap <buffer> gf :<C-u>LspDocumentFormat<CR>
        vnoremap <buffer> grf :LspDocumentRangeFormat<CR>
        nnoremap <buffer> gi :<C-u>LspImplementation<CR>
    endfunction

    " if executable('gopls')
        " au User lsp_setup call lsp#register_server({
            " \ 'name': 'gopls',
            " \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
            " \ 'whitelist': ['go'],
            " \ })
        " " autocmd FileType go setlocal omnifunc=lsp#complete
        " autocmd FileType go call s:configure_lsp()
    " endif

    if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
      autocmd FileType go call s:configure_lsp()
    endif

    augroup LspGo
      au!
      autocmd User lsp_setup call lsp#register_server({
          \ 'name': 'go-lang',
          \ 'cmd': {server_info->['gopls']},
          \ 'whitelist': ['go'],
          \ })
      " autocmd FileType go setlocal omnifunc=lsp#complete
      autocmd FileType go call s:configure_lsp()
    augroup END

    if executable('pyls')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'pyls',
            \ 'cmd': {server_info->['pyls']},
            \ 'whitelist': ['python'],
            \ })
        autocmd FileType python call s:configure_lsp()
    endif

    if executable('typescript-language-server')
        au User lsp_setup call lsp#register_server({
            \ 'name': 'typescript-language-server',
            \ 'cmd': {server_info->[&shell, &shellcmdflag, 'typescript-language-server --stdio']},
            \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'tsconfig.json'))},
            \ 'whitelist': ['typescript', 'typescript.tsx'],
            \ })
        autocmd FileType typescript call s:configure_lsp()
    endif

    if executable('ccls')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'ccls',
      \ 'cmd': {server_info->['ccls']},
      \ 'root_uri': {server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'compile_commands.json'))},
      \ 'initialization_options': {},
      \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
      \ })
    endif

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
