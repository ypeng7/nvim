" Install vim-plug if not installed
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall
endif

call plug#begin()

Plug 'elzr/vim-json'
Plug 'mrk21/yaml-vim'

Plug 'scrooloose/nerdcommenter'
Plug 'cinuor/vim-header'

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

Plug 'honza/vim-snippets'
Plug 'SirVer/ultisnips'
Plug 'Shougo/neosnippet.vim'
Plug 'Shougo/neosnippet-snippets'

Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }

Plug 'Shougo/echodoc.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

Plug 'Yggdroot/LeaderF', { 'do': './install.sh' }
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

Plug 'w0rp/ale'

Plug 'heavenshell/vim-pydocstring'

call plug#end()
