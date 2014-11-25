#!/bin/sh

DROPBOX_DIR="$HOME"
DOTFILES="$DROPBOX_DIR/dotfiles"

if [ ! -d "$DOTFILES" ]
then
    echo "Please mv dotfiles to $DROPBOX_DIR"
    exit
fi

cd $DOTFILES

#
ln -s $DOTFILES/zshrc $HOME/.zshrc
#ln -s $DOTFILES/zsh_history $HOME/.zsh_history
#
ln -s $DOTFILES/bashrc $HOME/.bashrc
ln -s $DOTFILES/bash_profile $HOME/.bash_profile
ln -s $DOTFILES/bash_logout $HOME/.bash_logout
#
ln -s $DOTFILES/gitconfig $HOME/.gitconfig
#
ln -s $DOTFILES/inputrc $HOME/.inputrc
ln -s $DOTFILES/vimrc $HOME/.vimrc
#

mkdir $HOME/.vim
mkdir $HOME/.vim/bundle
mkdir $HOME/.vim/backup-files
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

#vi -c ':NeoBundleInstall!'


