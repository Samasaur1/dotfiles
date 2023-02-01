#!/bin/sh

cd ~

# nvim
mkdir -p .config/nvim
ln -s ~/dotfiles/nvim/init.lua .config/nvim/init.lua
ln -s ~/dotfiles/nvim/snippets .config/nvim/snippets
ln -s ~/dotfiles/nvim/ftplugin .config/nvim/ftplugin
ln -s ~/dotfiles/nvim/spell .config/nvim/spell
ln -s ~/dotfiles/nvim/lua .config/nvim/lua
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
