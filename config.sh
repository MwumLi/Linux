#!/bin/bash 

# 安装git
sudo apt-get install git
# 下载Vundle到~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/bundle/ &&
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mv vim/.vimrc ~/.vimrc		"移动.vimrc到你的home目录





