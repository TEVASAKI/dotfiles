#!/bin/sh
" git clone https://github.com/vim/vim.git

git pull

make clean

./configure --enable-multibyte --disable-selinux --enable-fontset --enable-python3interp=yes --enable-fail-if-missing --enable-gnome-check --enable-gui=auto --enable-rubyinterp=auto

make -j 4

sudo make install

