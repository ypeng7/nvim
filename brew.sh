#! /bin/sh
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

brew tap twlz0ne/homebrew-ccls
brew install ccls

# coc dependency
brew install node
brew install yarn --ignore-dependencies
