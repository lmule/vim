#!/bin/bash

CURRENT_TIME=`date '+%Y-%m-%d-%H-%M-%S'`
# backup files: .vimrc && .vim
if [ -e ~/.vimrc ]; then
#    echo "backup your .vimrc"
#    echo -e "this is backup by dingrui on $CURRENT_TIME\n`cat ~/.vimrc`" >~/.vimrc
#    mv ~/.vimrc{,.$CURRENT_TIME}
    rm ~/.vimrc
fi
if [ -d ~/.vim ]; then
    echo "backup your .vim"
    echo "this is backup by dingrui on $CURRENT_TIME">>~/.vim/README
    mv ~/.vim{,.$CURRENT_TIME}
fi

# git clone vundle
command -v git >/dev/null 2>&1 || { echo >&2 "Required git but it's not installed.  Aborting."; exit 1; }  

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
git clone git@github.com:lmule/vim.git ~/.vim/vimrc

# establing soft link of .vimrc
ln -s ~/.vim/vimrc/.vimrc ~/.vimrc
# installing vim plugins
vim +BundleInstall +qa
