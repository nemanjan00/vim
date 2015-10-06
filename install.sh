cd ../
mv ./vim ./.vim
cd ./.vim

ln -fs ~/.vim/vimrc ../.vimrc

git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

vim +PluginInstall +qall
