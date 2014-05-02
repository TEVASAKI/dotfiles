#!/bin/sh

##  dotfiles をclone した後にやることは以下の通り
##  1. submodule を読み込む
##  2. 各設定ファイルにシンボリックリンクを貼る
##  3. vundle で各プラグインを取得
##  http://yono05.wordpress.com/2011/12/11/zshscreenvim-%E3%81%AE%E8%A8%AD%E5%AE%9A%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%82%92-dropbox-github-%E3%81%A7%E7%AE%A1%E7%90%86%E3%81%99%E3%82%8B/

DROPBOX_DIR="$HOME/Dropbox"
DOTFILES="$DROPBOX_DIR/dotfiles"

if [ ! -d "$DOTFILES" ]
then
    echo "Please mv dotfiles to $DROPBOX_DIR"
    exit
fi

cd $DOTFILES

# git submodule update --init

ln -s $DOTFILES/.zshrc $HOME/.zshrc
ln -s $DOTFILES/.bash_history $HOME/.bash_history
ln -s $DOTFILES/.bash_logout $HOME/.bash_logout
ln -s $DOTFILES/.bash_profile $HOME/.bash_profile
ln -s $DOTFILES/.bashrc $HOME/.bashrc
ln -s $DOTFILES/.gitconfig $HOME/.gitconfig
ln -s $DOTFILES/inputrc $HOME/inputrc
ln -s $DOTFILES/.vimrc $HOME/.vimrc
ln -s $DOTFILES/.zsh_history $HOME/.zsh_history

# vim -c ':BundleInstall!'


