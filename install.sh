#!/bin/bash

WORKING_DIR=$(pwd)

cd ~
mv $WORKING_DIR ./.config/nvim

cd ./.config/nvim

curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/.config/nvim ~/.vim
ln -s ~/.config/nvim/coc ~/.config/coc
ln -s ~/.config/nvim/init.vim ~/.vimrc

cd ~/.config/coc/extensions
yarn

cd ~/.vim

