#!/bin/bash

DOT_FILES=(bash_logout bash_profile bashrc gitconfig gvimrc inputrc tmux.conf vimrc zshrc)

dor file in ${DOT_FILES[@]}
do
  ln -s $HOME/dotfiles/$file $HOME/$file
done

