if &compatible
  set nocompatible
endif

if has('mac')
    let g:python3_host_prog='/usr/local/bin/python3'
else
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
let g:mkdp_refresh_slow = 0
let g:mkdp_browser = ''
" preview page title
" ${name} will be replace with the file name
let g:mkdp_page_title = '「${name}」'
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

nmap <silent> <leader>pd <Plug>(pydocstring)
