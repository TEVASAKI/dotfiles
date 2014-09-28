#!/bin/sh
# git clone git@github.com:GNOME/glib.git

## glib

# run with CHECK.sh
source ./CHECK.sh

CHECK git pull
CHECK ./configure --prefix=/usr/local 
CHECK make clean 
CHECK make -j 4 
#su -
CHECK sudo paco -D make install

