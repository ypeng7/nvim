if &compatible
  set nocompatible
endif

if has('mac')
    let g:python3_host_prog='/usr/local/bin/python3'
else
    let g:python3_host_prog='/usr/bin/python3'
endif

" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'Shougo/denite.nvim'

Plug 'scrooloose/nerdcommenter'
Plug 'cinuor/vim-header'

Plug 'sbdchd/neoformat'
" Using a non-master branch
" Language pack：一个包含了很多语言配置的包，有种 one thing to rule them all 的意思
Plug 'sheerun/vim-polyglot'
" Markdown 实时预览插件，很好用
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
Plug 'iamcco/mathjax-support-for-mkdp'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'neoclide/coc.nvim', {'tag': '*', 'do': 'yarn install'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'Shougo/echodoc.vim'

Plug 'tpope/vim-fugitive'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi'

Plug 'morhetz/gruvbox'
Plug 'nightsense/cosmic_latte'

Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'

Plug 'w0rp/ale'

call plug#end()

let $NVIM_COC_LOG_LEVEL = 'debug'
let g:coc_force_debug = 1

" Snippets
" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'
let g:coc_status_error_sign = '•'
let g:coc_status_warning_sign = '•'

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" use <c-space>for trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" To make <cr> select the first completion item and confirm completion when no item have selected:
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

" Close preview window when completion is done.
autocmd! CompleteDone * if pumvisible() == 0 | pclose | endif


nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <silent> grn <Plug>(coc-rename)

" Use K for show documentation in preview window
nnoremap <silent> gm :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocActionAsync('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for format selected region
vmap gf  <Plug>(coc-format-selected)
nmap gf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocActionAsync('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
vmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` for format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` for fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

if has('mac')
    let g:coc_global_extensions =['coc-snippets', 'coc-prettier', 'coc-pairs', 'coc-json', 'coc-python', 'coc-imselect', 'coc-yank', 'coc-dictionary', 'coc-tsserver', 'coc-emmet', 'coc-git', 'coc-rls', 'coc-vimlsp', 'coc-ultisnips', 'coc-neosnippet']
else
    let g:coc_global_extensions =['coc-snippets', 'coc-prettier', 'coc-pairs', 'coc-json', 'coc-python', 'coc-yank', 'coc-dictionary', 'coc-tsserver', 'coc-emmet', 'coc-git', 'coc-rls', 'coc-vimlsp', 'coc-ultisnips', 'coc-neosnippet']
endif

autocmd FileType json syntax match Comment +\/\/.\+$+

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() :
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" ------------------- Self Configuration -----------------------
for rcfile in split(globpath("~/.config/nvim/rc", "*.vim"), '\n')
    execute('source '.rcfile)
endfor


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


" VM
let g:VM_maps = {}
let g:VM_maps["Find Under"] = '<C-d>'
let g:VM_maps["Find Subword Under"] = '<C-d>'
let g:VM_maps["Select l"] = '<S-Right>'
let g:VM_maps["Select h"] = '<S-Left>'
let g:VM_clear_buffer_hl = 0

" Markdown
let g:mkdp_auto_start = 0
let g:mkdp_auto_close = 1
let g:mkdp_browser = ''
nmap <F5> <Plug>MarkdownPreview
nmap <F6> <Plug>MarkdownPreviewStop
nmap <C-p> <Plug>MarkdownPreviewToggle

" echodoc
set noshowmode
let g:echodoc#enable_at_startup = 1
let g:echodoc#type = 'signature'

" Neoformat
" To Run Manually
nnoremap <leader>fm :Neoformat<CR>
