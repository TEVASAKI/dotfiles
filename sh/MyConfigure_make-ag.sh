#!/bin/sh
git pull
./configure
make clean
make -j 4
su -
A

