#!/bin/sh

cd ~

# Vim
mkdir -p .config/nvim
ln -s ~/dotfiles/nvim/init.lua .config/nvim/init.lua
ln -s ~/dotfiles/nvim/snippets .config/nvim/snippets
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
