#!/bin/sh
# git clone git@github.com:GNOME/glib.git
git pull
./configure --prefix=/usr/local 
make clean 
make -j 4 
su -

