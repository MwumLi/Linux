#!/bin/bash 

# 安装git
sudo apt-get install git
# 下载Vundle到~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/bundle/ &&
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# vim配色插件
mkdir -p ~/.vim/colors &&
cp vim/colors/molokai.vim ~/.vim/colors/

cp vim/.vimrc ~/.vimrc		#移动.vimrc到你的home目录
# 安装vim
sudo apt-get install vim vim-gtk




