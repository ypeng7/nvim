" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'elzr/vim-json'
Plug 'mrk21/yaml-vim'

Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'cinuor/vim-header'

Plug 'vim-scripts/IndexedSearch'
Plug 'haya14busa/incsearch.vim'

Plug 'sbdchd/neoformat'
" Using a non-master branch
" Language pack：一个包含了很多语言配置的包，有种 one thing to rule them all 的意思
Plug 'sheerun/vim-polyglot'
" Markdown 实时预览插件，很好用
" Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
if executable('node') && executable('yarn')
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'  }
else
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }
endif

" fzf
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'fszymanski/fzf-quickfix'

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'Shougo/neco-vim' | Plug 'neoclide/coc-neco'
Plug 'Shougo/neoinclude.vim' | Plug 'jsfaint/coc-neoinclude'
Plug 'tjdevries/coc-zsh'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'Shougo/echodoc.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/vim-easy-align'
Plug 'mg979/vim-visual-multi'

Plug 'morhetz/gruvbox'
Plug 'nightsense/cosmic_latte'
Plug 'junegunn/seoul256.vim'

Plug 'itchyny/lightline.vim'
Plug 'mgee/lightline-bufferline'
Plug 'ryanoasis/vim-devicons'
  Plug 'maximbaz/lightline-ale'

Plug 'w0rp/ale'

Plug 'heavenshell/vim-pydocstring'

call plug#end()
