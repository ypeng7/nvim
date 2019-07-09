" File              : init.vim
" Author            : Yue Peng <yuepaang@gmail.com>
" Date              : 2019-07-09 13:00:44
" Last Modified Date: 2019-07-09 13:15:38
" Last Modified By  : Yue Peng <yuepaang@gmail.com>

if &compatible
  set nocompatible
endif

" Neovim python host path
if has('mac')
    let g:python3_host_prog='/usr/local/bin/python3'
else
    " Linux Platform
    let g:python3_host_prog='/usr/bin/python3'
endif

" ------------------- Self Configuration -----------------------
for rcfile in split(globpath("~/.config/nvim/rc", "*.vim"), '\n')
    execute('source '.rcfile)
endfor

" nerdcommenter {
    let g:NERDSpaceDelims = 1
    " }

" vim-header {
    let g:header_auto_add_header = 0
    let g:header_field_timestamp_format = '%Y-%m-%d %H:%M:%S'
    let g:header_field_author = 'Yue Peng'
    let g:header_field_author_email = 'yuepaang@gmail.com'
    map <leader>ah :AddHeader<CR>
" }

" VM {
    let g:VM_maps = {}
    let g:VM_maps["Find Under"] = '<C-n>'
    let g:VM_maps["Find Subword Under"] = '<C-n>'
    let g:VM_maps["Select l"] = '<S-Right>'
    let g:VM_maps["Select h"] = '<S-Left>'
    let g:VM_clear_buffer_hl = 0
" }

" Markdown {
    let g:mkdp_auto_start = 0
    let g:mkdp_auto_close = 1
    let g:mkdp_refresh_slow = 0
    let g:mkdp_browser = ''
    " preview page title
    " ${name} will be replace with the file name
    let g:mkdp_page_title = '「${name}」'
    nmap <F5> <Plug>MarkdownPreview
    nmap <F6> <Plug>MarkdownPreviewStop
    " nmap <C-p> <Plug>MarkdownPreviewToggle
" }

" echodoc {
    set noshowmode
    let g:echodoc#enable_at_startup = 1
    let g:echodoc#type = 'signature'
" }

" Neoformat {
    " To Run Manually
    nnoremap <leader>fm :Neoformat<CR>
" }

" pydocstring {
    nmap <silent> <leader>pd <Plug>(pydocstring)
" }

" vim-go {
    " Build Test Run GoDocs Debug Format
    let g:go_def_mode="gopls"
    let g:go_info_mode="gopls"

    " disable vim-go :GoDef short cut (gd)
    " this is handled by LanguageClient [LC]
    let g:go_def_mapping_enabled = 0
" }

" vim-devicons {
	let g:WebDevIconsUnicodeGlyphDoubleWidth = 1
	let g:WebDevIconsUnicodeDecorateFolderNodes = 1
	let g:DevIconsEnableFoldersOpenClose = 1
	let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols = {}
	let g:WebDevIconsUnicodeDecorateFileNodesExtensionSymbols[''] = "\uf15b"
	let g:WebDevIconsNerdTreeBeforeGlyphPadding = ''
	let g:WebDevIconsUnicodeDecorateFolderNodes = v:true
" }

" fugitive {
	nmap df :Gdiff<CR>
" }
