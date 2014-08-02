#!/bin/sh

SRCDIR="$HOME/src"
SHFILES="$HOME/Dropbox/dotfiles/sh"
#
mv $SRCDIR/bdwgc/MyConfigure_make-bdwgc.sh         $SHFILES
mv $SRCDIR/curl/MyConfigure_make-curl.sh         $SHFILES
mv $SRCDIR/git/MyConfigure_make-git.sh         $SHFILES
mv $SRCDIR/glib/MyConfigure_make-glib.sh         $SHFILES
mv $SRCDIR/libevent/MyConfigure_make-libevent.sh         $SHFILES
mv $SRCDIR/openssl/MyConfigure_make-openssl.sh         $SHFILES
mv $SRCDIR/tmux/MyConfigure_make-tmux.sh         $SHFILES
mv $SRCDIR/vim/MyConfigure_make-vim.sh         $SHFILES

#

ln -s $SHFILES/MyConfigure_make-bdwgc.sh  $SRCDIR/bdwgc/MyConfigure_make-bdwgc.sh
ln -s $SHFILES/MyConfigure_make-curl.sh  $SRCDIR/curl/MyConfigure_make-curl.sh
ln -s $SHFILES/MyConfigure_make-git.sh  $SRCDIR/git/MyConfigure_make-git.sh
ln -s $SHFILES/MyConfigure_make-glib.sh  $SRCDIR/glib/MyConfigure_make-glib.sh
ln -s $SHFILES/MyConfigure_make-libevent.sh  $SRCDIR/libevent/MyConfigure_make-libevent.sh
ln -s $SHFILES/MyConfigure_make-openssl.sh  $SRCDIR/openssl/MyConfigure_make-openssl.sh
ln -s $SHFILES/MyConfigure_make-tmux.sh  $SRCDIR/tmux/MyConfigure_make-tmux.sh
ln -s $SHFILES/MyConfigure_make-vim.sh  $SRCDIR/vim/MyConfigure_make-vim.sh
