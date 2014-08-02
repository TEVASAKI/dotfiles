#!/bin/sh
# Need for libevent!!!
# git clone git://git.code.sf.net/p/tmux/tmux-code tmux
# git clone git@github.com:libevent/libevent.git libevent
# git clone git://tmux.git.sourceforge.net/gitroot/tmux/tmux tmux
git pull
./configure --prefix=/usr/local --no-create --no-recursion 
make clean 
make -j 4
su -

