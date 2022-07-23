#!/bin/sh

cd ~

# Vim
mkdir -p .config/nvim
ln -s ~/dotfiles/nvim/init.lua .config/nvim/init.lua
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
