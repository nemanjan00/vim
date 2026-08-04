#!/bin/bash

WORKING_DIR=$(pwd)

cd ~
mv $WORKING_DIR ./.config/nvim

cd ./.config/nvim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Plugins and undo history live under ~/.vim
ln -s ~/.config/nvim ~/.vim

echo "Done. Open nvim and run :PlugInstall — treesitter parsers and language servers install themselves on first start."
