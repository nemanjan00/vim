#!/bin/bash

WORKING_DIR=$(pwd)

cd ~
mv $WORKING_DIR ./.vim

cd ./.vim

ln -fs ~/.vim/vimrc ../.vimrc

curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

nvim +PlugInstall +qall

