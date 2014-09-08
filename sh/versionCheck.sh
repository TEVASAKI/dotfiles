#!/bin/sh

# 各コマンドのバージョンチェックを行う。
# 適宜更新


echo "------------------------------"
echo "---------- Versions ----------"
echo "------------------------------"
echo "";
echo "";


# OS
echo "---------- OS ----------"
cat /etc/redhat-release
uname -a
echo "";
echo "";

# git
echo "---------- git ----------"
git --version
echo "";
echo "";

# vim
echo "---------- Vim ----------"
vim --version
echo "";
echo "";

# Curl
echo "---------- Curl ----------"
curl --version
echo "";
echo "";
