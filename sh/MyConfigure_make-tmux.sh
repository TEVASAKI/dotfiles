#!/bin/sh

## tmux
# Need for libevent!!!
# git clone git://git.code.sf.net/p/tmux/tmux-code tmux
# git clone git@github.com:libevent/libevent.git libevent
# git clone git://tmux.git.sourceforge.net/gitroot/tmux/tmux tmux

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./configure --prefix=/usr/local --no-create --no-recursion 
CHECK make clean 
CHECK make -j 4
#su -
CHECK sudo paco -lD make install

