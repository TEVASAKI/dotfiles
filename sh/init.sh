#!/bin/sh

#----------------------------------------------------------------------
# CentOS を新規インストールした後に叩くといい。
#----------------------------------------------------------------------
#----------------------------------------------------------------------
# 初期設定
#----------------------------------------------------------------------
# root password Edit
passwd

# User add
useradd teva

# User password Delete
passwd -d teva

# Wheel グループに所属させる
usermod -G wheel teva

# Don't foget this todo!!
# teva にログインして、パスワードを設定
#su teva
#passwd

#----------------------------------------------------------------------
# RPM forge add
#----------------------------------------------------------------------
mkdir src
cd src
wget http://pkgs.repoforge.org/rpmforge-release/rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm
rpm -Uvh rpmforge-release-0.5.3-1.el6.rf.x86_64.rpm

# 他リポジトリとのパッケージ競合を避けるため、enabled=0として普段は読まないようにしておく
sed -i -e s/enabled = 1/enabled = 0/g /etc/yum.repos.d/rpmforge.repo

#----------------------------------------------------------------------
# EPEL add
#----------------------------------------------------------------------
wget http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm
rpm -Uvh epel-release-6-8.noarch.rpm

# 他リポジトリとのパッケージ競合を避けるため、enabled=0として普段は読まないようにしておく
sed -i -e s/enabled=1/enabled=0/g /etc/yum.repos.d/epel.repo

## system UPDATE
yum update


#----------------------------------------------------------------------
# Package install
#----------------------------------------------------------------------
# 開発ツール
yum group install 'Development tools'

# 必須的な
yum install wget manpages-ja.noarch man.x86_64 zsh.x86_64

# vim用
yum install mercurial ncurses-devel

# lv のインストール
wget http://vault.centos.org/5.7/os/SRPMS/lv-4.51-8.1.src.rpm
rpm -ivh lv-4.51-8.1.src.rpm
rpmbuild -bb /root/rpmbuild/SPECS/lv.spec
rpm -ivh /root/rpmbuild/RPMS/x86_64/lv-4.51-8.1.x86_64.rpm

# Git用
yum install perl-ExtUtils-MakeMaker.x86_64 libcurl-devel.x86_64

