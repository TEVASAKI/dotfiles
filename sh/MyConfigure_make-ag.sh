#!/bin/sh

# run with CHECK.sh
source /home/teva/Dropbox/dotfiles/sh/CHECK.sh

CHECK git pull
CHECK ./configure
CHECK make clean
CHECK make -j 4
#su -
CHECK sudo -u teva paco -D make install


