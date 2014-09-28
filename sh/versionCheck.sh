#!/bin/sh

# 各コマンドのバージョンチェックを行う。
# 適宜更新

cat /dev/null > VERSION_OUTPUT.txt


echo "------------------------------"
echo "---------- Versions ----------"
echo "------------------------------"
echo "";
echo "";

# OS
echo "---------- OS ----------" >> VERSION_OUTPUT.txt
cat /etc/redhat-release >> VERSION_OUTPUT.txt
uname -a >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# CPU
echo "---------- CPU ----------" >> VERSION_OUTPUT.txt
lscpu >> VERSION_OUTPUT.txt
echo "";
echo "";

# git
echo "---------- git ----------" >> VERSION_OUTPUT.txt
git --version >> VERSION_OUTPUT.txt
echo "";
echo "";

# vim
echo "---------- Vim ----------" >> VERSION_OUTPUT.txt
vim --version >> VERSION_OUTPUT.txt
echo "";
echo "";

# Curl
echo "---------- Curl ----------" >> VERSION_OUTPUT.txt
curl --version >> VERSION_OUTPUT.txt
echo "";
echo "";

# tmux
echo "---------- tmux ----------" >> VERSION_OUTPUT.txt
tmux -V >> VERSION_OUTPUT.txt
echo "";
echo "";

lv VERSION_OUTPUT.txt

