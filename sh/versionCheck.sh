#!/bin/sh

# 各コマンドのバージョンチェックを行う。
# 適宜更新

cat /dev/null > VERSION_OUTPUT.txt


echo "------------------------------" >> VERSION_OUTPUT.txt
echo "---------- Versions ----------" >> VERSION_OUTPUT.txt
echo "------------------------------" >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# OS
echo "---------- OS ----------" >> VERSION_OUTPUT.txt
cat /etc/redhat-release >> VERSION_OUTPUT.txt
uname -a >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# CPU
echo "---------- CPU ----------" >> VERSION_OUTPUT.txt
lscpu >> VERSION_OUTPUT.txt
echo "" >> VERSION_OUTPUT.txt
echo "" >> VERSION_OUTPUT.txt

# git
echo "---------- git ----------" >> VERSION_OUTPUT.txt
git --version >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# vim
echo "---------- Vim ----------" >> VERSION_OUTPUT.txt
vim --version >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# Curl
echo "---------- Curl ----------" >> VERSION_OUTPUT.txt
curl --version >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# tmux
echo "---------- tmux ----------" >> VERSION_OUTPUT.txt
tmux -V >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

# zsh
echo "---------- zsh ----------" >> VERSION_OUTPUT.txt
echo $ZSH_VERSION >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt
echo ""; >> VERSION_OUTPUT.txt

lv VERSION_OUTPUT.txt

