#!/bin/sh

DOTFILES="$HOME/Dropbox/dotfiles"

mv $HOME/.zshrc $DOTFILES/zshrc
mv $HOME/.zsh_history $DOTFILES/zsh_history
#
mv $HOME/.bashrc $DOTFILES/bashrc
mv $HOME/.bash_profile $DOTFILES/bash_profile
mv $HOME/.bash_logout $DOTFILES/bash_logout
mv $HOME/.bash_history $DOTFILES/bash_history
#
mv $HOME/.gitconfig $DOTFILES/gitconfig
#
mv $HOME/.inputrc $DOTFILES/inputrc
mv $HOME/.vimrc $DOTFILES/vimrc


ln -s $DOTFILES/zshrc $HOME/.zshrc
ln -s $DOTFILES/zsh_history $HOME/.zsh_history
#
ln -s $DOTFILES/bashrc $HOME/.bashrc
ln -s $DOTFILES/bash_profile $HOME/.bash_profile
ln -s $DOTFILES/bash_logout $HOME/.bash_logout
ln -s $DOTFILES/bash_history $HOME/.bash_history
#
ln -s $DOTFILES/gitconfig $HOME/.gitconfig
#
ln -s $DOTFILES/inputrc $HOME/.inputrc
ln -s $DOTFILES/vimrc $HOME/.vimrc
